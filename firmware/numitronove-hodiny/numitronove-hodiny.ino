#include <EEPROM.h>

// DDRD
#define LEFT_BUTTON       3
#define RIGHT_BUTTON      2

// DDRB
#define _G                (9 - 8)
#define SERIN             (8 - 8)
#define RCK               (12 - 8)
#define SRCK              (11 - 8)

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

#define EDIT_MODE_BLINK_F 200 // ms

#define LONG_PRESS_DELAY  200 // ms

#define ON                1
#define OFF               0

#define PRESSED           0
#define RELEASED          1

#define NUM_SYMBOL_COUNT  10

#define MAX_MINUTES_COUNT 24 * 60

#define BIS(reg, bit)     (reg & (1 << bit))
#define SBI(reg, bit)     (reg |= (1 << bit))
#define CBI(reg, bit)     (reg &= ~(1 << bit))

#define NOP __asm__ __volatile__ ("nop\n\t")

///////////////////////////

// Adresy nastaveni v EEPROM
enum CONFIG {
  HOURS,
  MINUTES,
  BRIGHTNESS,
  GENERAL, // Pozicie bitov podla CONFIG_GENERAL
};

// Indexi bitov v bajte vseobecnych nastaveni (GENERAL)
// Ich pocet by mal byt nasobok 4 aby sme mohli ich zobrazit na jeden krat (jednu na kazdy numitron).
enum CONFIG_GENERAL {
  M12_24, // Prepinanie medzi 12 a 24 hodinovym rezimom.
  TRAILLING_ZERO, // Ma sa zobrazovat prva nula (desiatky hodin)?

  // Zatial neimplementovane kvoli letnemu casu.
  // Ked sa budu hodiny synchronizovat cez DCF77, budu vediet automaticky
  // prepinat medzi letnym a zimnym casom (v lete chceme prepinat do nocneho rezimu neskor ako v zime).
  NIGHT_MODE_ENABLED,
  NIGHT_MODE_TYPE,
};

// Prvy bit urcuje ci bolo nastavenie uz nacitane z EEPROM.
// Kedze EEPROM citanie je pomale a zapisovanie ju opotrebovava
// (okolo 100 000 zapisov a mazani podla dokumentacie).
byte LAZY_EE[] = {
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

// Byte pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const byte NUM_SYMBOL_BYTES[] = {
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
volatile byte DIGITS[] = {0, 0, 0, 0};

volatile bool edit_mode = false;
volatile bool diagnostics_mode = false;
volatile uint8_t selected_digit = 0; // V zaklade mame vybratu prvu cifru.

volatile uint8_t configured_brightness = MAX_BRIGHTNESS / 2; // Pre aplikovaný jas pozri register OCR1A
volatile bool number_transition = false;

volatile uint8_t blink_timer_counter = 0;
volatile uint16_t brightness_counter = 0;

volatile uint16_t minutes_count = 0;

////////////////////////////////////

byte getEEConfig(uint8_t address) {
  if (!BIS(LAZY_EE[address], 7)) { // Nastavenie este nie je nacitane
    LAZY_EE[address] = EEPROM.read(address);
    SBI(LAZY_EE[address], 7);
  }

  return (LAZY_EE[address] & ~(1 << 7)); // Ignorujme najvacsi bit aby nezkresloval hodnotu
}

// Nastavi hodnotu na adrese v LAZY_EE a zapise do EEPROM.
void setEEConfig(uint8_t address, byte value) {
  if (getEEConfig(address) != value) { // Overme ci naozaj je treba hodnotu prenastavovat
    LAZY_EE[address] = value;
    SBI(LAZY_EE[address], 7);
    EEPROM.write(address, LAZY_EE[address]);
  }
}

void saveEEConfig() {
  setEEConfig(BRIGHTNESS, configured_brightness);
}

void enterEditMode() {
  edit_mode = true;
  blink_timer_counter = 0;
  setNumitronSegment(selected_digit, SEGMENT_DP, ON);
}

void exitEditMode() {
  edit_mode = false;
  blink_timer_counter = 0;
  setNumitronSegment(selected_digit, SEGMENT_DP, OFF);

  // Vysli sme s nastavovacieho rezimu - ulozme zmeny
  saveEEConfig();
}

// Skonvertuje byte reprezentujuci cislo zapisane v tvare 7 segmentovky na jeho index v zozname symbolov,
// takze nam staci si pamatat len symbol cisla pre zapis do registrov.
// Mozno by bolo lepsie si tento index niekde pamatat.
// Stacilo by pamatat si dve cisla: hodiny a minuty a vzdy ich prelozit pri zobrazovani.
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
}

// Pre nastavovanie jednotlivych segementov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
  if (state) {
    DIGITS[digit] |= (1 << index);
  } else {
    DIGITS[digit] &= ~(1 << index);
  }
  putDigitsToInputRegs();
  pushToOutputRegs(); // Bez postupneho prechodu.
}

void toggleNumitronSegment(uint8_t digit, uint8_t index) {
  setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
}

void setSelectedDigit(uint8_t digit) {
  setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
  blink_timer_counter = 0;
  setNumitronSegment(digit, SEGMENT_DP, ON);
  selected_digit = digit;
}

void putDigitsToInputRegs() {
  uint8_t digit = DIGIT_COUNT;
  while (digit--) { shiftOut(SERIN, SRCK, LSBFIRST, DIGITS[digit]); }
}

void displayTime() {
  // zobrazenim casu sa diagnostika vzdy vypne
  stopDiagnostics();

  uint8_t minutes = minutes_count % 60;
  uint8_t minutes_units = minutes % 10;
  uint8_t minutes_tens = minutes / 10;

  uint8_t hours = minutes_count / 60;
  uint8_t hours_units = hours % 10;
  uint8_t hours_tens = hours / 10;

  if (BIS(getEEConfig(GENERAL), M12_24)) {
    if (hours == 0) {
      hours = 12; // Pri 12 hod mode je polnoc 12:00
    } else if (hours > 12) {
      hours -= 12;
    }
  }

  if (!edit_mode || selected_digit != DIGIT_MIN_UNITS) { DIGITS[DIGIT_MIN_UNITS] = NUM_SYMBOL_BYTES[minutes_units]; }
  if (!edit_mode || selected_digit != DIGIT_MIN_TENS) { DIGITS[DIGIT_MIN_TENS] = NUM_SYMBOL_BYTES[minutes_tens]; }
  if (!edit_mode || selected_digit != DIGIT_HOR_UNITS) { DIGITS[DIGIT_HOR_UNITS] = NUM_SYMBOL_BYTES[hours_units]; }
  if (!edit_mode || selected_digit != DIGIT_HOR_TENS) {
    if (BIS(getEEConfig(GENERAL), TRAILLING_ZERO)) {
      DIGITS[DIGIT_HOR_TENS] = NUM_SYMBOL_BYTES[hours_tens];
    } else {
      DIGITS[DIGIT_HOR_TENS] = 0;
    }
  }

  showDigits();
}

void onNewMinute() {
  minutes_count++;
  if (minutes_count >= MAX_MINUTES_COUNT) {
    minutes_count = 0; // Zresetujme na 00:00 ked dosiahneme 24:00 (24 * 60)
  }

  // Cas pocitajme aj pocas diagnostiky ale nezobrazujme.
  if (!diagnostics_mode) {
    displayTime();
  }
}

void pushToOutputRegs() {
  SBI(PORTD, RCK); // Reaguje na nabeznu hranu.
  delay(1); // Aspon 100ns impulz
  CBI(PORTD, RCK);
}

void showDigits() {
  putDigitsToInputRegs();
  startNumberTransition();
  pushToOutputRegs();
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics() {
  diagnostics_mode = true;
  // Diagnostika
  DIGITS[0] = 0b11111111;
  DIGITS[1] = 0b11111111;
  DIGITS[2] = 0b11111111;
  DIGITS[3] = 0b11111111;
  showDigits();
}

void stopDiagnostics() {
  diagnostics_mode = false;
}

void setup() {
  // Serial pre debugovanie
  //Serial.begin(9600);

  //////////////// Konfiguracia PWM //////////////////

  cli(); // zakazeme docasne interupty
  // Zresetujeme nastavia registrov casovaca 1
  TCCR1A = 0;
  TCCR1B = 0;

  // COM1A1 pri rychlej PWM nastavi neinvertujuci rezim
  TCCR1A = (1 << COM1A1) | (1 << WGM11);
  // WGM11 | WGM12 | WMG13 -> rychla PWM kde ICR1 urcuje TOP
  // CS10 -> bez delica
  // Fpwm = (16MHz / 500) = 32kHz (nepocutelny rozsah)
  TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);

  ICR1 = 499;  // Nastavime hranicu pocitadla (koniec periody)
  setBrightness(0); // Nastavime hodnotu preklopenia cyklu (zatial sa bude preklapat okamzite)
  sei(); // opat povolime interupty

  //////////////// Zbernica Registrov //////////

  SBI(DDRB, SRCK);
  SBI(DDRB, RCK);
  SBI(DDRB, SERIN);
  SBI(DDRB, _G);

  /////////// BOOOTING ////////////////

  // Na par sekund zasvietime vsetky cifry v ramci diagnostiky pri starte.
  // V tomto pripade este pouzijeme predvolenu hodnotu jasu (teda polovicu z maxima),
  // pre pripad, ze by bola nastavena prilis mala hodnota jasu.
  startDiagnostics();

  delay(2000);

  stopDiagnostics();

  // Nacitajme ulozeny cas
  minutes_count = ((getEEConfig(HOURS) * 60) + (getEEConfig(MINUTES) * 60));
  configured_brightness = getEEConfig(BRIGHTNESS); // Ulozeny jas ktory sa pouzije pri prvom zobrazeni.
  displayTime(); // zobrazme ulozeny cas

  /// TODO: DCF77 synchronizacia z casom z atomovych hodin vo Frankfurte.

  ////////////////// CASOVAC //////////////////

  cli(); // docasne zakazeme interupty

  // Zresetujeme nastavia registrov casovaca 2
  TCCR2A = 0;
  TCCR2B = 0;

  // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
  TCCR2A |= (1 << WGM21);  // WGM22:0 = 010

  // CS22 -> Delic 64
  TCCR2B |= (1 << CS22);

  // Fcas = 16MHz / (64 x 250) = 1kHz
  OCR2A = 249; // nastavime limit casovaca

  // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
  TIMSK2 |= (1 << OCIE2A);
  TCNT2  = 0; // Zaciname pocitat od nuly.

  sei(); // opat povolime interupty

  //////////////// Tlacitka //////////

  CBI(DDRD, LEFT_BUTTON);
  SBI(PORTD, LEFT_BUTTON); // INPUT PULLUP
  CBI(DDRD, RIGHT_BUTTON);
  SBI(PORTD, RIGHT_BUTTON); // INPUT PULLUP
}

bool last_lbutton_state = RELEASED;
bool last_rbutton_state = RELEASED;

bool was_lbutton_longpressed = false;
bool was_rbutton_longpressed = false;

bool were_both_buttons_pressed = false;
bool were_both_buttons_long_pressed = false;

bool lbutton_debouncing = false;
bool rbutton_debouncing = false;

uint16_t lbutton_longpress_timer = 0;
uint16_t rbutton_longpress_timer = 0;

uint16_t timer_counter = 0; // Pocita do 60 000 - 1 minuta v ms

uint8_t lbutton_debounce_timer = 0;
uint8_t rbutton_debounce_timer = 0;

// Prerusenie sa spusti kazdu ms (1KHz)
ISR(TIMER2_COMPA_vect) {
  if (edit_mode) { // Ak sme v edit mode, blikaj desatinnou ciarkou.
    blink_timer_counter++;
    if (blink_timer_counter >= EDIT_MODE_BLINK_F) {
      toggleNumitronSegment(selected_digit, SEGMENT_DP);
      blink_timer_counter = 0;
    }
  }

  if (number_transition) { // Ak prechadzame z jednoho cisla na druhe, postupne zvysuj jas.
    if ((500 - OCR1A) >= configured_brightness) {
      stopNumberTransition(); // Dosiahli sme zvoleny jas, koniec prechodu.
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
    if (lbutton_longpress_timer > LONG_PRESS_DELAY) {
      was_lbutton_longpressed = true;
      onLeftButtonLongPressed();
    } else {
      lbutton_longpress_timer++;
    }
  }

  if (last_rbutton_state == PRESSED) {
    if (rbutton_longpress_timer > LONG_PRESS_DELAY) {
      was_rbutton_longpressed = true;
      onRightButtonLongPressed();
    } else {
      rbutton_longpress_timer++;
    }
  }

  // Ak su obe tlacitka dlho stlacene
  if (was_rbutton_longpressed && was_lbutton_longpressed) {
    onBothButtonsLongPressed();
  }

  timer_counter++;
  if (timer_counter >= 60000) {
    onNewMinute();
    timer_counter = 0;
  }
}

//////////////////////////////
/// CONTROLS
//////////////////////////////

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
    lbutton_longpress_timer -= 100;
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
  // Serial.println("< ON RIGHT BUTTON RELEASED");
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
  // Serial.println(">>> ON RIGHT BUTTON LONG PRESSED");
  rbutton_longpress_timer -= 5;
  if (edit_mode) {
    byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
    selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
    DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
    showDigits();
    rbutton_longpress_timer -= 100;
  } else if (configured_brightness < MAX_BRIGHTNESS) {
    configBrightness(configured_brightness + 1);
  }
}

void onBothButtonsPressed() {

}

void onBothButtonsReleased() {
  stopDiagnostics();

  if (!were_both_buttons_long_pressed) { // Reaguje len na obycajne kratke stlacenie
    if (edit_mode) { // Prepnime rezim.
      exitEditMode();
    } else {
      enterEditMode();
    }
  }
}

void onBothButtonsLongPressed() {
  were_both_buttons_long_pressed = true;
  if (!edit_mode) { // spustime diagnostiku len mimo editovacieho rezimu
    // Diagnostika na vyziadanie, zobrazujeme po celu dobu co su obe tlacidla dlho stlacene.
    startDiagnostics();
  }
}

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

  // "last_state" je v tomto pripade len debouncnuty "current_state"
  if (last_rbutton_state == PRESSED && last_lbutton_state == PRESSED) {
    onBothButtonsPressed(); // Obe tlacitka stlacene.
    were_both_buttons_pressed = true;
  } else if (
    (were_both_buttons_pressed || were_both_buttons_long_pressed) && // obe boli stlacene
    (last_rbutton_state == RELEASED || last_lbutton_state == RELEASED) // a teraz sa aspon jedno z nich pustilo
  ) {
    onBothButtonsReleased();
    were_both_buttons_pressed = false;
    were_both_buttons_long_pressed = false;
  }
}