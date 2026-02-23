#ifndef DS3231_H
#define DS3231_H

#include <Wire.h>
#include <stdint.h>

// Registrova mapa DS3231 podla datasheetu
// 0x00 sekundy BCD 00-59
// 0x01 minuty  BCD 00-59
// 0x02 hodiny  BCD 00-23 (24h rezim)
// 0x03 den tyzdna bits[2:0] 1-7 (nepouzite)
// 0x04 datum   BCD 01-31
// 0x05 mesiac  BCD 01-12, bit7 storocie
// 0x06 rok     BCD 00-99 (posun od 2000)
// 0x0E riadiaci register
// 0x0F stavovy register
// 0x11 teplota MSB, 0x12 teplota LSB

namespace Modules {
namespace __DS3231 {

// Konstanty

constexpr uint8_t I2C_ADDR = 0x68;

constexpr uint8_t REG_SECONDS  = 0x00;
constexpr uint8_t REG_MINUTES  = 0x01;
constexpr uint8_t REG_HOURS    = 0x02;
constexpr uint8_t REG_DOW      = 0x03;
constexpr uint8_t REG_DATE     = 0x04;
constexpr uint8_t REG_MONTH    = 0x05;
constexpr uint8_t REG_YEAR     = 0x06;
constexpr uint8_t REG_CONTROL  = 0x0E;
constexpr uint8_t REG_STATUS   = 0x0F;
constexpr uint8_t REG_TEMP_MSB = 0x11;
constexpr uint8_t REG_TEMP_LSB = 0x12;

// Bity control
constexpr uint8_t CTRL_EOSC = 0x80; // 0 = bezi oscilator
constexpr uint8_t CTRL_INTCN = 0x04; // ovladanie prerusenia

// Bity status
constexpr uint8_t STATUS_OSF = 0x80; // oscilator stal
constexpr uint8_t STATUS_BSY = 0x04; // busy TCXO

// Limity na kontrolu
constexpr uint8_t MAX_SECONDS = 59;
constexpr uint8_t MAX_MINUTES = 59;
constexpr uint8_t MAX_HOURS   = 23;
constexpr uint8_t MAX_DATE    = 31;
constexpr uint8_t MIN_DATE    = 1;
constexpr uint8_t MAX_MONTH   = 12;
constexpr uint8_t MIN_MONTH   = 1;
constexpr uint8_t MAX_YEAR    = 99; // posun od 2000

struct DateTime {
    uint8_t  second; // 0-59
    uint8_t  minute; // 0-59
    uint8_t  hour;   // 0-23
    uint8_t  day;    // 1-31
    uint8_t  month;  // 1-12
    uint16_t year;   // cely rok napr 2026
};
// Verejne API
bool isConnected(); // skontroluje ack na I2C
bool oscillatorWasStopped(); // OSF bol nastavany
bool clearOscillatorStopFlag(); // vynuluje OSF
bool begin(); // zapne oscilator a 24h rezim
bool now(DateTime& dt); // nacita cas
bool adjust(const DateTime& dt); // zapise cas (rok 2000-2099)
bool getTemperature(int8_t& out); // vrati teplotu v stupnoch C

} // namespace DS3231
} // namespace Modules

#endif // DS3231_H
