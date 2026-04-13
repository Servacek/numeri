#ifndef LOGGING_H
#define LOGGING_H

#include "const.h"

#if SERIAL_ENABLED
// #include <HardwareSerial.h>
// #include "libs/debug/HardwareSerial.h"
#include <serial.h>

#define sprint(...) Serial.print(__VA_ARGS__)
// Pre debugovacie ucely sa nam vyplati flushovat za kazdym az vidime presne kde program skoncil.
#define sprintln(...)                                                          \
    Serial.println(__VA_ARGS__);                                               \
    Serial.flush();

#define warn(...)                                                              \
    do {                                                                       \
        Serial.print(F("[WARN] "));                                            \
        Serial.print(__VA_ARGS__);                                             \
        Serial.flush();                                                        \
    } while (0)

#define info(...)                                                              \
    do {                                                                       \
        Serial.print(F("[INFO] "));                                            \
        Serial.print(__VA_ARGS__);                                             \
        Serial.flush();                                                        \
    } while (0)

#define error(...)                                                             \
    do {                                                                       \
        Serial.print(F("[ERROR] "));                                           \
        Serial.print(__VA_ARGS__);                                             \
        Serial.flush();                                                        \
    } while (0)
#define critical(...)                                                          \
    do {                                                                       \
        Serial.print(F("[CRITICAL] "));                                           \
        Serial.print(__VA_ARGS__);                                             \
        Serial.flush();                                                        \
    } while (0)
#else
#define sprint(...)
#define sprintln(...)
#define warn(...)
#define info(...)
#define error(...)
#define critical(...)
#endif

#endif // LOGGING_H
