#ifndef __MATH_H__
#define __MATH_H__

#include <stdint.h>


#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define ABS(x)    ((x) > 0 ? (x) : -(x))
#define CONSTRAIN(amt, low, high)                                              \
    ((amt) < (low) ? (low) : ((amt) > (high) ? (high) : (amt)))

// Nevklada sa do funkcie — ziadny call overhead, ziadny 32-bit long ako v Arduino.
// Pozor: argumenty su vyhodnotene viackrat — nepouzivat s vedlajsimi efektmi (x++, funkcie).
#define MAP(x, in_min, in_max, out_min, out_max)                               \
    ((typeof(x))(((x) - (in_min)) * ((out_max) - (out_min)) /                  \
                     ((in_max) - (in_min)) +                                   \
                 (out_min)))

#define MAP_CLAMPED(x, in_min, in_max, out_min, out_max)                       \
    MAP(CONSTRAIN(x, in_min, in_max), in_min, in_max, out_min, out_max)

////////////////////////////////ú

static inline uint8_t div10(uint8_t x) {
    return (uint16_t)(x * 205) >> 11; // exact for 0–255
}

static inline uint8_t mod10(uint8_t x) {
    uint8_t q = div10(x);
    return x - q * 10;
}

#endif // __MATH_H__
