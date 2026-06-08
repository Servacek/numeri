#include "views.h"

#include "services/logging.h"
#include "clock.h"
#include "state.h"
#include "const.h"
#include "drivers/display.h"
#include "drivers/avr_thermometer.h"
#include "modules.h"

// 1=teplota, 2=datum, 3=koniec
static uint8_t _current_view   = 1; // Zaciname teplotou.
static uint8_t _view_countdown = 0; // Sekundy do automatickeho vystupenia z VIEW rezimu.

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
    if (Modules::isConnected(Modules::MODULE_DS3231)) {
        Modules::DS3231::readDate(day, month);
    }
#endif

#if DCF77_ENABLED
    if ((day == 0 || month == 0) && DCF77_Clock::get_clock_state() >= Clock::dirty) {
        Clock::time_t now;
        DCF77_Clock::read_current_time(now);
        day   = bcd_to_int(now.day);
        month = bcd_to_int(now.month);
    }
#endif

    if (day == 0 || month == 0) return; // Ziadny platny zdroj datumu

    sprint(day);   sprint(F("."));
    sprint(month); sprintln(F("."));
    Display::setSymbolOnNumitron(DIGIT_HOR_TENS, day   / 10);
    Display::setSymbolOnNumitron(DIGIT_HOR_ONES, day   % 10);
    Display::setSymbolOnNumitron(DIGIT_MIN_TENS, month / 10);
    Display::setSymbolOnNumitron(DIGIT_MIN_ONES, month % 10);
    Display::Crossfading::startTransition();
}

static void _showView(uint8_t view_index) {
    switch (view_index) {
        case 1: _displayTemperature(); break;
        case 2: _displayDate();        break;
        default: return; // Neznama view, ignorujeme
    }
}

namespace Views {

//////////////////////////////
// Stavovy stroj — volane z state.cpp
//////////////////////////////

void enter() {
    _view_countdown = _VIEW_TIMEOUT_S;
    _current_view   = 1; // Zaciname vzdy teplotou, pre konzistentnost.
    _showView(_current_view);
}

void exit() {
    _current_view   = 0;
    _view_countdown = 0;
}

//////////////////////////////
// Verejne funkcie
//////////////////////////////

void showNextView() {
    // pripravime index na dalsie zobrazenie.
    _current_view = _current_view % 3 + 1; // Cyklus 1 -> 2 -> 3 -> 1 -> ...
    if (_current_view == 3) {
        // Ked zobrazime posledny view, tak vyideme z VIEW rezimu cez stavovy stroj.
        Clock::State::dispatch(Clock::State::EVT_EXIT_VIEW);
        return;
    }
    _showView(_current_view);
}

void onSecondTick() {
    // Uz asi nie sme v VIEW rezime.
    if (_view_countdown == 0) return;

    if (--_view_countdown == 0) { // Dosli sme k nule, vystupime z VIEW rezimu.
        Clock::State::dispatch(Clock::State::EVT_EXIT_VIEW);
    }
}

} // namespace Views
