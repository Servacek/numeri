#ifndef CLOCK_H
#define CLOCK_H

#include "main.h"
#include "input.h"
#include "display.h"
#include "config.h"
#include "peripherals.h"

//////////////////////////////

// Register aktualneho režimu.
extern uint8_t MODE;
extern uint8_t FLAG;

extern uint8_t t_counter_hours;
extern uint8_t t_counter_minutes;

//////////////////////////////


void setSelectedDigit(uint8_t digit);

void enterEditMode();

void exitEditMode();

//////////////////////////////
/// CAS
//////////////////////////////

uint8_t updateTimeSourceFromTimeCounters();

uint8_t updateTimeCountersFromTimeSources();

void addNewMinuteToCounters();

void timeLoadFn(uint8_t page_index, uint8_t conf_index);

void timeSaveFn(uint8_t page_index, uint8_t conf_index);

#endif // CLOCK_H
