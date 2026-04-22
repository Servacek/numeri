#ifndef EDIT_H
#define EDIT_H

#include "main.h"
#include "clock.h"
#include "config.h"
#include "drivers/display.h"

namespace Edit {

static constexpr uint16_t _EDIT_MODE_TIMEOUT = 60u * 1000u;

void setSelectedDigit(uint8_t digit);

void enterEditMode();

void exitEditMode();

//////////////////////////////
/// Konfiguracia
//////////////////////////////

void timeLoadFn(uint8_t page_index, uint8_t conf_index);

void timeSaveFn(uint8_t page_index, uint8_t conf_index);

void setupConfig();

//////////////////////////////
/// Sekundovy handler
//////////////////////////////

void onSecondTick();

//////////////////////////////
/// Timeout editacneho rezimu
//////////////////////////////

// Volat z milisekundoveho handlera (po obsluhe tlacidiel).
void onMillisecondTick();

}

#endif // EDIT_H
