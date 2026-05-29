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

    struct RGB {
        uint8_t r, g, b;
    };

    namespace Color {
        enum Type : uint8_t {
            RED   = PB1,
            GREEN = PB2,
            BLUE  = PB3,
        };
    }

    // Stavy indikacej LED podla prirucky (strana 16)
    namespace Palette {
        constexpr RGB STARTUP       = {255, 255,   0}; // zlta    - inicializacia a start
        constexpr RGB SYNCING       = {255, 165,   0}; // oranzova - synchronizacia prebieha
        constexpr RGB SYNC_OK       = {  0, 255,   0}; // zelena  - synchronizacia uspesna
        constexpr RGB SYNC_FAIL     = {255,   0,   0}; // cervena - synchronizacia zlyhala / nadprud
        constexpr RGB FIRMWARE_LOAD = {  0,   0, 255}; // modra   - nahravanie firmveru / podprud
        constexpr RGB FACTORY_RESET = {255, 255, 255}; // biela   - obnovenie vyrobnych nastaveni
    }

    void setupRegisters();

    ///////////////////

    // Nastavime v percetach hodnoty jednotlivych farieb ledky.
    // 100% = brightness
    void setRGB(uint8_t r, uint8_t g, uint8_t b);
    void setRGB(RGB color);

    void setColor(uint8_t color);

    void setBrightness(uint8_t val);

    // Zamkne LED - dalsie volania setRGB/setColor su ignorovane az do unlock().
    void lock();

    // Odistenie zamku - dalsie volania setRGB/setColor su opat platne.
    void unlock();

    ///////////////////

    void onMainLoopTick();

    void onISRTick();
} // namespace Led

#endif // LED_H
