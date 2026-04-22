#ifndef LOGGING_H
#define LOGGING_H
#include "const.h"

#if SERIAL_ENABLED
#include <serial.h>

#define sprint(...)   Serial.print(__VA_ARGS__)
#define sprintln(...) (void)(Serial.println(__VA_ARGS__), Serial.flush())
#define warn(msg)                                                              \
    (void)(Serial.print(F("[WARN] ")), Serial.print(msg), Serial.flush())
#define info(msg)                                                              \
    (void)(Serial.print(F("[INFO] ")), Serial.print(msg), Serial.flush())
#define issue(msg)                                                           \
    (void)(Serial.print(F("[ERROR] ")), Serial.print(msg), Serial.flush())
#define critical(msg)                                                          \
    (void)(Serial.print(F("[CRITICAL] ")), Serial.print(msg), Serial.flush())

#else
#define sprint(...)
#define sprintln(...)
#define warn(msg)
#define info(msg)
#define issue(msg)
#define critical(msg)
#endif

#endif // LOGGING_H
