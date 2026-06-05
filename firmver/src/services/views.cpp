#include "views.h"

#include "services/logging.h"
#include "clock.h"
#include "state.h"
#include "const.h"
#include "drivers/display.h"
#include "drivers/avr_thermometer.h"
#include "modules.h"

// 0=cas, 1=teplota, 2=datum
// V VIEW rezime: sleduje co je zobrazene a riadi prechody.
// V nocnom rezime: pouziva sa pre inline cyklicke zobrazovanie bez zmeny stavu stroja.
static uint8_t _current_view   = 0;
static uint8_t _view_countdown = 0; // sekundy do automatickeho skrytia (iba VIEW rezim)

static constexpr uint8_t _VIEW_TIMEOUT_S = 5u;

//////////////////////////////
// Pomocne funkcie
//////////////////////////////

static void _displayTemperature() {
#if RTC_ENABLED
    int8_t temperature;
    if (!Modules::DS3231::getTemperature(temperature)) {
        temperature = AVRThermometer::read();
    }
#else
    int8_t temperature = AVRThermometer::read();
#endif

    sprint(F("Teplota: "));
    sprintln(temperature);

    const uint8_t tens = (uint8_t)ABS(temperature / 10);
    const uint8_t ones = (uint8_t)ABS(temperature % 10);

    if (temperature < 0) {
        Display::setSymbolOnNumitron(DIGIT_HOR_TENS, MINUS_SYMBOL);
    } else {
        Display::setSymbolOnNumitron(DIGIT_HOR_TENS, tens);
    }
    Display::setSymbolOnNumitron(DIGIT_HOR_ONES, ones);
    Display::setSymbolOnNumitron(DIGIT_MIN_TENS, DEGREE_SYMBOL);
    Display::setSymbolOnNumitron(DIGIT_MIN_ONES, C_SYMBOL);

    Display::Crossfading::startTransition();
}

static void _displayDate() {
    uint8_t day = 0, month = 0;

#if RTC_ENABLED
    Modules::DS3231::readDate(day, month);
#elif DCF77_ENABLED
    Clock::time_t now;
    DCF77_Clock::get_current_time(now);
    day   = bcd_to_int(now.day);
    month = bcd_to_int(now.month);
#else
    day   = 12;
    month = 12;
#endif

    sprint(day);   sprint(F("."));
    sprint(month); sprintln(F("."));

    Display::setSymbolOnNumitron(DIGIT_HOR_TENS, day   / 10);
    Display::setSymbolOnNumitron(DIGIT_HOR_ONES, day   % 10);
    Display::setSymbolOnNumitron(DIGIT_MIN_TENS, month / 10);
    Display::setSymbolOnNumitron(DIGIT_MIN_ONES, month % 10);

    Display::Crossfading::startTransition();
}

namespace Views {

//////////////////////////////
// Stavovy stroj — volane z state.cpp
//////////////////////////////

void enter() {
    _displayTemperature();
    _current_view   = 1;
    _view_countdown = _VIEW_TIMEOUT_S;
}

void exit() {
    // Displej a LED obnovi NormalMode::enter() — tu len zresetujeme stav.
    _current_view   = 0;
    _view_countdown = 0;
}

void reset() {
    _current_view   = 0;
    _view_countdown = 0;
}

//////////////////////////////
// Verejne funkcie
//////////////////////////////

bool isAnyViewShown() {
    return _current_view != 0;
}

void hideViews() {
    if (_current_view == 0) return;

    if (Clock::State::inViewMode()) {
        Clock::State::dispatch(Clock::State::EVT_EXIT_VIEW);
    } else {
        // Nocny rezim — priame zobrazovanie, bez stavoveho stroja.
        _current_view = 0;
        Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
    }
}

void showNextViewOrHide() {
    if (Clock::State::inNightMode()) {
        // V nocnom rezime cyklujeme priamo (bez prechodu do VIEW rezimu).
        switch (_current_view) {
            case 0: _displayTemperature(); _current_view = 1; break;
            case 1: _displayDate();        _current_view = 2; break;
            default:
                // Tretie stlacenie — navrat k casu; startPreview() uz cas zobrazil.
                _current_view = 0;
                break;
        }
        return;
    }

    // Normalny alebo VIEW rezim — pouzivame stavovy stroj.
    switch (_current_view) {
        case 0:
            Clock::State::dispatch(Clock::State::EVT_ENTER_VIEW);
            break;
        case 1:
            _displayDate();
            _current_view   = 2;
            _view_countdown = _VIEW_TIMEOUT_S;
            break;
        case 2:
            Clock::State::dispatch(Clock::State::EVT_EXIT_VIEW);
            break;
    }
}

void onSecondTick() {
    if (_view_countdown == 0) return;
    if (--_view_countdown == 0) {
        Clock::State::dispatch(Clock::State::EVT_EXIT_VIEW);
    }
}

} // namespace Views
