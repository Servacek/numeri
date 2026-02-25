#ifndef LIBS_INA219_H
#define LIBS_INA219_H

// ─── INA219 minimalna implementacia ──────────────────────────────────────────
//
// Konfiguracia pre tento projekt:
//   Shunt:       INA_SHUNT_R     = 0.4 Ohm (0.2 Ohm rezistor + 0.2 Ohm stray)
//   Max prud:    INA_MAX_CURRENT = 0.5 A
//   Napatie:     16V rozsah
//   Averaging:   128 vzorkov
//
// Kalibracia (podla datasheetu sekcia 8.5.1):
//   Current_LSB = Max_Current / 32768 = 0.5 / 32768 = 15.259 uA/bit
//   Cal         = 0.04096 / (Current_LSB * Shunt_R)
//               = 0.04096 / (15.259e-6 * 0.4)
//               = 6710
//
// Prevod raw registra na prud x10 (bez float):
//   I [A]   = raw * Current_LSB = raw * 15.259e-6
//   I_x10   = I * 10 = raw * 152.59e-6
//           ~ (int32_t)raw * 5 >> 15   (chyba < 0.1%)
//
// Register map (INA219 datasheet Table 1):
//   0x00  Configuration
//   0x01  Shunt voltage   (read)
//   0x02  Bus voltage     (read)
//   0x03  Power           (read) — citanie vymaze CNVR bit
//   0x04  Current         (read) — platny az po kalibraci
//   0x05  Calibration     (read/write)
// ─────────────────────────────────────────────────────────────────────────────

#include <stdint.h>

#include <wire.h>

#include "main.h"


namespace Modules {
namespace INA219 {

constexpr uint8_t ADDR = INA219_ADDR;

// ─── Registre ─────────────────────────────────────────────────────────────────
constexpr uint8_t REG_CONFIG      = 0x00;
constexpr uint8_t REG_SHUNT       = 0x01;
constexpr uint8_t REG_BUS         = 0x02;
constexpr uint8_t REG_POWER       = 0x03;
constexpr uint8_t REG_CURRENT     = 0x04;
constexpr uint8_t REG_CALIBRATION = 0x05;

// ─── Konfiguracia ─────────────────────────────────────────────────────────────
// Config register (0x00) — 16 bit:
//
//  Bit 15:13  RST + reserved  = 000
//  Bit 12:11  BRNG            = 00   → 16V bus voltage range
//  Bit 10:9   PGA             = 01   → Gain /2, ±80mV shunt range
//                                      (max shunt = 0.5A * 0.4R = 200mV —
//                                       ale pouzivame /8 = ±320mV pre istotu)
//  Bit 10:9   PGA             = 11   → Gain /8, ±320mV
//  Bit 8:7    BADC            = 1111 → 128 samples averaging (~68ms)
//  Bit 6:3    SADC            = 1111 → 128 samples averaging (~68ms)
//  Bit 2:0    MODE            = 111  → Shunt and bus, continuous
//
//  BRNG=0 (16V), PGA=11 (/8, ±320mV), BADC=1111, SADC=1111, MODE=111
//  = 0b 0 00 11 1111 1111 111
//  = 0x 0 3   F   F   7
//  = 0x07FF — nie, rozpocitame presnejsie:
//
//  [15]   = 0    (no reset)
//  [14:13]= 00   (reserved)
//  [12:11]= 00   (BRNG = 16V)
//  [10:9] = 11   (PGA /8)
//  [8:7]  = 11   (BADC 128 samples = 0b1111 → bity 8,7,6,3... pozri tabulku)
//
// Podla Table 5 datasheetu:
//  BADC/SADC 1111 = 128 samples = bity [8:5] = 1111 pre bus, [4:1] = 1111 pre shunt
//
//  Config = BRNG<<13 | PGA<<11 | BADC<<7 | SADC<<3 | MODE
//         = 0<<13    | 3<<11   | 0xF<<7  | 0xF<<3  | 7
//         = 0x0000   | 0x1800  | 0x0780  | 0x0078  | 0x0007
//         = 0x1FFF
//
// Overenie: 0x1FFF = 0001 1111 1111 1111
//   [13:12]=00 BRNG=16V ✓, [11:10]=11 PGA=/8 ✓,
//   [9:7]=111+[6:3]=1111 → BADC=1111=128samp ✓
//   [6:3]=1111 SADC=128samp ✓, [2:0]=111 continuous ✓

constexpr uint16_t CONFIG_VALUE = 0x1FFF;

// Kalibracia: Cal = trunc(0.04096 / (Current_LSB * R_shunt))
//   Current_LSB = 0.5 / 32768 = 15.2588e-6 A
//   Cal = 0.04096 / (15.2588e-6 * 0.4) = 6710
constexpr uint16_t CAL_VALUE = 6710u;

// CNVR bit v bus voltage registri — konverzia dokoncena
constexpr uint16_t BUS_CNVR_BIT = (1 << 1);
// OVF bit — matematicke pretecenie pri vypocte prudu/vykonu
constexpr uint16_t BUS_OVF_BIT = (1 << 0);

// ─── API ──────────────────────────────────────────────────────────────────────

/**
 * @brief  Probe the I2C bus for the INA219.
 * @return true if device acknowledged.
 */
bool isConnected();

/**
 * @brief  Write config and calibration registers.
 *         Must be called after every power cycle — all INA219 registers
 *         are volatile and lose their values on power loss.
 * @return true on success.
 */
bool begin();

/**
 * @brief  Check if a fresh conversion is ready (CNVR bit in bus register).
 * @return true if new data is available.
 */
bool conversionReady();

/**
 * @brief  Clear the CNVR flag by reading the power register.
 *         Call this before waiting for the next fresh conversion.
 * @return true on success.
 */
bool clearConversionFlag();

/**
 * @brief  Read current in mA × 10 (fixed point, no floats).
 *         Returns 0 for negative readings (reverse current not expected here).
 *         Returns -1 on I2C error or OVF condition.
 * @param  out  Output value. Not modified on failure.
 * @return true on success.
 */
bool readCurrentX10(int16_t& out);

/**
 * @brief  Read bus voltage in millivolts.
 * @param  out  Output value. Not modified on failure.
 * @return true on success.
 */
bool readBusVoltage_mV(uint16_t& out);

} // namespace INA219
} // namespace Modules

#endif // LIBS_INA219_H
