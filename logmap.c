#include <stdint.h>
#include <string.h>
#include <stdio.h>

double unsigned_to_fraction(uint8_t num) {
    return (double)num / 256.0;  // range: 0 to 255/256
}
uint8_t mul_keep_8_msn_round(uint8_t a, uint8_t b)
{
    uint16_t p = (uint16_t)a * (uint16_t)b;
    return (uint8_t)((p + 0x80u) >> 8);  // add 1/2 LSB before shifting
}
static inline uint8_t mul_with_not_keep_8_msn(uint8_t x)
{
    uint16_t p = (uint16_t)x * (uint16_t)(uint8_t)(~x);
    return (uint8_t)(p >> 6);
}

static inline uint8_t u8_bitwise_not(uint8_t x){ return (uint8_t)(~x);}

// Example usage
int main(void) {
    uint8_t examples[] = {0u, 2u, 0x80u, 0x40u, 0xFFu};
    size_t n = sizeof(examples) / sizeof(examples[0]);

    printf("Testing unsigned_to_fraction() with example inputs:\n");
    uint8_t val = 187u;
    printf("Initial value: %f\n", unsigned_to_fraction(val));
    for (size_t i = 0; i < n; ++i) {
        double logistic = 4.0 * unsigned_to_fraction(val) * (1.0 - unsigned_to_fraction(val));
        val = mul_with_not_keep_8_msn(val);

        printf("unsigned_to_fraction(%3u) = %.6f, logistic map = %.6f\n", val, unsigned_to_fraction(val), logistic);
    }

    return 0;
}

