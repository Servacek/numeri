#include "views.h"

#include "services/logging.h"
#include "state.h"
#include "clock.h"
#include "const.h"
#include "drivers/display.h"
#include "drivers/avr_thermometer.h"
#include "modules.h"

// ─── Sukromny stav ────────────────────────────────────────────────────────────

static uint8_t    _view_iter_period  = 60; // TODO: konfigurovat cez Config
static uint8_t    _view_iter_counter = 0;
static VIEW_INDEX _last_view_index   = NO_VIEW;
static bool       _is_any_view_shown = false;

// ─── Pomocne (sukromne) ───────────────────────────────────────────────────────

static bool _isViewEnabled(VIEW_INDEX view_index) {
    // TODO: Implementovat povolovanie/vypinanie jednotlivych view cez nastavenia.
    return view_index >= 0 && view_index < TOTAL_VIEWS;
}

static VIEW_INDEX _getNextViewIndex(VIEW_INDEX current) {
    for (VIEW_INDEX i = current + 1; i < TOTAL_VIEWS; i++) {
        if (_isViewEnabled(i)) return i;
    }
    return NO_VIEW;
}

static VIEW_INDEX _getNextViewIndexCycling(VIEW_INDEX current) {
    for (VIEW_INDEX i = 1; i < TOTAL_VIEWS; i++) {
        const VIEW_INDEX candidate = (current + i) % TOTAL_VIEWS;
        if (_isViewEnabled(candidate)) return candidate;
    }
    return NO_VIEW;
}

static inline void _renderView(VIEW_INDEX view_index) {
    switch (view_index) {
    case 0:
        Views::displayTemperature();
        break;
    case 1:
        Views::displayDate();
        break;
    default:
        break;
    }
}

// ─── Verejne funkcie ─────────────────────────────────────────────────────────

namespace Views {

bool isAnyViewShown() {
    return _is_any_view_shown;
}

void hideViews() {
    sprintln(F("Zobrazujem spat cas..."));
    _is_any_view_shown = false;
    _view_iter_counter = 0;
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
}

void showView(VIEW_INDEX view_index) {
    if (view_index == NO_VIEW) {
        hideViews();
        return;
    }
    if (!_isViewEnabled(view_index)) return;

    sprint(F("Zobrazujem view: "));
    sprintln(view_index);

    _renderView(view_index);
    _last_view_index   = view_index;
    _is_any_view_shown = true;
    _view_iter_counter = 0;
}

void showNextViewOrHide() {
    const VIEW_INDEX next = _getNextViewIndex(_is_any_view_shown ? _last_view_index : NO_VIEW);
    if (next == NO_VIEW) {
        hideViews();
    } else {
        showView(next);
    }
}

void secondlyViewHandler() {
    if (Clock::State::inEditMode()) return;

    _view_iter_counter++;

    const uint8_t period = _is_any_view_shown ? VIEW_SHOW_DURATION : _view_iter_period;
    if (_view_iter_counter >= period) {
        _view_iter_counter = 0;
        if (_is_any_view_shown) {
            hideViews();
        } else {
            showView(_getNextViewIndexCycling(_last_view_index));
        }
    }
}

// ─── Render funkcie ───────────────────────────────────────────────────────────

void displayTemperature() {
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

    Display::Crossfading::transitionTo(Display::DIGITS);
}

void displayDate() {
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

    Display::Crossfading::transitionTo(Display::DIGITS);
}

} // namespace Views
