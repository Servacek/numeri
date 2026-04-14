#ifndef NUMITRON_CLOCK_H
#define NUMITRON_CLOCK_H

#undef F_CPU
#define F_CPU 16000000UL    // Pouzivame 16 MHz crystal (nastavme to explicitne)

#include <avr/pgmspace.h> // PROGMEM
#include "utils/math.h"

#define DIGIT_MIN_ONES      3
#define DIGIT_MIN_TENS      2
#define DIGIT_HOR_ONES      1
#define DIGIT_HOR_TENS      0

#define SERIAL_BANDWIDTH    9600 //115200

#define INA219_ADDR         0x40
#define DS3231_ADDR         0x68

#define NUMBER_TRANS_PER_EDIT    20

// Vychadzame z toho, ze vsetky tri tlacitka (LBTN, RBTN aj RSTBTN) su na porte D.
#define IS_PRESSED(btn)     (!BIS(PIND, btn))

// Nase hodiny maju len 4 cifry, takze toto je hardcodnute pre efektivitu.
#define COPY_DIGIT_BUFFER(src, dst) dst[0] = src[0]; dst[1] = src[1]; dst[2] = src[2]; dst[3] = src[3]
#define COMPARE_DIGIT_BUFFERS(a, b) (a[0] == b[0] && a[1] == b[1] && a[2] == b[2] && a[3] == b[3])

#define NUM_SYMBOL_COUNT    14

// Segmenty numitronu (v registry su cislovane naopak)
// S1 - je spolocny (+)
#define S2 (1 << 7) // desatinna ciarka
#define S3 (1 << 6)
#define S4 (1 << 5)
#define S5 (1 << 4)
#define S6 (1 << 3)
#define S7 (1 << 2)
#define S8 (1 << 1)
#define S9 (1 << 0)

/*
 *  /|5|\
 * |6| |3|
 *  +|7|+
 * |9| |4|
 *  \|8|/
 *      /2\
 */

// uint8_t pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const uint8_t SEGMENT_SYMBOL[NUM_SYMBOL_COUNT] PROGMEM = {
    S3 | S4 | S5 | S6 | S8 | S9,            // 0
    S3 | S4,                                // 1
    S3 | S5 | S7 | S8 | S9,                 // 2
    S3 | S4 | S5 | S7 | S8,                 // 3
    S3 | S4 | S6 | S7,                      // 4
    S4 | S5 | S6 | S7 | S8,                 // 5
    S4 | S5 | S6 | S7 | S8 | S9,            // 6
    S3 | S4 | S5,                           // 7
    S3 | S4 | S5 | S6 | S7 | S8 | S9,       // 8
    S3 | S4 | S5 | S6 | S7 | S8,            // 9

    // Special symbols
    S3 | S5 | S6 | S7,                      // °
    S7,                                     // -
    S5 | S6 | S8 | S9,                      // C

    S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9,  // 8, - Vsetky symboli zapnute (pre diagnostiku)
};

#define GET_SEGMENT_SYMBOL(symbol) ((uint8_t)pgm_read_byte_near(SEGMENT_SYMBOL + (symbol)))

#define DEGREE_SYMBOL 10
#define MINUS_SYMBOL  11
#define C_SYMBOL      12
#define ALL_ON_SYMBOL 13

#endif // NUMITRON_CLOCK_H
