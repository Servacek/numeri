#ifndef CLOCK_H
#define CLOCK_H

#include "main.h"
#include "modules.h"

//////////////////////////////

// Register aktualneho rezimu (zdielane napriec celym projektom, zapisovane z ISR).
extern uint8_t MODE;
extern volatile uint8_t FLAG;

extern uint8_t t_counter_hours;
extern uint8_t t_counter_minutes;

//////////////////////////////
/// Cas
//////////////////////////////

void addNewMinuteToCounters();

// Zapise t_counter_hours / t_counter_minutes do externeho zdroja casu (RTC).
uint8_t updateTimeSourceFromTimeCounters();

// Aktualizuje t_counter_hours / t_counter_minutes z externeho zdroja casu.
// Vracia 1 ak sa cas zmenil, inak 0.
uint8_t updateTimeCountersFromTimeSources();

#endif // CLOCK_H
