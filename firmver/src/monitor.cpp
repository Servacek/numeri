#include <avr/pgmspace.h>

#include "libs/EEPROM.h"
#include "libs/progmem.h"

#include "display.h"
#include "drivers/buttons.h"
#include "isr.h"
#include "modules.h"
#include "monitor.h"
#include "reg.h"

namespace Monitor {

// Kalibracia: pri MONITOR_CALIBRATION_ENABLED=0 je tabulka v PROGMEM (setrí 5 B RAM).
#if MONITOR_CALIBRATION_ENABLED
static uint8_t SEG_MA_X10_TABLE[5] = {0u, 25u, 48u, 72u, 88u};
#else
static const uint8_t SEG_MA_X10_TABLE[] PROGMEM = {0u, 25u, 48u, 72u, 88u};
#endif

constexpr uint8_t SEG_TABLE_SIZE = 5;

static inline uint8_t segTableRead(uint8_t i) {
#if MONITOR_CALIBRATION_ENABLED
    return SEG_MA_X10_TABLE[i];
#else
    return pgm_read_byte(&SEG_MA_X10_TABLE[i]);
#endif
}

// Interpolacia tabulky pri jase b.
static uint8_t segCurrentX10(uint8_t b) {
    if (b == 0u)
        return 0u;
    if (b >= MAX_BRIGHTNESS)
        return segTableRead(SEG_TABLE_SIZE - 1);

    const uint8_t pos64 =
        (uint8_t)(((uint16_t)b * 64u + (MAX_BRIGHTNESS / 2u)) / MAX_BRIGHTNESS);
    const uint8_t i    = MIN((uint8_t)(pos64 >> 4u), (uint8_t)3u);
    const uint8_t frac = pos64 & 0x0Fu;
    const uint8_t lo   = segTableRead(i);
    const uint8_t hi   = segTableRead(i + 1u);
    return (uint8_t)((int16_t)lo +
                     ((int16_t)((int8_t)(hi - lo)) * (int16_t)frac + 8) / 16);
}

#if INA_ENABLED
// Pocka kym ISR rampa dobehne na target_brightness.
// Vola sa po setDisplayBrightness() pred meranim prudu.
static void waitForBrightnessSettle() {
    // Kazdy krok rampy trva BRIGHTNESS_CNT_TOP ms, krokov je najviac MAX_BRIGHTNESS.
    // Pridame MONITOR_INA_SYNC_TIMEOUT_MS aby INA stihla dokoncit konverziu po ustálení.
    const uint16_t ramp_ms = (uint16_t)MAX_BRIGHTNESS * BRIGHTNESS_CNT_TOP;
    wait(ramp_ms + MONITOR_INA_SYNC_TIMEOUT_MS);
}

// Pouziva sa v onSecondTick — konverzia prebehla v predoslej sekunde, len citame.
static int16_t readCurrentX10() {
    int16_t val = 0;
    return Modules::INA219::readCurrentX10(val) ? val : -1;
}

// Pouziva sa v localizeFault a runCalibration kde sami riadime cas
// a potrebujeme cerstve data po kazdej zmene displeja alebo jasu.
static int16_t readCurrentX10Sync() {
    Modules::INA219::clearConversionFlag();
    for (uint8_t t = 0u; t < MONITOR_INA_SYNC_TIMEOUT_MS; t++) {
        wait(1u);
        if (Modules::INA219::conversionReady())
            break;
    }
    int16_t val = 0;
    return Modules::INA219::readCurrentX10(val) ? val : -1;
}

// Pomocna funkcia: nastavi FaultReport na nulove hodnoty a vrati typ poruchy.
static FaultType earlyFault(FaultReport* out, FaultType t) {
    if (out) {
        out->type         = t;
        out->measured_x10 = 0;
        out->expected_x10 = 0;
    }
    return t;
}
#endif // INA_ENABLED

uint16_t estimateCurrentX10() {
    return (uint16_t)countLitSegments() * (uint16_t)segCurrentX10(Display::getConfigBrightness());
}

FaultType checkIntegrity(FaultReport* out) {
#if !INA_ENABLED
    if (out) {
        out->type = FAULT_INA_ERR;
    }
    return FAULT_INA_ERR;
#else
    if (!Modules::INA219::isConnected())
        return earlyFault(out, FAULT_INA_ERR);
    if (countLitSegments() < MONITOR_MIN_SEGS_FOR_CHECK)
        return earlyFault(out, FAULT_TOO_DIM);
    const uint16_t expected_x10 = estimateCurrentX10();
    if (expected_x10 == 0u)
        return earlyFault(out, FAULT_TOO_DIM);
    const int16_t measured_x10 = readCurrentX10();
    if (measured_x10 < 0)
        return earlyFault(out, FAULT_INA_ERR);

    const int16_t tol =
        (int16_t)((uint32_t)expected_x10 * MONITOR_FAULT_TOLERANCE_PCT / 100u);
    const int16_t low_limit  = (int16_t)expected_x10 - tol;
    const int16_t high_limit = (int16_t)expected_x10 + tol;

    FaultType ft = FAULT_NONE;
    if (measured_x10 < low_limit)
        ft = FAULT_OPEN;
    else if (measured_x10 > high_limit)
        ft = FAULT_SHORT;

    if (out) {
        out->type             = ft;
        out->measured_x10     = measured_x10;
        out->expected_x10     = (int16_t)expected_x10;
        out->digit_fault_mask = 0u;
    }
    return ft;
#endif
}

void localizeFault(FaultReport* report) {
    if (!report)
        return;
    report->digit_fault_mask = 0u;

#if !INA_ENABLED
    return;
#else
    // Save display state
    uint8_t saved[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
        saved[i] = DIGITS[i];
    const bool crsf_was_active = (bool)BIS(MODE, MODE_CRSF);
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        CBI(MODE, MODE_CRSF);
    }

    // ── Step 1: live reference with all 4 tubes fully lit ──────────────────
    // We derive expected-per-tube from a fresh measurement rather than the
    // calibration table, which was built at startup under different loading.
    // ref_x10 / 4 = current one healthy tube should draw.
    uint8_t all_buf[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
        all_buf[i] = 0xFFu;
    putDigitsToInputRegs(all_buf, DIGIT_COUNT);
    pushToOutputRegs();
    wait(MONITOR_SETTLE_MS);

    const int16_t ref_x10 = readCurrentX10Sync();

    int16_t exp_per_tube_x10;
    if (ref_x10 > 0) {
        exp_per_tube_x10 = ref_x10 / (int16_t)DIGIT_COUNT;
    } else {
        // INA error during reference — fall back to calibration table
        uint8_t b;
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { b = _target_brightness; }
        exp_per_tube_x10 = (int16_t)(8u * (uint16_t)segCurrentX10(b));
    }

    const int16_t tol = (int16_t)((uint32_t)exp_per_tube_x10 *
                                  MONITOR_FAULT_TOLERANCE_PCT / 100u);

    sprint(F("[Monitor] ref_x10=")); sprint(ref_x10);
    sprint(F(" exp_per_tube=")); sprint(exp_per_tube_x10);
    sprint(F(" tol=")); sprintln(tol);

    // ── Step 2: test each tube in isolation ───────────────────────────────
    // Light all 8 segments only on the tube under test; blank the rest.
    // No crossfading — direct register write for accurate timing.
    // uint8_t test_buf[DIGIT_COUNT];
    bool fault_found = false;

    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        for (uint8_t i = 0u; i < DIGIT_COUNT; i++) {
            if (i != d) {
                setSymbolRawOnNumitron(i, 0);
            }
        }
        sprint("TESING TUBE ");
        sprintln(d);
        setSymbolOnNumitron(d, ALL_ON_SYMBOL);
        crossfadeFromOldDigitsToNew();
        wait(NUMBER_TRANS_DUR + MONITOR_SETTLE_MS);

        const int16_t meas_x10 = readCurrentX10Sync();

        sprint(F("[Monitor] Tube ")); sprint(d);
        sprint(F(": meas=")); sprint(meas_x10);
        sprint(F(" exp=")); sprint(exp_per_tube_x10);
        sprint("TABLE: "), sprintln(SEG_MA_X10_TABLE[0]);

        bool tube_fault;
        if (meas_x10 < 0) {
            tube_fault = true;
            sprintln(F(" INA_ERR"));
        } else if (meas_x10 < (SEG_MA_X10_TABLE[0] - tol) ||
                   meas_x10 > (SEG_MA_X10_TABLE[0] + tol)) {
            tube_fault = true;
            sprintln(F(" FAULT"));
        } else {
            tube_fault = false;
            sprintln(F(" OK"));
        }

        if (tube_fault) {
            fault_found = true;
        }
    }

    if (crsf_was_active) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            SBI(MODE, MODE_CRSF);
        }
    }

    if (fault_found) {
        sprintln(F("[Monitor] Fault localized. Shutting down display."));
        setDisplayBrightness(0u);
    } else {
        for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
            setSymbolRawOnNumitron(i, saved[i]);
        crossfadeFromOldDigitsToNew();
    }
#endif
}

#if MONITOR_CALIBRATION_ENABLED
// Kalibracia: 4 urovne jasu (25/50/75/100), zapne vsetky filamenty.
// Pouzivame setDisplayBrightness() + waitForBrightnessSettle() namiesto
// forceBrightness() — jas rastie postupne cez ISR rampu, rovnako ako
// pri beznom pouzivani, takze kalibracia zodpoveda realnym podmienkam.
static const uint8_t CAL_BRIGHTNESS[] PROGMEM = {
    (uint8_t)(MAX_BRIGHTNESS / 4u),
    (uint8_t)(MAX_BRIGHTNESS / 2u),
    (uint8_t)((uint16_t)(MAX_BRIGHTNESS * 3u) / 4u),
    (uint8_t)(MAX_BRIGHTNESS)};
#define CAL_SEGS_PER_DIGIT 8u
#define CAL_TOTAL_SEGS     ((uint8_t)(DIGIT_COUNT * CAL_SEGS_PER_DIGIT))

bool runCalibration() {
#if !INA_ENABLED
    sprintln(F("[Cal] INA not enabled, skipping."));
    return false;
#else
    if (!Modules::INA219::isConnected()) {
        sprintln(F("[Cal] INA219 not found."));
        return false;
    }

    sprintln(F("[Cal] Starting calibration..."));

    uint8_t saved_digits[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
        saved_digits[i] = DIGITS[i];
    uint8_t saved_brightness;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        saved_brightness = _target_brightness;
    }
    const bool crsf_was_active = (bool)BIS(MODE, MODE_CRSF);
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        CBI(MODE, MODE_CRSF);
    }

    uint8_t all_buf[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
        all_buf[i] = 0xFFu;
    putDigitsToInputRegs(all_buf, DIGIT_COUNT);
    pushToOutputRegs();

    bool success        = true;
    SEG_MA_X10_TABLE[0] = 0u;

    for (uint8_t lvl = 0u; lvl < 4u; lvl++) {
        if (IS_PRESSED(L_BTN) || IS_PRESSED(R_BTN)) {
            sprintln(F("[Cal] Aborted by button press."));
            success = false;
            break;
        }

        const uint8_t b = pgm_read_byte(&CAL_BRIGHTNESS[lvl]);

        // Nastavime target a pockame kym ISR rampa dobehne na cielovy jas.
        // Meranie prebieha az po uplnom ustálení — identicky ako pri beznej prevadzke.
        setDisplayBrightness(b);
        waitForBrightnessSettle();

        const int16_t meas_x10 = readCurrentX10Sync();
        if (meas_x10 < 0) {
            sprintln(F("[Cal] INA error during measurement."));
            success = false;
            break;
        }

        const uint8_t per_seg = (uint8_t)((uint16_t)meas_x10 / CAL_TOTAL_SEGS);
        SEG_MA_X10_TABLE[lvl + 1u] = per_seg;

        sprint(F("[Cal] lvl="));
        sprint(lvl + 1u);
        sprint(F(" b="));
        sprint(b);
        sprint(F(" total_x10="));
        sprint(meas_x10);
        sprint(F(" seg_x10="));
        sprintln(per_seg);
    }

    for (uint8_t i = 1u; i < 5u; i++) {
        if (SEG_MA_X10_TABLE[i] < SEG_MA_X10_TABLE[i - 1u]) {
            SEG_MA_X10_TABLE[i] = SEG_MA_X10_TABLE[i - 1u];
            sprintln(F("[Cal] Warning: non-monotonic entry clamped."));
        }
    }

    for (uint8_t i = 0u; i < DIGIT_COUNT; i++)
        DIGITS[i] = saved_digits[i];
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();

    // Obnovime povodny jas — opat cez rampu, nie nasilu.
    setDisplayBrightness(saved_brightness);

    if (crsf_was_active) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            SBI(MODE, MODE_CRSF);
        }
    }

    if (success) {
        sprintln(F("[Cal] Done."));
    }
    return success;
#endif
}

void saveCalibration() {
    EEPROM.update(MONITOR_EEPROM_BASE_ADDR, MONITOR_EEPROM_MAGIC);
    for (uint8_t i = 0u; i < 5u; i++) {
        EEPROM.update(MONITOR_EEPROM_BASE_ADDR + 1u + i, SEG_MA_X10_TABLE[i]);
    }
    sprintln(F("[Monitor] Calibration saved to EEPROM."));
}

void clearCalibration() {
    EEPROM.update(MONITOR_EEPROM_BASE_ADDR, 0xFFu);
    loadCalibration(); // reload defaults into RAM
    sprintln(F("[Monitor] Calibration cleared from EEPROM."));
}

bool hasCalibrationSaveInEEPROM() {
    return (EEPROM.read(MONITOR_EEPROM_BASE_ADDR) == MONITOR_EEPROM_MAGIC);
}

void loadCalibration() {
    if (!hasCalibrationSaveInEEPROM()) {
        sprintln(
            F("[Monitor] No calibration in EEPROM, using factory defaults."));
        return;
    }
    for (uint8_t i = 0u; i < 5u; i++) {
        SEG_MA_X10_TABLE[i] = EEPROM.read(MONITOR_EEPROM_BASE_ADDR + 1u + i);
    }
    SEG_MA_X10_TABLE[0] = 0u;
    for (uint8_t i = 1u; i < 5u; i++) {
        if (SEG_MA_X10_TABLE[i] < SEG_MA_X10_TABLE[i - 1u] ||
            SEG_MA_X10_TABLE[i] == 0u) {
            sprintln(F(
                "[Monitor] Corrupt calibration data, using factory defaults."));
            const uint8_t defaults[5] = {0u, 25u, 48u, 72u, 88u};
            for (uint8_t j = 0u; j < 5u; j++)
                SEG_MA_X10_TABLE[j] = defaults[j];
            return;
        }
    }
    sprintln(F("[Monitor] Calibration loaded from EEPROM."));
}

#else // !MONITOR_CALIBRATION_ENABLED

bool runCalibration() {
    return false;
}
void saveCalibration() {}
void loadCalibration() {}

#endif // MONITOR_CALIBRATION_ENABLED

static uint8_t _consecutive_faults = 0u;
static bool    _fault_latched       = false; // set after confirmed fault; stops all further checks

void onSecondTick(FaultCallback cb) {
    if (_fault_latched)          // display already shut down, nothing more to do
        return;
    if (BIS(MODE, MODE_CRSF))
        return;

#if INA_ENABLED
    // Konverzia mala cely predoslu sekundu na dokoncenie (~68ms).
    // Ak nie je hotova (prvy tik alebo chyba), preskocime a startujeme novu.
    const bool ready = Modules::INA219::conversionReady();
    Modules::INA219::
        clearConversionFlag(); // startuje novu konverziu pre dalsi tik
    if (!ready)
        return;
#endif

    FaultReport     report{};
    const FaultType ft = checkIntegrity(&report);

    sprint(F("[Monitor] check type="));
    sprint(ft);
    sprint(F(" meas="));
    sprint(report.measured_x10);
    sprint(F(" exp="));
    sprintln(report.expected_x10);

    if (ft == FAULT_NONE) {
        _consecutive_faults = 0u;
        return;
    }

    if (ft == FAULT_TOO_DIM || ft == FAULT_INA_ERR)
        return;

    if (++_consecutive_faults < MONITOR_CONFIRM_TICKS) {
        sprint(F("[Monitor] Transient fault ("));
        sprint(_consecutive_faults);
        sprint(F("/"));
        sprint(MONITOR_CONFIRM_TICKS);
        sprint(F("): type="));
        sprint(ft);
        sprint(F(" meas="));
        sprint(report.measured_x10);
        sprint(F(" exp="));
        sprintln(report.expected_x10);
        return;
    }

    _consecutive_faults = 0u;
    sprintln(F("[Monitor] Confirmed fault! Running digit isolation scan..."));
    localizeFault(&report);
    if (cb)
        cb(report);
    _fault_latched = true; // latch: no further scans or checks after this
}

} // namespace Monitor
