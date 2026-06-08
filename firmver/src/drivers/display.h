/**
 * @file display.h
 * Ovladac pre numitronovy displej.
 */

#ifndef DISPLAY_H
#define DISPLAY_H

#include "main.h"
#include "const.h"
#include "utils/reg.h"
#include "config.h"
#include "fading.h" // Aby mali vsetci pristup do Crossfading namespace.

// TODO: Po dokonceni vyvoja, nahradit tieto vypocty za predpocitane konstanty.

#define MAX_DISPLAY_VOLTAGE_X10  (25) // 1,8V - pri 3V zacina krivka exponencialne rast.

// Podla merani 150 ani 250 kHz, nefunguje s prijimacom.
// Pri 350 je to pouzitelne, 500, bez problemov.
#define PWM_FREQUENCY_KHZ 180 // MAX = 8000, MIN = ~65

// f = 16MHz / TOP * PRESCALER, kde PRESCALER = 1 => f = 16Mhz / TOP
// z toho vyplyva: TOP = 16MHz / f

#define DISPLAY_PWM_REG OCR0B
#define DISPLAY_PWM_TOP MAX(MIN((16000 / PWM_FREQUENCY_KHZ), 255), 2) // = 88
#define START_DISPLAY_PWM()                                                    \
    do {                                                                       \
        TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);  \
        TCCR0B = (1 << WGM02) | (1 << CS00);                                   \
    } while (0)
#define STOP_DISPLAY_PWM()                                                     \
    TCCR0A = 0;                                                                \
    TCCR0B = 0;
#define IS_DISPLAY_PWM_ON() (TCCR0A && TCCR0B)

// 8 levelov: index 0-7 sa zmesti na jednu cifru numitronu (0-9).
#define BRIGHTNESS_LEVELS  8

// Minimalna doba zobrazenia diagnostiky pri starte (vsetky segmenty zapnute).
// Zarucuje, ze diagnostika je viditelna aj ked su vsetky moduly vypnute a
// inicializacia prebehne okamzite.
#define BOOT_DIAG_MIN_MS 3000 // ms

#define BRIGHTNESS_MAX_RAMP_DUR 4096 // ms
#define BRIGHTNESS_CNT_TOP MIN(BRIGHTNESS_MAX_RAMP_DUR / (MAX_BRIGHTNESS - MIN_BRIGHTNESS), 255)

///////////////////////////////////

namespace Display {

    ///////////////////////////////////
    // Verejne konstanty
    ///////////////////////////////////

    // Realne maximum je samozrejme DISPLAY_PWM_TOP ale to by znamelo celych 5V pre numitrony
    // co je nad maximalnu hodnotu stanovenu v dokumentacii (4.5V).
    // Takze mame hardverove maximum (DISPLAY_PWM_TOP) a softverove maximum (MAX_BRIGHTNESS).
    constexpr uint8_t MAX_BRIGHTNESS = ((uint8_t)(
        ((uint16_t)DISPLAY_PWM_TOP * (uint16_t)MAX_DISPLAY_VOLTAGE_X10) /
        ((uint16_t)SUPPLY_VOLTAGE * 10u)
    ));

    constexpr uint8_t DEFAULT_BRIGHTNESS    = MAX((MAX_BRIGHTNESS / 2), 1);
    constexpr uint8_t MIN_BRIGHTNESS        = MAX((MAX_BRIGHTNESS / 6), 1);
    constexpr uint8_t BRIGHTNESS_STEP       = 2u;

    ///////////////////////////////////
    // Sukromne premenne (definovane v display.cpp — jedno zdielane pole pre vsetky TU)
    ///////////////////////////////////

    // Sem ulozime bajty ktore zobrazujeme,
    // lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
    extern uint8_t _DIGITS[DIGIT_COUNT];

    // ! POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
    extern volatile uint8_t _target_brightness;

    ///////////////////////////////////
    // Verejne funkcie
    ///////////////////////////////////

    // Pocet svietiacich filamentov (vsetky 8 bitov, DP zahrnuty).
    inline uint8_t getLitSegmentsCount() {
        uint8_t n = 0u;
        for (uint8_t i = 0u; i < DIGIT_COUNT; i++) {
            n += (uint8_t)__builtin_popcount(_DIGITS[i]);
        }
        return n;
    }

    inline bool isBrightnessTransitioning() {
        return _target_brightness != DISPLAY_PWM_REG;
    }

    inline uint8_t getTargetBrightness() {
        return _target_brightness;
    }

    // Nastavovanie jasu s histereziou.
    void setBrightness(const uint8_t value, const uint8_t histeresis = 0);

    // Nastavi rychlost prechodu jasu v ms.
    void setBrightnessRampDuration(uint16_t ms);

    void setConfigBrightness(uint8_t value);

    uint8_t getConfigBrightness();

    void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol);

    // Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
    void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index);

    uint8_t getTimeDigitWithIndex(uint8_t digit, uint8_t minutes, uint8_t hours);

    void displayTimeFromCounters(uint8_t counter_minutes, uint8_t counter_hours);

    // Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
    void addNumitronSegmentMask(uint8_t digit, uint8_t index, bool state);

    void emergencyShutdown();

    // Trvalo zakaze zapis na dany numitron (napr. po detekcii vadneho filamentu).
    void disableNumitron(uint8_t i);

    // Rozsvieti vsetky segmenty — pouziva sa pri startupe a diagnostike.
    void showAllSegments();

    void boot();

    void onISRTick();

    // Level index -> reprezentativna PWM hodnota pre kalibraciu a vyhladavanie.
    // Level 0 = MIN_BRIGHTNESS, level BRIGHTNESS_LEVELS-1 = MAX_BRIGHTNESS.
    inline uint8_t getLevelBrightness(uint8_t level) {
        if (level == 0) return MIN_BRIGHTNESS;
        if (level >= BRIGHTNESS_LEVELS - 1) return MAX_BRIGHTNESS;
        return (uint8_t)(MIN_BRIGHTNESS +
               (uint16_t)level * (MAX_BRIGHTNESS - MIN_BRIGHTNESS) / (BRIGHTNESS_LEVELS - 1));
    }

    // PWM hodnota -> index najblizieho levelu jasu.
    inline uint8_t getBrightnessLevel(uint8_t pwm) {
        uint8_t best = 0, best_diff = 255;
        for (uint8_t i = 0; i < BRIGHTNESS_LEVELS; i++) {
            const uint8_t lv = getLevelBrightness(i);
            const uint8_t d  = (pwm >= lv) ? (pwm - lv) : (lv - pwm);
            if (d < best_diff) { best_diff = d; best = i; }
        }
        return best;
    }

} // namespace Display

#endif // DISPLAY_H
