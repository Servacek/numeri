#ifndef DISPLAY_H
#define DISPLAY_H

#include "main.h"
#include "reg.h"
#include "config.h"
#include "clock.h"

// Podla merani 150 ani 250 kHz, nefunguje s prijimacom.
// Pri 350 je to pouzitelne, 500, bez problemov.
#define PWM_FREQUENCY_KHZ 180 // MAX = 8000, MIN = ~65

// f = 16MHz / TOP * PRESCALER, kde PRESCALER = 1 => f = 16Mhz / TOP
// z toho vyplyva: TOP = 16MHz / f

#define DISPLAY_PWM_REG OCR0B
#define DISPLAY_PWM_TOP MAX(MIN((16000 / PWM_FREQUENCY_KHZ), 255), 2)
#define START_DISPLAY_PWM()                                                    \
    do {                                                                       \
        TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);  \
        TCCR0B = (1 << WGM02) | (1 << CS00);                                   \
    } while (0)
#define STOP_DISPLAY_PWM()                                                     \
    TCCR0A = 0;                                                                \
    TCCR0B = 0;
#define IS_DISPLAY_PWM_ON() (TCCR0A && TCCR0B)

// Realne maximum je samozrejme DISPLAY_PWM_TOP ale to by znamelo celych 5V pre numitrony
// co je nad maximalnu hodnotu stanovenu v dokumentacii (4.5V).
// Takze mame hardverove maximum (DISPLAY_PWM_TOP) a softverove maximum (MAX_BRIGHTNESS).
#define MAX_BRIGHTNESS                                                         \
    (uint8_t)(DISPLAY_PWM_TOP * (MAX_DISPLAY_VOLTAGE_X10 / SUPPLY_VOLTAGE))
// #if DEBUG_MODE
//     #undef MAX_BRIGHTNESS
//     #define MAX_BRIGHTNESS  20
// #endif
// 127 -> ~2.5V
// DEFAULT_BRIGHTNESS = 0.625 -> 19% jas
// MAX -> 3.15V -> 22.5 mA
// Pri 19% jase odber -> ~4 mA na segment
// 19% -> 1,7 mA na segment => 100% -> 8,77 mA
#define DEFAULT_BRIGHTNESS MAX((MAX_BRIGHTNESS / 5), 1)
#define MIN_BRIGTHNESS     MAX((MAX_BRIGHTNESS / 10), 1)
#define BRIGHTNESS_STEP    2

// Minimalna doba zobrazenia diagnostiky pri starte (vsetky segmenty zapnute).
// Zarucuje, ze diagnostika je viditelna aj ked su vsetky moduly vypnute a
// inicializacia prebehne okamzite.
#define BOOT_DIAG_MIN_MS 2000 // ms

#define BRIGTHNESS_MAX_RAMP_DUR 4096 // ms

///////////////////////////////////

namespace Display {
    const uint8_t BRIGHTNESS_CNT_TOP =
        MIN(BRIGTHNESS_MAX_RAMP_DUR / (MAX_BRIGHTNESS - MIN_BRIGTHNESS), 255);

    // POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
    extern ACCESSED_FROM_ISR uint8_t _target_brightness;

    // Sem ulozime bajty ktore zobrazujeme,
    // lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
    extern uint8_t DIGITS[DIGIT_COUNT];

    extern uint8_t configured_brightness; // Pre aplikovaný jas pozri register PWM_REGISTER

    ///////////////////////////////////
    // Verejne funkcie
    ///////////////////////////////////

    // Pocet svietiacich filamentov (vsetky 8 bitov, DP zahrnuty).
    inline uint8_t getLitSegmentsCount() {
        uint8_t n = 0u;
        for (uint8_t i = 0u; i < DIGIT_COUNT; i++) {
            n += (uint8_t)__builtin_popcount(DIGITS[i]);
        }
        return n;
    }

    // Nastavovanie jasu s histereziou.
    void setBrightness(const uint8_t value, const uint8_t histeresis = 0);

    void setConfigBrightness(uint8_t value);

    uint8_t getConfigBrightness();

    void incrementBrightness(int8_t step);

    void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol);

    // Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
    void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index);

    uint8_t getTimeDigitWithIndex(uint8_t digit, uint8_t minutes, uint8_t hours);

    void displayTimeFromCounters(uint8_t counter_minutes, uint8_t counter_hours);

    // Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
    void setNumitronSegment(uint8_t digit, uint8_t index, bool state);

    // Pri diagnostike chceme aby svietili vsetky segmenty,
    // takze vieme povedat ktore su vypalene.
    void startDiagnostics();

    void stopDiagnostics();

    void boot();

    void onMillisecondTick();

} // namespace Display

#endif // DISPLAY_H
