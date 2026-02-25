#ifndef __FLASHSTRINGHELPER_H__
#define __FLASHSTRINGHELPER_H__

#include <avr/pgmspace.h>

// Opaque type used as a tag so the compiler picks the correct print() overload.
// Never instantiated — only pointers to it are used.
// Identical to the Arduino convention.
class __FlashStringHelper;

// Store the string literal in flash (program memory) and cast its address
// to the tag type so SerialClass::print/__FlashStringHelper overloads are called.
// Usage:  sprint(F("Hello"));  sprintln(F("World"));
#define F(string_literal) \
    (reinterpret_cast<const __FlashStringHelper *>(PSTR(string_literal)))

#endif // __FLASHSTRINGHELPER_H__
