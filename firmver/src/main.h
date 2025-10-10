#ifndef NUMITRON_CLOCK_H
#define NUMITRON_CLOCK_H


#include <Arduino.h>
#include <EEPROM.h>
#include <util/atomic.h>

// IO - Piny

#define RESET_BUTTON        PD4
#define LEFT_BUTTON         PD3
#define RIGHT_BUTTON        PD2

// R, G - Timer 1
// B - Timer 2
#define LED_R               PB1 // (9 - 8)
#define LED_G               PB2 // (10 - 8)
#define LED_B               PB3 // (11 - 8)
// Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
//#define LED_BRIGHTNESS_TRIM PC0

#define DCF_OUT             PC3 // A3
#define DCF_PON             PB5 // (13 - 8)

#define LDR_PIN_PORTC       PC1 // A1

// Tieto piny su uz pevne dane hardverom.
#define SERIN_PORTB         PB4 // PB4 (12 - 8)
#define SRCK_PORTB          PB0 // PB0 (8 - 8)
#define _G_PORTD            PD6 // PD6
#define RCK_PORTD           PD7 // PD7

#define SEGMENT_DP          7

#define DIGIT_COUNT         4

#define NUMBER_TRANS_DUR    4096 // ms
// Cim mensia hodnota, tym rychlejsie preklapanie.
#define CROSSFADING_WRAP    32
#define NUMBER_TRANS_PER    (NUMBER_TRANS_DUR / CROSSFADING_WRAP)

#define RTC_ENABLED         1
#define INA_ENABLED         1
#define DISPLAY_ENABLED     0
#define DCF77_ENABLED       1

// Realne maximum je samozrejme 255 ale to by znamelo celych 5V pre numitrony
// co je nad maximalnu hodnotu stanovenu v dokumentacii.
// Takze mame hardverove maximum a softverove maximum.
#define MAX_BRIGHTNESS      127 // 127 Vo phase-correcz mode inak 160
#define DEFAULT_BRIGHTNESS  MAX_BRIGHTNESS / 4
#define MINIMUM_BRIGHTNESS  10

#define DIGIT_MIN_UNITS     3
#define DIGIT_MIN_TENS      2
#define DIGIT_HOR_UNITS     1
#define DIGIT_HOR_TENS      0

#define DIGIT_MASK          0b01111111 // mask non-digit segments

#define EDIT_MODE_BLINK_F   200 // ms

#define LONG_PRESS_DELAY    2000 // ms

#define ON                  1
#define OFF                 0

#define PRESSED             0
#define RELEASED            1

#define NUM_SYMBOL_COUNT    10

#define MAX_MINUTES_COUNT   (24 * 60)

#define PWM_REGISTER        OCR0A

#define SERIAL_BANDWIDTH    115200

#define INA219_ADDR         0x40

#define CRITICAL_SECTION ATOMIC_BLOCK(ATOMIC_RESTORESTATE)

// trvanie = 1 / 16 000 000 = 6,25 * 10^-8 s = 62,5 ns
#define NOP __asm__ __volatile__ ("nop\n\t")

// Bit helpers
#define BIS(reg, bit)       (reg & (1 << bit))
#define SBI(reg, bit)       (reg |= (1 << bit))
#define CBI(reg, bit)       (reg &= ~(1 << bit))

// const byte CROSSFADING_FLIP_VALUES[] PROGMEM = {
//   20, 18, 16, 14, 13, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
// };

// ---- EEPROM configuration addresses & enums ----
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

// inline void SET(uint8_t pin, bool state) {
//     if (pin < 0) {
//         return;
//     }

//     if (pin <= 7) {
//         if (state) {
//             SBI(PORTD, pin);
//         } else {
//             CBI(PORTD, pin);
//         }
//     } else if (pin <= 13) {
//         if (state) {
//             SBI(PORTB, pin - 8);
//         } else {
//             CBI(PORTB, pin - 8);
//         }
//     } else if (pin <= A6) {
//         if (state) {
//             SBI(PORTC, pin - A0);
//         } else {
//             CBI(PORTC, pin - A0);
//         }
//     }
// }

// ---- Externs for globals defined in the sketch (.ino/.cpp) ----
extern byte LAZY_EE[];                    // lazy EEPROM cache
extern const byte NUM_SYMBOL_BYTES[];     // 7-seg bitmap -> symbol mapping

extern volatile bool edit_mode;
extern volatile bool diagnostics_mode;
extern volatile uint8_t selected_digit;

extern uint8_t segments_lit;

extern volatile uint8_t configured_brightness;
extern volatile bool number_transition;

extern volatile uint8_t blink_timer_counter;
extern volatile uint16_t brightness_counter;

extern volatile uint16_t minutes_count;

// ---- Function prototypes (public API used across translation units) ----

// EEPROM helpers
byte getEEConfig(uint8_t address);
void setEEConfig(uint8_t address, byte value);
void saveEEConfig();

// Editing / display helpers
void enterEditMode();
void exitEditMode();
uint8_t getSelectedNumSymbolIndex(uint8_t digit);

// Brightness / transition
void startNumberTransition();
void stopNumberTransition();
void configBrightness(uint8_t value);
void setBrightness(uint8_t value);

// Low-level segment/register control
void setNumitronSegment(uint8_t digit, uint8_t index, bool state);
void toggleNumitronSegment(uint8_t digit, uint8_t index);
void setSelectedDigit(uint8_t digit);
void putDigitsToInputRegs(byte* digits, uint8_t n);
void pushToOutputRegs();
void showDigits();

// Time / display logic
void displayTime(uint16_t time_in_minutes);
void onNewMinute();

// Diagnostics
void startDiagnostics();
void stopDiagnostics();

// Button handlers / input
void onLeftButtonPressed();
void onLeftButtonReleased();
void onLeftButtonLongPressed();

void onRightButtonPressed();
void onRightButtonReleased();
void onRightButtonLongPressed();

void onBothButtonsPressed();
void onBothButtonsReleased();
void onBothButtonsLongPressed();

void handleInput();

// Standard Arduino entry points (implemented in sketch)
void setup();
void loop();

#endif // NUMITRON_CLOCK_H
