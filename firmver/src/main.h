#ifndef NUMITRON_CLOCK_H
#define NUMITRON_CLOCK_H

#undef F_CPU
#define F_CPU 16000000UL    // Pouzivame 16 MHz crystal (nastavme to explicitne)

#include <avr/pgmspace.h> // PROGMEM
#include "utils/math.h"

#include <util/atomic.h> // ATOMIC_BLOCK

#define DEBUG_MODE          1

// IO - Piny

#define RESET_BUTTON        PD4

#define DCF_OUT             PC3 // A3
#define DCF_PON             PB5 // (13 - 8)

#define LDR_PIN_PORTC       PC1 // A1

// Tieto piny su uz pevne dane hardverom.
#define SERIN_PORTB         PB4 // (12 - 8)
#define SRCK_PORTB          PB0 // (8 - 8)
// !! Tento pin nikdy nemoze byt nastaveny na LOW.
#define _G_PORTD            PD5
#define RCK_PORTD           PD7

#define SEGMENT_DP          7
#define DIGIT_COUNT         4

// Serial moze robit bordel ak programujeme cez UART zbernicu.
#define SERIAL_ENABLED      1
#define COMMANDS_ENABLED    SERIAL_ENABLED && 0
#define RTC_ENABLED         1
#define INA_ENABLED         0
#define DISPLAY_ENABLED     1
#define DCF77_ENABLED       1
#define CRSF_ENABLED        DISPLAY_ENABLED && 1 // !
#define LDR_ENABLED         1
// Serial sa moc nekamarati s nasim watchdogom.
#define WATCHDOG_ENABLED    0 // TODO: Treba poriesit, co z watchdogom ked pouzivame wait.

#define I2C_ENABLED         (INA_ENABLED || RTC_ENABLED)
#define ADC_ENABLED         (LDR_ENABLED || DCF77_ENABLED)

// Rezimi (indexi bitov)
#define MODE_NORM           0
#define MODE_EDIT           1
#define MODE_CRSF           2
#define MODE_DIAG           3
#define MODE_BOOT           4
#define MODE_NGHT           5

// Flagy (indexi bitov)
#define FLAG_NEW_SECOND     0
#define FLAG_NEW_MINUTE     1
#define FLAG_NEW_MILLIS     2
#define FLAG_DCF_LEDONN     3
#define FLAG_CRSF_DEFFERED  4
// Bits 5 and 6 are free.
#define FLAG_DCF_SYNC       7

// Zalezi na nastavenom napati, mi pouzivame zvycajne napatie okolo 2.5V
// takze by hodnota logickej 1 mala byt okolo 500.
#define DCF77_ADC_THRESHOLD 250
#define CLOCK_DRIFT_HZ      909

#define SUPPLY_VOLTAGE          (5)
#define MAX_DISPLAY_VOLTAGE_X10 (20) // 2,0V - pri 3V zacina krivka exponencialne rast.

// #define INA_SHUNT_OFFSET    (0.43f) // mV
// #define INA_SHUNT_R         0.4f // Ohm (resistor 0.2 + 0.3 stray)
// #define INA_MAX_CURRENT     0.5f // A

// TODO: Po dokonceni vyvoja, nahradit tieto vypocty za predpocitane konstanty.

// Podla merani 150 ani 250 kHz, nefunguje s prijimacom.
// Pri 350 je to pouzitelne, 500, bez problemov.
#define PWM_FREQUENCY_KHZ   180 // MAX = 8000, MIN = ~65

// f = 16MHz / TOP * PRESCALER, kde PRESCALER = 1 => f = 16Mhz / TOP
// z toho vyplyva: TOP = 16MHz / f

#define DISPLAY_PWM_REG     OCR0B
#define DISPLAY_PWM_TOP     MAX(MIN((16000 / PWM_FREQUENCY_KHZ), 255), 2)
#define START_DISPLAY_PWM() do { \
    TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0); \
    TCCR0B = (1 << WGM02) | (1 << CS00); \
} while (0)
#define STOP_DISPLAY_PWM()  TCCR0A = 0; \
                            TCCR0B = 0;
#define IS_DISPLAY_PWM_ON() (TCCR0A && TCCR0B)

// Realne maximum je samozrejme DISPLAY_PWM_TOP ale to by znamelo celych 5V pre numitrony
// co je nad maximalnu hodnotu stanovenu v dokumentacii (4.5V).
// Takze mame hardverove maximum (DISPLAY_PWM_TOP) a softverove maximum (MAX_BRIGHTNESS).
#define MAX_BRIGHTNESS     (uint8_t)(DISPLAY_PWM_TOP * (MAX_DISPLAY_VOLTAGE_X10 / SUPPLY_VOLTAGE))
// #if DEBUG_MODE
//     #undef MAX_BRIGHTNESS
//     #define MAX_BRIGHTNESS  20
// #endif
// 127 -> ~2.5V
// DEFAULT_BRIGHTNESS = 0.625 -> 19% jas
// MAX -> 3.15V -> 22.5 mA
// Pri 19% jase odber -> ~4 mA na segment
// 19% -> 1,7 mA na segment => 100% -> 8,77 mA
#define DEFAULT_BRIGHTNESS  MAX((MAX_BRIGHTNESS / 5), 1)
#define MIN_BRIGTHNESS      MAX((MAX_BRIGHTNESS / 10), 1)
#define BRIGHTNESS_STEP     MAX((DEFAULT_BRIGHTNESS / 5), 1)

// Minimalna doba zobrazenia diagnostiky pri starte (vsetky segmenty zapnute).
// Zarucuje, ze diagnostika je viditelna aj ked su vsetky moduly vypnute a
// inicializacia prebehne okamzite.
#define BOOT_DIAG_MIN_MS    2000 // ms

// Minimalna doba trvania zmeny jasu z MIN na MAX.
#define NUMBER_TRANS_DUR    4096 // ms
// Treba sa uistit, ze tato hodnota nie je nad 255, inak by sme sa k nej nikdy nedostali.
// #define BRIGHTNESS_CNT_TOP  (NUMBER_TRANS_DUR / (MAX_BRIGHTNESS - MIN_BRIGTHNESS))
#define BRIGHTNESS_CNT_TOP  MIN(NUMBER_TRANS_DUR / (MAX_BRIGHTNESS - MIN_BRIGTHNESS), 255)
// Cim mensia hodnota, tym rychlejsie preklapanie.
#define CROSSFADING_PERIOD    20
// +1: duty klesa od CROSSFADING_PERIOD az po 0 vratane (CROSSFADING_PERIOD+1 krokov).
#define NUMBER_TRANS_PER        (uint8_t)(NUMBER_TRANS_DUR / (CROSSFADING_PERIOD + 1))

// Kazda LED-ka ma svoj rezistor:
// R: 420 R, G: 620 R, B: 620 R
#define MAX_LED_BRIGHTNESS  255
#define DEFAULT_LED_BRIGHTNESS (MAX_LED_BRIGHTNESS / 4)
#define LED_R_REG           OCR1A
#define LED_G_REG           OCR1B

#define DIGIT_MIN_ONES      3
#define DIGIT_MIN_TENS      2
#define DIGIT_HOR_ONES      1
#define DIGIT_HOR_TENS      0

// KED DEBUGUJEME S NANO
// #define DIGIT_MIN_ONES      0
// #define DIGIT_MIN_TENS      1
// #define DIGIT_HOR_ONES      2
// #define DIGIT_HOR_TENS      3


// #define DIGIT_MASK          0b01111111 // mask non-digit segments

#define EDIT_MODE_BLINK_F   200 // ms

#define LONG_PRESS_DELAY    2000 // ms

#define COMMAND_BUFFER_SIZE 64

#define ON                  1
#define OFF                 0

#define PRESSED             0
#define RELEASED            1

#define SECOND_MILLIS       1000
#define MINUTE_MILLIS       60000
#define MAX_MINUTES_COUNT   60
#define MAX_HOURS_COUNT     24
#define MAX_HOURS_TENS      2

#define SERIAL_BANDWIDTH    9600 //115200

#define INA219_ADDR         0x40
#define DS3231_ADDR         0x68

#define CRITICAL_SECTION    ATOMIC_BLOCK(ATOMIC_RESTORESTATE)
#define INTERRUPTS_OFF      cli()
#define INTERRUPTS_ON       sei()

#define NUMBER_TRANS_PER_EDIT    100

#if SERIAL_ENABLED
    // #include <HardwareSerial.h>
    // #include "libs/debug/HardwareSerial.h"
    #include <serial.h>

    #define sprint(...)     Serial.print(__VA_ARGS__)
    // Pre debugovacie ucely sa nam vyplati flushovat za kazdym az vidime presne kde program skoncil.
    #define sprintln(...)   Serial.println(__VA_ARGS__); Serial.flush();
#else
    #define sprint(...)
    #define sprintln(...)
#endif

// Bit helpers
#define BIS(reg, bit)       (reg & (1 << bit))
#define SBI(reg, bit)       (reg |= (1 << bit))
#define CBI(reg, bit)       (reg &= ~(1 << bit))
// Move bit (value) to bit in register.
#define MBI(reg, bit, val)  (val ? SBI(reg, bit) : CBI(reg, bit))

// Vychadzame z toho, ze vsetky tri tlacitka (LBTN, RBTN aj RSTBTN) su na porte D.
#define IS_PRESSED(btn)     (!BIS(PIND, btn))

// Nase hodiny maju len 4 cifry, takze toto je hardcodnute pre efektivitu.
#define COPY_DIGIT_BUFFER(src, dst) dst[0] = src[0]; dst[1] = src[1]; dst[2] = src[2]; dst[3] = src[3]
#define COMPARE_DIGIT_BUFFERS(a, b) (a[0] == b[0] && a[1] == b[1] && a[2] == b[2] && a[3] == b[3])

// Nastavy zadany pin na definovanu logicku hodnotu.
// Nastavujeme mod INPUT s pull-up rezistorom (~50K) takze logicka hodnota je "slaba",
// ale toto je asi ten najlepsi kompromis medzi bezpecnostou a odolnostou proti ruseniu.
#define UNUSED_PIN(port, pin) do { \
    DDR##port  &= ~(1 << pin); \
    PORT##port |=  (1 << pin); \
} while (0)

inline void COMPARATOR_ADC_MODE() {
    ADCSRA &= ~(1 << ADEN);  // Vypneme ADC
    ADCSRB |= (1 << ACME);   // Zapneme multiplexor
    ADMUX = (ADMUX & 0xF0) | (DCF_OUT & 0x07); // Vyberieme kanal.
}

inline void NORMAL_ADC_MODE() {
    ADCSRB &=  ~(1 << ACME);  // Vypneme multiplexor
    ADCSRA |=   (1 << ADEN);   // Zapneme ADC
}

// Direct ADC read on ATmega328P
// pin is the ADC channel number (0-7), same as Arduino's A0-A7 mapping
static inline uint16_t adc_read_raw(uint8_t channel) {
    // REFS0=1, REFS1=0 → AVCC as reference (VCC ≈ 5V) with decoupling on AREF.
    // Pouzivame vzdy AVCC pretoze AREF pin nie je na nasej DPS pouzity
    // (floating AREF by sposoboval nezname/nulove vysledky).
    ADMUX = (1 << REFS0) | (channel & 0x0F);

    // Discard first conversion after channel switch — datasheet recommends
    // this since the sample-and-hold capacitor needs time to charge to new input
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC))
        ;

    // Second conversion is accurate
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC))
        ;

    return ADC; // 10-bit result, 0-1023
}

#define ADC_READ(channel)                                                      \
    ({                                                                         \
        uint8_t _saved_admux = ADMUX;                                          \
        NORMAL_ADC_MODE();                                                     \
        uint16_t _val = adc_read_raw(channel);                                 \
        ADMUX         = _saved_admux;                                          \
        COMPARATOR_ADC_MODE();                                                 \
        _val;                                                                  \
    })

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

    S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9, // 8, - Vsetky symboli zapnute (pre diagnostiku)
};

#define GET_SEGMENT_SYMBOL(symbol) ((uint8_t)pgm_read_byte_near(SEGMENT_SYMBOL + (symbol)))

#define DEGREE_SYMBOL 10
#define MINUS_SYMBOL  11
#define C_SYMBOL      12
#define ALL_ON_SYMBOL 13

extern uint8_t selected_digit; // Zaciname nastavovat cas od desiatok hodin.
// extern volatile uint16_t long_press_cnt;
// extern volatile uint8_t debounce_cnt;

////////////////////////////////////////////////

// TODO: Maybe not even needed at all?
// volatile uint8_t blink_timer_counter = 0;

#endif // NUMITRON_CLOCK_H
