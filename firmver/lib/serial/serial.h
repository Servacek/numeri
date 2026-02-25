// uart_serial_replace.cpp
// Drop this into an Arduino/AVR project. Provides Serial.begin/print/println replacements.

#ifndef LIBS_SERIAL_H
#define LIBS_SERIAL_H

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

// fhelper.h defines __FlashStringHelper and the F() macro (uses PSTR for real flash placement)
#include "fhelper.h"

// base constants (match Arduino)
#define DEC 10
#define HEX 16
#define OCT 8
#define BIN 2

class SerialClass {
  public:
    void begin(unsigned long baud) {
        // set UBRR from baud param (F_CPU must be defined)
        uint16_t ubrr = (uint16_t)((F_CPU / 16UL / baud) - 1UL);
        UBRR0H        = (uint8_t)(ubrr >> 8);
        UBRR0L        = (uint8_t)ubrr;

        UCSR0A = 0;
        UCSR0B = (1 << TXEN0);                  // Enable TX only
        UCSR0C = (1 << UCSZ01) | (1 << UCSZ00); // 8N1
    }

    // low-level write of one byte
    size_t write(uint8_t c) {
        while (!(UCSR0A & (1 << UDRE0)))
            ;
        UDR0 = c;
        return 1;
    }

    // write string (null-terminated, in SRAM)
    size_t write(const char* str) {
        if (!str)
            return 0;
        size_t n = 0;
        while (*str) {
            write((uint8_t)*str++);
            n++;
        }
        return n;
    }

    // write string stored in flash (PROGMEM) — reads byte-by-byte with pgm_read_byte
    size_t write(const __FlashStringHelper* fstr) {
        if (!fstr)
            return 0;
        const char* p = reinterpret_cast<const char*>(fstr);
        size_t n = 0;
        uint8_t c;
        while ((c = pgm_read_byte(p++)) != 0) {
            write(c);
            n++;
        }
        return n;
    }

    // flush (wait for transmission complete)
    void flush() {
        // Wait for the transmit complete flag
        while (!(UCSR0A & (1 << TXC0)))
            ;
        // clear flag by writing a 1 (writing 1 clears many flags on AVR)
        UCSR0A |= (1 << TXC0);
    }

    // ---- print overloads ----
    size_t print(const char* s) {
        return write(s);
    }
    size_t print(char c) {
        return write((uint8_t)c);
    }
    size_t print(unsigned char b, int base = DEC) {
        return printNumber((unsigned long)b, base);
    }
    size_t print(int n, int base = DEC) {
        return printNumber((long)n, base);
    }
    size_t print(unsigned int n, int base = DEC) {
        return printNumber((unsigned long)n, base);
    }
    size_t print(long n, int base = DEC) {
        return printNumber(n, base);
    }
    size_t print(unsigned long n, int base = DEC) {
        return printNumber(n, base);
    }
    size_t print(double n, int digits = 2) {
        return printFloat(n, digits);
    }
    size_t print(bool b) {
        return write(b ? "true" : "false");
    }
    // flash string — reads from PROGMEM via pgm_read_byte
    size_t print(const __FlashStringHelper* fstr) {
        return write(fstr);
    }

    // ---- println overloads ----
    size_t println(const char* s) {
        size_t r = print(s);
        newline();
        return r + 2;
    }
    size_t println(char c) {
        size_t r = print(c);
        newline();
        return r + 2;
    }
    size_t println(unsigned char b, int base = DEC) {
        size_t r = print(b, base);
        newline();
        return r + 2;
    }
    size_t println(int n, int base = DEC) {
        size_t r = print(n, base);
        newline();
        return r + 2;
    }
    size_t println(unsigned int n, int base = DEC) {
        size_t r = print(n, base);
        newline();
        return r + 2;
    }
    size_t println(long n, int base = DEC) {
        size_t r = print(n, base);
        newline();
        return r + 2;
    }
    size_t println(unsigned long n, int base = DEC) {
        size_t r = print(n, base);
        newline();
        return r + 2;
    }
    size_t println(double n, int digits = 2) {
        size_t r = print(n, digits);
        newline();
        return r + 2;
    }
    size_t println(bool b) {
        size_t r = print(b);
        newline();
        return r + 2;
    }
    size_t println(void) {
        newline();
        return 2;
    } // println() with no args
    // flash string — reads from PROGMEM via pgm_read_byte
    size_t println(const __FlashStringHelper* fstr) {
        size_t r = write(fstr);
        newline();
        return r + 2;
    }

    // convenience alias for C-style names (you already had serial_print)
    void serial_print(const char* s) {
        print(s);
    }
    void serial_println(const char* s) {
        println(s);
    }

  private:
    // write CRLF (Arduino println uses '\r' + '\n')
    void newline() {
        write('\r');
        write('\n');
    }

    // print signed/unsigned integers (handles negative)
    size_t printNumber(long n, int base) {
        if (base < 2)
            base = 10;
        char  buf[33]; // enough for 32-bit binary + null
        char* p = buf + sizeof(buf) - 1;
        *p      = '\0';

        unsigned long num;
        bool          negative = false;
        if (n < 0 && base == DEC) {
            negative = true;
            num      = (unsigned long)(-n);
        } else {
            num = (unsigned long)n;
        }

        // special case 0
        if (num == 0) {
            *(--p) = '0';
        } else {
            while (num > 0) {
                unsigned long rem = num % base;
                num /= base;
                if (rem < 10)
                    *(--p) = '0' + rem;
                else
                    *(--p) = 'A' + (rem - 10);
            }
        }

        if (negative)
            *(--p) = '-';
        return write(p);
    }

    size_t printNumber(unsigned long n, int base) {
        if (base < 2)
            base = 10;
        char  buf[33];
        char* p = buf + sizeof(buf) - 1;
        *p      = '\0';

        if (n == 0) {
            *(--p) = '0';
        } else {
            while (n > 0) {
                unsigned long rem = n % base;
                n /= base;
                if (rem < 10)
                    *(--p) = '0' + rem;
                else
                    *(--p) = 'A' + (rem - 10);
            }
        }
        return write(p);
    }

    // print floats with 'digits' fractional digits (similar to Arduino)
    size_t printFloat(double number, int digits) {
        if (isnan(number))
            return write("nan");
        if (isinf(number))
            return write("inf");
        if (number > 4294967040.0)
            return write("ovf"); // overflow similar to Arduino
        if (number < -4294967040.0)
            return write("ovf");

        // Handle negative
        size_t n = 0;
        if (number < 0.0) {
            n += write('-');
            number = -number;
        }

        // Round correctly so that print(1.999, 2) prints "2.00"
        double rounding = 0.5;
        for (int i = 0; i < digits; ++i)
            rounding /= 10.0;
        number += rounding;

        unsigned long int_part  = (unsigned long)number;
        double        remainder = number - (double)int_part;

        // print integer part
        n += printNumber(int_part, DEC);

        // print fractional part
        if (digits > 0) {
            n += write('.');

            while (digits-- > 0) {
                remainder *= 10.0;
                int toPrint = (int)remainder;
                n += write((uint8_t)('0' + toPrint));
                remainder -= toPrint;
            }
        }
        return n;
    }
};

// Single global instance like Arduino's Serial (defined in serial.cpp)
extern SerialClass Serial;

/* USAGE EXAMPLES:

    Serial.begin(115200);
    Serial.print("Hello ");
    Serial.print(123);
    Serial.print(' ');
    Serial.println(3.14159);         // default 2 decimals -> "3.14\r\n"
    Serial.println(255, HEX);       // "FF\r\n"
    Serial.println();               // just CRLF
    Serial.print(true);             // "true"

    // Floats with custom digits:
    Serial.println(3.14159, 4);     // "3.1416\r\n"
*/

#endif // LIBS_SERIAL_H
