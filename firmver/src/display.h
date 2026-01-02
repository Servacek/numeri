#ifndef DISPLAY_H
#define DISPLAY_H

#include "main.h"
#include "reg.h"
#include "config.h"
#include "clock.h"


extern uint8_t selected_digit;

// POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
extern volatile uint8_t _target_brightness;

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
extern uint8_t DIGITS[DIGIT_COUNT];

extern volatile uint8_t configured_brightness; // Pre aplikovaný jas pozri register PWM_REGISTER

// Nastavovanie jasu s histereziou.
void setDisplayBrightness(const uint8_t value, const uint8_t histeresis = 0);

void configDisplayBrightness(uint8_t value);

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol);

// Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index);

void crossfadeFromOldDigitsToNew();

uint8_t getTimeDigitWithIndex(uint8_t digit, uint8_t minutes, uint8_t hours);

void displayTimeFromCounters(uint8_t counter_minutes, uint8_t counter_hours);

void displayPage(uint8_t page_index);

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state, bool smooth);

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics();

void stopDiagnostics();

#endif // DISPLAY_H
