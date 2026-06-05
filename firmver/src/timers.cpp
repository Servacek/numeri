#include "timers.h"

#include "const.h"
#include "config.h"
#include "services/logging.h"
#include "services/sync.h"

namespace Timers {

static uint8_t _ui_timer_index = 0u;

// Timery su ulozene ako pary (HOUR, ACTION) za sebou zacinanajuc od TIMER_0_HOUR.
static_assert(Config::TIMER_0_ACTION == Config::TIMER_0_HOUR + 1u,
              "TIMER_0_ACTION musi nasledovat hned za TIMER_0_HOUR");
static_assert(Config::TIMER_1_HOUR   == Config::TIMER_0_HOUR + 2u,
              "TIMER pary musia byt interleaved (HOUR, ACTION) v config_ids.h");
static_assert(Config::TIMER_3_ACTION == Config::TIMER_0_HOUR + (N_TIMERS * 2u - 1u),
              "N_TIMERS nesedi s poctom TIMER_x_* zaznamov v config_ids.h");

static inline Config::ID _hourID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u);
}

static inline Config::ID _actionID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u + 1u);
}

static void _executeTimerAction(TimerAction action) {
    switch (action) {
    case TIMER_ACTION_SLEEP:
        Clock::State::dispatch(Clock::State::EVT_ENTER_NIGHT);
        break;
    case TIMER_ACTION_WAKE:
        Clock::State::dispatch(Clock::State::EVT_EXIT_NIGHT);
        break;
    case TIMER_ACTION_DCF_SYNC:
#if DCF77_ENABLED
        if (Config::get(Config::DCF77_SYNC_ENABLED)) {
            DCF77Sync::startSynchronization();
            sprintln(F("[Timers] DCF77 synchronizacia spustena."));
        }
#endif
        break;
    case TIMER_ACTION_NONE:
    default:
        break;
    }
}

void onHourTick(uint8_t current_hour) {
    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        const uint8_t     hour   = Config::get(_hourID(t));
        const TimerAction action = (TimerAction)Config::get(_actionID(t));

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

        _executeTimerAction(action);
    }
}

// Posunuli sme index casovaca, ulozime zmeny stareho casovaca.
static void _saveCurrentTimerFromUI() {
    const uint8_t h10    = Config::get(Config::TIMER_H10);
    const uint8_t h1     = Config::get(Config::TIMER_H1);
    const uint8_t action = Config::get(Config::TIMER_ACTION);
    const uint8_t hour   = h10 * 10u + h1;

    Config::set(_hourID(_ui_timer_index), hour);
    Config::set(_actionID(_ui_timer_index), action);
    Config::save(_hourID(_ui_timer_index));
    Config::save(_actionID(_ui_timer_index));

    sprint(F("[Timers] Timer "));
    sprint(_ui_timer_index);
    sprint(F(" ulozeny: hodina="));
    sprint(hour);
    sprint(F(" akcia="));
    sprintln(action);
}

static void _loadTimerToUI(uint8_t timer_index) {
    const uint8_t hour   = Config::get(_hourID(timer_index));
    const uint8_t action = Config::get(_actionID(timer_index));

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

static void _timerPageLoadFn(uint8_t /*page_index*/) {
    _loadTimerToUI(_ui_timer_index);
}

static bool _timerPageSaveFn(uint8_t /*page_index*/) {
    _saveCurrentTimerFromUI();
    return true;
}

void setup() {
    Config::setCallback(Config::TIMER_INDEX, _onTimerIndexSet);
    Config::setCallback(Config::TIMER_H10,  _onTimerHourSet);
    Config::setCallback(Config::TIMER_H1,  _onTimerHourSet);

    const uint8_t ui_page = Config::page(Config::TIMER_H10);
    Config::setSaveCallbackForPage(ui_page, _timerPageSaveFn);
    Config::setLoadCallbackForPage(ui_page, _timerPageLoadFn);

    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        Config::load(_hourID(t));
        Config::load(_actionID(t));
    }

    _loadTimerToUI(0u); // zaciname casovacom 0
}

} // namespace Timers
