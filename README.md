# TODO:

# Hardware
- [x] Pojistka z vonku či zvnútra? (uvidí sa podľa návrhu) (najskôr zvnútra, zvonku je toho už dosť).
- [x] Kapacita na zdroji je príliš veľká pre USB-C špecifikáciu.
    - Pravdepodobne netreba tak veľkú kapacitu pretože numitronu nespúšťame všetky naraz.
- [ ] Detekcia poruchy segmentov (zatiaľ len manuálna diagnostika).
    - Pred každý register 1 Ohm rezistor ktorý bude merať prúdový odber.
        - Treba zistiť aký to bude mať dopad na jas a aká bude presnosť takéhoto merania.
    - Máme zápojenie s jedným 1R rezistorom ktorý napája celý displej,
      jeho úbytok je zosílený v rozdielovom zosiľňovači.
    - Toto nám dá pomerne schopný spôsob ako merať odber prúdu displeja
      alebo aspoň jednotlivých numitronov.
    - Zároveň by tento obvod mal ísť softvérovo vypnuť v prípade že sa niečo pokazí
      (napríklad vplyvom stárnutia súčiastok), a detektor by chybne detekoval poruchy.
        - No konfigurácia cez obrazovku hodín nie je ideálne pretože pri poruche
          by detekcia vypla čásť alebo celý displej, takže by hodiny nebolo možné konfigurovať.
    - Použijeme OZ alebo jednoduchý tranzistorový obvod?
- [x] ATtiny24 má príliš málo (2kB) pamäti flash pre utiahnutie programov na DCF77 demoduláciu.
    - Najväčší MCU so 14 pinmi z rady ATtiny je ATtiny84 (8kB) (https://www.vpcentrum.eu/attiny84a-pu-mikrokontroler-avr-flash-8kx8bit-eeprom-512b-sram-512b-dip14), čo je stále pomerne málo.
    - Prejdeme teda na ATmega328-PU ktorá má 32kB pamäte flash a 2kB pamäte RAM.
        - To nám umožní ľahšie vyvíjať softvér (bude kompatibilný s arduino UNO prototypom).
        - Dokáže utiahnuť bez modifikácií knižnicu od Uda Kleina na dekódovanie DCF77 signálu.
- [x] Ochrana pred prepätím na vstupe (vhodný transil) / pred skratom (vhodná rýchla poistka).
    - Transil použijeme [BZW06-5V8](https://www.gme.sk/v/1487314/stmicroelectronics-bzw06-5v8-unipolarny-transil),
      ktorý začne skratovať pri 5,8V čo by malo byť pod maximálnou hodnotou napätia pre IC s dosť veľkou rezervou.
    - Použijeme aspoň dva paralelne zapojené transily s vhodnou hodnotou, ideálne 5.5V pre čo najväčšiu prudovú výdrž.
- [x] Čo najkvalitnejšie Schottkyho diódy (s čo najmenším Uf) (1N5817)
    - K dispozícií sú pomerne veľké 1N5822, ktoré by mohli byť vhodnejšie než tie SR260.
    - Pre signálové linky použijeme, kde je dôležitá rýchlosť použijeme 1N4148.
    - Pre digitálne linky kde je dôležitý čo najmeší úbytok napätia aby bolo
      zkreslenie digitalnej hodnoty čo najmenšie použijeme 1N5819.
- ~~[ ] Ochrana proti opačnej polarite MOSFET-om~~
    - Zbytočná pri USB Typ C konektoroch
- [x] Mikrokontrolér by nemal byť vstrede ale na kraji keďže používame zreťazené registre.
- [x] Medzera medzi bankami s číslami hodín a minút by nemala presiahnuť 20mm (2x primer numitronu).
- [x] Medzera medzi bankami jednotlivých cifier čisiel by nemala presiahnuť 10mm (1x priemer numitronu).
- [x] Pri pajkovaní by vzdialenosť od pinov nemala byť menšia ako 3 mm (zvolili sme ~10mm).
- [x] Väčšie pady aspoň 2.2mm a diera 1.1mm
    - 95% pinov budú mať priemer pod 1mm, najmenší vrták je 1mm takže všetky diery ideálne chceme
      mať 1mm.
    - Aspoň milimiter materialu okolo diery pre istejšie leptanie.
    - Diery zväčšovať nebudeme, pady idealne ak by mali minimálne tak pol milimetra do každej strany.
    - Používame teardrops pre lepšiu spoľahlivosť pri vrtaní a odlievaní.
- [x] Poradie registrov bude netredične začínať jednotkami minút, pretože tak to vychádza
      podstatne lepšie na doske.
      - ~~Treba zistiť aké výhody a nevýhody toto potencionálne prinesie a aké veľké zmeny bude treba urobiť v prototype.~~
      - Zmien moc nie je, len sa zmení SERIN vstup a v kóde číslovanie registrov.
      - Veľké výhody ani optimalizácie v jedenom či druhom zapojení nevidím,
        keďže registre sú posuvné, pri zmene akéhokoľvek čísla musíme naposúvať
        všetky 4 čísla znovu.
- [x] Podpora signalizácie aj pre invertujúce DCF77 moduly.
    - LED-ka bude vyvedená zo MCU a ovládaná priamo DCF77 knižnicou, invertovanie vie byť ľahko zmenené v softvéri.
- [x] ~~Kapacitný trimmer pre detailné ladenie kryštálového oscilátora?~~
    - ~~Treba zistiť či nebude potrebný rezistor pre vybíjanie kondezátorov.~~ (Nepotrebuje, ATmega328p ho ma zabudovaný).
    - !!!! Problém je, že datasheet ATmega328p vyžaduje aby boli kondezátory C1 a C2 na XTAL1 a XTAL2 rovnaké.
    - Netreba úplne presný oscilátor, nemáme ho aj tak ako zmerať.
    - Možno viac výstuplé tlačítka budú vhodnejšie?
- [x] QR kód z logom obce s odkazom na online návod.
    - Logo obce nakoniec nebude pretože by QR-kód musel byť príliš veľky aby bolo vidno.
    - Na stránke 3D model hodín ~~(.stl) pre github.~~
      - (STL zobrazuje len bezfarebný vektorový model s veľmi malým rozlíšením detailov).
      - Lepšie bolo použiť zobrazovače modelov priamo od AutoCADu.
        (https://aps.autodesk.com/en/docs/viewer/v7/developers_guide/)
    - Postup práce, fotky...
    - Po nalepení sa treba uistiť, že QR-kód je čítateľný.
- [ ] Jas signalizačnej LED-ky by mal byť upraviteľný pomocou trimmeru, bez potreby úpravy softvéru.
    - Keďže budeme používať RGB diódu, priamo zapojený jeden trimmer nestačí,
      no na tri pre každú farbu nie je miesto ani to nie je uživateľský prívetivé.
    - [ ] Použijeme preto digitálny trimmer s offsetom?
- [x] Bezpečnostný obvod pre CR2032 batériu (od PANASONIC) podľa pomerne prísnych noriem od UL.
    - Obvod by mal obsahovať buď dve blokujúce diódy v sérií alebo jednu blokujúcu diódu
      a jeden rezistor tiež v sérií.
    - Použité diódy by mali byť krémikové (lat. silicium) aby zvodový prúd nepresiahol
      1% celkovej kapacity batérie počas jej života. Akýkoľvek väčší zvodový prúd ktorý
      by nabíjal batériu, ju môže poškodiť a tak skrátiť jej životnosť.
    - https://cr2032.co/protection-circuit-article.html
    - BUDE ZAHRNUTÉ V DS3231 RTC čípe.
- [x] Bolo by zaujimavé vytvoriť vlastnú anténu pre DCF77. Na to ale budeme potrebovať:
    - feritovú tyč aspoň 10x100mm (Aliexpress).
    - vynutie na cievku 0.3-0.5mm (AliExpress).
    - Indukčnosť vynutia z jádrom chceme mať okolo 5-10mH, aby sa veľkosť kondezátora
      pohybovala v pF pre presnejšie ladenie pomocou kapacitného trimmera.
    - Kondezátor by sa mal dávať radšej na anténu ako na samotný príjimací obvod,
      aby sme mohli anténu kedykoľvek jednoducho vymeniť.
    - tester tranzistorov s meraním indukčnosti a kapacity (Aliexpress).
    - ak by sme chceli byť hodne presný, treba generátor frekvencie a osciloskop.
    (https://www.aliexpress.com/item/1005007476871321.html?spm=a2g0o.productlist.main.2.4f4dc625Y27osO&algo_pvid=c280ab1b-e1fc-415f-a841-08b5a900e0ac&algo_exp_id=c280ab1b-e1fc-415f-a841-08b5a900e0ac-2&pdp_ext_f=%7B%22order%22%3A%22512%22%2C%22eval%22%3A%221%22%2C%22orig_sl_item_id%22%3A%221005007476871321%22%2C%22orig_item_id%22%3A%221005007156708206%22%7D&pdp_npi=4%40dis%21EUR%21145.19%2159.53%21%21%211171.85%21480.46%21%402103894417506270027512469e4cb1%2112000040910524318%21sea%21SK%216326788170%21ABX&curPageLogUid=UTDPevglkIv9&utparam-url=scene%3Asearch%7Cquery_from%3A)
    - Anténa vypadá rezonovať pri frekvencii 77.5KHz pomerne presne.
- [x] Pre vyriešenie problémov z presnosťou hodín na slepo (bez DCF77 synchronizácie)
      môžeme použiť modul HW-84 s RTC čipom DS3231-SN (industrial).
      Zároveň tým vyriešime problémy s pozíciou a bezpečným zapojením 3V mincovej Li batérie
      (modul čip spĺňa podmienky UL pre ochranu pred spätným prúdom).
    - Modul vypadá byť zapojený pomerne dobre, akurát treba odstrániť dva rezistory:
        - jeden pred diódov signalizujúcou externé napájanie a jeden pred
          nabíjacou diódov (budeme používať CR2032 ktoré nie sú nabijateľné).
    - Modul má aj senzor teploty (+- 3 °C).
    - Existujú dve verzie čipu DS3231-M (menej presný) a DS3231-SN (lepší).
- [x] Bloková schéma (na samostatnú stranu?).
- [x] RESET obvod (zabezpečenie proti viacerím resetom).
- [ ] Všetky elektrolyti ak je to možné, nahradiť keramikou.
    - Je treba si dať pozor na prudký pokles napätia pri prvom spustení hodín
      (hlavne pri rozsvietení displeja).
    - Pri keramika treba počítať s napäťovým skreslením.
    - 100nF kondezátor.
    - Treba zistiť koľko kapacity naozaj potrebujeme.
        - Ak bude treba rádovo viac ako 10uF, je treba implementovať soft-start obvod cez výkonový MOSFET.
- [ ] RESET obvod detekcia dlhého podržania (vymaže EEPROM a konfigurácie).
    - Pripojením RESET pinu na digitálny pin.
    - Treba otestovať na doske.
- [ ] Kryštáľ treba nízky +8MHz s chybovosťou <=30ppm
    - Stačí aj 30ppm keďže už ho nebudeme používať na presné počítanie času.
    - Čím vyššia frekvencia, tým vyššia spotreba aj keď v našom prípade je spotreba čipu
      zastienená spotrebou numitronou, takže je zanedbateľná.
    - Keďže MCU už nebude bežať cez batériu, spotrebu netreba riešiť.
    - Použíjeme 16MHz kryštáľ pretože bol používaný pri testovaní a ponúka veľkú flexibilitu.
    - Treba otestovať na doske.
- [ ] Zväčšiť šírku všetkých čiar a textu na strane súčiastok.
~~- [ ] Možnosť komunikácie cez USB C port?~~
    ~~- D+ a D- pripojené na niektoré piny ATMEGA328 cez jumpre.~~
    https://www.youtube.com/watch?v=6U_bHTnFu-g
    https://www.obdev.at/products/vusb/index.html
    - Teoreticky možné ale zbytočné pretože tak jednoduchý firmvér by nemal potrebovať aktualizácie
      ak aj áno, pre vývoj firmvéru je treba mať hodiny fyzicky u seba pre testovanie.


# Pájkovanie
- [ ] Pasta na ošetrenie medennej dosky proti korózií a skratom. (má čas ale dôležité pre finálny výsledok)
- [x] Ferit na VBUS?
    - Zmenší rušenie a zabráni nárazovým prúdom pri pripojení do siete.
    - Dovolí mať väčšiu kapacitu než predpisuje špecifikácia pre USB.
        - Treba zistiť o koľko.
~~- [ ] Doska nastriekaná na čierno a text (silkscreen) biely pre lepší kontrast?~~
    - Nemáme odkiaľ vziať biely text, keďže nemáme farebnú laserovú tlačiareň.
- [ ] Resetovateľné polymérové poistky by mali byť osadené aj pri každom registre namiesto zbytočných jumper káblov.
    - Registre majú síce 500mA limit pre každý kanál (tento limit klesá s rastúcou teplotou),
      ale cez kanály by nemalo ísť viac ako 150mA dlhodobo.
    - Poistka by mala mať čo najmenší odpor v neaktivovanom stave


# Software
- [ ] Ukládať nastavenia do EEPROM.
- [ ] Animácie pri štarte, prip. pri kontrole segmentov.
- [ ] Watchdog podľa komplexity softvéru.
- [ ] Vypnúť ADC prevodníky na všetkých pinoch kde sa nepoužíva.
- [ ] V prípade detekcie odpojenia zo siete, prenúť do úsporného režimu.
- [ ] Väčší debouncy delay pre tlačítka aby sa počítalo aj z opotrebovaním.
- [ ] Plynulý prechod z jedného čisla na druhé pomocou PWM (podobne ako u danyka, nie len fading-in).
- [ ] Tlačítko na manuálne zahájenie synchronizácie (kombinácia tlačidiel).
    - Tlačítko s LED-kou ktorá ide stačiť pre zahajenie synchronizácie?

# Krabička
- [ ] Vyber dreva (pravdepodobne Buk?) (ebony, cherry, akacia, ...).
- [ ] Rozmery podľa archy zmluvy? (2.5:2.5:1.5)
- [ ] Pod ovládacím panelom citát z knihy Numeri + venovanie k 50-tým narodeninám pod tým.
- [ ] Zospodu krabičky mená ľudí, ktorý spolupracovali, ZVL-ka (logo?).
- [ ] Závažia do krabičky aby bola stabilnejšia a masivnejšia.
- [ ] Tlačítka zo zadu na krajoch krabičky (najväčší priemer ~10mm);
- [ ] Zohnať zdroj s USB C káblom určený na dlhodobé napájanie.
    - Väčšina bežných mobilných nabíjačiek su v podstate len 5V (+-0.5V) zdroje s trafom
      takže pokiaľ nabíjačka podoporuje aspoň 1A, môže byť použítá na napájanie hodín.
    - Treba si dať pozor oceľová káble (kontrola magnetom). Vždy len meď!

# Implementácia
- [x] Zohnať laserovú tlačiareň.
    - [x] Treba sa uistiť, že je dobre nastavený scale a že tlačí naozaj 1:1.
    - [ ] Upraviť nastavenie aby bola kvalita tlače čo najlepšia
          a prípadne nastaviť typ papiera.
    - [ ] Zohnať nový originálny toner.
- [ ] Rýchloschnúci ochranný lak (napr. na nechty), pre ochranu masky súčiastok.
- [ ] Zohnať lepší DCF77 modul prípadne väčšiu feritovú anténu (ideálne 100x10mm).
    - Po integrovaní DCF77 demodulačnej knižnice od Uda Kleina príjimač nemusí byť excelentný.
    - Otázka ale je aký vplyv bude mať jeho osadenie v pomerne nízkej (30mm) krabičke plnej elektroniky.
        - Treba zajistiť aby PWM signál ktorým modulujeme G pin registrov mal f > 100 kHz
- [ ] Využiť potenciál vrchnej masky zo strany súčiastok (označovanie oblastí, pomoc pri oprave).
    - Pozor: Toner sa bude pravdepodobne taviť pri pajkovaní.

# Manuál
- [ ] Historia numitronov IV-9.
- [ ] Prepísať na písacom stroji na starý zahnedlý papier.
- [ ] Pre obrázky použiť len čiernobiele obrysy s retro filtrom.
- [ ] Treba oldschool spojitú schému vytlačenú na A3/A2 ktorá sa vloží do manuálu v prípade
      potreby opráv.
      - Môžeme ponechať aj aktuálnu len s miernými úpravami (obrázky preč, čiernobiela...).
-

https://www.vpcentrum.eu/pic16f1825-e-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f1825-i-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f18426-i-p-mikrokontroler-pic-pamet-28kb-sram-2048b-eeprom-256b-32mhz

https://www.mouser.sk/ProductDetail/Microchip-Technology/PIC16F17126-I-P?qs=t7xnP681wgXtcSE8l0tHNA%3D%3D
https://www.youtube.com/watch?v=aIWxFjGh_HY

# Pozorovania
- Nemôžeme použiť interný kryštál pretože aj dekódovanie DCF signálu vyžaduje presný oscilátor.
- Programovanie ATMEGA cez ICSP prepíše celú flash pamäť vrátane bootloadera ktorý je na jej samom konci.
    - Preto po programovaní cez ICSP treba napáliť bootloader aby fungoval Arduino UNO shield.
- [AVR hardware design considerations](https://ww1.microchip.com/downloads/en/appnotes/atmel-2521-avr-hardware-design-considerations_applicationnote_avr042.pdf)
- https://www.we-online.com/catalog/media/o109030v410%20AppNotes_ANP002_TheProtectionOfUSB20Applications_EN.pdf
- https://www.nemethelektronika.hu/termekek/led-rgb-5-mm-kozos-anos-dis6103

https://www.nixiekits.eu/Downloads/USB_Nixie_Clocks_Aufbauanleitung.pdf
https://www.youtube.com/watch?v=cKjI08CTv54

----------------------------------------------------

Objednávky:obr
~~https://www.vpcentrum.eu/ina181a2idbvr-ic-operacni-zesilovac~~
1x https://www.vpcentrum.eu/soucastky-nahradni-dily/diody/transily/jednosmerne-tht/dioda-transil-1-5kw-6v-200a-jednosmerny
3x https://www.vpcentrum.eu/soucastky-nahradni-dily/diody/transily/jednosmerne-tht/dioda-transil-600w-6-45v-57a-jednosmerny-do15
https://www.vpcentrum.eu/soucastky-nahradni-dily/kondenzatory/keramicke/kondenzator-keramicky-mlcc-monoliticky-100nf-100v-x7r-10-2
https://www.vpcentrum.eu/soucastky-nahradni-dily/kondenzatory/keramicke/kondenzator-keramicky-mlcc-1uf-25vdc-x7r-10-tht-5mm-1
https://www.vpcentrum.eu/soucastky-nahradni-dily/patice-a-piny/patice-1/dil28-patice-obycejna-rm-2-54-uzka-pro-cache-7-62mm
https://www.vpcentrum.eu/soucastky-nahradni-dily/patice-a-piny/piny-hrebeny/kolikova-lista-kolikove-vidlice-pin-6-primy-2-54mm-tht-2x3
3x https://www.vpcentrum.eu/soucastky-nahradni-dily/kondenzatory/keramicke/kondenzator-keramicky-mlcc-4-7uf-25vdc-x7r-10-tht-2-5mm-1
https://www.vpcentrum.eu/kondenzator-keramicky-100nf-100v-x7r-10-tht-5mm-4
~~https://www.vpcentrum.eu/9k1-tr191-rezistor-0-25w/soucastky-nahradni-dily/rezistory-tht-a-smd~~
2x https://www.vpcentrum.eu/soucastky-nahradni-dily/patice-a-piny/piny-hrebeny/propojka-kolikove-zasuvka-otevrene-2-54mm-1x2-cervena
2x https://www.vpcentrum.eu/soucastky-nahradni-dily/patice-a-piny/piny-hrebeny/propojka-kolikove-zasuvka-otevrene-2-54mm-1x2-modra
6x https://techfun.sk/produkt/svorka-2-piny-zelena-2-54-mm/§
5x (10K, 1K) https://techfun.sk/produkt/trimmer-typu-3362-rozne-varianty/
5x https://www.vpcentrum.eu/30r-tr191-rezistor-0-25w
// do multimetra
https://www.vpcentrum.eu/pojistka-tavna-rychla-sklenena-2a-250vac-5x20mm-mosaz-2
https://www.aliexpress.com/item/1005009002216100.html?spm=a2g0o.productlist.main.10.48ac692briBMXf&aem_p4p_detail=202507101305536145321652565000000825440&algo_pvid=ddb26c76-c30f-4556-9143-52ff143255bb&algo_exp_id=ddb26c76-c30f-4556-9143-52ff143255bb-9&pdp_ext_f=%7B%22order%22%3A%2252%22%2C%22eval%22%3A%221%22%7D&pdp_npi=4%40dis%21EUR%211.24%210.86%21%21%2110.20%217.07%21%40210391a017521779531455022eecbb%2112000047530966479%21sea%21SK%216326788170%21ABX&curPageLogUid=Zj3woCLg0iaw&utparam-url=scene%3Asearch%7Cquery_from%3A&search_p4p_id=202507101305536145321652565000000825440_4

https://www.youtube.com/watch?v=oI0Fgdkzbgg

Testovanie RC8000 modulu (28.07.2025)
- Po odpajkovaní antény a kondezátora tvoriaceho LC rezonančný obvod asi došlo k poškodeniu
  modulu pretože po opätovnom pripojení tej istej antény a kondezátora aj keď cez káble
  (zanedbateľne zvýšený odpor), modul rozsviecuje LED-ku len pri veľmi silných vlnách.
- Pripojenie veľkej (10x140mm) atény s jej príslušných kondenzátorom má veľmi podobné výsledky,
  aj keď takéto zapojenie je pozorovateľne viac citlivejšie, stále to nestačí na zachytenie
  slabého DCF77 signálu ani okolitého rušenia (napr. mobil, PC).

----------------------------------------------------

(Pre krystalove radio)
https://www.aliexpress.us/item/4000120540895.html?spm=a2g0o.productlist.main.17.5e9faAuoaAuom5&algo_pvid=927f7153-835f-45fc-8ece-b697837d3f8d&algo_exp_id=927f7153-835f-45fc-8ece-b697837d3f8d-16&pdp_ext_f=%7B%22order%22%3A%2273%22%2C%22eval%22%3A%221%22%7D&pdp_npi=4%40dis%21USD%211.91%210.99%21%21%211.91%210.99%21%40211b615317514710389331698e6361%2110000000331693710%21sea%21SK%216326788170%21ABX&curPageLogUid=pijUdSDpiI7z&utparam-url=scene%3Asearch%7Cquery_from%3A
