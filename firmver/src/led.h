#ifndef LED_H
#define LED_H

#include "main.h"

// R, G - Timer 1
// B - Timer 2
#define LED_R                   PB1 // (9 - 8)
#define LED_G                   PB2 // (10 - 8)
#define LED_B                   PB3 // (11 - 8)

// Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
// !! Treba sa uistit, ze trimmer je nastaveny na najvyssiu hodnotu.
#define LED_BRIGHTNESS_TRIM     PC0

#define LED_R_REG               OCR1A
#define LED_G_REG               OCR1B

#define LED_B_TOP_REG           ((uint8_t)255)
#define LED_B_STEP              ((uint8_t)16) // 16 steps

////////////////////////////////

extern volatile uint8_t led_brightness;

extern volatile uint8_t LED_B_REG;
extern volatile uint8_t LED_B_CNT;

// Jediny volny casovac je Timer1
void SET_LED_COLOR(uint8_t led, uint8_t val);

void SET_ALL_CLR_BRIGHT(uint8_t val);

#endif // LED_H
