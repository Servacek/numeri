/*
 * drivers/led.h
 *
 * Mimoriadne robustny driver pre indikacnu RGB LED-ku hodin.
 *
 * Potrebujeme vediet nastavit celkovy jas ledky, ten udava
 * maximalnu hodnotu jasu pre kazdu farbu. Potom udavame cislom
 * od 0 - 100 uroven jasu v percentach pre kazdu farbu.
 */

#ifndef LED_H
#define LED_H

////////////////////////////////
// ? Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
// !! Treba sa uistit, ze trimmer je nastaveny na najvyssiu hodnotu.
#define LED_BRIGHTNESS_TRIM     PC0
////////////////////////////////

#define LED_R_TOP_REG           OCR1A
#define LED_G_TOP_REG           OCR1B

// Modra ledka je implementovana cez softverove PWM lebo uz nemame volny casovac.
// ! Toto by mala byt mocnina dvojky aby sme mali periodu konzistentnu.
#define LED_B_STEP              ((uint8_t)16)

// Kazda LED-ka ma svoj rezistor:
// R: 420 R, G: 620 R, B: 620 R
#define MAX_LED_BRIGHTNESS     255
#define DEFAULT_LED_BRIGHTNESS (MAX_LED_BRIGHTNESS / 4)

////////////////////////////////

namespace Led {
    extern uint8_t brightness;

    namespace Color {
        enum Type : uint8_t {
            RED   = PB1,
            GREEN = PB2,
            BLUE  = PB3,
        };
    }

    void setupRegisters();

    ///////////////////

    // Nastavime v percetach hodnoty jednotlivych farieb ledky.
    // 100% = brightness
    void setRGB(uint8_t r, uint8_t g, uint8_t b);

    void setColor(uint8_t color);

    void setRGB(uint8_t r, uint8_t g, uint8_t b);

    void setBrightness(uint8_t val);

    ///////////////////

    void onMainLoopTick();

    void onISRTick();
} // namespace Led

#endif // LED_H
