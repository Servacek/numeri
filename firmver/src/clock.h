#ifndef CLOCK_H
#define CLOCK_H

#include "main.h"
#include "modules.h"

//////////////////////////////

namespace Clock {

extern uint8_t t_counter_hours;
extern uint8_t t_counter_minutes;

// TODO: na tomto je zavislych vela modulov, co nie je idealne.
// Pocita milisekundove tiky ISR-ka, na zaklade nich nastavuje vlajky novych sekund a minut.
// Pouzivame to aj v hlavnej slucke, takze musi byt "volatile"
extern volatile uint16_t timer_counter; // Pocita do 60 000 - 1 minuta v ms

//////////////////////////////
/// Cas
//////////////////////////////

void addNewMinuteToCounters();

// Zapise t_counter_hours / t_counter_minutes do externeho zdroja casu (RTC).
uint8_t updateTimeSourceFromTimeCounters();

// Aktualizuje t_counter_hours / t_counter_minutes z externeho zdroja casu.
// Vracia 1 ak sa cas zmenil, inak 0.
uint8_t updateTimeCountersFromTimeSources();

void onISRTick();

} // namespace Clock

#endif // CLOCK_H
