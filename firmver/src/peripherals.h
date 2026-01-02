#ifndef PERIPHERALS_H
#define PERIPHERALS_H

#include <main.h>

#if RTC_ENABLED
#include <Wire.h>
#include <RTCLib.h>
#endif

#if INA_ENABLED
#include <INA219.h>
#endif

#if DCF77_ENABLED
#include <dcf77.h>
#endif

#if RTC_ENABLED
extern RTC_DS3231 RTC;
#endif

#if INA_ENABLED
extern INA219 INA;
#endif

inline bool DS3231_Present() {
    #if RTC_ENABLED
    Wire.beginTransmission(DS3231_ADDR);
    uint8_t err = Wire.endTransmission(); // 0 == ACK (device present)
    return (err == 0);
    #else
    return false;
    #endif
}

inline bool DCF77_Present() {
    #if DCF77_ENABLED
    // DCF77 modul OUT pin je pullnuty k 0 ak je zapojeny modul.
    return ADC_READ(DCF_OUT) == 0;
    #else
    return false;
    #endif
}

inline bool INA219_Present() {
    #if INA_ENABLED
    return INA.isConnected();
    #else
    return false;
    #endif
}

#endif // PERIPHERALS_H
