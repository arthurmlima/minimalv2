/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * logmap_control_poll.c (Standalone)
 *
 * AXI register map (32-bit):
 *   0x00  rst       (bit0)
 *   0x04  en        (bit0)
 *   0x08  load_seed (bit0)
 *   0x0C  seed      (bits[7:0])
 *   0x10  x_out     (bits[7:0])  read-only
 *
 * Requirement: no sw_delay(). Uses POLLING instead:
 *  - Reset: poll x_out becomes 0 while rst=1, then release rst.
 *  - Load seed: poll x_out becomes seed while load_seed=1, then deassert load_seed.
 *  - Sampling: poll until x_out changes (new state), then print.
 *
 * Fractional display for x_out:
 *   exact value is x_out / 256. We print a decimal approximation "0.xxxxxx"
 *   without using %f (xil_printf float often disabled).
 */

#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xparameters.h"

/* =======================
   Base address selection
   ======================= */
#ifndef LOGMAP_BASEADDR
  #ifdef XPAR_LOGMAPAXI_0_S00_AXI_BASEADDR
    #define LOGMAP_BASEADDR  XPAR_LOGMAPAXI_0_BASEADDR
  #else
    #define LOGMAP_BASEADDR  XPAR_LOGMAPAXI_0_BASEADDR  /* <-- CHANGE ME if needed */
  #endif
#endif

/* Register offsets */
#define LOGMAP_RST_OFF   0x00U
#define LOGMAP_EN_OFF    0x04U
#define LOGMAP_LOAD_OFF  0x08U
#define LOGMAP_SEED_OFF  0x0CU
#define LOGMAP_XOUT_OFF  0x10U

#define BIT0             (1U << 0)

/* Polling limits (number of MMIO reads) */
#define POLL_MAX_RESET   (2000000U)
#define POLL_MAX_LOAD    (2000000U)
#define POLL_MAX_CHANGE  (2000000U)

/* Low-level MMIO */
static inline void logmap_wr(uint32_t off, uint32_t val) {
    Xil_Out32(LOGMAP_BASEADDR + off, val);
}
static inline uint32_t logmap_rd(uint32_t off) {
    return Xil_In32(LOGMAP_BASEADDR + off);
}

/* Core control */
static inline void logmap_set_rst(uint32_t v)       { logmap_wr(LOGMAP_RST_OFF,  (v ? BIT0 : 0U)); }
static inline void logmap_set_en(uint32_t v)        { logmap_wr(LOGMAP_EN_OFF,   (v ? BIT0 : 0U)); }
static inline void logmap_set_load_seed(uint32_t v) { logmap_wr(LOGMAP_LOAD_OFF, (v ? BIT0 : 0U)); }
static inline void logmap_set_seed_u8(uint8_t s)    { logmap_wr(LOGMAP_SEED_OFF, (uint32_t)s); }
static inline uint8_t logmap_get_x_u8(void)         { return (uint8_t)(logmap_rd(LOGMAP_XOUT_OFF) & 0xFFU); }

/* Print a u32 with zero-padding to 'width' digits (xil_printf-safe) */
static void xil_print_u32_zeropad(uint32_t v, uint32_t width) {
    char buf[16];
    uint32_t i = 0;

    /* generate digits reversed */
    do {
        buf[i++] = (char)('0' + (v % 10U));
        v /= 10U;
    } while (v != 0U && i < sizeof(buf));

    while (i < width && i < sizeof(buf)) {
        buf[i++] = '0';
    }

    /* print reversed back */
    while (i > 0U) {
        xil_printf("%c", buf[--i]);
    }
}

/* Fractional print of x_out as 0.xxxxxx (6 decimals), based on x/256 */
static void print_x_fraction_u8(uint8_t x) {
    /* scaled = round((x/256)*1e6) = round(x*1e6/256) */
    uint32_t scaled = ((uint32_t)x * 1000000U + 128U) / 256U; /* +128 for rounding */
    xil_printf("0.");
    xil_print_u32_zeropad(scaled, 6);
}

/* Poll until x_out equals expected. Returns 1 if success, 0 if timeout. */
static int poll_x_equals(uint8_t expected, uint32_t max_reads) {
    while (max_reads--) {
        if (logmap_get_x_u8() == expected) {
            return 1;
        }
    }
    return 0;
}

/* Poll until x_out changes from 'prev'. Returns 1 if changed (new value in *out), 0 if timeout. */
static int poll_x_changes(uint8_t prev, uint8_t *out, uint32_t max_reads) {
    while (max_reads--) {
        uint8_t cur = logmap_get_x_u8();
        if (cur != prev) {
            *out = cur;
            return 1;
        }
    }
    *out = prev;
    return 0;
}

int main(void)
{
    init_platform();

    xil_printf("Logmap control demo (POLLING) - standalone\r\n");
    xil_printf("LOGMAP_BASEADDR = 0x%08lx\r\n", (unsigned long)LOGMAP_BASEADDR);

    /* Make sure en/load are low initially */
    logmap_set_en(0);
    logmap_set_load_seed(0);

    /* 1) Reset using polling: assert rst until x_out becomes 0 */
    xil_printf("\r\n[1] Reset (poll x_out -> 0)\r\n");
    logmap_set_rst(1);

    if (!poll_x_equals(0x00U, POLL_MAX_RESET)) {
        xil_printf("WARN: reset poll timed out (x_out not observed as 0)\r\n");
    } else {
        xil_printf("OK: x_out observed as 0 under rst\r\n");
    }

    logmap_set_rst(0);
    xil_printf("rst released\r\n");

    /* 2) Load seed using polling: write seed, assert load_seed until x_out == seed */
    xil_printf("\r\n[2] Load seed (poll x_out -> seed)\r\n");
    uint8_t seed = 128u;

    logmap_set_seed_u8(seed);
    logmap_set_load_seed(1);

    if (!poll_x_equals(seed, POLL_MAX_LOAD)) {
        xil_printf("WARN: load_seed poll timed out (x_out not observed as seed)\r\n");
    } else {
        xil_printf("OK: x_out observed as seed\r\n");
    }

    logmap_set_load_seed(0);
    xil_printf("load_seed deasserted\r\n");

    /* 3) Enable iterations */
    xil_printf("\r\n[3] Enable en=1\r\n");
    logmap_set_en(1);

    /* 4) Sample x_out by polling for CHANGES (new state) */
    xil_printf("\r\n[4] Poll for x_out changes and print fraction\r\n");
    uint8_t prev = logmap_get_x_u8();
    for (int i = 0; i < 32; ++i) {
        uint8_t cur;
        int ok = poll_x_changes(prev, &cur, POLL_MAX_CHANGE);

        if (!ok) {
            xil_printf("WARN: x_out did not change within poll limit at sample %d\r\n", i);
            cur = prev;
        }

        xil_printf("x_out[%02d] = 0x%02x (%3d)  frac ~= ", i, cur, cur);
        print_x_fraction_u8(cur);
        xil_printf("  (exact=%d/256)\r\n", cur);

        prev = cur;
    }

    /* 5) Stop */
    xil_printf("\r\n[5] Stop en=0\r\n");
    logmap_set_en(0);

    xil_printf("Done.\r\n");
    cleanup_platform();
    return 0;
}
