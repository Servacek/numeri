#ifndef MONITOR_H
#define MONITOR_H

#include <stdint.h>
#include "main.h"

// Monitor prudu displeja (INA219)
// Porovnava namerany prud s odhadom podla poctu svietiacich filamentov
// a aktualneho jasu. Pouziva kalibrovanu tabulku mA*10 na segment.

namespace Monitor {

// Konfiguracia
// Nastav na 1 ked chces spustit kalibraciu, potom spat na 0 (setrí ~500 B Flash).
#define MONITOR_CALIBRATION_ENABLED  1

#define MONITOR_CONFIRM_TICKS        3   // pocet sekund pred potvrdenim poruchy
#define MONITOR_SETTLE_MS            1000u // cas stabilizacie filamentov (ms)
#define MONITOR_FAULT_TOLERANCE_PCT  10  // tolerancia v percentach
#define MONITOR_MIN_SEGS_FOR_CHECK   4   // minimalny pocet segmentov pre meranie

// INA sync timeout (ms) pri cakaní na novu konverziu
#define MONITOR_INA_SYNC_TIMEOUT_MS  150u

// EEPROM adresa: 1 bajt magic + 5 bajtov tabulky
#define MONITOR_EEPROM_BASE_ADDR     32u
#define MONITOR_EEPROM_MAGIC         0xA4u

enum FaultType : uint8_t {
    FAULT_NONE    = 0,
    FAULT_OPEN    = 1,
    FAULT_SHORT   = 2,
    FAULT_INA_ERR = 3,
    FAULT_TOO_DIM = 4,
};

struct FaultReport {
    FaultType type;
    int16_t   measured_x10;    // mA * 10
    int16_t   expected_x10;    // mA * 10
    uint8_t   digit_fault_mask; // bit pre kazdu cislicu
};

// Rozhranie
uint8_t  countLitSegments();
uint16_t estimateCurrentX10();
FaultType checkIntegrity(FaultReport* out);
void localizeFault(FaultReport* report);

// Kalibracia: spusti automaticku kalibraciu a vrati true pri uspechu
bool runCalibration();
void saveCalibration();
void loadCalibration();
void clearCalibration();
bool hasCalibrationSaveInEEPROM();

using FaultCallback = void (*)(const FaultReport&);
void onSecondTick(FaultCallback cb);

} // namespace Monitor

#endif // MONITOR_H
