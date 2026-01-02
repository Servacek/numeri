#include "clock.h"
#include "isr.h"
#include "peripherals.h"

//////////////////////////////

// Register aktualneho režimu.
uint8_t MODE = 0;
uint8_t FLAG = 0;

uint8_t t_counter_hours     = 0;
uint8_t t_counter_minutes   = 0;

//////////////////////////////


void setSelectedDigit(uint8_t digit) {
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF, false);

    // blink_timer_counter = 0;
    setNumitronSegment(digit, SEGMENT_DP, ON, true);
    selected_digit = digit;
}

void enterEditMode() {
    sprintln(F("enterEditMode"));
    SBI(MODE, MODE_EDIT);
    setSelectedDigit(selected_digit);

    loadPageConfig(cur_page_index);
}

void exitEditMode() {
    sprintln(F("exitEditMode"));
    // blink_timer_counter = 0;
    CBI(MODE, MODE_EDIT);
    // setSelectedDigit(selected_digit);

    savePageConfig(cur_page_index);

    cur_page_index = 0;
    timer_counter = 0; // 0 sekund

    displayTimeFromCounters(t_counter_minutes, t_counter_hours);
}

//////////////////////////////
/// CAS
//////////////////////////////

void addNewMinuteToCounters() {
    sprintln(F("addNewMinuteToCounters"));

    // Pocitame aj sami ak by nahodou neboli ziadne externe moduly k dispozicii.
    if (++t_counter_minutes >= MAX_MINUTES_COUNT) {
        t_counter_minutes = 0;
        if (++t_counter_hours >= MAX_HOURS_COUNT) {
            t_counter_hours = 0;
        }
    }
}

uint8_t updateTimeSourceFromTimeCounters() {
    if (DS3231_Present()) { // ak RTC_ENABLED nie je 1, toto vrati vzdy 0
        #if RTC_ENABLED
        RTC.adjust(DateTime(0, 0, 0, t_counter_hours, t_counter_minutes, 0));
        #endif
    }
}

uint8_t updateTimeCountersFromTimeSources() {
    const uint8_t _t_counter_hours      = t_counter_hours;
    const uint8_t _t_counter_minutes    = t_counter_minutes;

    if (DS3231_Present()) { // ak RTC_ENABLED nie je 1, toto vrati vzdy 0
        #if RTC_ENABLED
        const DateTime time_now = RTC.now();
        t_counter_hours     = time_now.hour();
        t_counter_minutes   = time_now.minute();
        #endif
    } else { // Skusime este dostat presny cas z DCF77 modulu.
        #if DCF77_ENABLED
        const uint8_t clock_state = DCF77_Clock::get_clock_state();
        if (clock_state == Clock::locked || clock_state == Clock::synced) {
            Clock::time_t now; DCF77_Clock::get_current_time(now);

            t_counter_hours = bcd_to_int(now.hour);
            t_counter_minutes = bcd_to_int(now.minute);
        }
        #else
            if (BIS(FLAG, FLAG_NEW_MINUTE)) {
                addNewMinuteToCounters();

                CBI(FLAG, FLAG_NEW_MINUTE);
            }
        #endif
    }

    return (t_counter_hours != _t_counter_hours || t_counter_minutes != _t_counter_minutes);
}

void timeLoadFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return; // ignore subsequent calls.
    }

    updateTimeCountersFromTimeSources();

    config_struct* page = CONFIG_PAGES[page_index];
    for (uint8_t digit_index = 0; digit_index < DIGIT_COUNT; digit_index++) {
        page[digit_index].value = getTimeDigitWithIndex(digit_index, t_counter_minutes, t_counter_hours);
    }
}

void timeSaveFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return; // ignore subsequent calls.
    }

    const config_struct* page = CONFIG_PAGES[page_index];
    t_counter_hours = page[0].value * 10 + page[1].value;
    t_counter_minutes = page[2].value * 10 + page[3].value;

    updateTimeSourceFromTimeCounters();
}


//////////////////////////////
/// RIESENIE VSTUPU
//////////////////////////////

void onLeftButtonReleased() {
    sprintln(F("LEFT BUTTON RELEASED"));
    if (BIS(MODE, MODE_EDIT)) {
        setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
        sprint(F("VYBRATY NUMITRON CISLO: "));
        sprintln(selected_digit);
    } else {
        configDisplayBrightness(MIN(
            _target_brightness, MAX_BRIGHTNESS - BRIGHTNESS_STEP
        ) + BRIGHTNESS_STEP);
    }
}

void onLeftButtonLongPressed() {
    sprint(F("LEFT BUTTON LONG PRESSED "));

    // Podrzanim akciu opakujeme.
    onLeftButtonReleased();
}

void onRightButtonReleased() {
    sprintln(F("RIGHT BUTTON RELEASED"));
    if (BIS(MODE, MODE_EDIT)) {
        // if (selected_digit == DIGIT_HOR_TENS || selected_digit == DIGIT_HOR_ONES) {
        //     const uint8_t hour_ones = t_counter_hours % 10;
        //     const uint8_t hour_tens = t_counter_hours / 10;
        //     if (selected_digit == DIGIT_HOR_TENS) {
        //         t_counter_hours = ((hour_tens + 1) % (MAX_HOURS_TENS + 1)) * 10 + hour_ones;
        //     } else if (selected_digit == DIGIT_HOR_ONES) {
        //         t_counter_hours = hour_tens * 10 + ((hour_ones + 1) % 10);
        //         if (t_counter_hours >= MAX_HOURS_COUNT) t_counter_hours = hour_tens * 10;
        //     }
        // } else if (selected_digit == DIGIT_MIN_TENS || selected_digit == DIGIT_MIN_ONES) {
        //     const uint8_t minute_ones = t_counter_minutes % 10;
        //     const uint8_t minute_tens = t_counter_minutes / 10;
        //     if (selected_digit == DIGIT_MIN_TENS) {
        //         t_counter_minutes = ((minute_tens + 1) % 6) * 10 + minute_ones;
        //     } else if (selected_digit == DIGIT_MIN_ONES) {
        //         t_counter_minutes = minute_tens * 10 + ((minute_ones + 1) % 10);
        //     }
        // }

        // displayTimeFromCounters(t_counter_minutes, t_counter_hours);

        // TODO: Tu treba nejako poriesit validaciu veci ako datum alebo cas.
        config_struct* selected_config = &CONFIG_PAGES[cur_page_index][selected_digit];
        if (selected_config->value < selected_config->max) {
            selected_config->value++;
        } else {
            selected_config->value = selected_config->min;
        }
        displayPage(cur_page_index); // aktualizujeme zobrazovane hodnoty.
    } else {
        configDisplayBrightness(MAX(_target_brightness, BRIGHTNESS_STEP) - BRIGHTNESS_STEP);
    }
}

void onRightButtonLongPressed() {
    sprint(F("RIGHT BUTTON LONG PRESSED "));

    // Podrzanim akciu opakujeme.
    onRightButtonReleased();
}

void onBothButtonsReleased() {
    sprintln(F("BOTH BUTTONS RELEASED"));
    savePageConfig(cur_page_index);

    if (cur_page_index >= (CONFIG_PAGE_COUNT - 1)) {
        sprintln(F("Posledna strana, ukoncujeme edit rezim..."));
        // Sme na poslednej strane nastaveni, teda ukoncme nastavovaci rezim.
        exitEditMode();
    } else {
        if (!BIS(MODE, MODE_EDIT)) {
            enterEditMode();
        } else {
            cur_page_index++;
            loadPageConfig(cur_page_index);
        }

        displayPage(cur_page_index);
    }
}

void onBothButtonsLongReleased() {
    sprintln(F("BOTH BUTTONS LONG RELEASED"));
    if (BIS(MODE, MODE_DIAG)) {
        stopDiagnostics();
        displayTimeFromCounters(t_counter_minutes, t_counter_hours);
    }
}

void onBothButtonsLongPressed() {
    sprintln(F("BOTH BUTTONS LONG PRESSED"));
    if (BIS(MODE, MODE_EDIT)) {
        exitEditMode();
    } else { // spustime diagnostiku len mimo editovacieho rezimu
        // Diagnostika na vyziadanie, zobrazujeme po celu dobu co su obe tlacidla dlho stlacene.
        startDiagnostics();
    }
}
