#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <math.h>
uint64_t val = 0x3C00FFF03C00FFF0ULL;  // your a_tb seed

static inline long double unsigned_to_fraction_u64(uint64_t num) {
    return ldexpl((long double)num, -64);
}

static inline uint64_t mul_with_not_keep_64_msn(uint64_t x) {
    __uint128_t p = (__uint128_t)x * (__uint128_t)(~x);
    return (uint64_t)(p >> 62); // discard 2 MSBs, take next 64
}

int main(void) {
    uint64_t val = 0x3C00FFF03C00FFF0ULL;  // a_tb seed

    printf("Seed val = 0x%016" PRIx64 "\n", val);
    printf("Seed u   = %.20Lg\n\n", unsigned_to_fraction_u64(val));

    for (size_t i = 0; i < 30; ++i) {
        long double u = unsigned_to_fraction_u64(val);
        long double logistic = 4.0L * u * (1.0L - u);

        val = mul_with_not_keep_64_msn(val);

        printf("%2zu: val=0x%016" PRIx64 "  u=%.20Lg  logistic=%.20Lg\n",
               i + 1, val, unsigned_to_fraction_u64(val), logistic);
    }
    return 0;
}
