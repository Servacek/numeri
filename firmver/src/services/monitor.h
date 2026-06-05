#ifndef MONITOR_H
#define MONITOR_H

#include <stdint.h>
#include "main.h"

// Monitor prudu displeja (INA219)
// Porovnava namerany prud s odhadom podla poctu svietiacich filamentov
// a aktualneho jasu. Pouziva kalibrovanu tabulku mA*10 na segment.

namespace Monitor {

bool loadCalibrationTableFromEEPROM();

void clearCalibrationTable();

bool runCalibration();

void onSecondTick();

void onMillisecondTick();

} // namespace Monitor

#endif // MONITOR_H
