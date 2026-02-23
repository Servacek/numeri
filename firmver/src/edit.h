#ifndef EDIT_H
#define EDIT_H

#include "main.h"
#include "clock.h"
#include "config.h"
#include "display.h"

// TODO: V debug mode 10, normalne 30
#define EDIT_MODE_TIMEOUT   10 * 1000 // milisekundy

//////////////////////////////

extern uint8_t cur_page_index;

//////////////////////////////
/// Edit rezim
//////////////////////////////

void setSelectedDigit(uint8_t digit);

void enterEditMode();

void exitEditMode();

//////////////////////////////
/// Config callbacks
//////////////////////////////

void timeLoadFn(uint8_t page_index, uint8_t conf_index);

void timeSaveFn(uint8_t page_index, uint8_t conf_index);

void setupConfig();

//////////////////////////////
/// Sekundovy handler
//////////////////////////////

void onNewSecond();

//////////////////////////////
/// Timeout editacneho rezimu
//////////////////////////////

// Volat z milisekundoveho handlera (po obsluhe tlacidiel).
void tickEditMode();

#endif // EDIT_H
