/*
 * drivers/led.h
 *
 * Mimoriadne robustny driver pre indikacnu RGB LED-ku hodin.
 *
 * Potrebujeme vediet nastavit celkovy jas ledky, ten udava
 * maximalnu hodnotu jasu pre kazdu farbu. Potom udavame cislom
 * od 0 - 100 uroven jasu v percentach pre kazdu farbu.
 */

#ifndef LED_H
#define LED_H

#include <avr/pgmspace.h>

////////////////////////////////
// ? Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
// !! Treba sa uistit, ze trimmer je nastaveny na najvyssiu hodnotu.
#define LED_BRIGHTNESS_TRIM     PC0
////////////////////////////////

#define LED_R_TOP_REG           OCR1A
#define LED_G_TOP_REG           OCR1B

// Modra ledka je implementovana cez softverove PWM lebo uz nemame volny casovac.
// ! Toto by mala byt mocnina dvojky aby sme mali periodu konzistentnu.
#define LED_B_STEP              ((uint8_t)16)

// Kazda LED-ka ma svoj rezistor:
// R: 420 R, G: 620 R, B: 620 R
#define MAX_LED_BRIGHTNESS     255
#define DEFAULT_LED_BRIGHTNESS 31
// #define MAX_LED_BRIGHTNESS     255
// #define DEFAULT_LED_BRIGHTNESS ((uint8_t)(MAX_LED_BRIGHTNESS / 4u))

////////////////////////////////

namespace Led {
    extern uint8_t brightness;

    struct RGB {
        uint8_t r, g, b;
    };

    namespace Color {
        enum Type : uint8_t {
            RED   = PB1,
            GREEN = PB2,
            BLUE  = PB3,
        };
    }

    // Typ pre paletu farebnych hodnot ulozenu vo Flash (PROGMEM).
    // Automaticka konverzia na RGB pri predani do setRGB() — volajuce miesta sa nemenia.
    struct PaletteColor {
        uint8_t r, g, b;
        operator RGB() const {
            return RGB{pgm_read_byte(&r), pgm_read_byte(&g), pgm_read_byte(&b)};
        }
    };

    // Stavy indikacej LED podla prirucky (strana 16) — ulozene vo Flash (PROGMEM), nie v RAM.
    namespace Palette {
        extern const PaletteColor STARTUP       PROGMEM; // zlta    - inicializacia a start
        extern const PaletteColor SYNCING       PROGMEM; // oranzova - synchronizacia prebieha
        extern const PaletteColor SYNC_OK       PROGMEM; // zelena  - synchronizacia uspesna
        extern const PaletteColor SYNC_FAIL     PROGMEM; // cervena - synchronizacia zlyhala / nadprud
        extern const PaletteColor FIRMWARE_LOAD PROGMEM; // modra   - nahravanie firmveru / podprud
        extern const PaletteColor FACTORY_RESET PROGMEM; // biela   - obnovenie vyrobnych nastaveni
    }

    void setupRegisters();

    ///////////////////

    // Nastavime v percetach hodnoty jednotlivych farieb ledky.
    // 100% = brightness
    void setRGB(uint8_t r, uint8_t g, uint8_t b);
    void setRGB(RGB color);

    void setColor(uint8_t color);

    void setBrightness(uint8_t val);

    // Prevod 0..8 na nelinearny jas LED-ky.
    inline uint8_t getBrightnessForLevel(uint8_t level) {
        switch (level) {
        case 0: return 0;
        case 1: return 1;
        case 2: return 2;
        case 3: return 4;
        case 4: return 8;
        case 5: return 31;
        case 6: return 63;
        case 7: return 127;
        default: return MAX_LED_BRIGHTNESS;
        }
    }

    void lock();
    void unlock();
    bool isLocked();

    ///////////////////

    void onMainLoopTick();

    void onISRTick();
} // namespace Led

#endif // LED_H
