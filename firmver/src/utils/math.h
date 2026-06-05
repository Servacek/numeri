#ifndef __MATH_H__
#define __MATH_H__

#include <stdint.h>


#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
// ! Pri INT16_MIN (-32768) vrati to iste.
#define ABS(x)    ((x) > 0 ? (x) : -(x))

template <typename T>
constexpr T CONSTRAIN(T x, T lo, T hi) noexcept
{
    return x < lo ? lo : x > hi ? hi : x;
}

// Precondition: in_min != in_max
template <typename T, typename U>
constexpr T MAP(T x, T in_min, T in_max, U out_min, U out_max) noexcept
{
    return static_cast<T>(
        (static_cast<int32_t>(x)       - static_cast<int32_t>(in_min))  *
        (static_cast<int32_t>(out_max) - static_cast<int32_t>(out_min)) /
        (static_cast<int32_t>(in_max)  - static_cast<int32_t>(in_min))  +
         static_cast<int32_t>(out_min)
    );
}

template <typename T, typename U>
constexpr T MAP_CLAMPED(T x, T in_min, T in_max, U out_min, U out_max) noexcept
{
    return MAP(CONSTRAIN(x, in_min, in_max), in_min, in_max, out_min, out_max);
}

////////////////////////////////ú

static inline uint8_t div10(uint8_t x) {
    return (uint16_t)(x * 205) >> 11; // presne pre cisla od 0 do 255
}

static inline uint8_t mod10(uint8_t x) {
    uint8_t q = div10(x);
    return x - q * 10;
}

#endif // __MATH_H__
