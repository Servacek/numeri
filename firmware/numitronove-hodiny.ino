// // TODO: Automatically exit edit mode after some time has elapsed (1 min?).

// // #include <EEPROM.h>

// #define LEFT_BUTTON       3
// #define RIGHT_BUTTON      2

// #define _G                9
// #define SERIN             8

// #define RCK               12
// #define SRCK              11

// #define SEGMENT_DP        7

// #define DIGIT_COUNT       4

// #define NUMBER_TRANS_DUR  1000 // ms
// #define MAX_BRIGHTNESS    100
// #define MAX_G_PWM         128
// #define NUMBER_TRANS_PER  (NUMBER_TRANS_DUR / MAX_BRIGHTNESS)
// #define DUTY_CYCLE_REG    OCR1A

// #define DIGIT_MIN_UNITS   3
// #define DIGIT_MIN_TENS    2
// #define DIGIT_HOR_UNITS   1
// #define DIGIT_HOR_TENS    0

// #define DIGIT_MASK        0b01111111 // Na zamaskovanie neciselnych segmentov

// #define ON                1
// #define OFF               0

// #define PRESSED           0
// #define RELEASED          1

// #define LONG_PRESS_THRESH 500 // ms

// #define NUM_SYMBOL_COUNT  10

// #define SET(reg, bit)     (reg |= 1 << bit)
// #define RESET(reg, bit)   (reg &= ~(1 << bit))

// // Delice - Prescallers (Delia Fclk_IO)
// #define PS_1              (1 << CS10)
// #define PS_8              (1 << CS11)
// #define PS_64             (1 << CS10 | 1 << CS11)
// #define PS_256            (1 << CS12)
// #define PS_1024           (1 << CS10 | 1 << CS12)

// #define PWM_NONINVERTED   (1 << COM1A1)
// #define PWM_INVERTED      (1 << COM1A1 | COM1A0)


// const byte NUM_SYMBOL_BYTES[] = // pole pre 10 bajtov (10x znakov)
// {
//   //53489672
//   // 0b01111110, // bajt reprezentujuci kombinaciu H/L na pinoch pre znaku 0
//   // 0b00001100, // znak 1
//   // 0b10110110, // znak 2
//   // 0b10011110,
//   // 0b11001100,
//   // 0b11011010,
//   // 0b11111010,
//   // 0b00001110,
//   // 0b11111110,
//   // 0b11011110,

//   //23456789
//   0b01111011, //0 - 3, 4, 5, 6, 8, 9
//   0b01100000, //1 - 3, 4
//   0b01010111, //2 - 3, 5, 7, 8, 9
//   0b01110110, //3 - 3, 4, 5, 7, 8
//   0b01101100, //4 - 3, 4, 6, 7
//   0b00111110, //5 - 4, 5, 6, 7, 8
//   0b00111111, //6 - 4, 5, 6, 7, 8, 9
//   0b01110000, //7 - 3, 4, 5
//   0b01111111, //8 - 3, 4, 5, 6, 7, 8, 9
//   0b01111110, //9 - 3, 4, 5, 6, 7, 8
// };

// // Sem ulozime bajty ktore zobrazujeme,
// // lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
// volatile byte DIGITS[] = { 0, 0, 0, 0 };

// volatile bool edit_mode = false;
// volatile uint8_t selected_digit = 0; // V zaklade mame vybratu prvu cifru.

// volatile uint8_t configured_brightness = MAX_BRIGHTNESS / 2; // For real applied brightness check the OCR1B register
// volatile bool number_transition = false;

// volatile uint8_t blink_timer_counter = 0;
// volatile uint16_t brightness_counter = 0;

// volatile uint16_t minutes_count = 0;

// volatile bool starting_up = true;


// void enterEditMode() {
//   edit_mode = true;
//   blink_timer_counter = 0;
//   setNumitronSegment(selected_digit, SEGMENT_DP, ON);
// }

// void saveConfigToEEPROM() {
//   // if (configured_brightness != EEPROM.read(1)) EEPROM.write(1, configured_brightness);
// }

// void exitEditMode() {
//   edit_mode = false;
//   blink_timer_counter = 0;
//   setNumitronSegment(selected_digit, SEGMENT_DP, OFF);

//   // Teraz je na case vsetko ulozit.
//   saveConfigToEEPROM();
// }

// uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
//   byte masked_digit = DIGITS[digit] & DIGIT_MASK;
//   for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
//     if (NUM_SYMBOL_BYTES[num_symbol_index] == masked_digit) {
//       return num_symbol_index;
//     }
//   }

//   return 0;
// }

// void startNumberTransition() {
//   number_transition = true;
//   setBrightness(0);
//   brightness_counter = 0;
// }

// void stopNumberTransition() {
//   number_transition = false;
//   brightness_counter = 0;
// }

// void configBrightness(uint8_t value) {
//   configured_brightness = value;
//   setBrightness(configured_brightness);
// }

// void setBrightness(uint8_t value) {
//   DUTY_CYCLE_REG = value;
// }

// // Pre nastavovanie jednotlivych segementov (hlavne pri desatinnej ciarke)
// void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
//   if (state) {
//     DIGITS[digit] |= (1 << index);
//   } else {
//     DIGITS[digit] &= ~(1 << index);
//   }
//   digitalWrite(RCK, LOW);
//   putDigits();
//   digitalWrite(RCK, HIGH);
// }

// void toggleNumitronSegment(uint8_t digit, uint8_t index) {
//   setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
// }

// // void onEditButtonPressed() {
// //   if (!edit_mode) {
// //     enterEditMode();
// //   }
// // }

// void setSelectedDigit(uint8_t digit) {
//   setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
//   blink_timer_counter = 0;
//   setNumitronSegment(digit, SEGMENT_DP, ON);
//   selected_digit = digit;
// }

// void putDigits() {
//   uint8_t digit = DIGIT_COUNT;
//   while (digit--) { shiftOut(SERIN, SRCK, LSBFIRST, DIGITS[digit]); }
// }

// void displayTime() {
//   uint8_t minutes = minutes_count % 60;
//   uint8_t minutes_units = minutes % 10;
//   uint8_t minutes_tens = minutes / 10;

//   uint8_t hours = minutes_count / 60;
//   uint8_t hours_units = hours % 10;
//   uint8_t hours_tens = hours / 10;

//   if (!edit_mode || selected_digit != DIGIT_MIN_UNITS) { DIGITS[DIGIT_MIN_UNITS] = NUM_SYMBOL_BYTES[minutes_units]; }
//   if (!edit_mode || selected_digit != DIGIT_MIN_TENS) { DIGITS[DIGIT_MIN_TENS] = NUM_SYMBOL_BYTES[minutes_tens]; }
//   if (!edit_mode || selected_digit != DIGIT_HOR_UNITS) { DIGITS[DIGIT_HOR_UNITS] = NUM_SYMBOL_BYTES[hours_units]; }
//   if (!edit_mode || selected_digit != DIGIT_HOR_TENS) { DIGITS[DIGIT_HOR_TENS] = NUM_SYMBOL_BYTES[hours_tens]; }

//   // DIGITS[0] = NUM_SYMBOL_BYTES[minutes_units];
//   // DIGITS[1] = NUM_SYMBOL_BYTES[minutes_units];
//   // DIGITS[2] = NUM_SYMBOL_BYTES[minutes_units];
//   // DIGITS[3] = NUM_SYMBOL_BYTES[minutes_units];
//   showDigits();
// }

// void onNewMinute() {
//   minutes_count++;
//   if (minutes_count >= 1440) {
//     minutes_count = 0; // Reset back to 00:00 at 23:59
//   }

//   displayTime();
// }

// void showDigits() {
//   digitalWrite(RCK, LOW);
//   putDigits();
//   startNumberTransition();
//   digitalWrite(RCK, HIGH);
//   delay(10);
//   digitalWrite(RCK, LOW);
// }

// // Konfigurácia PWM pre G pin zbernice registrov.
// void setupPWM() {
//   // Vypneme vsetky interupty aby nas neprerusili uprostred konfiguracie registrov.
//   cli();

// //   // Fclk_io -> System clock frequency (16MHz)
// //   // WGM    - Waveform Generation Mode
// //   // COM1A1 - Compare Output Mode for Channel A
// //   // TCCR1A - Timer/Counter1 Control Register A

// //   // Chceme prepisat celu konfiguraciu, takze resetujeme kontrolne registre.
// //   TCCR1A = 0b00000000;
// //   TCCR1B = 0b00000000;

// //   // Na pine 9 (~G) je OC1A (OC - Output Compare)
// //   // WGM10 | WGM11 | WGM12 | WGM13 -> Fast PWM BOTTOM->TOP(OCR1A)
// //   TCCR1A = (1<<COM1B1) | (1<<COM1B0) | (1 << WGM10) | (1 << WGM11);
// //   //TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS11);  // Prescaler = 8
// //   TCCR1B = (1 << WGM13) | (1 << WGM12) | PS_1;  // Prescaler = 1 => Fpwm = (16MHz / 128) = 125 KHz¨
// // //   TCCR1A = (1<<COM1A1)|(1<<COM1A0)   // inverting on OC1A
// // //        | (1<<WGM11);
// // // TCCR1B = (1<<WGM13)|(1<<WGM12)    // high‐half WGM bits
// // //        | PS_1;
// //   OCR1A = 127;
// //   // ICR1 = 127; // TOP - kedy je koniec cyklu -> zaciname pocitat znova od 0
// //   DUTY_CYCLE_REG = 0;  // ZMENA - pri akej hodnote mame prejst z LOW stavu do HIGH stavu.


//   // 2) Stop Timer1 while configuring
//   TCCR1A = 0;
//   TCCR1B = 0;
//   TCNT1  = 0;

//   // 3) Set TOP = ICR1 = 225 (fast PWM mode 14: WGM13:0 = 1110)
//   ICR1 = 225;

//   // 4) Configure Timer1:
//   //
//   //   – Fast PWM, TOP = ICR1  →  WGM13:WGM10 = 1 1 1 0  (mode 14)
//   //   – COM1A1:0 = 1 1 → inverted on OC1A (pin 9)
//   //   – Prescaler = 1 (CS12:0 = 0 0 1)
//   //
//   //  TCCR1A bits: COM1A1=1, COM1A0=1,    WGM11=1, WGM10=0
//   //  TCCR1B bits: WGM13=1, WGM12=1,       CS12=0, CS11=0, CS10=1

//   TCCR1A = (1 << COM1A1) | (1 << COM1A0) | (1 << WGM11);
//   TCCR1B = (1 << WGM13)  | (1 << WGM12)  | (1 << CS10);

//   // 5) Initially set duty = 0 (i.e. OCR1A = 0 → OC1A always HIGH)
//   OCR1A = 0;

//   sei(); // Sme hotovy - interupty uz mozu interuptovat
// }

// void setupUserControls() {
//   RESET(DDRD, LEFT_BUTTON);
//   SET(PORTD, LEFT_BUTTON);
//   RESET(DDRD, RIGHT_BUTTON);
//   SET(PORTD, RIGHT_BUTTON);
// }

// void setupRegisterBus() {
//   SET(DDRB, SRCK);
//   SET(DDRB, RCK);
//   SET(DDRB, SERIN);
//   SET(DDRB, _G);
//   // SET(PORTB, _G);
// }

// void setup() {
//   DIGITS[0] = NUM_SYMBOL_BYTES[0];
//   //////////////// PWM //////////////////

//   cli();
//   // Stop Timer1
//   TCCR1A = 0;
//   TCCR1B = 0;

//   // Set Fast PWM mode with ICR1 as TOP
//   TCCR1A = (1 << COM1A1) | (1 << WGM11);
//   //TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS11);  // Prescaler = 8
//   TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);  // Prescaler = 1024 => Fpwm = (16MHz / 500) = 32 KHz

//   ICR1 = 499;     // For 4 kHz (16MHz / (1 * 500))
//   sei();

//   setupRegisterBus();

//   // /////////// BOOOTING ////////////////

//   // // DEFAULT NUMBER SHOWN

//   // delay(2000);

//   // delay(3000);

//   DIGITS[0] = NUM_SYMBOL_BYTES[0];
//   showDigits();
//   // OCR1A = 64;

//   // delay(3000);

//   // DIGITS[1] = NUM_SYMBOL_BYTES[2];
//   // showDigits();

//   // delay(3000);

//   // DIGITS[2] = NUM_SYMBOL_BYTES[0];
//   // showDigits();

//   // delay(3000);

//   // DIGITS[3] = NUM_SYMBOL_BYTES[3];
//   // showDigits();

//   // delay(3000);

//   // cli();

//   // ////////////////////////////////////

//   // // Reset Timer2 control registers
//   // TCCR2A = 0;
//   // TCCR2B = 0;
//   // TCNT2  = 0;              // Ensure counter starts at 0

//   // // CTC mode: Clear Timer on Compare match (WGM21=1)
//   // TCCR2A |= (1 << WGM21);  // WGM22:0 = 010

//   // // Set prescaler = 64  (CS22=1, CS21=1, CS20=0)
//   // TCCR2B |= (1 << CS22) | (1 << CS21);

//   // // Set compare match register for 1 kHz
//   // OCR2A = 249;

//   // // Enable Timer2 Compare Match A interrupt
//   // TIMSK2 |= (1 << OCIE2A);

//   // // Enable interrupts
//   // sei();

//   // //////////////// User Controls //////////

//   // setupUserControls();
// }

// bool last_lbutton_state = RELEASED;
// bool last_rbutton_state = RELEASED;

// bool was_lbutton_longpressed = false;
// bool was_rbutton_longpressed = false;

// bool lbutton_debouncing = false;
// bool rbutton_debouncing = false;

// uint16_t lbutton_longpress_timer = 0;
// uint16_t rbutton_longpress_timer = 0;

// uint16_t timer_counter = 0; // Counts to 60 000 - 1 minute.

// uint8_t lbutton_debounce_timer = 0;
// uint8_t rbutton_debounce_timer = 0;

// ISR(TIMER2_COMPA_vect) {
//   if (edit_mode) {
//     blink_timer_counter++;
//     if (blink_timer_counter >= 200) {
//       toggleNumitronSegment(selected_digit, SEGMENT_DP);
//       blink_timer_counter = 0;
//     }
//   }

//   if (number_transition) {
//     if (DUTY_CYCLE_REG >= configured_brightness) {
//       stopNumberTransition();
//     } else {
//       brightness_counter++;
//       if (brightness_counter >= (NUMBER_TRANS_DUR / configured_brightness)) {
//         setBrightness(DUTY_CYCLE_REG + 1);
//       }
//     }
//   }

//   if (lbutton_debouncing && lbutton_debounce_timer < 255) { lbutton_debounce_timer++; }
//   if (rbutton_debouncing && rbutton_debounce_timer < 255) { rbutton_debounce_timer++; }

//   if (last_lbutton_state == PRESSED && lbutton_longpress_timer < 65535) {
//     lbutton_longpress_timer++;
//     if (lbutton_longpress_timer > LONG_PRESS_THRESH) {
//       was_lbutton_longpressed = true;
//       onLeftButtonLongPressed();
//     }
//   }

//   if (last_rbutton_state == PRESSED && rbutton_longpress_timer < 65535) {
//     rbutton_longpress_timer++;
//     if (rbutton_longpress_timer > LONG_PRESS_THRESH) {
//       was_rbutton_longpressed = true;
//       onRightButtonLongPressed();
//     }
//   }

//   timer_counter++;
//   if (timer_counter >= 255) {//30000) {
//     // Serial.println(analogRead(A0));
//     //onNewMinute();
//     timer_counter = 0;
//   }
// }

// //////////////////////////////
// /// CONTROLS
// //////////////////////////////

// bool were_both_buttons_pressed = false;

// // Horizontalny posun
// void onLeftButtonPressed() {
//   // Serial.println("> ON LEFT BUTTON PRESSED");
// }

// void onLeftButtonReleased() {
//   lbutton_longpress_timer = 0;
//   // Serial.println("< ON LEFT BUTTON RELEASED");
//   if (were_both_buttons_pressed || was_lbutton_longpressed) {
//     was_lbutton_longpressed = false;
//     return;
//   } // Ignorujme ak sme drzali obe tlacidla

//   if (!edit_mode) {
//     enterEditMode();
//     return;
//   }

//   setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
// }

// void onLeftButtonLongPressed() {
//   // Serial.println(">>> ON LEFT BUTTON LONG PRESSED");
//   lbutton_longpress_timer -= 5;
//   if (configured_brightness > 0) {
//     configBrightness(configured_brightness -1);
//   }
// }

// // Vertykalny posun
// void onRightButtonPressed() {
//   // Serial.println("< ON RIGHT BUTTON PRESSED");
// }

// void onRightButtonReleased() {
//   rbutton_longpress_timer = 0;
//   // Serial.println("< ON RIGHT BUTTON RELEASED");
//   if (were_both_buttons_pressed || was_rbutton_longpressed) {
//     was_rbutton_longpressed = false;
//     return;
//   } // Ignorujme ak sme drzali obe tlacidla

//   if (!edit_mode) {
//     enterEditMode();
//     return;
//   }

//   byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
//   selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
//   DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
//   showDigits();
// }

// void onRightButtonLongPressed() {
//   // Serial.println(">>> ON RIGHT BUTTON LONG PRESSED");
//   rbutton_longpress_timer -= 5;
//   if (configured_brightness < MAX_BRIGHTNESS) {
//     configBrightness(configured_brightness + 1);
//   }
// }

// void onBothButtonsPressed() {
//   were_both_buttons_pressed = true;
//   if (edit_mode) {
//     exitEditMode();
//   }
// }

// void loop() {
//   bool read_lbutton_state = digitalRead(LEFT_BUTTON);
//   if (read_lbutton_state != last_lbutton_state && !lbutton_debouncing) {
//     // Stav tlacidla sa zmenil, spustime pocitadlo.
//     lbutton_debounce_timer = 0;
//     lbutton_debouncing = true;
//   } else if (lbutton_debouncing && lbutton_debounce_timer > 10) {
//     lbutton_debouncing = false;
//     if (read_lbutton_state != last_lbutton_state) {
//       last_lbutton_state = read_lbutton_state;
//       // Vypada ze to myslia vazne
//       if (read_lbutton_state == PRESSED) {
//         onLeftButtonPressed();
//       } else {
//         onLeftButtonReleased();
//       }
//     }
//   }

//   bool read_rbutton_state = digitalRead(RIGHT_BUTTON);
//   if (read_rbutton_state != last_rbutton_state && !rbutton_debouncing) {
//     // Stav tlacidla sa zmenil, spustime pocitadlo.
//     rbutton_debounce_timer = 0;
//     rbutton_debouncing = true;
//   } else if (rbutton_debouncing && rbutton_debounce_timer > 10) {
//     rbutton_debouncing = false;
//     if (read_rbutton_state != last_rbutton_state) {
//       last_rbutton_state = read_rbutton_state;
//       // Vypada ze to myslia vazne
//       if (read_rbutton_state == PRESSED) {
//         onRightButtonPressed();
//       } else {
//         onRightButtonReleased();
//       }
//     }
//   }

//   if (last_rbutton_state == PRESSED && last_lbutton_state == PRESSED) {
//     onBothButtonsPressed();
//   } else if (last_rbutton_state == RELEASED && last_lbutton_state == RELEASED) {
//     were_both_buttons_pressed = false; // Cleanup after all buttons were released.
//   }
// }

#include <EEPROM.h>

// TODO: Automatically exit edit mode after some time has elapsed (1 min?).

#define LEFT_BUTTON       3
#define RIGHT_BUTTON      2

#define _G                9
#define SERIN             8

#define RCK               12
#define SRCK              11

#define SEGMENT_DP        7

#define DIGIT_COUNT       4

#define NUMBER_TRANS_DUR  500 // ms
#define MAX_BRIGHTNESS    255
#define NUMBER_TRANS_PER  (NUMBER_TRANS_DUR / MAX_BRIGHTNESS)

#define DIGIT_MIN_UNITS   3
#define DIGIT_MIN_TENS    2
#define DIGIT_HOR_UNITS   1
#define DIGIT_HOR_TENS    0

#define DIGIT_MASK        0b01111111 // Na zamaskovanie neciselnych segmentov

#define ON                1
#define OFF               0

#define PRESSED           0
#define RELEASED          1

#define NUM_SYMBOL_COUNT  10

const byte NUM_SYMBOL_BYTES[] = // pole pre 10 bajtov (10x znakov)
{
  //53489672
  // 0b01111110, // bajt reprezentujuci kombinaciu H/L na pinoch pre znaku 0
  // 0b00001100, // znak 1
  // 0b10110110, // znak 2
  // 0b10011110,
  // 0b11001100,
  // 0b11011010,
  // 0b11111010,
  // 0b00001110,
  // 0b11111110,
  // 0b11011110,

  //23456789
  0b01111011, //0 - 3, 4, 5, 6, 8, 9
  0b01100000, //1 - 3, 4
  0b01010111, //2 - 3, 5, 7, 8, 9
  0b01110110, //3 - 3, 4, 5, 7, 8
  0b01101100, //4 - 3, 4, 6, 7
  0b00111110, //5 - 4, 5, 6, 7, 8
  0b00111111, //6 - 4, 5, 6, 7, 8, 9
  0b01110000, //7 - 3, 4, 5
  0b01111111, //8 - 3, 4, 5, 6, 7, 8, 9
  0b01111110, //9 - 3, 4, 5, 6, 7, 8
};

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
volatile byte DIGITS[] = {
  0, 0, 0, 0
};

volatile bool edit_mode = false;
volatile uint8_t selected_digit = 0; // V zaklade mame vybratu prvu cifru.

volatile uint8_t configured_brightness = MAX_BRIGHTNESS / 2; // For real applied brightness check the OCR1A register
volatile bool number_transition = false;

volatile uint8_t blink_timer_counter = 0;
volatile uint16_t brightness_counter = 0;

volatile uint16_t minutes_count = 0;

volatile bool starting_up = true;


void enterEditMode() {
  edit_mode = true;
  blink_timer_counter = 0;
  setNumitronSegment(selected_digit, SEGMENT_DP, ON);
}

void exitEditMode() {
  edit_mode = false;
  blink_timer_counter = 0;
  setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
}

uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
  byte masked_digit = DIGITS[digit] & DIGIT_MASK;
  for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
    if (NUM_SYMBOL_BYTES[num_symbol_index] == masked_digit) {
      return num_symbol_index;
    }
  }

  return 0;
}

void startNumberTransition() {
  number_transition = true;
  setBrightness(0);
  brightness_counter = 0;
}

void stopNumberTransition() {
  number_transition = false;
  brightness_counter = 0;
}

void configBrightness(uint8_t value) {
  configured_brightness = value;
  setBrightness(configured_brightness);
}

void setBrightness(uint8_t value) {
  OCR1A = 500 - value;
  // analogWrite(_G, 500 - value);
}

// Pre nastavovanie jednotlivych segementov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
  if (state) {
    DIGITS[digit] |= (1 << index);
  } else {
    DIGITS[digit] &= ~(1 << index);
  }
  digitalWrite(RCK, LOW);
  putDigits();
  digitalWrite(RCK, HIGH);
}

void toggleNumitronSegment(uint8_t digit, uint8_t index) {
  setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
}

// void onEditButtonPressed() {
//   if (!edit_mode) {
//     enterEditMode();
//   }
// }

void setSelectedDigit(uint8_t digit) {
  setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
  blink_timer_counter = 0;
  setNumitronSegment(digit, SEGMENT_DP, ON);
  selected_digit = digit;
}

void putDigits() {
  uint8_t digit = DIGIT_COUNT;
  while (digit--) { shiftOut(SERIN, SRCK, LSBFIRST, DIGITS[digit]); }
}

void displayTime() {
  uint8_t minutes = minutes_count % 60;
  uint8_t minutes_units = minutes % 10;
  uint8_t minutes_tens = minutes / 10;

  uint8_t hours = minutes_count / 60;
  uint8_t hours_units = hours % 10;
  uint8_t hours_tens = hours / 10;

  if (!edit_mode || selected_digit != DIGIT_MIN_UNITS) { DIGITS[DIGIT_MIN_UNITS] = NUM_SYMBOL_BYTES[minutes_units]; }
  if (!edit_mode || selected_digit != DIGIT_MIN_TENS) { DIGITS[DIGIT_MIN_TENS] = NUM_SYMBOL_BYTES[minutes_tens]; }
  if (!edit_mode || selected_digit != DIGIT_HOR_UNITS) { DIGITS[DIGIT_HOR_UNITS] = NUM_SYMBOL_BYTES[hours_units]; }
  if (!edit_mode || selected_digit != DIGIT_HOR_TENS) { DIGITS[DIGIT_HOR_TENS] = NUM_SYMBOL_BYTES[hours_tens]; }

  // DIGITS[0] = NUM_SYMBOL_BYTES[minutes_units];
  // DIGITS[1] = NUM_SYMBOL_BYTES[minutes_units];
  // DIGITS[2] = NUM_SYMBOL_BYTES[minutes_units];
  // DIGITS[3] = NUM_SYMBOL_BYTES[minutes_units];
  showDigits();
}

void onNewMinute() {
  minutes_count++;
  if (minutes_count >= 1440) {
    minutes_count = 0; // Reset back to 00:00 at 23:59
  }

  displayTime();
}

void showDigits() {
  digitalWrite(RCK, LOW);
  putDigits();
  startNumberTransition();
  digitalWrite(RCK, HIGH);
  delay(1000);
  digitalWrite(RCK, LOW);
}

void setup() {
  Serial.begin(9600);

  //////////////// Konfiguracia PWM //////////////////

  cli(); // 
  // Stop Timer1
  TCCR1A = 0;
  TCCR1B = 0;

  // Set Fast PWM mode with ICR1 as TOP
  TCCR1A = (1 << COM1A1) | (1 << WGM11);
  //TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS11);  // Prescaler = 8
  TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);  // Prescaler = 1 => Fpwm = (16MHz / 500) = 32 KHz

  ICR1 = 499;  // Nastavime hranicu pocitadla (koniec periody)
  setBrightness(0); // Nastavime hodnotu preklopenia cyklu
  sei();

  pinMode(_G, OUTPUT);

  //////////////// Pull-up Buttons //////////

  pinMode(LEFT_BUTTON, INPUT_PULLUP);
  pinMode(RIGHT_BUTTON, INPUT_PULLUP);

  // pinMode(A0, INPUT);
  // digitalWrite(A0, LOW);

  //////////////// Register Serial //////////

  pinMode(SRCK, OUTPUT); //set pins to output so you can control the shift register
  pinMode(RCK, OUTPUT); //set pins to output so you can control the shift register
  pinMode(SERIN, OUTPUT);

  delay(1000);

  putDigits();

  /////////// BOOOTING ////////////////

  // putDigits();

  // setBrightness(configured_brightness);

  // sei
    // DEFAULT NUMBER SHOWN

  DIGITS[0] = NUM_SYMBOL_BYTES[2];
  showDigits();

  // delay(3000);

  DIGITS[1] = NUM_SYMBOL_BYTES[0];
  showDigits();

  // delay(3000);

  DIGITS[2] = NUM_SYMBOL_BYTES[3];
  showDigits();

  // delay(3000);

  DIGITS[3] = NUM_SYMBOL_BYTES[0];
  showDigits();

  // delay(3000);

  // cli();

  ////////////////////////////////////

  // Reset Timer2 control registers
  TCCR2A = 0;
  TCCR2B = 0;
  TCNT2  = 0;              // Ensure counter starts at 0

  // CTC mode: Clear Timer on Compare match (WGM21=1)
  TCCR2A |= (1 << WGM21);  // WGM22:0 = 010

  // Set prescaler = 64  (CS22=1, CS21=1, CS20=0)
  TCCR2B |= (1 << CS22) | (1 << CS21);

  // Set compare match register for 1 kHz
  OCR2A = 249;

  // Enable Timer2 Compare Match A interrupt
  TIMSK2 |= (1 << OCIE2A);

  // Enable interrupts
  // sei();
}

bool last_lbutton_state = RELEASED;
bool last_rbutton_state = RELEASED;

bool was_lbutton_longpressed = false;
bool was_rbutton_longpressed = false;

bool lbutton_debouncing = false;
bool rbutton_debouncing = false;

uint16_t lbutton_longpress_timer = 0;
uint16_t rbutton_longpress_timer = 0;

uint16_t timer_counter = 0; // Counts to 60 000 - 1 minute.

uint8_t lbutton_debounce_timer = 0;
uint8_t rbutton_debounce_timer = 0;

ISR(TIMER2_COMPA_vect) {
  if (edit_mode) {
    blink_timer_counter++;
    if (blink_timer_counter >= 200) {
      toggleNumitronSegment(selected_digit, SEGMENT_DP);
      blink_timer_counter = 0;
    }
  }

  if (number_transition) {
    if ((500 - OCR1A) >= configured_brightness) {
      stopNumberTransition();
    } else {
      brightness_counter++;
      if (brightness_counter >= NUMBER_TRANS_PER) {
        setBrightness((500 - OCR1A) + 1);
        brightness_counter = 0;
      }
    }
  }

  if (lbutton_debouncing && lbutton_debounce_timer < 255) { lbutton_debounce_timer++; }
  if (rbutton_debouncing && rbutton_debounce_timer < 255) { rbutton_debounce_timer++; }

  if (last_lbutton_state == PRESSED) {
    lbutton_longpress_timer++;
    if (lbutton_longpress_timer > 200) {
      was_lbutton_longpressed = true;
      onLeftButtonLongPressed();
    } else {
      lbutton_longpress_timer++;
    }
  }

  if (last_rbutton_state == PRESSED) {
    if (rbutton_longpress_timer > 200) {
      was_rbutton_longpressed = true;
      onRightButtonLongPressed();
    } else {
      rbutton_longpress_timer++;
    }
  }

  if (was_rbutton_longpressed && was_lbutton_longpressed) {
    // onBothButtonsLongPressed();
  }

  timer_counter++;
  if (timer_counter >= 255) {//30000) {
    // onNewMinute();
    timer_counter = 0;
  }
}

//////////////////////////////
/// CONTROLS
//////////////////////////////

bool were_both_buttons_pressed = false;

// Horizontalny posun
void onLeftButtonPressed() {
  // Serial.println("> ON LEFT BUTTON PRESSED");
}

void onLeftButtonReleased() {
  lbutton_longpress_timer = 0;
  // Serial.println("< ON LEFT BUTTON RELEASED");
  if (were_both_buttons_pressed || was_lbutton_longpressed) {
    was_lbutton_longpressed = false;
    return;
  } // Ignorujme ak sme drzali obe tlacidla

  if (edit_mode) {
    setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
  } else if (!was_lbutton_longpressed) {
    configBrightness(configured_brightness - MAX_BRIGHTNESS * 0.2);
  }
}

void onLeftButtonLongPressed() {
  // Serial.println(">>> ON LEFT BUTTON LONG PRESSED");
  lbutton_longpress_timer -= 5;
  if (edit_mode) {
    setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
    rbutton_longpress_timer -= 100;
  } else if (configured_brightness > 0) {
    configBrightness(configured_brightness -1);
  }
}

// Vertykalny posun
void onRightButtonPressed() {
  // Serial.println("< ON RIGHT BUTTON PRESSED");
}

void onRightButtonReleased() {
  rbutton_longpress_timer = 0;
  Serial.println("< ON RIGHT BUTTON RELEASED");
  if (were_both_buttons_pressed || was_rbutton_longpressed) {
    was_rbutton_longpressed = false;
    return;
  } // Ignorujme ak sme drzali obe tlacidla

  if (edit_mode) {
    byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
    selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
    DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
    showDigits();
  } else if (!was_rbutton_longpressed) {
    configBrightness(configured_brightness + MAX_BRIGHTNESS * 0.2);
  }
}

void onRightButtonLongPressed() {
  Serial.println(">>> ON RIGHT BUTTON LONG PRESSED");
  rbutton_longpress_timer -= 5;
  if (edit_mode) {
    byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
    selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
    DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
    showDigits();
    rbutton_longpress_timer -= 100;
  } else if (configured_brightness < MAX_BRIGHTNESS) {
    // configBrightness(configured_brightness + 1);
    DIGITS[0] = 0b11111111;
    DIGITS[1] = 0b11111111;
    DIGITS[2] = 0b11111111;
    DIGITS[3] = 0b11111111;
    showDigits();
  }
}

void onBothButtonsPressed() {
  // Serial.println("On both buttons long pressed");
  were_both_buttons_pressed = true;
  // if (edit_mode) {
  //   exitEditMode();
  // } else {
  //   enterEditMode();
  // }
}

void onBothButtonsReleased() {
  // Serial.println("On both buttons long pressed");
  if (edit_mode) {
    DIGITS[0] = 0b11111111;
    DIGITS[1] = 0b11111111;
    DIGITS[2] = 0b11111111;
    DIGITS[3] = 0b11111111;
    showDigits();
  } else {
    enterEditMode();
  }
}

// void onBothButtonsLongPressed() {
//   Serial.println("On both buttons long pressed");
//   // Diagnostika
//   DIGITS[0] = 0b11111111;
//   DIGITS[1] = 0b11111111;
//   DIGITS[2] = 0b11111111;
//   DIGITS[3] = 0b11111111;
//   showDigits();
// }

void loop() {
  bool read_lbutton_state = digitalRead(LEFT_BUTTON);
  if (read_lbutton_state != last_lbutton_state && !lbutton_debouncing) {
    // Stav tlacidla sa zmenil, spustime pocitadlo.
    lbutton_debounce_timer = 0;
    lbutton_debouncing = true;
  } else if (lbutton_debouncing && lbutton_debounce_timer > 10) {
    lbutton_debouncing = false;
    if (read_lbutton_state != last_lbutton_state) {
      last_lbutton_state = read_lbutton_state;
      // Vypada ze to myslia vazne
      if (read_lbutton_state == PRESSED) {
        onLeftButtonPressed();
      } else {
        onLeftButtonReleased();
      }
    }
  }

  bool read_rbutton_state = digitalRead(RIGHT_BUTTON);
  if (read_rbutton_state != last_rbutton_state && !rbutton_debouncing) {
    // Stav tlacidla sa zmenil, spustime pocitadlo.
    rbutton_debounce_timer = 0;
    rbutton_debouncing = true;
  } else if (rbutton_debouncing && rbutton_debounce_timer > 10) {
    rbutton_debouncing = false;
    if (read_rbutton_state != last_rbutton_state) {
      last_rbutton_state = read_rbutton_state;
      // Vypada ze to myslia vazne
      if (read_rbutton_state == PRESSED) {
        onRightButtonPressed();
      } else {
        onRightButtonReleased();
      }
    }
  }

  if (last_rbutton_state == PRESSED && last_lbutton_state == PRESSED) {
    onBothButtonsPressed();
  } else if (last_rbutton_state == RELEASED && last_lbutton_state == RELEASED && were_both_buttons_pressed) {
    onBothButtonsReleased();
    were_both_buttons_pressed = false; // Cleanup after all buttons were released.
  }
}