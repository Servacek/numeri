#ifndef PROGMEM_H
#define PROGMEM_H

#define PROGMEM_READ_BYTE(addr, index)                                         \
    pgm_read_byte_near((const uint8_t*)(addr) + (index))
#define PROGMEM_READ_WORD(addr, index)                                         \
    pgm_read_word_near((const uint16_t*)(addr) + (index))

#endif // PROGMEM_H
