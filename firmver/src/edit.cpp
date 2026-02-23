#include "edit.h"
#include "isr.h"
#include "views.h"
#include "modules.h"

//////////////////////////////

uint8_t cur_page_index = 0;

//////////////////////////////
/// Edit rezim
//////////////////////////////

void setSelectedDigit(uint8_t digit) {
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF, false);
    setNumitronSegment(digit, SEGMENT_DP, ON, true);
    selected_digit = digit;
}

void enterEditMode() {
    sprintln(F("enterEditMode"));
    SBI(MODE, MODE_EDIT);
    setSelectedDigit(selected_digit);

    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
    cur_page_index = 0;

    Config::loadForPage(cur_page_index);
}

void exitEditMode() {
    sprintln(F("exitEditMode"));
    CBI(MODE, MODE_EDIT);

    // Ulozme este aktualnu stranku.
    Config::saveForPage(cur_page_index);

    cur_page_index = 0;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }

    displayTimeFromCounters(t_counter_minutes, t_counter_hours);
}

//////////////////////////////
/// Timeout editacneho rezimu
//////////////////////////////

// Volat z milisekundoveho handlera, po obsluhe tlacidiel.
// Vdaka tomu sa timeout vzdy vyhodnoti AZ po spracovani aktualnych stlaceni.
void tickEditMode() {
    if (!BIS(MODE, MODE_EDIT)) return;

    uint16_t t;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { t = timer_counter; }

    if (t >= EDIT_MODE_TIMEOUT) {
        sprintln(F("Ukončovanie editacneho režimu kvoli časovemu limitu..."));
        Config::loadForPage(cur_page_index); // Vymazeme neulozene zmeny...
        exitEditMode();
    }
}

//////////////////////////////
/// Config callbacks
//////////////////////////////

void timeLoadFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    updateTimeCountersFromTimeSources();

    for (uint8_t digit_index = 0; digit_index < DIGIT_COUNT; digit_index++) {
        Config::set(
            Config::toID(page_index, digit_index),
            getTimeDigitWithIndex(digit_index, t_counter_minutes, t_counter_hours)
        );
    }
}

void timeSaveFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    t_counter_hours   = Config::get(Config::toID(page_index, 0)) * 10
                      + Config::get(Config::toID(page_index, 1));
    t_counter_minutes = Config::get(Config::toID(page_index, 2)) * 10
                      + Config::get(Config::toID(page_index, 3));

    updateTimeSourceFromTimeCounters();
}

void onTimeSet(uint8_t page_index, uint8_t conf_index) {
    (void)page_index; // Nepouzivame
    // Overime ci cifra, ktoru uzivatel prave nastavil, nezrobila cas neplatnym.
    const uint8_t hours = Config::get(Config::TIME_HOURS_ONES)
                        + Config::get(Config::TIME_HOURS_TENS) * 10;
    sprint(F("HOURS: "));
    sprintln(hours);
    if (hours < MAX_HOURS_COUNT) {
        return; // Cas je platny.
    }

    // Cifra desiatok hodin moze byt bud od 0 do 2, alebo od 0 do 1
    // podla toho aku hodnotu ma cifra jednotiek hodin.
    if (conf_index == Config::indexInPage(Config::TIME_HOURS_TENS)) {
        Config::set(Config::TIME_HOURS_ONES, 3);
    } else if (conf_index == Config::indexInPage(Config::TIME_HOURS_ONES)) {
        Config::set(Config::TIME_HOURS_TENS, 1);
    }
}

// Days in each month — index 1-12. Month 0 unused, index 0 is a safe fallback.
PROGMEM static const uint8_t DAYS_IN_MONTH[] = {
    31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};

void onDateSet(uint8_t page_index, uint8_t conf_index) {
    (void)page_index; // Nepouzivame, ale callback musi byt
    const uint8_t day_tens   = Config::get(Config::DATE_DAY_D1);
    const uint8_t day_ones   = Config::get(Config::DATE_DAY_D2);
    const uint8_t month_tens = Config::get(Config::DATE_MONTH_D1);
    const uint8_t month_ones = Config::get(Config::DATE_MONTH_D2);

    uint8_t month = month_tens * 10 + month_ones;
    uint8_t day   = day_tens   * 10 + day_ones;

    if (month > 12) {
        Config::set(Config::DATE_MONTH_D2, 2);
        month = 12;
    }

    if (month == 0) {
        if (conf_index == Config::indexInPage(Config::DATE_MONTH_D1)) {
            Config::set(Config::DATE_MONTH_D2, 1);
        } else {
            Config::set(Config::DATE_MONTH_D1, 0);
            Config::set(Config::DATE_MONTH_D2, 1);
        }
        month = 1;
    }

    const uint16_t year = Modules::RTC.getYear() + 2000;
    const bool     is_leap =
        (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
    uint8_t max_day = pgm_read_byte(&DAYS_IN_MONTH[month]);
    if (month == 2 && is_leap)
        max_day = 29; // Pre priestupne roky.
    if (day == 0) {
        Config::set(Config::DATE_DAY_D1, 0);
        Config::set(Config::DATE_DAY_D2, 1);
    } else if (day > max_day) {
        Config::set(Config::DATE_DAY_D1, max_day / 10);
        Config::set(Config::DATE_DAY_D2, max_day % 10);
    }
}

void dateLoadFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return;
    } // Vykoname len raz pre kazdu stranku.

    // TODO: Toto by slo zrejme optimalizovat...
    const DateTime now = RTClib::now();
    const uint8_t month = now.month();
    const uint8_t day   = now.day();

    Config::set(Config::toID(page_index, 0), day / 10);
    Config::set(Config::toID(page_index, 1), day % 10);
    Config::set(Config::toID(page_index, 2), month / 10);
    Config::set(Config::toID(page_index, 3), month % 10);
}

void dateSaveFn(uint8_t page_index, uint8_t conf_index) {
    (void)page_index; // Nepouzivame
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    const DateTime now = RTClib::now();
    const uint8_t month = Config::get(Config::DATE_MONTH_D1) * 10 + Config::get(Config::DATE_MONTH_D2);
    const uint8_t day   = Config::get(Config::DATE_DAY_D1)   * 10 + Config::get(Config::DATE_DAY_D2);
    Modules::RTC.adjust(DateTime(now.year(), month, day, now.hour(), now.minute(), now.second()));
}

void yearLoadFn(uint8_t page_index, uint8_t conf_index) {
    if (conf_index != 0) {
        return;
    } // Vykoname len raz pre kazdu stranku.

    const uint16_t year = Modules::RTC.getYear() + 2000;

    Config::set(Config::toID(page_index, 0), (year / 1000) % 10);
    Config::set(Config::toID(page_index, 1), (year / 100) % 10);
    Config::set(Config::toID(page_index, 2), (year / 10) % 10);
    Config::set(Config::toID(page_index, 3), year % 10);
}

void yearSaveFn(uint8_t page_index, uint8_t conf_index) {
    (void)page_index; // Nepouzivame
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    const DateTime now = RTClib::now();
    const uint16_t year = Config::get(Config::YEAR_D1) * 1000
                        + Config::get(Config::YEAR_D2) * 100
                        + Config::get(Config::YEAR_D3) * 10
                        + Config::get(Config::YEAR_D4);
    Modules::RTC.adjust(DateTime(year, now.month(), now.day(), now.hour(), now.minute(), now.second()));
}

void setupConfig() {
    Config::setCallbackForPage(Config::page(Config::TIME_HOURS_TENS), onTimeSet);
    Config::setCallbackForPage(Config::page(Config::DATE_DAY_D1),     onDateSet);

    // Registrujeme vlastne save/load funkcie pre stranku casu,
    // ktore synchronizuju hodnoty s RTC / countrami namiesto priameho zapisu do EEPROM.
    Config::setSaveCallbackForPage(Config::page(Config::TIME_HOURS_TENS), timeSaveFn);
    Config::setLoadCallbackForPage(Config::page(Config::TIME_HOURS_TENS), timeLoadFn);

    Config::setSaveCallbackForPage(Config::page(Config::DATE_DAY_D1),     dateSaveFn);
    Config::setLoadCallbackForPage(Config::page(Config::DATE_DAY_D1),     dateLoadFn);

    Config::setLoadCallbackForPage(Config::page(Config::YEAR_D1),         yearLoadFn);
    Config::setSaveCallbackForPage(Config::page(Config::YEAR_D1),         yearSaveFn);

    Config::loadAll(); // Nacitajme konfiguracie z EEPROM pri startupe.
}

//////////////////////////////
/// Sekundovy handler
//////////////////////////////

void onNewSecond() {
    secondlyViewHandler();

    if (updateTimeCountersFromTimeSources()) {
        if (!is_any_view_shown && !BIS(MODE, MODE_EDIT) && !BIS(MODE, MODE_DIAG)) {
            displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        }
    }
}

//////////////////////////////
/// Handlery tlacidiel
//////////////////////////////

void onAnyButtonPressed() {
    sprintln(F("ANY BUTTON PRESSED"));

    if (BIS(MODE, MODE_EDIT)) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
    }

    if (is_any_view_shown) {
        displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        is_any_view_shown = 0;
    }
}

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
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
    onLeftButtonReleased();
}

void onRightButtonReleased() {
    sprintln(F("RIGHT BUTTON RELEASED"));
    if (BIS(MODE, MODE_EDIT)) {
        Config::increment(Config::toID(cur_page_index, selected_digit));
        displayPage(cur_page_index);
    } else {
        configDisplayBrightness(MAX(_target_brightness, BRIGHTNESS_STEP) - BRIGHTNESS_STEP);
    }
}

void onRightButtonLongPressed() {
    sprint(F("RIGHT BUTTON LONG PRESSED "));
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
    onRightButtonReleased();
}

void onBothButtonsReleased() {
    sprintln(F("BOTH BUTTONS RELEASED"));
    Config::saveForPage(cur_page_index);

    if (cur_page_index >= (CONFIG_PAGE_COUNT - 1)) {
        sprintln(F("Posledna strana, ukoncujeme edit rezim..."));
        exitEditMode();
    } else {
        if (!BIS(MODE, MODE_EDIT)) {
            enterEditMode(); // restartuje timer_counter
        } else {
            ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
            Config::loadForPage(++cur_page_index);
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
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { timer_counter = 0; }
    sprintln(F("BOTH BUTTONS LONG PRESSED"));
    if (BIS(MODE, MODE_EDIT)) {
        exitEditMode();
    } else {
        startDiagnostics();
    }
}
