#ifndef CONFIG_H
#define CONFIG_H

#include "main.h"

/* Idealne by bolo vediet ukladat EEPROM len pri
 * zmenach a to len pri vypinani. No detekovat vypinanie
 * nie je vobec trivialne a mi chceme este po detekovani
 * stihnut ulozit EEPROM, ktora je velmi pomala a vyzaduje
 * vela energie.
 *
 * Ak nam ide len o zapisovanie konfiguracii, staci ukladat
 * len pri ludskej interakcii. Ukladanie casu nechajme na RTC modul.
 *
 */

// POZNAMKY:
// Rok je dolezity kvoli priestupným rokom. (29 februar)
// Ak nemáme pripojenie cez DCF77, prepinanie na letny cas
// prebehne vzdy poslednu marcovu nedelu a prepinanie na zimny cas vzdy poslednu oktobrovu nedelu.
// Tak ze po 01:59 sa zobrazí 03:00 alebo z 02.59 bude nasledovat 01:00

// https://www.grauonline.de/alexwww/ardumower/filter/filter.html

 // TODO: Pocitadlo prevadzkovych hodin
 // TODO: Cyklicke ukladanie + detekovanie chyb.

// TRVANLIVOST EEPROM: 100 000 (zapisov/mazani) podľa datasheetu.
// Zapisovanie do urcitej bunky vie do velmi malej miery obotrebovat aj okolite bunky.
// !! Citanie z EEPROM ju neopotrebovava. !!

enum CONFIG {
  HOURS,
  MINUTES,
  BRIGHTNESS,
  GENERAL, // bit positions according to CONFIG_GENERAL
};

enum CONFIG_GENERAL {
  M12_24,        // 12/24h mode
  TRAILLING_ZERO, // show leading tens-hour zero
  NIGHT_MODE_ENABLED,
  NIGHT_MODE_TYPE,
};

// Prvy bit urcuje ci bolo nastavenie uz nacitane z EEPROM.
// Kedze EEPROM citanie je pomale a zapisovanie ju opotrebovava
// (okolo 100 000 zapisov a mazani podla dokumentacie).
extern uint8_t LAZY_EE[];

/////////////////////////////////

// Kazdy numitron reprezentuje jedno nastavenie na danej strane.
#define CONFIG_PAGE_SIZE    DIGIT_COUNT
#define CONFIG_PAGE_COUNT   4
#define TOTAL_CONFIG_COUNT  CONFIG_PAGE_SIZE

typedef void(*CONF_LOAD_FN) (uint8_t, uint8_t);
typedef void(*CONF_SAVE_FN) (uint8_t, uint8_t);

typedef struct {
    uint8_t value;
    uint8_t min;
    uint8_t max;
    CONF_LOAD_FN loadfn;
    CONF_SAVE_FN savefn;
} config_struct;

extern uint8_t cur_page_index;

#define GENERIC_CONFIG(default_value, min, max) {   \
    .value = default_value, .min = min, .max = max, \
    .loadfn = genericEEPROMLoadFn, .savefn = genericEEPROMSaveFn \
}

/****************************************
 * Deklaracie funkcii
 ****************************************/

// Toto je predvolena load funkcia.
void genericEEPROMLoadFn(uint8_t page_index, uint8_t conf_index);

// Toto je predvolena save funkcia.
void genericEEPROMSaveFn(uint8_t page_index, uint8_t conf_index);

void timeLoadFn(uint8_t page_index, uint8_t conf_index);
void timeSaveFn(uint8_t page_index, uint8_t conf_index);

// Ulozi nastavenia pre zadanu stranku nastaveni.
void savePageConfig(uint8_t page_index);

// Ulozi nastavenia pre vsetky stranky nastaveni.
void saveConfigForAllPages();

// Nacita nastavenia pre zadanu stranku nastaveni.
void loadPageConfig(uint8_t page_index);

/****************************************
 * Stranky s konfiguraciami
 ****************************************/

// #define _C_COONF

extern config_struct CONFIG_PAGES[CONFIG_PAGE_COUNT][CONFIG_PAGE_SIZE];

#endif // CONFIG_H
