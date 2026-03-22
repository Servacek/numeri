#ifndef EDIT_H
#define EDIT_H

#include "main.h"
#include "clock.h"
#include "config.h"
#include "display.h"

#define EDIT_MODE_TIMEOUT   (60u * 1000u) // milisekundy

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
