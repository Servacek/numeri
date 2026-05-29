#include "timers.h"

#include "const.h"
#include "config.h"
#include "services/logging.h"
#include "services/sync.h"

namespace Timers {

static uint8_t _ui_timer_index = 0u;

// Timery su ulozene ako pary (HOUR, ACTION) za sebou zacinanajuc od TIMER_0_HOUR.
static inline Config::ID hourID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u);
}

static inline Config::ID actionID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u + 1u);
}

static void executeTimerAction(TimerAction action) {
    switch (action) {
    case TIMER_ACTION_SLEEP:
        Clock::State::dispatch(Clock::State::EVT_SLEEP_TIMER);
        break;
    case TIMER_ACTION_WAKE:
        Clock::State::dispatch(Clock::State::EVT_WAKE_TIMER);
        break;
    case TIMER_ACTION_DCF_SYNC:
#if DCF77_ENABLED
        DCF77Sync::startSynchronization();
        sprintln(F("[Timers] DCF77 synchronizacia spustena."));
#endif
        break;
    case TIMER_ACTION_NONE:
    default:
        break;
    }
}

void onHourTick(uint8_t current_hour) {
    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        const uint8_t     hour   = Config::get(hourID(t));
        const TimerAction action = (TimerAction)Config::get(actionID(t));

        if (action == TIMER_ACTION_NONE)
            continue;
        if (hour != current_hour)
            continue;

        sprint(F("[Timers] Timer "));
        sprint(t);
        sprint(F(" spusteny, hodina="));
        sprint(hour);
        sprint(F(", akcia="));
        sprintln(action);

        executeTimerAction(action);
    }
}

// Posunuli sme index casovaca, ulozime zmeny stareho casovaca.
static void _saveCurrentTimerFromUI() {
    const uint8_t h10    = Config::get(Config::TIMER_H10);
    const uint8_t h1     = Config::get(Config::TIMER_H1);
    const uint8_t action = Config::get(Config::TIMER_ACTION);
    const uint8_t hour   = h10 * 10u + h1;

    Config::set(hourID(_ui_timer_index), hour);
    Config::set(actionID(_ui_timer_index), action);
    Config::save(hourID(_ui_timer_index));
    Config::save(actionID(_ui_timer_index));

    sprint(F("[Timers] Timer "));
    sprint(_ui_timer_index);
    sprint(F(" ulozeny: hodina="));
    sprint(hour);
    sprint(F(" akcia="));
    sprintln(action);
}

static void _loadTimerToUI(uint8_t timer_index) {
    const uint8_t hour   = Config::get(hourID(timer_index));
    const uint8_t action = Config::get(actionID(timer_index));

    Config::set(Config::TIMER_INDEX,    timer_index);
    Config::set(Config::TIMER_ACTION,   action);
    Config::set(Config::TIMER_H10,      hour / 10u);
    Config::set(Config::TIMER_H1,       hour % 10u);
}

static void _onTimerHourSet(uint8_t /*page*/, uint8_t /*conf_index*/) {
    // H10=2 dovoli max H1=3 (23:xx je posledna platna hodina)
    if (Config::get(Config::TIMER_H10) == 2u && Config::get(Config::TIMER_H1) > 3u) {
        Config::set(Config::TIMER_H1, 3u);
    }
}

// Obsluha pripadu, kedy uzivatel zmeni index casovaca.
static void _onTimerIndexSet(uint8_t /*page*/, uint8_t /*conf_index*/) {
    const uint8_t new_index = Config::get(Config::TIMER_INDEX);
    if (new_index == _ui_timer_index)
        return;

    _saveCurrentTimerFromUI();
    _ui_timer_index = new_index;
    _loadTimerToUI(_ui_timer_index);
}

static void _timerPageLoadFn(uint8_t /*page*/, uint8_t conf_index) {
    if (conf_index != 0u)
        return;
    _loadTimerToUI(_ui_timer_index);
}

static void _timerPageSaveFn(uint8_t /*page*/, uint8_t conf_index) {
    if (conf_index != 0u)
        return;
    _saveCurrentTimerFromUI();
}

void setup() {
    Config::setCallback(Config::TIMER_INDEX, _onTimerIndexSet);
    Config::setCallback(Config::TIMER_H10,  _onTimerHourSet);
    Config::setCallback(Config::TIMER_H1,  _onTimerHourSet);

    const uint8_t ui_page = Config::page(Config::TIMER_H10);
    Config::setSaveCallbackForPage(ui_page, _timerPageSaveFn);
    Config::setLoadCallbackForPage(ui_page, _timerPageLoadFn);

    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        Config::load(hourID(t));
        Config::load(actionID(t));
    }

    _loadTimerToUI(0u); // zaciname casovacom 0
}

} // namespace Timers
