/*
 * drivers/led.h
 *
 *  Mimoriadne robustny driver pre indikacnu RGB LED-ku hodin.
 */

#ifndef LED_H
#define LED_H

// Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
// !! Treba sa uistit, ze trimmer je nastaveny na najvyssiu hodnotu.
#define LED_BRIGHTNESS_TRIM     PC0

#define LED_R_REG               OCR1A
#define LED_G_REG               OCR1B

#define LED_B_TOP_REG           ((uint8_t)255)
// ! Toto by mala byt mocnina dvojky aby sme mali periodu konzistentnu.
#define LED_B_STEP              ((uint8_t)16) // 16 krokov

// Kazda LED-ka ma svoj rezistor:
// R: 420 R, G: 620 R, B: 620 R
#define MAX_LED_BRIGHTNESS     255
#define DEFAULT_LED_BRIGHTNESS (MAX_LED_BRIGHTNESS / 4)

////////////////////////////////

namespace Led {
    namespace Color {
        // R, G - Timer 1
        // B - Timer 2 (ten je uz pouzity, takze pouzijeme softverove PWM)
        enum Type : uint8_t {
            RED   = PB1,
            GREEN = PB2,
            BLUE  = PB3,
        };
    }

    void setupRegisters();

    void setColor(uint8_t color);

    // Jediny volny casovac je Timer1
    void setColorBrightness(uint8_t led, uint8_t val);

    void setRGB(uint8_t r, uint8_t g, uint8_t b);

    void setBrightness(uint8_t val);

    void onMainLoopTick();

    void onISRTick();
}

#endif // LED_H
