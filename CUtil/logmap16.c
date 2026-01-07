
#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

static inline uint16_t u16_bitwise_not(uint16_t x) { return (uint16_t)(~x); }

/* Map 16-bit unsigned to [0, 65535/65536] */
double unsigned_to_fraction_u16(uint16_t num) {
    return (double)num / 65536.0;  // 2^16
}

/* Multiply two u16, keep the 16 MSBs of the 32-bit product, with rounding */
uint16_t mul_keep_16_msn_round(uint16_t a, uint16_t b)
{
    uint32_t p = (uint32_t)a * (uint32_t)b;         // 32-bit product
    return (uint16_t)((p + 0x8000u) >> 16);         // add 1/2 LSB of kept part, then take top 16
}

/*
  x * ~x produces a 32-bit value.
  This matches your 8-bit version pattern:
    shift = N - 2  (for N=8 -> 6; for N=16 -> 14)
  Then take the lower N bits -> effectively keeps bits [2N-3 : N-2] of the 2N-bit product.
*/
static inline uint16_t mul_with_not_keep_16_msn(uint16_t x)
{
    uint32_t p = (uint32_t)x * (uint32_t)u16_bitwise_not(x);
    return (uint16_t)(p >> 14);  // keep bits [29:14] (discard 2 MSBs, keep next 16)
}

int main(void)
{
    uint16_t vals[] = { 0x005C, 0x00AA, 0x00F0, 0x0040, 0xFFFF };
    size_t n = sizeof(vals) / sizeof(vals[0]);

    for (size_t i = 0; i < n; ++i) {
        uint16_t v = vals[i];
        printf("(0x%04" PRIX16 ") = %" PRIu16 "\n", v, v);

        v = mul_with_not_keep_16_msn(v);
        printf("(0x%04" PRIX16 ") = %" PRIu16 "\n\n", v, v);
    }

    return 0;
}
