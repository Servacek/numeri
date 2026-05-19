#ifndef CRC_H
#define CRC_H

#include <stdint.h>

// CRC-8/SMBUS: poly=0x07, init=0x00, no reflection.

inline uint8_t crc8_step(uint8_t crc, uint8_t byte) {
    crc ^= byte;
    for (uint8_t i = 0; i < 8; i++)
        crc = (crc & 0x80) ? (crc << 1) ^ 0x07 : (crc << 1);
    return crc;
}

inline uint8_t crc8(const uint8_t* data, uint8_t len) {
    uint8_t crc = 0x00;
    while (len--)
        crc = crc8_step(crc, *data++);
    return crc;
}

#endif // CRC_H
