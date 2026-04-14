#include "timers.h"

#include "const.h"
#include "config.h"
#include "services/logging.h"

namespace Timers {

static uint8_t _ui_timer_index = 0u;

// Timery su ulozene ako pary (HOUR, ACTION) za sebou zacinanajuc od TIMER_0_HOUR.
static inline Config::ID hourID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u);
}

static inline Config::ID actionID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u + 1u);
}

void onHourTick(uint8_t current_hour, void (*execute)(TimerAction)) {
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

        execute(action);
    }
}

// ─── Timer UI ────────────────────────────────────────────────────────────────
// UI stranka ma [H1][H2][ACTION][TIMER_NUM].
// Pri nacitani stranky nacitame data aktualneho timera (_ui_timer_index) do UI slotov.
// Pri ulozeni (zmena TIMER_NUM alebo both-buttons) ulozime UI sloty do dat timera.

static void _saveCurrentTimerFromUI() {
    const uint8_t h1     = Config::get(Config::TIMER_UI_H1);
    const uint8_t h2     = Config::get(Config::TIMER_UI_H2);
    const uint8_t action = Config::get(Config::TIMER_UI_ACTION);
    const uint8_t hour   = h1 * 10u + h2;

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

    Config::set(Config::TIMER_UI_H1,     hour / 10u);
    Config::set(Config::TIMER_UI_H2,     hour % 10u);
    Config::set(Config::TIMER_UI_ACTION, action);
    Config::set(Config::TIMER_UI_NUM,    timer_index);
}

// H1 je vzdy conf_index 0, H2 je vzdy conf_index 1 v ramci stranky.
static_assert(Config::TIMER_UI_H1 % 4u == 0u, "TIMER_UI_H1 musi byt na indexe 0 v stranke");
static_assert(Config::TIMER_UI_H2 % 4u == 1u, "TIMER_UI_H2 musi byt na indexe 1 v stranke");

// Callback: zmena H1 alebo H2 — validacia hodiny (rovnako ako onTimeSet).
static void _onTimerHourSet(uint8_t /*page*/, uint8_t conf_index) {
    const uint8_t h1   = Config::get(Config::TIMER_UI_H1);
    const uint8_t h2   = Config::get(Config::TIMER_UI_H2);
    const uint8_t hour = h1 * 10u + h2;

    if (hour < MAX_HOURS_COUNT)
        return;

    if (conf_index == 0u) {       // H1 bolo zmenene
        Config::set(Config::TIMER_UI_H2, 3u);
    } else {                       // H2 bolo zmenene
        Config::set(Config::TIMER_UI_H1, 1u);
    }
}

// Callback: zmena TIMER_NUM — uloz aktualny timer, nacitaj novy.
static void _onTimerNumSet(uint8_t /*page*/, uint8_t /*conf_index*/) {
    const uint8_t new_index = Config::get(Config::TIMER_UI_NUM);
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
    Config::setCallback(Config::TIMER_UI_H1,  _onTimerHourSet);
    Config::setCallback(Config::TIMER_UI_H2,  _onTimerHourSet);
    Config::setCallback(Config::TIMER_UI_NUM, _onTimerNumSet);

    const uint8_t ui_page = Config::page(Config::TIMER_UI_H1);
    Config::setSaveCallbackForPage(ui_page, _timerPageSaveFn);
    Config::setLoadCallbackForPage(ui_page, _timerPageLoadFn);

    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        Config::load(hourID(t));
        Config::load(actionID(t));
    }

    _loadTimerToUI(0u);
}

} // namespace Timers
