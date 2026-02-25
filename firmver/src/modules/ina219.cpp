#include "modules/ina219.h"

namespace Modules {
namespace INA219 {

// ─── Pomocne funkcie ──────────────────────────────────────────────────────────

// Precita 16-bitovy register (big-endian, podla INA219 datasheetu sekcia 8.5.3)
static bool readRegister(uint8_t reg, uint16_t& out) {
    Wire.beginTransmission(ADDR);
    Wire.write(reg);
    if (Wire.endTransmission() != 0)
        return false;

    if (Wire.requestFrom(ADDR, (uint8_t)2) < 2) {
        while (Wire.available())
            Wire.read(); // cistenie busu
        return false;
    }

    out = ((uint16_t)Wire.read() << 8) | Wire.read();
    return true;
}

// Zapise 16-bitovy register (big-endian)
static bool writeRegister(uint8_t reg, uint16_t val) {
    Wire.beginTransmission(ADDR);
    Wire.write(reg);
    Wire.write((uint8_t)(val >> 8));
    Wire.write((uint8_t)(val & 0xFF));
    return Wire.endTransmission() == 0;
}

// ─── Verejna API ─────────────────────────────────────────────────────────────

bool isConnected() {
    Wire.beginTransmission(ADDR);
    return Wire.endTransmission() == 0;
}

bool begin() {
    // Reset cipu pred konfiguraciou — bit 15 config registra
    if (!writeRegister(REG_CONFIG, 0x8000u))
        return false;

    // Zapiseme konfiguraciu a kalibraciu.
    // Kalibracia musi byt zapisana pred prvym citanim prudu,
    // inak current register vracia 0.
    if (!writeRegister(REG_CONFIG, CONFIG_VALUE))
        return false;
    if (!writeRegister(REG_CALIBRATION, CAL_VALUE))
        return false;

    return true;
}

bool conversionReady() {
    uint16_t bus = 0;
    if (!readRegister(REG_BUS, bus))
        return false;
    return (bus & BUS_CNVR_BIT) != 0;
}

bool clearConversionFlag() {
    // Citanie power registra vymaze CNVR bit (datasheet sekcia 8.6.3)
    uint16_t dummy = 0;
    return readRegister(REG_POWER, dummy);
}

bool readCurrentX10(int16_t& out) {
    uint16_t bus = 0;
    if (!readRegister(REG_BUS, bus))
        return false;

    // OVF bit znamena pretecenie — meranie je neplatne
    if (bus & BUS_OVF_BIT)
        return false;

    uint16_t raw_u = 0;
    if (!readRegister(REG_CURRENT, raw_u))
        return false;

    // Current register je signed 16-bit two's complement
    const int16_t raw = (int16_t)raw_u;

    // Prevod na mA x10 bez float:
    //   I [A]   = raw * Current_LSB = raw * 15.2588e-6
    //   I [mA]  = raw * 0.0152588
    //   I_x10   = raw * 0.152588          (x10 = jednotky 0.1 mA)
    //           ≈ (int32_t)raw * 5000 >> 15
    //
    // Overenie: 5000 / 32768 = 0.15259 ≈ 0.152588 (chyba < 0.01%) ✓
    //
    // Pouzivame int32_t aby sme sa vyhli preteceniu:
    //   max raw = 32767, * 5000 = 163 835 000 — zmesti sa do int32_t (max ~2.1e9) ✓
    const int32_t result = ((int32_t)raw * 5000L) >> 15;

    // Negativny prud nie je ocakavany (reverse current) — vratime 0
    out = (result < 0) ? 0 : (int16_t)result;
    return true;
}

bool readBusVoltage_mV(uint16_t& out) {
    uint16_t raw = 0;
    if (!readRegister(REG_BUS, raw))
        return false;

    // Bus voltage: bity [15:3], LSB = 4mV (datasheet Table 7)
    // Shift right 3, multiply by 4
    out = (uint16_t)((raw >> 3) * 4u);
    return true;
}

} // namespace INA219
} // namespace Modules
