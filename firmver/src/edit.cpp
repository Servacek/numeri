#include "utils/math.h"

#include "edit.h"
#include "isr.h"
#include "views.h"
#include "modules.h"
#include "display.h"
#include "timers.h"
#include "const.h"
#include "fading.h"

//////////////////////////////

static uint8_t cur_page_index = 0;

// Zaciname nastavovat cas od desiatok hodin.
static uint8_t selected_digit = DIGIT_HOR_TENS;

//////////////////////////////
/// Edit rezim
//////////////////////////////

void setSelectedDigit(uint8_t digit) {
    Display::setNumitronSegment(selected_digit, S2, OFF);
    Display::setNumitronSegment(digit, S2, ON);
    selected_digit = digit;
}

void enterEditMode() {
    sprintln(F("enterEditMode"));
    SBI(MODE, MODE_EDIT);
    setSelectedDigit(selected_digit);

    NO_INTERRUPTS_SECTION { timer_counter = 0; }
    cur_page_index = 0;

    Config::loadForPage(cur_page_index);
}

void exitEditMode() {
    sprintln(F("exitEditMode"));
    CBI(MODE, MODE_EDIT);

    // Ulozme este aktualnu stranku.
    Config::saveForPage(cur_page_index);

    cur_page_index = 0;
    NO_INTERRUPTS_SECTION { timer_counter = 0; }

    Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
}

//////////////////////////////
/// Timeout editacneho rezimu
//////////////////////////////

// Volat z milisekundoveho handlera, po obsluhe tlacidiel.
// Vdaka tomu sa timeout vzdy vyhodnoti AZ po spracovani aktualnych stlaceni.
void tickEditMode() {
    if (!BIS(MODE, MODE_EDIT)) return;

    uint16_t t;
    NO_INTERRUPTS_SECTION { t = timer_counter; }

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
            Display::getTimeDigitWithIndex(digit_index, t_counter_minutes, t_counter_hours)
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

// TODO: Nechame uzivatela nech si nastavi co chce ale pri ukladani hodnotu
// urobime vzdy validnou.
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

// void onDateSet(uint8_t page_index, uint8_t conf_index) {
// #if !RTC_ENABLED
//     (void)page_index;
//     (void)conf_index;
//     return;
// #else
//     (void)page_index;

//     // Upravujeme cifru desiatok dni
//     // maximum je 3 co riesi config system ale
//     // musime zmenit jednotky dni na 1 aby sme sa usistili, ze budu validne.
//     // Zaroven ak je measiac februar tak az na 28 alebo 29 podla priestupneho roku.

//     // Upravujeme cifru jednotiek dni,
//     // maximum je 9 ale musime skontrolovat cifru desiatok dni a aktualny mesiac.
//     // Napriklad 31. den je validny len pre mesiace s 31 dňami, a 30. den je nevalidny pre februar.
//     // Musime upravit cifru desiatok dni. Napriklad z 29 pre februar urobime 19.

//     // Upravujeme cifru desiatok mesiaca, maximum je 1 ale musime skontrolovat cifru jednotiek mesiaca.
//     // Opat musime si davat pozor na pocet dni v mesiaci.

//     // Upravujeme cifru jednotiek mesiaca, maximum je 9 ale musime skontrolovat cifru desiatok mesiaca.
//     // Napriklad 2 pre jednotky je validne len pre mesiace s desiatkami 0,1,2 (t.j. do 29 dni),
//     // a 9 je nevalidne pre mesiace s desiatkami 1 (t.j. do 19 dni).

//     const bool editing_month_d1 =
//         (conf_index == Config::indexInPage(Config::DATE_MONTH_D1));
//     const bool editing_month_d2 =
//         (conf_index == Config::indexInPage(Config::DATE_MONTH_D2));
//     const bool editing_day_d1 =
//         (conf_index == Config::indexInPage(Config::DATE_DAY_D1));
//     const bool editing_day_d2 =
//         (conf_index == Config::indexInPage(Config::DATE_DAY_D2));

//     uint8_t month_d1 = Config::get(Config::DATE_MONTH_D1);
//     uint8_t month_d2 = Config::get(Config::DATE_MONTH_D2);
//     uint8_t day_d1   = Config::get(Config::DATE_DAY_D1);
//     uint8_t day_d2   = Config::get(Config::DATE_DAY_D2);

//     uint8_t month = month_d1 * 10u + month_d2;
//     uint8_t day   = day_d1 * 10u + day_d2;

//     // --- Fix month: never touch the digit the user just edited ---
//     if (month == 0u) {
//         if (editing_month_d1)
//             Config::set(Config::DATE_MONTH_D2, 1u);
//         else
//             Config::set(
//                 Config::DATE_MONTH_D1,
//                 0u); // D1 stays, D2=0 means month=01 impossible so force D1
//         // Actually if user set D2=0, month=X0. Fix D1 to make month valid.
//         // e.g. user typed 0 for D2 → month=10 is fine, month=00 is not.
//         // Only 00 is invalid, so fix the other digit.
//         if (!editing_month_d1)
//             Config::set(Config::DATE_MONTH_D1, 1u);
//         month_d1 = Config::get(Config::DATE_MONTH_D1);
//         month_d2 = Config::get(Config::DATE_MONTH_D2);
//         month    = month_d1 * 10u + month_d2;
//     } else if (month > 12u) {
//         // Clamp the non-edited digit to bring month into range
//         if (editing_month_d1)
//             Config::set(Config::DATE_MONTH_D2,
//                         2u); // user set D1, cap D2 → X2, but X≤1
//         else
//             Config::set(Config::DATE_MONTH_D1, 1u); // user set D2, cap D1 → 1Y
//         month_d1 = Config::get(Config::DATE_MONTH_D1);
//         month_d2 = Config::get(Config::DATE_MONTH_D2);
//         month    = month_d1 * 10u + month_d2;
//     }

//     // --- Compute max day ---
//     Modules::DS3231::DateTime now{};
//     if (!Modules::DS3231::now(now))
//         return;

//     const bool is_leap = (now.year % 4u == 0u &&
//                           (now.year % 100u != 0u || now.year % 400u == 0u));
//     uint8_t    max_day = pgm_read_byte(&DAYS_IN_MONTH[month]);
//     if (month == 2u && is_leap)
//         max_day = 29u;

//     const uint8_t max_day_d1 = max_day / 10u;

//     // --- Fix day: again, never touch the edited digit ---
//     if (editing_day_d1) {
//         // User changed tens. If tens now exceeds max, cycle to 0.
//         if (day_d1 > max_day_d1) {
//             day_d1 = 0u;
//             Config::set(Config::DATE_DAY_D1, day_d1);
//         }
//         // Tens are now valid. If combined day is still out of range, fix D2.
//         day = day_d1 * 10u + day_d2;
//         if (day == 0u)
//             Config::set(Config::DATE_DAY_D2, 1u);
//         else if (day > max_day)
//             Config::set(Config::DATE_DAY_D2, max_day % 10u);
//     } else if (editing_day_d2) {
//         // User changed ones. If combined day is out of range, fix D1.
//         if (day == 0u)
//             Config::set(Config::DATE_DAY_D1, 0u),
//                 Config::set(
//                     Config::DATE_DAY_D2,
//                     1u); // 00 → 01, fix both since ones=0 and user set it
//         else if (day > max_day)
//             Config::set(Config::DATE_DAY_D1, max_day / 10u);
//     } else {
//         // Month changed — re-validate existing day against new max, fix D1 or D2 freely
//         if (day == 0u) {
//             Config::set(Config::DATE_DAY_D2, 1u);
//         } else if (day > max_day) {
//             Config::set(Config::DATE_DAY_D1, max_day / 10u);
//             Config::set(Config::DATE_DAY_D2, max_day % 10u);
//         }
//     }
// #endif
// }

void dateLoadFn(uint8_t page_index, uint8_t conf_index) {
    #if !RTC_ENABLED
        (void)page_index; // Nepouzivame
        (void)conf_index; // Nepouzivame
        return;
    #else
    if (conf_index != 0) {
        return;
    } // Vykoname len raz pre kazdu stranku.

    uint8_t month = 1, day = 1;
    Modules::DS3231::DateTime now{};
    if (Modules::DS3231::now(now)) {
        month = now.month;
        day   = now.day;
    }

    Config::set(Config::toID(page_index, 0), day / 10);
    Config::set(Config::toID(page_index, 1), day % 10);
    Config::set(Config::toID(page_index, 2), month / 10);
    Config::set(Config::toID(page_index, 3), month % 10);
    #endif
}

void dateSaveFn(uint8_t page_index, uint8_t conf_index) {
    #if !RTC_ENABLED
        (void)page_index; // Nepouzivame
        (void)conf_index; // Nepouzivame
        return;
    #else
    (void)page_index; // Nepouzivame
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    Modules::DS3231::DateTime now{};
    if (!Modules::DS3231::now(now)) return;

    Modules::DS3231::DateTime updated{
        /*minute=*/now.minute,
        /*hour=*/now.hour,
        /*day=*/(uint8_t)(Config::get(Config::DATE_DAY_D1) * 10 + Config::get(Config::DATE_DAY_D2)),
        /*month=*/(uint8_t)(Config::get(Config::DATE_MONTH_D1) * 10 + Config::get(Config::DATE_MONTH_D2)),
        /*year=*/now.year,
    };

    Modules::DS3231::adjust(updated);
    #endif
}

void yearLoadFn(uint8_t page_index, uint8_t conf_index) {
    #if !RTC_ENABLED
        (void)page_index; // Nepouzivame
        (void)conf_index; // Nepouzivame
        return;
    #else
    if (conf_index != 0) {
        return;
    } // Vykoname len raz pre kazdu stranku.

    Modules::DS3231::DateTime now{};
    if (!Modules::DS3231::now(now)) return;

    const uint16_t year = now.year;

    Config::set(Config::toID(page_index, 0), (year / 1000) % 10);
    Config::set(Config::toID(page_index, 1), (year / 100) % 10);
    Config::set(Config::toID(page_index, 2), (year / 10) % 10);
    Config::set(Config::toID(page_index, 3), year % 10);
    #endif
}

void yearSaveFn(uint8_t page_index, uint8_t conf_index) {
    #if !RTC_ENABLED
        (void)page_index; // Nepouzivame
        (void)conf_index; // Nepouzivame
        return;
    #else

    (void)page_index; // Nepouzivame
    if (conf_index != 0) {
        return; // Vykoname len raz pre kazdu stranku.
    }

    Modules::DS3231::DateTime now{};
    if (!Modules::DS3231::now(now)) return;

    const uint16_t year = Config::get(Config::YEAR_D1) * 1000
                        + Config::get(Config::YEAR_D2) * 100
                        + Config::get(Config::YEAR_D3) * 10
                        + Config::get(Config::YEAR_D4);

    Modules::DS3231::DateTime updated{
        /*minute=*/now.minute,
        /*hour=*/now.hour,
        /*day=*/now.day,
        /*month=*/now.month,
        /*year=*/year,
    };

    Modules::DS3231::adjust(updated);
    #endif
}

void setupConfig() {
    // Config::setCallbackForPage(Config::page(Config::TIME_HOURS_TENS), onTimeSet);
    // Config::setCallbackForPage(Config::page(Config::DATE_DAY_D1),     onDateSet);

    // Registrujeme vlastne save/load funkcie pre stranku casu,
    // ktore synchronizuju hodnoty s RTC / countrami namiesto priameho zapisu do EEPROM.
    Config::setSaveCallbackForPage(Config::page(Config::TIME_HOURS_TENS), timeSaveFn);
    Config::setLoadCallbackForPage(Config::page(Config::TIME_HOURS_TENS), timeLoadFn);

    Config::setSaveCallbackForPage(Config::page(Config::DATE_DAY_D1),     dateSaveFn);
    Config::setLoadCallbackForPage(Config::page(Config::DATE_DAY_D1),     dateLoadFn);

    Config::setLoadCallbackForPage(Config::page(Config::YEAR_D1),         yearLoadFn);
    Config::setSaveCallbackForPage(Config::page(Config::YEAR_D1),         yearSaveFn);

    Timers::setup();

    Config::loadAll(); // Nacitajme konfiguracie z EEPROM pri startupe.
}

static void setSymbolOnNumitron(uint8_t numitron_index, uint8_t symbol_index) {
    Display::setSymbolOnNumitron(numitron_index, symbol_index);
    if (numitron_index == selected_digit && BIS(MODE, MODE_EDIT)) {
        Display::DIGITS[numitron_index] |= S2;
    }
}

static void displayPage(uint8_t page_index) {
    sprint("STRANKA: ");
    sprint(page_index);
    sprint(" HODNOTY NUMITRONOV:");
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        sprint(" ");
        sprint(Config::get(Config::toID(page_index, conf_index)));
        setSymbolOnNumitron(
            conf_index,
            Config::getSymbolIndex(Config::toID(page_index, conf_index)));
    }
    sprintln("");

    Display::Crossfading::transitionTo(Display::DIGITS);
}

//////////////////////////////
/// Sekundovy handler
//////////////////////////////

void onNewSecond() {
    Views::secondlyViewHandler();

    if (updateTimeCountersFromTimeSources()) {
        if (!Views::isAnyViewShown() && !BIS(MODE, MODE_EDIT) && !BIS(MODE, MODE_DIAG)) {
            Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        }
    }
}

//////////////////////////////
/// Handlery tlacidiel
//////////////////////////////

void onAnyButtonPressed() {
    sprintln(F("ANY BUTTON PRESSED"));

    if (BIS(MODE, MODE_EDIT)) {
        NO_INTERRUPTS_SECTION { timer_counter = 0; }
    }

    // Stlacenim hociakeho tlacidla zrusime existujuce view.
    // if (Views::isAnyViewShown()) {
    //     Views::hideViews();
    // }
}

void onLeftButtonReleased() {
    sprintln(F("LEFT BUTTON RELEASED"));
    if (BIS(MODE, MODE_EDIT)) {
        setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
        sprint(F("VYBRATY NUMITRON CISLO: "));
        sprintln(selected_digit);
    } else if (Config::get(Config::TIME_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL) {
        Display::incrementBrightness(BRIGHTNESS_STEP);
    }
}

void onLeftButtonLongPressed() {
    sprint(F("LEFT BUTTON LONG PRESSED "));
    NO_INTERRUPTS_SECTION { timer_counter = 0; }
    onLeftButtonReleased();
}

void onRightButtonReleased() {
    sprintln(F("RIGHT BUTTON RELEASED"));
    if (BIS(MODE, MODE_EDIT)) {
        Config::increment(Config::toID(cur_page_index, selected_digit));
        displayPage(cur_page_index);
    } else if (Config::get(Config::TIME_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL) {
        // Ak je jas nastaveny na "manual", dovolme ho upravovat pomocou tlacidiel.
        Display::incrementBrightness(-BRIGHTNESS_STEP);
    }
}

void onRightButtonLongPressed() {
    sprint(F("RIGHT BUTTON LONG PRESSED "));
    NO_INTERRUPTS_SECTION { timer_counter = 0; }
    onRightButtonReleased();
}

// Kratke stlacenie oboch tlacidiel naraz, zobraz dalsi view
void onBothButtonsReleased() {
    sprintln(F("BOTH BUTTONS RELEASED"));

    if (!BIS(MODE, MODE_EDIT)) {
        Views::showNextViewOrHide();
    } else { // Zobrazme dalsiu stranku
        // Only persist the current page when already in edit mode (navigating
        // between pages or exiting). On the very first button press, the Config
        // values are still stale EEPROM data from a previous session — saving
        // them here would overwrite the RTC with that old time before the fresh
        // load in enterEditMode() has a chance to run.
        Config::saveForPage(cur_page_index);
        NO_INTERRUPTS_SECTION {
            timer_counter = 0;
        }
        Config::loadForPage(++cur_page_index);
        displayPage(cur_page_index);
    }
}

void onBothButtonsLongReleased() {
    sprintln(F("BOTH BUTTONS LONG RELEASED"));
    // if (BIS(MODE, MODE_DIAG)) {
    //     stopDiagnostics();
    //     Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
    // }
}

// Vykonavame bez opakovani
void onBothButtonsLongPressed() {
    NO_INTERRUPTS_SECTION { timer_counter = 0; }
    sprintln(F("BOTH BUTTONS LONG PRESSED"));
    if (BIS(MODE, MODE_EDIT)) {
        exitEditMode();
    } else {
        if (cur_page_index >= (CONFIG_PAGE_COUNT - 1)) {
            sprintln(F("Posledna strana, ukoncujeme edit rezim..."));
            exitEditMode();
        } else {
            if (!BIS(MODE, MODE_EDIT)) {
                enterEditMode(); // restartuje timer_counter
                displayPage(cur_page_index);
            }
        }
    }
}
