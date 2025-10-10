//
//  www.blinkenlight.net
//
//  Copyright 2016 Udo Klein
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program. If not, see http://www.gnu.org/licenses/

//     Clock State Statistics
//       0 useless : 419
//       1 dirty   : 38
//       2 free    : 0
//       3 unlocked: 0
//       4 locked  : 0
//       5 synced  : 543

// "useless" is the startup state. The "dirty" state is the transitional state where it is almost synced.
// The decoded time may or may not be good.
// "synced" is the most desirable state because it is decoding properly and phase locked to DCF77.

// The second best state is "locked".
// Although the data decoders fail to figure out the decoded time the clock can still keep a phase lock with DCF77.
// Unless a leap second happens it will still be in fully in sync with DCF77.
// The third best state is "unlocked". The clock lost even the phase lock.
// However the event is not that long ago. In particular the clock assumes it did not drift away from DCF77 more than 1/3 second.
// It is possible for the clock to transition from "unlocked" to "locked" directly.

// Finally there is "free". This indicates that the clock synced at least once but
// currently it is neither synced not phase locked and the last lock was quite a while ago.
// The only way to get into a better state is a proper sync.

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <avr/sleep.h>
#include <stdint.h>
#include <math.h>

#include <Arduino.h>
#include <EEPROM.h>
#include <Wire.h>
#include <RTCLib.h>
#include <INA219.h>

#define CUSTOM_TIMER2_HANDLER 1
#include <dcf77.h>


// LiquidCrystal_I2C lcd(0x27, 20, 4);

const uint8_t dcf77_analog_sample_pin = A3;
const uint8_t dcf77_monitor_led = 9;  // A4 == d18
const uint8_t dcf77_pon_pin = 13;


uint8_t sample_input_pin() {
    const uint8_t sampled_data = analogRead(dcf77_analog_sample_pin) > 200;

    digitalWrite(dcf77_monitor_led, sampled_data);
    return sampled_data;
}

void setup() {
    using namespace Clock;

    // lcd.init();
    // lcd.clear();
    // lcd.backlight();

    // PON TURN ON
    pinMode(dcf77_pon_pin, OUTPUT);
    digitalWrite(dcf77_pon_pin, LOW);

    pinMode(dcf77_analog_sample_pin, INPUT);
    digitalWrite(dcf77_analog_sample_pin, LOW);

    // pinMode(10, OUTPUT);
    // digitalWrite(10, HIGH);

    Serial.begin(9600);

    sprintln();
    sprintln(F("Simple DCF77 Clock V3.1.1"));
    sprintln(F("(c) Udo Klein 2016"));
    sprintln(F("www.blinkenlight.net"));
    sprintln();
    sprint(F("Monitor Pin:     ")); sprintln(dcf77_monitor_led);
    sprintln();
    sprintln();
    sprintln(F("Initializing..."));

    pinMode(dcf77_monitor_led, OUTPUT);

    DCF77_Clock::setup();
    DCF77_Clock::set_input_provider(sample_input_pin);

    // Wait till clock is synced, depending on the signal quality this may take
    // rather long. About 5 minutes with a good signal, 30 minutes or longer
    // with a bad signal
    for (uint8_t state = Clock::useless;
        state == Clock::useless || state == Clock::dirty;
        state = DCF77_Clock::get_clock_state()) {

        // wait for next sec
        Clock::time_t now;
        DCF77_Clock::get_current_time(now);

        // render one dot per second while initializing
        static uint8_t count = 0;
        // if (count % 20 == 0) {
        //     lcd.setCursor(0, count / 20);
        // }
        // lcd.print(".");
        switch (state) {
            case Clock::useless: sprint(F("useless ")); break;
            case Clock::dirty:   sprint(F("dirty:  ")); break;
            case Clock::synced:  sprint(F("synced: ")); break;
            case Clock::locked:  sprint(F("locked: ")); break;
        }
        // sprint('.');
        ++count;
        if (count == 60) {
            count = 0;
            sprintln();
            // lcd.clear();
        }
    }

    pinMode(10, OUTPUT);
    digitalWrite(10, HIGH);

    pinMode(dcf77_pon_pin, INPUT); // TURN OF THE MODULE
}

void paddedPrint(BCD::bcd_t n) {
    sprint(n.digit.hi);
    sprint(n.digit.lo);
}

// void lcdPaddedPrint(BCD::bcd_t n) {
//     lcd.print(n.digit.hi);
//     lcd.print(n.digit.lo);
// }

void loop() {
    Clock::time_t now;

    DCF77_Clock::get_current_time(now);
    if (now.month.val > 0) {
        // switch (DCF77_Clock::get_clock_state()) {
        //     case Clock::useless: sprint(F("useless ")); lcd.print(F("useless ")); break;
        //     case Clock::dirty:   sprint(F("dirty:  ")); lcd.print(F("dirty:  ")); break;
        //     case Clock::synced:  sprint(F("synced: ")); lcd.print(F("dirty:  ")); break;
        //     case Clock::locked:  sprint(F("locked: ")); lcd.print(F("dirty:  ")); break;
        // }

        // // LCD
        // lcd.print(' ');

        // lcd.print(F("20"));
        // lcdPaddedPrint(now.year);
        // lcd.print('-');
        // lcdPaddedPrint(now.month);
        // lcd.print('-');
        // lcdPaddedPrint(now.day);
        // lcd.print(' ');

        // lcdPaddedPrint(now.hour);
        // lcd.print(':');
        // lcdPaddedPrint(now.minute);
        // lcd.print(':');
        // lcdPaddedPrint(now.second);

        // lcd.print("+0");
        // lcd.print(now.uses_summertime? '2': '1');
        // lcd.home();

        // Serial
        sprint(' ');

        sprint(F("20"));
        paddedPrint(now.year);
        sprint('-');
        paddedPrint(now.month);
        sprint('-');
        paddedPrint(now.day);
        sprint(' ');

        paddedPrint(now.hour);
        sprint(':');
        paddedPrint(now.minute);
        sprint(':');
        paddedPrint(now.second);

        sprint("+0");
        sprint(now.uses_summertime? '2': '1');
        sprintln();
    }
}
