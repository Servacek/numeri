#include <avr/pgmspace.h>
#include <EEPROM.h>

#include "input.h"
#include "monitor.h"
#include "display.h"
#include "reg.h"
#include "isr.h"
#include "modules.h"

namespace Monitor {

// Kalibracia: pri MONITOR_CALIBRATION_ENABLED=0 je tabulka v PROGMEM (setrí 5 B RAM).
#if MONITOR_CALIBRATION_ENABLED
static uint8_t SEG_MA_X10_TABLE[5] = { 0u, 25u, 48u, 72u, 88u };
#else
static const uint8_t SEG_MA_X10_TABLE[5] PROGMEM = { 0u, 25u, 48u, 72u, 88u };
#endif

// Pocet svietiacich filamentov (vsetky 8 bitov, DP zahrnuty).
uint8_t countLitSegments() {
    uint8_t n = 0u;
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) {
        n += (uint8_t)__builtin_popcount(DIGITS[i]);
    }
    return n;
}

// Interpolacia tabulky pri jase b.
static uint8_t segCurrentX10(uint8_t b) {
    if (b == 0u)            return 0u;
#if MONITOR_CALIBRATION_ENABLED
    if (b >= MAX_BRIGHTNESS) return SEG_MA_X10_TABLE[4];
#else
    if (b >= MAX_BRIGHTNESS) return pgm_read_byte(&SEG_MA_X10_TABLE[4]);
#endif

    const uint8_t pos64 = (uint8_t)(((uint16_t)b * 64u + (MAX_BRIGHTNESS / 2u))
                                    / MAX_BRIGHTNESS);
    const uint8_t i    = MIN(pos64 >> 4u, 3u);
    const uint8_t frac = pos64 & 0x0Fu;
#if MONITOR_CALIBRATION_ENABLED
    const uint8_t lo = SEG_MA_X10_TABLE[i];
    const uint8_t hi = SEG_MA_X10_TABLE[i + 1u];
#else
    const uint8_t lo = pgm_read_byte(&SEG_MA_X10_TABLE[i]);
    const uint8_t hi = pgm_read_byte(&SEG_MA_X10_TABLE[i + 1u]);
#endif
    return (uint8_t)((int16_t)lo
                     + ((int16_t)((int8_t)(hi - lo)) * (int16_t)frac + 8) / 16);
}

// Synchronizovane citanie INA: vycisti CNVR a pocka na novu konverziu.
static int16_t readCurrentX10() {
#if !INA_ENABLED
    return -1;
#else
    if (!Modules::INA.isConnected()) return -1;
    (void)Modules::INA.getPower(); // vymaze CNVR
    for (uint8_t t = 0u; t < MONITOR_INA_SYNC_TIMEOUT_MS; t++) {
        wait(1u);
        if (Modules::INA.getConversionFlag()) break;
    }
    const float raw = Modules::INA.getCurrent_mA();
    return (raw > 0.0f) ? (int16_t)(raw * 10.0f + 0.5f) : 0;
#endif
}

#if MONITOR_CALIBRATION_ENABLED
// Nastavi jas okamzite (obe premenne) bez hladkeho rampovania.
// Pozor: nepouzivat setDisplayBrightness() - ta len nastavi target a necha ISR rampovat
// 1 krok / ~102 ms, takze 60ms settle nestaci na ziadnu zmenu.
static void forceBrightness(uint8_t b) {
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        _target_brightness = b;
        if (b == 0u) {
            STOP_DISPLAY_PWM();
        } else {
            if (!IS_DISPLAY_PWM_ON()) START_DISPLAY_PWM();
            DISPLAY_PWM_REG = b;
        }
    }
}
#endif

// Pomocna funkcia: nastavi FaultReport na nulove hodnoty a vrati typ poruchy.
static FaultType earlyFault(FaultReport* out, FaultType t) {
    if (out) { out->type = t; out->measured_x10 = 0; out->expected_x10 = 0; }
    return t;
}

uint16_t estimateCurrentX10() {
    uint8_t b;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { b = _target_brightness; }
    return (uint16_t)countLitSegments() * (uint16_t)segCurrentX10(b);
}

FaultType checkIntegrity(FaultReport* out) {
#if !INA_ENABLED
    if (out) { out->type = FAULT_INA_ERR; }
    return FAULT_INA_ERR;
#else
    if (!Modules::INA.isConnected())                    return earlyFault(out, FAULT_INA_ERR);
    if (countLitSegments() < MONITOR_MIN_SEGS_FOR_CHECK) return earlyFault(out, FAULT_TOO_DIM);
    const uint16_t expected_x10 = estimateCurrentX10();
    if (expected_x10 == 0u)                    return earlyFault(out, FAULT_TOO_DIM);
    const int16_t measured_x10 = readCurrentX10();
    if (measured_x10 < 0)                      return earlyFault(out, FAULT_INA_ERR);

    const int16_t tol        = (int16_t)((uint32_t)expected_x10
                                          * MONITOR_FAULT_TOLERANCE_PCT / 100u);
    const int16_t low_limit  = (int16_t)expected_x10 - tol;
    const int16_t high_limit = (int16_t)expected_x10 + tol;

    FaultType ft = FAULT_NONE;
    if      (measured_x10 < low_limit)  ft = FAULT_OPEN;
    else if (measured_x10 > high_limit) ft = FAULT_SHORT;

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
    if (!report) return;
    report->digit_fault_mask = 0u;

#if !INA_ENABLED
    return;
#else
    static const uint8_t ALL_SEGS = 0xFFu; // vsetky 8 filamentov

    uint8_t b;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { b = _target_brightness; }
    const int16_t expected_1digit_x10 = (int16_t)(8u * (uint16_t)segCurrentX10(b));
    const int16_t tol = (int16_t)((uint32_t)expected_1digit_x10
                                   * MONITOR_FAULT_TOLERANCE_PCT / 100u);

    uint8_t saved[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) saved[i] = DIGITS[i];
    const bool crsf_was_active = (bool)BIS(MODE, MODE_CRSF);
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { CBI(MODE, MODE_CRSF); }

    uint8_t test_buf[DIGIT_COUNT];
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        for (uint8_t i = 0u; i < DIGIT_COUNT; i++) test_buf[i] = 0u;
        test_buf[d] = ALL_SEGS;

        putDigitsToInputRegs(test_buf, DIGIT_COUNT);
        pushToOutputRegs();
        wait(MONITOR_SETTLE_MS);

        const int16_t meas_x10 = readCurrentX10();
        if (meas_x10 < 0) {
            report->digit_fault_mask |= (1u << d);
        } else if (meas_x10 < (expected_1digit_x10 - tol) ||
                   meas_x10 > (expected_1digit_x10 + tol)) {
            report->digit_fault_mask |= (1u << d);
        }

        sprint(F("  Digit ")); sprint(d);
        sprint(F(": meas=")); sprint(meas_x10);
        sprint(F(" exp="));   sprint(expected_1digit_x10);
        sprint(F(" fault=")); sprintln((report->digit_fault_mask >> d) & 1u);
    }

    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) DIGITS[i] = saved[i];
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
    if (crsf_was_active) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { SBI(MODE, MODE_CRSF); }
    }
#endif
}

#if MONITOR_CALIBRATION_ENABLED
// Kalibracia: 4 urovne jasu (25/50/75/100), zapne vsetky filamenty a meri
static const uint8_t CAL_BRIGHTNESS[4] PROGMEM = {
    (uint8_t)(MAX_BRIGHTNESS / 4u),
    (uint8_t)(MAX_BRIGHTNESS / 2u),
    (uint8_t)((uint16_t)(MAX_BRIGHTNESS * 3u) / 4u),
    (uint8_t)(MAX_BRIGHTNESS),
};
#define CAL_SEGS_PER_DIGIT  8u
#define CAL_TOTAL_SEGS      ((uint8_t)(DIGIT_COUNT * CAL_SEGS_PER_DIGIT))

bool runCalibration() {
#if !INA_ENABLED
    sprintln(F("[Cal] INA not enabled, skipping."));
    return false;
#else
    if (!Modules::INA.isConnected()) {
        sprintln(F("[Cal] INA219 not found."));
        return false;
    }

    sprintln(F("[Cal] Starting calibration..."));

    uint8_t saved_digits[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) saved_digits[i] = DIGITS[i];
    uint8_t saved_brightness;
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { saved_brightness = _target_brightness; }
    const bool crsf_was_active = (bool)BIS(MODE, MODE_CRSF);
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { CBI(MODE, MODE_CRSF); }

    uint8_t all_buf[DIGIT_COUNT];
    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) all_buf[i] = 0xFFu;
    putDigitsToInputRegs(all_buf, DIGIT_COUNT);
    pushToOutputRegs();

    bool success = true;
    SEG_MA_X10_TABLE[0] = 0u;

    for (uint8_t lvl = 0u; lvl < 4u; lvl++) {
        if (IS_PRESSED(L_BTN) || IS_PRESSED(R_BTN)) {
            sprintln(F("[Cal] Aborted by button press."));
            success = false;
            break;
        }

        const uint8_t b = pgm_read_byte(&CAL_BRIGHTNESS[lvl]);
        forceBrightness(b);
        wait(MONITOR_SETTLE_MS);
        const int16_t meas_x10 = readCurrentX10();
        if (meas_x10 < 0) {
            sprintln(F("[Cal] INA error during measurement."));
            success = false;
            break;
        }

        const uint8_t per_seg = (uint8_t)((uint16_t)meas_x10 / CAL_TOTAL_SEGS);
        SEG_MA_X10_TABLE[lvl + 1u] = per_seg;

        sprint(F("[Cal] lvl=")); sprint(lvl + 1u);
        sprint(F(" b="));        sprint(b);
        sprint(F(" total_x10=")); sprint(meas_x10);
        sprint(F(" seg_x10="));   sprintln(per_seg);
    }

    for (uint8_t i = 1u; i < 5u; i++) {
        if (SEG_MA_X10_TABLE[i] < SEG_MA_X10_TABLE[i - 1u]) {
            SEG_MA_X10_TABLE[i] = SEG_MA_X10_TABLE[i - 1u];
            sprintln(F("[Cal] Warning: non-monotonic entry clamped."));
        }
    }

    for (uint8_t i = 0u; i < DIGIT_COUNT; i++) DIGITS[i] = saved_digits[i];
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
    forceBrightness(saved_brightness);
    if (crsf_was_active) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { SBI(MODE, MODE_CRSF); }
    }

    if (success) sprintln(F("[Cal] Done."));
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
    sprintln(F("[Monitor] Calibration cleared from EEPROM."));
}

bool hasCalibrationSaveInEEPROM() {
    return (EEPROM.read(MONITOR_EEPROM_BASE_ADDR) == MONITOR_EEPROM_MAGIC);
}

void loadCalibration() {
    if (!hasCalibrationSaveInEEPROM()) {
        sprintln(F("[Monitor] No calibration in EEPROM, using factory defaults."));
        return;
    }
    for (uint8_t i = 0u; i < 5u; i++) {
        SEG_MA_X10_TABLE[i] = EEPROM.read(MONITOR_EEPROM_BASE_ADDR + 1u + i);
    }
    SEG_MA_X10_TABLE[0] = 0u;
    for (uint8_t i = 1u; i < 5u; i++) {
        if (SEG_MA_X10_TABLE[i] < SEG_MA_X10_TABLE[i - 1u] ||
            SEG_MA_X10_TABLE[i] == 0u) {
            sprintln(F("[Monitor] Corrupt calibration data, using factory defaults."));
            const uint8_t defaults[5] = { 0u, 25u, 48u, 72u, 88u };
            for (uint8_t j = 0u; j < 5u; j++) SEG_MA_X10_TABLE[j] = defaults[j];
            return;
        }
    }
    sprintln(F("[Monitor] Calibration loaded from EEPROM."));
}

#else // !MONITOR_CALIBRATION_ENABLED

// Prazdne stuby ked je kalibracia vypnuta — volania z main.cpp zostanu platne.
bool runCalibration() { return false; }
void saveCalibration() {}
void loadCalibration() {}

#endif // MONITOR_CALIBRATION_ENABLED

static uint8_t _consecutive_faults = 0u;

void onSecondTick(FaultCallback cb) {
    // Skip during crossfade; do not reset _consecutive_faults here.
    if (BIS(MODE, MODE_CRSF)) return;

    FaultReport report{};
    const FaultType ft = checkIntegrity(&report);

    sprint(F("[Monitor] check type=")); sprint(ft);
    sprint(F(" meas=")); sprint(report.measured_x10);
    sprint(F(" exp=")); sprintln(report.expected_x10);
    if (ft == FAULT_NONE) {
        _consecutive_faults = 0u;
        return;
    }

    if (ft == FAULT_TOO_DIM || ft == FAULT_INA_ERR) return;

    if (++_consecutive_faults < MONITOR_CONFIRM_TICKS) {
        sprint(F("[Monitor] Transient fault ("));
        sprint(_consecutive_faults);
        sprint(F("/")); sprint(MONITOR_CONFIRM_TICKS);
        sprint(F("): type=")); sprint(ft);
        sprint(F(" meas="));   sprint(report.measured_x10);
        sprint(F(" exp="));    sprintln(report.expected_x10);
        return;
    }

    _consecutive_faults = 0u;
    sprintln(F("[Monitor] Confirmed fault! Running digit isolation scan..."));
    localizeFault(&report);
    if (cb) cb(report);
}

} // namespace Monitor
