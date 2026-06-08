#ifndef CLOCK_H
#define CLOCK_H

#include "main.h"
#include "modules.h"
#include "state.h"
#include "drivers/display.h"

//////////////////////////////

namespace Clock {

extern uint8_t t_counter_hours;
extern uint8_t t_counter_minutes;

// Pocita milisekundove tiky ISR-ka, na zaklade nich nastavuje vlajky novych sekund a minut.
// Pouzivame to aj v hlavnej slucke, takze musi byt "volatile"
extern volatile uint16_t t_counter_millis; // Pocita do 60 000 - 1 minuta v ms

//////////////////////////////
/// Cas
//////////////////////////////

inline void setCurrentTime(uint8_t hours, uint8_t minutes, uint8_t seconds) {
    t_counter_hours   = hours;
    t_counter_minutes = minutes;
    NO_INTERRUPTS_SECTION {
        t_counter_millis = seconds * 1000u;
    }
}

inline bool canDisplayTime() {
    return (State::inNormalMode() || (State::inNightMode() && Display::getTargetBrightness() != 0));
}

inline bool canUseAutoBrightness() {
    return canDisplayTime() || State::inViewMode();
}

void addNewMinuteToCounters();

// Zapise t_counter_hours / t_counter_minutes do externeho zdroja casu (RTC).
uint8_t updateTimeSourceFromTimeCounters();

// Aktualizuje t_counter_hours / t_counter_minutes z externeho zdroja casu.
// Vracia 1 ak sa cas zmenil, inak 0.
uint8_t updateTimeCountersFromTimeSources();

void onISRTick();

} // namespace Clock

#endif // CLOCK_H
