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
uint8_t LAZY_EE[] = {
    // Cas sa oplati ukladat len v tedy ak by sa vybila
    // zalohovacia 3V bateria a bol by len chvilkovy vypadok napajania.
    // To by ale len o par minut skratilo opatovne zapnutie kym by sa hodiny,
    // aj tak neladili pomocou DCF77.
    // 0x00000000, // Ulozeny cas - hodiny 0 - 23
    // 0x00000000, // Ulozeny cas - minuty 0 - 59
    0b00000000, // Nastavenie jasu 0 - 127
    0b00000000, // Vseobecne 1 bitove nastavenia
    // GENERAL:0 -> 12/24
    // GENERAL:1 -> zaciatocna 0
    // GENERAL:2 -> nocny rezim ON/OFF
    // GENERAL:3 -> typ nocneho rezimu VYPNUTIE/ZTLMENIE

    // cas (hodiny, minuty) kedy sa mame prepnut do nocneho rezimu?
    //0b00000000,
    //0b00000000,
};

static uint8_t getEEConfig(uint8_t address) {
    if (!BIS(LAZY_EE[address], 7)) { // Nastavenie este nie je nacitane
        // LAZY_EE[address] = EEPROM.read(address);
        SBI(LAZY_EE[address], 7);
    }

    return (LAZY_EE[address] & ~(1 << 7)); // Ignorujme najvacsi bit aby nezkresloval hodnotu
}

// Nastavi hodnotu na adrese v LAZY_EE a zapise do EEPROM.
static void setEEConfig(uint8_t address, uint8_t value) {
    if (getEEConfig(address) != value) { // Overme ci naozaj je treba hodnotu prenastavovat
        LAZY_EE[address] = value;
        SBI(LAZY_EE[address], 7);
        // EEPROM.write(address, LAZY_EE[address]);
    }
}

void saveEEConfig() {
    setEEConfig(BRIGHTNESS, configured_brightness);
}

#endif // CONFIG_H
