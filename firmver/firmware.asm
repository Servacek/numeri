
.pio/build/uno_usbasp_dev/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	7d c0       	rjmp	.+250    	; 0xfc <__ctors_end>
       2:	00 00       	nop
       4:	0c 94 f8 13 	jmp	0x27f0	; 0x27f0 <__vector_1>
       8:	0c 94 02 14 	jmp	0x2804	; 0x2804 <__vector_2>
       c:	9f c0       	rjmp	.+318    	; 0x14c <__bad_interrupt>
       e:	00 00       	nop
      10:	9d c0       	rjmp	.+314    	; 0x14c <__bad_interrupt>
      12:	00 00       	nop
      14:	9b c0       	rjmp	.+310    	; 0x14c <__bad_interrupt>
      16:	00 00       	nop
      18:	99 c0       	rjmp	.+306    	; 0x14c <__bad_interrupt>
      1a:	00 00       	nop
      1c:	0c 94 0c 14 	jmp	0x2818	; 0x2818 <__vector_7>
      20:	95 c0       	rjmp	.+298    	; 0x14c <__bad_interrupt>
      22:	00 00       	nop
      24:	93 c0       	rjmp	.+294    	; 0x14c <__bad_interrupt>
      26:	00 00       	nop
      28:	91 c0       	rjmp	.+290    	; 0x14c <__bad_interrupt>
      2a:	00 00       	nop
      2c:	8f c0       	rjmp	.+286    	; 0x14c <__bad_interrupt>
      2e:	00 00       	nop
      30:	8d c0       	rjmp	.+282    	; 0x14c <__bad_interrupt>
      32:	00 00       	nop
      34:	8b c0       	rjmp	.+278    	; 0x14c <__bad_interrupt>
      36:	00 00       	nop
      38:	89 c0       	rjmp	.+274    	; 0x14c <__bad_interrupt>
      3a:	00 00       	nop
      3c:	87 c0       	rjmp	.+270    	; 0x14c <__bad_interrupt>
      3e:	00 00       	nop
      40:	85 c0       	rjmp	.+266    	; 0x14c <__bad_interrupt>
      42:	00 00       	nop
      44:	83 c0       	rjmp	.+262    	; 0x14c <__bad_interrupt>
      46:	00 00       	nop
      48:	81 c0       	rjmp	.+258    	; 0x14c <__bad_interrupt>
      4a:	00 00       	nop
      4c:	7f c0       	rjmp	.+254    	; 0x14c <__bad_interrupt>
      4e:	00 00       	nop
      50:	7d c0       	rjmp	.+250    	; 0x14c <__bad_interrupt>
      52:	00 00       	nop
      54:	7b c0       	rjmp	.+246    	; 0x14c <__bad_interrupt>
      56:	00 00       	nop
      58:	79 c0       	rjmp	.+242    	; 0x14c <__bad_interrupt>
      5a:	00 00       	nop
      5c:	77 c0       	rjmp	.+238    	; 0x14c <__bad_interrupt>
      5e:	00 00       	nop
      60:	0c 94 64 13 	jmp	0x26c8	; 0x26c8 <__vector_24>
      64:	73 c0       	rjmp	.+230    	; 0x14c <__bad_interrupt>
	...

00000068 <__trampolines_end>:
      68:	00 01       	movw	r0, r0
      6a:	02 03       	mulsu	r16, r18

0000006c <_ZN6ConfigL24TIME_HOUR_FORMAT_OPTIONSE>:
      6c:	02 04                                               ..

0000006e <_ZN5ViewsL5VIEWSE>:
      6e:	1e 11 a8 10                                         ....

00000072 <_ZL14SEGMENT_SYMBOL>:
      72:	7b 60 57 76 6c 3e 3f 70 7f 7e 5c 04 1b ff           {`Wvl>?p.~\...

00000080 <_ZZN7Modules17initializeModulesEvE3__c_0>:
      80:	52 54 43 20 6d 6f 64 75 6c 20 69 6e 69 63 69 61     RTC modul inicia
      90:	6c 69 7a 6f 76 61 6e c3 bd 2e 00                    lizovan....

0000009b <_ZZN7Modules17initializeModulesEvE3__c_1>:
      9b:	5b 56 61 72 6f 76 61 6e 69 65 5d 20 52 54 43 20     [Varovanie] RTC 
      ab:	6d 6f 64 75 6c 20 6e 65 62 6f 6c 20 6e c3 a1 6a     modul nebol n..j
      bb:	64 65 6e c3 bd 21 00                                den..!.

000000c2 <_ZZN7Modules17initializeModulesEvE3__c>:
      c2:	49 6e 69 63 69 61 6c 69 7a c3 a1 63 69 61 20 49     Inicializ..cia I
      d2:	32 43 20 7a 62 65 72 6e 69 63 65 2e 2e 2e 00        2C zbernice....

000000e1 <_ZZN7ModulesL21_onModuleStateChangedEhbE3__c_1>:
      e1:	6f 64 70 6f 6a 65 6e c3 bd 2e 00                    odpojen....

000000ec <_ZZN7ModulesL21_onModuleStateChangedEhbE3__c_0>:
      ec:	70 72 69 70 6f 6a 65 6e c3 bd 2e 00                 pripojen....

000000f8 <_ZZN7ModulesL21_onModuleStateChangedEhbE3__c>:
      f8:	20 00                                                .

000000fa <__ctors_start>:
      fa:	d5 1f       	adc	r29, r21

000000fc <__ctors_end>:
      fc:	11 24       	eor	r1, r1
      fe:	1f be       	out	0x3f, r1	; 63
     100:	cf ef       	ldi	r28, 0xFF	; 255
     102:	d8 e0       	ldi	r29, 0x08	; 8
     104:	de bf       	out	0x3e, r29	; 62
     106:	cd bf       	out	0x3d, r28	; 61

00000108 <__do_copy_data>:
     108:	13 e0       	ldi	r17, 0x03	; 3
     10a:	a0 e0       	ldi	r26, 0x00	; 0
     10c:	b1 e0       	ldi	r27, 0x01	; 1
     10e:	e8 e2       	ldi	r30, 0x28	; 40
     110:	ff e4       	ldi	r31, 0x4F	; 79
     112:	02 c0       	rjmp	.+4      	; 0x118 <__do_copy_data+0x10>
     114:	05 90       	lpm	r0, Z+
     116:	0d 92       	st	X+, r0
     118:	ae 30       	cpi	r26, 0x0E	; 14
     11a:	b1 07       	cpc	r27, r17
     11c:	d9 f7       	brne	.-10     	; 0x114 <__do_copy_data+0xc>

0000011e <__do_clear_bss>:
     11e:	26 e0       	ldi	r18, 0x06	; 6
     120:	ae e0       	ldi	r26, 0x0E	; 14
     122:	b3 e0       	ldi	r27, 0x03	; 3
     124:	01 c0       	rjmp	.+2      	; 0x128 <.do_clear_bss_start>

00000126 <.do_clear_bss_loop>:
     126:	1d 92       	st	X+, r1

00000128 <.do_clear_bss_start>:
     128:	a2 30       	cpi	r26, 0x02	; 2
     12a:	b2 07       	cpc	r27, r18
     12c:	e1 f7       	brne	.-8      	; 0x126 <.do_clear_bss_loop>

0000012e <__do_global_ctors>:
     12e:	10 e0       	ldi	r17, 0x00	; 0
     130:	ce e7       	ldi	r28, 0x7E	; 126
     132:	d0 e0       	ldi	r29, 0x00	; 0
     134:	04 c0       	rjmp	.+8      	; 0x13e <__do_global_ctors+0x10>
     136:	21 97       	sbiw	r28, 0x01	; 1
     138:	fe 01       	movw	r30, r28
     13a:	0e 94 2d 27 	call	0x4e5a	; 0x4e5a <__tablejump2__>
     13e:	cd 37       	cpi	r28, 0x7D	; 125
     140:	d1 07       	cpc	r29, r17
     142:	c9 f7       	brne	.-14     	; 0x136 <__do_global_ctors+0x8>
     144:	0e 94 2e 20 	call	0x405c	; 0x405c <main>
     148:	0c 94 92 27 	jmp	0x4f24	; 0x4f24 <_exit>

0000014c <__bad_interrupt>:
     14c:	59 cf       	rjmp	.-334    	; 0x0 <__vectors>

0000014e <_Z20putDigitsToInputRegsPKhh.constprop.78>:
     14e:	5f 98       	cbi	0x0b, 7	; 11
     150:	28 98       	cbi	0x05, 0	; 5
     152:	fc 01       	movw	r30, r24
     154:	94 e0       	ldi	r25, 0x04	; 4
     156:	50 e0       	ldi	r21, 0x00	; 0
     158:	40 e0       	ldi	r20, 0x00	; 0
     15a:	20 81       	ld	r18, Z
     15c:	30 e0       	ldi	r19, 0x00	; 0
     15e:	04 2e       	mov	r0, r20
     160:	02 c0       	rjmp	.+4      	; 0x166 <_Z20putDigitsToInputRegsPKhh.constprop.78+0x18>
     162:	35 95       	asr	r19
     164:	27 95       	ror	r18
     166:	0a 94       	dec	r0
     168:	e2 f7       	brpl	.-8      	; 0x162 <_Z20putDigitsToInputRegsPKhh.constprop.78+0x14>
     16a:	20 ff       	sbrs	r18, 0
     16c:	0d c0       	rjmp	.+26     	; 0x188 <_Z20putDigitsToInputRegsPKhh.constprop.78+0x3a>
     16e:	2c 9a       	sbi	0x05, 4	; 5
     170:	28 9a       	sbi	0x05, 0	; 5
     172:	28 98       	cbi	0x05, 0	; 5
     174:	4f 5f       	subi	r20, 0xFF	; 255
     176:	5f 4f       	sbci	r21, 0xFF	; 255
     178:	48 30       	cpi	r20, 0x08	; 8
     17a:	51 05       	cpc	r21, r1
     17c:	71 f7       	brne	.-36     	; 0x15a <_Z20putDigitsToInputRegsPKhh.constprop.78+0xc>
     17e:	91 50       	subi	r25, 0x01	; 1
     180:	31 96       	adiw	r30, 0x01	; 1
     182:	91 11       	cpse	r25, r1
     184:	e8 cf       	rjmp	.-48     	; 0x156 <_Z20putDigitsToInputRegsPKhh.constprop.78+0x8>
     186:	08 95       	ret
     188:	2c 98       	cbi	0x05, 4	; 5
     18a:	f2 cf       	rjmp	.-28     	; 0x170 <_Z20putDigitsToInputRegsPKhh.constprop.78+0x22>

0000018c <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.68>:
     18c:	ea e5       	ldi	r30, 0x5A	; 90
     18e:	f4 e0       	ldi	r31, 0x04	; 4
     190:	11 92       	st	Z+, r1
     192:	84 e0       	ldi	r24, 0x04	; 4
     194:	e4 36       	cpi	r30, 0x64	; 100
     196:	f8 07       	cpc	r31, r24
     198:	d9 f7       	brne	.-10     	; 0x190 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.68+0x4>
     19a:	10 92 64 04 	sts	0x0464, r1	; 0x800464 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
     19e:	10 92 66 04 	sts	0x0466, r1	; 0x800466 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
     1a2:	8b e0       	ldi	r24, 0x0B	; 11
     1a4:	80 93 67 04 	sts	0x0467, r24	; 0x800467 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
     1a8:	10 92 65 04 	sts	0x0465, r1	; 0x800465 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
     1ac:	e8 e6       	ldi	r30, 0x68	; 104
     1ae:	f4 e0       	ldi	r31, 0x04	; 4
     1b0:	11 92       	st	Z+, r1
     1b2:	84 e0       	ldi	r24, 0x04	; 4
     1b4:	e2 37       	cpi	r30, 0x72	; 114
     1b6:	f8 07       	cpc	r31, r24
     1b8:	d9 f7       	brne	.-10     	; 0x1b0 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.68+0x24>
     1ba:	10 92 72 04 	sts	0x0472, r1	; 0x800472 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
     1be:	10 92 74 04 	sts	0x0474, r1	; 0x800474 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
     1c2:	8b e0       	ldi	r24, 0x0B	; 11
     1c4:	80 93 75 04 	sts	0x0475, r24	; 0x800475 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
     1c8:	10 92 73 04 	sts	0x0473, r1	; 0x800473 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
     1cc:	08 95       	ret

000001ce <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33>:
     1ce:	80 91 f6 03 	lds	r24, 0x03F6	; 0x8003f6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
     1d2:	90 91 f5 03 	lds	r25, 0x03F5	; 0x8003f5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
     1d6:	89 1b       	sub	r24, r25
     1d8:	99 0b       	sbc	r25, r25
     1da:	0c 97       	sbiw	r24, 0x0c	; 12
     1dc:	54 f0       	brlt	.+20     	; 0x1f2 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33+0x24>
     1de:	80 91 f4 03 	lds	r24, 0x03F4	; 0x8003f4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
     1e2:	8a 58       	subi	r24, 0x8A	; 138
     1e4:	90 91 f7 03 	lds	r25, 0x03F7	; 0x8003f7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
     1e8:	89 1b       	sub	r24, r25
     1ea:	8c 33       	cpi	r24, 0x3C	; 60
     1ec:	18 f0       	brcs	.+6      	; 0x1f4 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33+0x26>
     1ee:	8c 53       	subi	r24, 0x3C	; 60
     1f0:	fc cf       	rjmp	.-8      	; 0x1ea <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33+0x1c>
     1f2:	8f ef       	ldi	r24, 0xFF	; 255
     1f4:	08 95       	ret

000001f6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24>:
     1f6:	ef 92       	push	r14
     1f8:	ff 92       	push	r15
     1fa:	0f 93       	push	r16
     1fc:	1f 93       	push	r17
     1fe:	2f b7       	in	r18, 0x3f	; 63
     200:	f8 94       	cli
     202:	40 91 d7 05 	lds	r20, 0x05D7	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
     206:	50 91 d8 05 	lds	r21, 0x05D8	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
     20a:	60 91 d9 05 	lds	r22, 0x05D9	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
     20e:	70 91 da 05 	lds	r23, 0x05DA	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
     212:	80 91 d3 05 	lds	r24, 0x05D3	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
     216:	90 91 d4 05 	lds	r25, 0x05D4	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
     21a:	a0 91 d5 05 	lds	r26, 0x05D5	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
     21e:	b0 91 d6 05 	lds	r27, 0x05D6	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
     222:	84 17       	cp	r24, r20
     224:	95 07       	cpc	r25, r21
     226:	a6 07       	cpc	r26, r22
     228:	b7 07       	cpc	r27, r23
     22a:	38 f0       	brcs	.+14     	; 0x23a <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x44>
     22c:	2f bf       	out	0x3f, r18	; 63
     22e:	80 e0       	ldi	r24, 0x00	; 0
     230:	1f 91       	pop	r17
     232:	0f 91       	pop	r16
     234:	ff 90       	pop	r15
     236:	ef 90       	pop	r14
     238:	08 95       	ret
     23a:	7a 01       	movw	r14, r20
     23c:	8b 01       	movw	r16, r22
     23e:	e8 1a       	sub	r14, r24
     240:	f9 0a       	sbc	r15, r25
     242:	0a 0b       	sbc	r16, r26
     244:	1b 0b       	sbc	r17, r27
     246:	d8 01       	movw	r26, r16
     248:	c7 01       	movw	r24, r14
     24a:	2f bf       	out	0x3f, r18	; 63
     24c:	20 e0       	ldi	r18, 0x00	; 0
     24e:	41 15       	cp	r20, r1
     250:	51 05       	cpc	r21, r1
     252:	61 05       	cpc	r22, r1
     254:	71 05       	cpc	r23, r1
     256:	31 f0       	breq	.+12     	; 0x264 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x6e>
     258:	76 95       	lsr	r23
     25a:	67 95       	ror	r22
     25c:	57 95       	ror	r21
     25e:	47 95       	ror	r20
     260:	2f 5f       	subi	r18, 0xFF	; 255
     262:	f5 cf       	rjmp	.-22     	; 0x24e <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x58>
     264:	22 23       	and	r18, r18
     266:	31 f0       	breq	.+12     	; 0x274 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x7e>
     268:	26 95       	lsr	r18
     26a:	b6 95       	lsr	r27
     26c:	a7 95       	ror	r26
     26e:	97 95       	ror	r25
     270:	87 95       	ror	r24
     272:	f8 cf       	rjmp	.-16     	; 0x264 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x6e>
     274:	8f 3f       	cpi	r24, 0xFF	; 255
     276:	91 05       	cpc	r25, r1
     278:	a1 05       	cpc	r26, r1
     27a:	b1 05       	cpc	r27, r1
     27c:	c9 f2       	breq	.-78     	; 0x230 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x3a>
     27e:	c0 f2       	brcs	.-80     	; 0x230 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x3a>
     280:	8f ef       	ldi	r24, 0xFF	; 255
     282:	90 e0       	ldi	r25, 0x00	; 0
     284:	a0 e0       	ldi	r26, 0x00	; 0
     286:	b0 e0       	ldi	r27, 0x00	; 0
     288:	d3 cf       	rjmp	.-90     	; 0x230 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24+0x3a>

0000028a <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21>:
     28a:	8f b7       	in	r24, 0x3f	; 63
     28c:	f8 94       	cli
     28e:	90 91 58 04 	lds	r25, 0x0458	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
     292:	20 91 57 04 	lds	r18, 0x0457	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
     296:	29 17       	cp	r18, r25
     298:	18 f0       	brcs	.+6      	; 0x2a0 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x16>
     29a:	8f bf       	out	0x3f, r24	; 63
     29c:	80 e0       	ldi	r24, 0x00	; 0
     29e:	08 95       	ret
     2a0:	39 2f       	mov	r19, r25
     2a2:	32 1b       	sub	r19, r18
     2a4:	23 2f       	mov	r18, r19
     2a6:	8f bf       	out	0x3f, r24	; 63
     2a8:	80 e0       	ldi	r24, 0x00	; 0
     2aa:	9d 31       	cpi	r25, 0x1D	; 29
     2ac:	40 f4       	brcc	.+16     	; 0x2be <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x34>
     2ae:	9d 30       	cpi	r25, 0x0D	; 13
     2b0:	08 f4       	brcc	.+2      	; 0x2b4 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x2a>
     2b2:	45 c0       	rjmp	.+138    	; 0x33e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xb4>
     2b4:	83 2f       	mov	r24, r19
     2b6:	86 95       	lsr	r24
     2b8:	86 95       	lsr	r24
     2ba:	08 95       	ret
     2bc:	83 2f       	mov	r24, r19
     2be:	96 95       	lsr	r25
     2c0:	31 e0       	ldi	r19, 0x01	; 1
     2c2:	38 0f       	add	r19, r24
     2c4:	91 11       	cpse	r25, r1
     2c6:	fa cf       	rjmp	.-12     	; 0x2bc <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x32>
     2c8:	8d 30       	cpi	r24, 0x0D	; 13
     2ca:	68 f0       	brcs	.+26     	; 0x2e6 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x5c>
     2cc:	8d 30       	cpi	r24, 0x0D	; 13
     2ce:	29 f1       	breq	.+74     	; 0x31a <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x90>
     2d0:	8e 30       	cpi	r24, 0x0E	; 14
     2d2:	31 f1       	breq	.+76     	; 0x320 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x96>
     2d4:	81 e1       	ldi	r24, 0x11	; 17
     2d6:	90 e0       	ldi	r25, 0x00	; 0
     2d8:	28 9f       	mul	r18, r24
     2da:	a0 01       	movw	r20, r0
     2dc:	29 9f       	mul	r18, r25
     2de:	50 0d       	add	r21, r0
     2e0:	11 24       	eor	r1, r1
     2e2:	85 2f       	mov	r24, r21
     2e4:	08 95       	ret
     2e6:	89 30       	cpi	r24, 0x09	; 9
     2e8:	60 f0       	brcs	.+24     	; 0x302 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x78>
     2ea:	8b 30       	cpi	r24, 0x0B	; 11
     2ec:	28 f0       	brcs	.+10     	; 0x2f8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x6e>
     2ee:	8c 30       	cpi	r24, 0x0C	; 12
     2f0:	d1 f4       	brne	.+52     	; 0x326 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x9c>
     2f2:	85 e1       	ldi	r24, 0x15	; 21
     2f4:	90 e0       	ldi	r25, 0x00	; 0
     2f6:	f0 cf       	rjmp	.-32     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     2f8:	8a 30       	cpi	r24, 0x0A	; 10
     2fa:	c1 f4       	brne	.+48     	; 0x32c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xa2>
     2fc:	89 e1       	ldi	r24, 0x19	; 25
     2fe:	90 e0       	ldi	r25, 0x00	; 0
     300:	eb cf       	rjmp	.-42     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     302:	87 30       	cpi	r24, 0x07	; 7
     304:	28 f0       	brcs	.+10     	; 0x310 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x86>
     306:	88 30       	cpi	r24, 0x08	; 8
     308:	a1 f4       	brne	.+40     	; 0x332 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xa8>
     30a:	80 e2       	ldi	r24, 0x20	; 32
     30c:	90 e0       	ldi	r25, 0x00	; 0
     30e:	e4 cf       	rjmp	.-56     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     310:	86 30       	cpi	r24, 0x06	; 6
     312:	91 f4       	brne	.+36     	; 0x338 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xae>
     314:	8a e2       	ldi	r24, 0x2A	; 42
     316:	90 e0       	ldi	r25, 0x00	; 0
     318:	df cf       	rjmp	.-66     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     31a:	83 e1       	ldi	r24, 0x13	; 19
     31c:	90 e0       	ldi	r25, 0x00	; 0
     31e:	dc cf       	rjmp	.-72     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     320:	82 e1       	ldi	r24, 0x12	; 18
     322:	90 e0       	ldi	r25, 0x00	; 0
     324:	d9 cf       	rjmp	.-78     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     326:	87 e1       	ldi	r24, 0x17	; 23
     328:	90 e0       	ldi	r25, 0x00	; 0
     32a:	d6 cf       	rjmp	.-84     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     32c:	8c e1       	ldi	r24, 0x1C	; 28
     32e:	90 e0       	ldi	r25, 0x00	; 0
     330:	d3 cf       	rjmp	.-90     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     332:	84 e2       	ldi	r24, 0x24	; 36
     334:	90 e0       	ldi	r25, 0x00	; 0
     336:	d0 cf       	rjmp	.-96     	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     338:	83 e3       	ldi	r24, 0x33	; 51
     33a:	90 e0       	ldi	r25, 0x00	; 0
     33c:	cd cf       	rjmp	.-102    	; 0x2d8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x4e>
     33e:	99 30       	cpi	r25, 0x09	; 9
     340:	48 f0       	brcs	.+18     	; 0x354 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xca>
     342:	3b 30       	cpi	r19, 0x0B	; 11
     344:	a0 f4       	brcc	.+40     	; 0x36e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xe4>
     346:	37 30       	cpi	r19, 0x07	; 7
     348:	a0 f4       	brcc	.+40     	; 0x372 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xe8>
     34a:	81 e0       	ldi	r24, 0x01	; 1
     34c:	34 30       	cpi	r19, 0x04	; 4
     34e:	08 f4       	brcc	.+2      	; 0x352 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xc8>
     350:	a5 cf       	rjmp	.-182    	; 0x29c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x12>
     352:	08 95       	ret
     354:	95 30       	cpi	r25, 0x05	; 5
     356:	30 f0       	brcs	.+12     	; 0x364 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xda>
     358:	36 30       	cpi	r19, 0x06	; 6
     35a:	58 f4       	brcc	.+22     	; 0x372 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xe8>
     35c:	81 e0       	ldi	r24, 0x01	; 1
     35e:	23 30       	cpi	r18, 0x03	; 3
     360:	c0 f7       	brcc	.-16     	; 0x352 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xc8>
     362:	9c cf       	rjmp	.-200    	; 0x29c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0x12>
     364:	93 30       	cpi	r25, 0x03	; 3
     366:	d0 f7       	brcc	.-12     	; 0x35c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xd2>
     368:	83 2f       	mov	r24, r19
     36a:	86 95       	lsr	r24
     36c:	08 95       	ret
     36e:	83 e0       	ldi	r24, 0x03	; 3
     370:	08 95       	ret
     372:	82 e0       	ldi	r24, 0x02	; 2
     374:	ee cf       	rjmp	.-36     	; 0x352 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21+0xc8>

00000376 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20>:
     376:	8f b7       	in	r24, 0x3f	; 63
     378:	f8 94       	cli
     37a:	90 91 48 04 	lds	r25, 0x0448	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
     37e:	20 91 47 04 	lds	r18, 0x0447	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
     382:	29 17       	cp	r18, r25
     384:	18 f0       	brcs	.+6      	; 0x38c <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x16>
     386:	8f bf       	out	0x3f, r24	; 63
     388:	80 e0       	ldi	r24, 0x00	; 0
     38a:	08 95       	ret
     38c:	39 2f       	mov	r19, r25
     38e:	32 1b       	sub	r19, r18
     390:	23 2f       	mov	r18, r19
     392:	8f bf       	out	0x3f, r24	; 63
     394:	80 e0       	ldi	r24, 0x00	; 0
     396:	9d 31       	cpi	r25, 0x1D	; 29
     398:	40 f4       	brcc	.+16     	; 0x3aa <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x34>
     39a:	9d 30       	cpi	r25, 0x0D	; 13
     39c:	08 f4       	brcc	.+2      	; 0x3a0 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x2a>
     39e:	45 c0       	rjmp	.+138    	; 0x42a <__LOCK_REGION_LENGTH__+0x2a>
     3a0:	83 2f       	mov	r24, r19
     3a2:	86 95       	lsr	r24
     3a4:	86 95       	lsr	r24
     3a6:	08 95       	ret
     3a8:	83 2f       	mov	r24, r19
     3aa:	96 95       	lsr	r25
     3ac:	31 e0       	ldi	r19, 0x01	; 1
     3ae:	38 0f       	add	r19, r24
     3b0:	91 11       	cpse	r25, r1
     3b2:	fa cf       	rjmp	.-12     	; 0x3a8 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x32>
     3b4:	8d 30       	cpi	r24, 0x0D	; 13
     3b6:	68 f0       	brcs	.+26     	; 0x3d2 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x5c>
     3b8:	8d 30       	cpi	r24, 0x0D	; 13
     3ba:	29 f1       	breq	.+74     	; 0x406 <__LOCK_REGION_LENGTH__+0x6>
     3bc:	8e 30       	cpi	r24, 0x0E	; 14
     3be:	31 f1       	breq	.+76     	; 0x40c <__LOCK_REGION_LENGTH__+0xc>
     3c0:	81 e1       	ldi	r24, 0x11	; 17
     3c2:	90 e0       	ldi	r25, 0x00	; 0
     3c4:	28 9f       	mul	r18, r24
     3c6:	a0 01       	movw	r20, r0
     3c8:	29 9f       	mul	r18, r25
     3ca:	50 0d       	add	r21, r0
     3cc:	11 24       	eor	r1, r1
     3ce:	85 2f       	mov	r24, r21
     3d0:	08 95       	ret
     3d2:	89 30       	cpi	r24, 0x09	; 9
     3d4:	60 f0       	brcs	.+24     	; 0x3ee <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x78>
     3d6:	8b 30       	cpi	r24, 0x0B	; 11
     3d8:	28 f0       	brcs	.+10     	; 0x3e4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x6e>
     3da:	8c 30       	cpi	r24, 0x0C	; 12
     3dc:	d1 f4       	brne	.+52     	; 0x412 <__LOCK_REGION_LENGTH__+0x12>
     3de:	85 e1       	ldi	r24, 0x15	; 21
     3e0:	90 e0       	ldi	r25, 0x00	; 0
     3e2:	f0 cf       	rjmp	.-32     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     3e4:	8a 30       	cpi	r24, 0x0A	; 10
     3e6:	c1 f4       	brne	.+48     	; 0x418 <__LOCK_REGION_LENGTH__+0x18>
     3e8:	89 e1       	ldi	r24, 0x19	; 25
     3ea:	90 e0       	ldi	r25, 0x00	; 0
     3ec:	eb cf       	rjmp	.-42     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     3ee:	87 30       	cpi	r24, 0x07	; 7
     3f0:	28 f0       	brcs	.+10     	; 0x3fc <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x86>
     3f2:	88 30       	cpi	r24, 0x08	; 8
     3f4:	a1 f4       	brne	.+40     	; 0x41e <__LOCK_REGION_LENGTH__+0x1e>
     3f6:	80 e2       	ldi	r24, 0x20	; 32
     3f8:	90 e0       	ldi	r25, 0x00	; 0
     3fa:	e4 cf       	rjmp	.-56     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     3fc:	86 30       	cpi	r24, 0x06	; 6
     3fe:	91 f4       	brne	.+36     	; 0x424 <__LOCK_REGION_LENGTH__+0x24>
     400:	8a e2       	ldi	r24, 0x2A	; 42
     402:	90 e0       	ldi	r25, 0x00	; 0
     404:	df cf       	rjmp	.-66     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     406:	83 e1       	ldi	r24, 0x13	; 19
     408:	90 e0       	ldi	r25, 0x00	; 0
     40a:	dc cf       	rjmp	.-72     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     40c:	82 e1       	ldi	r24, 0x12	; 18
     40e:	90 e0       	ldi	r25, 0x00	; 0
     410:	d9 cf       	rjmp	.-78     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     412:	87 e1       	ldi	r24, 0x17	; 23
     414:	90 e0       	ldi	r25, 0x00	; 0
     416:	d6 cf       	rjmp	.-84     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     418:	8c e1       	ldi	r24, 0x1C	; 28
     41a:	90 e0       	ldi	r25, 0x00	; 0
     41c:	d3 cf       	rjmp	.-90     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     41e:	84 e2       	ldi	r24, 0x24	; 36
     420:	90 e0       	ldi	r25, 0x00	; 0
     422:	d0 cf       	rjmp	.-96     	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     424:	83 e3       	ldi	r24, 0x33	; 51
     426:	90 e0       	ldi	r25, 0x00	; 0
     428:	cd cf       	rjmp	.-102    	; 0x3c4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x4e>
     42a:	99 30       	cpi	r25, 0x09	; 9
     42c:	48 f0       	brcs	.+18     	; 0x440 <__LOCK_REGION_LENGTH__+0x40>
     42e:	3b 30       	cpi	r19, 0x0B	; 11
     430:	a0 f4       	brcc	.+40     	; 0x45a <__LOCK_REGION_LENGTH__+0x5a>
     432:	37 30       	cpi	r19, 0x07	; 7
     434:	a0 f4       	brcc	.+40     	; 0x45e <__LOCK_REGION_LENGTH__+0x5e>
     436:	81 e0       	ldi	r24, 0x01	; 1
     438:	34 30       	cpi	r19, 0x04	; 4
     43a:	08 f4       	brcc	.+2      	; 0x43e <__LOCK_REGION_LENGTH__+0x3e>
     43c:	a5 cf       	rjmp	.-182    	; 0x388 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x12>
     43e:	08 95       	ret
     440:	95 30       	cpi	r25, 0x05	; 5
     442:	30 f0       	brcs	.+12     	; 0x450 <__LOCK_REGION_LENGTH__+0x50>
     444:	36 30       	cpi	r19, 0x06	; 6
     446:	58 f4       	brcc	.+22     	; 0x45e <__LOCK_REGION_LENGTH__+0x5e>
     448:	81 e0       	ldi	r24, 0x01	; 1
     44a:	23 30       	cpi	r18, 0x03	; 3
     44c:	c0 f7       	brcc	.-16     	; 0x43e <__LOCK_REGION_LENGTH__+0x3e>
     44e:	9c cf       	rjmp	.-200    	; 0x388 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20+0x12>
     450:	93 30       	cpi	r25, 0x03	; 3
     452:	d0 f7       	brcc	.-12     	; 0x448 <__LOCK_REGION_LENGTH__+0x48>
     454:	83 2f       	mov	r24, r19
     456:	86 95       	lsr	r24
     458:	08 95       	ret
     45a:	83 e0       	ldi	r24, 0x03	; 3
     45c:	08 95       	ret
     45e:	82 e0       	ldi	r24, 0x02	; 2
     460:	ee cf       	rjmp	.-36     	; 0x43e <__LOCK_REGION_LENGTH__+0x3e>

00000462 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19>:
     462:	8f b7       	in	r24, 0x3f	; 63
     464:	f8 94       	cli
     466:	90 91 1a 04 	lds	r25, 0x041A	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
     46a:	20 91 19 04 	lds	r18, 0x0419	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
     46e:	29 17       	cp	r18, r25
     470:	18 f0       	brcs	.+6      	; 0x478 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x16>
     472:	8f bf       	out	0x3f, r24	; 63
     474:	80 e0       	ldi	r24, 0x00	; 0
     476:	08 95       	ret
     478:	39 2f       	mov	r19, r25
     47a:	32 1b       	sub	r19, r18
     47c:	23 2f       	mov	r18, r19
     47e:	8f bf       	out	0x3f, r24	; 63
     480:	80 e0       	ldi	r24, 0x00	; 0
     482:	9d 31       	cpi	r25, 0x1D	; 29
     484:	40 f4       	brcc	.+16     	; 0x496 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x34>
     486:	9d 30       	cpi	r25, 0x0D	; 13
     488:	08 f4       	brcc	.+2      	; 0x48c <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x2a>
     48a:	45 c0       	rjmp	.+138    	; 0x516 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xb4>
     48c:	83 2f       	mov	r24, r19
     48e:	86 95       	lsr	r24
     490:	86 95       	lsr	r24
     492:	08 95       	ret
     494:	83 2f       	mov	r24, r19
     496:	96 95       	lsr	r25
     498:	31 e0       	ldi	r19, 0x01	; 1
     49a:	38 0f       	add	r19, r24
     49c:	91 11       	cpse	r25, r1
     49e:	fa cf       	rjmp	.-12     	; 0x494 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x32>
     4a0:	8d 30       	cpi	r24, 0x0D	; 13
     4a2:	68 f0       	brcs	.+26     	; 0x4be <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x5c>
     4a4:	8d 30       	cpi	r24, 0x0D	; 13
     4a6:	29 f1       	breq	.+74     	; 0x4f2 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x90>
     4a8:	8e 30       	cpi	r24, 0x0E	; 14
     4aa:	31 f1       	breq	.+76     	; 0x4f8 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x96>
     4ac:	81 e1       	ldi	r24, 0x11	; 17
     4ae:	90 e0       	ldi	r25, 0x00	; 0
     4b0:	28 9f       	mul	r18, r24
     4b2:	a0 01       	movw	r20, r0
     4b4:	29 9f       	mul	r18, r25
     4b6:	50 0d       	add	r21, r0
     4b8:	11 24       	eor	r1, r1
     4ba:	85 2f       	mov	r24, r21
     4bc:	08 95       	ret
     4be:	89 30       	cpi	r24, 0x09	; 9
     4c0:	60 f0       	brcs	.+24     	; 0x4da <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x78>
     4c2:	8b 30       	cpi	r24, 0x0B	; 11
     4c4:	28 f0       	brcs	.+10     	; 0x4d0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x6e>
     4c6:	8c 30       	cpi	r24, 0x0C	; 12
     4c8:	d1 f4       	brne	.+52     	; 0x4fe <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x9c>
     4ca:	85 e1       	ldi	r24, 0x15	; 21
     4cc:	90 e0       	ldi	r25, 0x00	; 0
     4ce:	f0 cf       	rjmp	.-32     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4d0:	8a 30       	cpi	r24, 0x0A	; 10
     4d2:	c1 f4       	brne	.+48     	; 0x504 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xa2>
     4d4:	89 e1       	ldi	r24, 0x19	; 25
     4d6:	90 e0       	ldi	r25, 0x00	; 0
     4d8:	eb cf       	rjmp	.-42     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4da:	87 30       	cpi	r24, 0x07	; 7
     4dc:	28 f0       	brcs	.+10     	; 0x4e8 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x86>
     4de:	88 30       	cpi	r24, 0x08	; 8
     4e0:	a1 f4       	brne	.+40     	; 0x50a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xa8>
     4e2:	80 e2       	ldi	r24, 0x20	; 32
     4e4:	90 e0       	ldi	r25, 0x00	; 0
     4e6:	e4 cf       	rjmp	.-56     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4e8:	86 30       	cpi	r24, 0x06	; 6
     4ea:	91 f4       	brne	.+36     	; 0x510 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xae>
     4ec:	8a e2       	ldi	r24, 0x2A	; 42
     4ee:	90 e0       	ldi	r25, 0x00	; 0
     4f0:	df cf       	rjmp	.-66     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4f2:	83 e1       	ldi	r24, 0x13	; 19
     4f4:	90 e0       	ldi	r25, 0x00	; 0
     4f6:	dc cf       	rjmp	.-72     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4f8:	82 e1       	ldi	r24, 0x12	; 18
     4fa:	90 e0       	ldi	r25, 0x00	; 0
     4fc:	d9 cf       	rjmp	.-78     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     4fe:	87 e1       	ldi	r24, 0x17	; 23
     500:	90 e0       	ldi	r25, 0x00	; 0
     502:	d6 cf       	rjmp	.-84     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     504:	8c e1       	ldi	r24, 0x1C	; 28
     506:	90 e0       	ldi	r25, 0x00	; 0
     508:	d3 cf       	rjmp	.-90     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     50a:	84 e2       	ldi	r24, 0x24	; 36
     50c:	90 e0       	ldi	r25, 0x00	; 0
     50e:	d0 cf       	rjmp	.-96     	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     510:	83 e3       	ldi	r24, 0x33	; 51
     512:	90 e0       	ldi	r25, 0x00	; 0
     514:	cd cf       	rjmp	.-102    	; 0x4b0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x4e>
     516:	99 30       	cpi	r25, 0x09	; 9
     518:	48 f0       	brcs	.+18     	; 0x52c <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xca>
     51a:	3b 30       	cpi	r19, 0x0B	; 11
     51c:	a0 f4       	brcc	.+40     	; 0x546 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xe4>
     51e:	37 30       	cpi	r19, 0x07	; 7
     520:	a0 f4       	brcc	.+40     	; 0x54a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xe8>
     522:	81 e0       	ldi	r24, 0x01	; 1
     524:	34 30       	cpi	r19, 0x04	; 4
     526:	08 f4       	brcc	.+2      	; 0x52a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xc8>
     528:	a5 cf       	rjmp	.-182    	; 0x474 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x12>
     52a:	08 95       	ret
     52c:	95 30       	cpi	r25, 0x05	; 5
     52e:	30 f0       	brcs	.+12     	; 0x53c <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xda>
     530:	36 30       	cpi	r19, 0x06	; 6
     532:	58 f4       	brcc	.+22     	; 0x54a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xe8>
     534:	81 e0       	ldi	r24, 0x01	; 1
     536:	23 30       	cpi	r18, 0x03	; 3
     538:	c0 f7       	brcc	.-16     	; 0x52a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xc8>
     53a:	9c cf       	rjmp	.-200    	; 0x474 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0x12>
     53c:	93 30       	cpi	r25, 0x03	; 3
     53e:	d0 f7       	brcc	.-12     	; 0x534 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xd2>
     540:	83 2f       	mov	r24, r19
     542:	86 95       	lsr	r24
     544:	08 95       	ret
     546:	83 e0       	ldi	r24, 0x03	; 3
     548:	08 95       	ret
     54a:	82 e0       	ldi	r24, 0x02	; 2
     54c:	ee cf       	rjmp	.-36     	; 0x52a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19+0xc8>

0000054e <twi_init>:
     54e:	10 92 9c 04 	sts	0x049C, r1	; 0x80049c <_state>
     552:	81 e0       	ldi	r24, 0x01	; 1
     554:	80 93 9b 04 	sts	0x049B, r24	; 0x80049b <_send_stop>
     558:	10 92 96 04 	sts	0x0496, r1	; 0x800496 <_rep_start>
     55c:	3c 98       	cbi	0x07, 4	; 7
     55e:	3d 98       	cbi	0x07, 5	; 7
     560:	44 9a       	sbi	0x08, 4	; 8
     562:	45 9a       	sbi	0x08, 5	; 8
     564:	e9 eb       	ldi	r30, 0xB9	; 185
     566:	f0 e0       	ldi	r31, 0x00	; 0
     568:	80 81       	ld	r24, Z
     56a:	8c 7f       	andi	r24, 0xFC	; 252
     56c:	80 83       	st	Z, r24
     56e:	88 e4       	ldi	r24, 0x48	; 72
     570:	80 93 b8 00 	sts	0x00B8, r24	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     574:	85 e4       	ldi	r24, 0x45	; 69
     576:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     57a:	08 95       	ret

0000057c <_twi_handle_timeout>:
     57c:	cf 93       	push	r28
     57e:	df 93       	push	r29
     580:	81 e0       	ldi	r24, 0x01	; 1
     582:	80 93 77 03 	sts	0x0377, r24	; 0x800377 <_timed_out>
     586:	80 91 76 03 	lds	r24, 0x0376	; 0x800376 <_reset_on_timeout>
     58a:	88 23       	and	r24, r24
     58c:	91 f0       	breq	.+36     	; 0x5b2 <_twi_handle_timeout+0x36>
     58e:	d0 91 b8 00 	lds	r29, 0x00B8	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     592:	c0 91 ba 00 	lds	r28, 0x00BA	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
     596:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     59a:	8a 7b       	andi	r24, 0xBA	; 186
     59c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     5a0:	3c 98       	cbi	0x07, 4	; 7
     5a2:	3d 98       	cbi	0x07, 5	; 7
     5a4:	44 98       	cbi	0x08, 4	; 8
     5a6:	45 98       	cbi	0x08, 5	; 8
     5a8:	d2 df       	rcall	.-92     	; 0x54e <twi_init>
     5aa:	d0 93 b8 00 	sts	0x00B8, r29	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     5ae:	c0 93 ba 00 	sts	0x00BA, r28	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
     5b2:	df 91       	pop	r29
     5b4:	cf 91       	pop	r28
     5b6:	08 95       	ret

000005b8 <_ZN9DCF77SyncL15_sampleInputPinEv>:
     5b8:	00 b6       	in	r0, 0x30	; 48
     5ba:	05 fe       	sbrs	r0, 5
     5bc:	07 c0       	rjmp	.+14     	; 0x5cc <_ZN9DCF77SyncL15_sampleInputPinEv+0x14>
     5be:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
     5c2:	87 7f       	andi	r24, 0xF7	; 247
     5c4:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
     5c8:	80 e0       	ldi	r24, 0x00	; 0
     5ca:	08 95       	ret
     5cc:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
     5d0:	88 60       	ori	r24, 0x08	; 8
     5d2:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
     5d6:	81 e0       	ldi	r24, 0x01	; 1
     5d8:	08 95       	ret

000005da <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE>:
     5da:	fc 01       	movw	r30, r24
     5dc:	80 81       	ld	r24, Z
     5de:	8c 33       	cpi	r24, 0x3C	; 60
     5e0:	98 f4       	brcc	.+38     	; 0x608 <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE+0x2e>
     5e2:	81 81       	ldd	r24, Z+1	; 0x01
     5e4:	88 31       	cpi	r24, 0x18	; 24
     5e6:	80 f4       	brcc	.+32     	; 0x608 <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE+0x2e>
     5e8:	82 81       	ldd	r24, Z+2	; 0x02
     5ea:	81 50       	subi	r24, 0x01	; 1
     5ec:	8f 31       	cpi	r24, 0x1F	; 31
     5ee:	60 f4       	brcc	.+24     	; 0x608 <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE+0x2e>
     5f0:	83 81       	ldd	r24, Z+3	; 0x03
     5f2:	81 50       	subi	r24, 0x01	; 1
     5f4:	8c 30       	cpi	r24, 0x0C	; 12
     5f6:	40 f4       	brcc	.+16     	; 0x608 <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE+0x2e>
     5f8:	24 81       	ldd	r18, Z+4	; 0x04
     5fa:	35 81       	ldd	r19, Z+5	; 0x05
     5fc:	20 5d       	subi	r18, 0xD0	; 208
     5fe:	37 40       	sbci	r19, 0x07	; 7
     600:	81 e0       	ldi	r24, 0x01	; 1
     602:	24 36       	cpi	r18, 0x64	; 100
     604:	31 05       	cpc	r19, r1
     606:	08 f0       	brcs	.+2      	; 0x60a <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE+0x30>
     608:	80 e0       	ldi	r24, 0x00	; 0
     60a:	08 95       	ret

0000060c <_ZN7Modules6DS3231L8decToBcdEh>:
     60c:	9d ec       	ldi	r25, 0xCD	; 205
     60e:	89 9f       	mul	r24, r25
     610:	90 01       	movw	r18, r0
     612:	11 24       	eor	r1, r1
     614:	23 2f       	mov	r18, r19
     616:	33 27       	eor	r19, r19
     618:	26 95       	lsr	r18
     61a:	26 95       	lsr	r18
     61c:	26 95       	lsr	r18
     61e:	96 ef       	ldi	r25, 0xF6	; 246
     620:	29 9f       	mul	r18, r25
     622:	80 0d       	add	r24, r0
     624:	11 24       	eor	r1, r1
     626:	44 e0       	ldi	r20, 0x04	; 4
     628:	22 0f       	add	r18, r18
     62a:	33 1f       	adc	r19, r19
     62c:	4a 95       	dec	r20
     62e:	e1 f7       	brne	.-8      	; 0x628 <_ZN7Modules6DS3231L8decToBcdEh+0x1c>
     630:	82 2b       	or	r24, r18
     632:	08 95       	ret

00000634 <_ZN7Modules6DS3231L8bcdToDecEh>:
     634:	98 2f       	mov	r25, r24
     636:	92 95       	swap	r25
     638:	9f 70       	andi	r25, 0x0F	; 15
     63a:	8f 70       	andi	r24, 0x0F	; 15
     63c:	2a e0       	ldi	r18, 0x0A	; 10
     63e:	92 9f       	mul	r25, r18
     640:	80 0d       	add	r24, r0
     642:	11 24       	eor	r1, r1
     644:	08 95       	ret

00000646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>:
     646:	fc 01       	movw	r30, r24
     648:	3f b7       	in	r19, 0x3f	; 63
     64a:	f8 94       	cli
     64c:	96 ad       	ldd	r25, Z+62	; 0x3e
     64e:	85 ad       	ldd	r24, Z+61	; 0x3d
     650:	89 17       	cp	r24, r25
     652:	18 f0       	brcs	.+6      	; 0x65a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x14>
     654:	3f bf       	out	0x3f, r19	; 63
     656:	80 e0       	ldi	r24, 0x00	; 0
     658:	08 95       	ret
     65a:	29 2f       	mov	r18, r25
     65c:	28 1b       	sub	r18, r24
     65e:	3f bf       	out	0x3f, r19	; 63
     660:	80 e0       	ldi	r24, 0x00	; 0
     662:	9d 31       	cpi	r25, 0x1D	; 29
     664:	40 f4       	brcc	.+16     	; 0x676 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x30>
     666:	9d 30       	cpi	r25, 0x0D	; 13
     668:	08 f4       	brcc	.+2      	; 0x66c <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x26>
     66a:	45 c0       	rjmp	.+138    	; 0x6f6 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xb0>
     66c:	82 2f       	mov	r24, r18
     66e:	86 95       	lsr	r24
     670:	86 95       	lsr	r24
     672:	08 95       	ret
     674:	83 2f       	mov	r24, r19
     676:	96 95       	lsr	r25
     678:	31 e0       	ldi	r19, 0x01	; 1
     67a:	38 0f       	add	r19, r24
     67c:	91 11       	cpse	r25, r1
     67e:	fa cf       	rjmp	.-12     	; 0x674 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x2e>
     680:	8d 30       	cpi	r24, 0x0D	; 13
     682:	68 f0       	brcs	.+26     	; 0x69e <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x58>
     684:	8d 30       	cpi	r24, 0x0D	; 13
     686:	29 f1       	breq	.+74     	; 0x6d2 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x8c>
     688:	8e 30       	cpi	r24, 0x0E	; 14
     68a:	31 f1       	breq	.+76     	; 0x6d8 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x92>
     68c:	81 e1       	ldi	r24, 0x11	; 17
     68e:	90 e0       	ldi	r25, 0x00	; 0
     690:	28 9f       	mul	r18, r24
     692:	a0 01       	movw	r20, r0
     694:	29 9f       	mul	r18, r25
     696:	50 0d       	add	r21, r0
     698:	11 24       	eor	r1, r1
     69a:	85 2f       	mov	r24, r21
     69c:	08 95       	ret
     69e:	89 30       	cpi	r24, 0x09	; 9
     6a0:	60 f0       	brcs	.+24     	; 0x6ba <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x74>
     6a2:	8b 30       	cpi	r24, 0x0B	; 11
     6a4:	28 f0       	brcs	.+10     	; 0x6b0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x6a>
     6a6:	8c 30       	cpi	r24, 0x0C	; 12
     6a8:	d1 f4       	brne	.+52     	; 0x6de <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x98>
     6aa:	85 e1       	ldi	r24, 0x15	; 21
     6ac:	90 e0       	ldi	r25, 0x00	; 0
     6ae:	f0 cf       	rjmp	.-32     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6b0:	8a 30       	cpi	r24, 0x0A	; 10
     6b2:	c1 f4       	brne	.+48     	; 0x6e4 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x9e>
     6b4:	89 e1       	ldi	r24, 0x19	; 25
     6b6:	90 e0       	ldi	r25, 0x00	; 0
     6b8:	eb cf       	rjmp	.-42     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6ba:	87 30       	cpi	r24, 0x07	; 7
     6bc:	28 f0       	brcs	.+10     	; 0x6c8 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x82>
     6be:	88 30       	cpi	r24, 0x08	; 8
     6c0:	a1 f4       	brne	.+40     	; 0x6ea <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xa4>
     6c2:	80 e2       	ldi	r24, 0x20	; 32
     6c4:	90 e0       	ldi	r25, 0x00	; 0
     6c6:	e4 cf       	rjmp	.-56     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6c8:	86 30       	cpi	r24, 0x06	; 6
     6ca:	91 f4       	brne	.+36     	; 0x6f0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xaa>
     6cc:	8a e2       	ldi	r24, 0x2A	; 42
     6ce:	90 e0       	ldi	r25, 0x00	; 0
     6d0:	df cf       	rjmp	.-66     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6d2:	83 e1       	ldi	r24, 0x13	; 19
     6d4:	90 e0       	ldi	r25, 0x00	; 0
     6d6:	dc cf       	rjmp	.-72     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6d8:	82 e1       	ldi	r24, 0x12	; 18
     6da:	90 e0       	ldi	r25, 0x00	; 0
     6dc:	d9 cf       	rjmp	.-78     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6de:	87 e1       	ldi	r24, 0x17	; 23
     6e0:	90 e0       	ldi	r25, 0x00	; 0
     6e2:	d6 cf       	rjmp	.-84     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6e4:	8c e1       	ldi	r24, 0x1C	; 28
     6e6:	90 e0       	ldi	r25, 0x00	; 0
     6e8:	d3 cf       	rjmp	.-90     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6ea:	84 e2       	ldi	r24, 0x24	; 36
     6ec:	90 e0       	ldi	r25, 0x00	; 0
     6ee:	d0 cf       	rjmp	.-96     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6f0:	83 e3       	ldi	r24, 0x33	; 51
     6f2:	90 e0       	ldi	r25, 0x00	; 0
     6f4:	cd cf       	rjmp	.-102    	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
     6f6:	99 30       	cpi	r25, 0x09	; 9
     6f8:	48 f0       	brcs	.+18     	; 0x70c <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc6>
     6fa:	2b 30       	cpi	r18, 0x0B	; 11
     6fc:	a0 f4       	brcc	.+40     	; 0x726 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe0>
     6fe:	27 30       	cpi	r18, 0x07	; 7
     700:	a0 f4       	brcc	.+40     	; 0x72a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe4>
     702:	81 e0       	ldi	r24, 0x01	; 1
     704:	24 30       	cpi	r18, 0x04	; 4
     706:	08 f4       	brcc	.+2      	; 0x70a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>
     708:	a6 cf       	rjmp	.-180    	; 0x656 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x10>
     70a:	08 95       	ret
     70c:	95 30       	cpi	r25, 0x05	; 5
     70e:	30 f0       	brcs	.+12     	; 0x71c <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xd6>
     710:	26 30       	cpi	r18, 0x06	; 6
     712:	58 f4       	brcc	.+22     	; 0x72a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe4>
     714:	81 e0       	ldi	r24, 0x01	; 1
     716:	23 30       	cpi	r18, 0x03	; 3
     718:	c0 f7       	brcc	.-16     	; 0x70a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>
     71a:	9d cf       	rjmp	.-198    	; 0x656 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x10>
     71c:	93 30       	cpi	r25, 0x03	; 3
     71e:	d0 f7       	brcc	.-12     	; 0x714 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xce>
     720:	82 2f       	mov	r24, r18
     722:	86 95       	lsr	r24
     724:	08 95       	ret
     726:	83 e0       	ldi	r24, 0x03	; 3
     728:	08 95       	ret
     72a:	82 e0       	ldi	r24, 0x02	; 2
     72c:	ee cf       	rjmp	.-36     	; 0x70a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>

0000072e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>:
     72e:	fc 01       	movw	r30, r24
     730:	90 81       	ld	r25, Z
     732:	44 23       	and	r20, r20
     734:	19 f0       	breq	.+6      	; 0x73c <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b+0xe>
     736:	69 0f       	add	r22, r25
     738:	60 83       	st	Z, r22
     73a:	08 95       	ret
     73c:	96 1b       	sub	r25, r22
     73e:	9f 5f       	subi	r25, 0xFF	; 255
     740:	90 83       	st	Z, r25
     742:	08 95       	ret

00000744 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>:
     744:	fc 01       	movw	r30, r24
     746:	15 ae       	std	Z+61, r1	; 0x3d
     748:	16 ae       	std	Z+62, r1	; 0x3e
     74a:	8d e3       	ldi	r24, 0x3D	; 61
     74c:	87 af       	std	Z+63, r24	; 0x3f
     74e:	df 01       	movw	r26, r30
     750:	80 e0       	ldi	r24, 0x00	; 0
     752:	9d 91       	ld	r25, X+
     754:	26 ad       	ldd	r18, Z+62	; 0x3e
     756:	92 17       	cp	r25, r18
     758:	38 f0       	brcs	.+14     	; 0x768 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x24>
     75a:	25 af       	std	Z+61, r18	; 0x3d
     75c:	96 af       	std	Z+62, r25	; 0x3e
     75e:	87 af       	std	Z+63, r24	; 0x3f
     760:	8f 5f       	subi	r24, 0xFF	; 255
     762:	8c 33       	cpi	r24, 0x3C	; 60
     764:	b1 f7       	brne	.-20     	; 0x752 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0xe>
     766:	08 95       	ret
     768:	25 ad       	ldd	r18, Z+61	; 0x3d
     76a:	29 17       	cp	r18, r25
     76c:	c8 f7       	brcc	.-14     	; 0x760 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x1c>
     76e:	95 af       	std	Z+61, r25	; 0x3d
     770:	f7 cf       	rjmp	.-18     	; 0x760 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x1c>

00000772 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>:
     772:	fc 01       	movw	r30, r24
     774:	dc 01       	movw	r26, r24
     776:	cc 96       	adiw	r24, 0x3c	; 60
     778:	1d 92       	st	X+, r1
     77a:	a8 17       	cp	r26, r24
     77c:	b9 07       	cpc	r27, r25
     77e:	e1 f7       	brne	.-8      	; 0x778 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv+0x6>
     780:	14 ae       	std	Z+60, r1	; 0x3c
     782:	16 ae       	std	Z+62, r1	; 0x3e
     784:	8d e3       	ldi	r24, 0x3D	; 61
     786:	87 af       	std	Z+63, r24	; 0x3f
     788:	15 ae       	std	Z+61, r1	; 0x3d
     78a:	08 95       	ret

0000078c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>:
     78c:	8c e2       	ldi	r24, 0x2C	; 44
     78e:	91 e0       	ldi	r25, 0x01	; 1
     790:	90 93 dd 05 	sts	0x05DD, r25	; 0x8005dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
     794:	80 93 dc 05 	sts	0x05DC, r24	; 0x8005dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
     798:	88 eb       	ldi	r24, 0xB8	; 184
     79a:	93 e0       	ldi	r25, 0x03	; 3
     79c:	ea df       	rcall	.-44     	; 0x772 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
     79e:	8f ef       	ldi	r24, 0xFF	; 255
     7a0:	80 93 fe 03 	sts	0x03FE, r24	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
     7a4:	80 93 ff 03 	sts	0x03FF, r24	; 0x8003ff <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
     7a8:	88 e7       	ldi	r24, 0x78	; 120
     7aa:	93 e0       	ldi	r25, 0x03	; 3
     7ac:	e2 df       	rcall	.-60     	; 0x772 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
     7ae:	e0 e0       	ldi	r30, 0x00	; 0
     7b0:	f4 e0       	ldi	r31, 0x04	; 4
     7b2:	88 e1       	ldi	r24, 0x18	; 24
     7b4:	94 e0       	ldi	r25, 0x04	; 4
     7b6:	11 92       	st	Z+, r1
     7b8:	8e 17       	cp	r24, r30
     7ba:	9f 07       	cpc	r25, r31
     7bc:	e1 f7       	brne	.-8      	; 0x7b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x2a>
     7be:	10 92 18 04 	sts	0x0418, r1	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
     7c2:	10 92 1a 04 	sts	0x041A, r1	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
     7c6:	89 e1       	ldi	r24, 0x19	; 25
     7c8:	80 93 1b 04 	sts	0x041B, r24	; 0x80041b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
     7cc:	10 92 19 04 	sts	0x0419, r1	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
     7d0:	e7 e2       	ldi	r30, 0x27	; 39
     7d2:	f4 e0       	ldi	r31, 0x04	; 4
     7d4:	11 92       	st	Z+, r1
     7d6:	84 e0       	ldi	r24, 0x04	; 4
     7d8:	e6 34       	cpi	r30, 0x46	; 70
     7da:	f8 07       	cpc	r31, r24
     7dc:	d9 f7       	brne	.-10     	; 0x7d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x48>
     7de:	10 92 46 04 	sts	0x0446, r1	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
     7e2:	10 92 48 04 	sts	0x0448, r1	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
     7e6:	80 e2       	ldi	r24, 0x20	; 32
     7e8:	80 93 49 04 	sts	0x0449, r24	; 0x800449 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
     7ec:	10 92 47 04 	sts	0x0447, r1	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
     7f0:	10 92 1c 04 	sts	0x041C, r1	; 0x80041c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE>
     7f4:	10 92 1d 04 	sts	0x041D, r1	; 0x80041d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x1>
     7f8:	10 92 1e 04 	sts	0x041E, r1	; 0x80041e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x2>
     7fc:	10 92 1f 04 	sts	0x041F, r1	; 0x80041f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x3>
     800:	10 92 20 04 	sts	0x0420, r1	; 0x800420 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x4>
     804:	10 92 21 04 	sts	0x0421, r1	; 0x800421 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x5>
     808:	10 92 22 04 	sts	0x0422, r1	; 0x800422 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x6>
     80c:	10 92 23 04 	sts	0x0423, r1	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
     810:	10 92 25 04 	sts	0x0425, r1	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
     814:	88 e0       	ldi	r24, 0x08	; 8
     816:	80 93 26 04 	sts	0x0426, r24	; 0x800426 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
     81a:	10 92 24 04 	sts	0x0424, r1	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
     81e:	ea e4       	ldi	r30, 0x4A	; 74
     820:	f4 e0       	ldi	r31, 0x04	; 4
     822:	86 e5       	ldi	r24, 0x56	; 86
     824:	94 e0       	ldi	r25, 0x04	; 4
     826:	11 92       	st	Z+, r1
     828:	8e 17       	cp	r24, r30
     82a:	9f 07       	cpc	r25, r31
     82c:	e1 f7       	brne	.-8      	; 0x826 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x9a>
     82e:	10 92 56 04 	sts	0x0456, r1	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
     832:	10 92 58 04 	sts	0x0458, r1	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
     836:	8d e0       	ldi	r24, 0x0D	; 13
     838:	80 93 59 04 	sts	0x0459, r24	; 0x800459 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
     83c:	10 92 57 04 	sts	0x0457, r1	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
     840:	a5 cc       	rjmp	.-1718   	; 0x18c <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.68>

00000842 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>:
     842:	fc 01       	movw	r30, r24
     844:	3f b7       	in	r19, 0x3f	; 63
     846:	f8 94       	cli
     848:	94 85       	ldd	r25, Z+12	; 0x0c
     84a:	83 85       	ldd	r24, Z+11	; 0x0b
     84c:	89 17       	cp	r24, r25
     84e:	18 f0       	brcs	.+6      	; 0x856 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x14>
     850:	3f bf       	out	0x3f, r19	; 63
     852:	80 e0       	ldi	r24, 0x00	; 0
     854:	08 95       	ret
     856:	29 2f       	mov	r18, r25
     858:	28 1b       	sub	r18, r24
     85a:	3f bf       	out	0x3f, r19	; 63
     85c:	80 e0       	ldi	r24, 0x00	; 0
     85e:	9d 31       	cpi	r25, 0x1D	; 29
     860:	40 f4       	brcc	.+16     	; 0x872 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x30>
     862:	9d 30       	cpi	r25, 0x0D	; 13
     864:	08 f4       	brcc	.+2      	; 0x868 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x26>
     866:	45 c0       	rjmp	.+138    	; 0x8f2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xb0>
     868:	82 2f       	mov	r24, r18
     86a:	86 95       	lsr	r24
     86c:	86 95       	lsr	r24
     86e:	08 95       	ret
     870:	83 2f       	mov	r24, r19
     872:	96 95       	lsr	r25
     874:	31 e0       	ldi	r19, 0x01	; 1
     876:	38 0f       	add	r19, r24
     878:	91 11       	cpse	r25, r1
     87a:	fa cf       	rjmp	.-12     	; 0x870 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x2e>
     87c:	8d 30       	cpi	r24, 0x0D	; 13
     87e:	68 f0       	brcs	.+26     	; 0x89a <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x58>
     880:	8d 30       	cpi	r24, 0x0D	; 13
     882:	29 f1       	breq	.+74     	; 0x8ce <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x8c>
     884:	8e 30       	cpi	r24, 0x0E	; 14
     886:	31 f1       	breq	.+76     	; 0x8d4 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x92>
     888:	81 e1       	ldi	r24, 0x11	; 17
     88a:	90 e0       	ldi	r25, 0x00	; 0
     88c:	28 9f       	mul	r18, r24
     88e:	a0 01       	movw	r20, r0
     890:	29 9f       	mul	r18, r25
     892:	50 0d       	add	r21, r0
     894:	11 24       	eor	r1, r1
     896:	85 2f       	mov	r24, r21
     898:	08 95       	ret
     89a:	89 30       	cpi	r24, 0x09	; 9
     89c:	60 f0       	brcs	.+24     	; 0x8b6 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x74>
     89e:	8b 30       	cpi	r24, 0x0B	; 11
     8a0:	28 f0       	brcs	.+10     	; 0x8ac <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x6a>
     8a2:	8c 30       	cpi	r24, 0x0C	; 12
     8a4:	d1 f4       	brne	.+52     	; 0x8da <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x98>
     8a6:	85 e1       	ldi	r24, 0x15	; 21
     8a8:	90 e0       	ldi	r25, 0x00	; 0
     8aa:	f0 cf       	rjmp	.-32     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8ac:	8a 30       	cpi	r24, 0x0A	; 10
     8ae:	c1 f4       	brne	.+48     	; 0x8e0 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x9e>
     8b0:	89 e1       	ldi	r24, 0x19	; 25
     8b2:	90 e0       	ldi	r25, 0x00	; 0
     8b4:	eb cf       	rjmp	.-42     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8b6:	87 30       	cpi	r24, 0x07	; 7
     8b8:	28 f0       	brcs	.+10     	; 0x8c4 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x82>
     8ba:	88 30       	cpi	r24, 0x08	; 8
     8bc:	a1 f4       	brne	.+40     	; 0x8e6 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xa4>
     8be:	80 e2       	ldi	r24, 0x20	; 32
     8c0:	90 e0       	ldi	r25, 0x00	; 0
     8c2:	e4 cf       	rjmp	.-56     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8c4:	86 30       	cpi	r24, 0x06	; 6
     8c6:	91 f4       	brne	.+36     	; 0x8ec <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xaa>
     8c8:	8a e2       	ldi	r24, 0x2A	; 42
     8ca:	90 e0       	ldi	r25, 0x00	; 0
     8cc:	df cf       	rjmp	.-66     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8ce:	83 e1       	ldi	r24, 0x13	; 19
     8d0:	90 e0       	ldi	r25, 0x00	; 0
     8d2:	dc cf       	rjmp	.-72     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8d4:	82 e1       	ldi	r24, 0x12	; 18
     8d6:	90 e0       	ldi	r25, 0x00	; 0
     8d8:	d9 cf       	rjmp	.-78     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8da:	87 e1       	ldi	r24, 0x17	; 23
     8dc:	90 e0       	ldi	r25, 0x00	; 0
     8de:	d6 cf       	rjmp	.-84     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8e0:	8c e1       	ldi	r24, 0x1C	; 28
     8e2:	90 e0       	ldi	r25, 0x00	; 0
     8e4:	d3 cf       	rjmp	.-90     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8e6:	84 e2       	ldi	r24, 0x24	; 36
     8e8:	90 e0       	ldi	r25, 0x00	; 0
     8ea:	d0 cf       	rjmp	.-96     	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8ec:	83 e3       	ldi	r24, 0x33	; 51
     8ee:	90 e0       	ldi	r25, 0x00	; 0
     8f0:	cd cf       	rjmp	.-102    	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
     8f2:	99 30       	cpi	r25, 0x09	; 9
     8f4:	48 f0       	brcs	.+18     	; 0x908 <__stack+0x9>
     8f6:	2b 30       	cpi	r18, 0x0B	; 11
     8f8:	a0 f4       	brcc	.+40     	; 0x922 <__stack+0x23>
     8fa:	27 30       	cpi	r18, 0x07	; 7
     8fc:	a0 f4       	brcc	.+40     	; 0x926 <__stack+0x27>
     8fe:	81 e0       	ldi	r24, 0x01	; 1
     900:	24 30       	cpi	r18, 0x04	; 4
     902:	08 f4       	brcc	.+2      	; 0x906 <__stack+0x7>
     904:	a6 cf       	rjmp	.-180    	; 0x852 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x10>
     906:	08 95       	ret
     908:	95 30       	cpi	r25, 0x05	; 5
     90a:	30 f0       	brcs	.+12     	; 0x918 <__stack+0x19>
     90c:	26 30       	cpi	r18, 0x06	; 6
     90e:	58 f4       	brcc	.+22     	; 0x926 <__stack+0x27>
     910:	81 e0       	ldi	r24, 0x01	; 1
     912:	23 30       	cpi	r18, 0x03	; 3
     914:	c0 f7       	brcc	.-16     	; 0x906 <__stack+0x7>
     916:	9d cf       	rjmp	.-198    	; 0x852 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x10>
     918:	93 30       	cpi	r25, 0x03	; 3
     91a:	d0 f7       	brcc	.-12     	; 0x910 <__stack+0x11>
     91c:	82 2f       	mov	r24, r18
     91e:	86 95       	lsr	r24
     920:	08 95       	ret
     922:	83 e0       	ldi	r24, 0x03	; 3
     924:	08 95       	ret
     926:	82 e0       	ldi	r24, 0x02	; 2
     928:	ee cf       	rjmp	.-36     	; 0x906 <__stack+0x7>

0000092a <_ZN8Internal23Generic_1_kHz_Generator13zero_providerEv>:
     92a:	80 e0       	ldi	r24, 0x00	; 0
     92c:	08 95       	ret

0000092e <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>:
     92e:	fc 01       	movw	r30, r24
     930:	82 81       	ldd	r24, Z+2	; 0x02
     932:	90 e0       	ldi	r25, 0x00	; 0
     934:	81 30       	cpi	r24, 0x01	; 1
     936:	39 f4       	brne	.+14     	; 0x946 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x18>
     938:	91 e0       	ldi	r25, 0x01	; 1
     93a:	61 11       	cpse	r22, r1
     93c:	04 c0       	rjmp	.+8      	; 0x946 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x18>
     93e:	97 81       	ldd	r25, Z+7	; 0x07
     940:	93 fb       	bst	r25, 3
     942:	99 27       	eor	r25, r25
     944:	90 f9       	bld	r25, 0
     946:	81 81       	ldd	r24, Z+1	; 0x01
     948:	81 30       	cpi	r24, 0x01	; 1
     94a:	81 f4       	brne	.+32     	; 0x96c <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3e>
     94c:	84 81       	ldd	r24, Z+4	; 0x04
     94e:	81 11       	cpse	r24, r1
     950:	06 c0       	rjmp	.+12     	; 0x95e <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x30>
     952:	81 e0       	ldi	r24, 0x01	; 1
     954:	25 81       	ldd	r18, Z+5	; 0x05
     956:	21 11       	cpse	r18, r1
     958:	07 c0       	rjmp	.+14     	; 0x968 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3a>
     95a:	80 e0       	ldi	r24, 0x00	; 0
     95c:	05 c0       	rjmp	.+10     	; 0x968 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3a>
     95e:	81 30       	cpi	r24, 0x01	; 1
     960:	e1 f7       	brne	.-8      	; 0x95a <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
     962:	25 81       	ldd	r18, Z+5	; 0x05
     964:	21 11       	cpse	r18, r1
     966:	f9 cf       	rjmp	.-14     	; 0x95a <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
     968:	89 23       	and	r24, r25
     96a:	08 95       	ret
     96c:	87 30       	cpi	r24, 0x07	; 7
     96e:	21 f0       	breq	.+8      	; 0x978 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x4a>
     970:	84 30       	cpi	r24, 0x04	; 4
     972:	11 f0       	breq	.+4      	; 0x978 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x4a>
     974:	80 31       	cpi	r24, 0x10	; 16
     976:	39 f4       	brne	.+14     	; 0x986 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x58>
     978:	84 81       	ldd	r24, Z+4	; 0x04
     97a:	81 30       	cpi	r24, 0x01	; 1
     97c:	59 f3       	breq	.-42     	; 0x954 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x26>
     97e:	82 30       	cpi	r24, 0x02	; 2
     980:	61 f7       	brne	.-40     	; 0x95a <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
     982:	81 e0       	ldi	r24, 0x01	; 1
     984:	ee cf       	rjmp	.-36     	; 0x962 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x34>
     986:	80 e0       	ldi	r24, 0x00	; 0
     988:	08 95       	ret

0000098a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>:
     98a:	fc 01       	movw	r30, r24
     98c:	62 81       	ldd	r22, Z+2	; 0x02
     98e:	62 33       	cpi	r22, 0x32	; 50
     990:	08 f0       	brcs	.+2      	; 0x994 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0xa>
     992:	49 c0       	rjmp	.+146    	; 0xa26 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
     994:	91 81       	ldd	r25, Z+1	; 0x01
     996:	93 31       	cpi	r25, 0x13	; 19
     998:	08 f0       	brcs	.+2      	; 0x99c <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x12>
     99a:	45 c0       	rjmp	.+138    	; 0xa26 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
     99c:	80 81       	ld	r24, Z
     99e:	8a 39       	cpi	r24, 0x9A	; 154
     9a0:	08 f0       	brcs	.+2      	; 0x9a4 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x1a>
     9a2:	41 c0       	rjmp	.+130    	; 0xa26 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
     9a4:	86 2f       	mov	r24, r22
     9a6:	82 95       	swap	r24
     9a8:	8f 70       	andi	r24, 0x0F	; 15
     9aa:	2a e0       	ldi	r18, 0x0A	; 10
     9ac:	6f 70       	andi	r22, 0x0F	; 15
     9ae:	36 2f       	mov	r19, r22
     9b0:	82 9f       	mul	r24, r18
     9b2:	30 0d       	add	r19, r0
     9b4:	11 24       	eor	r1, r1
     9b6:	49 2f       	mov	r20, r25
     9b8:	93 30       	cpi	r25, 0x03	; 3
     9ba:	58 f5       	brcc	.+86     	; 0xa12 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x88>
     9bc:	50 e0       	ldi	r21, 0x00	; 0
     9be:	46 5f       	subi	r20, 0xF6	; 246
     9c0:	5f 4f       	sbci	r21, 0xFF	; 255
     9c2:	20 81       	ld	r18, Z
     9c4:	82 2f       	mov	r24, r18
     9c6:	82 95       	swap	r24
     9c8:	8f 70       	andi	r24, 0x0F	; 15
     9ca:	2f 70       	andi	r18, 0x0F	; 15
     9cc:	6a e0       	ldi	r22, 0x0A	; 10
     9ce:	86 9f       	mul	r24, r22
     9d0:	20 0d       	add	r18, r0
     9d2:	11 24       	eor	r1, r1
     9d4:	81 e0       	ldi	r24, 0x01	; 1
     9d6:	93 30       	cpi	r25, 0x03	; 3
     9d8:	08 f0       	brcs	.+2      	; 0x9dc <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x52>
     9da:	80 e0       	ldi	r24, 0x00	; 0
     9dc:	28 1b       	sub	r18, r24
     9de:	6a e1       	ldi	r22, 0x1A	; 26
     9e0:	64 9f       	mul	r22, r20
     9e2:	c0 01       	movw	r24, r0
     9e4:	65 9f       	mul	r22, r21
     9e6:	90 0d       	add	r25, r0
     9e8:	11 24       	eor	r1, r1
     9ea:	02 97       	sbiw	r24, 0x02	; 2
     9ec:	6a e0       	ldi	r22, 0x0A	; 10
     9ee:	70 e0       	ldi	r23, 0x00	; 0
     9f0:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     9f4:	82 2f       	mov	r24, r18
     9f6:	83 0f       	add	r24, r19
     9f8:	26 95       	lsr	r18
     9fa:	26 95       	lsr	r18
     9fc:	82 0f       	add	r24, r18
     9fe:	86 0f       	add	r24, r22
     a00:	87 30       	cpi	r24, 0x07	; 7
     a02:	90 f0       	brcs	.+36     	; 0xa28 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9e>
     a04:	87 50       	subi	r24, 0x07	; 7
     a06:	68 2f       	mov	r22, r24
     a08:	66 95       	lsr	r22
     a0a:	66 95       	lsr	r22
     a0c:	66 95       	lsr	r22
     a0e:	87 70       	andi	r24, 0x07	; 7
     a10:	f6 cf       	rjmp	.-20     	; 0x9fe <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x74>
     a12:	4f 70       	andi	r20, 0x0F	; 15
     a14:	89 2f       	mov	r24, r25
     a16:	82 95       	swap	r24
     a18:	8f 70       	andi	r24, 0x0F	; 15
     a1a:	82 9f       	mul	r24, r18
     a1c:	40 0d       	add	r20, r0
     a1e:	11 24       	eor	r1, r1
     a20:	42 50       	subi	r20, 0x02	; 2
     a22:	55 0b       	sbc	r21, r21
     a24:	ce cf       	rjmp	.-100    	; 0x9c2 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x38>
     a26:	8f ef       	ldi	r24, 0xFF	; 255
     a28:	08 95       	ret

00000a2a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>:
     a2a:	0f 93       	push	r16
     a2c:	1f 93       	push	r17
     a2e:	cf 93       	push	r28
     a30:	df 93       	push	r29
     a32:	ec 01       	movw	r28, r24
     a34:	aa df       	rcall	.-172    	; 0x98a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
     a36:	81 11       	cpse	r24, r1
     a38:	01 c0       	rjmp	.+2      	; 0xa3c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x12>
     a3a:	87 e0       	ldi	r24, 0x07	; 7
     a3c:	8b 83       	std	Y+3, r24	; 0x03
     a3e:	19 81       	ldd	r17, Y+1	; 0x01
     a40:	0a 81       	ldd	r16, Y+2	; 0x02
     a42:	13 30       	cpi	r17, 0x03	; 3
     a44:	c8 f4       	brcc	.+50     	; 0xa78 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x4e>
     a46:	8f 81       	ldd	r24, Y+7	; 0x07
     a48:	8e 7f       	andi	r24, 0xFE	; 254
     a4a:	8f 83       	std	Y+7, r24	; 0x07
     a4c:	05 32       	cpi	r16, 0x25	; 37
     a4e:	28 f0       	brcs	.+10     	; 0xa5a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x30>
     a50:	ce 01       	movw	r24, r28
     a52:	9b df       	rcall	.-202    	; 0x98a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
     a54:	88 23       	and	r24, r24
     a56:	09 f4       	brne	.+2      	; 0xa5a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x30>
     a58:	43 c0       	rjmp	.+134    	; 0xae0 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xb6>
     a5a:	8f 81       	ldd	r24, Y+7	; 0x07
     a5c:	8b 7f       	andi	r24, 0xFB	; 251
     a5e:	8f 83       	std	Y+7, r24	; 0x07
     a60:	60 e0       	ldi	r22, 0x00	; 0
     a62:	ce 01       	movw	r24, r28
     a64:	64 df       	rcall	.-312    	; 0x92e <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>
     a66:	9f 81       	ldd	r25, Y+7	; 0x07
     a68:	80 fb       	bst	r24, 0
     a6a:	93 f9       	bld	r25, 3
     a6c:	9f 83       	std	Y+7, r25	; 0x07
     a6e:	df 91       	pop	r29
     a70:	cf 91       	pop	r28
     a72:	1f 91       	pop	r17
     a74:	0f 91       	pop	r16
     a76:	08 95       	ret
     a78:	13 30       	cpi	r17, 0x03	; 3
     a7a:	a9 f4       	brne	.+42     	; 0xaa6 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x7c>
     a7c:	05 32       	cpi	r16, 0x25	; 37
     a7e:	18 f3       	brcs	.-58     	; 0xa46 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1c>
     a80:	ce 01       	movw	r24, r28
     a82:	83 df       	rcall	.-250    	; 0x98a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
     a84:	88 23       	and	r24, r24
     a86:	49 f0       	breq	.+18     	; 0xa9a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x70>
     a88:	20 2f       	mov	r18, r16
     a8a:	28 1b       	sub	r18, r24
     a8c:	33 0b       	sbc	r19, r19
     a8e:	25 32       	cpi	r18, 0x25	; 37
     a90:	31 05       	cpc	r19, r1
     a92:	cc f2       	brlt	.-78     	; 0xa46 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1c>
     a94:	8f 81       	ldd	r24, Y+7	; 0x07
     a96:	81 60       	ori	r24, 0x01	; 1
     a98:	d8 cf       	rjmp	.-80     	; 0xa4a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x20>
     a9a:	91 e0       	ldi	r25, 0x01	; 1
     a9c:	8c 81       	ldd	r24, Y+4	; 0x04
     a9e:	82 30       	cpi	r24, 0x02	; 2
     aa0:	d0 f4       	brcc	.+52     	; 0xad6 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xac>
     aa2:	90 e0       	ldi	r25, 0x00	; 0
     aa4:	18 c0       	rjmp	.+48     	; 0xad6 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xac>
     aa6:	10 31       	cpi	r17, 0x10	; 16
     aa8:	a8 f3       	brcs	.-22     	; 0xa94 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x6a>
     aaa:	10 31       	cpi	r17, 0x10	; 16
     aac:	61 f6       	brne	.-104    	; 0xa46 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1c>
     aae:	05 32       	cpi	r16, 0x25	; 37
     ab0:	88 f3       	brcs	.-30     	; 0xa94 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x6a>
     ab2:	ce 01       	movw	r24, r28
     ab4:	6a df       	rcall	.-300    	; 0x98a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
     ab6:	88 23       	and	r24, r24
     ab8:	39 f0       	breq	.+14     	; 0xac8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x9e>
     aba:	20 2f       	mov	r18, r16
     abc:	28 1b       	sub	r18, r24
     abe:	33 0b       	sbc	r19, r19
     ac0:	25 32       	cpi	r18, 0x25	; 37
     ac2:	31 05       	cpc	r19, r1
     ac4:	3c f3       	brlt	.-50     	; 0xa94 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x6a>
     ac6:	bf cf       	rjmp	.-130    	; 0xa46 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1c>
     ac8:	8c 81       	ldd	r24, Y+4	; 0x04
     aca:	82 30       	cpi	r24, 0x02	; 2
     acc:	09 f4       	brne	.+2      	; 0xad0 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xa6>
     ace:	c0 cf       	rjmp	.-128    	; 0xa50 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x26>
     ad0:	91 e0       	ldi	r25, 0x01	; 1
     ad2:	82 30       	cpi	r24, 0x02	; 2
     ad4:	30 f7       	brcc	.-52     	; 0xaa2 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x78>
     ad6:	8f 81       	ldd	r24, Y+7	; 0x07
     ad8:	90 fb       	bst	r25, 0
     ada:	80 f9       	bld	r24, 0
     adc:	8f 83       	std	Y+7, r24	; 0x07
     ade:	b8 cf       	rjmp	.-144    	; 0xa50 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x26>
     ae0:	13 30       	cpi	r17, 0x03	; 3
     ae2:	a1 f4       	brne	.+40     	; 0xb0c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xe2>
     ae4:	8f 81       	ldd	r24, Y+7	; 0x07
     ae6:	2c 81       	ldd	r18, Y+4	; 0x04
     ae8:	98 2f       	mov	r25, r24
     aea:	91 70       	andi	r25, 0x01	; 1
     aec:	80 ff       	sbrs	r24, 0
     aee:	07 c0       	rjmp	.+14     	; 0xafe <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xd4>
     af0:	23 30       	cpi	r18, 0x03	; 3
     af2:	b1 f4       	brne	.+44     	; 0xb20 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf6>
     af4:	91 e0       	ldi	r25, 0x01	; 1
     af6:	2d 81       	ldd	r18, Y+5	; 0x05
     af8:	22 23       	and	r18, r18
     afa:	99 f0       	breq	.+38     	; 0xb22 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf8>
     afc:	11 c0       	rjmp	.+34     	; 0xb20 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf6>
     afe:	21 30       	cpi	r18, 0x01	; 1
     b00:	81 f4       	brne	.+32     	; 0xb22 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf8>
     b02:	91 e0       	ldi	r25, 0x01	; 1
     b04:	2d 81       	ldd	r18, Y+5	; 0x05
     b06:	21 11       	cpse	r18, r1
     b08:	0c c0       	rjmp	.+24     	; 0xb22 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf8>
     b0a:	0a c0       	rjmp	.+20     	; 0xb20 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf6>
     b0c:	10 31       	cpi	r17, 0x10	; 16
     b0e:	79 f4       	brne	.+30     	; 0xb2e <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x104>
     b10:	8f 81       	ldd	r24, Y+7	; 0x07
     b12:	2c 81       	ldd	r18, Y+4	; 0x04
     b14:	98 2f       	mov	r25, r24
     b16:	91 70       	andi	r25, 0x01	; 1
     b18:	80 ff       	sbrs	r24, 0
     b1a:	06 c0       	rjmp	.+12     	; 0xb28 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xfe>
     b1c:	22 30       	cpi	r18, 0x02	; 2
     b1e:	89 f3       	breq	.-30     	; 0xb02 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xd8>
     b20:	90 e0       	ldi	r25, 0x00	; 0
     b22:	90 fb       	bst	r25, 0
     b24:	82 f9       	bld	r24, 2
     b26:	9b cf       	rjmp	.-202    	; 0xa5e <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x34>
     b28:	22 30       	cpi	r18, 0x02	; 2
     b2a:	d9 f7       	brne	.-10     	; 0xb22 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xf8>
     b2c:	e3 cf       	rjmp	.-58     	; 0xaf4 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xca>
     b2e:	13 31       	cpi	r17, 0x13	; 19
     b30:	08 f4       	brcc	.+2      	; 0xb34 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x10a>
     b32:	93 cf       	rjmp	.-218    	; 0xa5a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x30>
     b34:	95 cf       	rjmp	.-214    	; 0xa60 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x36>

00000b36 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv>:
     b36:	dc 01       	movw	r26, r24
     b38:	11 96       	adiw	r26, 0x01	; 1
     b3a:	ec 91       	ld	r30, X
     b3c:	e1 50       	subi	r30, 0x01	; 1
     b3e:	e2 31       	cpi	r30, 0x12	; 18
     b40:	48 f5       	brcc	.+82     	; 0xb94 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x5e>
     b42:	f0 e0       	ldi	r31, 0x00	; 0
     b44:	ea 55       	subi	r30, 0x5A	; 90
     b46:	fa 4f       	sbci	r31, 0xFA	; 250
     b48:	0c 94 2d 27 	jmp	0x4e5a	; 0x4e5a <__tablejump2__>
     b4c:	cc 05       	cpc	r28, r12
     b4e:	ba 05       	cpc	r27, r10
     b50:	cc 05       	cpc	r28, r12
     b52:	b8 05       	cpc	r27, r8
     b54:	cc 05       	cpc	r28, r12
     b56:	b8 05       	cpc	r27, r8
     b58:	cc 05       	cpc	r28, r12
     b5a:	cc 05       	cpc	r28, r12
     b5c:	b8 05       	cpc	r27, r8
     b5e:	ca 05       	cpc	r28, r10
     b60:	ca 05       	cpc	r28, r10
     b62:	ca 05       	cpc	r28, r10
     b64:	ca 05       	cpc	r28, r10
     b66:	ca 05       	cpc	r28, r10
     b68:	ca 05       	cpc	r28, r10
     b6a:	cc 05       	cpc	r28, r12
     b6c:	b8 05       	cpc	r27, r8
     b6e:	cc 05       	cpc	r28, r12
     b70:	8e e1       	ldi	r24, 0x1E	; 30
     b72:	08 95       	ret
     b74:	fc 01       	movw	r30, r24
     b76:	80 81       	ld	r24, Z
     b78:	88 23       	and	r24, r24
     b7a:	81 f0       	breq	.+32     	; 0xb9c <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x66>
     b7c:	98 2f       	mov	r25, r24
     b7e:	92 95       	swap	r25
     b80:	9f 70       	andi	r25, 0x0F	; 15
     b82:	8f 70       	andi	r24, 0x0F	; 15
     b84:	fa e0       	ldi	r31, 0x0A	; 10
     b86:	9f 9f       	mul	r25, r31
     b88:	80 0d       	add	r24, r0
     b8a:	11 24       	eor	r1, r1
     b8c:	83 70       	andi	r24, 0x03	; 3
     b8e:	31 f4       	brne	.+12     	; 0xb9c <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x66>
     b90:	8d e1       	ldi	r24, 0x1D	; 29
     b92:	08 95       	ret
     b94:	80 e0       	ldi	r24, 0x00	; 0
     b96:	08 95       	ret
     b98:	8f e1       	ldi	r24, 0x1F	; 31
     b9a:	08 95       	ret
     b9c:	8c e1       	ldi	r24, 0x1C	; 28
     b9e:	08 95       	ret

00000ba0 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab>:
     ba0:	fc 01       	movw	r30, r24
     ba2:	90 81       	ld	r25, Z
     ba4:	66 23       	and	r22, r22
     ba6:	39 f0       	breq	.+14     	; 0xbb6 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x16>
     ba8:	21 e0       	ldi	r18, 0x01	; 1
     baa:	9f 37       	cpi	r25, 0x7F	; 127
     bac:	09 f4       	brne	.+2      	; 0xbb0 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x10>
     bae:	20 e0       	ldi	r18, 0x00	; 0
     bb0:	92 0f       	add	r25, r18
     bb2:	90 83       	st	Z, r25
     bb4:	08 95       	ret
     bb6:	81 e0       	ldi	r24, 0x01	; 1
     bb8:	92 38       	cpi	r25, 0x82	; 130
     bba:	0c f4       	brge	.+2      	; 0xbbe <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x1e>
     bbc:	80 e0       	ldi	r24, 0x00	; 0
     bbe:	98 1b       	sub	r25, r24
     bc0:	f8 cf       	rjmp	.-16     	; 0xbb2 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x12>

00000bc2 <_ZN8Internal16Arithmetic_Tools6parityEh>:
     bc2:	98 2f       	mov	r25, r24
     bc4:	9f 70       	andi	r25, 0x0F	; 15
     bc6:	82 95       	swap	r24
     bc8:	8f 70       	andi	r24, 0x0F	; 15
     bca:	98 27       	eor	r25, r24
     bcc:	89 2f       	mov	r24, r25
     bce:	83 70       	andi	r24, 0x03	; 3
     bd0:	96 95       	lsr	r25
     bd2:	96 95       	lsr	r25
     bd4:	98 27       	eor	r25, r24
     bd6:	89 2f       	mov	r24, r25
     bd8:	81 70       	andi	r24, 0x01	; 1
     bda:	96 95       	lsr	r25
     bdc:	89 27       	eor	r24, r25
     bde:	08 95       	ret

00000be0 <_ZN3BCD10int_to_bcdEh>:
     be0:	28 2f       	mov	r18, r24
     be2:	6a e0       	ldi	r22, 0x0A	; 10
     be4:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
     be8:	96 ef       	ldi	r25, 0xF6	; 246
     bea:	89 9f       	mul	r24, r25
     bec:	20 0d       	add	r18, r0
     bee:	11 24       	eor	r1, r1
     bf0:	82 95       	swap	r24
     bf2:	80 7f       	andi	r24, 0xF0	; 240
     bf4:	2f 70       	andi	r18, 0x0F	; 15
     bf6:	82 2b       	or	r24, r18
     bf8:	08 95       	ret

00000bfa <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.45>:
     bfa:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
     bfe:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
     c02:	89 1b       	sub	r24, r25
     c04:	99 0b       	sbc	r25, r25
     c06:	02 97       	sbiw	r24, 0x02	; 2
     c08:	74 f0       	brlt	.+28     	; 0xc26 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.45+0x2c>
     c0a:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
     c0e:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
     c12:	89 0f       	add	r24, r25
     c14:	99 27       	eor	r25, r25
     c16:	99 1f       	adc	r25, r25
     c18:	01 96       	adiw	r24, 0x01	; 1
     c1a:	6c e0       	ldi	r22, 0x0C	; 12
     c1c:	70 e0       	ldi	r23, 0x00	; 0
     c1e:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     c22:	8f 5f       	subi	r24, 0xFF	; 255
     c24:	dd cf       	rjmp	.-70     	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     c26:	8f ef       	ldi	r24, 0xFF	; 255
     c28:	08 95       	ret

00000c2a <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42>:
     c2a:	80 91 48 04 	lds	r24, 0x0448	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
     c2e:	90 91 47 04 	lds	r25, 0x0447	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
     c32:	89 1b       	sub	r24, r25
     c34:	99 0b       	sbc	r25, r25
     c36:	02 97       	sbiw	r24, 0x02	; 2
     c38:	74 f0       	brlt	.+28     	; 0xc56 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42+0x2c>
     c3a:	80 91 49 04 	lds	r24, 0x0449	; 0x800449 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
     c3e:	90 91 46 04 	lds	r25, 0x0446	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
     c42:	89 0f       	add	r24, r25
     c44:	99 27       	eor	r25, r25
     c46:	99 1f       	adc	r25, r25
     c48:	01 96       	adiw	r24, 0x01	; 1
     c4a:	6f e1       	ldi	r22, 0x1F	; 31
     c4c:	70 e0       	ldi	r23, 0x00	; 0
     c4e:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     c52:	8f 5f       	subi	r24, 0xFF	; 255
     c54:	c5 cf       	rjmp	.-118    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     c56:	8f ef       	ldi	r24, 0xFF	; 255
     c58:	08 95       	ret

00000c5a <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.39>:
     c5a:	80 91 25 04 	lds	r24, 0x0425	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
     c5e:	90 91 24 04 	lds	r25, 0x0424	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
     c62:	89 1b       	sub	r24, r25
     c64:	99 0b       	sbc	r25, r25
     c66:	02 97       	sbiw	r24, 0x02	; 2
     c68:	74 f0       	brlt	.+28     	; 0xc86 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.39+0x2c>
     c6a:	80 91 26 04 	lds	r24, 0x0426	; 0x800426 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
     c6e:	90 91 23 04 	lds	r25, 0x0423	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
     c72:	89 0f       	add	r24, r25
     c74:	99 27       	eor	r25, r25
     c76:	99 1f       	adc	r25, r25
     c78:	01 96       	adiw	r24, 0x01	; 1
     c7a:	67 e0       	ldi	r22, 0x07	; 7
     c7c:	70 e0       	ldi	r23, 0x00	; 0
     c7e:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     c82:	8f 5f       	subi	r24, 0xFF	; 255
     c84:	ad cf       	rjmp	.-166    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     c86:	8f ef       	ldi	r24, 0xFF	; 255
     c88:	08 95       	ret

00000c8a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36>:
     c8a:	80 91 1a 04 	lds	r24, 0x041A	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
     c8e:	90 91 19 04 	lds	r25, 0x0419	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
     c92:	89 1b       	sub	r24, r25
     c94:	99 0b       	sbc	r25, r25
     c96:	02 97       	sbiw	r24, 0x02	; 2
     c98:	6c f0       	brlt	.+26     	; 0xcb4 <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36+0x2a>
     c9a:	80 91 1b 04 	lds	r24, 0x041B	; 0x80041b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
     c9e:	90 91 18 04 	lds	r25, 0x0418	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
     ca2:	89 0f       	add	r24, r25
     ca4:	99 27       	eor	r25, r25
     ca6:	99 1f       	adc	r25, r25
     ca8:	01 96       	adiw	r24, 0x01	; 1
     caa:	68 e1       	ldi	r22, 0x18	; 24
     cac:	70 e0       	ldi	r23, 0x00	; 0
     cae:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     cb2:	96 cf       	rjmp	.-212    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     cb4:	8f ef       	ldi	r24, 0xFF	; 255
     cb6:	08 95       	ret

00000cb8 <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.27>:
     cb8:	80 91 b6 03 	lds	r24, 0x03B6	; 0x8003b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3e>
     cbc:	90 91 b5 03 	lds	r25, 0x03B5	; 0x8003b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3d>
     cc0:	89 1b       	sub	r24, r25
     cc2:	99 0b       	sbc	r25, r25
     cc4:	02 97       	sbiw	r24, 0x02	; 2
     cc6:	6c f0       	brlt	.+26     	; 0xce2 <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.27+0x2a>
     cc8:	80 91 b7 03 	lds	r24, 0x03B7	; 0x8003b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3f>
     ccc:	90 91 b4 03 	lds	r25, 0x03B4	; 0x8003b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
     cd0:	89 0f       	add	r24, r25
     cd2:	99 27       	eor	r25, r25
     cd4:	99 1f       	adc	r25, r25
     cd6:	01 96       	adiw	r24, 0x01	; 1
     cd8:	6c e3       	ldi	r22, 0x3C	; 60
     cda:	70 e0       	ldi	r23, 0x00	; 0
     cdc:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     ce0:	7f cf       	rjmp	.-258    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     ce2:	8f ef       	ldi	r24, 0xFF	; 255
     ce4:	08 95       	ret

00000ce6 <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>:
     ce6:	fc 01       	movw	r30, r24
     ce8:	84 85       	ldd	r24, Z+12	; 0x0c
     cea:	93 85       	ldd	r25, Z+11	; 0x0b
     cec:	89 1b       	sub	r24, r25
     cee:	99 0b       	sbc	r25, r25
     cf0:	02 97       	sbiw	r24, 0x02	; 2
     cf2:	5c f0       	brlt	.+22     	; 0xd0a <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv+0x24>
     cf4:	85 85       	ldd	r24, Z+13	; 0x0d
     cf6:	92 85       	ldd	r25, Z+10	; 0x0a
     cf8:	89 0f       	add	r24, r25
     cfa:	99 27       	eor	r25, r25
     cfc:	99 1f       	adc	r25, r25
     cfe:	01 96       	adiw	r24, 0x01	; 1
     d00:	6a e0       	ldi	r22, 0x0A	; 10
     d02:	70 e0       	ldi	r23, 0x00	; 0
     d04:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
     d08:	6b cf       	rjmp	.-298    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     d0a:	8f ef       	ldi	r24, 0xFF	; 255
     d0c:	08 95       	ret

00000d0e <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29>:
     d0e:	cf 93       	push	r28
     d10:	8a e5       	ldi	r24, 0x5A	; 90
     d12:	94 e0       	ldi	r25, 0x04	; 4
     d14:	e8 df       	rcall	.-48     	; 0xce6 <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
     d16:	c8 2f       	mov	r28, r24
     d18:	88 e6       	ldi	r24, 0x68	; 104
     d1a:	94 e0       	ldi	r25, 0x04	; 4
     d1c:	e4 df       	rcall	.-56     	; 0xce6 <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
     d1e:	cf 3f       	cpi	r28, 0xFF	; 255
     d20:	39 f0       	breq	.+14     	; 0xd30 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29+0x22>
     d22:	8f 3f       	cpi	r24, 0xFF	; 255
     d24:	19 f0       	breq	.+6      	; 0xd2c <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29+0x1e>
     d26:	82 95       	swap	r24
     d28:	80 7f       	andi	r24, 0xF0	; 240
     d2a:	8c 0f       	add	r24, r28
     d2c:	cf 91       	pop	r28
     d2e:	08 95       	ret
     d30:	8f ef       	ldi	r24, 0xFF	; 255
     d32:	fc cf       	rjmp	.-8      	; 0xd2c <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29+0x1e>

00000d34 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>:
     d34:	cf 93       	push	r28
     d36:	df 93       	push	r29
     d38:	ec 01       	movw	r28, r24
     d3a:	49 da       	rcall	.-2926   	; 0x1ce <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33>
     d3c:	8e 83       	std	Y+6, r24	; 0x06
     d3e:	bc df       	rcall	.-136    	; 0xcb8 <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.27>
     d40:	8d 83       	std	Y+5, r24	; 0x05
     d42:	a3 df       	rcall	.-186    	; 0xc8a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36>
     d44:	8c 83       	std	Y+4, r24	; 0x04
     d46:	89 df       	rcall	.-238    	; 0xc5a <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.39>
     d48:	8b 83       	std	Y+3, r24	; 0x03
     d4a:	6f df       	rcall	.-290    	; 0xc2a <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42>
     d4c:	8a 83       	std	Y+2, r24	; 0x02
     d4e:	55 df       	rcall	.-342    	; 0xbfa <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.45>
     d50:	89 83       	std	Y+1, r24	; 0x01
     d52:	dd df       	rcall	.-70     	; 0xd0e <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29>
     d54:	88 83       	st	Y, r24
     d56:	8f 81       	ldd	r24, Y+7	; 0x07
     d58:	90 91 6f 03 	lds	r25, 0x036F	; 0x80036f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
     d5c:	90 fb       	bst	r25, 0
     d5e:	81 f9       	bld	r24, 1
     d60:	8f 83       	std	Y+7, r24	; 0x07
     d62:	91 e0       	ldi	r25, 0x01	; 1
     d64:	80 91 70 03 	lds	r24, 0x0370	; 0x800370 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
     d68:	18 16       	cp	r1, r24
     d6a:	0c f0       	brlt	.+2      	; 0xd6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE+0x3a>
     d6c:	90 e0       	ldi	r25, 0x00	; 0
     d6e:	8f 81       	ldd	r24, Y+7	; 0x07
     d70:	90 fb       	bst	r25, 0
     d72:	82 f9       	bld	r24, 2
     d74:	90 91 71 03 	lds	r25, 0x0371	; 0x800371 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
     d78:	8e 7f       	andi	r24, 0xFE	; 254
     d7a:	97 ff       	sbrs	r25, 7
     d7c:	81 60       	ori	r24, 0x01	; 1
     d7e:	8f 83       	std	Y+7, r24	; 0x07
     d80:	91 e0       	ldi	r25, 0x01	; 1
     d82:	80 91 72 03 	lds	r24, 0x0372	; 0x800372 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x3>
     d86:	18 16       	cp	r1, r24
     d88:	0c f0       	brlt	.+2      	; 0xd8c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE+0x58>
     d8a:	90 e0       	ldi	r25, 0x00	; 0
     d8c:	8f 81       	ldd	r24, Y+7	; 0x07
     d8e:	90 fb       	bst	r25, 0
     d90:	83 f9       	bld	r24, 3
     d92:	8f 83       	std	Y+7, r24	; 0x07
     d94:	df 91       	pop	r29
     d96:	cf 91       	pop	r28
     d98:	08 95       	ret

00000d9a <_ZN11DCF77_Clock17read_current_timeERN5Clock6time_tE>:
     d9a:	df 92       	push	r13
     d9c:	ef 92       	push	r14
     d9e:	ff 92       	push	r15
     da0:	0f 93       	push	r16
     da2:	1f 93       	push	r17
     da4:	cf 93       	push	r28
     da6:	df 93       	push	r29
     da8:	cd b7       	in	r28, 0x3d	; 61
     daa:	de b7       	in	r29, 0x3e	; 62
     dac:	28 97       	sbiw	r28, 0x08	; 8
     dae:	0f b6       	in	r0, 0x3f	; 63
     db0:	f8 94       	cli
     db2:	de bf       	out	0x3e, r29	; 62
     db4:	0f be       	out	0x3f, r0	; 63
     db6:	cd bf       	out	0x3d, r28	; 61
     db8:	8c 01       	movw	r16, r24
     dba:	2f b7       	in	r18, 0x3f	; 63
     dbc:	f8 94       	cli
     dbe:	88 e0       	ldi	r24, 0x08	; 8
     dc0:	ec e5       	ldi	r30, 0x5C	; 92
     dc2:	f3 e0       	ldi	r31, 0x03	; 3
     dc4:	de 01       	movw	r26, r28
     dc6:	11 96       	adiw	r26, 0x01	; 1
     dc8:	01 90       	ld	r0, Z+
     dca:	0d 92       	st	X+, r0
     dcc:	8a 95       	dec	r24
     dce:	e1 f7       	brne	.-8      	; 0xdc8 <_ZN11DCF77_Clock17read_current_timeERN5Clock6time_tE+0x2e>
     dd0:	80 91 62 03 	lds	r24, 0x0362	; 0x800362 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
     dd4:	90 91 63 03 	lds	r25, 0x0363	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
     dd8:	90 fb       	bst	r25, 0
     dda:	dd 24       	eor	r13, r13
     ddc:	d0 f8       	bld	r13, 0
     dde:	92 fb       	bst	r25, 2
     de0:	ee 24       	eor	r14, r14
     de2:	e0 f8       	bld	r14, 0
     de4:	93 fb       	bst	r25, 3
     de6:	ff 24       	eor	r15, r15
     de8:	f0 f8       	bld	r15, 0
     dea:	2f bf       	out	0x3f, r18	; 63
     dec:	f9 de       	rcall	.-526    	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
     dee:	f8 01       	movw	r30, r16
     df0:	86 83       	std	Z+6, r24	; 0x06
     df2:	8e 81       	ldd	r24, Y+6	; 0x06
     df4:	85 83       	std	Z+5, r24	; 0x05
     df6:	8d 81       	ldd	r24, Y+5	; 0x05
     df8:	84 83       	std	Z+4, r24	; 0x04
     dfa:	8c 81       	ldd	r24, Y+4	; 0x04
     dfc:	83 83       	std	Z+3, r24	; 0x03
     dfe:	8b 81       	ldd	r24, Y+3	; 0x03
     e00:	82 83       	std	Z+2, r24	; 0x02
     e02:	8a 81       	ldd	r24, Y+2	; 0x02
     e04:	81 83       	std	Z+1, r24	; 0x01
     e06:	89 81       	ldd	r24, Y+1	; 0x01
     e08:	80 83       	st	Z, r24
     e0a:	d7 82       	std	Z+7, r13	; 0x07
     e0c:	f1 86       	std	Z+9, r15	; 0x09
     e0e:	e0 86       	std	Z+8, r14	; 0x08
     e10:	28 96       	adiw	r28, 0x08	; 8
     e12:	0f b6       	in	r0, 0x3f	; 63
     e14:	f8 94       	cli
     e16:	de bf       	out	0x3e, r29	; 62
     e18:	0f be       	out	0x3f, r0	; 63
     e1a:	cd bf       	out	0x3d, r28	; 61
     e1c:	df 91       	pop	r29
     e1e:	cf 91       	pop	r28
     e20:	1f 91       	pop	r17
     e22:	0f 91       	pop	r16
     e24:	ff 90       	pop	r15
     e26:	ef 90       	pop	r14
     e28:	df 90       	pop	r13
     e2a:	08 95       	ret

00000e2c <_ZN3BCD9incrementERNS_5bcd_tE>:
     e2c:	fc 01       	movw	r30, r24
     e2e:	90 81       	ld	r25, Z
     e30:	29 2f       	mov	r18, r25
     e32:	2f 70       	andi	r18, 0x0F	; 15
     e34:	90 7f       	andi	r25, 0xF0	; 240
     e36:	29 30       	cpi	r18, 0x09	; 9
     e38:	28 f4       	brcc	.+10     	; 0xe44 <_ZN3BCD9incrementERNS_5bcd_tE+0x18>
     e3a:	2f 5f       	subi	r18, 0xFF	; 255
     e3c:	2f 70       	andi	r18, 0x0F	; 15
     e3e:	92 2b       	or	r25, r18
     e40:	90 83       	st	Z, r25
     e42:	08 95       	ret
     e44:	90 83       	st	Z, r25
     e46:	92 95       	swap	r25
     e48:	9f 70       	andi	r25, 0x0F	; 15
     e4a:	99 30       	cpi	r25, 0x09	; 9
     e4c:	20 f4       	brcc	.+8      	; 0xe56 <_ZN3BCD9incrementERNS_5bcd_tE+0x2a>
     e4e:	9f 5f       	subi	r25, 0xFF	; 255
     e50:	92 95       	swap	r25
     e52:	90 7f       	andi	r25, 0xF0	; 240
     e54:	f5 cf       	rjmp	.-22     	; 0xe40 <_ZN3BCD9incrementERNS_5bcd_tE+0x14>
     e56:	10 82       	st	Z, r1
     e58:	08 95       	ret

00000e5a <_ZN8Internal13DCF77_Encoder14advance_minuteEv>:
     e5a:	0f 93       	push	r16
     e5c:	1f 93       	push	r17
     e5e:	cf 93       	push	r28
     e60:	df 93       	push	r29
     e62:	fc 01       	movw	r30, r24
     e64:	25 81       	ldd	r18, Z+5	; 0x05
     e66:	29 35       	cpi	r18, 0x59	; 89
     e68:	30 f4       	brcc	.+12     	; 0xe76 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x1c>
     e6a:	05 96       	adiw	r24, 0x05	; 5
     e6c:	df 91       	pop	r29
     e6e:	cf 91       	pop	r28
     e70:	1f 91       	pop	r17
     e72:	0f 91       	pop	r16
     e74:	db cf       	rjmp	.-74     	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
     e76:	29 35       	cpi	r18, 0x59	; 89
     e78:	a1 f4       	brne	.+40     	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>
     e7a:	ec 01       	movw	r28, r24
     e7c:	15 82       	std	Z+5, r1	; 0x05
     e7e:	94 81       	ldd	r25, Z+4	; 0x04
     e80:	87 81       	ldd	r24, Z+7	; 0x07
     e82:	82 ff       	sbrs	r24, 2
     e84:	17 c0       	rjmp	.+46     	; 0xeb4 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x5a>
     e86:	80 fd       	sbrc	r24, 0
     e88:	11 c0       	rjmp	.+34     	; 0xeac <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x52>
     e8a:	91 30       	cpi	r25, 0x01	; 1
     e8c:	99 f4       	brne	.+38     	; 0xeb4 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x5a>
     e8e:	8f 01       	movw	r16, r30
     e90:	0c 5f       	subi	r16, 0xFC	; 252
     e92:	1f 4f       	sbci	r17, 0xFF	; 255
     e94:	c8 01       	movw	r24, r16
     e96:	ca df       	rcall	.-108    	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
     e98:	c8 01       	movw	r24, r16
     e9a:	c8 df       	rcall	.-112    	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
     e9c:	8f 81       	ldd	r24, Y+7	; 0x07
     e9e:	81 60       	ori	r24, 0x01	; 1
     ea0:	8f 83       	std	Y+7, r24	; 0x07
     ea2:	df 91       	pop	r29
     ea4:	cf 91       	pop	r28
     ea6:	1f 91       	pop	r17
     ea8:	0f 91       	pop	r16
     eaa:	08 95       	ret
     eac:	92 30       	cpi	r25, 0x02	; 2
     eae:	11 f4       	brne	.+4      	; 0xeb4 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x5a>
     eb0:	8e 7f       	andi	r24, 0xFE	; 254
     eb2:	f6 cf       	rjmp	.-20     	; 0xea0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x46>
     eb4:	93 32       	cpi	r25, 0x23	; 35
     eb6:	18 f4       	brcc	.+6      	; 0xebe <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x64>
     eb8:	ce 01       	movw	r24, r28
     eba:	04 96       	adiw	r24, 0x04	; 4
     ebc:	d7 cf       	rjmp	.-82     	; 0xe6c <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
     ebe:	93 32       	cpi	r25, 0x23	; 35
     ec0:	81 f7       	brne	.-32     	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>
     ec2:	1c 82       	std	Y+4, r1	; 0x04
     ec4:	8b 81       	ldd	r24, Y+3	; 0x03
     ec6:	87 30       	cpi	r24, 0x07	; 7
     ec8:	98 f4       	brcc	.+38     	; 0xef0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x96>
     eca:	ce 01       	movw	r24, r28
     ecc:	03 96       	adiw	r24, 0x03	; 3
     ece:	ae df       	rcall	.-164    	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
     ed0:	1a 81       	ldd	r17, Y+2	; 0x02
     ed2:	81 2f       	mov	r24, r17
     ed4:	82 95       	swap	r24
     ed6:	8f 70       	andi	r24, 0x0F	; 15
     ed8:	1f 70       	andi	r17, 0x0F	; 15
     eda:	fa e0       	ldi	r31, 0x0A	; 10
     edc:	8f 9f       	mul	r24, r31
     ede:	10 0d       	add	r17, r0
     ee0:	11 24       	eor	r1, r1
     ee2:	ce 01       	movw	r24, r28
     ee4:	28 de       	rcall	.-944    	; 0xb36 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv>
     ee6:	18 17       	cp	r17, r24
     ee8:	40 f4       	brcc	.+16     	; 0xefa <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xa0>
     eea:	ce 01       	movw	r24, r28
     eec:	02 96       	adiw	r24, 0x02	; 2
     eee:	be cf       	rjmp	.-132    	; 0xe6c <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
     ef0:	87 30       	cpi	r24, 0x07	; 7
     ef2:	71 f7       	brne	.-36     	; 0xed0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x76>
     ef4:	81 e0       	ldi	r24, 0x01	; 1
     ef6:	8b 83       	std	Y+3, r24	; 0x03
     ef8:	eb cf       	rjmp	.-42     	; 0xed0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x76>
     efa:	18 13       	cpse	r17, r24
     efc:	d2 cf       	rjmp	.-92     	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>
     efe:	81 e0       	ldi	r24, 0x01	; 1
     f00:	8a 83       	std	Y+2, r24	; 0x02
     f02:	99 81       	ldd	r25, Y+1	; 0x01
     f04:	92 31       	cpi	r25, 0x12	; 18
     f06:	18 f4       	brcc	.+6      	; 0xf0e <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xb4>
     f08:	ce 01       	movw	r24, r28
     f0a:	01 96       	adiw	r24, 0x01	; 1
     f0c:	af cf       	rjmp	.-162    	; 0xe6c <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
     f0e:	92 31       	cpi	r25, 0x12	; 18
     f10:	41 f6       	brne	.-112    	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>
     f12:	89 83       	std	Y+1, r24	; 0x01
     f14:	88 81       	ld	r24, Y
     f16:	89 39       	cpi	r24, 0x99	; 153
     f18:	10 f4       	brcc	.+4      	; 0xf1e <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xc4>
     f1a:	ce 01       	movw	r24, r28
     f1c:	a7 cf       	rjmp	.-178    	; 0xe6c <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
     f1e:	89 39       	cpi	r24, 0x99	; 153
     f20:	09 f0       	breq	.+2      	; 0xf24 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xca>
     f22:	bf cf       	rjmp	.-130    	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>
     f24:	18 82       	st	Y, r1
     f26:	bd cf       	rjmp	.-134    	; 0xea2 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x48>

00000f28 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>:
     f28:	8f 92       	push	r8
     f2a:	9f 92       	push	r9
     f2c:	af 92       	push	r10
     f2e:	bf 92       	push	r11
     f30:	cf 92       	push	r12
     f32:	df 92       	push	r13
     f34:	ef 92       	push	r14
     f36:	ff 92       	push	r15
     f38:	0f 93       	push	r16
     f3a:	1f 93       	push	r17
     f3c:	cf 93       	push	r28
     f3e:	df 93       	push	r29
     f40:	cd b7       	in	r28, 0x3d	; 61
     f42:	de b7       	in	r29, 0x3e	; 62
     f44:	28 97       	sbiw	r28, 0x08	; 8
     f46:	0f b6       	in	r0, 0x3f	; 63
     f48:	f8 94       	cli
     f4a:	de bf       	out	0x3e, r29	; 62
     f4c:	0f be       	out	0x3f, r0	; 63
     f4e:	cd bf       	out	0x3d, r28	; 61
     f50:	8c 01       	movw	r16, r24
     f52:	dc 01       	movw	r26, r24
     f54:	15 96       	adiw	r26, 0x05	; 5
     f56:	8c 91       	ld	r24, X
     f58:	15 97       	sbiw	r26, 0x05	; 5
     f5a:	8f 70       	andi	r24, 0x0F	; 15
     f5c:	b8 2e       	mov	r11, r24
     f5e:	16 96       	adiw	r26, 0x06	; 6
     f60:	ec 91       	ld	r30, X
     f62:	e0 90 fa 05 	lds	r14, 0x05FA	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
     f66:	f0 90 fb 05 	lds	r15, 0x05FB	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
     f6a:	2e 2f       	mov	r18, r30
     f6c:	30 e0       	ldi	r19, 0x00	; 0
     f6e:	50 e0       	ldi	r21, 0x00	; 0
     f70:	40 e0       	ldi	r20, 0x00	; 0
     f72:	25 50       	subi	r18, 0x05	; 5
     f74:	31 09       	sbc	r19, r1
     f76:	41 09       	sbc	r20, r1
     f78:	51 09       	sbc	r21, r1
     f7a:	ac e9       	ldi	r26, 0x9C	; 156
     f7c:	bf ef       	ldi	r27, 0xFF	; 255
     f7e:	0e 94 4a 27 	call	0x4e94	; 0x4e94 <__mulohisi3>
     f82:	9b 01       	movw	r18, r22
     f84:	ac 01       	movw	r20, r24
     f86:	2e 0d       	add	r18, r14
     f88:	3f 1d       	adc	r19, r15
     f8a:	41 1d       	adc	r20, r1
     f8c:	51 1d       	adc	r21, r1
     f8e:	69 01       	movw	r12, r18
     f90:	7a 01       	movw	r14, r20
     f92:	2b 2d       	mov	r18, r11
     f94:	30 e0       	ldi	r19, 0x00	; 0
     f96:	50 e0       	ldi	r21, 0x00	; 0
     f98:	40 e0       	ldi	r20, 0x00	; 0
     f9a:	80 91 fc 05 	lds	r24, 0x05FC	; 0x8005fc <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x4>
     f9e:	28 1b       	sub	r18, r24
     fa0:	31 09       	sbc	r19, r1
     fa2:	41 09       	sbc	r20, r1
     fa4:	51 09       	sbc	r21, r1
     fa6:	a0 e9       	ldi	r26, 0x90	; 144
     fa8:	b8 ee       	ldi	r27, 0xE8	; 232
     faa:	0e 94 4a 27 	call	0x4e94	; 0x4e94 <__mulohisi3>
     fae:	c6 0e       	add	r12, r22
     fb0:	d7 1e       	adc	r13, r23
     fb2:	e8 1e       	adc	r14, r24
     fb4:	f9 1e       	adc	r15, r25
     fb6:	31 e3       	ldi	r19, 0x31	; 49
     fb8:	c3 16       	cp	r12, r19
     fba:	35 e7       	ldi	r19, 0x75	; 117
     fbc:	d3 06       	cpc	r13, r19
     fbe:	e1 04       	cpc	r14, r1
     fc0:	f1 04       	cpc	r15, r1
     fc2:	3c f0       	brlt	.+14     	; 0xfd2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xaa>
     fc4:	40 e6       	ldi	r20, 0x60	; 96
     fc6:	c4 1a       	sub	r12, r20
     fc8:	4a ee       	ldi	r20, 0xEA	; 234
     fca:	d4 0a       	sbc	r13, r20
     fcc:	e1 08       	sbc	r14, r1
     fce:	f1 08       	sbc	r15, r1
     fd0:	f2 cf       	rjmp	.-28     	; 0xfb6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x8e>
     fd2:	51 ed       	ldi	r21, 0xD1	; 209
     fd4:	c5 16       	cp	r12, r21
     fd6:	5a e8       	ldi	r21, 0x8A	; 138
     fd8:	d5 06       	cpc	r13, r21
     fda:	5f ef       	ldi	r21, 0xFF	; 255
     fdc:	e5 06       	cpc	r14, r21
     fde:	f5 06       	cpc	r15, r21
     fe0:	3c f4       	brge	.+14     	; 0xff0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xc8>
     fe2:	80 e6       	ldi	r24, 0x60	; 96
     fe4:	c8 0e       	add	r12, r24
     fe6:	8a ee       	ldi	r24, 0xEA	; 234
     fe8:	d8 1e       	adc	r13, r24
     fea:	e1 1c       	adc	r14, r1
     fec:	f1 1c       	adc	r15, r1
     fee:	f1 cf       	rjmp	.-30     	; 0xfd2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xaa>
     ff0:	d0 92 59 03 	sts	0x0359, r13	; 0x800359 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
     ff4:	c0 92 58 03 	sts	0x0358, r12	; 0x800358 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
     ff8:	e5 30       	cpi	r30, 0x05	; 5
     ffa:	09 f0       	breq	.+2      	; 0xffe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xd6>
     ffc:	85 c0       	rjmp	.+266    	; 0x1108 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1e0>
     ffe:	61 e0       	ldi	r22, 0x01	; 1
    1000:	c8 01       	movw	r24, r16
    1002:	95 dc       	rcall	.-1750   	; 0x92e <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>
    1004:	88 23       	and	r24, r24
    1006:	29 f0       	breq	.+10     	; 0x1012 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xea>
    1008:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    100c:	8d 7f       	andi	r24, 0xFD	; 253
    100e:	80 93 57 03 	sts	0x0357, r24	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1012:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1016:	81 ff       	sbrs	r24, 1
    1018:	28 c1       	rjmp	.+592    	; 0x126a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x342>
    101a:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    101e:	80 ff       	sbrs	r24, 0
    1020:	1c c1       	rjmp	.+568    	; 0x125a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x332>
    1022:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1026:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    102a:	8e 34       	cpi	r24, 0x4E	; 78
    102c:	91 40       	sbci	r25, 0x01	; 1
    102e:	08 f4       	brcc	.+2      	; 0x1032 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x10a>
    1030:	f9 c0       	rjmp	.+498    	; 0x1224 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2fc>
    1032:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1036:	90 91 59 03 	lds	r25, 0x0359	; 0x800359 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    103a:	18 16       	cp	r1, r24
    103c:	19 06       	cpc	r1, r25
    103e:	0c f4       	brge	.+2      	; 0x1042 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x11a>
    1040:	ea c0       	rjmp	.+468    	; 0x1216 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2ee>
    1042:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1046:	90 91 59 03 	lds	r25, 0x0359	; 0x800359 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    104a:	8c 3f       	cpi	r24, 0xFC	; 252
    104c:	9f 4f       	sbci	r25, 0xFF	; 255
    104e:	0c f0       	brlt	.+2      	; 0x1052 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12a>
    1050:	e9 c0       	rjmp	.+466    	; 0x1224 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2fc>
    1052:	8f b7       	in	r24, 0x3f	; 63
    1054:	f8 94       	cli
    1056:	e0 90 54 03 	lds	r14, 0x0354	; 0x800354 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    105a:	f0 90 55 03 	lds	r15, 0x0355	; 0x800355 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    105e:	8f bf       	out	0x3f, r24	; 63
    1060:	a0 91 58 03 	lds	r26, 0x0358	; 0x800358 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1064:	b0 91 59 03 	lds	r27, 0x0359	; 0x800359 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1068:	40 91 f8 05 	lds	r20, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    106c:	50 91 f9 05 	lds	r21, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1070:	2a e6       	ldi	r18, 0x6A	; 106
    1072:	3a e0       	ldi	r19, 0x0A	; 10
    1074:	0e 94 42 27 	call	0x4e84	; 0x4e84 <__usmulhisi3>
    1078:	9a 01       	movw	r18, r20
    107a:	50 e0       	ldi	r21, 0x00	; 0
    107c:	40 e0       	ldi	r20, 0x00	; 0
    107e:	0e 94 11 27 	call	0x4e22	; 0x4e22 <__divmodsi4>
    1082:	49 01       	movw	r8, r18
    1084:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1088:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    108c:	60 91 f8 05 	lds	r22, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1090:	70 91 f9 05 	lds	r23, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1094:	87 59       	subi	r24, 0x97	; 151
    1096:	95 4f       	sbci	r25, 0xF5	; 245
    1098:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    109c:	60 93 56 03 	sts	0x0356, r22	; 0x800356 <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    10a0:	80 91 56 03 	lds	r24, 0x0356	; 0x800356 <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    10a4:	81 11       	cpse	r24, r1
    10a6:	03 c0       	rjmp	.+6      	; 0x10ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x186>
    10a8:	81 e0       	ldi	r24, 0x01	; 1
    10aa:	80 93 56 03 	sts	0x0356, r24	; 0x800356 <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    10ae:	c7 01       	movw	r24, r14
    10b0:	88 19       	sub	r24, r8
    10b2:	99 09       	sbc	r25, r9
    10b4:	80 33       	cpi	r24, 0x30	; 48
    10b6:	f8 ef       	ldi	r31, 0xF8	; 248
    10b8:	9f 07       	cpc	r25, r31
    10ba:	14 f4       	brge	.+4      	; 0x10c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x198>
    10bc:	80 e3       	ldi	r24, 0x30	; 48
    10be:	98 ef       	ldi	r25, 0xF8	; 248
    10c0:	2f b7       	in	r18, 0x3f	; 63
    10c2:	f8 94       	cli
    10c4:	81 3d       	cpi	r24, 0xD1	; 209
    10c6:	37 e0       	ldi	r19, 0x07	; 7
    10c8:	93 07       	cpc	r25, r19
    10ca:	14 f0       	brlt	.+4      	; 0x10d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1a8>
    10cc:	80 ed       	ldi	r24, 0xD0	; 208
    10ce:	97 e0       	ldi	r25, 0x07	; 7
    10d0:	90 93 55 03 	sts	0x0355, r25	; 0x800355 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    10d4:	80 93 54 03 	sts	0x0354, r24	; 0x800354 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    10d8:	2f bf       	out	0x3f, r18	; 63
    10da:	88 eb       	ldi	r24, 0xB8	; 184
    10dc:	9b e0       	ldi	r25, 0x0B	; 11
    10de:	90 93 dd 05 	sts	0x05DD, r25	; 0x8005dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    10e2:	80 93 dc 05 	sts	0x05DC, r24	; 0x8005dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    10e6:	80 e3       	ldi	r24, 0x30	; 48
    10e8:	95 e7       	ldi	r25, 0x75	; 117
    10ea:	a0 e0       	ldi	r26, 0x00	; 0
    10ec:	b0 e0       	ldi	r27, 0x00	; 0
    10ee:	80 93 6b 03 	sts	0x036B, r24	; 0x80036b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    10f2:	90 93 6c 03 	sts	0x036C, r25	; 0x80036c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    10f6:	a0 93 6d 03 	sts	0x036D, r26	; 0x80036d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    10fa:	b0 93 6e 03 	sts	0x036E, r27	; 0x80036e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    10fe:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1102:	8d 7f       	andi	r24, 0xFD	; 253
    1104:	80 93 57 03 	sts	0x0357, r24	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1108:	d8 01       	movw	r26, r16
    110a:	16 96       	adiw	r26, 0x06	; 6
    110c:	8c 91       	ld	r24, X
    110e:	8f 30       	cpi	r24, 0x0F	; 15
    1110:	09 f0       	breq	.+2      	; 0x1114 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1ec>
    1112:	90 c0       	rjmp	.+288    	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1114:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    1118:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    111c:	89 2b       	or	r24, r25
    111e:	09 f4       	brne	.+2      	; 0x1122 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1fa>
    1120:	89 c0       	rjmp	.+274    	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1122:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    1126:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    112a:	01 97       	sbiw	r24, 0x01	; 1
    112c:	09 f4       	brne	.+2      	; 0x1130 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x208>
    112e:	82 c0       	rjmp	.+260    	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1130:	88 e0       	ldi	r24, 0x08	; 8
    1132:	f8 01       	movw	r30, r16
    1134:	de 01       	movw	r26, r28
    1136:	11 96       	adiw	r26, 0x01	; 1
    1138:	01 90       	ld	r0, Z+
    113a:	0d 92       	st	X+, r0
    113c:	8a 95       	dec	r24
    113e:	e1 f7       	brne	.-8      	; 0x1138 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x210>
    1140:	ce 01       	movw	r24, r28
    1142:	01 96       	adiw	r24, 0x01	; 1
    1144:	8a de       	rcall	.-748    	; 0xe5a <_ZN8Internal13DCF77_Encoder14advance_minuteEv>
    1146:	ce 01       	movw	r24, r28
    1148:	01 96       	adiw	r24, 0x01	; 1
    114a:	6f dc       	rcall	.-1826   	; 0xa2a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    114c:	98 85       	ldd	r25, Y+8	; 0x08
    114e:	88 e0       	ldi	r24, 0x08	; 8
    1150:	92 ff       	sbrs	r25, 2
    1152:	80 e0       	ldi	r24, 0x00	; 0
    1154:	90 ff       	sbrs	r25, 0
    1156:	a1 c0       	rjmp	.+322    	; 0x129a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x372>
    1158:	80 61       	ori	r24, 0x10	; 16
    115a:	93 fd       	sbrc	r25, 3
    115c:	80 64       	ori	r24, 0x40	; 64
    115e:	80 68       	ori	r24, 0x80	; 128
    1160:	80 93 f8 03 	sts	0x03F8, r24	; 0x8003f8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x40>
    1164:	1e 81       	ldd	r17, Y+6	; 0x06
    1166:	81 2f       	mov	r24, r17
    1168:	2c dd       	rcall	.-1448   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    116a:	88 23       	and	r24, r24
    116c:	09 f4       	brne	.+2      	; 0x1170 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x248>
    116e:	8f c0       	rjmp	.+286    	; 0x128e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x366>
    1170:	10 68       	ori	r17, 0x80	; 128
    1172:	10 93 f9 03 	sts	0x03F9, r17	; 0x8003f9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x41>
    1176:	1d 81       	ldd	r17, Y+5	; 0x05
    1178:	81 2f       	mov	r24, r17
    117a:	23 dd       	rcall	.-1466   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    117c:	88 23       	and	r24, r24
    117e:	09 f4       	brne	.+2      	; 0x1182 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x25a>
    1180:	88 c0       	rjmp	.+272    	; 0x1292 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x36a>
    1182:	10 64       	ori	r17, 0x40	; 64
    1184:	8b 81       	ldd	r24, Y+3	; 0x03
    1186:	80 ff       	sbrs	r24, 0
    1188:	86 c0       	rjmp	.+268    	; 0x1296 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x36e>
    118a:	10 68       	ori	r17, 0x80	; 128
    118c:	10 93 fa 03 	sts	0x03FA, r17	; 0x8003fa <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x42>
    1190:	bc 80       	ldd	r11, Y+4	; 0x04
    1192:	cb 80       	ldd	r12, Y+3	; 0x03
    1194:	8c 2d       	mov	r24, r12
    1196:	86 95       	lsr	r24
    1198:	b0 e2       	ldi	r27, 0x20	; 32
    119a:	bb 9e       	mul	r11, r27
    119c:	90 01       	movw	r18, r0
    119e:	11 24       	eor	r1, r1
    11a0:	82 2b       	or	r24, r18
    11a2:	80 93 fb 03 	sts	0x03FB, r24	; 0x8003fb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x43>
    11a6:	09 81       	ldd	r16, Y+1	; 0x01
    11a8:	e0 2e       	mov	r14, r16
    11aa:	f1 2c       	mov	r15, r1
    11ac:	c7 01       	movw	r24, r14
    11ae:	25 e0       	ldi	r18, 0x05	; 5
    11b0:	88 0f       	add	r24, r24
    11b2:	99 1f       	adc	r25, r25
    11b4:	2a 95       	dec	r18
    11b6:	e1 f7       	brne	.-8      	; 0x11b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x288>
    11b8:	da 80       	ldd	r13, Y+2	; 0x02
    11ba:	8d 29       	or	r24, r13
    11bc:	80 93 fc 03 	sts	0x03FC, r24	; 0x8003fc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x44>
    11c0:	8c 2d       	mov	r24, r12
    11c2:	8f 70       	andi	r24, 0x0F	; 15
    11c4:	fe dc       	rcall	.-1540   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11c6:	18 2f       	mov	r17, r24
    11c8:	8c 2d       	mov	r24, r12
    11ca:	82 95       	swap	r24
    11cc:	8f 70       	andi	r24, 0x0F	; 15
    11ce:	f9 dc       	rcall	.-1550   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11d0:	18 27       	eor	r17, r24
    11d2:	8d 2d       	mov	r24, r13
    11d4:	8f 70       	andi	r24, 0x0F	; 15
    11d6:	f5 dc       	rcall	.-1558   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11d8:	18 27       	eor	r17, r24
    11da:	8d 2d       	mov	r24, r13
    11dc:	82 95       	swap	r24
    11de:	8f 70       	andi	r24, 0x0F	; 15
    11e0:	f0 dc       	rcall	.-1568   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11e2:	18 27       	eor	r17, r24
    11e4:	8b 2d       	mov	r24, r11
    11e6:	ed dc       	rcall	.-1574   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11e8:	18 27       	eor	r17, r24
    11ea:	80 2f       	mov	r24, r16
    11ec:	8f 70       	andi	r24, 0x0F	; 15
    11ee:	e9 dc       	rcall	.-1582   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11f0:	18 27       	eor	r17, r24
    11f2:	80 2f       	mov	r24, r16
    11f4:	82 95       	swap	r24
    11f6:	8f 70       	andi	r24, 0x0F	; 15
    11f8:	e4 dc       	rcall	.-1592   	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    11fa:	33 e0       	ldi	r19, 0x03	; 3
    11fc:	f5 94       	asr	r15
    11fe:	e7 94       	ror	r14
    1200:	3a 95       	dec	r19
    1202:	e1 f7       	brne	.-8      	; 0x11fc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2d4>
    1204:	18 17       	cp	r17, r24
    1206:	11 f0       	breq	.+4      	; 0x120c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2e4>
    1208:	68 94       	set
    120a:	e5 f8       	bld	r14, 5
    120c:	e0 92 fd 03 	sts	0x03FD, r14	; 0x8003fd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x45>
    1210:	10 92 fe 03 	sts	0x03FE, r1	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    1214:	0f c0       	rjmp	.+30     	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1216:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    121a:	90 91 59 03 	lds	r25, 0x0359	; 0x800359 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    121e:	05 97       	sbiw	r24, 0x05	; 5
    1220:	0c f0       	brlt	.+2      	; 0x1224 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2fc>
    1222:	17 cf       	rjmp	.-466    	; 0x1052 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12a>
    1224:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1228:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    122c:	86 3d       	cpi	r24, 0xD6	; 214
    122e:	94 41       	sbci	r25, 0x14	; 20
    1230:	08 f0       	brcs	.+2      	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1232:	0f cf       	rjmp	.-482    	; 0x1052 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12a>
    1234:	28 96       	adiw	r28, 0x08	; 8
    1236:	0f b6       	in	r0, 0x3f	; 63
    1238:	f8 94       	cli
    123a:	de bf       	out	0x3e, r29	; 62
    123c:	0f be       	out	0x3f, r0	; 63
    123e:	cd bf       	out	0x3d, r28	; 61
    1240:	df 91       	pop	r29
    1242:	cf 91       	pop	r28
    1244:	1f 91       	pop	r17
    1246:	0f 91       	pop	r16
    1248:	ff 90       	pop	r15
    124a:	ef 90       	pop	r14
    124c:	df 90       	pop	r13
    124e:	cf 90       	pop	r12
    1250:	bf 90       	pop	r11
    1252:	af 90       	pop	r10
    1254:	9f 90       	pop	r9
    1256:	8f 90       	pop	r8
    1258:	08 95       	ret
    125a:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    125e:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1262:	86 3d       	cpi	r24, 0xD6	; 214
    1264:	94 41       	sbci	r25, 0x14	; 20
    1266:	30 f3       	brcs	.-52     	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1268:	4a cf       	rjmp	.-364    	; 0x10fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1d6>
    126a:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    126e:	80 ff       	sbrs	r24, 0
    1270:	e1 cf       	rjmp	.-62     	; 0x1234 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x30c>
    1272:	10 92 fb 05 	sts	0x05FB, r1	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    1276:	10 92 fa 05 	sts	0x05FA, r1	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    127a:	10 92 f9 05 	sts	0x05F9, r1	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    127e:	10 92 f8 05 	sts	0x05F8, r1	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1282:	b0 92 fc 05 	sts	0x05FC, r11	; 0x8005fc <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x4>
    1286:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    128a:	82 60       	ori	r24, 0x02	; 2
    128c:	3b cf       	rjmp	.-394    	; 0x1104 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1dc>
    128e:	1f 77       	andi	r17, 0x7F	; 127
    1290:	70 cf       	rjmp	.-288    	; 0x1172 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x24a>
    1292:	1f 7b       	andi	r17, 0xBF	; 191
    1294:	77 cf       	rjmp	.-274    	; 0x1184 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x25c>
    1296:	1f 77       	andi	r17, 0x7F	; 127
    1298:	79 cf       	rjmp	.-270    	; 0x118c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x264>
    129a:	80 62       	ori	r24, 0x20	; 32
    129c:	5e cf       	rjmp	.-324    	; 0x115a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x232>

0000129e <_ZN8Internal13DCF77_Encoder14advance_secondEv>:
    129e:	fc 01       	movw	r30, r24
    12a0:	86 81       	ldd	r24, Z+6	; 0x06
    12a2:	8b 33       	cpi	r24, 0x3B	; 59
    12a4:	30 f4       	brcc	.+12     	; 0x12b2 <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x14>
    12a6:	8f 5f       	subi	r24, 0xFF	; 255
    12a8:	86 83       	std	Z+6, r24	; 0x06
    12aa:	8f 30       	cpi	r24, 0x0F	; 15
    12ac:	b1 f4       	brne	.+44     	; 0x12da <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x3c>
    12ae:	cf 01       	movw	r24, r30
    12b0:	bc cb       	rjmp	.-2184   	; 0xa2a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    12b2:	97 81       	ldd	r25, Z+7	; 0x07
    12b4:	93 ff       	sbrs	r25, 3
    12b6:	0b c0       	rjmp	.+22     	; 0x12ce <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x30>
    12b8:	8b 33       	cpi	r24, 0x3B	; 59
    12ba:	49 f4       	brne	.+18     	; 0x12ce <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x30>
    12bc:	25 81       	ldd	r18, Z+5	; 0x05
    12be:	21 11       	cpse	r18, r1
    12c0:	06 c0       	rjmp	.+12     	; 0x12ce <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x30>
    12c2:	8c e3       	ldi	r24, 0x3C	; 60
    12c4:	86 83       	std	Z+6, r24	; 0x06
    12c6:	89 2f       	mov	r24, r25
    12c8:	87 7f       	andi	r24, 0xF7	; 247
    12ca:	87 83       	std	Z+7, r24	; 0x07
    12cc:	08 95       	ret
    12ce:	8b 53       	subi	r24, 0x3B	; 59
    12d0:	82 30       	cpi	r24, 0x02	; 2
    12d2:	18 f4       	brcc	.+6      	; 0x12da <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x3c>
    12d4:	16 82       	std	Z+6, r1	; 0x06
    12d6:	cf 01       	movw	r24, r30
    12d8:	c0 cd       	rjmp	.-1152   	; 0xe5a <_ZN8Internal13DCF77_Encoder14advance_minuteEv>
    12da:	08 95       	ret

000012dc <_ZN11SerialClass5flushEv.isra.4>:
    12dc:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    12e0:	86 ff       	sbrs	r24, 6
    12e2:	fc cf       	rjmp	.-8      	; 0x12dc <_ZN11SerialClass5flushEv.isra.4>
    12e4:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    12e8:	80 64       	ori	r24, 0x40	; 64
    12ea:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    12ee:	08 95       	ret

000012f0 <_ZN11SerialClass5writeEh.isra.0>:
    12f0:	90 91 c0 00 	lds	r25, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    12f4:	95 ff       	sbrs	r25, 5
    12f6:	fc cf       	rjmp	.-8      	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    12f8:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7e00c6>
    12fc:	81 e0       	ldi	r24, 0x01	; 1
    12fe:	90 e0       	ldi	r25, 0x00	; 0
    1300:	08 95       	ret

00001302 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8>:
    1302:	0f 93       	push	r16
    1304:	1f 93       	push	r17
    1306:	cf 93       	push	r28
    1308:	df 93       	push	r29
    130a:	8c 01       	movw	r16, r24
    130c:	d0 e0       	ldi	r29, 0x00	; 0
    130e:	c0 e0       	ldi	r28, 0x00	; 0
    1310:	f8 01       	movw	r30, r16
    1312:	ec 0f       	add	r30, r28
    1314:	fd 1f       	adc	r31, r29
    1316:	84 91       	lpm	r24, Z
    1318:	88 23       	and	r24, r24
    131a:	19 f0       	breq	.+6      	; 0x1322 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8+0x20>
    131c:	e9 df       	rcall	.-46     	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    131e:	21 96       	adiw	r28, 0x01	; 1
    1320:	f7 cf       	rjmp	.-18     	; 0x1310 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8+0xe>
    1322:	8d e0       	ldi	r24, 0x0D	; 13
    1324:	e5 df       	rcall	.-54     	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    1326:	8a e0       	ldi	r24, 0x0A	; 10
    1328:	e3 df       	rcall	.-58     	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    132a:	ce 01       	movw	r24, r28
    132c:	02 96       	adiw	r24, 0x02	; 2
    132e:	df 91       	pop	r29
    1330:	cf 91       	pop	r28
    1332:	1f 91       	pop	r17
    1334:	0f 91       	pop	r16
    1336:	08 95       	ret

00001338 <_ZN7Modules22updateConnectionStatusEv>:
    1338:	bf 92       	push	r11
    133a:	cf 92       	push	r12
    133c:	df 92       	push	r13
    133e:	ef 92       	push	r14
    1340:	ff 92       	push	r15
    1342:	0f 93       	push	r16
    1344:	1f 93       	push	r17
    1346:	cf 93       	push	r28
    1348:	df 93       	push	r29
    134a:	80 ef       	ldi	r24, 0xF0	; 240
    134c:	e8 2e       	mov	r14, r24
    134e:	82 e0       	ldi	r24, 0x02	; 2
    1350:	f8 2e       	mov	r15, r24
    1352:	10 e0       	ldi	r17, 0x00	; 0
    1354:	00 e0       	ldi	r16, 0x00	; 0
    1356:	cc 24       	eor	r12, r12
    1358:	c3 94       	inc	r12
    135a:	d1 2c       	mov	r13, r1
    135c:	80 91 53 03 	lds	r24, 0x0353	; 0x800353 <_ZN7ModulesL8_MODULESE>
    1360:	90 e0       	ldi	r25, 0x00	; 0
    1362:	00 2e       	mov	r0, r16
    1364:	02 c0       	rjmp	.+4      	; 0x136a <_ZN7Modules22updateConnectionStatusEv+0x32>
    1366:	95 95       	asr	r25
    1368:	87 95       	ror	r24
    136a:	0a 94       	dec	r0
    136c:	e2 f7       	brpl	.-8      	; 0x1366 <_ZN7Modules22updateConnectionStatusEv+0x2e>
    136e:	c8 2f       	mov	r28, r24
    1370:	c1 70       	andi	r28, 0x01	; 1
    1372:	d7 01       	movw	r26, r14
    1374:	ed 91       	ld	r30, X+
    1376:	fd 91       	ld	r31, X+
    1378:	7d 01       	movw	r14, r26
    137a:	09 95       	icall
    137c:	b8 2e       	mov	r11, r24
    137e:	c8 17       	cp	r28, r24
    1380:	09 f4       	brne	.+2      	; 0x1384 <_ZN7Modules22updateConnectionStatusEv+0x4c>
    1382:	37 c0       	rjmp	.+110    	; 0x13f2 <_ZN7Modules22updateConnectionStatusEv+0xba>
    1384:	c6 01       	movw	r24, r12
    1386:	00 2e       	mov	r0, r16
    1388:	01 c0       	rjmp	.+2      	; 0x138c <_ZN7Modules22updateConnectionStatusEv+0x54>
    138a:	88 0f       	add	r24, r24
    138c:	0a 94       	dec	r0
    138e:	ea f7       	brpl	.-6      	; 0x138a <_ZN7Modules22updateConnectionStatusEv+0x52>
    1390:	20 91 53 03 	lds	r18, 0x0353	; 0x800353 <_ZN7ModulesL8_MODULESE>
    1394:	bb 20       	and	r11, r11
    1396:	69 f0       	breq	.+26     	; 0x13b2 <_ZN7Modules22updateConnectionStatusEv+0x7a>
    1398:	82 2b       	or	r24, r18
    139a:	80 93 53 03 	sts	0x0353, r24	; 0x800353 <_ZN7ModulesL8_MODULESE>
    139e:	cf ef       	ldi	r28, 0xFF	; 255
    13a0:	d2 e0       	ldi	r29, 0x02	; 2
    13a2:	89 91       	ld	r24, Y+
    13a4:	88 23       	and	r24, r24
    13a6:	41 f0       	breq	.+16     	; 0x13b8 <_ZN7Modules22updateConnectionStatusEv+0x80>
    13a8:	a3 df       	rcall	.-186    	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    13aa:	fb cf       	rjmp	.-10     	; 0x13a2 <_ZN7Modules22updateConnectionStatusEv+0x6a>
    13ac:	01 e0       	ldi	r16, 0x01	; 1
    13ae:	10 e0       	ldi	r17, 0x00	; 0
    13b0:	d5 cf       	rjmp	.-86     	; 0x135c <_ZN7Modules22updateConnectionStatusEv+0x24>
    13b2:	80 95       	com	r24
    13b4:	82 23       	and	r24, r18
    13b6:	f1 cf       	rjmp	.-30     	; 0x139a <_ZN7Modules22updateConnectionStatusEv+0x62>
    13b8:	c4 ef       	ldi	r28, 0xF4	; 244
    13ba:	d2 e0       	ldi	r29, 0x02	; 2
    13bc:	01 15       	cp	r16, r1
    13be:	11 05       	cpc	r17, r1
    13c0:	11 f4       	brne	.+4      	; 0x13c6 <_ZN7Modules22updateConnectionStatusEv+0x8e>
    13c2:	cb ef       	ldi	r28, 0xFB	; 251
    13c4:	d2 e0       	ldi	r29, 0x02	; 2
    13c6:	89 91       	ld	r24, Y+
    13c8:	81 11       	cpse	r24, r1
    13ca:	09 c0       	rjmp	.+18     	; 0x13de <_ZN7Modules22updateConnectionStatusEv+0xa6>
    13cc:	c8 ef       	ldi	r28, 0xF8	; 248
    13ce:	d0 e0       	ldi	r29, 0x00	; 0
    13d0:	fe 01       	movw	r30, r28
    13d2:	84 91       	lpm	r24, Z
    13d4:	21 96       	adiw	r28, 0x01	; 1
    13d6:	88 23       	and	r24, r24
    13d8:	21 f0       	breq	.+8      	; 0x13e2 <_ZN7Modules22updateConnectionStatusEv+0xaa>
    13da:	8a df       	rcall	.-236    	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    13dc:	f9 cf       	rjmp	.-14     	; 0x13d0 <_ZN7Modules22updateConnectionStatusEv+0x98>
    13de:	88 df       	rcall	.-240    	; 0x12f0 <_ZN11SerialClass5writeEh.isra.0>
    13e0:	f2 cf       	rjmp	.-28     	; 0x13c6 <_ZN7Modules22updateConnectionStatusEv+0x8e>
    13e2:	8c ee       	ldi	r24, 0xEC	; 236
    13e4:	90 e0       	ldi	r25, 0x00	; 0
    13e6:	b1 10       	cpse	r11, r1
    13e8:	02 c0       	rjmp	.+4      	; 0x13ee <_ZN7Modules22updateConnectionStatusEv+0xb6>
    13ea:	81 ee       	ldi	r24, 0xE1	; 225
    13ec:	90 e0       	ldi	r25, 0x00	; 0
    13ee:	89 df       	rcall	.-238    	; 0x1302 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8>
    13f0:	75 df       	rcall	.-278    	; 0x12dc <_ZN11SerialClass5flushEv.isra.4>
    13f2:	01 30       	cpi	r16, 0x01	; 1
    13f4:	11 05       	cpc	r17, r1
    13f6:	d1 f6       	brne	.-76     	; 0x13ac <_ZN7Modules22updateConnectionStatusEv+0x74>
    13f8:	df 91       	pop	r29
    13fa:	cf 91       	pop	r28
    13fc:	1f 91       	pop	r17
    13fe:	0f 91       	pop	r16
    1400:	ff 90       	pop	r15
    1402:	ef 90       	pop	r14
    1404:	df 90       	pop	r13
    1406:	cf 90       	pop	r12
    1408:	bf 90       	pop	r11
    140a:	08 95       	ret

0000140c <_ZN7ModulesL15_INA219_PresentEv>:
    140c:	80 e0       	ldi	r24, 0x00	; 0
    140e:	08 95       	ret

00001410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>:
    1410:	20 91 51 03 	lds	r18, 0x0351	; 0x800351 <timer_counter>
    1414:	30 91 52 03 	lds	r19, 0x0352	; 0x800352 <timer_counter+0x1>
    1418:	dc 01       	movw	r26, r24
    141a:	ed 91       	ld	r30, X+
    141c:	fc 91       	ld	r31, X
    141e:	31 83       	std	Z+1, r19	; 0x01
    1420:	20 83       	st	Z, r18
    1422:	08 95       	ret

00001424 <_ZN3Led18setColorBrightnessEhh>:
    1424:	9f ef       	ldi	r25, 0xFF	; 255
    1426:	96 0f       	add	r25, r22
    1428:	61 11       	cpse	r22, r1
    142a:	15 c0       	rjmp	.+42     	; 0x1456 <_ZN3Led18setColorBrightnessEhh+0x32>
    142c:	45 b1       	in	r20, 0x05	; 5
    142e:	21 e0       	ldi	r18, 0x01	; 1
    1430:	30 e0       	ldi	r19, 0x00	; 0
    1432:	08 2e       	mov	r0, r24
    1434:	01 c0       	rjmp	.+2      	; 0x1438 <_ZN3Led18setColorBrightnessEhh+0x14>
    1436:	22 0f       	add	r18, r18
    1438:	0a 94       	dec	r0
    143a:	ea f7       	brpl	.-6      	; 0x1436 <_ZN3Led18setColorBrightnessEhh+0x12>
    143c:	20 95       	com	r18
    143e:	24 23       	and	r18, r20
    1440:	25 b9       	out	0x05, r18	; 5
    1442:	82 30       	cpi	r24, 0x02	; 2
    1444:	a1 f1       	breq	.+104    	; 0x14ae <_ZN3Led18setColorBrightnessEhh+0x8a>
    1446:	83 30       	cpi	r24, 0x03	; 3
    1448:	b1 f1       	breq	.+108    	; 0x14b6 <_ZN3Led18setColorBrightnessEhh+0x92>
    144a:	9e 3f       	cpi	r25, 0xFE	; 254
    144c:	28 f1       	brcs	.+74     	; 0x1498 <_ZN3Led18setColorBrightnessEhh+0x74>
    144e:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    1452:	8f 77       	andi	r24, 0x7F	; 127
    1454:	24 c0       	rjmp	.+72     	; 0x149e <_ZN3Led18setColorBrightnessEhh+0x7a>
    1456:	6f 3f       	cpi	r22, 0xFF	; 255
    1458:	81 f4       	brne	.+32     	; 0x147a <_ZN3Led18setColorBrightnessEhh+0x56>
    145a:	25 b1       	in	r18, 0x05	; 5
    145c:	41 e0       	ldi	r20, 0x01	; 1
    145e:	50 e0       	ldi	r21, 0x00	; 0
    1460:	08 2e       	mov	r0, r24
    1462:	01 c0       	rjmp	.+2      	; 0x1466 <_ZN3Led18setColorBrightnessEhh+0x42>
    1464:	44 0f       	add	r20, r20
    1466:	0a 94       	dec	r0
    1468:	ea f7       	brpl	.-6      	; 0x1464 <_ZN3Led18setColorBrightnessEhh+0x40>
    146a:	24 2b       	or	r18, r20
    146c:	25 b9       	out	0x05, r18	; 5
    146e:	82 30       	cpi	r24, 0x02	; 2
    1470:	31 f0       	breq	.+12     	; 0x147e <_ZN3Led18setColorBrightnessEhh+0x5a>
    1472:	83 30       	cpi	r24, 0x03	; 3
    1474:	51 f7       	brne	.-44     	; 0x144a <_ZN3Led18setColorBrightnessEhh+0x26>
    1476:	60 e0       	ldi	r22, 0x00	; 0
    1478:	20 c0       	rjmp	.+64     	; 0x14ba <_ZN3Led18setColorBrightnessEhh+0x96>
    147a:	82 30       	cpi	r24, 0x02	; 2
    147c:	21 f7       	brne	.-56     	; 0x1446 <_ZN3Led18setColorBrightnessEhh+0x22>
    147e:	9e 3f       	cpi	r25, 0xFE	; 254
    1480:	b1 f0       	breq	.+44     	; 0x14ae <_ZN3Led18setColorBrightnessEhh+0x8a>
    1482:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    1486:	80 62       	ori	r24, 0x20	; 32
    1488:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    148c:	70 e0       	ldi	r23, 0x00	; 0
    148e:	70 93 8b 00 	sts	0x008B, r23	; 0x80008b <__TEXT_REGION_LENGTH__+0x7e008b>
    1492:	60 93 8a 00 	sts	0x008A, r22	; 0x80008a <__TEXT_REGION_LENGTH__+0x7e008a>
    1496:	08 95       	ret
    1498:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    149c:	80 68       	ori	r24, 0x80	; 128
    149e:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    14a2:	70 e0       	ldi	r23, 0x00	; 0
    14a4:	70 93 89 00 	sts	0x0089, r23	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    14a8:	60 93 88 00 	sts	0x0088, r22	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    14ac:	08 95       	ret
    14ae:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    14b2:	8f 7d       	andi	r24, 0xDF	; 223
    14b4:	e9 cf       	rjmp	.-46     	; 0x1488 <_ZN3Led18setColorBrightnessEhh+0x64>
    14b6:	9e 3f       	cpi	r25, 0xFE	; 254
    14b8:	f0 f6       	brcc	.-68     	; 0x1476 <_ZN3Led18setColorBrightnessEhh+0x52>
    14ba:	60 93 40 03 	sts	0x0340, r22	; 0x800340 <_ZN3LedL10_LED_B_REGE>
    14be:	08 95       	ret

000014c0 <_ZN3Led13setBrightnessEh>:
    14c0:	cf 93       	push	r28
    14c2:	c8 2f       	mov	r28, r24
    14c4:	68 2f       	mov	r22, r24
    14c6:	81 e0       	ldi	r24, 0x01	; 1
    14c8:	ad df       	rcall	.-166    	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    14ca:	6c 2f       	mov	r22, r28
    14cc:	82 e0       	ldi	r24, 0x02	; 2
    14ce:	aa df       	rcall	.-172    	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    14d0:	6c 2f       	mov	r22, r28
    14d2:	83 e0       	ldi	r24, 0x03	; 3
    14d4:	cf 91       	pop	r28
    14d6:	a6 cf       	rjmp	.-180    	; 0x1424 <_ZN3Led18setColorBrightnessEhh>

000014d8 <_Z4waitj>:
    14d8:	90 93 3e 03 	sts	0x033E, r25	; 0x80033e <_ZL9_ms_ticks+0x1>
    14dc:	80 93 3d 03 	sts	0x033D, r24	; 0x80033d <_ZL9_ms_ticks>
    14e0:	83 b7       	in	r24, 0x33	; 51
    14e2:	81 7f       	andi	r24, 0xF1	; 241
    14e4:	83 bf       	out	0x33, r24	; 51
    14e6:	83 b7       	in	r24, 0x33	; 51
    14e8:	81 60       	ori	r24, 0x01	; 1
    14ea:	83 bf       	out	0x33, r24	; 51
    14ec:	80 91 3d 03 	lds	r24, 0x033D	; 0x80033d <_ZL9_ms_ticks>
    14f0:	90 91 3e 03 	lds	r25, 0x033E	; 0x80033e <_ZL9_ms_ticks+0x1>
    14f4:	89 2b       	or	r24, r25
    14f6:	11 f0       	breq	.+4      	; 0x14fc <_Z4waitj+0x24>
    14f8:	88 95       	sleep
    14fa:	f8 cf       	rjmp	.-16     	; 0x14ec <_Z4waitj+0x14>
    14fc:	83 b7       	in	r24, 0x33	; 51
    14fe:	8e 7f       	andi	r24, 0xFE	; 254
    1500:	83 bf       	out	0x33, r24	; 51
    1502:	08 95       	ret

00001504 <_ZN7Display11CrossfadingL11_stepPeriodEv>:
    1504:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    1508:	98 2f       	mov	r25, r24
    150a:	9a 70       	andi	r25, 0x0A	; 10
    150c:	21 f0       	breq	.+8      	; 0x1516 <_ZN7Display11CrossfadingL11_stepPeriodEv+0x12>
    150e:	84 fd       	sbrc	r24, 4
    1510:	02 c0       	rjmp	.+4      	; 0x1516 <_ZN7Display11CrossfadingL11_stepPeriodEv+0x12>
    1512:	84 e1       	ldi	r24, 0x14	; 20
    1514:	08 95       	ret
    1516:	80 ef       	ldi	r24, 0xF0	; 240
    1518:	08 95       	ret

0000151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>:
    151a:	cf 93       	push	r28
    151c:	df 93       	push	r29
    151e:	cf b7       	in	r28, 0x3f	; 63
    1520:	f8 94       	cli
    1522:	a1 ea       	ldi	r26, 0xA1	; 161
    1524:	b4 e0       	ldi	r27, 0x04	; 4
    1526:	30 e0       	ldi	r19, 0x00	; 0
    1528:	20 e0       	ldi	r18, 0x00	; 0
    152a:	61 e0       	ldi	r22, 0x01	; 1
    152c:	70 e0       	ldi	r23, 0x00	; 0
    152e:	dd 91       	ld	r29, X+
    1530:	90 e0       	ldi	r25, 0x00	; 0
    1532:	80 e0       	ldi	r24, 0x00	; 0
    1534:	ab 01       	movw	r20, r22
    1536:	08 2e       	mov	r0, r24
    1538:	01 c0       	rjmp	.+2      	; 0x153c <_ZN7Display11Crossfading12transitionToEPKh.constprop.93+0x22>
    153a:	44 0f       	add	r20, r20
    153c:	0a 94       	dec	r0
    153e:	ea f7       	brpl	.-6      	; 0x153a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93+0x20>
    1540:	4d 23       	and	r20, r29
    1542:	09 f0       	breq	.+2      	; 0x1546 <_ZN7Display11Crossfading12transitionToEPKh.constprop.93+0x2c>
    1544:	40 e1       	ldi	r20, 0x10	; 16
    1546:	fc 01       	movw	r30, r24
    1548:	e2 0f       	add	r30, r18
    154a:	f3 1f       	adc	r31, r19
    154c:	ea 55       	subi	r30, 0x5A	; 90
    154e:	fb 4f       	sbci	r31, 0xFB	; 251
    1550:	40 83       	st	Z, r20
    1552:	01 96       	adiw	r24, 0x01	; 1
    1554:	88 30       	cpi	r24, 0x08	; 8
    1556:	91 05       	cpc	r25, r1
    1558:	69 f7       	brne	.-38     	; 0x1534 <_ZN7Display11Crossfading12transitionToEPKh.constprop.93+0x1a>
    155a:	28 5f       	subi	r18, 0xF8	; 248
    155c:	3f 4f       	sbci	r19, 0xFF	; 255
    155e:	20 32       	cpi	r18, 0x20	; 32
    1560:	31 05       	cpc	r19, r1
    1562:	29 f7       	brne	.-54     	; 0x152e <_ZN7Display11Crossfading12transitionToEPKh.constprop.93+0x14>
    1564:	cf df       	rcall	.-98     	; 0x1504 <_ZN7Display11CrossfadingL11_stepPeriodEv>
    1566:	80 93 e4 02 	sts	0x02E4, r24	; 0x8002e4 <_ZN7Display11CrossfadingL17crsf_step_counterE>
    156a:	81 e0       	ldi	r24, 0x01	; 1
    156c:	80 93 a5 04 	sts	0x04A5, r24	; 0x8004a5 <_ZN7Display11CrossfadingL12_crsf_activeE>
    1570:	cf bf       	out	0x3f, r28	; 63
    1572:	df 91       	pop	r29
    1574:	cf 91       	pop	r28
    1576:	08 95       	ret

00001578 <_ZN5Views8showViewEa.part.4>:
    1578:	cf 93       	push	r28
    157a:	c8 2f       	mov	r28, r24
    157c:	e8 2f       	mov	r30, r24
    157e:	ee 0f       	add	r30, r30
    1580:	ff 0b       	sbc	r31, r31
    1582:	e2 59       	subi	r30, 0x92	; 146
    1584:	ff 4f       	sbci	r31, 0xFF	; 255
    1586:	85 91       	lpm	r24, Z+
    1588:	94 91       	lpm	r25, Z
    158a:	fc 01       	movw	r30, r24
    158c:	09 95       	icall
    158e:	c0 93 09 01 	sts	0x0109, r28	; 0x800109 <_ZN5ViewsL16_last_view_indexE>
    1592:	81 e0       	ldi	r24, 0x01	; 1
    1594:	80 93 47 03 	sts	0x0347, r24	; 0x800347 <_ZN5ViewsL18_is_any_view_shownE>
    1598:	10 92 41 03 	sts	0x0341, r1	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    159c:	cf 91       	pop	r28
    159e:	08 95       	ret

000015a0 <_ZN7Display23displayTimeFromCountersEhh>:
    15a0:	1f 93       	push	r17
    15a2:	cf 93       	push	r28
    15a4:	df 93       	push	r29
    15a6:	58 2f       	mov	r21, r24
    15a8:	36 2f       	mov	r19, r22
    15aa:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    15ae:	83 fd       	sbrc	r24, 3
    15b0:	44 c0       	rjmp	.+136    	; 0x163a <_ZN7Display23displayTimeFromCountersEhh+0x9a>
    15b2:	80 91 51 01 	lds	r24, 0x0151	; 0x800151 <_ZN6ConfigL7entriesE+0x41>
    15b6:	82 30       	cpi	r24, 0x02	; 2
    15b8:	41 f4       	brne	.+16     	; 0x15ca <_ZN7Display23displayTimeFromCountersEhh+0x2a>
    15ba:	86 2f       	mov	r24, r22
    15bc:	6c e0       	ldi	r22, 0x0C	; 12
    15be:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    15c2:	39 2f       	mov	r19, r25
    15c4:	91 11       	cpse	r25, r1
    15c6:	01 c0       	rjmp	.+2      	; 0x15ca <_ZN7Display23displayTimeFromCountersEhh+0x2a>
    15c8:	3c e0       	ldi	r19, 0x0C	; 12
    15ca:	d0 91 5e 01 	lds	r29, 0x015E	; 0x80015e <_ZN6ConfigL7entriesE+0x4e>
    15ce:	a1 ea       	ldi	r26, 0xA1	; 161
    15d0:	b4 e0       	ldi	r27, 0x04	; 4
    15d2:	40 e0       	ldi	r20, 0x00	; 0
    15d4:	20 e0       	ldi	r18, 0x00	; 0
    15d6:	ca e0       	ldi	r28, 0x0A	; 10
    15d8:	8e ef       	ldi	r24, 0xFE	; 254
    15da:	82 0f       	add	r24, r18
    15dc:	82 30       	cpi	r24, 0x02	; 2
    15de:	40 f0       	brcs	.+16     	; 0x15f0 <_ZN7Display23displayTimeFromCountersEhh+0x50>
    15e0:	83 2f       	mov	r24, r19
    15e2:	22 23       	and	r18, r18
    15e4:	41 f0       	breq	.+16     	; 0x15f6 <_ZN7Display23displayTimeFromCountersEhh+0x56>
    15e6:	6c 2f       	mov	r22, r28
    15e8:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    15ec:	89 2f       	mov	r24, r25
    15ee:	06 c0       	rjmp	.+12     	; 0x15fc <_ZN7Display23displayTimeFromCountersEhh+0x5c>
    15f0:	85 2f       	mov	r24, r21
    15f2:	22 30       	cpi	r18, 0x02	; 2
    15f4:	c1 f7       	brne	.-16     	; 0x15e6 <_ZN7Display23displayTimeFromCountersEhh+0x46>
    15f6:	6c 2f       	mov	r22, r28
    15f8:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    15fc:	e8 2f       	mov	r30, r24
    15fe:	f0 e0       	ldi	r31, 0x00	; 0
    1600:	ee 58       	subi	r30, 0x8E	; 142
    1602:	ff 4f       	sbci	r31, 0xFF	; 255
    1604:	14 91       	lpm	r17, Z
    1606:	9d 91       	ld	r25, X+
    1608:	19 17       	cp	r17, r25
    160a:	71 f0       	breq	.+28     	; 0x1628 <_ZN7Display23displayTimeFromCountersEhh+0x88>
    160c:	bd 01       	movw	r22, r26
    160e:	61 50       	subi	r22, 0x01	; 1
    1610:	71 09       	sbc	r23, r1
    1612:	fb 01       	movw	r30, r22
    1614:	10 83       	st	Z, r17
    1616:	21 11       	cpse	r18, r1
    1618:	06 c0       	rjmp	.+12     	; 0x1626 <_ZN7Display23displayTimeFromCountersEhh+0x86>
    161a:	81 11       	cpse	r24, r1
    161c:	04 c0       	rjmp	.+8      	; 0x1626 <_ZN7Display23displayTimeFromCountersEhh+0x86>
    161e:	d1 11       	cpse	r29, r1
    1620:	02 c0       	rjmp	.+4      	; 0x1626 <_ZN7Display23displayTimeFromCountersEhh+0x86>
    1622:	10 92 a1 04 	sts	0x04A1, r1	; 0x8004a1 <_ZN7Display6DIGITSE>
    1626:	41 e0       	ldi	r20, 0x01	; 1
    1628:	2f 5f       	subi	r18, 0xFF	; 255
    162a:	24 30       	cpi	r18, 0x04	; 4
    162c:	a9 f6       	brne	.-86     	; 0x15d8 <_ZN7Display23displayTimeFromCountersEhh+0x38>
    162e:	44 23       	and	r20, r20
    1630:	21 f0       	breq	.+8      	; 0x163a <_ZN7Display23displayTimeFromCountersEhh+0x9a>
    1632:	df 91       	pop	r29
    1634:	cf 91       	pop	r28
    1636:	1f 91       	pop	r17
    1638:	70 cf       	rjmp	.-288    	; 0x151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>
    163a:	df 91       	pop	r29
    163c:	cf 91       	pop	r28
    163e:	1f 91       	pop	r17
    1640:	08 95       	ret

00001642 <_ZN5Views9hideViewsEv>:
    1642:	10 92 47 03 	sts	0x0347, r1	; 0x800347 <_ZN5ViewsL18_is_any_view_shownE>
    1646:	10 92 41 03 	sts	0x0341, r1	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    164a:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    164e:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    1652:	a6 cf       	rjmp	.-180    	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>

00001654 <_ZN7Display19setSymbolOnNumitronEhh>:
    1654:	6e 30       	cpi	r22, 0x0E	; 14
    1656:	60 f4       	brcc	.+24     	; 0x1670 <_ZN7Display19setSymbolOnNumitronEhh+0x1c>
    1658:	e6 2f       	mov	r30, r22
    165a:	f0 e0       	ldi	r31, 0x00	; 0
    165c:	ee 58       	subi	r30, 0x8E	; 142
    165e:	ff 4f       	sbci	r31, 0xFF	; 255
    1660:	e4 91       	lpm	r30, Z
    1662:	84 30       	cpi	r24, 0x04	; 4
    1664:	29 f0       	breq	.+10     	; 0x1670 <_ZN7Display19setSymbolOnNumitronEhh+0x1c>
    1666:	a8 2f       	mov	r26, r24
    1668:	b0 e0       	ldi	r27, 0x00	; 0
    166a:	af 55       	subi	r26, 0x5F	; 95
    166c:	bb 4f       	sbci	r27, 0xFB	; 251
    166e:	ec 93       	st	X, r30
    1670:	08 95       	ret

00001672 <_ZL11displayPageh>:
    1672:	ff 92       	push	r15
    1674:	0f 93       	push	r16
    1676:	1f 93       	push	r17
    1678:	cf 93       	push	r28
    167a:	df 93       	push	r29
    167c:	d8 2f       	mov	r29, r24
    167e:	dd 0f       	add	r29, r29
    1680:	dd 0f       	add	r29, r29
    1682:	01 ea       	ldi	r16, 0xA1	; 161
    1684:	14 e0       	ldi	r17, 0x04	; 4
    1686:	c0 e0       	ldi	r28, 0x00	; 0
    1688:	8d e0       	ldi	r24, 0x0D	; 13
    168a:	f8 2e       	mov	r15, r24
    168c:	ad 2f       	mov	r26, r29
    168e:	ac 0f       	add	r26, r28
    1690:	fa 9e       	mul	r15, r26
    1692:	d0 01       	movw	r26, r0
    1694:	11 24       	eor	r1, r1
    1696:	a0 5f       	subi	r26, 0xF0	; 240
    1698:	be 4f       	sbci	r27, 0xFE	; 254
    169a:	13 96       	adiw	r26, 0x03	; 3
    169c:	ed 91       	ld	r30, X+
    169e:	fc 91       	ld	r31, X
    16a0:	14 97       	sbiw	r26, 0x04	; 4
    16a2:	6c 91       	ld	r22, X
    16a4:	30 97       	sbiw	r30, 0x00	; 0
    16a6:	19 f0       	breq	.+6      	; 0x16ae <_ZL11displayPageh+0x3c>
    16a8:	e6 0f       	add	r30, r22
    16aa:	f1 1d       	adc	r31, r1
    16ac:	64 91       	lpm	r22, Z
    16ae:	8c 2f       	mov	r24, r28
    16b0:	d1 df       	rcall	.-94     	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    16b2:	80 91 48 03 	lds	r24, 0x0348	; 0x800348 <_ZL14selected_digit>
    16b6:	8c 13       	cpse	r24, r28
    16b8:	08 c0       	rjmp	.+16     	; 0x16ca <_ZL11displayPageh+0x58>
    16ba:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    16be:	81 ff       	sbrs	r24, 1
    16c0:	04 c0       	rjmp	.+8      	; 0x16ca <_ZL11displayPageh+0x58>
    16c2:	f8 01       	movw	r30, r16
    16c4:	80 81       	ld	r24, Z
    16c6:	80 68       	ori	r24, 0x80	; 128
    16c8:	80 83       	st	Z, r24
    16ca:	cf 5f       	subi	r28, 0xFF	; 255
    16cc:	0f 5f       	subi	r16, 0xFF	; 255
    16ce:	1f 4f       	sbci	r17, 0xFF	; 255
    16d0:	c4 30       	cpi	r28, 0x04	; 4
    16d2:	e1 f6       	brne	.-72     	; 0x168c <_ZL11displayPageh+0x1a>
    16d4:	df 91       	pop	r29
    16d6:	cf 91       	pop	r28
    16d8:	1f 91       	pop	r17
    16da:	0f 91       	pop	r16
    16dc:	ff 90       	pop	r15
    16de:	1d cf       	rjmp	.-454    	; 0x151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>

000016e0 <_ZN7Display13setBrightnessEhh>:
    16e0:	81 3b       	cpi	r24, 0xB1	; 177
    16e2:	08 f0       	brcs	.+2      	; 0x16e6 <_ZN7Display13setBrightnessEhh+0x6>
    16e4:	80 eb       	ldi	r24, 0xB0	; 176
    16e6:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    16ea:	98 17       	cp	r25, r24
    16ec:	91 f0       	breq	.+36     	; 0x1712 <_ZN7Display13setBrightnessEhh+0x32>
    16ee:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    16f2:	89 17       	cp	r24, r25
    16f4:	60 f0       	brcs	.+24     	; 0x170e <_ZN7Display13setBrightnessEhh+0x2e>
    16f6:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    16fa:	98 17       	cp	r25, r24
    16fc:	50 f4       	brcc	.+20     	; 0x1712 <_ZN7Display13setBrightnessEhh+0x32>
    16fe:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    1702:	48 2f       	mov	r20, r24
    1704:	49 1b       	sub	r20, r25
    1706:	55 0b       	sbc	r21, r21
    1708:	64 17       	cp	r22, r20
    170a:	15 06       	cpc	r1, r21
    170c:	14 f4       	brge	.+4      	; 0x1712 <_ZN7Display13setBrightnessEhh+0x32>
    170e:	80 93 07 01 	sts	0x0107, r24	; 0x800107 <_ZN7Display18_target_brightnessE>
    1712:	08 95       	ret

00001714 <_ZN7Display19incrementBrightnessEa>:
    1714:	20 91 07 01 	lds	r18, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    1718:	48 2f       	mov	r20, r24
    171a:	08 2e       	mov	r0, r24
    171c:	00 0c       	add	r0, r0
    171e:	55 0b       	sbc	r21, r21
    1720:	24 0f       	add	r18, r20
    1722:	35 2f       	mov	r19, r21
    1724:	31 1d       	adc	r19, r1
    1726:	22 31       	cpi	r18, 0x12	; 18
    1728:	31 05       	cpc	r19, r1
    172a:	44 f0       	brlt	.+16     	; 0x173c <_ZN7Display19incrementBrightnessEa+0x28>
    172c:	20 91 07 01 	lds	r18, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    1730:	24 0f       	add	r18, r20
    1732:	35 2f       	mov	r19, r21
    1734:	31 1d       	adc	r19, r1
    1736:	20 3b       	cpi	r18, 0xB0	; 176
    1738:	31 05       	cpc	r19, r1
    173a:	94 f4       	brge	.+36     	; 0x1760 <_ZN7Display19incrementBrightnessEa+0x4c>
    173c:	20 91 07 01 	lds	r18, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    1740:	24 0f       	add	r18, r20
    1742:	35 2f       	mov	r19, r21
    1744:	31 1d       	adc	r19, r1
    1746:	22 31       	cpi	r18, 0x12	; 18
    1748:	31 05       	cpc	r19, r1
    174a:	64 f0       	brlt	.+24     	; 0x1764 <_ZN7Display19incrementBrightnessEa+0x50>
    174c:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    1750:	89 0f       	add	r24, r25
    1752:	60 e0       	ldi	r22, 0x00	; 0
    1754:	c5 df       	rcall	.-118    	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    1756:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    175a:	80 93 08 01 	sts	0x0108, r24	; 0x800108 <_ZN7Display21configured_brightnessE>
    175e:	08 95       	ret
    1760:	80 eb       	ldi	r24, 0xB0	; 176
    1762:	f7 cf       	rjmp	.-18     	; 0x1752 <_ZN7Display19incrementBrightnessEa+0x3e>
    1764:	81 e1       	ldi	r24, 0x11	; 17
    1766:	f5 cf       	rjmp	.-22     	; 0x1752 <_ZN7Display19incrementBrightnessEa+0x3e>

00001768 <_Z16pushToOutputRegsv>:
    1768:	5f 98       	cbi	0x0b, 7	; 11
    176a:	00 00       	nop
    176c:	00 00       	nop
    176e:	5f 9a       	sbi	0x0b, 7	; 11
    1770:	08 95       	ret

00001772 <_ZN6Config22setLoadCallbackForPageEhPFvhhE>:
    1772:	88 0f       	add	r24, r24
    1774:	88 0f       	add	r24, r24
    1776:	9d e0       	ldi	r25, 0x0D	; 13
    1778:	98 9f       	mul	r25, r24
    177a:	f0 01       	movw	r30, r0
    177c:	11 24       	eor	r1, r1
    177e:	e0 5f       	subi	r30, 0xF0	; 240
    1780:	fe 4f       	sbci	r31, 0xFE	; 254
    1782:	74 87       	std	Z+12, r23	; 0x0c
    1784:	63 87       	std	Z+11, r22	; 0x0b
    1786:	e1 e0       	ldi	r30, 0x01	; 1
    1788:	e8 0f       	add	r30, r24
    178a:	9e 9f       	mul	r25, r30
    178c:	f0 01       	movw	r30, r0
    178e:	11 24       	eor	r1, r1
    1790:	e0 5f       	subi	r30, 0xF0	; 240
    1792:	fe 4f       	sbci	r31, 0xFE	; 254
    1794:	74 87       	std	Z+12, r23	; 0x0c
    1796:	63 87       	std	Z+11, r22	; 0x0b
    1798:	e2 e0       	ldi	r30, 0x02	; 2
    179a:	e8 0f       	add	r30, r24
    179c:	9e 9f       	mul	r25, r30
    179e:	f0 01       	movw	r30, r0
    17a0:	11 24       	eor	r1, r1
    17a2:	e0 5f       	subi	r30, 0xF0	; 240
    17a4:	fe 4f       	sbci	r31, 0xFE	; 254
    17a6:	74 87       	std	Z+12, r23	; 0x0c
    17a8:	63 87       	std	Z+11, r22	; 0x0b
    17aa:	8d 5f       	subi	r24, 0xFD	; 253
    17ac:	98 9f       	mul	r25, r24
    17ae:	f0 01       	movw	r30, r0
    17b0:	11 24       	eor	r1, r1
    17b2:	e0 5f       	subi	r30, 0xF0	; 240
    17b4:	fe 4f       	sbci	r31, 0xFE	; 254
    17b6:	74 87       	std	Z+12, r23	; 0x0c
    17b8:	63 87       	std	Z+11, r22	; 0x0b
    17ba:	08 95       	ret

000017bc <_ZN6Config22setSaveCallbackForPageEhPFvhhE>:
    17bc:	88 0f       	add	r24, r24
    17be:	88 0f       	add	r24, r24
    17c0:	9d e0       	ldi	r25, 0x0D	; 13
    17c2:	98 9f       	mul	r25, r24
    17c4:	f0 01       	movw	r30, r0
    17c6:	11 24       	eor	r1, r1
    17c8:	e0 5f       	subi	r30, 0xF0	; 240
    17ca:	fe 4f       	sbci	r31, 0xFE	; 254
    17cc:	72 87       	std	Z+10, r23	; 0x0a
    17ce:	61 87       	std	Z+9, r22	; 0x09
    17d0:	e1 e0       	ldi	r30, 0x01	; 1
    17d2:	e8 0f       	add	r30, r24
    17d4:	9e 9f       	mul	r25, r30
    17d6:	f0 01       	movw	r30, r0
    17d8:	11 24       	eor	r1, r1
    17da:	e0 5f       	subi	r30, 0xF0	; 240
    17dc:	fe 4f       	sbci	r31, 0xFE	; 254
    17de:	72 87       	std	Z+10, r23	; 0x0a
    17e0:	61 87       	std	Z+9, r22	; 0x09
    17e2:	e2 e0       	ldi	r30, 0x02	; 2
    17e4:	e8 0f       	add	r30, r24
    17e6:	9e 9f       	mul	r25, r30
    17e8:	f0 01       	movw	r30, r0
    17ea:	11 24       	eor	r1, r1
    17ec:	e0 5f       	subi	r30, 0xF0	; 240
    17ee:	fe 4f       	sbci	r31, 0xFE	; 254
    17f0:	72 87       	std	Z+10, r23	; 0x0a
    17f2:	61 87       	std	Z+9, r22	; 0x09
    17f4:	8d 5f       	subi	r24, 0xFD	; 253
    17f6:	98 9f       	mul	r25, r24
    17f8:	f0 01       	movw	r30, r0
    17fa:	11 24       	eor	r1, r1
    17fc:	e0 5f       	subi	r30, 0xF0	; 240
    17fe:	fe 4f       	sbci	r31, 0xFE	; 254
    1800:	72 87       	std	Z+10, r23	; 0x0a
    1802:	61 87       	std	Z+9, r22	; 0x09
    1804:	08 95       	ret

00001806 <_ZN6Config3setENS_2IDEh>:
    1806:	9d e0       	ldi	r25, 0x0D	; 13
    1808:	89 9f       	mul	r24, r25
    180a:	f0 01       	movw	r30, r0
    180c:	11 24       	eor	r1, r1
    180e:	e0 5f       	subi	r30, 0xF0	; 240
    1810:	fe 4f       	sbci	r31, 0xFE	; 254
    1812:	91 81       	ldd	r25, Z+1	; 0x01
    1814:	69 17       	cp	r22, r25
    1816:	98 f0       	brcs	.+38     	; 0x183e <_ZN6Config3setENS_2IDEh+0x38>
    1818:	92 81       	ldd	r25, Z+2	; 0x02
    181a:	96 17       	cp	r25, r22
    181c:	80 f0       	brcs	.+32     	; 0x183e <_ZN6Config3setENS_2IDEh+0x38>
    181e:	90 81       	ld	r25, Z
    1820:	69 17       	cp	r22, r25
    1822:	69 f0       	breq	.+26     	; 0x183e <_ZN6Config3setENS_2IDEh+0x38>
    1824:	60 83       	st	Z, r22
    1826:	07 80       	ldd	r0, Z+7	; 0x07
    1828:	f0 85       	ldd	r31, Z+8	; 0x08
    182a:	e0 2d       	mov	r30, r0
    182c:	30 97       	sbiw	r30, 0x00	; 0
    182e:	29 f0       	breq	.+10     	; 0x183a <_ZN6Config3setENS_2IDEh+0x34>
    1830:	68 2f       	mov	r22, r24
    1832:	63 70       	andi	r22, 0x03	; 3
    1834:	86 95       	lsr	r24
    1836:	86 95       	lsr	r24
    1838:	09 95       	icall
    183a:	81 e0       	ldi	r24, 0x01	; 1
    183c:	08 95       	ret
    183e:	80 e0       	ldi	r24, 0x00	; 0
    1840:	08 95       	ret

00001842 <_ZN6TimersL15_onTimerHourSetEhh>:
    1842:	90 91 48 02 	lds	r25, 0x0248	; 0x800248 <_ZN6ConfigL7entriesE+0x138>
    1846:	80 91 55 02 	lds	r24, 0x0255	; 0x800255 <_ZN6ConfigL7entriesE+0x145>
    184a:	2a e0       	ldi	r18, 0x0A	; 10
    184c:	92 9f       	mul	r25, r18
    184e:	80 0d       	add	r24, r0
    1850:	11 24       	eor	r1, r1
    1852:	88 31       	cpi	r24, 0x18	; 24
    1854:	40 f0       	brcs	.+16     	; 0x1866 <_ZN6TimersL15_onTimerHourSetEhh+0x24>
    1856:	61 11       	cpse	r22, r1
    1858:	03 c0       	rjmp	.+6      	; 0x1860 <_ZN6TimersL15_onTimerHourSetEhh+0x1e>
    185a:	63 e0       	ldi	r22, 0x03	; 3
    185c:	89 e1       	ldi	r24, 0x19	; 25
    185e:	d3 cf       	rjmp	.-90     	; 0x1806 <_ZN6Config3setENS_2IDEh>
    1860:	61 e0       	ldi	r22, 0x01	; 1
    1862:	88 e1       	ldi	r24, 0x18	; 24
    1864:	fc cf       	rjmp	.-8      	; 0x185e <_ZN6TimersL15_onTimerHourSetEhh+0x1c>
    1866:	08 95       	ret

00001868 <_ZN6TimersL14_loadTimerToUIEh>:
    1868:	1f 93       	push	r17
    186a:	cf 93       	push	r28
    186c:	df 93       	push	r29
    186e:	c8 2f       	mov	r28, r24
    1870:	ee e0       	ldi	r30, 0x0E	; 14
    1872:	e8 0f       	add	r30, r24
    1874:	ee 0f       	add	r30, r30
    1876:	9d e0       	ldi	r25, 0x0D	; 13
    1878:	9e 9f       	mul	r25, r30
    187a:	d0 01       	movw	r26, r0
    187c:	11 24       	eor	r1, r1
    187e:	a0 5f       	subi	r26, 0xF0	; 240
    1880:	be 4f       	sbci	r27, 0xFE	; 254
    1882:	8c 91       	ld	r24, X
    1884:	ef 5f       	subi	r30, 0xFF	; 255
    1886:	9e 9f       	mul	r25, r30
    1888:	f0 01       	movw	r30, r0
    188a:	11 24       	eor	r1, r1
    188c:	e0 5f       	subi	r30, 0xF0	; 240
    188e:	fe 4f       	sbci	r31, 0xFE	; 254
    1890:	d0 81       	ld	r29, Z
    1892:	6a e0       	ldi	r22, 0x0A	; 10
    1894:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    1898:	19 2f       	mov	r17, r25
    189a:	68 2f       	mov	r22, r24
    189c:	88 e1       	ldi	r24, 0x18	; 24
    189e:	b3 df       	rcall	.-154    	; 0x1806 <_ZN6Config3setENS_2IDEh>
    18a0:	61 2f       	mov	r22, r17
    18a2:	89 e1       	ldi	r24, 0x19	; 25
    18a4:	b0 df       	rcall	.-160    	; 0x1806 <_ZN6Config3setENS_2IDEh>
    18a6:	6d 2f       	mov	r22, r29
    18a8:	8a e1       	ldi	r24, 0x1A	; 26
    18aa:	ad df       	rcall	.-166    	; 0x1806 <_ZN6Config3setENS_2IDEh>
    18ac:	6c 2f       	mov	r22, r28
    18ae:	8b e1       	ldi	r24, 0x1B	; 27
    18b0:	df 91       	pop	r29
    18b2:	cf 91       	pop	r28
    18b4:	1f 91       	pop	r17
    18b6:	a7 cf       	rjmp	.-178    	; 0x1806 <_ZN6Config3setENS_2IDEh>

000018b8 <_ZN6TimersL16_timerPageLoadFnEhh>:
    18b8:	61 11       	cpse	r22, r1
    18ba:	03 c0       	rjmp	.+6      	; 0x18c2 <_ZN6TimersL16_timerPageLoadFnEhh+0xa>
    18bc:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    18c0:	d3 cf       	rjmp	.-90     	; 0x1868 <_ZN6TimersL14_loadTimerToUIEh>
    18c2:	08 95       	ret

000018c4 <_Z21onRightButtonReleasedv>:
    18c4:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    18c8:	81 ff       	sbrs	r24, 1
    18ca:	18 c0       	rjmp	.+48     	; 0x18fc <_Z21onRightButtonReleasedv+0x38>
    18cc:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    18d0:	88 0f       	add	r24, r24
    18d2:	88 0f       	add	r24, r24
    18d4:	90 91 48 03 	lds	r25, 0x0348	; 0x800348 <_ZL14selected_digit>
    18d8:	89 0f       	add	r24, r25
    18da:	9d e0       	ldi	r25, 0x0D	; 13
    18dc:	89 9f       	mul	r24, r25
    18de:	f0 01       	movw	r30, r0
    18e0:	11 24       	eor	r1, r1
    18e2:	e0 5f       	subi	r30, 0xF0	; 240
    18e4:	fe 4f       	sbci	r31, 0xFE	; 254
    18e6:	60 81       	ld	r22, Z
    18e8:	92 81       	ldd	r25, Z+2	; 0x02
    18ea:	69 17       	cp	r22, r25
    18ec:	28 f0       	brcs	.+10     	; 0x18f8 <_Z21onRightButtonReleasedv+0x34>
    18ee:	61 81       	ldd	r22, Z+1	; 0x01
    18f0:	8a df       	rcall	.-236    	; 0x1806 <_ZN6Config3setENS_2IDEh>
    18f2:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    18f6:	bd ce       	rjmp	.-646    	; 0x1672 <_ZL11displayPageh>
    18f8:	6f 5f       	subi	r22, 0xFF	; 255
    18fa:	fa cf       	rjmp	.-12     	; 0x18f0 <_Z21onRightButtonReleasedv+0x2c>
    18fc:	80 91 44 01 	lds	r24, 0x0144	; 0x800144 <_ZN6ConfigL7entriesE+0x34>
    1900:	81 11       	cpse	r24, r1
    1902:	02 c0       	rjmp	.+4      	; 0x1908 <_Z21onRightButtonReleasedv+0x44>
    1904:	8e ef       	ldi	r24, 0xFE	; 254
    1906:	06 cf       	rjmp	.-500    	; 0x1714 <_ZN7Display19incrementBrightnessEa>
    1908:	08 95       	ret

0000190a <twi_readFrom.constprop.89>:
    190a:	cf 92       	push	r12
    190c:	df 92       	push	r13
    190e:	ef 92       	push	r14
    1910:	ff 92       	push	r15
    1912:	0f 93       	push	r16
    1914:	1f 93       	push	r17
    1916:	00 e0       	ldi	r16, 0x00	; 0
    1918:	10 e0       	ldi	r17, 0x00	; 0
    191a:	98 01       	movw	r18, r16
    191c:	40 91 9c 04 	lds	r20, 0x049C	; 0x80049c <_state>
    1920:	41 11       	cpse	r20, r1
    1922:	61 c0       	rjmp	.+194    	; 0x19e6 <twi_readFrom.constprop.89+0xdc>
    1924:	22 e0       	ldi	r18, 0x02	; 2
    1926:	20 93 9c 04 	sts	0x049C, r18	; 0x80049c <_state>
    192a:	21 e0       	ldi	r18, 0x01	; 1
    192c:	20 93 9b 04 	sts	0x049B, r18	; 0x80049b <_send_stop>
    1930:	2f ef       	ldi	r18, 0xFF	; 255
    1932:	20 93 9a 04 	sts	0x049A, r18	; 0x80049a <_error>
    1936:	10 92 99 04 	sts	0x0499, r1	; 0x800499 <_buf_idx>
    193a:	26 0f       	add	r18, r22
    193c:	20 93 98 04 	sts	0x0498, r18	; 0x800498 <_buf_len>
    1940:	21 ed       	ldi	r18, 0xD1	; 209
    1942:	20 93 97 04 	sts	0x0497, r18	; 0x800497 <_slarw>
    1946:	20 91 96 04 	lds	r18, 0x0496	; 0x800496 <_rep_start>
    194a:	22 23       	and	r18, r18
    194c:	09 f4       	brne	.+2      	; 0x1950 <twi_readFrom.constprop.89+0x46>
    194e:	78 c0       	rjmp	.+240    	; 0x1a40 <twi_readFrom.constprop.89+0x136>
    1950:	10 92 96 04 	sts	0x0496, r1	; 0x800496 <_rep_start>
    1954:	00 e0       	ldi	r16, 0x00	; 0
    1956:	10 e0       	ldi	r17, 0x00	; 0
    1958:	98 01       	movw	r18, r16
    195a:	40 91 97 04 	lds	r20, 0x0497	; 0x800497 <_slarw>
    195e:	40 93 bb 00 	sts	0x00BB, r20	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    1962:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1966:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    196a:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    196e:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1972:	cd 28       	or	r12, r13
    1974:	ce 28       	or	r12, r14
    1976:	cf 28       	or	r12, r15
    1978:	71 f0       	breq	.+28     	; 0x1996 <twi_readFrom.constprop.89+0x8c>
    197a:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    197e:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1982:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1986:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    198a:	0c 15       	cp	r16, r12
    198c:	1d 05       	cpc	r17, r13
    198e:	2e 05       	cpc	r18, r14
    1990:	3f 05       	cpc	r19, r15
    1992:	08 f0       	brcs	.+2      	; 0x1996 <twi_readFrom.constprop.89+0x8c>
    1994:	41 c0       	rjmp	.+130    	; 0x1a18 <twi_readFrom.constprop.89+0x10e>
    1996:	45 e1       	ldi	r20, 0x15	; 21
    1998:	4a 95       	dec	r20
    199a:	f1 f7       	brne	.-4      	; 0x1998 <twi_readFrom.constprop.89+0x8e>
    199c:	00 00       	nop
    199e:	0c 5f       	subi	r16, 0xFC	; 252
    19a0:	1f 4f       	sbci	r17, 0xFF	; 255
    19a2:	2f 4f       	sbci	r18, 0xFF	; 255
    19a4:	3f 4f       	sbci	r19, 0xFF	; 255
    19a6:	40 91 bc 00 	lds	r20, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    19aa:	43 fd       	sbrc	r20, 3
    19ac:	d6 cf       	rjmp	.-84     	; 0x195a <twi_readFrom.constprop.89+0x50>
    19ae:	25 ec       	ldi	r18, 0xC5	; 197
    19b0:	20 93 bc 00 	sts	0x00BC, r18	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    19b4:	00 e0       	ldi	r16, 0x00	; 0
    19b6:	10 e0       	ldi	r17, 0x00	; 0
    19b8:	98 01       	movw	r18, r16
    19ba:	40 91 9c 04 	lds	r20, 0x049C	; 0x80049c <_state>
    19be:	42 30       	cpi	r20, 0x02	; 2
    19c0:	09 f4       	brne	.+2      	; 0x19c4 <twi_readFrom.constprop.89+0xba>
    19c2:	40 c0       	rjmp	.+128    	; 0x1a44 <twi_readFrom.constprop.89+0x13a>
    19c4:	20 91 99 04 	lds	r18, 0x0499	; 0x800499 <_buf_idx>
    19c8:	26 17       	cp	r18, r22
    19ca:	10 f4       	brcc	.+4      	; 0x19d0 <twi_readFrom.constprop.89+0xc6>
    19cc:	60 91 99 04 	lds	r22, 0x0499	; 0x800499 <_buf_idx>
    19d0:	a6 e7       	ldi	r26, 0x76	; 118
    19d2:	b4 e0       	ldi	r27, 0x04	; 4
    19d4:	28 2f       	mov	r18, r24
    19d6:	fc 01       	movw	r30, r24
    19d8:	8e 2f       	mov	r24, r30
    19da:	82 1b       	sub	r24, r18
    19dc:	86 17       	cp	r24, r22
    19de:	f8 f4       	brcc	.+62     	; 0x1a1e <twi_readFrom.constprop.89+0x114>
    19e0:	8d 91       	ld	r24, X+
    19e2:	81 93       	st	Z+, r24
    19e4:	f9 cf       	rjmp	.-14     	; 0x19d8 <twi_readFrom.constprop.89+0xce>
    19e6:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    19ea:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    19ee:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    19f2:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    19f6:	cd 28       	or	r12, r13
    19f8:	ce 28       	or	r12, r14
    19fa:	cf 28       	or	r12, r15
    19fc:	c1 f0       	breq	.+48     	; 0x1a2e <twi_readFrom.constprop.89+0x124>
    19fe:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1a02:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1a06:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1a0a:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1a0e:	0c 15       	cp	r16, r12
    1a10:	1d 05       	cpc	r17, r13
    1a12:	2e 05       	cpc	r18, r14
    1a14:	3f 05       	cpc	r19, r15
    1a16:	58 f0       	brcs	.+22     	; 0x1a2e <twi_readFrom.constprop.89+0x124>
    1a18:	0e 94 be 02 	call	0x57c	; 0x57c <_twi_handle_timeout>
    1a1c:	60 e0       	ldi	r22, 0x00	; 0
    1a1e:	86 2f       	mov	r24, r22
    1a20:	1f 91       	pop	r17
    1a22:	0f 91       	pop	r16
    1a24:	ff 90       	pop	r15
    1a26:	ef 90       	pop	r14
    1a28:	df 90       	pop	r13
    1a2a:	cf 90       	pop	r12
    1a2c:	08 95       	ret
    1a2e:	45 e1       	ldi	r20, 0x15	; 21
    1a30:	4a 95       	dec	r20
    1a32:	f1 f7       	brne	.-4      	; 0x1a30 <twi_readFrom.constprop.89+0x126>
    1a34:	00 00       	nop
    1a36:	0c 5f       	subi	r16, 0xFC	; 252
    1a38:	1f 4f       	sbci	r17, 0xFF	; 255
    1a3a:	2f 4f       	sbci	r18, 0xFF	; 255
    1a3c:	3f 4f       	sbci	r19, 0xFF	; 255
    1a3e:	6e cf       	rjmp	.-292    	; 0x191c <twi_readFrom.constprop.89+0x12>
    1a40:	25 ee       	ldi	r18, 0xE5	; 229
    1a42:	b6 cf       	rjmp	.-148    	; 0x19b0 <twi_readFrom.constprop.89+0xa6>
    1a44:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1a48:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1a4c:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1a50:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1a54:	cd 28       	or	r12, r13
    1a56:	ce 28       	or	r12, r14
    1a58:	cf 28       	or	r12, r15
    1a5a:	69 f0       	breq	.+26     	; 0x1a76 <twi_readFrom.constprop.89+0x16c>
    1a5c:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1a60:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1a64:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1a68:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1a6c:	0c 15       	cp	r16, r12
    1a6e:	1d 05       	cpc	r17, r13
    1a70:	2e 05       	cpc	r18, r14
    1a72:	3f 05       	cpc	r19, r15
    1a74:	88 f6       	brcc	.-94     	; 0x1a18 <twi_readFrom.constprop.89+0x10e>
    1a76:	45 e1       	ldi	r20, 0x15	; 21
    1a78:	4a 95       	dec	r20
    1a7a:	f1 f7       	brne	.-4      	; 0x1a78 <twi_readFrom.constprop.89+0x16e>
    1a7c:	00 00       	nop
    1a7e:	0c 5f       	subi	r16, 0xFC	; 252
    1a80:	1f 4f       	sbci	r17, 0xFF	; 255
    1a82:	2f 4f       	sbci	r18, 0xFF	; 255
    1a84:	3f 4f       	sbci	r19, 0xFF	; 255
    1a86:	99 cf       	rjmp	.-206    	; 0x19ba <twi_readFrom.constprop.89+0xb0>

00001a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>:
    1a88:	cf 92       	push	r12
    1a8a:	df 92       	push	r13
    1a8c:	ef 92       	push	r14
    1a8e:	ff 92       	push	r15
    1a90:	20 91 e7 04 	lds	r18, 0x04E7	; 0x8004e7 <Wire+0x21>
    1a94:	80 91 c6 04 	lds	r24, 0x04C6	; 0x8004c6 <Wire>
    1a98:	40 e0       	ldi	r20, 0x00	; 0
    1a9a:	50 e0       	ldi	r21, 0x00	; 0
    1a9c:	ba 01       	movw	r22, r20
    1a9e:	21 32       	cpi	r18, 0x21	; 33
    1aa0:	58 f1       	brcs	.+86     	; 0x1af8 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x70>
    1aa2:	81 e0       	ldi	r24, 0x01	; 1
    1aa4:	1c c0       	rjmp	.+56     	; 0x1ade <_ZN7TwoWire15endTransmissionEh.constprop.85+0x56>
    1aa6:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1aaa:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1aae:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1ab2:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1ab6:	cd 28       	or	r12, r13
    1ab8:	ce 28       	or	r12, r14
    1aba:	cf 28       	or	r12, r15
    1abc:	a9 f0       	breq	.+42     	; 0x1ae8 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x60>
    1abe:	c0 90 9d 04 	lds	r12, 0x049D	; 0x80049d <_timeout_us>
    1ac2:	d0 90 9e 04 	lds	r13, 0x049E	; 0x80049e <_timeout_us+0x1>
    1ac6:	e0 90 9f 04 	lds	r14, 0x049F	; 0x80049f <_timeout_us+0x2>
    1aca:	f0 90 a0 04 	lds	r15, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1ace:	4c 15       	cp	r20, r12
    1ad0:	5d 05       	cpc	r21, r13
    1ad2:	6e 05       	cpc	r22, r14
    1ad4:	7f 05       	cpc	r23, r15
    1ad6:	40 f0       	brcs	.+16     	; 0x1ae8 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x60>
    1ad8:	0e 94 be 02 	call	0x57c	; 0x57c <_twi_handle_timeout>
    1adc:	85 e0       	ldi	r24, 0x05	; 5
    1ade:	ff 90       	pop	r15
    1ae0:	ef 90       	pop	r14
    1ae2:	df 90       	pop	r13
    1ae4:	cf 90       	pop	r12
    1ae6:	08 95       	ret
    1ae8:	95 e1       	ldi	r25, 0x15	; 21
    1aea:	9a 95       	dec	r25
    1aec:	f1 f7       	brne	.-4      	; 0x1aea <_ZN7TwoWire15endTransmissionEh.constprop.85+0x62>
    1aee:	00 00       	nop
    1af0:	4c 5f       	subi	r20, 0xFC	; 252
    1af2:	5f 4f       	sbci	r21, 0xFF	; 255
    1af4:	6f 4f       	sbci	r22, 0xFF	; 255
    1af6:	7f 4f       	sbci	r23, 0xFF	; 255
    1af8:	90 91 9c 04 	lds	r25, 0x049C	; 0x80049c <_state>
    1afc:	91 11       	cpse	r25, r1
    1afe:	d3 cf       	rjmp	.-90     	; 0x1aa6 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x1e>
    1b00:	91 e0       	ldi	r25, 0x01	; 1
    1b02:	90 93 9c 04 	sts	0x049C, r25	; 0x80049c <_state>
    1b06:	90 93 9b 04 	sts	0x049B, r25	; 0x80049b <_send_stop>
    1b0a:	9f ef       	ldi	r25, 0xFF	; 255
    1b0c:	90 93 9a 04 	sts	0x049A, r25	; 0x80049a <_error>
    1b10:	10 92 99 04 	sts	0x0499, r1	; 0x800499 <_buf_idx>
    1b14:	20 93 98 04 	sts	0x0498, r18	; 0x800498 <_buf_len>
    1b18:	90 e0       	ldi	r25, 0x00	; 0
    1b1a:	88 0f       	add	r24, r24
    1b1c:	99 1f       	adc	r25, r25
    1b1e:	80 93 97 04 	sts	0x0497, r24	; 0x800497 <_slarw>
    1b22:	a7 ec       	ldi	r26, 0xC7	; 199
    1b24:	b4 e0       	ldi	r27, 0x04	; 4
    1b26:	e6 e7       	ldi	r30, 0x76	; 118
    1b28:	f4 e0       	ldi	r31, 0x04	; 4
    1b2a:	80 e0       	ldi	r24, 0x00	; 0
    1b2c:	28 13       	cpse	r18, r24
    1b2e:	4b c0       	rjmp	.+150    	; 0x1bc6 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x13e>
    1b30:	80 91 96 04 	lds	r24, 0x0496	; 0x800496 <_rep_start>
    1b34:	88 23       	and	r24, r24
    1b36:	09 f4       	brne	.+2      	; 0x1b3a <_ZN7TwoWire15endTransmissionEh.constprop.85+0xb2>
    1b38:	4a c0       	rjmp	.+148    	; 0x1bce <_ZN7TwoWire15endTransmissionEh.constprop.85+0x146>
    1b3a:	10 92 96 04 	sts	0x0496, r1	; 0x800496 <_rep_start>
    1b3e:	80 e0       	ldi	r24, 0x00	; 0
    1b40:	90 e0       	ldi	r25, 0x00	; 0
    1b42:	dc 01       	movw	r26, r24
    1b44:	20 91 97 04 	lds	r18, 0x0497	; 0x800497 <_slarw>
    1b48:	20 93 bb 00 	sts	0x00BB, r18	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    1b4c:	40 91 9d 04 	lds	r20, 0x049D	; 0x80049d <_timeout_us>
    1b50:	50 91 9e 04 	lds	r21, 0x049E	; 0x80049e <_timeout_us+0x1>
    1b54:	60 91 9f 04 	lds	r22, 0x049F	; 0x80049f <_timeout_us+0x2>
    1b58:	70 91 a0 04 	lds	r23, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1b5c:	45 2b       	or	r20, r21
    1b5e:	46 2b       	or	r20, r22
    1b60:	47 2b       	or	r20, r23
    1b62:	71 f0       	breq	.+28     	; 0x1b80 <_ZN7TwoWire15endTransmissionEh.constprop.85+0xf8>
    1b64:	40 91 9d 04 	lds	r20, 0x049D	; 0x80049d <_timeout_us>
    1b68:	50 91 9e 04 	lds	r21, 0x049E	; 0x80049e <_timeout_us+0x1>
    1b6c:	60 91 9f 04 	lds	r22, 0x049F	; 0x80049f <_timeout_us+0x2>
    1b70:	70 91 a0 04 	lds	r23, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1b74:	84 17       	cp	r24, r20
    1b76:	95 07       	cpc	r25, r21
    1b78:	a6 07       	cpc	r26, r22
    1b7a:	b7 07       	cpc	r27, r23
    1b7c:	08 f0       	brcs	.+2      	; 0x1b80 <_ZN7TwoWire15endTransmissionEh.constprop.85+0xf8>
    1b7e:	ac cf       	rjmp	.-168    	; 0x1ad8 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x50>
    1b80:	25 e1       	ldi	r18, 0x15	; 21
    1b82:	2a 95       	dec	r18
    1b84:	f1 f7       	brne	.-4      	; 0x1b82 <_ZN7TwoWire15endTransmissionEh.constprop.85+0xfa>
    1b86:	00 00       	nop
    1b88:	04 96       	adiw	r24, 0x04	; 4
    1b8a:	a1 1d       	adc	r26, r1
    1b8c:	b1 1d       	adc	r27, r1
    1b8e:	20 91 bc 00 	lds	r18, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    1b92:	23 fd       	sbrc	r18, 3
    1b94:	d7 cf       	rjmp	.-82     	; 0x1b44 <_ZN7TwoWire15endTransmissionEh.constprop.85+0xbc>
    1b96:	85 ec       	ldi	r24, 0xC5	; 197
    1b98:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    1b9c:	80 e0       	ldi	r24, 0x00	; 0
    1b9e:	90 e0       	ldi	r25, 0x00	; 0
    1ba0:	dc 01       	movw	r26, r24
    1ba2:	20 91 9c 04 	lds	r18, 0x049C	; 0x80049c <_state>
    1ba6:	21 30       	cpi	r18, 0x01	; 1
    1ba8:	a1 f0       	breq	.+40     	; 0x1bd2 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x14a>
    1baa:	80 91 9a 04 	lds	r24, 0x049A	; 0x80049a <_error>
    1bae:	8f 3f       	cpi	r24, 0xFF	; 255
    1bb0:	91 f1       	breq	.+100    	; 0x1c16 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x18e>
    1bb2:	80 91 9a 04 	lds	r24, 0x049A	; 0x80049a <_error>
    1bb6:	80 32       	cpi	r24, 0x20	; 32
    1bb8:	81 f1       	breq	.+96     	; 0x1c1a <_ZN7TwoWire15endTransmissionEh.constprop.85+0x192>
    1bba:	80 91 9a 04 	lds	r24, 0x049A	; 0x80049a <_error>
    1bbe:	80 33       	cpi	r24, 0x30	; 48
    1bc0:	71 f1       	breq	.+92     	; 0x1c1e <_ZN7TwoWire15endTransmissionEh.constprop.85+0x196>
    1bc2:	84 e0       	ldi	r24, 0x04	; 4
    1bc4:	8c cf       	rjmp	.-232    	; 0x1ade <_ZN7TwoWire15endTransmissionEh.constprop.85+0x56>
    1bc6:	9d 91       	ld	r25, X+
    1bc8:	91 93       	st	Z+, r25
    1bca:	8f 5f       	subi	r24, 0xFF	; 255
    1bcc:	af cf       	rjmp	.-162    	; 0x1b2c <_ZN7TwoWire15endTransmissionEh.constprop.85+0xa4>
    1bce:	85 ee       	ldi	r24, 0xE5	; 229
    1bd0:	e3 cf       	rjmp	.-58     	; 0x1b98 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x110>
    1bd2:	40 91 9d 04 	lds	r20, 0x049D	; 0x80049d <_timeout_us>
    1bd6:	50 91 9e 04 	lds	r21, 0x049E	; 0x80049e <_timeout_us+0x1>
    1bda:	60 91 9f 04 	lds	r22, 0x049F	; 0x80049f <_timeout_us+0x2>
    1bde:	70 91 a0 04 	lds	r23, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1be2:	45 2b       	or	r20, r21
    1be4:	46 2b       	or	r20, r22
    1be6:	47 2b       	or	r20, r23
    1be8:	71 f0       	breq	.+28     	; 0x1c06 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x17e>
    1bea:	40 91 9d 04 	lds	r20, 0x049D	; 0x80049d <_timeout_us>
    1bee:	50 91 9e 04 	lds	r21, 0x049E	; 0x80049e <_timeout_us+0x1>
    1bf2:	60 91 9f 04 	lds	r22, 0x049F	; 0x80049f <_timeout_us+0x2>
    1bf6:	70 91 a0 04 	lds	r23, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    1bfa:	84 17       	cp	r24, r20
    1bfc:	95 07       	cpc	r25, r21
    1bfe:	a6 07       	cpc	r26, r22
    1c00:	b7 07       	cpc	r27, r23
    1c02:	08 f0       	brcs	.+2      	; 0x1c06 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x17e>
    1c04:	69 cf       	rjmp	.-302    	; 0x1ad8 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x50>
    1c06:	25 e1       	ldi	r18, 0x15	; 21
    1c08:	2a 95       	dec	r18
    1c0a:	f1 f7       	brne	.-4      	; 0x1c08 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x180>
    1c0c:	00 00       	nop
    1c0e:	04 96       	adiw	r24, 0x04	; 4
    1c10:	a1 1d       	adc	r26, r1
    1c12:	b1 1d       	adc	r27, r1
    1c14:	c6 cf       	rjmp	.-116    	; 0x1ba2 <_ZN7TwoWire15endTransmissionEh.constprop.85+0x11a>
    1c16:	80 e0       	ldi	r24, 0x00	; 0
    1c18:	62 cf       	rjmp	.-316    	; 0x1ade <_ZN7TwoWire15endTransmissionEh.constprop.85+0x56>
    1c1a:	82 e0       	ldi	r24, 0x02	; 2
    1c1c:	60 cf       	rjmp	.-320    	; 0x1ade <_ZN7TwoWire15endTransmissionEh.constprop.85+0x56>
    1c1e:	83 e0       	ldi	r24, 0x03	; 3
    1c20:	5e cf       	rjmp	.-324    	; 0x1ade <_ZN7TwoWire15endTransmissionEh.constprop.85+0x56>

00001c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>:
    1c22:	ff 92       	push	r15
    1c24:	0f 93       	push	r16
    1c26:	1f 93       	push	r17
    1c28:	cf 93       	push	r28
    1c2a:	df 93       	push	r29
    1c2c:	00 d0       	rcall	.+0      	; 0x1c2e <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0xc>
    1c2e:	00 d0       	rcall	.+0      	; 0x1c30 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0xe>
    1c30:	00 d0       	rcall	.+0      	; 0x1c32 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x10>
    1c32:	cd b7       	in	r28, 0x3d	; 61
    1c34:	de b7       	in	r29, 0x3e	; 62
    1c36:	8c 01       	movw	r16, r24
    1c38:	0e 94 ed 02 	call	0x5da	; 0x5da <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE>
    1c3c:	98 2f       	mov	r25, r24
    1c3e:	88 23       	and	r24, r24
    1c40:	09 f4       	brne	.+2      	; 0x1c44 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x22>
    1c42:	67 c0       	rjmp	.+206    	; 0x1d12 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0xf0>
    1c44:	ff 24       	eor	r15, r15
    1c46:	f3 94       	inc	r15
    1c48:	fb 82       	std	Y+3, r15	; 0x03
    1c4a:	f8 01       	movw	r30, r16
    1c4c:	80 81       	ld	r24, Z
    1c4e:	0e 94 06 03 	call	0x60c	; 0x60c <_ZN7Modules6DS3231L8decToBcdEh>
    1c52:	89 83       	std	Y+1, r24	; 0x01
    1c54:	f8 01       	movw	r30, r16
    1c56:	81 81       	ldd	r24, Z+1	; 0x01
    1c58:	0e 94 06 03 	call	0x60c	; 0x60c <_ZN7Modules6DS3231L8decToBcdEh>
    1c5c:	8a 83       	std	Y+2, r24	; 0x02
    1c5e:	f8 01       	movw	r30, r16
    1c60:	82 81       	ldd	r24, Z+2	; 0x02
    1c62:	0e 94 06 03 	call	0x60c	; 0x60c <_ZN7Modules6DS3231L8decToBcdEh>
    1c66:	8c 83       	std	Y+4, r24	; 0x04
    1c68:	f8 01       	movw	r30, r16
    1c6a:	83 81       	ldd	r24, Z+3	; 0x03
    1c6c:	0e 94 06 03 	call	0x60c	; 0x60c <_ZN7Modules6DS3231L8decToBcdEh>
    1c70:	8d 83       	std	Y+5, r24	; 0x05
    1c72:	f8 01       	movw	r30, r16
    1c74:	84 81       	ldd	r24, Z+4	; 0x04
    1c76:	80 5d       	subi	r24, 0xD0	; 208
    1c78:	0e 94 06 03 	call	0x60c	; 0x60c <_ZN7Modules6DS3231L8decToBcdEh>
    1c7c:	8e 83       	std	Y+6, r24	; 0x06
    1c7e:	88 e6       	ldi	r24, 0x68	; 104
    1c80:	80 93 c6 04 	sts	0x04C6, r24	; 0x8004c6 <Wire>
    1c84:	f0 92 e7 04 	sts	0x04E7, r15	; 0x8004e7 <Wire+0x21>
    1c88:	f0 92 c7 04 	sts	0x04C7, r15	; 0x8004c7 <Wire+0x1>
    1c8c:	fe 01       	movw	r30, r28
    1c8e:	31 96       	adiw	r30, 0x01	; 1
    1c90:	96 e0       	ldi	r25, 0x06	; 6
    1c92:	81 e0       	ldi	r24, 0x01	; 1
    1c94:	80 32       	cpi	r24, 0x20	; 32
    1c96:	40 f4       	brcc	.+16     	; 0x1ca8 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x86>
    1c98:	a8 2f       	mov	r26, r24
    1c9a:	b0 e0       	ldi	r27, 0x00	; 0
    1c9c:	aa 53       	subi	r26, 0x3A	; 58
    1c9e:	bb 4f       	sbci	r27, 0xFB	; 251
    1ca0:	20 81       	ld	r18, Z
    1ca2:	11 96       	adiw	r26, 0x01	; 1
    1ca4:	2c 93       	st	X, r18
    1ca6:	8f 5f       	subi	r24, 0xFF	; 255
    1ca8:	91 50       	subi	r25, 0x01	; 1
    1caa:	31 96       	adiw	r30, 0x01	; 1
    1cac:	91 11       	cpse	r25, r1
    1cae:	f2 cf       	rjmp	.-28     	; 0x1c94 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x72>
    1cb0:	80 93 e7 04 	sts	0x04E7, r24	; 0x8004e7 <Wire+0x21>
    1cb4:	e9 de       	rcall	.-558    	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    1cb6:	88 23       	and	r24, r24
    1cb8:	11 f0       	breq	.+4      	; 0x1cbe <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x9c>
    1cba:	90 e0       	ldi	r25, 0x00	; 0
    1cbc:	2a c0       	rjmp	.+84     	; 0x1d12 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0xf0>
    1cbe:	08 e6       	ldi	r16, 0x68	; 104
    1cc0:	00 93 c6 04 	sts	0x04C6, r16	; 0x8004c6 <Wire>
    1cc4:	ff 24       	eor	r15, r15
    1cc6:	f3 94       	inc	r15
    1cc8:	f0 92 e7 04 	sts	0x04E7, r15	; 0x8004e7 <Wire+0x21>
    1ccc:	1f e0       	ldi	r17, 0x0F	; 15
    1cce:	10 93 c7 04 	sts	0x04C7, r17	; 0x8004c7 <Wire+0x1>
    1cd2:	da de       	rcall	.-588    	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    1cd4:	81 11       	cpse	r24, r1
    1cd6:	f1 cf       	rjmp	.-30     	; 0x1cba <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x98>
    1cd8:	61 e0       	ldi	r22, 0x01	; 1
    1cda:	88 ee       	ldi	r24, 0xE8	; 232
    1cdc:	94 e0       	ldi	r25, 0x04	; 4
    1cde:	15 de       	rcall	.-982    	; 0x190a <twi_readFrom.constprop.89>
    1ce0:	80 93 09 05 	sts	0x0509, r24	; 0x800509 <Wire+0x43>
    1ce4:	81 11       	cpse	r24, r1
    1ce6:	03 c0       	rjmp	.+6      	; 0x1cee <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0xcc>
    1ce8:	10 92 08 05 	sts	0x0508, r1	; 0x800508 <Wire+0x42>
    1cec:	e6 cf       	rjmp	.-52     	; 0x1cba <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x98>
    1cee:	f0 92 08 05 	sts	0x0508, r15	; 0x800508 <Wire+0x42>
    1cf2:	80 91 e8 04 	lds	r24, 0x04E8	; 0x8004e8 <Wire+0x22>
    1cf6:	8f 77       	andi	r24, 0x7F	; 127
    1cf8:	00 93 c6 04 	sts	0x04C6, r16	; 0x8004c6 <Wire>
    1cfc:	10 93 c7 04 	sts	0x04C7, r17	; 0x8004c7 <Wire+0x1>
    1d00:	92 e0       	ldi	r25, 0x02	; 2
    1d02:	90 93 e7 04 	sts	0x04E7, r25	; 0x8004e7 <Wire+0x21>
    1d06:	80 93 c8 04 	sts	0x04C8, r24	; 0x8004c8 <Wire+0x2>
    1d0a:	be de       	rcall	.-644    	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    1d0c:	91 e0       	ldi	r25, 0x01	; 1
    1d0e:	81 11       	cpse	r24, r1
    1d10:	d4 cf       	rjmp	.-88     	; 0x1cba <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE+0x98>
    1d12:	89 2f       	mov	r24, r25
    1d14:	26 96       	adiw	r28, 0x06	; 6
    1d16:	0f b6       	in	r0, 0x3f	; 63
    1d18:	f8 94       	cli
    1d1a:	de bf       	out	0x3e, r29	; 62
    1d1c:	0f be       	out	0x3f, r0	; 63
    1d1e:	cd bf       	out	0x3d, r28	; 61
    1d20:	df 91       	pop	r29
    1d22:	cf 91       	pop	r28
    1d24:	1f 91       	pop	r17
    1d26:	0f 91       	pop	r16
    1d28:	ff 90       	pop	r15
    1d2a:	08 95       	ret

00001d2c <_ZN7Modules6DS3231L13readRegistersEhPhh>:
    1d2c:	1f 93       	push	r17
    1d2e:	cf 93       	push	r28
    1d30:	df 93       	push	r29
    1d32:	d6 2f       	mov	r29, r22
    1d34:	17 2f       	mov	r17, r23
    1d36:	c4 2f       	mov	r28, r20
    1d38:	98 e6       	ldi	r25, 0x68	; 104
    1d3a:	90 93 c6 04 	sts	0x04C6, r25	; 0x8004c6 <Wire>
    1d3e:	91 e0       	ldi	r25, 0x01	; 1
    1d40:	90 93 e7 04 	sts	0x04E7, r25	; 0x8004e7 <Wire+0x21>
    1d44:	80 93 c7 04 	sts	0x04C7, r24	; 0x8004c7 <Wire+0x1>
    1d48:	9f de       	rcall	.-706    	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    1d4a:	81 11       	cpse	r24, r1
    1d4c:	2f c0       	rjmp	.+94     	; 0x1dac <_ZN7Modules6DS3231L13readRegistersEhPhh+0x80>
    1d4e:	6c 2f       	mov	r22, r28
    1d50:	88 ee       	ldi	r24, 0xE8	; 232
    1d52:	94 e0       	ldi	r25, 0x04	; 4
    1d54:	da dd       	rcall	.-1100   	; 0x190a <twi_readFrom.constprop.89>
    1d56:	80 93 09 05 	sts	0x0509, r24	; 0x800509 <Wire+0x43>
    1d5a:	10 92 08 05 	sts	0x0508, r1	; 0x800508 <Wire+0x42>
    1d5e:	8c 17       	cp	r24, r28
    1d60:	d8 f0       	brcs	.+54     	; 0x1d98 <_ZN7Modules6DS3231L13readRegistersEhPhh+0x6c>
    1d62:	2d 2f       	mov	r18, r29
    1d64:	ad 2f       	mov	r26, r29
    1d66:	b1 2f       	mov	r27, r17
    1d68:	e0 91 08 05 	lds	r30, 0x0508	; 0x800508 <Wire+0x42>
    1d6c:	80 91 09 05 	lds	r24, 0x0509	; 0x800509 <Wire+0x43>
    1d70:	e8 17       	cp	r30, r24
    1d72:	78 f4       	brcc	.+30     	; 0x1d92 <_ZN7Modules6DS3231L13readRegistersEhPhh+0x66>
    1d74:	81 e0       	ldi	r24, 0x01	; 1
    1d76:	8e 0f       	add	r24, r30
    1d78:	80 93 08 05 	sts	0x0508, r24	; 0x800508 <Wire+0x42>
    1d7c:	f0 e0       	ldi	r31, 0x00	; 0
    1d7e:	ea 53       	subi	r30, 0x3A	; 58
    1d80:	fb 4f       	sbci	r31, 0xFB	; 251
    1d82:	82 a1       	ldd	r24, Z+34	; 0x22
    1d84:	8d 93       	st	X+, r24
    1d86:	8a 2f       	mov	r24, r26
    1d88:	82 1b       	sub	r24, r18
    1d8a:	8c 17       	cp	r24, r28
    1d8c:	68 f3       	brcs	.-38     	; 0x1d68 <_ZN7Modules6DS3231L13readRegistersEhPhh+0x3c>
    1d8e:	81 e0       	ldi	r24, 0x01	; 1
    1d90:	0e c0       	rjmp	.+28     	; 0x1dae <_ZN7Modules6DS3231L13readRegistersEhPhh+0x82>
    1d92:	8f ef       	ldi	r24, 0xFF	; 255
    1d94:	9f ef       	ldi	r25, 0xFF	; 255
    1d96:	f6 cf       	rjmp	.-20     	; 0x1d84 <_ZN7Modules6DS3231L13readRegistersEhPhh+0x58>
    1d98:	90 91 08 05 	lds	r25, 0x0508	; 0x800508 <Wire+0x42>
    1d9c:	98 17       	cp	r25, r24
    1d9e:	31 f0       	breq	.+12     	; 0x1dac <_ZN7Modules6DS3231L13readRegistersEhPhh+0x80>
    1da0:	98 17       	cp	r25, r24
    1da2:	e0 f7       	brcc	.-8      	; 0x1d9c <_ZN7Modules6DS3231L13readRegistersEhPhh+0x70>
    1da4:	9f 5f       	subi	r25, 0xFF	; 255
    1da6:	90 93 08 05 	sts	0x0508, r25	; 0x800508 <Wire+0x42>
    1daa:	f6 cf       	rjmp	.-20     	; 0x1d98 <_ZN7Modules6DS3231L13readRegistersEhPhh+0x6c>
    1dac:	80 e0       	ldi	r24, 0x00	; 0
    1dae:	df 91       	pop	r29
    1db0:	cf 91       	pop	r28
    1db2:	1f 91       	pop	r17
    1db4:	08 95       	ret

00001db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>:
    1db6:	0f 93       	push	r16
    1db8:	1f 93       	push	r17
    1dba:	cf 93       	push	r28
    1dbc:	df 93       	push	r29
    1dbe:	cd b7       	in	r28, 0x3d	; 61
    1dc0:	de b7       	in	r29, 0x3e	; 62
    1dc2:	2c 97       	sbiw	r28, 0x0c	; 12
    1dc4:	0f b6       	in	r0, 0x3f	; 63
    1dc6:	f8 94       	cli
    1dc8:	de bf       	out	0x3e, r29	; 62
    1dca:	0f be       	out	0x3f, r0	; 63
    1dcc:	cd bf       	out	0x3d, r28	; 61
    1dce:	8c 01       	movw	r16, r24
    1dd0:	46 e0       	ldi	r20, 0x06	; 6
    1dd2:	be 01       	movw	r22, r28
    1dd4:	6f 5f       	subi	r22, 0xFF	; 255
    1dd6:	7f 4f       	sbci	r23, 0xFF	; 255
    1dd8:	81 e0       	ldi	r24, 0x01	; 1
    1dda:	a8 df       	rcall	.-176    	; 0x1d2c <_ZN7Modules6DS3231L13readRegistersEhPhh>
    1ddc:	81 11       	cpse	r24, r1
    1dde:	0c c0       	rjmp	.+24     	; 0x1df8 <_ZN7Modules6DS32313nowERNS0_8DateTimeE+0x42>
    1de0:	80 e0       	ldi	r24, 0x00	; 0
    1de2:	2c 96       	adiw	r28, 0x0c	; 12
    1de4:	0f b6       	in	r0, 0x3f	; 63
    1de6:	f8 94       	cli
    1de8:	de bf       	out	0x3e, r29	; 62
    1dea:	0f be       	out	0x3f, r0	; 63
    1dec:	cd bf       	out	0x3d, r28	; 61
    1dee:	df 91       	pop	r29
    1df0:	cf 91       	pop	r28
    1df2:	1f 91       	pop	r17
    1df4:	0f 91       	pop	r16
    1df6:	08 95       	ret
    1df8:	89 81       	ldd	r24, Y+1	; 0x01
    1dfa:	8f 77       	andi	r24, 0x7F	; 127
    1dfc:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    1e00:	8f 83       	std	Y+7, r24	; 0x07
    1e02:	8a 81       	ldd	r24, Y+2	; 0x02
    1e04:	8f 73       	andi	r24, 0x3F	; 63
    1e06:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    1e0a:	88 87       	std	Y+8, r24	; 0x08
    1e0c:	8c 81       	ldd	r24, Y+4	; 0x04
    1e0e:	8f 73       	andi	r24, 0x3F	; 63
    1e10:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    1e14:	89 87       	std	Y+9, r24	; 0x09
    1e16:	8d 81       	ldd	r24, Y+5	; 0x05
    1e18:	8f 71       	andi	r24, 0x1F	; 31
    1e1a:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    1e1e:	8a 87       	std	Y+10, r24	; 0x0a
    1e20:	8e 81       	ldd	r24, Y+6	; 0x06
    1e22:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    1e26:	90 e0       	ldi	r25, 0x00	; 0
    1e28:	80 53       	subi	r24, 0x30	; 48
    1e2a:	98 4f       	sbci	r25, 0xF8	; 248
    1e2c:	9c 87       	std	Y+12, r25	; 0x0c
    1e2e:	8b 87       	std	Y+11, r24	; 0x0b
    1e30:	ce 01       	movw	r24, r28
    1e32:	07 96       	adiw	r24, 0x07	; 7
    1e34:	0e 94 ed 02 	call	0x5da	; 0x5da <_ZN7Modules6DS3231L7isValidERKNS0_8DateTimeE>
    1e38:	88 23       	and	r24, r24
    1e3a:	91 f2       	breq	.-92     	; 0x1de0 <_ZN7Modules6DS32313nowERNS0_8DateTimeE+0x2a>
    1e3c:	96 e0       	ldi	r25, 0x06	; 6
    1e3e:	fe 01       	movw	r30, r28
    1e40:	37 96       	adiw	r30, 0x07	; 7
    1e42:	d8 01       	movw	r26, r16
    1e44:	01 90       	ld	r0, Z+
    1e46:	0d 92       	st	X+, r0
    1e48:	9a 95       	dec	r25
    1e4a:	e1 f7       	brne	.-8      	; 0x1e44 <_ZN7Modules6DS32313nowERNS0_8DateTimeE+0x8e>
    1e4c:	ca cf       	rjmp	.-108    	; 0x1de2 <_ZN7Modules6DS32313nowERNS0_8DateTimeE+0x2c>

00001e4e <_Z10dateSaveFnhh>:
    1e4e:	cf 93       	push	r28
    1e50:	df 93       	push	r29
    1e52:	cd b7       	in	r28, 0x3d	; 61
    1e54:	de b7       	in	r29, 0x3e	; 62
    1e56:	2c 97       	sbiw	r28, 0x0c	; 12
    1e58:	0f b6       	in	r0, 0x3f	; 63
    1e5a:	f8 94       	cli
    1e5c:	de bf       	out	0x3e, r29	; 62
    1e5e:	0f be       	out	0x3f, r0	; 63
    1e60:	cd bf       	out	0x3d, r28	; 61
    1e62:	61 11       	cpse	r22, r1
    1e64:	26 c0       	rjmp	.+76     	; 0x1eb2 <_Z10dateSaveFnhh+0x64>
    1e66:	ce 01       	movw	r24, r28
    1e68:	01 96       	adiw	r24, 0x01	; 1
    1e6a:	26 e0       	ldi	r18, 0x06	; 6
    1e6c:	fc 01       	movw	r30, r24
    1e6e:	11 92       	st	Z+, r1
    1e70:	2a 95       	dec	r18
    1e72:	e9 f7       	brne	.-6      	; 0x1e6e <_Z10dateSaveFnhh+0x20>
    1e74:	a0 df       	rcall	.-192    	; 0x1db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>
    1e76:	88 23       	and	r24, r24
    1e78:	e1 f0       	breq	.+56     	; 0x1eb2 <_Z10dateSaveFnhh+0x64>
    1e7a:	89 81       	ldd	r24, Y+1	; 0x01
    1e7c:	8f 83       	std	Y+7, r24	; 0x07
    1e7e:	8a 81       	ldd	r24, Y+2	; 0x02
    1e80:	88 87       	std	Y+8, r24	; 0x08
    1e82:	20 91 14 02 	lds	r18, 0x0214	; 0x800214 <_ZN6ConfigL7entriesE+0x104>
    1e86:	9a e0       	ldi	r25, 0x0A	; 10
    1e88:	80 91 21 02 	lds	r24, 0x0221	; 0x800221 <_ZN6ConfigL7entriesE+0x111>
    1e8c:	29 9f       	mul	r18, r25
    1e8e:	80 0d       	add	r24, r0
    1e90:	11 24       	eor	r1, r1
    1e92:	89 87       	std	Y+9, r24	; 0x09
    1e94:	20 91 2e 02 	lds	r18, 0x022E	; 0x80022e <_ZN6ConfigL7entriesE+0x11e>
    1e98:	80 91 3b 02 	lds	r24, 0x023B	; 0x80023b <_ZN6ConfigL7entriesE+0x12b>
    1e9c:	29 9f       	mul	r18, r25
    1e9e:	80 0d       	add	r24, r0
    1ea0:	11 24       	eor	r1, r1
    1ea2:	8a 87       	std	Y+10, r24	; 0x0a
    1ea4:	8d 81       	ldd	r24, Y+5	; 0x05
    1ea6:	9e 81       	ldd	r25, Y+6	; 0x06
    1ea8:	9c 87       	std	Y+12, r25	; 0x0c
    1eaa:	8b 87       	std	Y+11, r24	; 0x0b
    1eac:	ce 01       	movw	r24, r28
    1eae:	07 96       	adiw	r24, 0x07	; 7
    1eb0:	b8 de       	rcall	.-656    	; 0x1c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>
    1eb2:	2c 96       	adiw	r28, 0x0c	; 12
    1eb4:	0f b6       	in	r0, 0x3f	; 63
    1eb6:	f8 94       	cli
    1eb8:	de bf       	out	0x3e, r29	; 62
    1eba:	0f be       	out	0x3f, r0	; 63
    1ebc:	cd bf       	out	0x3d, r28	; 61
    1ebe:	df 91       	pop	r29
    1ec0:	cf 91       	pop	r28
    1ec2:	08 95       	ret

00001ec4 <_Z10yearLoadFnhh>:
    1ec4:	cf 92       	push	r12
    1ec6:	df 92       	push	r13
    1ec8:	ef 92       	push	r14
    1eca:	ff 92       	push	r15
    1ecc:	1f 93       	push	r17
    1ece:	cf 93       	push	r28
    1ed0:	df 93       	push	r29
    1ed2:	00 d0       	rcall	.+0      	; 0x1ed4 <_Z10yearLoadFnhh+0x10>
    1ed4:	00 d0       	rcall	.+0      	; 0x1ed6 <_Z10yearLoadFnhh+0x12>
    1ed6:	00 d0       	rcall	.+0      	; 0x1ed8 <_Z10yearLoadFnhh+0x14>
    1ed8:	cd b7       	in	r28, 0x3d	; 61
    1eda:	de b7       	in	r29, 0x3e	; 62
    1edc:	61 11       	cpse	r22, r1
    1ede:	3c c0       	rjmp	.+120    	; 0x1f58 <_Z10yearLoadFnhh+0x94>
    1ee0:	18 2f       	mov	r17, r24
    1ee2:	ce 01       	movw	r24, r28
    1ee4:	01 96       	adiw	r24, 0x01	; 1
    1ee6:	26 e0       	ldi	r18, 0x06	; 6
    1ee8:	fc 01       	movw	r30, r24
    1eea:	11 92       	st	Z+, r1
    1eec:	2a 95       	dec	r18
    1eee:	e9 f7       	brne	.-6      	; 0x1eea <_Z10yearLoadFnhh+0x26>
    1ef0:	62 df       	rcall	.-316    	; 0x1db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>
    1ef2:	88 23       	and	r24, r24
    1ef4:	89 f1       	breq	.+98     	; 0x1f58 <_Z10yearLoadFnhh+0x94>
    1ef6:	cd 80       	ldd	r12, Y+5	; 0x05
    1ef8:	de 80       	ldd	r13, Y+6	; 0x06
    1efa:	11 0f       	add	r17, r17
    1efc:	11 0f       	add	r17, r17
    1efe:	c6 01       	movw	r24, r12
    1f00:	68 ee       	ldi	r22, 0xE8	; 232
    1f02:	73 e0       	ldi	r23, 0x03	; 3
    1f04:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f08:	cb 01       	movw	r24, r22
    1f0a:	2a e0       	ldi	r18, 0x0A	; 10
    1f0c:	e2 2e       	mov	r14, r18
    1f0e:	f1 2c       	mov	r15, r1
    1f10:	b7 01       	movw	r22, r14
    1f12:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f16:	68 2f       	mov	r22, r24
    1f18:	81 2f       	mov	r24, r17
    1f1a:	75 dc       	rcall	.-1814   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    1f1c:	c6 01       	movw	r24, r12
    1f1e:	64 e6       	ldi	r22, 0x64	; 100
    1f20:	70 e0       	ldi	r23, 0x00	; 0
    1f22:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f26:	cb 01       	movw	r24, r22
    1f28:	b7 01       	movw	r22, r14
    1f2a:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f2e:	68 2f       	mov	r22, r24
    1f30:	81 e0       	ldi	r24, 0x01	; 1
    1f32:	81 0f       	add	r24, r17
    1f34:	68 dc       	rcall	.-1840   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    1f36:	c6 01       	movw	r24, r12
    1f38:	b7 01       	movw	r22, r14
    1f3a:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f3e:	d8 2e       	mov	r13, r24
    1f40:	cb 01       	movw	r24, r22
    1f42:	b7 01       	movw	r22, r14
    1f44:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    1f48:	68 2f       	mov	r22, r24
    1f4a:	82 e0       	ldi	r24, 0x02	; 2
    1f4c:	81 0f       	add	r24, r17
    1f4e:	5b dc       	rcall	.-1866   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    1f50:	6d 2d       	mov	r22, r13
    1f52:	83 e0       	ldi	r24, 0x03	; 3
    1f54:	81 0f       	add	r24, r17
    1f56:	57 dc       	rcall	.-1874   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    1f58:	26 96       	adiw	r28, 0x06	; 6
    1f5a:	0f b6       	in	r0, 0x3f	; 63
    1f5c:	f8 94       	cli
    1f5e:	de bf       	out	0x3e, r29	; 62
    1f60:	0f be       	out	0x3f, r0	; 63
    1f62:	cd bf       	out	0x3d, r28	; 61
    1f64:	df 91       	pop	r29
    1f66:	cf 91       	pop	r28
    1f68:	1f 91       	pop	r17
    1f6a:	ff 90       	pop	r15
    1f6c:	ef 90       	pop	r14
    1f6e:	df 90       	pop	r13
    1f70:	cf 90       	pop	r12
    1f72:	08 95       	ret

00001f74 <_Z10yearSaveFnhh>:
    1f74:	cf 93       	push	r28
    1f76:	df 93       	push	r29
    1f78:	cd b7       	in	r28, 0x3d	; 61
    1f7a:	de b7       	in	r29, 0x3e	; 62
    1f7c:	2c 97       	sbiw	r28, 0x0c	; 12
    1f7e:	0f b6       	in	r0, 0x3f	; 63
    1f80:	f8 94       	cli
    1f82:	de bf       	out	0x3e, r29	; 62
    1f84:	0f be       	out	0x3f, r0	; 63
    1f86:	cd bf       	out	0x3d, r28	; 61
    1f88:	61 11       	cpse	r22, r1
    1f8a:	32 c0       	rjmp	.+100    	; 0x1ff0 <_Z10yearSaveFnhh+0x7c>
    1f8c:	ce 01       	movw	r24, r28
    1f8e:	01 96       	adiw	r24, 0x01	; 1
    1f90:	26 e0       	ldi	r18, 0x06	; 6
    1f92:	fc 01       	movw	r30, r24
    1f94:	11 92       	st	Z+, r1
    1f96:	2a 95       	dec	r18
    1f98:	e9 f7       	brne	.-6      	; 0x1f94 <_Z10yearSaveFnhh+0x20>
    1f9a:	0d df       	rcall	.-486    	; 0x1db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>
    1f9c:	88 23       	and	r24, r24
    1f9e:	41 f1       	breq	.+80     	; 0x1ff0 <_Z10yearSaveFnhh+0x7c>
    1fa0:	40 91 e0 01 	lds	r20, 0x01E0	; 0x8001e0 <_ZN6ConfigL7entriesE+0xd0>
    1fa4:	28 ee       	ldi	r18, 0xE8	; 232
    1fa6:	33 e0       	ldi	r19, 0x03	; 3
    1fa8:	42 9f       	mul	r20, r18
    1faa:	c0 01       	movw	r24, r0
    1fac:	43 9f       	mul	r20, r19
    1fae:	90 0d       	add	r25, r0
    1fb0:	11 24       	eor	r1, r1
    1fb2:	20 91 ed 01 	lds	r18, 0x01ED	; 0x8001ed <_ZN6ConfigL7entriesE+0xdd>
    1fb6:	f4 e6       	ldi	r31, 0x64	; 100
    1fb8:	2f 9f       	mul	r18, r31
    1fba:	80 0d       	add	r24, r0
    1fbc:	91 1d       	adc	r25, r1
    1fbe:	11 24       	eor	r1, r1
    1fc0:	20 91 fa 01 	lds	r18, 0x01FA	; 0x8001fa <_ZN6ConfigL7entriesE+0xea>
    1fc4:	3a e0       	ldi	r19, 0x0A	; 10
    1fc6:	23 9f       	mul	r18, r19
    1fc8:	80 0d       	add	r24, r0
    1fca:	91 1d       	adc	r25, r1
    1fcc:	11 24       	eor	r1, r1
    1fce:	20 91 07 02 	lds	r18, 0x0207	; 0x800207 <_ZN6ConfigL7entriesE+0xf7>
    1fd2:	82 0f       	add	r24, r18
    1fd4:	91 1d       	adc	r25, r1
    1fd6:	29 81       	ldd	r18, Y+1	; 0x01
    1fd8:	2f 83       	std	Y+7, r18	; 0x07
    1fda:	2a 81       	ldd	r18, Y+2	; 0x02
    1fdc:	28 87       	std	Y+8, r18	; 0x08
    1fde:	2b 81       	ldd	r18, Y+3	; 0x03
    1fe0:	29 87       	std	Y+9, r18	; 0x09
    1fe2:	2c 81       	ldd	r18, Y+4	; 0x04
    1fe4:	2a 87       	std	Y+10, r18	; 0x0a
    1fe6:	9c 87       	std	Y+12, r25	; 0x0c
    1fe8:	8b 87       	std	Y+11, r24	; 0x0b
    1fea:	ce 01       	movw	r24, r28
    1fec:	07 96       	adiw	r24, 0x07	; 7
    1fee:	19 de       	rcall	.-974    	; 0x1c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>
    1ff0:	2c 96       	adiw	r28, 0x0c	; 12
    1ff2:	0f b6       	in	r0, 0x3f	; 63
    1ff4:	f8 94       	cli
    1ff6:	de bf       	out	0x3e, r29	; 62
    1ff8:	0f be       	out	0x3f, r0	; 63
    1ffa:	cd bf       	out	0x3d, r28	; 61
    1ffc:	df 91       	pop	r29
    1ffe:	cf 91       	pop	r28
    2000:	08 95       	ret

00002002 <_Z10dateLoadFnhh>:
    2002:	ef 92       	push	r14
    2004:	ff 92       	push	r15
    2006:	0f 93       	push	r16
    2008:	1f 93       	push	r17
    200a:	cf 93       	push	r28
    200c:	df 93       	push	r29
    200e:	00 d0       	rcall	.+0      	; 0x2010 <_Z10dateLoadFnhh+0xe>
    2010:	00 d0       	rcall	.+0      	; 0x2012 <_Z10dateLoadFnhh+0x10>
    2012:	00 d0       	rcall	.+0      	; 0x2014 <_Z10dateLoadFnhh+0x12>
    2014:	cd b7       	in	r28, 0x3d	; 61
    2016:	de b7       	in	r29, 0x3e	; 62
    2018:	61 11       	cpse	r22, r1
    201a:	28 c0       	rjmp	.+80     	; 0x206c <_Z10dateLoadFnhh+0x6a>
    201c:	18 2f       	mov	r17, r24
    201e:	ce 01       	movw	r24, r28
    2020:	01 96       	adiw	r24, 0x01	; 1
    2022:	26 e0       	ldi	r18, 0x06	; 6
    2024:	fc 01       	movw	r30, r24
    2026:	11 92       	st	Z+, r1
    2028:	2a 95       	dec	r18
    202a:	e9 f7       	brne	.-6      	; 0x2026 <_Z10dateLoadFnhh+0x24>
    202c:	c4 de       	rcall	.-632    	; 0x1db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>
    202e:	88 23       	and	r24, r24
    2030:	51 f1       	breq	.+84     	; 0x2086 <_Z10dateLoadFnhh+0x84>
    2032:	fc 80       	ldd	r15, Y+4	; 0x04
    2034:	8b 81       	ldd	r24, Y+3	; 0x03
    2036:	11 0f       	add	r17, r17
    2038:	11 0f       	add	r17, r17
    203a:	0a e0       	ldi	r16, 0x0A	; 10
    203c:	60 2f       	mov	r22, r16
    203e:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    2042:	e9 2e       	mov	r14, r25
    2044:	68 2f       	mov	r22, r24
    2046:	81 2f       	mov	r24, r17
    2048:	de db       	rcall	.-2116   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    204a:	6e 2d       	mov	r22, r14
    204c:	81 e0       	ldi	r24, 0x01	; 1
    204e:	81 0f       	add	r24, r17
    2050:	da db       	rcall	.-2124   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    2052:	8f 2d       	mov	r24, r15
    2054:	60 2f       	mov	r22, r16
    2056:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    205a:	09 2f       	mov	r16, r25
    205c:	68 2f       	mov	r22, r24
    205e:	82 e0       	ldi	r24, 0x02	; 2
    2060:	81 0f       	add	r24, r17
    2062:	d1 db       	rcall	.-2142   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    2064:	60 2f       	mov	r22, r16
    2066:	83 e0       	ldi	r24, 0x03	; 3
    2068:	81 0f       	add	r24, r17
    206a:	cd db       	rcall	.-2150   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    206c:	26 96       	adiw	r28, 0x06	; 6
    206e:	0f b6       	in	r0, 0x3f	; 63
    2070:	f8 94       	cli
    2072:	de bf       	out	0x3e, r29	; 62
    2074:	0f be       	out	0x3f, r0	; 63
    2076:	cd bf       	out	0x3d, r28	; 61
    2078:	df 91       	pop	r29
    207a:	cf 91       	pop	r28
    207c:	1f 91       	pop	r17
    207e:	0f 91       	pop	r16
    2080:	ff 90       	pop	r15
    2082:	ef 90       	pop	r14
    2084:	08 95       	ret
    2086:	81 e0       	ldi	r24, 0x01	; 1
    2088:	ff 24       	eor	r15, r15
    208a:	f3 94       	inc	r15
    208c:	d4 cf       	rjmp	.-88     	; 0x2036 <_Z10dateLoadFnhh+0x34>

0000208e <_Z10timeSaveFnhh>:
    208e:	0f 93       	push	r16
    2090:	1f 93       	push	r17
    2092:	cf 93       	push	r28
    2094:	df 93       	push	r29
    2096:	00 d0       	rcall	.+0      	; 0x2098 <_Z10timeSaveFnhh+0xa>
    2098:	00 d0       	rcall	.+0      	; 0x209a <_Z10timeSaveFnhh+0xc>
    209a:	00 d0       	rcall	.+0      	; 0x209c <_Z10timeSaveFnhh+0xe>
    209c:	cd b7       	in	r28, 0x3d	; 61
    209e:	de b7       	in	r29, 0x3e	; 62
    20a0:	61 11       	cpse	r22, r1
    20a2:	4b c0       	rjmp	.+150    	; 0x213a <_Z10timeSaveFnhh+0xac>
    20a4:	e8 2f       	mov	r30, r24
    20a6:	ee 0f       	add	r30, r30
    20a8:	ee 0f       	add	r30, r30
    20aa:	9d e0       	ldi	r25, 0x0D	; 13
    20ac:	9e 9f       	mul	r25, r30
    20ae:	d0 01       	movw	r26, r0
    20b0:	11 24       	eor	r1, r1
    20b2:	a0 5f       	subi	r26, 0xF0	; 240
    20b4:	be 4f       	sbci	r27, 0xFE	; 254
    20b6:	3c 91       	ld	r19, X
    20b8:	2a e0       	ldi	r18, 0x0A	; 10
    20ba:	a1 e0       	ldi	r26, 0x01	; 1
    20bc:	ae 0f       	add	r26, r30
    20be:	9a 9f       	mul	r25, r26
    20c0:	d0 01       	movw	r26, r0
    20c2:	11 24       	eor	r1, r1
    20c4:	a0 5f       	subi	r26, 0xF0	; 240
    20c6:	be 4f       	sbci	r27, 0xFE	; 254
    20c8:	8c 91       	ld	r24, X
    20ca:	32 9f       	mul	r19, r18
    20cc:	80 0d       	add	r24, r0
    20ce:	11 24       	eor	r1, r1
    20d0:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <t_counter_hours>
    20d4:	a2 e0       	ldi	r26, 0x02	; 2
    20d6:	ae 0f       	add	r26, r30
    20d8:	9a 9f       	mul	r25, r26
    20da:	d0 01       	movw	r26, r0
    20dc:	11 24       	eor	r1, r1
    20de:	a0 5f       	subi	r26, 0xF0	; 240
    20e0:	be 4f       	sbci	r27, 0xFE	; 254
    20e2:	3c 91       	ld	r19, X
    20e4:	ed 5f       	subi	r30, 0xFD	; 253
    20e6:	9e 9f       	mul	r25, r30
    20e8:	f0 01       	movw	r30, r0
    20ea:	11 24       	eor	r1, r1
    20ec:	e0 5f       	subi	r30, 0xF0	; 240
    20ee:	fe 4f       	sbci	r31, 0xFE	; 254
    20f0:	80 81       	ld	r24, Z
    20f2:	32 9f       	mul	r19, r18
    20f4:	80 0d       	add	r24, r0
    20f6:	11 24       	eor	r1, r1
    20f8:	80 93 50 03 	sts	0x0350, r24	; 0x800350 <t_counter_minutes>
    20fc:	80 91 53 03 	lds	r24, 0x0353	; 0x800353 <_ZN7ModulesL8_MODULESE>
    2100:	80 ff       	sbrs	r24, 0
    2102:	1b c0       	rjmp	.+54     	; 0x213a <_Z10timeSaveFnhh+0xac>
    2104:	8e 01       	movw	r16, r28
    2106:	0f 5f       	subi	r16, 0xFF	; 255
    2108:	1f 4f       	sbci	r17, 0xFF	; 255
    210a:	86 e0       	ldi	r24, 0x06	; 6
    210c:	f8 01       	movw	r30, r16
    210e:	11 92       	st	Z+, r1
    2110:	8a 95       	dec	r24
    2112:	e9 f7       	brne	.-6      	; 0x210e <_Z10timeSaveFnhh+0x80>
    2114:	c8 01       	movw	r24, r16
    2116:	4f de       	rcall	.-866    	; 0x1db6 <_ZN7Modules6DS32313nowERNS0_8DateTimeE>
    2118:	81 11       	cpse	r24, r1
    211a:	07 c0       	rjmp	.+14     	; 0x212a <_Z10timeSaveFnhh+0x9c>
    211c:	81 e0       	ldi	r24, 0x01	; 1
    211e:	8b 83       	std	Y+3, r24	; 0x03
    2120:	8c 83       	std	Y+4, r24	; 0x04
    2122:	80 ed       	ldi	r24, 0xD0	; 208
    2124:	97 e0       	ldi	r25, 0x07	; 7
    2126:	9e 83       	std	Y+6, r25	; 0x06
    2128:	8d 83       	std	Y+5, r24	; 0x05
    212a:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    212e:	89 83       	std	Y+1, r24	; 0x01
    2130:	80 91 4f 03 	lds	r24, 0x034F	; 0x80034f <t_counter_hours>
    2134:	8a 83       	std	Y+2, r24	; 0x02
    2136:	c8 01       	movw	r24, r16
    2138:	74 dd       	rcall	.-1304   	; 0x1c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>
    213a:	26 96       	adiw	r28, 0x06	; 6
    213c:	0f b6       	in	r0, 0x3f	; 63
    213e:	f8 94       	cli
    2140:	de bf       	out	0x3e, r29	; 62
    2142:	0f be       	out	0x3f, r0	; 63
    2144:	cd bf       	out	0x3d, r28	; 61
    2146:	df 91       	pop	r29
    2148:	cf 91       	pop	r28
    214a:	1f 91       	pop	r17
    214c:	0f 91       	pop	r16
    214e:	08 95       	ret

00002150 <_Z11displayDatev>:
    2150:	ff 92       	push	r15
    2152:	0f 93       	push	r16
    2154:	1f 93       	push	r17
    2156:	cf 93       	push	r28
    2158:	df 93       	push	r29
    215a:	cd b7       	in	r28, 0x3d	; 61
    215c:	de b7       	in	r29, 0x3e	; 62
    215e:	62 97       	sbiw	r28, 0x12	; 18
    2160:	0f b6       	in	r0, 0x3f	; 63
    2162:	f8 94       	cli
    2164:	de bf       	out	0x3e, r29	; 62
    2166:	0f be       	out	0x3f, r0	; 63
    2168:	cd bf       	out	0x3d, r28	; 61
    216a:	42 e0       	ldi	r20, 0x02	; 2
    216c:	be 01       	movw	r22, r28
    216e:	6f 5f       	subi	r22, 0xFF	; 255
    2170:	7f 4f       	sbci	r23, 0xFF	; 255
    2172:	84 e0       	ldi	r24, 0x04	; 4
    2174:	db dd       	rcall	.-1098   	; 0x1d2c <_ZN7Modules6DS3231L13readRegistersEhPhh>
    2176:	88 23       	and	r24, r24
    2178:	91 f0       	breq	.+36     	; 0x219e <_Z11displayDatev+0x4e>
    217a:	89 81       	ldd	r24, Y+1	; 0x01
    217c:	8f 73       	andi	r24, 0x3F	; 63
    217e:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    2182:	08 2f       	mov	r16, r24
    2184:	8a 81       	ldd	r24, Y+2	; 0x02
    2186:	8f 71       	andi	r24, 0x1F	; 31
    2188:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    218c:	18 2f       	mov	r17, r24
    218e:	8f ef       	ldi	r24, 0xFF	; 255
    2190:	80 0f       	add	r24, r16
    2192:	8f 31       	cpi	r24, 0x1F	; 31
    2194:	20 f4       	brcc	.+8      	; 0x219e <_Z11displayDatev+0x4e>
    2196:	8f ef       	ldi	r24, 0xFF	; 255
    2198:	81 0f       	add	r24, r17
    219a:	8c 30       	cpi	r24, 0x0C	; 12
    219c:	50 f1       	brcs	.+84     	; 0x21f2 <_Z11displayDatev+0xa2>
    219e:	80 91 64 03 	lds	r24, 0x0364	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    21a2:	90 91 64 03 	lds	r25, 0x0364	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    21a6:	89 17       	cp	r24, r25
    21a8:	e1 f3       	breq	.-8      	; 0x21a2 <_Z11displayDatev+0x52>
    21aa:	9f b7       	in	r25, 0x3f	; 63
    21ac:	f8 94       	cli
    21ae:	88 e0       	ldi	r24, 0x08	; 8
    21b0:	ec e5       	ldi	r30, 0x5C	; 92
    21b2:	f3 e0       	ldi	r31, 0x03	; 3
    21b4:	de 01       	movw	r26, r28
    21b6:	1b 96       	adiw	r26, 0x0b	; 11
    21b8:	01 90       	ld	r0, Z+
    21ba:	0d 92       	st	X+, r0
    21bc:	8a 95       	dec	r24
    21be:	e1 f7       	brne	.-8      	; 0x21b8 <_Z11displayDatev+0x68>
    21c0:	80 91 62 03 	lds	r24, 0x0362	; 0x800362 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    21c4:	9f bf       	out	0x3f, r25	; 63
    21c6:	0e 94 f0 05 	call	0xbe0	; 0xbe0 <_ZN3BCD10int_to_bcdEh>
    21ca:	8f 83       	std	Y+7, r24	; 0x07
    21cc:	0d 85       	ldd	r16, Y+13	; 0x0d
    21ce:	0b 83       	std	Y+3, r16	; 0x03
    21d0:	1c 85       	ldd	r17, Y+12	; 0x0c
    21d2:	1a 83       	std	Y+2, r17	; 0x02
    21d4:	90 2f       	mov	r25, r16
    21d6:	92 95       	swap	r25
    21d8:	9f 70       	andi	r25, 0x0F	; 15
    21da:	8a e0       	ldi	r24, 0x0A	; 10
    21dc:	0f 70       	andi	r16, 0x0F	; 15
    21de:	98 9f       	mul	r25, r24
    21e0:	00 0d       	add	r16, r0
    21e2:	11 24       	eor	r1, r1
    21e4:	91 2f       	mov	r25, r17
    21e6:	92 95       	swap	r25
    21e8:	9f 70       	andi	r25, 0x0F	; 15
    21ea:	1f 70       	andi	r17, 0x0F	; 15
    21ec:	98 9f       	mul	r25, r24
    21ee:	10 0d       	add	r17, r0
    21f0:	11 24       	eor	r1, r1
    21f2:	8a e0       	ldi	r24, 0x0A	; 10
    21f4:	f8 2e       	mov	r15, r24
    21f6:	80 2f       	mov	r24, r16
    21f8:	6f 2d       	mov	r22, r15
    21fa:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    21fe:	09 2f       	mov	r16, r25
    2200:	68 2f       	mov	r22, r24
    2202:	80 e0       	ldi	r24, 0x00	; 0
    2204:	27 da       	rcall	.-2994   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    2206:	60 2f       	mov	r22, r16
    2208:	81 e0       	ldi	r24, 0x01	; 1
    220a:	24 da       	rcall	.-3000   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    220c:	81 2f       	mov	r24, r17
    220e:	6f 2d       	mov	r22, r15
    2210:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    2214:	19 2f       	mov	r17, r25
    2216:	68 2f       	mov	r22, r24
    2218:	82 e0       	ldi	r24, 0x02	; 2
    221a:	1c da       	rcall	.-3016   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    221c:	61 2f       	mov	r22, r17
    221e:	83 e0       	ldi	r24, 0x03	; 3
    2220:	19 da       	rcall	.-3022   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    2222:	7b d9       	rcall	.-3338   	; 0x151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>
    2224:	62 96       	adiw	r28, 0x12	; 18
    2226:	0f b6       	in	r0, 0x3f	; 63
    2228:	f8 94       	cli
    222a:	de bf       	out	0x3e, r29	; 62
    222c:	0f be       	out	0x3f, r0	; 63
    222e:	cd bf       	out	0x3d, r28	; 61
    2230:	df 91       	pop	r29
    2232:	cf 91       	pop	r28
    2234:	1f 91       	pop	r17
    2236:	0f 91       	pop	r16
    2238:	ff 90       	pop	r15
    223a:	08 95       	ret

0000223c <_Z18displayTemperaturev>:
    223c:	0f 93       	push	r16
    223e:	1f 93       	push	r17
    2240:	cf 93       	push	r28
    2242:	df 93       	push	r29
    2244:	00 d0       	rcall	.+0      	; 0x2246 <_Z18displayTemperaturev+0xa>
    2246:	cd b7       	in	r28, 0x3d	; 61
    2248:	de b7       	in	r29, 0x3e	; 62
    224a:	42 e0       	ldi	r20, 0x02	; 2
    224c:	be 01       	movw	r22, r28
    224e:	6f 5f       	subi	r22, 0xFF	; 255
    2250:	7f 4f       	sbci	r23, 0xFF	; 255
    2252:	81 e1       	ldi	r24, 0x11	; 17
    2254:	6b dd       	rcall	.-1322   	; 0x1d2c <_ZN7Modules6DS3231L13readRegistersEhPhh>
    2256:	81 11       	cpse	r24, r1
    2258:	2c c0       	rjmp	.+88     	; 0x22b2 <_Z18displayTemperaturev+0x76>
    225a:	00 91 7c 00 	lds	r16, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    225e:	10 91 7a 00 	lds	r17, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    2262:	88 ec       	ldi	r24, 0xC8	; 200
    2264:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    2268:	87 e8       	ldi	r24, 0x87	; 135
    226a:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    226e:	84 e1       	ldi	r24, 0x14	; 20
    2270:	90 e0       	ldi	r25, 0x00	; 0
    2272:	32 d9       	rcall	.-3484   	; 0x14d8 <_Z4waitj>
    2274:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    2278:	80 64       	ori	r24, 0x40	; 64
    227a:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    227e:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    2282:	86 fd       	sbrc	r24, 6
    2284:	fc cf       	rjmp	.-8      	; 0x227e <_Z18displayTemperaturev+0x42>
    2286:	20 91 78 00 	lds	r18, 0x0078	; 0x800078 <__TEXT_REGION_LENGTH__+0x7e0078>
    228a:	30 91 79 00 	lds	r19, 0x0079	; 0x800079 <__TEXT_REGION_LENGTH__+0x7e0079>
    228e:	00 93 7c 00 	sts	0x007C, r16	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    2292:	10 93 7a 00 	sts	0x007A, r17	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    2296:	2c 52       	subi	r18, 0x2C	; 44
    2298:	31 40       	sbci	r19, 0x01	; 1
    229a:	ab e2       	ldi	r26, 0x2B	; 43
    229c:	b4 e2       	ldi	r27, 0x24	; 36
    229e:	0e 94 33 27 	call	0x4e66	; 0x4e66 <__umulhisi3>
    22a2:	20 e1       	ldi	r18, 0x10	; 16
    22a4:	37 e2       	ldi	r19, 0x27	; 39
    22a6:	40 e0       	ldi	r20, 0x00	; 0
    22a8:	50 e0       	ldi	r21, 0x00	; 0
    22aa:	0e 94 11 27 	call	0x4e22	; 0x4e22 <__divmodsi4>
    22ae:	12 2f       	mov	r17, r18
    22b0:	08 c0       	rjmp	.+16     	; 0x22c2 <_Z18displayTemperaturev+0x86>
    22b2:	19 81       	ldd	r17, Y+1	; 0x01
    22b4:	8a 81       	ldd	r24, Y+2	; 0x02
    22b6:	20 e0       	ldi	r18, 0x00	; 0
    22b8:	87 ff       	sbrs	r24, 7
    22ba:	2a c0       	rjmp	.+84     	; 0x2310 <_Z18displayTemperaturev+0xd4>
    22bc:	21 e0       	ldi	r18, 0x01	; 1
    22be:	1f 37       	cpi	r17, 0x7F	; 127
    22c0:	39 f5       	brne	.+78     	; 0x2310 <_Z18displayTemperaturev+0xd4>
    22c2:	81 2f       	mov	r24, r17
    22c4:	6a e0       	ldi	r22, 0x0A	; 10
    22c6:	0e 94 dd 26 	call	0x4dba	; 0x4dba <__divmodqi4>
    22ca:	09 2f       	mov	r16, r25
    22cc:	68 2f       	mov	r22, r24
    22ce:	80 e0       	ldi	r24, 0x00	; 0
    22d0:	c1 d9       	rcall	.-3198   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    22d2:	17 ff       	sbrs	r17, 7
    22d4:	08 c0       	rjmp	.+16     	; 0x22e6 <_Z18displayTemperaturev+0xaa>
    22d6:	ed e7       	ldi	r30, 0x7D	; 125
    22d8:	f0 e0       	ldi	r31, 0x00	; 0
    22da:	e4 91       	lpm	r30, Z
    22dc:	e0 93 a1 04 	sts	0x04A1, r30	; 0x8004a1 <_ZN7Display6DIGITSE>
    22e0:	17 3f       	cpi	r17, 0xF7	; 247
    22e2:	0c f4       	brge	.+2      	; 0x22e6 <_Z18displayTemperaturev+0xaa>
    22e4:	07 ef       	ldi	r16, 0xF7	; 247
    22e6:	60 2f       	mov	r22, r16
    22e8:	81 e0       	ldi	r24, 0x01	; 1
    22ea:	b4 d9       	rcall	.-3224   	; 0x1654 <_ZN7Display19setSymbolOnNumitronEhh>
    22ec:	ec e7       	ldi	r30, 0x7C	; 124
    22ee:	f0 e0       	ldi	r31, 0x00	; 0
    22f0:	e4 91       	lpm	r30, Z
    22f2:	e0 93 a3 04 	sts	0x04A3, r30	; 0x8004a3 <_ZN7Display6DIGITSE+0x2>
    22f6:	ee e7       	ldi	r30, 0x7E	; 126
    22f8:	f0 e0       	ldi	r31, 0x00	; 0
    22fa:	e4 91       	lpm	r30, Z
    22fc:	e0 93 a4 04 	sts	0x04A4, r30	; 0x8004a4 <_ZN7Display6DIGITSE+0x3>
    2300:	0c d9       	rcall	.-3560   	; 0x151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>
    2302:	0f 90       	pop	r0
    2304:	0f 90       	pop	r0
    2306:	df 91       	pop	r29
    2308:	cf 91       	pop	r28
    230a:	1f 91       	pop	r17
    230c:	0f 91       	pop	r16
    230e:	08 95       	ret
    2310:	12 0f       	add	r17, r18
    2312:	d7 cf       	rjmp	.-82     	; 0x22c2 <_Z18displayTemperaturev+0x86>

00002314 <_Z33updateTimeCountersFromTimeSourcesv>:
    2314:	ff 92       	push	r15
    2316:	0f 93       	push	r16
    2318:	1f 93       	push	r17
    231a:	cf 93       	push	r28
    231c:	df 93       	push	r29
    231e:	cd b7       	in	r28, 0x3d	; 61
    2320:	de b7       	in	r29, 0x3e	; 62
    2322:	2a 97       	sbiw	r28, 0x0a	; 10
    2324:	0f b6       	in	r0, 0x3f	; 63
    2326:	f8 94       	cli
    2328:	de bf       	out	0x3e, r29	; 62
    232a:	0f be       	out	0x3f, r0	; 63
    232c:	cd bf       	out	0x3d, r28	; 61
    232e:	00 91 4f 03 	lds	r16, 0x034F	; 0x80034f <t_counter_hours>
    2332:	10 91 50 03 	lds	r17, 0x0350	; 0x800350 <t_counter_minutes>
    2336:	80 91 53 03 	lds	r24, 0x0353	; 0x800353 <_ZN7ModulesL8_MODULESE>
    233a:	80 ff       	sbrs	r24, 0
    233c:	30 c0       	rjmp	.+96     	; 0x239e <_Z33updateTimeCountersFromTimeSourcesv+0x8a>
    233e:	42 e0       	ldi	r20, 0x02	; 2
    2340:	be 01       	movw	r22, r28
    2342:	6f 5f       	subi	r22, 0xFF	; 255
    2344:	7f 4f       	sbci	r23, 0xFF	; 255
    2346:	81 e0       	ldi	r24, 0x01	; 1
    2348:	f1 dc       	rcall	.-1566   	; 0x1d2c <_ZN7Modules6DS3231L13readRegistersEhPhh>
    234a:	88 23       	and	r24, r24
    234c:	91 f0       	breq	.+36     	; 0x2372 <_Z33updateTimeCountersFromTimeSourcesv+0x5e>
    234e:	89 81       	ldd	r24, Y+1	; 0x01
    2350:	8f 77       	andi	r24, 0x7F	; 127
    2352:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    2356:	f8 2e       	mov	r15, r24
    2358:	8a 81       	ldd	r24, Y+2	; 0x02
    235a:	8f 73       	andi	r24, 0x3F	; 63
    235c:	0e 94 1a 03 	call	0x634	; 0x634 <_ZN7Modules6DS3231L8bcdToDecEh>
    2360:	9b e3       	ldi	r25, 0x3B	; 59
    2362:	9f 15       	cp	r25, r15
    2364:	30 f0       	brcs	.+12     	; 0x2372 <_Z33updateTimeCountersFromTimeSourcesv+0x5e>
    2366:	88 31       	cpi	r24, 0x18	; 24
    2368:	20 f4       	brcc	.+8      	; 0x2372 <_Z33updateTimeCountersFromTimeSourcesv+0x5e>
    236a:	f0 92 50 03 	sts	0x0350, r15	; 0x800350 <t_counter_minutes>
    236e:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <t_counter_hours>
    2372:	80 91 4f 03 	lds	r24, 0x034F	; 0x80034f <t_counter_hours>
    2376:	80 13       	cpse	r24, r16
    2378:	55 c0       	rjmp	.+170    	; 0x2424 <_Z33updateTimeCountersFromTimeSourcesv+0x110>
    237a:	81 e0       	ldi	r24, 0x01	; 1
    237c:	90 91 50 03 	lds	r25, 0x0350	; 0x800350 <t_counter_minutes>
    2380:	91 13       	cpse	r25, r17
    2382:	01 c0       	rjmp	.+2      	; 0x2386 <_Z33updateTimeCountersFromTimeSourcesv+0x72>
    2384:	80 e0       	ldi	r24, 0x00	; 0
    2386:	2a 96       	adiw	r28, 0x0a	; 10
    2388:	0f b6       	in	r0, 0x3f	; 63
    238a:	f8 94       	cli
    238c:	de bf       	out	0x3e, r29	; 62
    238e:	0f be       	out	0x3f, r0	; 63
    2390:	cd bf       	out	0x3d, r28	; 61
    2392:	df 91       	pop	r29
    2394:	cf 91       	pop	r28
    2396:	1f 91       	pop	r17
    2398:	0f 91       	pop	r16
    239a:	ff 90       	pop	r15
    239c:	08 95       	ret
    239e:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    23a2:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    23a6:	89 2b       	or	r24, r25
    23a8:	f9 f0       	breq	.+62     	; 0x23e8 <_Z33updateTimeCountersFromTimeSourcesv+0xd4>
    23aa:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    23ae:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    23b2:	01 97       	sbiw	r24, 0x01	; 1
    23b4:	c9 f0       	breq	.+50     	; 0x23e8 <_Z33updateTimeCountersFromTimeSourcesv+0xd4>
    23b6:	ce 01       	movw	r24, r28
    23b8:	01 96       	adiw	r24, 0x01	; 1
    23ba:	0e 94 cd 06 	call	0xd9a	; 0xd9a <_ZN11DCF77_Clock17read_current_timeERN5Clock6time_tE>
    23be:	8d 81       	ldd	r24, Y+5	; 0x05
    23c0:	28 2f       	mov	r18, r24
    23c2:	22 95       	swap	r18
    23c4:	2f 70       	andi	r18, 0x0F	; 15
    23c6:	9a e0       	ldi	r25, 0x0A	; 10
    23c8:	8f 70       	andi	r24, 0x0F	; 15
    23ca:	29 9f       	mul	r18, r25
    23cc:	80 0d       	add	r24, r0
    23ce:	11 24       	eor	r1, r1
    23d0:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <t_counter_hours>
    23d4:	8e 81       	ldd	r24, Y+6	; 0x06
    23d6:	28 2f       	mov	r18, r24
    23d8:	22 95       	swap	r18
    23da:	2f 70       	andi	r18, 0x0F	; 15
    23dc:	8f 70       	andi	r24, 0x0F	; 15
    23de:	29 9f       	mul	r18, r25
    23e0:	80 0d       	add	r24, r0
    23e2:	11 24       	eor	r1, r1
    23e4:	80 93 50 03 	sts	0x0350, r24	; 0x800350 <t_counter_minutes>
    23e8:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    23ec:	81 ff       	sbrs	r24, 1
    23ee:	c1 cf       	rjmp	.-126    	; 0x2372 <_Z33updateTimeCountersFromTimeSourcesv+0x5e>
    23f0:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    23f4:	8f 5f       	subi	r24, 0xFF	; 255
    23f6:	8c 33       	cpi	r24, 0x3C	; 60
    23f8:	40 f4       	brcc	.+16     	; 0x240a <_Z33updateTimeCountersFromTimeSourcesv+0xf6>
    23fa:	80 93 50 03 	sts	0x0350, r24	; 0x800350 <t_counter_minutes>
    23fe:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    2402:	8d 7f       	andi	r24, 0xFD	; 253
    2404:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    2408:	b4 cf       	rjmp	.-152    	; 0x2372 <_Z33updateTimeCountersFromTimeSourcesv+0x5e>
    240a:	80 91 4f 03 	lds	r24, 0x034F	; 0x80034f <t_counter_hours>
    240e:	10 92 50 03 	sts	0x0350, r1	; 0x800350 <t_counter_minutes>
    2412:	8f 5f       	subi	r24, 0xFF	; 255
    2414:	88 31       	cpi	r24, 0x18	; 24
    2416:	18 f4       	brcc	.+6      	; 0x241e <_Z33updateTimeCountersFromTimeSourcesv+0x10a>
    2418:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <t_counter_hours>
    241c:	f0 cf       	rjmp	.-32     	; 0x23fe <_Z33updateTimeCountersFromTimeSourcesv+0xea>
    241e:	10 92 4f 03 	sts	0x034F, r1	; 0x80034f <t_counter_hours>
    2422:	ed cf       	rjmp	.-38     	; 0x23fe <_Z33updateTimeCountersFromTimeSourcesv+0xea>
    2424:	81 e0       	ldi	r24, 0x01	; 1
    2426:	af cf       	rjmp	.-162    	; 0x2386 <_Z33updateTimeCountersFromTimeSourcesv+0x72>

00002428 <_Z10timeLoadFnhh>:
    2428:	1f 93       	push	r17
    242a:	cf 93       	push	r28
    242c:	df 93       	push	r29
    242e:	d8 2f       	mov	r29, r24
    2430:	c6 2f       	mov	r28, r22
    2432:	61 11       	cpse	r22, r1
    2434:	1a c0       	rjmp	.+52     	; 0x246a <_Z10timeLoadFnhh+0x42>
    2436:	6e df       	rcall	.-292    	; 0x2314 <_Z33updateTimeCountersFromTimeSourcesv>
    2438:	dd 0f       	add	r29, r29
    243a:	dd 0f       	add	r29, r29
    243c:	1a e0       	ldi	r17, 0x0A	; 10
    243e:	90 91 4f 03 	lds	r25, 0x034F	; 0x80034f <t_counter_hours>
    2442:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    2446:	2e ef       	ldi	r18, 0xFE	; 254
    2448:	2c 0f       	add	r18, r28
    244a:	22 30       	cpi	r18, 0x02	; 2
    244c:	90 f0       	brcs	.+36     	; 0x2472 <_Z10timeLoadFnhh+0x4a>
    244e:	89 2f       	mov	r24, r25
    2450:	c1 11       	cpse	r28, r1
    2452:	13 c0       	rjmp	.+38     	; 0x247a <_Z10timeLoadFnhh+0x52>
    2454:	89 2f       	mov	r24, r25
    2456:	61 2f       	mov	r22, r17
    2458:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    245c:	68 2f       	mov	r22, r24
    245e:	8d 2f       	mov	r24, r29
    2460:	8c 0f       	add	r24, r28
    2462:	d1 d9       	rcall	.-3166   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    2464:	cf 5f       	subi	r28, 0xFF	; 255
    2466:	c4 30       	cpi	r28, 0x04	; 4
    2468:	51 f7       	brne	.-44     	; 0x243e <_Z10timeLoadFnhh+0x16>
    246a:	df 91       	pop	r29
    246c:	cf 91       	pop	r28
    246e:	1f 91       	pop	r17
    2470:	08 95       	ret
    2472:	c2 30       	cpi	r28, 0x02	; 2
    2474:	11 f4       	brne	.+4      	; 0x247a <_Z10timeLoadFnhh+0x52>
    2476:	98 2f       	mov	r25, r24
    2478:	ed cf       	rjmp	.-38     	; 0x2454 <_Z10timeLoadFnhh+0x2c>
    247a:	61 2f       	mov	r22, r17
    247c:	0e 94 d1 26 	call	0x4da2	; 0x4da2 <__udivmodqi4>
    2480:	89 2f       	mov	r24, r25
    2482:	ec cf       	rjmp	.-40     	; 0x245c <_Z10timeLoadFnhh+0x34>

00002484 <_ZN7ModulesL15_DS3231_PresentEv>:
    2484:	88 e6       	ldi	r24, 0x68	; 104
    2486:	80 93 c6 04 	sts	0x04C6, r24	; 0x8004c6 <Wire>
    248a:	10 92 e7 04 	sts	0x04E7, r1	; 0x8004e7 <Wire+0x21>
    248e:	fc da       	rcall	.-2568   	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    2490:	91 e0       	ldi	r25, 0x01	; 1
    2492:	81 11       	cpse	r24, r1
    2494:	90 e0       	ldi	r25, 0x00	; 0
    2496:	89 2f       	mov	r24, r25
    2498:	08 95       	ret

0000249a <_stop>:
    249a:	85 ed       	ldi	r24, 0xD5	; 213
    249c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    24a0:	80 91 9d 04 	lds	r24, 0x049D	; 0x80049d <_timeout_us>
    24a4:	90 91 9e 04 	lds	r25, 0x049E	; 0x80049e <_timeout_us+0x1>
    24a8:	a0 91 9f 04 	lds	r26, 0x049F	; 0x80049f <_timeout_us+0x2>
    24ac:	b0 91 a0 04 	lds	r27, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    24b0:	89 2b       	or	r24, r25
    24b2:	8a 2b       	or	r24, r26
    24b4:	8b 2b       	or	r24, r27
    24b6:	c9 f0       	breq	.+50     	; 0x24ea <_stop+0x50>
    24b8:	80 91 9d 04 	lds	r24, 0x049D	; 0x80049d <_timeout_us>
    24bc:	90 91 9e 04 	lds	r25, 0x049E	; 0x80049e <_timeout_us+0x1>
    24c0:	a0 91 9f 04 	lds	r26, 0x049F	; 0x80049f <_timeout_us+0x2>
    24c4:	b0 91 a0 04 	lds	r27, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    24c8:	07 96       	adiw	r24, 0x07	; 7
    24ca:	a1 1d       	adc	r26, r1
    24cc:	b1 1d       	adc	r27, r1
    24ce:	23 e0       	ldi	r18, 0x03	; 3
    24d0:	b6 95       	lsr	r27
    24d2:	a7 95       	ror	r26
    24d4:	97 95       	ror	r25
    24d6:	87 95       	ror	r24
    24d8:	2a 95       	dec	r18
    24da:	d1 f7       	brne	.-12     	; 0x24d0 <_stop+0x36>
    24dc:	20 91 bc 00 	lds	r18, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    24e0:	24 fd       	sbrc	r18, 4
    24e2:	07 c0       	rjmp	.+14     	; 0x24f2 <_stop+0x58>
    24e4:	10 92 9c 04 	sts	0x049C, r1	; 0x80049c <_state>
    24e8:	08 95       	ret
    24ea:	8f ef       	ldi	r24, 0xFF	; 255
    24ec:	9f ef       	ldi	r25, 0xFF	; 255
    24ee:	dc 01       	movw	r26, r24
    24f0:	f5 cf       	rjmp	.-22     	; 0x24dc <_stop+0x42>
    24f2:	00 97       	sbiw	r24, 0x00	; 0
    24f4:	a1 05       	cpc	r26, r1
    24f6:	b1 05       	cpc	r27, r1
    24f8:	11 f4       	brne	.+4      	; 0x24fe <_stop+0x64>
    24fa:	0c 94 be 02 	jmp	0x57c	; 0x57c <_twi_handle_timeout>
    24fe:	2a e2       	ldi	r18, 0x2A	; 42
    2500:	2a 95       	dec	r18
    2502:	f1 f7       	brne	.-4      	; 0x2500 <_stop+0x66>
    2504:	00 c0       	rjmp	.+0      	; 0x2506 <_stop+0x6c>
    2506:	40 91 9d 04 	lds	r20, 0x049D	; 0x80049d <_timeout_us>
    250a:	50 91 9e 04 	lds	r21, 0x049E	; 0x80049e <_timeout_us+0x1>
    250e:	60 91 9f 04 	lds	r22, 0x049F	; 0x80049f <_timeout_us+0x2>
    2512:	70 91 a0 04 	lds	r23, 0x04A0	; 0x8004a0 <_timeout_us+0x3>
    2516:	45 2b       	or	r20, r21
    2518:	46 2b       	or	r20, r22
    251a:	47 2b       	or	r20, r23
    251c:	f9 f2       	breq	.-66     	; 0x24dc <_stop+0x42>
    251e:	01 97       	sbiw	r24, 0x01	; 1
    2520:	a1 09       	sbc	r26, r1
    2522:	b1 09       	sbc	r27, r1
    2524:	db cf       	rjmp	.-74     	; 0x24dc <_stop+0x42>

00002526 <_Z20onLeftButtonReleasedv>:
    2526:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    252a:	81 ff       	sbrs	r24, 1
    252c:	09 c0       	rjmp	.+18     	; 0x2540 <_Z20onLeftButtonReleasedv+0x1a>
    252e:	80 91 48 03 	lds	r24, 0x0348	; 0x800348 <_ZL14selected_digit>
    2532:	90 e0       	ldi	r25, 0x00	; 0
    2534:	01 96       	adiw	r24, 0x01	; 1
    2536:	83 70       	andi	r24, 0x03	; 3
    2538:	99 27       	eor	r25, r25
    253a:	80 93 48 03 	sts	0x0348, r24	; 0x800348 <_ZL14selected_digit>
    253e:	08 95       	ret
    2540:	80 91 44 01 	lds	r24, 0x0144	; 0x800144 <_ZN6ConfigL7entriesE+0x34>
    2544:	81 11       	cpse	r24, r1
    2546:	02 c0       	rjmp	.+4      	; 0x254c <_Z20onLeftButtonReleasedv+0x26>
    2548:	82 e0       	ldi	r24, 0x02	; 2
    254a:	e4 c8       	rjmp	.-3640   	; 0x1714 <_ZN7Display19incrementBrightnessEa>
    254c:	08 95       	ret

0000254e <_ZN6Config4loadENS_2IDE>:
    254e:	cf 93       	push	r28
    2550:	df 93       	push	r29
    2552:	28 2f       	mov	r18, r24
    2554:	30 e0       	ldi	r19, 0x00	; 0
    2556:	9d e0       	ldi	r25, 0x0D	; 13
    2558:	89 9f       	mul	r24, r25
    255a:	e0 01       	movw	r28, r0
    255c:	11 24       	eor	r1, r1
    255e:	c0 5f       	subi	r28, 0xF0	; 240
    2560:	de 4f       	sbci	r29, 0xFE	; 254
    2562:	eb 85       	ldd	r30, Y+11	; 0x0b
    2564:	fc 85       	ldd	r31, Y+12	; 0x0c
    2566:	30 97       	sbiw	r30, 0x00	; 0
    2568:	39 f0       	breq	.+14     	; 0x2578 <_ZN6Config4loadENS_2IDE+0x2a>
    256a:	68 2f       	mov	r22, r24
    256c:	63 70       	andi	r22, 0x03	; 3
    256e:	86 95       	lsr	r24
    2570:	86 95       	lsr	r24
    2572:	df 91       	pop	r29
    2574:	cf 91       	pop	r28
    2576:	09 94       	ijmp
    2578:	8e 81       	ldd	r24, Y+6	; 0x06
    257a:	88 23       	and	r24, r24
    257c:	51 f0       	breq	.+20     	; 0x2592 <_ZN6Config4loadENS_2IDE+0x44>
    257e:	c9 01       	movw	r24, r18
    2580:	0e 94 bb 26 	call	0x4d76	; 0x4d76 <eeprom_read_byte>
    2584:	99 81       	ldd	r25, Y+1	; 0x01
    2586:	89 17       	cp	r24, r25
    2588:	20 f0       	brcs	.+8      	; 0x2592 <_ZN6Config4loadENS_2IDE+0x44>
    258a:	9a 81       	ldd	r25, Y+2	; 0x02
    258c:	98 17       	cp	r25, r24
    258e:	08 f0       	brcs	.+2      	; 0x2592 <_ZN6Config4loadENS_2IDE+0x44>
    2590:	88 83       	st	Y, r24
    2592:	df 91       	pop	r29
    2594:	cf 91       	pop	r28
    2596:	08 95       	ret

00002598 <_ZN6Config11loadForPageEh>:
    2598:	cf 93       	push	r28
    259a:	df 93       	push	r29
    259c:	d8 2f       	mov	r29, r24
    259e:	dd 0f       	add	r29, r29
    25a0:	dd 0f       	add	r29, r29
    25a2:	c0 e0       	ldi	r28, 0x00	; 0
    25a4:	8d 2f       	mov	r24, r29
    25a6:	8c 0f       	add	r24, r28
    25a8:	d2 df       	rcall	.-92     	; 0x254e <_ZN6Config4loadENS_2IDE>
    25aa:	cf 5f       	subi	r28, 0xFF	; 255
    25ac:	c4 30       	cpi	r28, 0x04	; 4
    25ae:	d1 f7       	brne	.-12     	; 0x25a4 <_ZN6Config11loadForPageEh+0xc>
    25b0:	df 91       	pop	r29
    25b2:	cf 91       	pop	r28
    25b4:	08 95       	ret

000025b6 <_ZN6Config4saveENS_2IDE>:
    25b6:	1f 93       	push	r17
    25b8:	cf 93       	push	r28
    25ba:	df 93       	push	r29
    25bc:	c8 2f       	mov	r28, r24
    25be:	d0 e0       	ldi	r29, 0x00	; 0
    25c0:	9d e0       	ldi	r25, 0x0D	; 13
    25c2:	89 9f       	mul	r24, r25
    25c4:	d0 01       	movw	r26, r0
    25c6:	11 24       	eor	r1, r1
    25c8:	a0 5f       	subi	r26, 0xF0	; 240
    25ca:	be 4f       	sbci	r27, 0xFE	; 254
    25cc:	19 96       	adiw	r26, 0x09	; 9
    25ce:	ed 91       	ld	r30, X+
    25d0:	fc 91       	ld	r31, X
    25d2:	1a 97       	sbiw	r26, 0x0a	; 10
    25d4:	30 97       	sbiw	r30, 0x00	; 0
    25d6:	41 f0       	breq	.+16     	; 0x25e8 <_ZN6Config4saveENS_2IDE+0x32>
    25d8:	68 2f       	mov	r22, r24
    25da:	63 70       	andi	r22, 0x03	; 3
    25dc:	86 95       	lsr	r24
    25de:	86 95       	lsr	r24
    25e0:	df 91       	pop	r29
    25e2:	cf 91       	pop	r28
    25e4:	1f 91       	pop	r17
    25e6:	09 94       	ijmp
    25e8:	16 96       	adiw	r26, 0x06	; 6
    25ea:	8c 91       	ld	r24, X
    25ec:	16 97       	sbiw	r26, 0x06	; 6
    25ee:	88 23       	and	r24, r24
    25f0:	69 f0       	breq	.+26     	; 0x260c <_ZN6Config4saveENS_2IDE+0x56>
    25f2:	1c 91       	ld	r17, X
    25f4:	ce 01       	movw	r24, r28
    25f6:	0e 94 bb 26 	call	0x4d76	; 0x4d76 <eeprom_read_byte>
    25fa:	18 17       	cp	r17, r24
    25fc:	39 f0       	breq	.+14     	; 0x260c <_ZN6Config4saveENS_2IDE+0x56>
    25fe:	61 2f       	mov	r22, r17
    2600:	ce 01       	movw	r24, r28
    2602:	df 91       	pop	r29
    2604:	cf 91       	pop	r28
    2606:	1f 91       	pop	r17
    2608:	0c 94 c3 26 	jmp	0x4d86	; 0x4d86 <eeprom_write_byte>
    260c:	df 91       	pop	r29
    260e:	cf 91       	pop	r28
    2610:	1f 91       	pop	r17
    2612:	08 95       	ret

00002614 <_ZN6TimersL23_saveCurrentTimerFromUIEv>:
    2614:	cf 93       	push	r28
    2616:	c0 91 62 02 	lds	r28, 0x0262	; 0x800262 <_ZN6ConfigL7entriesE+0x152>
    261a:	80 91 48 02 	lds	r24, 0x0248	; 0x800248 <_ZN6ConfigL7entriesE+0x138>
    261e:	60 91 55 02 	lds	r22, 0x0255	; 0x800255 <_ZN6ConfigL7entriesE+0x145>
    2622:	9a e0       	ldi	r25, 0x0A	; 10
    2624:	89 9f       	mul	r24, r25
    2626:	60 0d       	add	r22, r0
    2628:	11 24       	eor	r1, r1
    262a:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    262e:	82 5f       	subi	r24, 0xF2	; 242
    2630:	88 0f       	add	r24, r24
    2632:	e9 d8       	rcall	.-3630   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    2634:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    2638:	88 0f       	add	r24, r24
    263a:	6c 2f       	mov	r22, r28
    263c:	83 5e       	subi	r24, 0xE3	; 227
    263e:	e3 d8       	rcall	.-3642   	; 0x1806 <_ZN6Config3setENS_2IDEh>
    2640:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    2644:	82 5f       	subi	r24, 0xF2	; 242
    2646:	88 0f       	add	r24, r24
    2648:	b6 df       	rcall	.-148    	; 0x25b6 <_ZN6Config4saveENS_2IDE>
    264a:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    264e:	88 0f       	add	r24, r24
    2650:	83 5e       	subi	r24, 0xE3	; 227
    2652:	cf 91       	pop	r28
    2654:	b0 cf       	rjmp	.-160    	; 0x25b6 <_ZN6Config4saveENS_2IDE>

00002656 <_ZN6TimersL16_timerPageSaveFnEhh>:
    2656:	61 11       	cpse	r22, r1
    2658:	01 c0       	rjmp	.+2      	; 0x265c <_ZN6TimersL16_timerPageSaveFnEhh+0x6>
    265a:	dc cf       	rjmp	.-72     	; 0x2614 <_ZN6TimersL23_saveCurrentTimerFromUIEv>
    265c:	08 95       	ret

0000265e <_ZN6TimersL14_onTimerNumSetEhh>:
    265e:	cf 93       	push	r28
    2660:	c0 91 6f 02 	lds	r28, 0x026F	; 0x80026f <_ZN6ConfigL7entriesE+0x15f>
    2664:	80 91 75 03 	lds	r24, 0x0375	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    2668:	8c 17       	cp	r24, r28
    266a:	31 f0       	breq	.+12     	; 0x2678 <_ZN6TimersL14_onTimerNumSetEhh+0x1a>
    266c:	d3 df       	rcall	.-90     	; 0x2614 <_ZN6TimersL23_saveCurrentTimerFromUIEv>
    266e:	c0 93 75 03 	sts	0x0375, r28	; 0x800375 <_ZN6TimersL15_ui_timer_indexE>
    2672:	8c 2f       	mov	r24, r28
    2674:	cf 91       	pop	r28
    2676:	f8 c8       	rjmp	.-3600   	; 0x1868 <_ZN6TimersL14_loadTimerToUIEh>
    2678:	cf 91       	pop	r28
    267a:	08 95       	ret

0000267c <_ZN6Config11saveForPageEh>:
    267c:	cf 93       	push	r28
    267e:	df 93       	push	r29
    2680:	d8 2f       	mov	r29, r24
    2682:	dd 0f       	add	r29, r29
    2684:	dd 0f       	add	r29, r29
    2686:	c0 e0       	ldi	r28, 0x00	; 0
    2688:	8d 2f       	mov	r24, r29
    268a:	8c 0f       	add	r24, r28
    268c:	94 df       	rcall	.-216    	; 0x25b6 <_ZN6Config4saveENS_2IDE>
    268e:	cf 5f       	subi	r28, 0xFF	; 255
    2690:	c4 30       	cpi	r28, 0x04	; 4
    2692:	d1 f7       	brne	.-12     	; 0x2688 <_ZN6Config11saveForPageEh+0xc>
    2694:	df 91       	pop	r29
    2696:	cf 91       	pop	r28
    2698:	08 95       	ret

0000269a <_Z12exitEditModev>:
    269a:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    269e:	8d 7f       	andi	r24, 0xFD	; 253
    26a0:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    26a4:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    26a8:	e9 df       	rcall	.-46     	; 0x267c <_ZN6Config11saveForPageEh>
    26aa:	10 92 4d 03 	sts	0x034D, r1	; 0x80034d <_ZL14cur_page_index>
    26ae:	8f b7       	in	r24, 0x3f	; 63
    26b0:	f8 94       	cli
    26b2:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    26b6:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    26ba:	8f bf       	out	0x3f, r24	; 63
    26bc:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    26c0:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    26c4:	0c 94 d0 0a 	jmp	0x15a0	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>

000026c8 <__vector_24>:
    26c8:	1f 92       	push	r1
    26ca:	0f 92       	push	r0
    26cc:	0f b6       	in	r0, 0x3f	; 63
    26ce:	0f 92       	push	r0
    26d0:	11 24       	eor	r1, r1
    26d2:	2f 93       	push	r18
    26d4:	3f 93       	push	r19
    26d6:	4f 93       	push	r20
    26d8:	5f 93       	push	r21
    26da:	6f 93       	push	r22
    26dc:	7f 93       	push	r23
    26de:	8f 93       	push	r24
    26e0:	9f 93       	push	r25
    26e2:	af 93       	push	r26
    26e4:	bf 93       	push	r27
    26e6:	ef 93       	push	r30
    26e8:	ff 93       	push	r31
    26ea:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__TEXT_REGION_LENGTH__+0x7e00b9>
    26ee:	88 7f       	andi	r24, 0xF8	; 248
    26f0:	88 32       	cpi	r24, 0x28	; 40
    26f2:	09 f4       	brne	.+2      	; 0x26f6 <__vector_24+0x2e>
    26f4:	3e c0       	rjmp	.+124    	; 0x2772 <__vector_24+0xaa>
    26f6:	00 f5       	brcc	.+64     	; 0x2738 <__vector_24+0x70>
    26f8:	80 31       	cpi	r24, 0x10	; 16
    26fa:	a9 f1       	breq	.+106    	; 0x2766 <__vector_24+0x9e>
    26fc:	b0 f4       	brcc	.+44     	; 0x272a <__vector_24+0x62>
    26fe:	88 23       	and	r24, r24
    2700:	09 f4       	brne	.+2      	; 0x2704 <__vector_24+0x3c>
    2702:	73 c0       	rjmp	.+230    	; 0x27ea <__vector_24+0x122>
    2704:	88 30       	cpi	r24, 0x08	; 8
    2706:	79 f1       	breq	.+94     	; 0x2766 <__vector_24+0x9e>
    2708:	ff 91       	pop	r31
    270a:	ef 91       	pop	r30
    270c:	bf 91       	pop	r27
    270e:	af 91       	pop	r26
    2710:	9f 91       	pop	r25
    2712:	8f 91       	pop	r24
    2714:	7f 91       	pop	r23
    2716:	6f 91       	pop	r22
    2718:	5f 91       	pop	r21
    271a:	4f 91       	pop	r20
    271c:	3f 91       	pop	r19
    271e:	2f 91       	pop	r18
    2720:	0f 90       	pop	r0
    2722:	0f be       	out	0x3f, r0	; 63
    2724:	0f 90       	pop	r0
    2726:	1f 90       	pop	r1
    2728:	18 95       	reti
    272a:	88 31       	cpi	r24, 0x18	; 24
    272c:	11 f1       	breq	.+68     	; 0x2772 <__vector_24+0xaa>
    272e:	80 32       	cpi	r24, 0x20	; 32
    2730:	59 f7       	brne	.-42     	; 0x2708 <__vector_24+0x40>
    2732:	80 93 9a 04 	sts	0x049A, r24	; 0x80049a <_error>
    2736:	15 c0       	rjmp	.+42     	; 0x2762 <__vector_24+0x9a>
    2738:	80 34       	cpi	r24, 0x40	; 64
    273a:	c1 f1       	breq	.+112    	; 0x27ac <__vector_24+0xe4>
    273c:	60 f4       	brcc	.+24     	; 0x2756 <__vector_24+0x8e>
    273e:	80 33       	cpi	r24, 0x30	; 48
    2740:	c1 f3       	breq	.-16     	; 0x2732 <__vector_24+0x6a>
    2742:	88 33       	cpi	r24, 0x38	; 56
    2744:	09 f7       	brne	.-62     	; 0x2708 <__vector_24+0x40>
    2746:	80 93 9a 04 	sts	0x049A, r24	; 0x80049a <_error>
    274a:	85 ec       	ldi	r24, 0xC5	; 197
    274c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2750:	10 92 9c 04 	sts	0x049C, r1	; 0x80049c <_state>
    2754:	d9 cf       	rjmp	.-78     	; 0x2708 <__vector_24+0x40>
    2756:	80 35       	cpi	r24, 0x50	; 80
    2758:	e9 f0       	breq	.+58     	; 0x2794 <__vector_24+0xcc>
    275a:	88 35       	cpi	r24, 0x58	; 88
    275c:	89 f1       	breq	.+98     	; 0x27c0 <__vector_24+0xf8>
    275e:	88 34       	cpi	r24, 0x48	; 72
    2760:	99 f6       	brne	.-90     	; 0x2708 <__vector_24+0x40>
    2762:	9b de       	rcall	.-714    	; 0x249a <_stop>
    2764:	d1 cf       	rjmp	.-94     	; 0x2708 <__vector_24+0x40>
    2766:	80 91 97 04 	lds	r24, 0x0497	; 0x800497 <_slarw>
    276a:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    276e:	85 ec       	ldi	r24, 0xC5	; 197
    2770:	24 c0       	rjmp	.+72     	; 0x27ba <__vector_24+0xf2>
    2772:	90 91 99 04 	lds	r25, 0x0499	; 0x800499 <_buf_idx>
    2776:	80 91 98 04 	lds	r24, 0x0498	; 0x800498 <_buf_len>
    277a:	98 17       	cp	r25, r24
    277c:	68 f5       	brcc	.+90     	; 0x27d8 <__vector_24+0x110>
    277e:	e0 91 99 04 	lds	r30, 0x0499	; 0x800499 <_buf_idx>
    2782:	81 e0       	ldi	r24, 0x01	; 1
    2784:	8e 0f       	add	r24, r30
    2786:	80 93 99 04 	sts	0x0499, r24	; 0x800499 <_buf_idx>
    278a:	f0 e0       	ldi	r31, 0x00	; 0
    278c:	ea 58       	subi	r30, 0x8A	; 138
    278e:	fb 4f       	sbci	r31, 0xFB	; 251
    2790:	80 81       	ld	r24, Z
    2792:	eb cf       	rjmp	.-42     	; 0x276a <__vector_24+0xa2>
    2794:	e0 91 99 04 	lds	r30, 0x0499	; 0x800499 <_buf_idx>
    2798:	81 e0       	ldi	r24, 0x01	; 1
    279a:	8e 0f       	add	r24, r30
    279c:	80 93 99 04 	sts	0x0499, r24	; 0x800499 <_buf_idx>
    27a0:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    27a4:	f0 e0       	ldi	r31, 0x00	; 0
    27a6:	ea 58       	subi	r30, 0x8A	; 138
    27a8:	fb 4f       	sbci	r31, 0xFB	; 251
    27aa:	80 83       	st	Z, r24
    27ac:	90 91 99 04 	lds	r25, 0x0499	; 0x800499 <_buf_idx>
    27b0:	80 91 98 04 	lds	r24, 0x0498	; 0x800498 <_buf_len>
    27b4:	98 17       	cp	r25, r24
    27b6:	d8 f2       	brcs	.-74     	; 0x276e <__vector_24+0xa6>
    27b8:	85 e8       	ldi	r24, 0x85	; 133
    27ba:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    27be:	a4 cf       	rjmp	.-184    	; 0x2708 <__vector_24+0x40>
    27c0:	e0 91 99 04 	lds	r30, 0x0499	; 0x800499 <_buf_idx>
    27c4:	81 e0       	ldi	r24, 0x01	; 1
    27c6:	8e 0f       	add	r24, r30
    27c8:	80 93 99 04 	sts	0x0499, r24	; 0x800499 <_buf_idx>
    27cc:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    27d0:	f0 e0       	ldi	r31, 0x00	; 0
    27d2:	ea 58       	subi	r30, 0x8A	; 138
    27d4:	fb 4f       	sbci	r31, 0xFB	; 251
    27d6:	80 83       	st	Z, r24
    27d8:	80 91 9b 04 	lds	r24, 0x049B	; 0x80049b <_send_stop>
    27dc:	81 11       	cpse	r24, r1
    27de:	c1 cf       	rjmp	.-126    	; 0x2762 <__vector_24+0x9a>
    27e0:	81 e0       	ldi	r24, 0x01	; 1
    27e2:	80 93 96 04 	sts	0x0496, r24	; 0x800496 <_rep_start>
    27e6:	84 ea       	ldi	r24, 0xA4	; 164
    27e8:	b1 cf       	rjmp	.-158    	; 0x274c <__vector_24+0x84>
    27ea:	10 92 9a 04 	sts	0x049A, r1	; 0x80049a <_error>
    27ee:	b9 cf       	rjmp	.-142    	; 0x2762 <__vector_24+0x9a>

000027f0 <__vector_1>:
    27f0:	1f 92       	push	r1
    27f2:	0f 92       	push	r0
    27f4:	0f b6       	in	r0, 0x3f	; 63
    27f6:	0f 92       	push	r0
    27f8:	11 24       	eor	r1, r1
    27fa:	0f 90       	pop	r0
    27fc:	0f be       	out	0x3f, r0	; 63
    27fe:	0f 90       	pop	r0
    2800:	1f 90       	pop	r1
    2802:	18 95       	reti

00002804 <__vector_2>:
    2804:	1f 92       	push	r1
    2806:	0f 92       	push	r0
    2808:	0f b6       	in	r0, 0x3f	; 63
    280a:	0f 92       	push	r0
    280c:	11 24       	eor	r1, r1
    280e:	0f 90       	pop	r0
    2810:	0f be       	out	0x3f, r0	; 63
    2812:	0f 90       	pop	r0
    2814:	1f 90       	pop	r1
    2816:	18 95       	reti

00002818 <__vector_7>:
    2818:	1f 92       	push	r1
    281a:	0f 92       	push	r0
    281c:	0f b6       	in	r0, 0x3f	; 63
    281e:	0f 92       	push	r0
    2820:	11 24       	eor	r1, r1
    2822:	8f 92       	push	r8
    2824:	9f 92       	push	r9
    2826:	af 92       	push	r10
    2828:	bf 92       	push	r11
    282a:	cf 92       	push	r12
    282c:	df 92       	push	r13
    282e:	ef 92       	push	r14
    2830:	ff 92       	push	r15
    2832:	0f 93       	push	r16
    2834:	1f 93       	push	r17
    2836:	2f 93       	push	r18
    2838:	3f 93       	push	r19
    283a:	4f 93       	push	r20
    283c:	5f 93       	push	r21
    283e:	6f 93       	push	r22
    2840:	7f 93       	push	r23
    2842:	8f 93       	push	r24
    2844:	9f 93       	push	r25
    2846:	af 93       	push	r26
    2848:	bf 93       	push	r27
    284a:	ef 93       	push	r30
    284c:	ff 93       	push	r31
    284e:	cf 93       	push	r28
    2850:	df 93       	push	r29
    2852:	cd b7       	in	r28, 0x3d	; 61
    2854:	de b7       	in	r29, 0x3e	; 62
    2856:	68 97       	sbiw	r28, 0x18	; 24
    2858:	de bf       	out	0x3e, r29	; 62
    285a:	cd bf       	out	0x3d, r28	; 61
    285c:	80 91 54 03 	lds	r24, 0x0354	; 0x800354 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    2860:	90 91 55 03 	lds	r25, 0x0355	; 0x800355 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    2864:	09 2e       	mov	r0, r25
    2866:	00 0c       	add	r0, r0
    2868:	aa 0b       	sbc	r26, r26
    286a:	bb 0b       	sbc	r27, r27
    286c:	40 91 17 03 	lds	r20, 0x0317	; 0x800317 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2870:	50 91 18 03 	lds	r21, 0x0318	; 0x800318 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    2874:	60 91 19 03 	lds	r22, 0x0319	; 0x800319 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2878:	70 91 1a 03 	lds	r23, 0x031A	; 0x80031a <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    287c:	84 0f       	add	r24, r20
    287e:	95 1f       	adc	r25, r21
    2880:	a6 1f       	adc	r26, r22
    2882:	b7 1f       	adc	r27, r23
    2884:	80 93 17 03 	sts	0x0317, r24	; 0x800317 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2888:	90 93 18 03 	sts	0x0318, r25	; 0x800318 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    288c:	a0 93 19 03 	sts	0x0319, r26	; 0x800319 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2890:	b0 93 1a 03 	sts	0x031A, r27	; 0x80031a <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2894:	81 15       	cp	r24, r1
    2896:	2a ef       	ldi	r18, 0xFA	; 250
    2898:	92 07       	cpc	r25, r18
    289a:	a1 05       	cpc	r26, r1
    289c:	b1 05       	cpc	r27, r1
    289e:	0c f4       	brge	.+2      	; 0x28a2 <__vector_7+0x8a>
    28a0:	4f c0       	rjmp	.+158    	; 0x2940 <__vector_7+0x128>
    28a2:	9a 5f       	subi	r25, 0xFA	; 250
    28a4:	a1 09       	sbc	r26, r1
    28a6:	b1 09       	sbc	r27, r1
    28a8:	80 93 17 03 	sts	0x0317, r24	; 0x800317 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    28ac:	90 93 18 03 	sts	0x0318, r25	; 0x800318 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    28b0:	a0 93 19 03 	sts	0x0319, r26	; 0x800319 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    28b4:	b0 93 1a 03 	sts	0x031A, r27	; 0x80031a <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    28b8:	88 ef       	ldi	r24, 0xF8	; 248
    28ba:	80 93 b3 00 	sts	0x00B3, r24	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
    28be:	e0 91 05 01 	lds	r30, 0x0105	; 0x800105 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE>
    28c2:	f0 91 06 01 	lds	r31, 0x0106	; 0x800106 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE+0x1>
    28c6:	09 95       	icall
    28c8:	20 91 ef 05 	lds	r18, 0x05EF	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    28cc:	28 0f       	add	r18, r24
    28ce:	20 93 ef 05 	sts	0x05EF, r18	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    28d2:	90 91 ee 05 	lds	r25, 0x05EE	; 0x8005ee <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    28d6:	94 30       	cpi	r25, 0x04	; 4
    28d8:	19 f4       	brne	.+6      	; 0x28e0 <__vector_7+0xc8>
    28da:	82 0f       	add	r24, r18
    28dc:	80 93 ef 05 	sts	0x05EF, r24	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    28e0:	9f 5f       	subi	r25, 0xFF	; 255
    28e2:	90 93 ee 05 	sts	0x05EE, r25	; 0x8005ee <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    28e6:	9a 30       	cpi	r25, 0x0A	; 10
    28e8:	08 f4       	brcc	.+2      	; 0x28ec <__vector_7+0xd4>
    28ea:	d7 c1       	rjmp	.+942    	; 0x2c9a <__vector_7+0x482>
    28ec:	f0 90 ef 05 	lds	r15, 0x05EF	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    28f0:	80 91 d2 05 	lds	r24, 0x05D2	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    28f4:	83 36       	cpi	r24, 0x63	; 99
    28f6:	c8 f5       	brcc	.+114    	; 0x296a <__vector_7+0x152>
    28f8:	8f 5f       	subi	r24, 0xFF	; 255
    28fa:	80 93 d2 05 	sts	0x05D2, r24	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    28fe:	e0 90 d2 05 	lds	r14, 0x05D2	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    2902:	2e 2d       	mov	r18, r14
    2904:	30 e0       	ldi	r19, 0x00	; 0
    2906:	a9 01       	movw	r20, r18
    2908:	44 0f       	add	r20, r20
    290a:	55 1f       	adc	r21, r21
    290c:	fa 01       	movw	r30, r20
    290e:	e6 5f       	subi	r30, 0xF6	; 246
    2910:	fa 4f       	sbci	r31, 0xFA	; 250
    2912:	80 81       	ld	r24, Z
    2914:	91 81       	ldd	r25, Z+1	; 0x01
    2916:	60 91 dc 05 	lds	r22, 0x05DC	; 0x8005dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    291a:	70 91 dd 05 	lds	r23, 0x05DD	; 0x8005dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    291e:	68 17       	cp	r22, r24
    2920:	79 07       	cpc	r23, r25
    2922:	30 f5       	brcc	.+76     	; 0x2970 <__vector_7+0x158>
    2924:	71 83       	std	Z+1, r23	; 0x01
    2926:	60 83       	st	Z, r22
    2928:	85 e0       	ldi	r24, 0x05	; 5
    292a:	8f 15       	cp	r24, r15
    292c:	58 f5       	brcc	.+86     	; 0x2984 <__vector_7+0x16c>
    292e:	f9 01       	movw	r30, r18
    2930:	e0 5b       	subi	r30, 0xB0	; 176
    2932:	ff 4f       	sbci	r31, 0xFF	; 255
    2934:	e4 36       	cpi	r30, 0x64	; 100
    2936:	f1 05       	cpc	r31, r1
    2938:	70 f1       	brcs	.+92     	; 0x2996 <__vector_7+0x17e>
    293a:	e4 56       	subi	r30, 0x64	; 100
    293c:	f1 09       	sbc	r31, r1
    293e:	fa cf       	rjmp	.-12     	; 0x2934 <__vector_7+0x11c>
    2940:	81 30       	cpi	r24, 0x01	; 1
    2942:	36 e0       	ldi	r19, 0x06	; 6
    2944:	93 07       	cpc	r25, r19
    2946:	a1 05       	cpc	r26, r1
    2948:	b1 05       	cpc	r27, r1
    294a:	6c f4       	brge	.+26     	; 0x2966 <__vector_7+0x14e>
    294c:	96 50       	subi	r25, 0x06	; 6
    294e:	af 4f       	sbci	r26, 0xFF	; 255
    2950:	bf 4f       	sbci	r27, 0xFF	; 255
    2952:	80 93 17 03 	sts	0x0317, r24	; 0x800317 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2956:	90 93 18 03 	sts	0x0318, r25	; 0x800318 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    295a:	a0 93 19 03 	sts	0x0319, r26	; 0x800319 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    295e:	b0 93 1a 03 	sts	0x031A, r27	; 0x80031a <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2962:	8a ef       	ldi	r24, 0xFA	; 250
    2964:	aa cf       	rjmp	.-172    	; 0x28ba <__vector_7+0xa2>
    2966:	89 ef       	ldi	r24, 0xF9	; 249
    2968:	a8 cf       	rjmp	.-176    	; 0x28ba <__vector_7+0xa2>
    296a:	10 92 d2 05 	sts	0x05D2, r1	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    296e:	c7 cf       	rjmp	.-114    	; 0x28fe <__vector_7+0xe6>
    2970:	a5 e0       	ldi	r26, 0x05	; 5
    2972:	af 15       	cp	r26, r15
    2974:	38 f4       	brcc	.+14     	; 0x2984 <__vector_7+0x16c>
    2976:	86 17       	cp	r24, r22
    2978:	97 07       	cpc	r25, r23
    297a:	c8 f6       	brcc	.-78     	; 0x292e <__vector_7+0x116>
    297c:	01 96       	adiw	r24, 0x01	; 1
    297e:	91 83       	std	Z+1, r25	; 0x01
    2980:	80 83       	st	Z, r24
    2982:	d5 cf       	rjmp	.-86     	; 0x292e <__vector_7+0x116>
    2984:	fa 01       	movw	r30, r20
    2986:	e6 5f       	subi	r30, 0xF6	; 246
    2988:	fa 4f       	sbci	r31, 0xFA	; 250
    298a:	80 81       	ld	r24, Z
    298c:	91 81       	ldd	r25, Z+1	; 0x01
    298e:	00 97       	sbiw	r24, 0x00	; 0
    2990:	71 f2       	breq	.-100    	; 0x292e <__vector_7+0x116>
    2992:	01 97       	sbiw	r24, 0x01	; 1
    2994:	f4 cf       	rjmp	.-24     	; 0x297e <__vector_7+0x166>
    2996:	b9 01       	movw	r22, r18
    2998:	66 5a       	subi	r22, 0xA6	; 166
    299a:	7f 4f       	sbci	r23, 0xFF	; 255
    299c:	64 36       	cpi	r22, 0x64	; 100
    299e:	71 05       	cpc	r23, r1
    29a0:	18 f0       	brcs	.+6      	; 0x29a8 <__vector_7+0x190>
    29a2:	64 56       	subi	r22, 0x64	; 100
    29a4:	71 09       	sbc	r23, r1
    29a6:	fa cf       	rjmp	.-12     	; 0x299c <__vector_7+0x184>
    29a8:	80 91 de 05 	lds	r24, 0x05DE	; 0x8005de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    29ac:	90 91 df 05 	lds	r25, 0x05DF	; 0x8005df <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    29b0:	a0 91 e0 05 	lds	r26, 0x05E0	; 0x8005e0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    29b4:	b0 91 e1 05 	lds	r27, 0x05E1	; 0x8005e1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    29b8:	80 90 e2 05 	lds	r8, 0x05E2	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    29bc:	90 90 e3 05 	lds	r9, 0x05E3	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    29c0:	a0 90 e4 05 	lds	r10, 0x05E4	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    29c4:	b0 90 e5 05 	lds	r11, 0x05E5	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    29c8:	88 16       	cp	r8, r24
    29ca:	99 06       	cpc	r9, r25
    29cc:	aa 06       	cpc	r10, r26
    29ce:	bb 06       	cpc	r11, r27
    29d0:	54 f4       	brge	.+20     	; 0x29e6 <__vector_7+0x1ce>
    29d2:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    29d6:	90 93 e3 05 	sts	0x05E3, r25	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    29da:	a0 93 e4 05 	sts	0x05E4, r26	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    29de:	b0 93 e5 05 	sts	0x05E5, r27	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    29e2:	e0 93 e6 05 	sts	0x05E6, r30	; 0x8005e6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    29e6:	00 91 db 05 	lds	r16, 0x05DB	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    29ea:	10 e0       	ldi	r17, 0x00	; 0
    29ec:	08 5d       	subi	r16, 0xD8	; 216
    29ee:	1f 4f       	sbci	r17, 0xFF	; 255
    29f0:	04 36       	cpi	r16, 0x64	; 100
    29f2:	11 05       	cpc	r17, r1
    29f4:	18 f0       	brcs	.+6      	; 0x29fc <__vector_7+0x1e4>
    29f6:	04 56       	subi	r16, 0x64	; 100
    29f8:	11 09       	sbc	r17, r1
    29fa:	fa cf       	rjmp	.-12     	; 0x29f0 <__vector_7+0x1d8>
    29fc:	20 17       	cp	r18, r16
    29fe:	31 07       	cpc	r19, r17
    2a00:	41 f4       	brne	.+16     	; 0x2a12 <__vector_7+0x1fa>
    2a02:	80 93 e7 05 	sts	0x05E7, r24	; 0x8005e7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    2a06:	90 93 e8 05 	sts	0x05E8, r25	; 0x8005e8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    2a0a:	a0 93 e9 05 	sts	0x05E9, r26	; 0x8005e9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    2a0e:	b0 93 ea 05 	sts	0x05EA, r27	; 0x8005ea <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    2a12:	e1 10       	cpse	r14, r1
    2a14:	2c c0       	rjmp	.+88     	; 0x2a6e <__vector_7+0x256>
    2a16:	80 90 e2 05 	lds	r8, 0x05E2	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2a1a:	90 90 e3 05 	lds	r9, 0x05E3	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2a1e:	a0 90 e4 05 	lds	r10, 0x05E4	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2a22:	b0 90 e5 05 	lds	r11, 0x05E5	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2a26:	80 92 d7 05 	sts	0x05D7, r8	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
    2a2a:	90 92 d8 05 	sts	0x05D8, r9	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
    2a2e:	a0 92 d9 05 	sts	0x05D9, r10	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
    2a32:	b0 92 da 05 	sts	0x05DA, r11	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
    2a36:	10 91 e6 05 	lds	r17, 0x05E6	; 0x8005e6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    2a3a:	10 93 db 05 	sts	0x05DB, r17	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    2a3e:	80 90 e7 05 	lds	r8, 0x05E7	; 0x8005e7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    2a42:	90 90 e8 05 	lds	r9, 0x05E8	; 0x8005e8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    2a46:	a0 90 e9 05 	lds	r10, 0x05E9	; 0x8005e9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    2a4a:	b0 90 ea 05 	lds	r11, 0x05EA	; 0x8005ea <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    2a4e:	80 92 d3 05 	sts	0x05D3, r8	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
    2a52:	90 92 d4 05 	sts	0x05D4, r9	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
    2a56:	a0 92 d5 05 	sts	0x05D5, r10	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
    2a5a:	b0 92 d6 05 	sts	0x05D6, r11	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
    2a5e:	10 92 e2 05 	sts	0x05E2, r1	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2a62:	10 92 e3 05 	sts	0x05E3, r1	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2a66:	10 92 e4 05 	sts	0x05E4, r1	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2a6a:	10 92 e5 05 	sts	0x05E5, r1	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2a6e:	ee 0f       	add	r30, r30
    2a70:	ff 1f       	adc	r31, r31
    2a72:	e6 5f       	subi	r30, 0xF6	; 246
    2a74:	fa 4f       	sbci	r31, 0xFA	; 250
    2a76:	80 80       	ld	r8, Z
    2a78:	91 80       	ldd	r9, Z+1	; 0x01
    2a7a:	b1 2c       	mov	r11, r1
    2a7c:	a1 2c       	mov	r10, r1
    2a7e:	88 0c       	add	r8, r8
    2a80:	99 1c       	adc	r9, r9
    2a82:	aa 1c       	adc	r10, r10
    2a84:	bb 1c       	adc	r11, r11
    2a86:	88 19       	sub	r24, r8
    2a88:	99 09       	sbc	r25, r9
    2a8a:	aa 09       	sbc	r26, r10
    2a8c:	bb 09       	sbc	r27, r11
    2a8e:	66 0f       	add	r22, r22
    2a90:	77 1f       	adc	r23, r23
    2a92:	fb 01       	movw	r30, r22
    2a94:	e6 5f       	subi	r30, 0xF6	; 246
    2a96:	fa 4f       	sbci	r31, 0xFA	; 250
    2a98:	60 81       	ld	r22, Z
    2a9a:	71 81       	ldd	r23, Z+1	; 0x01
    2a9c:	86 0f       	add	r24, r22
    2a9e:	97 1f       	adc	r25, r23
    2aa0:	a1 1d       	adc	r26, r1
    2aa2:	b1 1d       	adc	r27, r1
    2aa4:	46 5f       	subi	r20, 0xF6	; 246
    2aa6:	5a 4f       	sbci	r21, 0xFA	; 250
    2aa8:	fa 01       	movw	r30, r20
    2aaa:	40 81       	ld	r20, Z
    2aac:	51 81       	ldd	r21, Z+1	; 0x01
    2aae:	84 0f       	add	r24, r20
    2ab0:	95 1f       	adc	r25, r21
    2ab2:	a1 1d       	adc	r26, r1
    2ab4:	b1 1d       	adc	r27, r1
    2ab6:	80 93 de 05 	sts	0x05DE, r24	; 0x8005de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    2aba:	90 93 df 05 	sts	0x05DF, r25	; 0x8005df <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    2abe:	a0 93 e0 05 	sts	0x05E0, r26	; 0x8005e0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    2ac2:	b0 93 e1 05 	sts	0x05E1, r27	; 0x8005e1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    2ac6:	80 91 ed 05 	lds	r24, 0x05ED	; 0x8005ed <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    2aca:	81 11       	cpse	r24, r1
    2acc:	c6 c0       	rjmp	.+396    	; 0x2c5a <__vector_7+0x442>
    2ace:	80 91 db 05 	lds	r24, 0x05DB	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    2ad2:	90 e0       	ldi	r25, 0x00	; 0
    2ad4:	a9 01       	movw	r20, r18
    2ad6:	4b 59       	subi	r20, 0x9B	; 155
    2ad8:	5f 4f       	sbci	r21, 0xFF	; 255
    2ada:	48 1b       	sub	r20, r24
    2adc:	59 0b       	sbc	r21, r25
    2ade:	44 36       	cpi	r20, 0x64	; 100
    2ae0:	51 05       	cpc	r21, r1
    2ae2:	18 f0       	brcs	.+6      	; 0x2aea <__vector_7+0x2d2>
    2ae4:	44 56       	subi	r20, 0x64	; 100
    2ae6:	51 09       	sbc	r21, r1
    2ae8:	fa cf       	rjmp	.-12     	; 0x2ade <__vector_7+0x2c6>
    2aea:	4b 30       	cpi	r20, 0x0B	; 11
    2aec:	51 05       	cpc	r21, r1
    2aee:	68 f0       	brcs	.+26     	; 0x2b0a <__vector_7+0x2f2>
    2af0:	8c 59       	subi	r24, 0x9C	; 156
    2af2:	9f 4f       	sbci	r25, 0xFF	; 255
    2af4:	82 1b       	sub	r24, r18
    2af6:	93 0b       	sbc	r25, r19
    2af8:	84 36       	cpi	r24, 0x64	; 100
    2afa:	91 05       	cpc	r25, r1
    2afc:	18 f0       	brcs	.+6      	; 0x2b04 <__vector_7+0x2ec>
    2afe:	84 56       	subi	r24, 0x64	; 100
    2b00:	91 09       	sbc	r25, r1
    2b02:	fa cf       	rjmp	.-12     	; 0x2af8 <__vector_7+0x2e0>
    2b04:	02 97       	sbiw	r24, 0x02	; 2
    2b06:	08 f0       	brcs	.+2      	; 0x2b0a <__vector_7+0x2f2>
    2b08:	a8 c0       	rjmp	.+336    	; 0x2c5a <__vector_7+0x442>
    2b0a:	ce 01       	movw	r24, r28
    2b0c:	41 96       	adiw	r24, 0x11	; 17
    2b0e:	0e 94 9a 06 	call	0xd34	; 0xd34 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>
    2b12:	88 e0       	ldi	r24, 0x08	; 8
    2b14:	fe 01       	movw	r30, r28
    2b16:	71 96       	adiw	r30, 0x11	; 17
    2b18:	de 01       	movw	r26, r28
    2b1a:	19 96       	adiw	r26, 0x09	; 9
    2b1c:	01 90       	ld	r0, Z+
    2b1e:	0d 92       	st	X+, r0
    2b20:	8a 95       	dec	r24
    2b22:	e1 f7       	brne	.-8      	; 0x2b1c <__vector_7+0x304>
    2b24:	10 91 16 03 	lds	r17, 0x0316	; 0x800316 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    2b28:	91 e0       	ldi	r25, 0x01	; 1
    2b2a:	11 11       	cpse	r17, r1
    2b2c:	01 c0       	rjmp	.+2      	; 0x2b30 <__vector_7+0x318>
    2b2e:	90 e0       	ldi	r25, 0x00	; 0
    2b30:	8f 89       	ldd	r24, Y+23	; 0x17
    2b32:	89 0f       	add	r24, r25
    2b34:	8f 8b       	std	Y+23, r24	; 0x17
    2b36:	ce 01       	movw	r24, r28
    2b38:	41 96       	adiw	r24, 0x11	; 17
    2b3a:	0e 94 4f 09 	call	0x129e	; 0x129e <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    2b3e:	ce 01       	movw	r24, r28
    2b40:	41 96       	adiw	r24, 0x11	; 17
    2b42:	0e 94 15 05 	call	0xa2a	; 0xa2a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    2b46:	8f 89       	ldd	r24, Y+23	; 0x17
    2b48:	88 23       	and	r24, r24
    2b4a:	09 f4       	brne	.+2      	; 0x2b4e <__vector_7+0x336>
    2b4c:	41 c2       	rjmp	.+1154   	; 0x2fd0 <__vector_7+0x7b8>
    2b4e:	80 93 14 03 	sts	0x0314, r24	; 0x800314 <__data_end+0x6>
    2b52:	0e 94 fb 00 	call	0x1f6	; 0x1f6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24>
    2b56:	18 2f       	mov	r17, r24
    2b58:	88 eb       	ldi	r24, 0xB8	; 184
    2b5a:	93 e0       	ldi	r25, 0x03	; 3
    2b5c:	0e 94 23 03 	call	0x646	; 0x646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    2b60:	81 17       	cp	r24, r17
    2b62:	08 f4       	brcc	.+2      	; 0x2b66 <__vector_7+0x34e>
    2b64:	18 2f       	mov	r17, r24
    2b66:	88 e7       	ldi	r24, 0x78	; 120
    2b68:	93 e0       	ldi	r25, 0x03	; 3
    2b6a:	0e 94 23 03 	call	0x646	; 0x646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    2b6e:	08 2f       	mov	r16, r24
    2b70:	18 17       	cp	r17, r24
    2b72:	08 f4       	brcc	.+2      	; 0x2b76 <__vector_7+0x35e>
    2b74:	01 2f       	mov	r16, r17
    2b76:	0e 94 31 02 	call	0x462	; 0x462 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19>
    2b7a:	e8 2e       	mov	r14, r24
    2b7c:	08 17       	cp	r16, r24
    2b7e:	08 f4       	brcc	.+2      	; 0x2b82 <__vector_7+0x36a>
    2b80:	e0 2e       	mov	r14, r16
    2b82:	0e 94 bb 01 	call	0x376	; 0x376 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20>
    2b86:	08 2f       	mov	r16, r24
    2b88:	0e 94 45 01 	call	0x28a	; 0x28a <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21>
    2b8c:	d8 2e       	mov	r13, r24
    2b8e:	8a e5       	ldi	r24, 0x5A	; 90
    2b90:	94 e0       	ldi	r25, 0x04	; 4
    2b92:	0e 94 21 04 	call	0x842	; 0x842 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>
    2b96:	18 2f       	mov	r17, r24
    2b98:	88 e6       	ldi	r24, 0x68	; 104
    2b9a:	94 e0       	ldi	r25, 0x04	; 4
    2b9c:	0e 94 21 04 	call	0x842	; 0x842 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>
    2ba0:	d0 16       	cp	r13, r16
    2ba2:	08 f4       	brcc	.+2      	; 0x2ba6 <__vector_7+0x38e>
    2ba4:	0d 2d       	mov	r16, r13
    2ba6:	10 17       	cp	r17, r16
    2ba8:	08 f4       	brcc	.+2      	; 0x2bac <__vector_7+0x394>
    2baa:	01 2f       	mov	r16, r17
    2bac:	80 17       	cp	r24, r16
    2bae:	08 f4       	brcc	.+2      	; 0x2bb2 <__vector_7+0x39a>
    2bb0:	08 2f       	mov	r16, r24
    2bb2:	8f b7       	in	r24, 0x3f	; 63
    2bb4:	f8 94       	cli
    2bb6:	90 91 25 04 	lds	r25, 0x0425	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    2bba:	20 91 24 04 	lds	r18, 0x0424	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    2bbe:	29 17       	cp	r18, r25
    2bc0:	08 f4       	brcc	.+2      	; 0x2bc4 <__vector_7+0x3ac>
    2bc2:	4a c2       	rjmp	.+1172   	; 0x3058 <__vector_7+0x840>
    2bc4:	8f bf       	out	0x3f, r24	; 63
    2bc6:	e0 16       	cp	r14, r16
    2bc8:	08 f4       	brcc	.+2      	; 0x2bcc <__vector_7+0x3b4>
    2bca:	0e 2d       	mov	r16, r14
    2bcc:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2bd0:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2bd4:	02 30       	cpi	r16, 0x02	; 2
    2bd6:	08 f4       	brcc	.+2      	; 0x2bda <__vector_7+0x3c2>
    2bd8:	d2 c2       	rjmp	.+1444   	; 0x317e <__vector_7+0x966>
    2bda:	05 97       	sbiw	r24, 0x05	; 5
    2bdc:	59 f0       	breq	.+22     	; 0x2bf4 <__vector_7+0x3dc>
    2bde:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    2be2:	81 60       	ori	r24, 0x01	; 1
    2be4:	80 93 57 03 	sts	0x0357, r24	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    2be8:	85 e0       	ldi	r24, 0x05	; 5
    2bea:	90 e0       	ldi	r25, 0x00	; 0
    2bec:	90 93 5b 03 	sts	0x035B, r25	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2bf0:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2bf4:	14 e0       	ldi	r17, 0x04	; 4
    2bf6:	c1 2e       	mov	r12, r17
    2bf8:	d1 2c       	mov	r13, r1
    2bfa:	aa 24       	eor	r10, r10
    2bfc:	a3 94       	inc	r10
    2bfe:	b1 2c       	mov	r11, r1
    2c00:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2c04:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2c08:	82 30       	cpi	r24, 0x02	; 2
    2c0a:	91 05       	cpc	r25, r1
    2c0c:	19 f1       	breq	.+70     	; 0x2c54 <__vector_7+0x43c>
    2c0e:	08 f0       	brcs	.+2      	; 0x2c12 <__vector_7+0x3fa>
    2c10:	47 c3       	rjmp	.+1678   	; 0x32a0 <__vector_7+0xa88>
    2c12:	00 97       	sbiw	r24, 0x00	; 0
    2c14:	09 f4       	brne	.+2      	; 0x2c18 <__vector_7+0x400>
    2c16:	64 c3       	rjmp	.+1736   	; 0x32e0 <__vector_7+0xac8>
    2c18:	01 97       	sbiw	r24, 0x01	; 1
    2c1a:	91 f7       	brne	.-28     	; 0x2c00 <__vector_7+0x3e8>
    2c1c:	01 11       	cpse	r16, r1
    2c1e:	48 c3       	rjmp	.+1680   	; 0x32b0 <__vector_7+0xa98>
    2c20:	10 92 5b 03 	sts	0x035B, r1	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2c24:	10 92 5a 03 	sts	0x035A, r1	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2c28:	90 91 64 03 	lds	r25, 0x0364	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    2c2c:	81 e0       	ldi	r24, 0x01	; 1
    2c2e:	98 27       	eor	r25, r24
    2c30:	90 93 64 03 	sts	0x0364, r25	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    2c34:	10 92 62 03 	sts	0x0362, r1	; 0x800362 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    2c38:	10 92 61 03 	sts	0x0361, r1	; 0x800361 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x7>
    2c3c:	10 92 60 03 	sts	0x0360, r1	; 0x800360 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x6>
    2c40:	80 93 5e 03 	sts	0x035E, r24	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x4>
    2c44:	80 93 5d 03 	sts	0x035D, r24	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x3>
    2c48:	10 92 5c 03 	sts	0x035C, r1	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x2>
    2c4c:	80 93 5f 03 	sts	0x035F, r24	; 0x80035f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x5>
    2c50:	10 92 63 03 	sts	0x0363, r1	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    2c54:	86 e1       	ldi	r24, 0x16	; 22
    2c56:	80 93 ed 05 	sts	0x05ED, r24	; 0x8005ed <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    2c5a:	90 91 ed 05 	lds	r25, 0x05ED	; 0x8005ed <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    2c5e:	99 23       	and	r25, r25
    2c60:	c1 f0       	breq	.+48     	; 0x2c92 <__vector_7+0x47a>
    2c62:	91 50       	subi	r25, 0x01	; 1
    2c64:	90 93 ed 05 	sts	0x05ED, r25	; 0x8005ed <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    2c68:	81 e0       	ldi	r24, 0x01	; 1
    2c6a:	a5 e0       	ldi	r26, 0x05	; 5
    2c6c:	af 15       	cp	r26, r15
    2c6e:	08 f0       	brcs	.+2      	; 0x2c72 <__vector_7+0x45a>
    2c70:	80 e0       	ldi	r24, 0x00	; 0
    2c72:	20 91 eb 05 	lds	r18, 0x05EB	; 0x8005eb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    2c76:	82 0f       	add	r24, r18
    2c78:	80 93 eb 05 	sts	0x05EB, r24	; 0x8005eb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    2c7c:	9b 30       	cpi	r25, 0x0B	; 11
    2c7e:	09 f0       	breq	.+2      	; 0x2c82 <__vector_7+0x46a>
    2c80:	7c c3       	rjmp	.+1784   	; 0x337a <__vector_7+0xb62>
    2c82:	86 30       	cpi	r24, 0x06	; 6
    2c84:	08 f4       	brcc	.+2      	; 0x2c88 <__vector_7+0x470>
    2c86:	77 c3       	rjmp	.+1774   	; 0x3376 <__vector_7+0xb5e>
    2c88:	82 e0       	ldi	r24, 0x02	; 2
    2c8a:	80 93 ec 05 	sts	0x05EC, r24	; 0x8005ec <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    2c8e:	10 92 eb 05 	sts	0x05EB, r1	; 0x8005eb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    2c92:	10 92 ee 05 	sts	0x05EE, r1	; 0x8005ee <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    2c96:	10 92 ef 05 	sts	0x05EF, r1	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    2c9a:	80 91 65 03 	lds	r24, 0x0365	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    2c9e:	90 91 66 03 	lds	r25, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    2ca2:	01 96       	adiw	r24, 0x01	; 1
    2ca4:	90 93 66 03 	sts	0x0366, r25	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    2ca8:	80 93 65 03 	sts	0x0365, r24	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    2cac:	20 91 5a 03 	lds	r18, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2cb0:	30 91 5b 03 	lds	r19, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2cb4:	25 30       	cpi	r18, 0x05	; 5
    2cb6:	31 05       	cpc	r19, r1
    2cb8:	39 f0       	breq	.+14     	; 0x2cc8 <__vector_7+0x4b0>
    2cba:	20 91 5a 03 	lds	r18, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2cbe:	30 91 5b 03 	lds	r19, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2cc2:	24 30       	cpi	r18, 0x04	; 4
    2cc4:	31 05       	cpc	r19, r1
    2cc6:	b9 f4       	brne	.+46     	; 0x2cf6 <__vector_7+0x4de>
    2cc8:	8e 37       	cpi	r24, 0x7E	; 126
    2cca:	94 40       	sbci	r25, 0x04	; 4
    2ccc:	a0 f0       	brcs	.+40     	; 0x2cf6 <__vector_7+0x4de>
    2cce:	81 e0       	ldi	r24, 0x01	; 1
    2cd0:	90 e0       	ldi	r25, 0x00	; 0
    2cd2:	a0 e0       	ldi	r26, 0x00	; 0
    2cd4:	b0 e0       	ldi	r27, 0x00	; 0
    2cd6:	80 93 67 03 	sts	0x0367, r24	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    2cda:	90 93 68 03 	sts	0x0368, r25	; 0x800368 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    2cde:	a0 93 69 03 	sts	0x0369, r26	; 0x800369 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    2ce2:	b0 93 6a 03 	sts	0x036A, r27	; 0x80036a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    2ce6:	83 e0       	ldi	r24, 0x03	; 3
    2ce8:	90 e0       	ldi	r25, 0x00	; 0
    2cea:	90 93 5b 03 	sts	0x035B, r25	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2cee:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2cf2:	0e 94 c6 03 	call	0x78c	; 0x78c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    2cf6:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2cfa:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2cfe:	03 97       	sbiw	r24, 0x03	; 3
    2d00:	39 f0       	breq	.+14     	; 0x2d10 <__vector_7+0x4f8>
    2d02:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2d06:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2d0a:	02 97       	sbiw	r24, 0x02	; 2
    2d0c:	09 f0       	breq	.+2      	; 0x2d10 <__vector_7+0x4f8>
    2d0e:	48 c0       	rjmp	.+144    	; 0x2da0 <__vector_7+0x588>
    2d10:	80 91 65 03 	lds	r24, 0x0365	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    2d14:	90 91 66 03 	lds	r25, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    2d18:	88 3e       	cpi	r24, 0xE8	; 232
    2d1a:	43 e0       	ldi	r20, 0x03	; 3
    2d1c:	94 07       	cpc	r25, r20
    2d1e:	08 f4       	brcc	.+2      	; 0x2d22 <__vector_7+0x50a>
    2d20:	3f c0       	rjmp	.+126    	; 0x2da0 <__vector_7+0x588>
    2d22:	88 5e       	subi	r24, 0xE8	; 232
    2d24:	93 40       	sbci	r25, 0x03	; 3
    2d26:	90 93 66 03 	sts	0x0366, r25	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    2d2a:	80 93 65 03 	sts	0x0365, r24	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    2d2e:	80 91 63 03 	lds	r24, 0x0363	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    2d32:	87 7f       	andi	r24, 0xF7	; 247
    2d34:	80 93 63 03 	sts	0x0363, r24	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    2d38:	8c e5       	ldi	r24, 0x5C	; 92
    2d3a:	93 e0       	ldi	r25, 0x03	; 3
    2d3c:	0e 94 4f 09 	call	0x129e	; 0x129e <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    2d40:	8c e5       	ldi	r24, 0x5C	; 92
    2d42:	93 e0       	ldi	r25, 0x03	; 3
    2d44:	0e 94 94 07 	call	0xf28	; 0xf28 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    2d48:	80 91 64 03 	lds	r24, 0x0364	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    2d4c:	91 e0       	ldi	r25, 0x01	; 1
    2d4e:	89 27       	eor	r24, r25
    2d50:	80 93 64 03 	sts	0x0364, r24	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    2d54:	80 91 67 03 	lds	r24, 0x0367	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    2d58:	90 91 68 03 	lds	r25, 0x0368	; 0x800368 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    2d5c:	a0 91 69 03 	lds	r26, 0x0369	; 0x800369 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    2d60:	b0 91 6a 03 	lds	r27, 0x036A	; 0x80036a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    2d64:	01 96       	adiw	r24, 0x01	; 1
    2d66:	a1 1d       	adc	r26, r1
    2d68:	b1 1d       	adc	r27, r1
    2d6a:	80 93 67 03 	sts	0x0367, r24	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    2d6e:	90 93 68 03 	sts	0x0368, r25	; 0x800368 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    2d72:	a0 93 69 03 	sts	0x0369, r26	; 0x800369 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    2d76:	b0 93 6a 03 	sts	0x036A, r27	; 0x80036a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    2d7a:	40 91 6b 03 	lds	r20, 0x036B	; 0x80036b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    2d7e:	50 91 6c 03 	lds	r21, 0x036C	; 0x80036c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    2d82:	60 91 6d 03 	lds	r22, 0x036D	; 0x80036d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    2d86:	70 91 6e 03 	lds	r23, 0x036E	; 0x80036e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    2d8a:	48 17       	cp	r20, r24
    2d8c:	59 07       	cpc	r21, r25
    2d8e:	6a 07       	cpc	r22, r26
    2d90:	7b 07       	cpc	r23, r27
    2d92:	30 f4       	brcc	.+12     	; 0x2da0 <__vector_7+0x588>
    2d94:	82 e0       	ldi	r24, 0x02	; 2
    2d96:	90 e0       	ldi	r25, 0x00	; 0
    2d98:	90 93 5b 03 	sts	0x035B, r25	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    2d9c:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    2da0:	80 91 fd 05 	lds	r24, 0x05FD	; 0x8005fd <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    2da4:	89 30       	cpi	r24, 0x09	; 9
    2da6:	10 f0       	brcs	.+4      	; 0x2dac <__vector_7+0x594>
    2da8:	0c 94 6f 1f 	jmp	0x3ede	; 0x3ede <__vector_7+0x16c6>
    2dac:	8f 5f       	subi	r24, 0xFF	; 255
    2dae:	80 93 fd 05 	sts	0x05FD, r24	; 0x8005fd <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    2db2:	98 b5       	in	r25, 0x28	; 40
    2db4:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    2db8:	98 17       	cp	r25, r24
    2dba:	11 f1       	breq	.+68     	; 0x2e00 <__vector_7+0x5e8>
    2dbc:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    2dc0:	81 3b       	cpi	r24, 0xB1	; 177
    2dc2:	f0 f4       	brcc	.+60     	; 0x2e00 <__vector_7+0x5e8>
    2dc4:	80 91 1b 03 	lds	r24, 0x031B	; 0x80031b <_ZN7DisplayL19_brightness_counterE>
    2dc8:	8f 5f       	subi	r24, 0xFF	; 255
    2dca:	80 93 1b 03 	sts	0x031B, r24	; 0x80031b <_ZN7DisplayL19_brightness_counterE>
    2dce:	89 31       	cpi	r24, 0x19	; 25
    2dd0:	c9 f4       	brne	.+50     	; 0x2e04 <__vector_7+0x5ec>
    2dd2:	98 b5       	in	r25, 0x28	; 40
    2dd4:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    2dd8:	98 17       	cp	r25, r24
    2dda:	10 f0       	brcs	.+4      	; 0x2de0 <__vector_7+0x5c8>
    2ddc:	0c 94 ab 1f 	jmp	0x3f56	; 0x3f56 <__vector_7+0x173e>
    2de0:	88 b5       	in	r24, 0x28	; 40
    2de2:	81 11       	cpse	r24, r1
    2de4:	0a c0       	rjmp	.+20     	; 0x2dfa <__vector_7+0x5e2>
    2de6:	84 b5       	in	r24, 0x24	; 36
    2de8:	88 23       	and	r24, r24
    2dea:	11 f4       	brne	.+4      	; 0x2df0 <__vector_7+0x5d8>
    2dec:	0c 94 a5 1f 	jmp	0x3f4a	; 0x3f4a <__vector_7+0x1732>
    2df0:	85 b5       	in	r24, 0x25	; 37
    2df2:	88 23       	and	r24, r24
    2df4:	11 f4       	brne	.+4      	; 0x2dfa <__vector_7+0x5e2>
    2df6:	0c 94 a5 1f 	jmp	0x3f4a	; 0x3f4a <__vector_7+0x1732>
    2dfa:	88 b5       	in	r24, 0x28	; 40
    2dfc:	8f 5f       	subi	r24, 0xFF	; 255
    2dfe:	88 bd       	out	0x28, r24	; 40
    2e00:	10 92 1b 03 	sts	0x031B, r1	; 0x80031b <_ZN7DisplayL19_brightness_counterE>
    2e04:	f0 90 a5 04 	lds	r15, 0x04A5	; 0x8004a5 <_ZN7Display11CrossfadingL12_crsf_activeE>
    2e08:	ff 20       	and	r15, r15
    2e0a:	09 f4       	brne	.+2      	; 0x2e0e <__vector_7+0x5f6>
    2e0c:	81 c0       	rjmp	.+258    	; 0x2f10 <__vector_7+0x6f8>
    2e0e:	80 91 3c 03 	lds	r24, 0x033C	; 0x80033c <_ZN7Display11CrossfadingL18crsf_cycle_counterE>
    2e12:	8f 5f       	subi	r24, 0xFF	; 255
    2e14:	80 31       	cpi	r24, 0x10	; 16
    2e16:	10 f0       	brcs	.+4      	; 0x2e1c <__vector_7+0x604>
    2e18:	0c 94 bb 1f 	jmp	0x3f76	; 0x3f76 <__vector_7+0x175e>
    2e1c:	80 93 3c 03 	sts	0x033C, r24	; 0x80033c <_ZN7Display11CrossfadingL18crsf_cycle_counterE>
    2e20:	90 91 3c 03 	lds	r25, 0x033C	; 0x80033c <_ZN7Display11CrossfadingL18crsf_cycle_counterE>
    2e24:	de 01       	movw	r26, r28
    2e26:	11 96       	adiw	r26, 0x01	; 1
    2e28:	50 e0       	ldi	r21, 0x00	; 0
    2e2a:	40 e0       	ldi	r20, 0x00	; 0
    2e2c:	8d 01       	movw	r16, r26
    2e2e:	61 e0       	ldi	r22, 0x01	; 1
    2e30:	70 e0       	ldi	r23, 0x00	; 0
    2e32:	30 e0       	ldi	r19, 0x00	; 0
    2e34:	20 e0       	ldi	r18, 0x00	; 0
    2e36:	80 e0       	ldi	r24, 0x00	; 0
    2e38:	fa 01       	movw	r30, r20
    2e3a:	e2 0f       	add	r30, r18
    2e3c:	f3 1f       	adc	r31, r19
    2e3e:	e4 5e       	subi	r30, 0xE4	; 228
    2e40:	fc 4f       	sbci	r31, 0xFC	; 252
    2e42:	e0 81       	ld	r30, Z
    2e44:	9e 17       	cp	r25, r30
    2e46:	38 f4       	brcc	.+14     	; 0x2e56 <__vector_7+0x63e>
    2e48:	fb 01       	movw	r30, r22
    2e4a:	02 2e       	mov	r0, r18
    2e4c:	01 c0       	rjmp	.+2      	; 0x2e50 <__vector_7+0x638>
    2e4e:	ee 0f       	add	r30, r30
    2e50:	0a 94       	dec	r0
    2e52:	ea f7       	brpl	.-6      	; 0x2e4e <__vector_7+0x636>
    2e54:	8e 2b       	or	r24, r30
    2e56:	2f 5f       	subi	r18, 0xFF	; 255
    2e58:	3f 4f       	sbci	r19, 0xFF	; 255
    2e5a:	28 30       	cpi	r18, 0x08	; 8
    2e5c:	31 05       	cpc	r19, r1
    2e5e:	61 f7       	brne	.-40     	; 0x2e38 <__vector_7+0x620>
    2e60:	8d 93       	st	X+, r24
    2e62:	48 5f       	subi	r20, 0xF8	; 248
    2e64:	5f 4f       	sbci	r21, 0xFF	; 255
    2e66:	40 32       	cpi	r20, 0x20	; 32
    2e68:	51 05       	cpc	r21, r1
    2e6a:	19 f7       	brne	.-58     	; 0x2e32 <__vector_7+0x61a>
    2e6c:	c8 01       	movw	r24, r16
    2e6e:	0e 94 a7 00 	call	0x14e	; 0x14e <_Z20putDigitsToInputRegsPKhh.constprop.78>
    2e72:	0e 94 b4 0b 	call	0x1768	; 0x1768 <_Z16pushToOutputRegsv>
    2e76:	80 91 e4 02 	lds	r24, 0x02E4	; 0x8002e4 <_ZN7Display11CrossfadingL17crsf_step_counterE>
    2e7a:	81 50       	subi	r24, 0x01	; 1
    2e7c:	80 93 e4 02 	sts	0x02E4, r24	; 0x8002e4 <_ZN7Display11CrossfadingL17crsf_step_counterE>
    2e80:	81 11       	cpse	r24, r1
    2e82:	46 c0       	rjmp	.+140    	; 0x2f10 <__vector_7+0x6f8>
    2e84:	0e 94 82 0a 	call	0x1504	; 0x1504 <_ZN7Display11CrossfadingL11_stepPeriodEv>
    2e88:	80 93 e4 02 	sts	0x02E4, r24	; 0x8002e4 <_ZN7Display11CrossfadingL17crsf_step_counterE>
    2e8c:	30 e0       	ldi	r19, 0x00	; 0
    2e8e:	20 e0       	ldi	r18, 0x00	; 0
    2e90:	80 e0       	ldi	r24, 0x00	; 0
    2e92:	d9 01       	movw	r26, r18
    2e94:	a4 5e       	subi	r26, 0xE4	; 228
    2e96:	bc 4f       	sbci	r27, 0xFC	; 252
    2e98:	4c 91       	ld	r20, X
    2e9a:	f9 01       	movw	r30, r18
    2e9c:	ea 55       	subi	r30, 0x5A	; 90
    2e9e:	fb 4f       	sbci	r31, 0xFB	; 251
    2ea0:	90 81       	ld	r25, Z
    2ea2:	49 17       	cp	r20, r25
    2ea4:	10 f0       	brcs	.+4      	; 0x2eaa <__vector_7+0x692>
    2ea6:	0c 94 bf 1f 	jmp	0x3f7e	; 0x3f7e <__vector_7+0x1766>
    2eaa:	8c 91       	ld	r24, X
    2eac:	8f 5f       	subi	r24, 0xFF	; 255
    2eae:	8c 93       	st	X, r24
    2eb0:	8f 2d       	mov	r24, r15
    2eb2:	2f 5f       	subi	r18, 0xFF	; 255
    2eb4:	3f 4f       	sbci	r19, 0xFF	; 255
    2eb6:	20 32       	cpi	r18, 0x20	; 32
    2eb8:	31 05       	cpc	r19, r1
    2eba:	59 f7       	brne	.-42     	; 0x2e92 <__vector_7+0x67a>
    2ebc:	81 11       	cpse	r24, r1
    2ebe:	28 c0       	rjmp	.+80     	; 0x2f10 <__vector_7+0x6f8>
    2ec0:	10 92 a5 04 	sts	0x04A5, r1	; 0x8004a5 <_ZN7Display11CrossfadingL12_crsf_activeE>
    2ec4:	f8 01       	movw	r30, r16
    2ec6:	30 e0       	ldi	r19, 0x00	; 0
    2ec8:	20 e0       	ldi	r18, 0x00	; 0
    2eca:	61 e0       	ldi	r22, 0x01	; 1
    2ecc:	70 e0       	ldi	r23, 0x00	; 0
    2ece:	40 e0       	ldi	r20, 0x00	; 0
    2ed0:	90 e0       	ldi	r25, 0x00	; 0
    2ed2:	80 e0       	ldi	r24, 0x00	; 0
    2ed4:	d9 01       	movw	r26, r18
    2ed6:	a8 0f       	add	r26, r24
    2ed8:	b9 1f       	adc	r27, r25
    2eda:	a4 5e       	subi	r26, 0xE4	; 228
    2edc:	bc 4f       	sbci	r27, 0xFC	; 252
    2ede:	5c 91       	ld	r21, X
    2ee0:	50 31       	cpi	r21, 0x10	; 16
    2ee2:	38 f0       	brcs	.+14     	; 0x2ef2 <__vector_7+0x6da>
    2ee4:	db 01       	movw	r26, r22
    2ee6:	08 2e       	mov	r0, r24
    2ee8:	01 c0       	rjmp	.+2      	; 0x2eec <__vector_7+0x6d4>
    2eea:	aa 0f       	add	r26, r26
    2eec:	0a 94       	dec	r0
    2eee:	ea f7       	brpl	.-6      	; 0x2eea <__vector_7+0x6d2>
    2ef0:	4a 2b       	or	r20, r26
    2ef2:	01 96       	adiw	r24, 0x01	; 1
    2ef4:	88 30       	cpi	r24, 0x08	; 8
    2ef6:	91 05       	cpc	r25, r1
    2ef8:	69 f7       	brne	.-38     	; 0x2ed4 <__vector_7+0x6bc>
    2efa:	41 93       	st	Z+, r20
    2efc:	28 5f       	subi	r18, 0xF8	; 248
    2efe:	3f 4f       	sbci	r19, 0xFF	; 255
    2f00:	20 32       	cpi	r18, 0x20	; 32
    2f02:	31 05       	cpc	r19, r1
    2f04:	21 f7       	brne	.-56     	; 0x2ece <__vector_7+0x6b6>
    2f06:	c8 01       	movw	r24, r16
    2f08:	0e 94 a7 00 	call	0x14e	; 0x14e <_Z20putDigitsToInputRegsPKhh.constprop.78>
    2f0c:	0e 94 b4 0b 	call	0x1768	; 0x1768 <_Z16pushToOutputRegsv>
    2f10:	80 91 3f 03 	lds	r24, 0x033F	; 0x80033f <_ZN3LedL10_LED_B_CNTE>
    2f14:	80 5f       	subi	r24, 0xF0	; 240
    2f16:	80 93 3f 03 	sts	0x033F, r24	; 0x80033f <_ZN3LedL10_LED_B_CNTE>
    2f1a:	80 91 51 03 	lds	r24, 0x0351	; 0x800351 <timer_counter>
    2f1e:	90 91 52 03 	lds	r25, 0x0352	; 0x800352 <timer_counter+0x1>
    2f22:	01 96       	adiw	r24, 0x01	; 1
    2f24:	90 93 52 03 	sts	0x0352, r25	; 0x800352 <timer_counter+0x1>
    2f28:	80 93 51 03 	sts	0x0351, r24	; 0x800351 <timer_counter>
    2f2c:	68 ee       	ldi	r22, 0xE8	; 232
    2f2e:	73 e0       	ldi	r23, 0x03	; 3
    2f30:	0e 94 ea 26 	call	0x4dd4	; 0x4dd4 <__udivmodhi4>
    2f34:	89 2b       	or	r24, r25
    2f36:	a9 f4       	brne	.+42     	; 0x2f62 <__vector_7+0x74a>
    2f38:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    2f3c:	81 60       	ori	r24, 0x01	; 1
    2f3e:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    2f42:	80 91 51 03 	lds	r24, 0x0351	; 0x800351 <timer_counter>
    2f46:	90 91 52 03 	lds	r25, 0x0352	; 0x800352 <timer_counter+0x1>
    2f4a:	80 36       	cpi	r24, 0x60	; 96
    2f4c:	9a 4e       	sbci	r25, 0xEA	; 234
    2f4e:	48 f0       	brcs	.+18     	; 0x2f62 <__vector_7+0x74a>
    2f50:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    2f54:	82 60       	ori	r24, 0x02	; 2
    2f56:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    2f5a:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    2f5e:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    2f62:	80 91 3d 03 	lds	r24, 0x033D	; 0x80033d <_ZL9_ms_ticks>
    2f66:	90 91 3e 03 	lds	r25, 0x033E	; 0x80033e <_ZL9_ms_ticks+0x1>
    2f6a:	89 2b       	or	r24, r25
    2f6c:	49 f0       	breq	.+18     	; 0x2f80 <__vector_7+0x768>
    2f6e:	80 91 3d 03 	lds	r24, 0x033D	; 0x80033d <_ZL9_ms_ticks>
    2f72:	90 91 3e 03 	lds	r25, 0x033E	; 0x80033e <_ZL9_ms_ticks+0x1>
    2f76:	01 97       	sbiw	r24, 0x01	; 1
    2f78:	90 93 3e 03 	sts	0x033E, r25	; 0x80033e <_ZL9_ms_ticks+0x1>
    2f7c:	80 93 3d 03 	sts	0x033D, r24	; 0x80033d <_ZL9_ms_ticks>
    2f80:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    2f84:	84 60       	ori	r24, 0x04	; 4
    2f86:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    2f8a:	68 96       	adiw	r28, 0x18	; 24
    2f8c:	0f b6       	in	r0, 0x3f	; 63
    2f8e:	f8 94       	cli
    2f90:	de bf       	out	0x3e, r29	; 62
    2f92:	0f be       	out	0x3f, r0	; 63
    2f94:	cd bf       	out	0x3d, r28	; 61
    2f96:	df 91       	pop	r29
    2f98:	cf 91       	pop	r28
    2f9a:	ff 91       	pop	r31
    2f9c:	ef 91       	pop	r30
    2f9e:	bf 91       	pop	r27
    2fa0:	af 91       	pop	r26
    2fa2:	9f 91       	pop	r25
    2fa4:	8f 91       	pop	r24
    2fa6:	7f 91       	pop	r23
    2fa8:	6f 91       	pop	r22
    2faa:	5f 91       	pop	r21
    2fac:	4f 91       	pop	r20
    2fae:	3f 91       	pop	r19
    2fb0:	2f 91       	pop	r18
    2fb2:	1f 91       	pop	r17
    2fb4:	0f 91       	pop	r16
    2fb6:	ff 90       	pop	r15
    2fb8:	ef 90       	pop	r14
    2fba:	df 90       	pop	r13
    2fbc:	cf 90       	pop	r12
    2fbe:	bf 90       	pop	r11
    2fc0:	af 90       	pop	r10
    2fc2:	9f 90       	pop	r9
    2fc4:	8f 90       	pop	r8
    2fc6:	0f 90       	pop	r0
    2fc8:	0f be       	out	0x3f, r0	; 63
    2fca:	0f 90       	pop	r0
    2fcc:	1f 90       	pop	r1
    2fce:	18 95       	reti
    2fd0:	88 e0       	ldi	r24, 0x08	; 8
    2fd2:	fe 01       	movw	r30, r28
    2fd4:	39 96       	adiw	r30, 0x09	; 9
    2fd6:	ae e0       	ldi	r26, 0x0E	; 14
    2fd8:	b3 e0       	ldi	r27, 0x03	; 3
    2fda:	01 90       	ld	r0, Z+
    2fdc:	0d 92       	st	X+, r0
    2fde:	8a 95       	dec	r24
    2fe0:	e1 f7       	brne	.-8      	; 0x2fda <__vector_7+0x7c2>
    2fe2:	10 92 14 03 	sts	0x0314, r1	; 0x800314 <__data_end+0x6>
    2fe6:	8e 89       	ldd	r24, Y+22	; 0x16
    2fe8:	81 30       	cpi	r24, 0x01	; 1
    2fea:	31 f5       	brne	.+76     	; 0x3038 <__vector_7+0x820>
    2fec:	80 91 70 03 	lds	r24, 0x0370	; 0x800370 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
    2ff0:	18 16       	cp	r1, r24
    2ff2:	14 f4       	brge	.+4      	; 0x2ff8 <__vector_7+0x7e0>
    2ff4:	10 92 71 03 	sts	0x0371, r1	; 0x800371 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
    2ff8:	10 92 70 03 	sts	0x0370, r1	; 0x800370 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
    2ffc:	10 92 72 03 	sts	0x0372, r1	; 0x800372 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x3>
    3000:	90 91 71 03 	lds	r25, 0x0371	; 0x800371 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
    3004:	88 8d       	ldd	r24, Y+24	; 0x18
    3006:	8e 7f       	andi	r24, 0xFE	; 254
    3008:	97 ff       	sbrs	r25, 7
    300a:	81 60       	ori	r24, 0x01	; 1
    300c:	8b 7f       	andi	r24, 0xFB	; 251
    300e:	87 7f       	andi	r24, 0xF7	; 247
    3010:	88 8f       	std	Y+24, r24	; 0x18
    3012:	ce 01       	movw	r24, r28
    3014:	41 96       	adiw	r24, 0x11	; 17
    3016:	0e 94 15 05 	call	0xa2a	; 0xa2a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    301a:	98 8d       	ldd	r25, Y+24	; 0x18
    301c:	80 91 15 03 	lds	r24, 0x0315	; 0x800315 <__data_end+0x7>
    3020:	90 fb       	bst	r25, 0
    3022:	80 f9       	bld	r24, 0
    3024:	92 fb       	bst	r25, 2
    3026:	82 f9       	bld	r24, 2
    3028:	93 fb       	bst	r25, 3
    302a:	83 f9       	bld	r24, 3
    302c:	90 91 6f 03 	lds	r25, 0x036F	; 0x80036f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
    3030:	90 fb       	bst	r25, 0
    3032:	81 f9       	bld	r24, 1
    3034:	80 93 15 03 	sts	0x0315, r24	; 0x800315 <__data_end+0x7>
    3038:	8d 89       	ldd	r24, Y+21	; 0x15
    303a:	83 32       	cpi	r24, 0x23	; 35
    303c:	29 f4       	brne	.+10     	; 0x3048 <__vector_7+0x830>
    303e:	8e 89       	ldd	r24, Y+22	; 0x16
    3040:	89 35       	cpi	r24, 0x59	; 89
    3042:	11 f4       	brne	.+4      	; 0x3048 <__vector_7+0x830>
    3044:	10 92 73 03 	sts	0x0373, r1	; 0x800373 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x4>
    3048:	81 e0       	ldi	r24, 0x01	; 1
    304a:	12 30       	cpi	r17, 0x02	; 2
    304c:	08 f0       	brcs	.+2      	; 0x3050 <__vector_7+0x838>
    304e:	80 e0       	ldi	r24, 0x00	; 0
    3050:	81 23       	and	r24, r17
    3052:	80 93 16 03 	sts	0x0316, r24	; 0x800316 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    3056:	7d cd       	rjmp	.-1286   	; 0x2b52 <__vector_7+0x33a>
    3058:	19 2f       	mov	r17, r25
    305a:	12 1b       	sub	r17, r18
    305c:	8f bf       	out	0x3f, r24	; 63
    305e:	80 e0       	ldi	r24, 0x00	; 0
    3060:	9d 31       	cpi	r25, 0x1D	; 29
    3062:	38 f4       	brcc	.+14     	; 0x3072 <__vector_7+0x85a>
    3064:	9d 30       	cpi	r25, 0x0D	; 13
    3066:	08 f4       	brcc	.+2      	; 0x306a <__vector_7+0x852>
    3068:	6c c0       	rjmp	.+216    	; 0x3142 <__vector_7+0x92a>
    306a:	16 95       	lsr	r17
    306c:	16 95       	lsr	r17
    306e:	16 c0       	rjmp	.+44     	; 0x309c <__vector_7+0x884>
    3070:	82 2f       	mov	r24, r18
    3072:	96 95       	lsr	r25
    3074:	21 e0       	ldi	r18, 0x01	; 1
    3076:	28 0f       	add	r18, r24
    3078:	91 11       	cpse	r25, r1
    307a:	fa cf       	rjmp	.-12     	; 0x3070 <__vector_7+0x858>
    307c:	8d 30       	cpi	r24, 0x0D	; 13
    307e:	a8 f1       	brcs	.+106    	; 0x30ea <__vector_7+0x8d2>
    3080:	8d 30       	cpi	r24, 0x0D	; 13
    3082:	09 f4       	brne	.+2      	; 0x3086 <__vector_7+0x86e>
    3084:	4c c0       	rjmp	.+152    	; 0x311e <__vector_7+0x906>
    3086:	8e 30       	cpi	r24, 0x0E	; 14
    3088:	09 f4       	brne	.+2      	; 0x308c <__vector_7+0x874>
    308a:	4c c0       	rjmp	.+152    	; 0x3124 <__vector_7+0x90c>
    308c:	81 e1       	ldi	r24, 0x11	; 17
    308e:	90 e0       	ldi	r25, 0x00	; 0
    3090:	18 9f       	mul	r17, r24
    3092:	90 01       	movw	r18, r0
    3094:	19 9f       	mul	r17, r25
    3096:	30 0d       	add	r19, r0
    3098:	11 24       	eor	r1, r1
    309a:	13 2f       	mov	r17, r19
    309c:	00 23       	and	r16, r16
    309e:	09 f4       	brne	.+2      	; 0x30a2 <__vector_7+0x88a>
    30a0:	92 cd       	rjmp	.-1244   	; 0x2bc6 <__vector_7+0x3ae>
    30a2:	11 23       	and	r17, r17
    30a4:	09 f4       	brne	.+2      	; 0x30a8 <__vector_7+0x890>
    30a6:	8f cd       	rjmp	.-1250   	; 0x2bc6 <__vector_7+0x3ae>
    30a8:	0e 94 e7 00 	call	0x1ce	; 0x1ce <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33>
    30ac:	8f 83       	std	Y+7, r24	; 0x07
    30ae:	0e 94 5c 06 	call	0xcb8	; 0xcb8 <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.27>
    30b2:	8e 83       	std	Y+6, r24	; 0x06
    30b4:	0e 94 45 06 	call	0xc8a	; 0xc8a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36>
    30b8:	8d 83       	std	Y+5, r24	; 0x05
    30ba:	0e 94 2d 06 	call	0xc5a	; 0xc5a <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.39>
    30be:	8c 83       	std	Y+4, r24	; 0x04
    30c0:	0e 94 15 06 	call	0xc2a	; 0xc2a <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42>
    30c4:	8b 83       	std	Y+3, r24	; 0x03
    30c6:	0e 94 fd 05 	call	0xbfa	; 0xbfa <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.45>
    30ca:	8a 83       	std	Y+2, r24	; 0x02
    30cc:	0e 94 87 06 	call	0xd0e	; 0xd0e <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.29>
    30d0:	89 83       	std	Y+1, r24	; 0x01
    30d2:	ce 01       	movw	r24, r28
    30d4:	01 96       	adiw	r24, 0x01	; 1
    30d6:	0e 94 c5 04 	call	0x98a	; 0x98a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    30da:	81 11       	cpse	r24, r1
    30dc:	01 c0       	rjmp	.+2      	; 0x30e0 <__vector_7+0x8c8>
    30de:	87 e0       	ldi	r24, 0x07	; 7
    30e0:	9c 81       	ldd	r25, Y+4	; 0x04
    30e2:	98 13       	cpse	r25, r24
    30e4:	47 c0       	rjmp	.+142    	; 0x3174 <__vector_7+0x95c>
    30e6:	0f 5f       	subi	r16, 0xFF	; 255
    30e8:	6e cd       	rjmp	.-1316   	; 0x2bc6 <__vector_7+0x3ae>
    30ea:	89 30       	cpi	r24, 0x09	; 9
    30ec:	60 f0       	brcs	.+24     	; 0x3106 <__vector_7+0x8ee>
    30ee:	8b 30       	cpi	r24, 0x0B	; 11
    30f0:	28 f0       	brcs	.+10     	; 0x30fc <__vector_7+0x8e4>
    30f2:	8c 30       	cpi	r24, 0x0C	; 12
    30f4:	d1 f4       	brne	.+52     	; 0x312a <__vector_7+0x912>
    30f6:	85 e1       	ldi	r24, 0x15	; 21
    30f8:	90 e0       	ldi	r25, 0x00	; 0
    30fa:	ca cf       	rjmp	.-108    	; 0x3090 <__vector_7+0x878>
    30fc:	8a 30       	cpi	r24, 0x0A	; 10
    30fe:	c1 f4       	brne	.+48     	; 0x3130 <__vector_7+0x918>
    3100:	89 e1       	ldi	r24, 0x19	; 25
    3102:	90 e0       	ldi	r25, 0x00	; 0
    3104:	c5 cf       	rjmp	.-118    	; 0x3090 <__vector_7+0x878>
    3106:	87 30       	cpi	r24, 0x07	; 7
    3108:	28 f0       	brcs	.+10     	; 0x3114 <__vector_7+0x8fc>
    310a:	88 30       	cpi	r24, 0x08	; 8
    310c:	a1 f4       	brne	.+40     	; 0x3136 <__vector_7+0x91e>
    310e:	80 e2       	ldi	r24, 0x20	; 32
    3110:	90 e0       	ldi	r25, 0x00	; 0
    3112:	be cf       	rjmp	.-132    	; 0x3090 <__vector_7+0x878>
    3114:	86 30       	cpi	r24, 0x06	; 6
    3116:	91 f4       	brne	.+36     	; 0x313c <__vector_7+0x924>
    3118:	8a e2       	ldi	r24, 0x2A	; 42
    311a:	90 e0       	ldi	r25, 0x00	; 0
    311c:	b9 cf       	rjmp	.-142    	; 0x3090 <__vector_7+0x878>
    311e:	83 e1       	ldi	r24, 0x13	; 19
    3120:	90 e0       	ldi	r25, 0x00	; 0
    3122:	b6 cf       	rjmp	.-148    	; 0x3090 <__vector_7+0x878>
    3124:	82 e1       	ldi	r24, 0x12	; 18
    3126:	90 e0       	ldi	r25, 0x00	; 0
    3128:	b3 cf       	rjmp	.-154    	; 0x3090 <__vector_7+0x878>
    312a:	87 e1       	ldi	r24, 0x17	; 23
    312c:	90 e0       	ldi	r25, 0x00	; 0
    312e:	b0 cf       	rjmp	.-160    	; 0x3090 <__vector_7+0x878>
    3130:	8c e1       	ldi	r24, 0x1C	; 28
    3132:	90 e0       	ldi	r25, 0x00	; 0
    3134:	ad cf       	rjmp	.-166    	; 0x3090 <__vector_7+0x878>
    3136:	84 e2       	ldi	r24, 0x24	; 36
    3138:	90 e0       	ldi	r25, 0x00	; 0
    313a:	aa cf       	rjmp	.-172    	; 0x3090 <__vector_7+0x878>
    313c:	83 e3       	ldi	r24, 0x33	; 51
    313e:	90 e0       	ldi	r25, 0x00	; 0
    3140:	a7 cf       	rjmp	.-178    	; 0x3090 <__vector_7+0x878>
    3142:	99 30       	cpi	r25, 0x09	; 9
    3144:	58 f0       	brcs	.+22     	; 0x315c <__vector_7+0x944>
    3146:	1b 30       	cpi	r17, 0x0B	; 11
    3148:	08 f0       	brcs	.+2      	; 0x314c <__vector_7+0x934>
    314a:	23 c7       	rjmp	.+3654   	; 0x3f92 <__vector_7+0x177a>
    314c:	17 30       	cpi	r17, 0x07	; 7
    314e:	08 f0       	brcs	.+2      	; 0x3152 <__vector_7+0x93a>
    3150:	25 c7       	rjmp	.+3658   	; 0x3f9c <__vector_7+0x1784>
    3152:	14 30       	cpi	r17, 0x04	; 4
    3154:	08 f4       	brcc	.+2      	; 0x3158 <__vector_7+0x940>
    3156:	37 cd       	rjmp	.-1426   	; 0x2bc6 <__vector_7+0x3ae>
    3158:	11 e0       	ldi	r17, 0x01	; 1
    315a:	1c c7       	rjmp	.+3640   	; 0x3f94 <__vector_7+0x177c>
    315c:	95 30       	cpi	r25, 0x05	; 5
    315e:	30 f0       	brcs	.+12     	; 0x316c <__vector_7+0x954>
    3160:	16 30       	cpi	r17, 0x06	; 6
    3162:	08 f0       	brcs	.+2      	; 0x3166 <__vector_7+0x94e>
    3164:	1b c7       	rjmp	.+3638   	; 0x3f9c <__vector_7+0x1784>
    3166:	13 30       	cpi	r17, 0x03	; 3
    3168:	b8 f7       	brcc	.-18     	; 0x3158 <__vector_7+0x940>
    316a:	2d cd       	rjmp	.-1446   	; 0x2bc6 <__vector_7+0x3ae>
    316c:	93 30       	cpi	r25, 0x03	; 3
    316e:	d8 f7       	brcc	.-10     	; 0x3166 <__vector_7+0x94e>
    3170:	16 95       	lsr	r17
    3172:	94 cf       	rjmp	.-216    	; 0x309c <__vector_7+0x884>
    3174:	10 17       	cp	r17, r16
    3176:	08 f4       	brcc	.+2      	; 0x317a <__vector_7+0x962>
    3178:	26 cd       	rjmp	.-1460   	; 0x2bc6 <__vector_7+0x3ae>
    317a:	00 e0       	ldi	r16, 0x00	; 0
    317c:	24 cd       	rjmp	.-1464   	; 0x2bc6 <__vector_7+0x3ae>
    317e:	05 97       	sbiw	r24, 0x05	; 5
    3180:	09 f0       	breq	.+2      	; 0x3184 <__vector_7+0x96c>
    3182:	38 cd       	rjmp	.-1424   	; 0x2bf4 <__vector_7+0x3dc>
    3184:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    3188:	8e 7f       	andi	r24, 0xFE	; 254
    318a:	80 93 57 03 	sts	0x0357, r24	; 0x800357 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    318e:	0e 94 fb 00 	call	0x1f6	; 0x1f6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24>
    3192:	ee 24       	eor	r14, r14
    3194:	e3 94       	inc	r14
    3196:	88 23       	and	r24, r24
    3198:	09 f4       	brne	.+2      	; 0x319c <__vector_7+0x984>
    319a:	78 c0       	rjmp	.+240    	; 0x328c <__vector_7+0xa74>
    319c:	e1 2c       	mov	r14, r1
    319e:	88 eb       	ldi	r24, 0xB8	; 184
    31a0:	93 e0       	ldi	r25, 0x03	; 3
    31a2:	0e 94 23 03 	call	0x646	; 0x646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    31a6:	11 e0       	ldi	r17, 0x01	; 1
    31a8:	81 11       	cpse	r24, r1
    31aa:	10 e0       	ldi	r17, 0x00	; 0
    31ac:	1e 29       	or	r17, r14
    31ae:	21 f0       	breq	.+8      	; 0x31b8 <__vector_7+0x9a0>
    31b0:	88 e7       	ldi	r24, 0x78	; 120
    31b2:	93 e0       	ldi	r25, 0x03	; 3
    31b4:	0e 94 b9 03 	call	0x772	; 0x772 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    31b8:	88 e7       	ldi	r24, 0x78	; 120
    31ba:	93 e0       	ldi	r25, 0x03	; 3
    31bc:	0e 94 23 03 	call	0x646	; 0x646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    31c0:	ee 24       	eor	r14, r14
    31c2:	e3 94       	inc	r14
    31c4:	81 11       	cpse	r24, r1
    31c6:	e1 2c       	mov	r14, r1
    31c8:	e1 2a       	or	r14, r17
    31ca:	89 f0       	breq	.+34     	; 0x31ee <__vector_7+0x9d6>
    31cc:	e0 e0       	ldi	r30, 0x00	; 0
    31ce:	f4 e0       	ldi	r31, 0x04	; 4
    31d0:	88 e1       	ldi	r24, 0x18	; 24
    31d2:	94 e0       	ldi	r25, 0x04	; 4
    31d4:	11 92       	st	Z+, r1
    31d6:	8e 17       	cp	r24, r30
    31d8:	9f 07       	cpc	r25, r31
    31da:	e1 f7       	brne	.-8      	; 0x31d4 <__vector_7+0x9bc>
    31dc:	10 92 18 04 	sts	0x0418, r1	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    31e0:	10 92 1a 04 	sts	0x041A, r1	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    31e4:	89 e1       	ldi	r24, 0x19	; 25
    31e6:	80 93 1b 04 	sts	0x041B, r24	; 0x80041b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    31ea:	10 92 19 04 	sts	0x0419, r1	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    31ee:	0e 94 31 02 	call	0x462	; 0x462 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.19>
    31f2:	11 e0       	ldi	r17, 0x01	; 1
    31f4:	81 11       	cpse	r24, r1
    31f6:	10 e0       	ldi	r17, 0x00	; 0
    31f8:	e1 2a       	or	r14, r17
    31fa:	39 f1       	breq	.+78     	; 0x324a <__vector_7+0xa32>
    31fc:	10 92 1c 04 	sts	0x041C, r1	; 0x80041c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE>
    3200:	10 92 1d 04 	sts	0x041D, r1	; 0x80041d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x1>
    3204:	10 92 1e 04 	sts	0x041E, r1	; 0x80041e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x2>
    3208:	10 92 1f 04 	sts	0x041F, r1	; 0x80041f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x3>
    320c:	10 92 20 04 	sts	0x0420, r1	; 0x800420 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x4>
    3210:	10 92 21 04 	sts	0x0421, r1	; 0x800421 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x5>
    3214:	10 92 22 04 	sts	0x0422, r1	; 0x800422 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x6>
    3218:	10 92 23 04 	sts	0x0423, r1	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    321c:	10 92 25 04 	sts	0x0425, r1	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    3220:	88 e0       	ldi	r24, 0x08	; 8
    3222:	80 93 26 04 	sts	0x0426, r24	; 0x800426 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    3226:	10 92 24 04 	sts	0x0424, r1	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    322a:	e7 e2       	ldi	r30, 0x27	; 39
    322c:	f4 e0       	ldi	r31, 0x04	; 4
    322e:	11 92       	st	Z+, r1
    3230:	24 e0       	ldi	r18, 0x04	; 4
    3232:	e6 34       	cpi	r30, 0x46	; 70
    3234:	f2 07       	cpc	r31, r18
    3236:	d9 f7       	brne	.-10     	; 0x322e <__vector_7+0xa16>
    3238:	10 92 46 04 	sts	0x0446, r1	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    323c:	10 92 48 04 	sts	0x0448, r1	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3240:	80 e2       	ldi	r24, 0x20	; 32
    3242:	80 93 49 04 	sts	0x0449, r24	; 0x800449 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3246:	10 92 47 04 	sts	0x0447, r1	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    324a:	0e 94 bb 01 	call	0x376	; 0x376 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.20>
    324e:	11 e0       	ldi	r17, 0x01	; 1
    3250:	81 11       	cpse	r24, r1
    3252:	10 e0       	ldi	r17, 0x00	; 0
    3254:	1e 29       	or	r17, r14
    3256:	81 f0       	breq	.+32     	; 0x3278 <__vector_7+0xa60>
    3258:	ea e4       	ldi	r30, 0x4A	; 74
    325a:	f4 e0       	ldi	r31, 0x04	; 4
    325c:	11 92       	st	Z+, r1
    325e:	34 e0       	ldi	r19, 0x04	; 4
    3260:	e6 35       	cpi	r30, 0x56	; 86
    3262:	f3 07       	cpc	r31, r19
    3264:	d9 f7       	brne	.-10     	; 0x325c <__vector_7+0xa44>
    3266:	10 92 56 04 	sts	0x0456, r1	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    326a:	10 92 58 04 	sts	0x0458, r1	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    326e:	8d e0       	ldi	r24, 0x0D	; 13
    3270:	80 93 59 04 	sts	0x0459, r24	; 0x800459 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    3274:	10 92 57 04 	sts	0x0457, r1	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    3278:	0e 94 45 01 	call	0x28a	; 0x28a <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.21>
    327c:	88 23       	and	r24, r24
    327e:	09 f0       	breq	.+2      	; 0x3282 <__vector_7+0xa6a>
    3280:	11 11       	cpse	r17, r1
    3282:	0e 94 c6 00 	call	0x18c	; 0x18c <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.68>
    3286:	84 e0       	ldi	r24, 0x04	; 4
    3288:	90 e0       	ldi	r25, 0x00	; 0
    328a:	b0 cc       	rjmp	.-1696   	; 0x2bec <__vector_7+0x3d4>
    328c:	88 eb       	ldi	r24, 0xB8	; 184
    328e:	93 e0       	ldi	r25, 0x03	; 3
    3290:	0e 94 b9 03 	call	0x772	; 0x772 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    3294:	8f ef       	ldi	r24, 0xFF	; 255
    3296:	80 93 fe 03 	sts	0x03FE, r24	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    329a:	80 93 ff 03 	sts	0x03FF, r24	; 0x8003ff <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
    329e:	7f cf       	rjmp	.-258    	; 0x319e <__vector_7+0x986>
    32a0:	84 30       	cpi	r24, 0x04	; 4
    32a2:	91 05       	cpc	r25, r1
    32a4:	21 f1       	breq	.+72     	; 0x32ee <__vector_7+0xad6>
    32a6:	08 f4       	brcc	.+2      	; 0x32aa <__vector_7+0xa92>
    32a8:	49 c0       	rjmp	.+146    	; 0x333c <__vector_7+0xb24>
    32aa:	05 97       	sbiw	r24, 0x05	; 5
    32ac:	09 f0       	breq	.+2      	; 0x32b0 <__vector_7+0xa98>
    32ae:	a8 cc       	rjmp	.-1712   	; 0x2c00 <__vector_7+0x3e8>
    32b0:	10 92 66 03 	sts	0x0366, r1	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    32b4:	10 92 65 03 	sts	0x0365, r1	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    32b8:	88 e0       	ldi	r24, 0x08	; 8
    32ba:	ee e0       	ldi	r30, 0x0E	; 14
    32bc:	f3 e0       	ldi	r31, 0x03	; 3
    32be:	ac e5       	ldi	r26, 0x5C	; 92
    32c0:	b3 e0       	ldi	r27, 0x03	; 3
    32c2:	01 90       	ld	r0, Z+
    32c4:	0d 92       	st	X+, r0
    32c6:	8a 95       	dec	r24
    32c8:	e1 f7       	brne	.-8      	; 0x32c2 <__vector_7+0xaaa>
    32ca:	8e e0       	ldi	r24, 0x0E	; 14
    32cc:	93 e0       	ldi	r25, 0x03	; 3
    32ce:	0e 94 94 07 	call	0xf28	; 0xf28 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    32d2:	80 91 64 03 	lds	r24, 0x0364	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    32d6:	91 e0       	ldi	r25, 0x01	; 1
    32d8:	89 27       	eor	r24, r25
    32da:	80 93 64 03 	sts	0x0364, r24	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    32de:	ba cc       	rjmp	.-1676   	; 0x2c54 <__vector_7+0x43c>
    32e0:	00 23       	and	r16, r16
    32e2:	b9 f3       	breq	.-18     	; 0x32d2 <__vector_7+0xaba>
    32e4:	b0 92 5b 03 	sts	0x035B, r11	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    32e8:	a0 92 5a 03 	sts	0x035A, r10	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    32ec:	89 cc       	rjmp	.-1774   	; 0x2c00 <__vector_7+0x3e8>
    32ee:	0e 94 fb 00 	call	0x1f6	; 0x1f6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24>
    32f2:	85 36       	cpi	r24, 0x65	; 101
    32f4:	90 f0       	brcs	.+36     	; 0x331a <__vector_7+0xb02>
    32f6:	80 91 63 03 	lds	r24, 0x0363	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    32fa:	87 7f       	andi	r24, 0xF7	; 247
    32fc:	80 93 63 03 	sts	0x0363, r24	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    3300:	8c e5       	ldi	r24, 0x5C	; 92
    3302:	93 e0       	ldi	r25, 0x03	; 3
    3304:	0e 94 4f 09 	call	0x129e	; 0x129e <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    3308:	8c e5       	ldi	r24, 0x5C	; 92
    330a:	93 e0       	ldi	r25, 0x03	; 3
    330c:	0e 94 94 07 	call	0xf28	; 0xf28 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    3310:	10 92 66 03 	sts	0x0366, r1	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    3314:	10 92 65 03 	sts	0x0365, r1	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    3318:	dc cf       	rjmp	.-72     	; 0x32d2 <__vector_7+0xaba>
    331a:	83 e0       	ldi	r24, 0x03	; 3
    331c:	90 e0       	ldi	r25, 0x00	; 0
    331e:	90 93 5b 03 	sts	0x035B, r25	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    3322:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    3326:	0e 94 c6 03 	call	0x78c	; 0x78c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    332a:	10 92 67 03 	sts	0x0367, r1	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    332e:	10 92 68 03 	sts	0x0368, r1	; 0x800368 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    3332:	10 92 69 03 	sts	0x0369, r1	; 0x800369 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    3336:	10 92 6a 03 	sts	0x036A, r1	; 0x80036a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    333a:	8c cc       	rjmp	.-1768   	; 0x2c54 <__vector_7+0x43c>
    333c:	0e 94 fb 00 	call	0x1f6	; 0x1f6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.24>
    3340:	85 36       	cpi	r24, 0x65	; 101
    3342:	08 f4       	brcc	.+2      	; 0x3346 <__vector_7+0xb2e>
    3344:	87 cc       	rjmp	.-1778   	; 0x2c54 <__vector_7+0x43c>
    3346:	80 91 65 03 	lds	r24, 0x0365	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    334a:	90 91 66 03 	lds	r25, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    334e:	9c 01       	movw	r18, r24
    3350:	29 5c       	subi	r18, 0xC9	; 201
    3352:	31 09       	sbc	r19, r1
    3354:	27 35       	cpi	r18, 0x57	; 87
    3356:	32 40       	sbci	r19, 0x02	; 2
    3358:	08 f4       	brcc	.+2      	; 0x335c <__vector_7+0xb44>
    335a:	7c cc       	rjmp	.-1800   	; 0x2c54 <__vector_7+0x43c>
    335c:	d0 92 5b 03 	sts	0x035B, r13	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    3360:	c0 92 5a 03 	sts	0x035A, r12	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    3364:	88 3c       	cpi	r24, 0xC8	; 200
    3366:	91 05       	cpc	r25, r1
    3368:	08 f0       	brcs	.+2      	; 0x336c <__vector_7+0xb54>
    336a:	4a cc       	rjmp	.-1900   	; 0x2c00 <__vector_7+0x3e8>
    336c:	10 92 66 03 	sts	0x0366, r1	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    3370:	10 92 65 03 	sts	0x0365, r1	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    3374:	6f cc       	rjmp	.-1826   	; 0x2c54 <__vector_7+0x43c>
    3376:	80 e0       	ldi	r24, 0x00	; 0
    3378:	88 cc       	rjmp	.-1776   	; 0x2c8a <__vector_7+0x472>
    337a:	91 11       	cpse	r25, r1
    337c:	8a cc       	rjmp	.-1772   	; 0x2c92 <__vector_7+0x47a>
    337e:	01 e0       	ldi	r16, 0x01	; 1
    3380:	86 30       	cpi	r24, 0x06	; 6
    3382:	08 f4       	brcc	.+2      	; 0x3386 <__vector_7+0xb6e>
    3384:	00 e0       	ldi	r16, 0x00	; 0
    3386:	80 91 ec 05 	lds	r24, 0x05EC	; 0x8005ec <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    338a:	08 0f       	add	r16, r24
    338c:	00 93 ec 05 	sts	0x05EC, r16	; 0x8005ec <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    3390:	10 92 eb 05 	sts	0x05EB, r1	; 0x8005eb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    3394:	ce 01       	movw	r24, r28
    3396:	01 96       	adiw	r24, 0x01	; 1
    3398:	0e 94 9a 06 	call	0xd34	; 0xd34 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>
    339c:	10 91 16 03 	lds	r17, 0x0316	; 0x800316 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    33a0:	8f 81       	ldd	r24, Y+7	; 0x07
    33a2:	81 0f       	add	r24, r17
    33a4:	8f 83       	std	Y+7, r24	; 0x07
    33a6:	ce 01       	movw	r24, r28
    33a8:	01 96       	adiw	r24, 0x01	; 1
    33aa:	0e 94 4f 09 	call	0x129e	; 0x129e <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    33ae:	11 0f       	add	r17, r17
    33b0:	8f 81       	ldd	r24, Y+7	; 0x07
    33b2:	8b 33       	cpi	r24, 0x3B	; 59
    33b4:	49 f4       	brne	.+18     	; 0x33c8 <__vector_7+0xbb0>
    33b6:	98 85       	ldd	r25, Y+8	; 0x08
    33b8:	93 fb       	bst	r25, 3
    33ba:	88 27       	eor	r24, r24
    33bc:	80 f9       	bld	r24, 0
    33be:	93 ff       	sbrs	r25, 3
    33c0:	04 c0       	rjmp	.+8      	; 0x33ca <__vector_7+0xbb2>
    33c2:	81 e0       	ldi	r24, 0x01	; 1
    33c4:	9e 81       	ldd	r25, Y+6	; 0x06
    33c6:	91 11       	cpse	r25, r1
    33c8:	80 e0       	ldi	r24, 0x00	; 0
    33ca:	81 0f       	add	r24, r17
    33cc:	80 93 16 03 	sts	0x0316, r24	; 0x800316 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    33d0:	81 30       	cpi	r24, 0x01	; 1
    33d2:	09 f4       	brne	.+2      	; 0x33d6 <__vector_7+0xbbe>
    33d4:	5e cc       	rjmp	.-1860   	; 0x2c92 <__vector_7+0x47a>
    33d6:	40 91 f6 03 	lds	r20, 0x03F6	; 0x8003f6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    33da:	80 91 f5 03 	lds	r24, 0x03F5	; 0x8003f5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    33de:	48 1b       	sub	r20, r24
    33e0:	55 0b       	sbc	r21, r21
    33e2:	80 91 fe 03 	lds	r24, 0x03FE	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    33e6:	8f 3f       	cpi	r24, 0xFF	; 255
    33e8:	09 f0       	breq	.+2      	; 0x33ec <__vector_7+0xbd4>
    33ea:	bc c0       	rjmp	.+376    	; 0x3564 <__vector_7+0xd4c>
    33ec:	80 91 f4 03 	lds	r24, 0x03F4	; 0x8003f4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    33f0:	88 23       	and	r24, r24
    33f2:	09 f4       	brne	.+2      	; 0x33f6 <__vector_7+0xbde>
    33f4:	6c c0       	rjmp	.+216    	; 0x34ce <__vector_7+0xcb6>
    33f6:	af ef       	ldi	r26, 0xFF	; 255
    33f8:	a8 0f       	add	r26, r24
    33fa:	eb ee       	ldi	r30, 0xEB	; 235
    33fc:	85 31       	cpi	r24, 0x15	; 21
    33fe:	08 f4       	brcc	.+2      	; 0x3402 <__vector_7+0xbea>
    3400:	e7 e2       	ldi	r30, 0x27	; 39
    3402:	e8 0f       	add	r30, r24
    3404:	f0 e0       	ldi	r31, 0x00	; 0
    3406:	28 2f       	mov	r18, r24
    3408:	30 e0       	ldi	r19, 0x00	; 0
    340a:	b0 e0       	ldi	r27, 0x00	; 0
    340c:	28 54       	subi	r18, 0x48	; 72
    340e:	3c 4f       	sbci	r19, 0xFC	; 252
    3410:	a8 54       	subi	r26, 0x48	; 72
    3412:	bc 4f       	sbci	r27, 0xFC	; 252
    3414:	bf 01       	movw	r22, r30
    3416:	68 54       	subi	r22, 0x48	; 72
    3418:	7c 4f       	sbci	r23, 0xFC	; 252
    341a:	02 30       	cpi	r16, 0x02	; 2
    341c:	09 f4       	brne	.+2      	; 0x3420 <__vector_7+0xc08>
    341e:	65 c0       	rjmp	.+202    	; 0x34ea <__vector_7+0xcd2>
    3420:	03 30       	cpi	r16, 0x03	; 3
    3422:	09 f4       	brne	.+2      	; 0x3426 <__vector_7+0xc0e>
    3424:	79 c0       	rjmp	.+242    	; 0x3518 <__vector_7+0xd00>
    3426:	f9 01       	movw	r30, r18
    3428:	90 81       	ld	r25, Z
    342a:	01 11       	cpse	r16, r1
    342c:	8d c0       	rjmp	.+282    	; 0x3548 <__vector_7+0xd30>
    342e:	99 3f       	cpi	r25, 0xF9	; 249
    3430:	08 f4       	brcc	.+2      	; 0x3434 <__vector_7+0xc1c>
    3432:	4f c0       	rjmp	.+158    	; 0x34d2 <__vector_7+0xcba>
    3434:	9f ef       	ldi	r25, 0xFF	; 255
    3436:	90 83       	st	Z, r25
    3438:	9c 91       	ld	r25, X
    343a:	93 30       	cpi	r25, 0x03	; 3
    343c:	08 f0       	brcs	.+2      	; 0x3440 <__vector_7+0xc28>
    343e:	4b c0       	rjmp	.+150    	; 0x34d6 <__vector_7+0xcbe>
    3440:	1c 92       	st	X, r1
    3442:	db 01       	movw	r26, r22
    3444:	9c 91       	ld	r25, X
    3446:	93 30       	cpi	r25, 0x03	; 3
    3448:	08 f0       	brcs	.+2      	; 0x344c <__vector_7+0xc34>
    344a:	48 c0       	rjmp	.+144    	; 0x34dc <__vector_7+0xcc4>
    344c:	1c 92       	st	X, r1
    344e:	e1 e0       	ldi	r30, 0x01	; 1
    3450:	e8 0f       	add	r30, r24
    3452:	8b 33       	cpi	r24, 0x3B	; 59
    3454:	08 f0       	brcs	.+2      	; 0x3458 <__vector_7+0xc40>
    3456:	e0 e0       	ldi	r30, 0x00	; 0
    3458:	f0 e0       	ldi	r31, 0x00	; 0
    345a:	e8 54       	subi	r30, 0x48	; 72
    345c:	fc 4f       	sbci	r31, 0xFC	; 252
    345e:	90 81       	ld	r25, Z
    3460:	93 30       	cpi	r25, 0x03	; 3
    3462:	08 f0       	brcs	.+2      	; 0x3466 <__vector_7+0xc4e>
    3464:	3f c0       	rjmp	.+126    	; 0x34e4 <__vector_7+0xccc>
    3466:	10 82       	st	Z, r1
    3468:	8b 33       	cpi	r24, 0x3B	; 59
    346a:	08 f0       	brcs	.+2      	; 0x346e <__vector_7+0xc56>
    346c:	79 c0       	rjmp	.+242    	; 0x3560 <__vector_7+0xd48>
    346e:	8f 5f       	subi	r24, 0xFF	; 255
    3470:	80 93 f4 03 	sts	0x03F4, r24	; 0x8003f4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    3474:	4d 30       	cpi	r20, 0x0D	; 13
    3476:	51 05       	cpc	r21, r1
    3478:	24 f0       	brlt	.+8      	; 0x3482 <__vector_7+0xc6a>
    347a:	0e 94 e7 00 	call	0x1ce	; 0x1ce <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33>
    347e:	83 30       	cpi	r24, 0x03	; 3
    3480:	21 f4       	brne	.+8      	; 0x348a <__vector_7+0xc72>
    3482:	88 eb       	ldi	r24, 0xB8	; 184
    3484:	93 e0       	ldi	r25, 0x03	; 3
    3486:	0e 94 a2 03 	call	0x744	; 0x744 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    348a:	8f 81       	ldd	r24, Y+7	; 0x07
    348c:	81 11       	cpse	r24, r1
    348e:	54 c1       	rjmp	.+680    	; 0x3738 <__vector_7+0xf20>
    3490:	80 91 b4 03 	lds	r24, 0x03B4	; 0x8003b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    3494:	8b 33       	cpi	r24, 0x3B	; 59
    3496:	08 f0       	brcs	.+2      	; 0x349a <__vector_7+0xc82>
    3498:	0a c1       	rjmp	.+532    	; 0x36ae <__vector_7+0xe96>
    349a:	8f 5f       	subi	r24, 0xFF	; 255
    349c:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    34a0:	8e 81       	ldd	r24, Y+6	; 0x06
    34a2:	81 11       	cpse	r24, r1
    34a4:	7d c5       	rjmp	.+2810   	; 0x3fa0 <__vector_7+0x1788>
    34a6:	0e 94 45 06 	call	0xc8a	; 0xc8a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36>
    34aa:	84 32       	cpi	r24, 0x24	; 36
    34ac:	08 f0       	brcs	.+2      	; 0x34b0 <__vector_7+0xc98>
    34ae:	05 c1       	rjmp	.+522    	; 0x36ba <__vector_7+0xea2>
    34b0:	0e 94 45 06 	call	0xc8a	; 0xc8a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.36>
    34b4:	9d 81       	ldd	r25, Y+5	; 0x05
    34b6:	89 17       	cp	r24, r25
    34b8:	09 f4       	brne	.+2      	; 0x34bc <__vector_7+0xca4>
    34ba:	ff c0       	rjmp	.+510    	; 0x36ba <__vector_7+0xea2>
    34bc:	80 91 18 04 	lds	r24, 0x0418	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    34c0:	87 31       	cpi	r24, 0x17	; 23
    34c2:	08 f0       	brcs	.+2      	; 0x34c6 <__vector_7+0xcae>
    34c4:	f7 c0       	rjmp	.+494    	; 0x36b4 <__vector_7+0xe9c>
    34c6:	8f 5f       	subi	r24, 0xFF	; 255
    34c8:	80 93 18 04 	sts	0x0418, r24	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    34cc:	ec cf       	rjmp	.-40     	; 0x34a6 <__vector_7+0xc8e>
    34ce:	ab e3       	ldi	r26, 0x3B	; 59
    34d0:	97 cf       	rjmp	.-210    	; 0x3400 <__vector_7+0xbe8>
    34d2:	9a 5f       	subi	r25, 0xFA	; 250
    34d4:	b0 cf       	rjmp	.-160    	; 0x3436 <__vector_7+0xc1e>
    34d6:	92 50       	subi	r25, 0x02	; 2
    34d8:	9c 93       	st	X, r25
    34da:	b3 cf       	rjmp	.-154    	; 0x3442 <__vector_7+0xc2a>
    34dc:	92 50       	subi	r25, 0x02	; 2
    34de:	fb 01       	movw	r30, r22
    34e0:	90 83       	st	Z, r25
    34e2:	b5 cf       	rjmp	.-150    	; 0x344e <__vector_7+0xc36>
    34e4:	92 50       	subi	r25, 0x02	; 2
    34e6:	90 83       	st	Z, r25
    34e8:	bf cf       	rjmp	.-130    	; 0x3468 <__vector_7+0xc50>
    34ea:	9c 91       	ld	r25, X
    34ec:	9e 3f       	cpi	r25, 0xFE	; 254
    34ee:	40 f0       	brcs	.+16     	; 0x3500 <__vector_7+0xce8>
    34f0:	9f ef       	ldi	r25, 0xFF	; 255
    34f2:	9c 93       	st	X, r25
    34f4:	d9 01       	movw	r26, r18
    34f6:	9c 91       	ld	r25, X
    34f8:	93 30       	cpi	r25, 0x03	; 3
    34fa:	20 f4       	brcc	.+8      	; 0x3504 <__vector_7+0xcec>
    34fc:	1c 92       	st	X, r1
    34fe:	05 c0       	rjmp	.+10     	; 0x350a <__vector_7+0xcf2>
    3500:	9f 5f       	subi	r25, 0xFF	; 255
    3502:	f7 cf       	rjmp	.-18     	; 0x34f2 <__vector_7+0xcda>
    3504:	92 50       	subi	r25, 0x02	; 2
    3506:	f9 01       	movw	r30, r18
    3508:	90 83       	st	Z, r25
    350a:	db 01       	movw	r26, r22
    350c:	9c 91       	ld	r25, X
    350e:	93 30       	cpi	r25, 0x03	; 3
    3510:	88 f0       	brcs	.+34     	; 0x3534 <__vector_7+0xd1c>
    3512:	92 50       	subi	r25, 0x02	; 2
    3514:	fb 01       	movw	r30, r22
    3516:	e7 cf       	rjmp	.-50     	; 0x34e6 <__vector_7+0xcce>
    3518:	fb 01       	movw	r30, r22
    351a:	90 81       	ld	r25, Z
    351c:	9e 3f       	cpi	r25, 0xFE	; 254
    351e:	60 f0       	brcs	.+24     	; 0x3538 <__vector_7+0xd20>
    3520:	9f ef       	ldi	r25, 0xFF	; 255
    3522:	90 83       	st	Z, r25
    3524:	f9 01       	movw	r30, r18
    3526:	90 81       	ld	r25, Z
    3528:	93 30       	cpi	r25, 0x03	; 3
    352a:	40 f4       	brcc	.+16     	; 0x353c <__vector_7+0xd24>
    352c:	10 82       	st	Z, r1
    352e:	9c 91       	ld	r25, X
    3530:	93 30       	cpi	r25, 0x03	; 3
    3532:	38 f4       	brcc	.+14     	; 0x3542 <__vector_7+0xd2a>
    3534:	1c 92       	st	X, r1
    3536:	98 cf       	rjmp	.-208    	; 0x3468 <__vector_7+0xc50>
    3538:	9f 5f       	subi	r25, 0xFF	; 255
    353a:	f3 cf       	rjmp	.-26     	; 0x3522 <__vector_7+0xd0a>
    353c:	92 50       	subi	r25, 0x02	; 2
    353e:	90 83       	st	Z, r25
    3540:	f6 cf       	rjmp	.-20     	; 0x352e <__vector_7+0xd16>
    3542:	92 50       	subi	r25, 0x02	; 2
    3544:	9c 93       	st	X, r25
    3546:	90 cf       	rjmp	.-224    	; 0x3468 <__vector_7+0xc50>
    3548:	93 30       	cpi	r25, 0x03	; 3
    354a:	38 f4       	brcc	.+14     	; 0x355a <__vector_7+0xd42>
    354c:	10 82       	st	Z, r1
    354e:	9c 91       	ld	r25, X
    3550:	93 30       	cpi	r25, 0x03	; 3
    3552:	a0 f2       	brcs	.-88     	; 0x34fc <__vector_7+0xce4>
    3554:	92 50       	subi	r25, 0x02	; 2
    3556:	9c 93       	st	X, r25
    3558:	d8 cf       	rjmp	.-80     	; 0x350a <__vector_7+0xcf2>
    355a:	92 50       	subi	r25, 0x02	; 2
    355c:	90 83       	st	Z, r25
    355e:	f7 cf       	rjmp	.-18     	; 0x354e <__vector_7+0xd36>
    3560:	80 e0       	ldi	r24, 0x00	; 0
    3562:	86 cf       	rjmp	.-244    	; 0x3470 <__vector_7+0xc58>
    3564:	4d 30       	cpi	r20, 0x0D	; 13
    3566:	51 05       	cpc	r21, r1
    3568:	24 f0       	brlt	.+8      	; 0x3572 <__vector_7+0xd5a>
    356a:	0e 94 e7 00 	call	0x1ce	; 0x1ce <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.33>
    356e:	83 30       	cpi	r24, 0x03	; 3
    3570:	09 f5       	brne	.+66     	; 0x35b4 <__vector_7+0xd9c>
    3572:	88 eb       	ldi	r24, 0xB8	; 184
    3574:	93 e0       	ldi	r25, 0x03	; 3
    3576:	0e 94 a2 03 	call	0x744	; 0x744 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    357a:	80 91 f6 03 	lds	r24, 0x03F6	; 0x8003f6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    357e:	8e 3c       	cpi	r24, 0xCE	; 206
    3580:	a8 f0       	brcs	.+42     	; 0x35ac <__vector_7+0xd94>
    3582:	e8 eb       	ldi	r30, 0xB8	; 184
    3584:	f3 e0       	ldi	r31, 0x03	; 3
    3586:	24 ef       	ldi	r18, 0xF4	; 244
    3588:	33 e0       	ldi	r19, 0x03	; 3
    358a:	90 81       	ld	r25, Z
    358c:	93 33       	cpi	r25, 0x33	; 51
    358e:	80 f5       	brcc	.+96     	; 0x35f0 <__vector_7+0xdd8>
    3590:	10 82       	st	Z, r1
    3592:	31 96       	adiw	r30, 0x01	; 1
    3594:	2e 17       	cp	r18, r30
    3596:	3f 07       	cpc	r19, r31
    3598:	c1 f7       	brne	.-16     	; 0x358a <__vector_7+0xd72>
    359a:	82 53       	subi	r24, 0x32	; 50
    359c:	80 93 f6 03 	sts	0x03F6, r24	; 0x8003f6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    35a0:	80 91 f5 03 	lds	r24, 0x03F5	; 0x8003f5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    35a4:	83 33       	cpi	r24, 0x33	; 51
    35a6:	38 f5       	brcc	.+78     	; 0x35f6 <__vector_7+0xdde>
    35a8:	10 92 f5 03 	sts	0x03F5, r1	; 0x8003f5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    35ac:	80 91 fe 03 	lds	r24, 0x03FE	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    35b0:	80 93 ff 03 	sts	0x03FF, r24	; 0x8003ff <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
    35b4:	90 91 f4 03 	lds	r25, 0x03F4	; 0x8003f4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    35b8:	01 11       	cpse	r16, r1
    35ba:	23 c0       	rjmp	.+70     	; 0x3602 <__vector_7+0xdea>
    35bc:	e9 2f       	mov	r30, r25
    35be:	f0 e0       	ldi	r31, 0x00	; 0
    35c0:	e8 54       	subi	r30, 0x48	; 72
    35c2:	fc 4f       	sbci	r31, 0xFC	; 252
    35c4:	80 81       	ld	r24, Z
    35c6:	89 3f       	cpi	r24, 0xF9	; 249
    35c8:	d0 f0       	brcs	.+52     	; 0x35fe <__vector_7+0xde6>
    35ca:	8f ef       	ldi	r24, 0xFF	; 255
    35cc:	80 83       	st	Z, r24
    35ce:	80 91 f7 03 	lds	r24, 0x03F7	; 0x8003f7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
    35d2:	98 13       	cpse	r25, r24
    35d4:	05 c0       	rjmp	.+10     	; 0x35e0 <__vector_7+0xdc8>
    35d6:	80 91 fe 03 	lds	r24, 0x03FE	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    35da:	8a 5f       	subi	r24, 0xFA	; 250
    35dc:	80 93 fe 03 	sts	0x03FE, r24	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    35e0:	81 e0       	ldi	r24, 0x01	; 1
    35e2:	89 0f       	add	r24, r25
    35e4:	9b 33       	cpi	r25, 0x3B	; 59
    35e6:	08 f0       	brcs	.+2      	; 0x35ea <__vector_7+0xdd2>
    35e8:	80 e0       	ldi	r24, 0x00	; 0
    35ea:	80 93 f4 03 	sts	0x03F4, r24	; 0x8003f4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    35ee:	4d cf       	rjmp	.-358    	; 0x348a <__vector_7+0xc72>
    35f0:	92 53       	subi	r25, 0x32	; 50
    35f2:	90 83       	st	Z, r25
    35f4:	ce cf       	rjmp	.-100    	; 0x3592 <__vector_7+0xd7a>
    35f6:	82 53       	subi	r24, 0x32	; 50
    35f8:	80 93 f5 03 	sts	0x03F5, r24	; 0x8003f5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    35fc:	d7 cf       	rjmp	.-82     	; 0x35ac <__vector_7+0xd94>
    35fe:	8a 5f       	subi	r24, 0xFA	; 250
    3600:	e5 cf       	rjmp	.-54     	; 0x35cc <__vector_7+0xdb4>
    3602:	8e ef       	ldi	r24, 0xFE	; 254
    3604:	80 0f       	add	r24, r16
    3606:	82 30       	cpi	r24, 0x02	; 2
    3608:	58 f7       	brcc	.-42     	; 0x35e0 <__vector_7+0xdc8>
    360a:	11 e0       	ldi	r17, 0x01	; 1
    360c:	03 30       	cpi	r16, 0x03	; 3
    360e:	09 f0       	breq	.+2      	; 0x3612 <__vector_7+0xdfa>
    3610:	10 e0       	ldi	r17, 0x00	; 0
    3612:	8f ef       	ldi	r24, 0xFF	; 255
    3614:	89 0f       	add	r24, r25
    3616:	91 11       	cpse	r25, r1
    3618:	01 c0       	rjmp	.+2      	; 0x361c <__vector_7+0xe04>
    361a:	8b e3       	ldi	r24, 0x3B	; 59
    361c:	e8 2f       	mov	r30, r24
    361e:	f0 e0       	ldi	r31, 0x00	; 0
    3620:	31 e0       	ldi	r19, 0x01	; 1
    3622:	03 30       	cpi	r16, 0x03	; 3
    3624:	09 f4       	brne	.+2      	; 0x3628 <__vector_7+0xe10>
    3626:	30 e0       	ldi	r19, 0x00	; 0
    3628:	e8 54       	subi	r30, 0x48	; 72
    362a:	fc 4f       	sbci	r31, 0xFC	; 252
    362c:	20 81       	ld	r18, Z
    362e:	23 0f       	add	r18, r19
    3630:	20 83       	st	Z, r18
    3632:	f0 90 f7 03 	lds	r15, 0x03F7	; 0x8003f7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
    3636:	8f 11       	cpse	r24, r15
    3638:	05 c0       	rjmp	.+10     	; 0x3644 <__vector_7+0xe2c>
    363a:	20 91 fe 03 	lds	r18, 0x03FE	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    363e:	23 0f       	add	r18, r19
    3640:	20 93 fe 03 	sts	0x03FE, r18	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3644:	80 31       	cpi	r24, 0x10	; 16
    3646:	28 f1       	brcs	.+74     	; 0x3692 <__vector_7+0xe7a>
    3648:	80 51       	subi	r24, 0x10	; 16
    364a:	20 91 f8 03 	lds	r18, 0x03F8	; 0x8003f8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x40>
    364e:	26 95       	lsr	r18
    3650:	26 95       	lsr	r18
    3652:	26 95       	lsr	r18
    3654:	a9 ef       	ldi	r26, 0xF9	; 249
    3656:	b3 e0       	ldi	r27, 0x03	; 3
    3658:	33 e0       	ldi	r19, 0x03	; 3
    365a:	40 e0       	ldi	r20, 0x00	; 0
    365c:	50 91 fe 03 	lds	r21, 0x03FE	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3660:	e8 2f       	mov	r30, r24
    3662:	f0 e0       	ldi	r31, 0x00	; 0
    3664:	61 e0       	ldi	r22, 0x01	; 1
    3666:	72 2f       	mov	r23, r18
    3668:	71 70       	andi	r23, 0x01	; 1
    366a:	71 13       	cpse	r23, r17
    366c:	60 e0       	ldi	r22, 0x00	; 0
    366e:	e8 54       	subi	r30, 0x48	; 72
    3670:	fc 4f       	sbci	r31, 0xFC	; 252
    3672:	70 81       	ld	r23, Z
    3674:	76 0f       	add	r23, r22
    3676:	70 83       	st	Z, r23
    3678:	f8 12       	cpse	r15, r24
    367a:	01 c0       	rjmp	.+2      	; 0x367e <__vector_7+0xe66>
    367c:	56 0f       	add	r21, r22
    367e:	88 23       	and	r24, r24
    3680:	a1 f0       	breq	.+40     	; 0x36aa <__vector_7+0xe92>
    3682:	81 50       	subi	r24, 0x01	; 1
    3684:	26 95       	lsr	r18
    3686:	3f 5f       	subi	r19, 0xFF	; 255
    3688:	45 30       	cpi	r20, 0x05	; 5
    368a:	29 f4       	brne	.+10     	; 0x3696 <__vector_7+0xe7e>
    368c:	36 30       	cpi	r19, 0x06	; 6
    368e:	40 f3       	brcs	.-48     	; 0x3660 <__vector_7+0xe48>
    3690:	04 c0       	rjmp	.+8      	; 0x369a <__vector_7+0xe82>
    3692:	84 5d       	subi	r24, 0xD4	; 212
    3694:	da cf       	rjmp	.-76     	; 0x364a <__vector_7+0xe32>
    3696:	38 30       	cpi	r19, 0x08	; 8
    3698:	19 f7       	brne	.-58     	; 0x3660 <__vector_7+0xe48>
    369a:	50 93 fe 03 	sts	0x03FE, r21	; 0x8003fe <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    369e:	4f 5f       	subi	r20, 0xFF	; 255
    36a0:	2d 91       	ld	r18, X+
    36a2:	30 e0       	ldi	r19, 0x00	; 0
    36a4:	46 30       	cpi	r20, 0x06	; 6
    36a6:	d1 f6       	brne	.-76     	; 0x365c <__vector_7+0xe44>
    36a8:	9b cf       	rjmp	.-202    	; 0x35e0 <__vector_7+0xdc8>
    36aa:	8b e3       	ldi	r24, 0x3B	; 59
    36ac:	eb cf       	rjmp	.-42     	; 0x3684 <__vector_7+0xe6c>
    36ae:	10 92 b4 03 	sts	0x03B4, r1	; 0x8003b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    36b2:	f6 ce       	rjmp	.-532    	; 0x34a0 <__vector_7+0xc88>
    36b4:	10 92 18 04 	sts	0x0418, r1	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    36b8:	f6 ce       	rjmp	.-532    	; 0x34a6 <__vector_7+0xc8e>
    36ba:	8d 81       	ldd	r24, Y+5	; 0x05
    36bc:	81 11       	cpse	r24, r1
    36be:	3c c0       	rjmp	.+120    	; 0x3738 <__vector_7+0xf20>
    36c0:	0e 94 2d 06 	call	0xc5a	; 0xc5a <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.39>
    36c4:	88 30       	cpi	r24, 0x08	; 8
    36c6:	40 f4       	brcc	.+16     	; 0x36d8 <__vector_7+0xec0>
    36c8:	80 91 23 04 	lds	r24, 0x0423	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    36cc:	86 30       	cpi	r24, 0x06	; 6
    36ce:	08 f0       	brcs	.+2      	; 0x36d2 <__vector_7+0xeba>
    36d0:	85 c0       	rjmp	.+266    	; 0x37dc <__vector_7+0xfc4>
    36d2:	8f 5f       	subi	r24, 0xFF	; 255
    36d4:	80 93 23 04 	sts	0x0423, r24	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    36d8:	0e 94 15 06 	call	0xc2a	; 0xc2a <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42>
    36dc:	82 33       	cpi	r24, 0x32	; 50
    36de:	08 f4       	brcc	.+2      	; 0x36e2 <__vector_7+0xeca>
    36e0:	80 c0       	rjmp	.+256    	; 0x37e2 <__vector_7+0xfca>
    36e2:	8b 81       	ldd	r24, Y+3	; 0x03
    36e4:	81 30       	cpi	r24, 0x01	; 1
    36e6:	41 f5       	brne	.+80     	; 0x3738 <__vector_7+0xf20>
    36e8:	0e 94 fd 05 	call	0xbfa	; 0xbfa <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.45>
    36ec:	83 31       	cpi	r24, 0x13	; 19
    36ee:	40 f4       	brcc	.+16     	; 0x3700 <__vector_7+0xee8>
    36f0:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    36f4:	8b 30       	cpi	r24, 0x0B	; 11
    36f6:	08 f0       	brcs	.+2      	; 0x36fa <__vector_7+0xee2>
    36f8:	85 c0       	rjmp	.+266    	; 0x3804 <__vector_7+0xfec>
    36fa:	8f 5f       	subi	r24, 0xFF	; 255
    36fc:	80 93 56 04 	sts	0x0456, r24	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3700:	8a 81       	ldd	r24, Y+2	; 0x02
    3702:	81 30       	cpi	r24, 0x01	; 1
    3704:	c9 f4       	brne	.+50     	; 0x3738 <__vector_7+0xf20>
    3706:	89 81       	ldd	r24, Y+1	; 0x01
    3708:	8a 39       	cpi	r24, 0x9A	; 154
    370a:	b0 f4       	brcc	.+44     	; 0x3738 <__vector_7+0xf20>
    370c:	80 91 64 04 	lds	r24, 0x0464	; 0x800464 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    3710:	89 30       	cpi	r24, 0x09	; 9
    3712:	08 f0       	brcs	.+2      	; 0x3716 <__vector_7+0xefe>
    3714:	7a c0       	rjmp	.+244    	; 0x380a <__vector_7+0xff2>
    3716:	8f 5f       	subi	r24, 0xFF	; 255
    3718:	80 93 64 04 	sts	0x0464, r24	; 0x800464 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    371c:	8a e5       	ldi	r24, 0x5A	; 90
    371e:	94 e0       	ldi	r25, 0x04	; 4
    3720:	0e 94 73 06 	call	0xce6	; 0xce6 <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
    3724:	81 11       	cpse	r24, r1
    3726:	08 c0       	rjmp	.+16     	; 0x3738 <__vector_7+0xf20>
    3728:	80 91 72 04 	lds	r24, 0x0472	; 0x800472 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    372c:	89 30       	cpi	r24, 0x09	; 9
    372e:	08 f0       	brcs	.+2      	; 0x3732 <__vector_7+0xf1a>
    3730:	6f c0       	rjmp	.+222    	; 0x3810 <__vector_7+0xff8>
    3732:	8f 5f       	subi	r24, 0xFF	; 255
    3734:	80 93 72 04 	sts	0x0472, r24	; 0x800472 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3738:	11 e0       	ldi	r17, 0x01	; 1
    373a:	03 30       	cpi	r16, 0x03	; 3
    373c:	21 f0       	breq	.+8      	; 0x3746 <__vector_7+0xf2e>
    373e:	11 e0       	ldi	r17, 0x01	; 1
    3740:	01 30       	cpi	r16, 0x01	; 1
    3742:	09 f0       	breq	.+2      	; 0x3746 <__vector_7+0xf2e>
    3744:	10 e0       	ldi	r17, 0x00	; 0
    3746:	0f 81       	ldd	r16, Y+7	; 0x07
    3748:	05 31       	cpi	r16, 0x15	; 21
    374a:	50 f0       	brcs	.+20     	; 0x3760 <__vector_7+0xf48>
    374c:	05 51       	subi	r16, 0x15	; 21
    374e:	09 30       	cpi	r16, 0x09	; 9
    3750:	38 f4       	brcc	.+14     	; 0x3760 <__vector_7+0xf48>
    3752:	08 30       	cpi	r16, 0x08	; 8
    3754:	09 f0       	breq	.+2      	; 0x3758 <__vector_7+0xf40>
    3756:	5f c0       	rjmp	.+190    	; 0x3816 <__vector_7+0xffe>
    3758:	88 e7       	ldi	r24, 0x78	; 120
    375a:	93 e0       	ldi	r25, 0x03	; 3
    375c:	0e 94 a2 03 	call	0x744	; 0x744 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    3760:	88 e7       	ldi	r24, 0x78	; 120
    3762:	93 e0       	ldi	r25, 0x03	; 3
    3764:	0e 94 23 03 	call	0x646	; 0x646 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    3768:	88 23       	and	r24, r24
    376a:	09 f4       	brne	.+2      	; 0x376e <__vector_7+0xf56>
    376c:	92 ca       	rjmp	.-2780   	; 0x2c92 <__vector_7+0x47a>
    376e:	8f 81       	ldd	r24, Y+7	; 0x07
    3770:	81 31       	cpi	r24, 0x11	; 17
    3772:	09 f4       	brne	.+2      	; 0x3776 <__vector_7+0xf5e>
    3774:	c3 c0       	rjmp	.+390    	; 0x38fc <__vector_7+0x10e4>
    3776:	08 f0       	brcs	.+2      	; 0x377a <__vector_7+0xf62>
    3778:	ac c0       	rjmp	.+344    	; 0x38d2 <__vector_7+0x10ba>
    377a:	8f 30       	cpi	r24, 0x0F	; 15
    377c:	09 f4       	brne	.+2      	; 0x3780 <__vector_7+0xf68>
    377e:	b4 c0       	rjmp	.+360    	; 0x38e8 <__vector_7+0x10d0>
    3780:	80 31       	cpi	r24, 0x10	; 16
    3782:	09 f4       	brne	.+2      	; 0x3786 <__vector_7+0xf6e>
    3784:	b4 c0       	rjmp	.+360    	; 0x38ee <__vector_7+0x10d6>
    3786:	8f 81       	ldd	r24, Y+7	; 0x07
    3788:	8d 31       	cpi	r24, 0x1D	; 29
    378a:	08 f4       	brcc	.+2      	; 0x378e <__vector_7+0xf76>
    378c:	19 c1       	rjmp	.+562    	; 0x39c0 <__vector_7+0x11a8>
    378e:	a3 ee       	ldi	r26, 0xE3	; 227
    3790:	da 2e       	mov	r13, r26
    3792:	d8 0e       	add	r13, r24
    3794:	47 e0       	ldi	r20, 0x07	; 7
    3796:	4d 15       	cp	r20, r13
    3798:	08 f4       	brcc	.+2      	; 0x379c <__vector_7+0xf84>
    379a:	12 c1       	rjmp	.+548    	; 0x39c0 <__vector_7+0x11a8>
    379c:	d4 12       	cpse	r13, r20
    379e:	bf c0       	rjmp	.+382    	; 0x391e <__vector_7+0x1106>
    37a0:	10 92 19 04 	sts	0x0419, r1	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    37a4:	10 92 1a 04 	sts	0x041A, r1	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    37a8:	89 e1       	ldi	r24, 0x19	; 25
    37aa:	80 93 1b 04 	sts	0x041B, r24	; 0x80041b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    37ae:	e0 e0       	ldi	r30, 0x00	; 0
    37b0:	f4 e0       	ldi	r31, 0x04	; 4
    37b2:	49 e1       	ldi	r20, 0x19	; 25
    37b4:	80 e0       	ldi	r24, 0x00	; 0
    37b6:	90 e0       	ldi	r25, 0x00	; 0
    37b8:	20 e0       	ldi	r18, 0x00	; 0
    37ba:	31 91       	ld	r19, Z+
    37bc:	39 17       	cp	r19, r25
    37be:	08 f0       	brcs	.+2      	; 0x37c2 <__vector_7+0xfaa>
    37c0:	aa c0       	rjmp	.+340    	; 0x3916 <__vector_7+0x10fe>
    37c2:	83 17       	cp	r24, r19
    37c4:	08 f4       	brcc	.+2      	; 0x37c8 <__vector_7+0xfb0>
    37c6:	83 2f       	mov	r24, r19
    37c8:	2f 5f       	subi	r18, 0xFF	; 255
    37ca:	28 31       	cpi	r18, 0x18	; 24
    37cc:	b1 f7       	brne	.-20     	; 0x37ba <__vector_7+0xfa2>
    37ce:	90 93 1a 04 	sts	0x041A, r25	; 0x80041a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    37d2:	80 93 19 04 	sts	0x0419, r24	; 0x800419 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    37d6:	40 93 1b 04 	sts	0x041B, r20	; 0x80041b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    37da:	f2 c0       	rjmp	.+484    	; 0x39c0 <__vector_7+0x11a8>
    37dc:	10 92 23 04 	sts	0x0423, r1	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    37e0:	7b cf       	rjmp	.-266    	; 0x36d8 <__vector_7+0xec0>
    37e2:	0e 94 15 06 	call	0xc2a	; 0xc2a <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.42>
    37e6:	9b 81       	ldd	r25, Y+3	; 0x03
    37e8:	89 17       	cp	r24, r25
    37ea:	09 f4       	brne	.+2      	; 0x37ee <__vector_7+0xfd6>
    37ec:	7a cf       	rjmp	.-268    	; 0x36e2 <__vector_7+0xeca>
    37ee:	80 91 46 04 	lds	r24, 0x0446	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    37f2:	8e 31       	cpi	r24, 0x1E	; 30
    37f4:	20 f4       	brcc	.+8      	; 0x37fe <__vector_7+0xfe6>
    37f6:	8f 5f       	subi	r24, 0xFF	; 255
    37f8:	80 93 46 04 	sts	0x0446, r24	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    37fc:	6d cf       	rjmp	.-294    	; 0x36d8 <__vector_7+0xec0>
    37fe:	10 92 46 04 	sts	0x0446, r1	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3802:	6a cf       	rjmp	.-300    	; 0x36d8 <__vector_7+0xec0>
    3804:	10 92 56 04 	sts	0x0456, r1	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3808:	7b cf       	rjmp	.-266    	; 0x3700 <__vector_7+0xee8>
    380a:	10 92 64 04 	sts	0x0464, r1	; 0x800464 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    380e:	86 cf       	rjmp	.-244    	; 0x371c <__vector_7+0xf04>
    3810:	10 92 72 04 	sts	0x0472, r1	; 0x800472 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3814:	91 cf       	rjmp	.-222    	; 0x3738 <__vector_7+0xf20>
    3816:	19 86       	std	Y+9, r1	; 0x09
    3818:	80 91 b4 03 	lds	r24, 0x03B4	; 0x8003b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    381c:	9b e3       	ldi	r25, 0x3B	; 59
    381e:	d9 2e       	mov	r13, r25
    3820:	d8 1a       	sub	r13, r24
    3822:	bc e3       	ldi	r27, 0x3C	; 60
    3824:	ab 2e       	mov	r10, r27
    3826:	bb 24       	eor	r11, r11
    3828:	ba 94       	dec	r11
    382a:	c1 2c       	mov	r12, r1
    382c:	8d 2d       	mov	r24, r13
    382e:	90 e0       	ldi	r25, 0x00	; 0
    3830:	9c 01       	movw	r18, r24
    3832:	28 58       	subi	r18, 0x88	; 136
    3834:	3c 4f       	sbci	r19, 0xFC	; 252
    3836:	79 01       	movw	r14, r18
    3838:	89 85       	ldd	r24, Y+9	; 0x09
    383a:	07 30       	cpi	r16, 0x07	; 7
    383c:	f1 f1       	breq	.+124    	; 0x38ba <__vector_7+0x10a2>
    383e:	48 2f       	mov	r20, r24
    3840:	50 e0       	ldi	r21, 0x00	; 0
    3842:	00 2e       	mov	r0, r16
    3844:	02 c0       	rjmp	.+4      	; 0x384a <__vector_7+0x1032>
    3846:	55 95       	asr	r21
    3848:	47 95       	ror	r20
    384a:	0a 94       	dec	r0
    384c:	e2 f7       	brpl	.-8      	; 0x3846 <__vector_7+0x102e>
    384e:	41 70       	andi	r20, 0x01	; 1
    3850:	61 2f       	mov	r22, r17
    3852:	c7 01       	movw	r24, r14
    3854:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3858:	d7 01       	movw	r26, r14
    385a:	8c 91       	ld	r24, X
    385c:	c8 16       	cp	r12, r24
    385e:	08 f4       	brcc	.+2      	; 0x3862 <__vector_7+0x104a>
    3860:	c8 2e       	mov	r12, r24
    3862:	8b 15       	cp	r24, r11
    3864:	08 f4       	brcc	.+2      	; 0x3868 <__vector_7+0x1050>
    3866:	b8 2e       	mov	r11, r24
    3868:	ba e3       	ldi	r27, 0x3A	; 58
    386a:	bd 15       	cp	r27, r13
    386c:	68 f1       	brcs	.+90     	; 0x38c8 <__vector_7+0x10b0>
    386e:	d3 94       	inc	r13
    3870:	ce 01       	movw	r24, r28
    3872:	09 96       	adiw	r24, 0x09	; 9
    3874:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3878:	aa 94       	dec	r10
    387a:	a1 10       	cpse	r10, r1
    387c:	d7 cf       	rjmp	.-82     	; 0x382c <__vector_7+0x1014>
    387e:	e8 e7       	ldi	r30, 0x78	; 120
    3880:	f3 e0       	ldi	r31, 0x03	; 3
    3882:	af 01       	movw	r20, r30
    3884:	da 01       	movw	r26, r20
    3886:	8d 91       	ld	r24, X+
    3888:	ad 01       	movw	r20, r26
    388a:	9d 01       	movw	r18, r26
    388c:	21 50       	subi	r18, 0x01	; 1
    388e:	31 09       	sbc	r19, r1
    3890:	8b 19       	sub	r24, r11
    3892:	d9 01       	movw	r26, r18
    3894:	8c 93       	st	X, r24
    3896:	b3 e0       	ldi	r27, 0x03	; 3
    3898:	44 3b       	cpi	r20, 0xB4	; 180
    389a:	5b 07       	cpc	r21, r27
    389c:	99 f7       	brne	.-26     	; 0x3884 <__vector_7+0x106c>
    389e:	26 ef       	ldi	r18, 0xF6	; 246
    38a0:	2c 15       	cp	r18, r12
    38a2:	08 f0       	brcs	.+2      	; 0x38a6 <__vector_7+0x108e>
    38a4:	5d cf       	rjmp	.-326    	; 0x3760 <__vector_7+0xf48>
    38a6:	80 81       	ld	r24, Z
    38a8:	89 30       	cpi	r24, 0x09	; 9
    38aa:	80 f4       	brcc	.+32     	; 0x38cc <__vector_7+0x10b4>
    38ac:	10 82       	st	Z, r1
    38ae:	31 96       	adiw	r30, 0x01	; 1
    38b0:	33 e0       	ldi	r19, 0x03	; 3
    38b2:	e4 3b       	cpi	r30, 0xB4	; 180
    38b4:	f3 07       	cpc	r31, r19
    38b6:	b9 f7       	brne	.-18     	; 0x38a6 <__vector_7+0x108e>
    38b8:	53 cf       	rjmp	.-346    	; 0x3760 <__vector_7+0xf48>
    38ba:	0e 94 e1 05 	call	0xbc2	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    38be:	41 e0       	ldi	r20, 0x01	; 1
    38c0:	81 11       	cpse	r24, r1
    38c2:	c6 cf       	rjmp	.-116    	; 0x3850 <__vector_7+0x1038>
    38c4:	40 e0       	ldi	r20, 0x00	; 0
    38c6:	c4 cf       	rjmp	.-120    	; 0x3850 <__vector_7+0x1038>
    38c8:	d1 2c       	mov	r13, r1
    38ca:	d2 cf       	rjmp	.-92     	; 0x3870 <__vector_7+0x1058>
    38cc:	88 50       	subi	r24, 0x08	; 8
    38ce:	80 83       	st	Z, r24
    38d0:	ee cf       	rjmp	.-36     	; 0x38ae <__vector_7+0x1096>
    38d2:	83 31       	cpi	r24, 0x13	; 19
    38d4:	d9 f0       	breq	.+54     	; 0x390c <__vector_7+0x10f4>
    38d6:	b8 f0       	brcs	.+46     	; 0x3906 <__vector_7+0x10ee>
    38d8:	8a 33       	cpi	r24, 0x3A	; 58
    38da:	09 f0       	breq	.+2      	; 0x38de <__vector_7+0x10c6>
    38dc:	54 cf       	rjmp	.-344    	; 0x3786 <__vector_7+0xf6e>
    38de:	61 2f       	mov	r22, r17
    38e0:	61 70       	andi	r22, 0x01	; 1
    38e2:	83 e7       	ldi	r24, 0x73	; 115
    38e4:	93 e0       	ldi	r25, 0x03	; 3
    38e6:	07 c0       	rjmp	.+14     	; 0x38f6 <__vector_7+0x10de>
    38e8:	10 93 6f 03 	sts	0x036F, r17	; 0x80036f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
    38ec:	4c cf       	rjmp	.-360    	; 0x3786 <__vector_7+0xf6e>
    38ee:	61 2f       	mov	r22, r17
    38f0:	61 70       	andi	r22, 0x01	; 1
    38f2:	80 e7       	ldi	r24, 0x70	; 112
    38f4:	93 e0       	ldi	r25, 0x03	; 3
    38f6:	0e 94 d0 05 	call	0xba0	; 0xba0 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab>
    38fa:	45 cf       	rjmp	.-374    	; 0x3786 <__vector_7+0xf6e>
    38fc:	61 2f       	mov	r22, r17
    38fe:	61 70       	andi	r22, 0x01	; 1
    3900:	81 e7       	ldi	r24, 0x71	; 113
    3902:	93 e0       	ldi	r25, 0x03	; 3
    3904:	f8 cf       	rjmp	.-16     	; 0x38f6 <__vector_7+0x10de>
    3906:	61 e0       	ldi	r22, 0x01	; 1
    3908:	61 27       	eor	r22, r17
    390a:	fa cf       	rjmp	.-12     	; 0x3900 <__vector_7+0x10e8>
    390c:	61 2f       	mov	r22, r17
    390e:	61 70       	andi	r22, 0x01	; 1
    3910:	82 e7       	ldi	r24, 0x72	; 114
    3912:	93 e0       	ldi	r25, 0x03	; 3
    3914:	f0 cf       	rjmp	.-32     	; 0x38f6 <__vector_7+0x10de>
    3916:	42 2f       	mov	r20, r18
    3918:	89 2f       	mov	r24, r25
    391a:	93 2f       	mov	r25, r19
    391c:	55 cf       	rjmp	.-342    	; 0x37c8 <__vector_7+0xfb0>
    391e:	19 86       	std	Y+9, r1	; 0x09
    3920:	80 91 18 04 	lds	r24, 0x0418	; 0x800418 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3924:	07 e1       	ldi	r16, 0x17	; 23
    3926:	08 1b       	sub	r16, r24
    3928:	f8 e1       	ldi	r31, 0x18	; 24
    392a:	af 2e       	mov	r10, r31
    392c:	bb 24       	eor	r11, r11
    392e:	ba 94       	dec	r11
    3930:	c1 2c       	mov	r12, r1
    3932:	80 2f       	mov	r24, r16
    3934:	90 e0       	ldi	r25, 0x00	; 0
    3936:	dc 01       	movw	r26, r24
    3938:	a0 50       	subi	r26, 0x00	; 0
    393a:	bc 4f       	sbci	r27, 0xFC	; 252
    393c:	7d 01       	movw	r14, r26
    393e:	89 85       	ldd	r24, Y+9	; 0x09
    3940:	b6 e0       	ldi	r27, 0x06	; 6
    3942:	db 16       	cp	r13, r27
    3944:	09 f4       	brne	.+2      	; 0x3948 <__vector_7+0x1130>
    3946:	66 c0       	rjmp	.+204    	; 0x3a14 <__vector_7+0x11fc>
    3948:	48 2f       	mov	r20, r24
    394a:	50 e0       	ldi	r21, 0x00	; 0
    394c:	0d 2c       	mov	r0, r13
    394e:	02 c0       	rjmp	.+4      	; 0x3954 <__vector_7+0x113c>
    3950:	55 95       	asr	r21
    3952:	47 95       	ror	r20
    3954:	0a 94       	dec	r0
    3956:	e2 f7       	brpl	.-8      	; 0x3950 <__vector_7+0x1138>
    3958:	41 70       	andi	r20, 0x01	; 1
    395a:	61 2f       	mov	r22, r17
    395c:	c7 01       	movw	r24, r14
    395e:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3962:	f7 01       	movw	r30, r14
    3964:	80 81       	ld	r24, Z
    3966:	c8 16       	cp	r12, r24
    3968:	08 f4       	brcc	.+2      	; 0x396c <__vector_7+0x1154>
    396a:	c8 2e       	mov	r12, r24
    396c:	8b 15       	cp	r24, r11
    396e:	08 f4       	brcc	.+2      	; 0x3972 <__vector_7+0x115a>
    3970:	b8 2e       	mov	r11, r24
    3972:	07 31       	cpi	r16, 0x17	; 23
    3974:	08 f0       	brcs	.+2      	; 0x3978 <__vector_7+0x1160>
    3976:	55 c0       	rjmp	.+170    	; 0x3a22 <__vector_7+0x120a>
    3978:	0f 5f       	subi	r16, 0xFF	; 255
    397a:	ce 01       	movw	r24, r28
    397c:	09 96       	adiw	r24, 0x09	; 9
    397e:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3982:	aa 94       	dec	r10
    3984:	a1 10       	cpse	r10, r1
    3986:	d5 cf       	rjmp	.-86     	; 0x3932 <__vector_7+0x111a>
    3988:	e0 e0       	ldi	r30, 0x00	; 0
    398a:	f4 e0       	ldi	r31, 0x04	; 4
    398c:	af 01       	movw	r20, r30
    398e:	da 01       	movw	r26, r20
    3990:	8d 91       	ld	r24, X+
    3992:	ad 01       	movw	r20, r26
    3994:	9d 01       	movw	r18, r26
    3996:	21 50       	subi	r18, 0x01	; 1
    3998:	31 09       	sbc	r19, r1
    399a:	8b 19       	sub	r24, r11
    399c:	d9 01       	movw	r26, r18
    399e:	8c 93       	st	X, r24
    39a0:	b4 e0       	ldi	r27, 0x04	; 4
    39a2:	48 31       	cpi	r20, 0x18	; 24
    39a4:	5b 07       	cpc	r21, r27
    39a6:	99 f7       	brne	.-26     	; 0x398e <__vector_7+0x1176>
    39a8:	27 ef       	ldi	r18, 0xF7	; 247
    39aa:	2c 15       	cp	r18, r12
    39ac:	48 f4       	brcc	.+18     	; 0x39c0 <__vector_7+0x11a8>
    39ae:	80 81       	ld	r24, Z
    39b0:	88 30       	cpi	r24, 0x08	; 8
    39b2:	c8 f5       	brcc	.+114    	; 0x3a26 <__vector_7+0x120e>
    39b4:	10 82       	st	Z, r1
    39b6:	31 96       	adiw	r30, 0x01	; 1
    39b8:	34 e0       	ldi	r19, 0x04	; 4
    39ba:	e8 31       	cpi	r30, 0x18	; 24
    39bc:	f3 07       	cpc	r31, r19
    39be:	b9 f7       	brne	.-18     	; 0x39ae <__vector_7+0x1196>
    39c0:	8f 81       	ldd	r24, Y+7	; 0x07
    39c2:	8a 32       	cpi	r24, 0x2A	; 42
    39c4:	08 f4       	brcc	.+2      	; 0x39c8 <__vector_7+0x11b0>
    39c6:	82 c0       	rjmp	.+260    	; 0x3acc <__vector_7+0x12b4>
    39c8:	e6 ed       	ldi	r30, 0xD6	; 214
    39ca:	de 2e       	mov	r13, r30
    39cc:	d8 0e       	add	r13, r24
    39ce:	43 e0       	ldi	r20, 0x03	; 3
    39d0:	4d 15       	cp	r20, r13
    39d2:	08 f4       	brcc	.+2      	; 0x39d6 <__vector_7+0x11be>
    39d4:	7b c0       	rjmp	.+246    	; 0x3acc <__vector_7+0x12b4>
    39d6:	d4 12       	cpse	r13, r20
    39d8:	2d c0       	rjmp	.+90     	; 0x3a34 <__vector_7+0x121c>
    39da:	10 92 24 04 	sts	0x0424, r1	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    39de:	10 92 25 04 	sts	0x0425, r1	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    39e2:	88 e0       	ldi	r24, 0x08	; 8
    39e4:	80 93 26 04 	sts	0x0426, r24	; 0x800426 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    39e8:	ec e1       	ldi	r30, 0x1C	; 28
    39ea:	f4 e0       	ldi	r31, 0x04	; 4
    39ec:	48 e0       	ldi	r20, 0x08	; 8
    39ee:	80 e0       	ldi	r24, 0x00	; 0
    39f0:	90 e0       	ldi	r25, 0x00	; 0
    39f2:	20 e0       	ldi	r18, 0x00	; 0
    39f4:	31 91       	ld	r19, Z+
    39f6:	39 17       	cp	r19, r25
    39f8:	c8 f4       	brcc	.+50     	; 0x3a2c <__vector_7+0x1214>
    39fa:	83 17       	cp	r24, r19
    39fc:	08 f4       	brcc	.+2      	; 0x3a00 <__vector_7+0x11e8>
    39fe:	83 2f       	mov	r24, r19
    3a00:	2f 5f       	subi	r18, 0xFF	; 255
    3a02:	27 30       	cpi	r18, 0x07	; 7
    3a04:	b9 f7       	brne	.-18     	; 0x39f4 <__vector_7+0x11dc>
    3a06:	90 93 25 04 	sts	0x0425, r25	; 0x800425 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    3a0a:	80 93 24 04 	sts	0x0424, r24	; 0x800424 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    3a0e:	40 93 26 04 	sts	0x0426, r20	; 0x800426 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    3a12:	5c c0       	rjmp	.+184    	; 0x3acc <__vector_7+0x12b4>
    3a14:	0e 94 e1 05 	call	0xbc2	; 0xbc2 <_ZN8Internal16Arithmetic_Tools6parityEh>
    3a18:	41 e0       	ldi	r20, 0x01	; 1
    3a1a:	81 11       	cpse	r24, r1
    3a1c:	9e cf       	rjmp	.-196    	; 0x395a <__vector_7+0x1142>
    3a1e:	40 e0       	ldi	r20, 0x00	; 0
    3a20:	9c cf       	rjmp	.-200    	; 0x395a <__vector_7+0x1142>
    3a22:	00 e0       	ldi	r16, 0x00	; 0
    3a24:	aa cf       	rjmp	.-172    	; 0x397a <__vector_7+0x1162>
    3a26:	87 50       	subi	r24, 0x07	; 7
    3a28:	80 83       	st	Z, r24
    3a2a:	c5 cf       	rjmp	.-118    	; 0x39b6 <__vector_7+0x119e>
    3a2c:	42 2f       	mov	r20, r18
    3a2e:	89 2f       	mov	r24, r25
    3a30:	93 2f       	mov	r25, r19
    3a32:	e6 cf       	rjmp	.-52     	; 0x3a00 <__vector_7+0x11e8>
    3a34:	81 e0       	ldi	r24, 0x01	; 1
    3a36:	89 87       	std	Y+9, r24	; 0x09
    3a38:	80 91 23 04 	lds	r24, 0x0423	; 0x800423 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    3a3c:	06 e0       	ldi	r16, 0x06	; 6
    3a3e:	08 1b       	sub	r16, r24
    3a40:	77 e0       	ldi	r23, 0x07	; 7
    3a42:	c7 2e       	mov	r12, r23
    3a44:	ee 24       	eor	r14, r14
    3a46:	ea 94       	dec	r14
    3a48:	f1 2c       	mov	r15, r1
    3a4a:	49 85       	ldd	r20, Y+9	; 0x09
    3a4c:	50 e0       	ldi	r21, 0x00	; 0
    3a4e:	0d 2c       	mov	r0, r13
    3a50:	02 c0       	rjmp	.+4      	; 0x3a56 <__vector_7+0x123e>
    3a52:	55 95       	asr	r21
    3a54:	47 95       	ror	r20
    3a56:	0a 94       	dec	r0
    3a58:	e2 f7       	brpl	.-8      	; 0x3a52 <__vector_7+0x123a>
    3a5a:	41 70       	andi	r20, 0x01	; 1
    3a5c:	80 2f       	mov	r24, r16
    3a5e:	90 e0       	ldi	r25, 0x00	; 0
    3a60:	dc 01       	movw	r26, r24
    3a62:	a4 5e       	subi	r26, 0xE4	; 228
    3a64:	bb 4f       	sbci	r27, 0xFB	; 251
    3a66:	5d 01       	movw	r10, r26
    3a68:	61 2f       	mov	r22, r17
    3a6a:	cd 01       	movw	r24, r26
    3a6c:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3a70:	f5 01       	movw	r30, r10
    3a72:	80 81       	ld	r24, Z
    3a74:	f8 16       	cp	r15, r24
    3a76:	08 f4       	brcc	.+2      	; 0x3a7a <__vector_7+0x1262>
    3a78:	f8 2e       	mov	r15, r24
    3a7a:	8e 15       	cp	r24, r14
    3a7c:	08 f4       	brcc	.+2      	; 0x3a80 <__vector_7+0x1268>
    3a7e:	e8 2e       	mov	r14, r24
    3a80:	06 30       	cpi	r16, 0x06	; 6
    3a82:	08 f0       	brcs	.+2      	; 0x3a86 <__vector_7+0x126e>
    3a84:	4d c0       	rjmp	.+154    	; 0x3b20 <__vector_7+0x1308>
    3a86:	0f 5f       	subi	r16, 0xFF	; 255
    3a88:	ce 01       	movw	r24, r28
    3a8a:	09 96       	adiw	r24, 0x09	; 9
    3a8c:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3a90:	ca 94       	dec	r12
    3a92:	c1 10       	cpse	r12, r1
    3a94:	da cf       	rjmp	.-76     	; 0x3a4a <__vector_7+0x1232>
    3a96:	ec e1       	ldi	r30, 0x1C	; 28
    3a98:	f4 e0       	ldi	r31, 0x04	; 4
    3a9a:	af 01       	movw	r20, r30
    3a9c:	da 01       	movw	r26, r20
    3a9e:	8d 91       	ld	r24, X+
    3aa0:	ad 01       	movw	r20, r26
    3aa2:	9d 01       	movw	r18, r26
    3aa4:	21 50       	subi	r18, 0x01	; 1
    3aa6:	31 09       	sbc	r19, r1
    3aa8:	8e 19       	sub	r24, r14
    3aaa:	d9 01       	movw	r26, r18
    3aac:	8c 93       	st	X, r24
    3aae:	b4 e0       	ldi	r27, 0x04	; 4
    3ab0:	43 32       	cpi	r20, 0x23	; 35
    3ab2:	5b 07       	cpc	r21, r27
    3ab4:	99 f7       	brne	.-26     	; 0x3a9c <__vector_7+0x1284>
    3ab6:	2b ef       	ldi	r18, 0xFB	; 251
    3ab8:	2f 15       	cp	r18, r15
    3aba:	40 f4       	brcc	.+16     	; 0x3acc <__vector_7+0x12b4>
    3abc:	80 81       	ld	r24, Z
    3abe:	84 30       	cpi	r24, 0x04	; 4
    3ac0:	88 f5       	brcc	.+98     	; 0x3b24 <__vector_7+0x130c>
    3ac2:	10 82       	st	Z, r1
    3ac4:	31 96       	adiw	r30, 0x01	; 1
    3ac6:	4e 17       	cp	r20, r30
    3ac8:	5f 07       	cpc	r21, r31
    3aca:	c1 f7       	brne	.-16     	; 0x3abc <__vector_7+0x12a4>
    3acc:	8f 81       	ldd	r24, Y+7	; 0x07
    3ace:	84 32       	cpi	r24, 0x24	; 36
    3ad0:	08 f4       	brcc	.+2      	; 0x3ad4 <__vector_7+0x12bc>
    3ad2:	7c c0       	rjmp	.+248    	; 0x3bcc <__vector_7+0x13b4>
    3ad4:	6c ed       	ldi	r22, 0xDC	; 220
    3ad6:	d6 2e       	mov	r13, r22
    3ad8:	d8 0e       	add	r13, r24
    3ada:	36 e0       	ldi	r19, 0x06	; 6
    3adc:	3d 15       	cp	r19, r13
    3ade:	08 f4       	brcc	.+2      	; 0x3ae2 <__vector_7+0x12ca>
    3ae0:	75 c0       	rjmp	.+234    	; 0x3bcc <__vector_7+0x13b4>
    3ae2:	d3 12       	cpse	r13, r19
    3ae4:	26 c0       	rjmp	.+76     	; 0x3b32 <__vector_7+0x131a>
    3ae6:	10 92 47 04 	sts	0x0447, r1	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    3aea:	10 92 48 04 	sts	0x0448, r1	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3aee:	80 e2       	ldi	r24, 0x20	; 32
    3af0:	80 93 49 04 	sts	0x0449, r24	; 0x800449 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3af4:	e7 e2       	ldi	r30, 0x27	; 39
    3af6:	f4 e0       	ldi	r31, 0x04	; 4
    3af8:	40 e2       	ldi	r20, 0x20	; 32
    3afa:	80 e0       	ldi	r24, 0x00	; 0
    3afc:	90 e0       	ldi	r25, 0x00	; 0
    3afe:	20 e0       	ldi	r18, 0x00	; 0
    3b00:	31 91       	ld	r19, Z+
    3b02:	39 17       	cp	r19, r25
    3b04:	90 f4       	brcc	.+36     	; 0x3b2a <__vector_7+0x1312>
    3b06:	83 17       	cp	r24, r19
    3b08:	08 f4       	brcc	.+2      	; 0x3b0c <__vector_7+0x12f4>
    3b0a:	83 2f       	mov	r24, r19
    3b0c:	2f 5f       	subi	r18, 0xFF	; 255
    3b0e:	2f 31       	cpi	r18, 0x1F	; 31
    3b10:	b9 f7       	brne	.-18     	; 0x3b00 <__vector_7+0x12e8>
    3b12:	90 93 48 04 	sts	0x0448, r25	; 0x800448 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3b16:	80 93 47 04 	sts	0x0447, r24	; 0x800447 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    3b1a:	40 93 49 04 	sts	0x0449, r20	; 0x800449 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3b1e:	56 c0       	rjmp	.+172    	; 0x3bcc <__vector_7+0x13b4>
    3b20:	00 e0       	ldi	r16, 0x00	; 0
    3b22:	b2 cf       	rjmp	.-156    	; 0x3a88 <__vector_7+0x1270>
    3b24:	83 50       	subi	r24, 0x03	; 3
    3b26:	80 83       	st	Z, r24
    3b28:	cd cf       	rjmp	.-102    	; 0x3ac4 <__vector_7+0x12ac>
    3b2a:	42 2f       	mov	r20, r18
    3b2c:	89 2f       	mov	r24, r25
    3b2e:	93 2f       	mov	r25, r19
    3b30:	ed cf       	rjmp	.-38     	; 0x3b0c <__vector_7+0x12f4>
    3b32:	81 e0       	ldi	r24, 0x01	; 1
    3b34:	89 87       	std	Y+9, r24	; 0x09
    3b36:	80 91 46 04 	lds	r24, 0x0446	; 0x800446 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3b3a:	0e e1       	ldi	r16, 0x1E	; 30
    3b3c:	08 1b       	sub	r16, r24
    3b3e:	5f e1       	ldi	r21, 0x1F	; 31
    3b40:	c5 2e       	mov	r12, r21
    3b42:	ee 24       	eor	r14, r14
    3b44:	ea 94       	dec	r14
    3b46:	f1 2c       	mov	r15, r1
    3b48:	49 85       	ldd	r20, Y+9	; 0x09
    3b4a:	50 e0       	ldi	r21, 0x00	; 0
    3b4c:	0d 2c       	mov	r0, r13
    3b4e:	02 c0       	rjmp	.+4      	; 0x3b54 <__vector_7+0x133c>
    3b50:	55 95       	asr	r21
    3b52:	47 95       	ror	r20
    3b54:	0a 94       	dec	r0
    3b56:	e2 f7       	brpl	.-8      	; 0x3b50 <__vector_7+0x1338>
    3b58:	41 70       	andi	r20, 0x01	; 1
    3b5a:	80 2f       	mov	r24, r16
    3b5c:	90 e0       	ldi	r25, 0x00	; 0
    3b5e:	dc 01       	movw	r26, r24
    3b60:	a9 5d       	subi	r26, 0xD9	; 217
    3b62:	bb 4f       	sbci	r27, 0xFB	; 251
    3b64:	5d 01       	movw	r10, r26
    3b66:	61 2f       	mov	r22, r17
    3b68:	cd 01       	movw	r24, r26
    3b6a:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3b6e:	f5 01       	movw	r30, r10
    3b70:	80 81       	ld	r24, Z
    3b72:	f8 16       	cp	r15, r24
    3b74:	08 f4       	brcc	.+2      	; 0x3b78 <__vector_7+0x1360>
    3b76:	f8 2e       	mov	r15, r24
    3b78:	8e 15       	cp	r24, r14
    3b7a:	08 f4       	brcc	.+2      	; 0x3b7e <__vector_7+0x1366>
    3b7c:	e8 2e       	mov	r14, r24
    3b7e:	0e 31       	cpi	r16, 0x1E	; 30
    3b80:	08 f0       	brcs	.+2      	; 0x3b84 <__vector_7+0x136c>
    3b82:	4e c0       	rjmp	.+156    	; 0x3c20 <__vector_7+0x1408>
    3b84:	0f 5f       	subi	r16, 0xFF	; 255
    3b86:	ce 01       	movw	r24, r28
    3b88:	09 96       	adiw	r24, 0x09	; 9
    3b8a:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3b8e:	ca 94       	dec	r12
    3b90:	c1 10       	cpse	r12, r1
    3b92:	da cf       	rjmp	.-76     	; 0x3b48 <__vector_7+0x1330>
    3b94:	e7 e2       	ldi	r30, 0x27	; 39
    3b96:	f4 e0       	ldi	r31, 0x04	; 4
    3b98:	af 01       	movw	r20, r30
    3b9a:	da 01       	movw	r26, r20
    3b9c:	8d 91       	ld	r24, X+
    3b9e:	ad 01       	movw	r20, r26
    3ba0:	9d 01       	movw	r18, r26
    3ba2:	21 50       	subi	r18, 0x01	; 1
    3ba4:	31 09       	sbc	r19, r1
    3ba6:	8e 19       	sub	r24, r14
    3ba8:	d9 01       	movw	r26, r18
    3baa:	8c 93       	st	X, r24
    3bac:	b4 e0       	ldi	r27, 0x04	; 4
    3bae:	46 34       	cpi	r20, 0x46	; 70
    3bb0:	5b 07       	cpc	r21, r27
    3bb2:	99 f7       	brne	.-26     	; 0x3b9a <__vector_7+0x1382>
    3bb4:	28 ef       	ldi	r18, 0xF8	; 248
    3bb6:	2f 15       	cp	r18, r15
    3bb8:	48 f4       	brcc	.+18     	; 0x3bcc <__vector_7+0x13b4>
    3bba:	80 81       	ld	r24, Z
    3bbc:	87 30       	cpi	r24, 0x07	; 7
    3bbe:	90 f5       	brcc	.+100    	; 0x3c24 <__vector_7+0x140c>
    3bc0:	10 82       	st	Z, r1
    3bc2:	31 96       	adiw	r30, 0x01	; 1
    3bc4:	34 e0       	ldi	r19, 0x04	; 4
    3bc6:	e6 34       	cpi	r30, 0x46	; 70
    3bc8:	f3 07       	cpc	r31, r19
    3bca:	b9 f7       	brne	.-18     	; 0x3bba <__vector_7+0x13a2>
    3bcc:	8f 81       	ldd	r24, Y+7	; 0x07
    3bce:	8d 32       	cpi	r24, 0x2D	; 45
    3bd0:	08 f4       	brcc	.+2      	; 0x3bd4 <__vector_7+0x13bc>
    3bd2:	7c c0       	rjmp	.+248    	; 0x3ccc <__vector_7+0x14b4>
    3bd4:	43 ed       	ldi	r20, 0xD3	; 211
    3bd6:	d4 2e       	mov	r13, r20
    3bd8:	d8 0e       	add	r13, r24
    3bda:	46 e0       	ldi	r20, 0x06	; 6
    3bdc:	4d 15       	cp	r20, r13
    3bde:	08 f4       	brcc	.+2      	; 0x3be2 <__vector_7+0x13ca>
    3be0:	75 c0       	rjmp	.+234    	; 0x3ccc <__vector_7+0x14b4>
    3be2:	d4 12       	cpse	r13, r20
    3be4:	26 c0       	rjmp	.+76     	; 0x3c32 <__vector_7+0x141a>
    3be6:	10 92 57 04 	sts	0x0457, r1	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    3bea:	10 92 58 04 	sts	0x0458, r1	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    3bee:	8d e0       	ldi	r24, 0x0D	; 13
    3bf0:	80 93 59 04 	sts	0x0459, r24	; 0x800459 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    3bf4:	ea e4       	ldi	r30, 0x4A	; 74
    3bf6:	f4 e0       	ldi	r31, 0x04	; 4
    3bf8:	4d e0       	ldi	r20, 0x0D	; 13
    3bfa:	80 e0       	ldi	r24, 0x00	; 0
    3bfc:	90 e0       	ldi	r25, 0x00	; 0
    3bfe:	20 e0       	ldi	r18, 0x00	; 0
    3c00:	31 91       	ld	r19, Z+
    3c02:	38 17       	cp	r19, r24
    3c04:	90 f4       	brcc	.+36     	; 0x3c2a <__vector_7+0x1412>
    3c06:	93 17       	cp	r25, r19
    3c08:	08 f4       	brcc	.+2      	; 0x3c0c <__vector_7+0x13f4>
    3c0a:	93 2f       	mov	r25, r19
    3c0c:	2f 5f       	subi	r18, 0xFF	; 255
    3c0e:	2c 30       	cpi	r18, 0x0C	; 12
    3c10:	b9 f7       	brne	.-18     	; 0x3c00 <__vector_7+0x13e8>
    3c12:	90 93 57 04 	sts	0x0457, r25	; 0x800457 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    3c16:	80 93 58 04 	sts	0x0458, r24	; 0x800458 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    3c1a:	40 93 59 04 	sts	0x0459, r20	; 0x800459 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    3c1e:	56 c0       	rjmp	.+172    	; 0x3ccc <__vector_7+0x14b4>
    3c20:	00 e0       	ldi	r16, 0x00	; 0
    3c22:	b1 cf       	rjmp	.-158    	; 0x3b86 <__vector_7+0x136e>
    3c24:	86 50       	subi	r24, 0x06	; 6
    3c26:	80 83       	st	Z, r24
    3c28:	cc cf       	rjmp	.-104    	; 0x3bc2 <__vector_7+0x13aa>
    3c2a:	42 2f       	mov	r20, r18
    3c2c:	98 2f       	mov	r25, r24
    3c2e:	83 2f       	mov	r24, r19
    3c30:	ed cf       	rjmp	.-38     	; 0x3c0c <__vector_7+0x13f4>
    3c32:	81 e0       	ldi	r24, 0x01	; 1
    3c34:	89 87       	std	Y+9, r24	; 0x09
    3c36:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3c3a:	0b e0       	ldi	r16, 0x0B	; 11
    3c3c:	08 1b       	sub	r16, r24
    3c3e:	3c e0       	ldi	r19, 0x0C	; 12
    3c40:	c3 2e       	mov	r12, r19
    3c42:	ee 24       	eor	r14, r14
    3c44:	ea 94       	dec	r14
    3c46:	f1 2c       	mov	r15, r1
    3c48:	49 85       	ldd	r20, Y+9	; 0x09
    3c4a:	50 e0       	ldi	r21, 0x00	; 0
    3c4c:	0d 2c       	mov	r0, r13
    3c4e:	02 c0       	rjmp	.+4      	; 0x3c54 <__vector_7+0x143c>
    3c50:	55 95       	asr	r21
    3c52:	47 95       	ror	r20
    3c54:	0a 94       	dec	r0
    3c56:	e2 f7       	brpl	.-8      	; 0x3c50 <__vector_7+0x1438>
    3c58:	41 70       	andi	r20, 0x01	; 1
    3c5a:	80 2f       	mov	r24, r16
    3c5c:	90 e0       	ldi	r25, 0x00	; 0
    3c5e:	dc 01       	movw	r26, r24
    3c60:	a6 5b       	subi	r26, 0xB6	; 182
    3c62:	bb 4f       	sbci	r27, 0xFB	; 251
    3c64:	5d 01       	movw	r10, r26
    3c66:	61 2f       	mov	r22, r17
    3c68:	cd 01       	movw	r24, r26
    3c6a:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3c6e:	f5 01       	movw	r30, r10
    3c70:	80 81       	ld	r24, Z
    3c72:	f8 16       	cp	r15, r24
    3c74:	08 f4       	brcc	.+2      	; 0x3c78 <__vector_7+0x1460>
    3c76:	f8 2e       	mov	r15, r24
    3c78:	8e 15       	cp	r24, r14
    3c7a:	08 f4       	brcc	.+2      	; 0x3c7e <__vector_7+0x1466>
    3c7c:	e8 2e       	mov	r14, r24
    3c7e:	0b 30       	cpi	r16, 0x0B	; 11
    3c80:	08 f0       	brcs	.+2      	; 0x3c84 <__vector_7+0x146c>
    3c82:	4f c0       	rjmp	.+158    	; 0x3d22 <__vector_7+0x150a>
    3c84:	0f 5f       	subi	r16, 0xFF	; 255
    3c86:	ce 01       	movw	r24, r28
    3c88:	09 96       	adiw	r24, 0x09	; 9
    3c8a:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3c8e:	ca 94       	dec	r12
    3c90:	c1 10       	cpse	r12, r1
    3c92:	da cf       	rjmp	.-76     	; 0x3c48 <__vector_7+0x1430>
    3c94:	ea e4       	ldi	r30, 0x4A	; 74
    3c96:	f4 e0       	ldi	r31, 0x04	; 4
    3c98:	26 e5       	ldi	r18, 0x56	; 86
    3c9a:	34 e0       	ldi	r19, 0x04	; 4
    3c9c:	bf 01       	movw	r22, r30
    3c9e:	db 01       	movw	r26, r22
    3ca0:	8d 91       	ld	r24, X+
    3ca2:	bd 01       	movw	r22, r26
    3ca4:	ad 01       	movw	r20, r26
    3ca6:	41 50       	subi	r20, 0x01	; 1
    3ca8:	51 09       	sbc	r21, r1
    3caa:	8e 19       	sub	r24, r14
    3cac:	da 01       	movw	r26, r20
    3cae:	8c 93       	st	X, r24
    3cb0:	26 17       	cp	r18, r22
    3cb2:	37 07       	cpc	r19, r23
    3cb4:	a1 f7       	brne	.-24     	; 0x3c9e <__vector_7+0x1486>
    3cb6:	b8 ef       	ldi	r27, 0xF8	; 248
    3cb8:	bf 15       	cp	r27, r15
    3cba:	40 f4       	brcc	.+16     	; 0x3ccc <__vector_7+0x14b4>
    3cbc:	80 81       	ld	r24, Z
    3cbe:	87 30       	cpi	r24, 0x07	; 7
    3cc0:	90 f5       	brcc	.+100    	; 0x3d26 <__vector_7+0x150e>
    3cc2:	10 82       	st	Z, r1
    3cc4:	31 96       	adiw	r30, 0x01	; 1
    3cc6:	e6 17       	cp	r30, r22
    3cc8:	f7 07       	cpc	r31, r23
    3cca:	c1 f7       	brne	.-16     	; 0x3cbc <__vector_7+0x14a4>
    3ccc:	ff 80       	ldd	r15, Y+7	; 0x07
    3cce:	e1 e3       	ldi	r30, 0x31	; 49
    3cd0:	ef 15       	cp	r30, r15
    3cd2:	08 f0       	brcs	.+2      	; 0x3cd6 <__vector_7+0x14be>
    3cd4:	7b c0       	rjmp	.+246    	; 0x3dcc <__vector_7+0x15b4>
    3cd6:	2e ec       	ldi	r18, 0xCE	; 206
    3cd8:	92 2e       	mov	r9, r18
    3cda:	9f 0c       	add	r9, r15
    3cdc:	f4 e0       	ldi	r31, 0x04	; 4
    3cde:	f9 15       	cp	r31, r9
    3ce0:	08 f4       	brcc	.+2      	; 0x3ce4 <__vector_7+0x14cc>
    3ce2:	74 c0       	rjmp	.+232    	; 0x3dcc <__vector_7+0x15b4>
    3ce4:	9f 12       	cpse	r9, r31
    3ce6:	26 c0       	rjmp	.+76     	; 0x3d34 <__vector_7+0x151c>
    3ce8:	10 92 65 04 	sts	0x0465, r1	; 0x800465 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
    3cec:	10 92 66 04 	sts	0x0466, r1	; 0x800466 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
    3cf0:	8b e0       	ldi	r24, 0x0B	; 11
    3cf2:	80 93 67 04 	sts	0x0467, r24	; 0x800467 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
    3cf6:	ea e5       	ldi	r30, 0x5A	; 90
    3cf8:	f4 e0       	ldi	r31, 0x04	; 4
    3cfa:	4b e0       	ldi	r20, 0x0B	; 11
    3cfc:	80 e0       	ldi	r24, 0x00	; 0
    3cfe:	90 e0       	ldi	r25, 0x00	; 0
    3d00:	20 e0       	ldi	r18, 0x00	; 0
    3d02:	31 91       	ld	r19, Z+
    3d04:	38 17       	cp	r19, r24
    3d06:	90 f4       	brcc	.+36     	; 0x3d2c <__vector_7+0x1514>
    3d08:	93 17       	cp	r25, r19
    3d0a:	08 f4       	brcc	.+2      	; 0x3d0e <__vector_7+0x14f6>
    3d0c:	93 2f       	mov	r25, r19
    3d0e:	2f 5f       	subi	r18, 0xFF	; 255
    3d10:	2a 30       	cpi	r18, 0x0A	; 10
    3d12:	b9 f7       	brne	.-18     	; 0x3d02 <__vector_7+0x14ea>
    3d14:	90 93 65 04 	sts	0x0465, r25	; 0x800465 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
    3d18:	80 93 66 04 	sts	0x0466, r24	; 0x800466 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
    3d1c:	40 93 67 04 	sts	0x0467, r20	; 0x800467 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
    3d20:	55 c0       	rjmp	.+170    	; 0x3dcc <__vector_7+0x15b4>
    3d22:	00 e0       	ldi	r16, 0x00	; 0
    3d24:	b0 cf       	rjmp	.-160    	; 0x3c86 <__vector_7+0x146e>
    3d26:	86 50       	subi	r24, 0x06	; 6
    3d28:	80 83       	st	Z, r24
    3d2a:	cc cf       	rjmp	.-104    	; 0x3cc4 <__vector_7+0x14ac>
    3d2c:	42 2f       	mov	r20, r18
    3d2e:	98 2f       	mov	r25, r24
    3d30:	83 2f       	mov	r24, r19
    3d32:	ed cf       	rjmp	.-38     	; 0x3d0e <__vector_7+0x14f6>
    3d34:	19 86       	std	Y+9, r1	; 0x09
    3d36:	80 91 64 04 	lds	r24, 0x0464	; 0x800464 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    3d3a:	09 e0       	ldi	r16, 0x09	; 9
    3d3c:	08 1b       	sub	r16, r24
    3d3e:	9a e0       	ldi	r25, 0x0A	; 10
    3d40:	c9 2e       	mov	r12, r25
    3d42:	dd 24       	eor	r13, r13
    3d44:	da 94       	dec	r13
    3d46:	e1 2c       	mov	r14, r1
    3d48:	49 85       	ldd	r20, Y+9	; 0x09
    3d4a:	50 e0       	ldi	r21, 0x00	; 0
    3d4c:	09 2c       	mov	r0, r9
    3d4e:	02 c0       	rjmp	.+4      	; 0x3d54 <__vector_7+0x153c>
    3d50:	55 95       	asr	r21
    3d52:	47 95       	ror	r20
    3d54:	0a 94       	dec	r0
    3d56:	e2 f7       	brpl	.-8      	; 0x3d50 <__vector_7+0x1538>
    3d58:	41 70       	andi	r20, 0x01	; 1
    3d5a:	80 2f       	mov	r24, r16
    3d5c:	90 e0       	ldi	r25, 0x00	; 0
    3d5e:	9c 01       	movw	r18, r24
    3d60:	26 5a       	subi	r18, 0xA6	; 166
    3d62:	3b 4f       	sbci	r19, 0xFB	; 251
    3d64:	59 01       	movw	r10, r18
    3d66:	61 2f       	mov	r22, r17
    3d68:	c9 01       	movw	r24, r18
    3d6a:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3d6e:	d5 01       	movw	r26, r10
    3d70:	8c 91       	ld	r24, X
    3d72:	e8 16       	cp	r14, r24
    3d74:	08 f4       	brcc	.+2      	; 0x3d78 <__vector_7+0x1560>
    3d76:	e8 2e       	mov	r14, r24
    3d78:	8d 15       	cp	r24, r13
    3d7a:	08 f4       	brcc	.+2      	; 0x3d7e <__vector_7+0x1566>
    3d7c:	d8 2e       	mov	r13, r24
    3d7e:	09 30       	cpi	r16, 0x09	; 9
    3d80:	08 f0       	brcs	.+2      	; 0x3d84 <__vector_7+0x156c>
    3d82:	4f c0       	rjmp	.+158    	; 0x3e22 <__vector_7+0x160a>
    3d84:	0f 5f       	subi	r16, 0xFF	; 255
    3d86:	ce 01       	movw	r24, r28
    3d88:	09 96       	adiw	r24, 0x09	; 9
    3d8a:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3d8e:	ca 94       	dec	r12
    3d90:	c1 10       	cpse	r12, r1
    3d92:	da cf       	rjmp	.-76     	; 0x3d48 <__vector_7+0x1530>
    3d94:	ea e5       	ldi	r30, 0x5A	; 90
    3d96:	f4 e0       	ldi	r31, 0x04	; 4
    3d98:	24 e6       	ldi	r18, 0x64	; 100
    3d9a:	34 e0       	ldi	r19, 0x04	; 4
    3d9c:	bf 01       	movw	r22, r30
    3d9e:	db 01       	movw	r26, r22
    3da0:	8d 91       	ld	r24, X+
    3da2:	bd 01       	movw	r22, r26
    3da4:	ad 01       	movw	r20, r26
    3da6:	41 50       	subi	r20, 0x01	; 1
    3da8:	51 09       	sbc	r21, r1
    3daa:	8d 19       	sub	r24, r13
    3dac:	da 01       	movw	r26, r20
    3dae:	8c 93       	st	X, r24
    3db0:	26 17       	cp	r18, r22
    3db2:	37 07       	cpc	r19, r23
    3db4:	a1 f7       	brne	.-24     	; 0x3d9e <__vector_7+0x1586>
    3db6:	ba ef       	ldi	r27, 0xFA	; 250
    3db8:	be 15       	cp	r27, r14
    3dba:	40 f4       	brcc	.+16     	; 0x3dcc <__vector_7+0x15b4>
    3dbc:	80 81       	ld	r24, Z
    3dbe:	85 30       	cpi	r24, 0x05	; 5
    3dc0:	90 f5       	brcc	.+100    	; 0x3e26 <__vector_7+0x160e>
    3dc2:	10 82       	st	Z, r1
    3dc4:	31 96       	adiw	r30, 0x01	; 1
    3dc6:	6e 17       	cp	r22, r30
    3dc8:	7f 07       	cpc	r23, r31
    3dca:	c1 f7       	brne	.-16     	; 0x3dbc <__vector_7+0x15a4>
    3dcc:	e5 e3       	ldi	r30, 0x35	; 53
    3dce:	ef 15       	cp	r30, r15
    3dd0:	10 f0       	brcs	.+4      	; 0x3dd6 <__vector_7+0x15be>
    3dd2:	0c 94 49 16 	jmp	0x2c92	; 0x2c92 <__vector_7+0x47a>
    3dd6:	0a ec       	ldi	r16, 0xCA	; 202
    3dd8:	0f 0d       	add	r16, r15
    3dda:	05 30       	cpi	r16, 0x05	; 5
    3ddc:	10 f0       	brcs	.+4      	; 0x3de2 <__vector_7+0x15ca>
    3dde:	0c 94 49 16 	jmp	0x2c92	; 0x2c92 <__vector_7+0x47a>
    3de2:	04 30       	cpi	r16, 0x04	; 4
    3de4:	39 f5       	brne	.+78     	; 0x3e34 <__vector_7+0x161c>
    3de6:	10 92 73 04 	sts	0x0473, r1	; 0x800473 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
    3dea:	10 92 74 04 	sts	0x0474, r1	; 0x800474 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
    3dee:	8b e0       	ldi	r24, 0x0B	; 11
    3df0:	80 93 75 04 	sts	0x0475, r24	; 0x800475 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
    3df4:	e8 e6       	ldi	r30, 0x68	; 104
    3df6:	f4 e0       	ldi	r31, 0x04	; 4
    3df8:	4b e0       	ldi	r20, 0x0B	; 11
    3dfa:	80 e0       	ldi	r24, 0x00	; 0
    3dfc:	90 e0       	ldi	r25, 0x00	; 0
    3dfe:	20 e0       	ldi	r18, 0x00	; 0
    3e00:	31 91       	ld	r19, Z+
    3e02:	38 17       	cp	r19, r24
    3e04:	98 f4       	brcc	.+38     	; 0x3e2c <__vector_7+0x1614>
    3e06:	93 17       	cp	r25, r19
    3e08:	08 f4       	brcc	.+2      	; 0x3e0c <__vector_7+0x15f4>
    3e0a:	93 2f       	mov	r25, r19
    3e0c:	2f 5f       	subi	r18, 0xFF	; 255
    3e0e:	2a 30       	cpi	r18, 0x0A	; 10
    3e10:	b9 f7       	brne	.-18     	; 0x3e00 <__vector_7+0x15e8>
    3e12:	90 93 73 04 	sts	0x0473, r25	; 0x800473 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
    3e16:	80 93 74 04 	sts	0x0474, r24	; 0x800474 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
    3e1a:	40 93 75 04 	sts	0x0475, r20	; 0x800475 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
    3e1e:	0c 94 49 16 	jmp	0x2c92	; 0x2c92 <__vector_7+0x47a>
    3e22:	00 e0       	ldi	r16, 0x00	; 0
    3e24:	b0 cf       	rjmp	.-160    	; 0x3d86 <__vector_7+0x156e>
    3e26:	84 50       	subi	r24, 0x04	; 4
    3e28:	80 83       	st	Z, r24
    3e2a:	cc cf       	rjmp	.-104    	; 0x3dc4 <__vector_7+0x15ac>
    3e2c:	42 2f       	mov	r20, r18
    3e2e:	98 2f       	mov	r25, r24
    3e30:	83 2f       	mov	r24, r19
    3e32:	ec cf       	rjmp	.-40     	; 0x3e0c <__vector_7+0x15f4>
    3e34:	19 86       	std	Y+9, r1	; 0x09
    3e36:	80 91 72 04 	lds	r24, 0x0472	; 0x800472 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3e3a:	99 e0       	ldi	r25, 0x09	; 9
    3e3c:	f9 2e       	mov	r15, r25
    3e3e:	f8 1a       	sub	r15, r24
    3e40:	8a e0       	ldi	r24, 0x0A	; 10
    3e42:	c8 2e       	mov	r12, r24
    3e44:	dd 24       	eor	r13, r13
    3e46:	da 94       	dec	r13
    3e48:	e1 2c       	mov	r14, r1
    3e4a:	49 85       	ldd	r20, Y+9	; 0x09
    3e4c:	50 e0       	ldi	r21, 0x00	; 0
    3e4e:	00 2e       	mov	r0, r16
    3e50:	02 c0       	rjmp	.+4      	; 0x3e56 <__vector_7+0x163e>
    3e52:	55 95       	asr	r21
    3e54:	47 95       	ror	r20
    3e56:	0a 94       	dec	r0
    3e58:	e2 f7       	brpl	.-8      	; 0x3e52 <__vector_7+0x163a>
    3e5a:	41 70       	andi	r20, 0x01	; 1
    3e5c:	af 2c       	mov	r10, r15
    3e5e:	b1 2c       	mov	r11, r1
    3e60:	61 2f       	mov	r22, r17
    3e62:	c5 01       	movw	r24, r10
    3e64:	88 59       	subi	r24, 0x98	; 152
    3e66:	9b 4f       	sbci	r25, 0xFB	; 251
    3e68:	0e 94 97 03 	call	0x72e	; 0x72e <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3e6c:	f5 01       	movw	r30, r10
    3e6e:	e6 5a       	subi	r30, 0xA6	; 166
    3e70:	fb 4f       	sbci	r31, 0xFB	; 251
    3e72:	86 85       	ldd	r24, Z+14	; 0x0e
    3e74:	e8 16       	cp	r14, r24
    3e76:	08 f4       	brcc	.+2      	; 0x3e7a <__vector_7+0x1662>
    3e78:	e8 2e       	mov	r14, r24
    3e7a:	8d 15       	cp	r24, r13
    3e7c:	08 f4       	brcc	.+2      	; 0x3e80 <__vector_7+0x1668>
    3e7e:	d8 2e       	mov	r13, r24
    3e80:	f8 e0       	ldi	r31, 0x08	; 8
    3e82:	ff 15       	cp	r31, r15
    3e84:	38 f1       	brcs	.+78     	; 0x3ed4 <__vector_7+0x16bc>
    3e86:	f3 94       	inc	r15
    3e88:	ce 01       	movw	r24, r28
    3e8a:	09 96       	adiw	r24, 0x09	; 9
    3e8c:	0e 94 16 07 	call	0xe2c	; 0xe2c <_ZN3BCD9incrementERNS_5bcd_tE>
    3e90:	ca 94       	dec	r12
    3e92:	c1 10       	cpse	r12, r1
    3e94:	da cf       	rjmp	.-76     	; 0x3e4a <__vector_7+0x1632>
    3e96:	ea e5       	ldi	r30, 0x5A	; 90
    3e98:	f4 e0       	ldi	r31, 0x04	; 4
    3e9a:	24 e6       	ldi	r18, 0x64	; 100
    3e9c:	34 e0       	ldi	r19, 0x04	; 4
    3e9e:	df 01       	movw	r26, r30
    3ea0:	1e 96       	adiw	r26, 0x0e	; 14
    3ea2:	8c 91       	ld	r24, X
    3ea4:	1e 97       	sbiw	r26, 0x0e	; 14
    3ea6:	8d 19       	sub	r24, r13
    3ea8:	1e 96       	adiw	r26, 0x0e	; 14
    3eaa:	8c 93       	st	X, r24
    3eac:	1e 97       	sbiw	r26, 0x0e	; 14
    3eae:	11 96       	adiw	r26, 0x01	; 1
    3eb0:	2a 17       	cp	r18, r26
    3eb2:	3b 07       	cpc	r19, r27
    3eb4:	a9 f7       	brne	.-22     	; 0x3ea0 <__vector_7+0x1688>
    3eb6:	2a ef       	ldi	r18, 0xFA	; 250
    3eb8:	2e 15       	cp	r18, r14
    3eba:	10 f0       	brcs	.+4      	; 0x3ec0 <__vector_7+0x16a8>
    3ebc:	0c 94 49 16 	jmp	0x2c92	; 0x2c92 <__vector_7+0x47a>
    3ec0:	86 85       	ldd	r24, Z+14	; 0x0e
    3ec2:	85 30       	cpi	r24, 0x05	; 5
    3ec4:	48 f4       	brcc	.+18     	; 0x3ed8 <__vector_7+0x16c0>
    3ec6:	16 86       	std	Z+14, r1	; 0x0e
    3ec8:	31 96       	adiw	r30, 0x01	; 1
    3eca:	ae 17       	cp	r26, r30
    3ecc:	bf 07       	cpc	r27, r31
    3ece:	c1 f7       	brne	.-16     	; 0x3ec0 <__vector_7+0x16a8>
    3ed0:	0c 94 49 16 	jmp	0x2c92	; 0x2c92 <__vector_7+0x47a>
    3ed4:	f1 2c       	mov	r15, r1
    3ed6:	d8 cf       	rjmp	.-80     	; 0x3e88 <__vector_7+0x1670>
    3ed8:	84 50       	subi	r24, 0x04	; 4
    3eda:	86 87       	std	Z+14, r24	; 0x0e
    3edc:	f5 cf       	rjmp	.-22     	; 0x3ec8 <__vector_7+0x16b0>
    3ede:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    3ee2:	80 91 fa 05 	lds	r24, 0x05FA	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    3ee6:	90 91 fb 05 	lds	r25, 0x05FB	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    3eea:	8f 35       	cpi	r24, 0x5F	; 95
    3eec:	9a 4e       	sbci	r25, 0xEA	; 234
    3eee:	f8 f4       	brcc	.+62     	; 0x3f2e <__vector_7+0x1716>
    3ef0:	80 91 fa 05 	lds	r24, 0x05FA	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    3ef4:	90 91 fb 05 	lds	r25, 0x05FB	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    3ef8:	01 96       	adiw	r24, 0x01	; 1
    3efa:	90 93 fb 05 	sts	0x05FB, r25	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    3efe:	80 93 fa 05 	sts	0x05FA, r24	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    3f02:	80 91 fa 05 	lds	r24, 0x05FA	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    3f06:	90 91 fb 05 	lds	r25, 0x05FB	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    3f0a:	60 e7       	ldi	r22, 0x70	; 112
    3f0c:	77 e1       	ldi	r23, 0x17	; 23
    3f0e:	62 d7       	rcall	.+3780   	; 0x4dd4 <__udivmodhi4>
    3f10:	89 2b       	or	r24, r25
    3f12:	11 f0       	breq	.+4      	; 0x3f18 <__vector_7+0x1700>
    3f14:	0c 94 d9 16 	jmp	0x2db2	; 0x2db2 <__vector_7+0x59a>
    3f18:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    3f1c:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    3f20:	01 96       	adiw	r24, 0x01	; 1
    3f22:	90 93 f9 05 	sts	0x05F9, r25	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    3f26:	80 93 f8 05 	sts	0x05F8, r24	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    3f2a:	0c 94 d9 16 	jmp	0x2db2	; 0x2db2 <__vector_7+0x59a>
    3f2e:	10 92 fb 05 	sts	0x05FB, r1	; 0x8005fb <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    3f32:	10 92 fa 05 	sts	0x05FA, r1	; 0x8005fa <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    3f36:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    3f3a:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    3f3e:	01 96       	adiw	r24, 0x01	; 1
    3f40:	90 93 f9 05 	sts	0x05F9, r25	; 0x8005f9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    3f44:	80 93 f8 05 	sts	0x05F8, r24	; 0x8005f8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    3f48:	dc cf       	rjmp	.-72     	; 0x3f02 <__vector_7+0x16ea>
    3f4a:	83 e3       	ldi	r24, 0x33	; 51
    3f4c:	84 bd       	out	0x24, r24	; 36
    3f4e:	89 e0       	ldi	r24, 0x09	; 9
    3f50:	85 bd       	out	0x25, r24	; 37
    3f52:	0c 94 00 17 	jmp	0x2e00	; 0x2e00 <__vector_7+0x5e8>
    3f56:	88 b5       	in	r24, 0x28	; 40
    3f58:	88 23       	and	r24, r24
    3f5a:	11 f4       	brne	.+4      	; 0x3f60 <__vector_7+0x1748>
    3f5c:	0c 94 00 17 	jmp	0x2e00	; 0x2e00 <__vector_7+0x5e8>
    3f60:	88 b5       	in	r24, 0x28	; 40
    3f62:	81 50       	subi	r24, 0x01	; 1
    3f64:	88 bd       	out	0x28, r24	; 40
    3f66:	81 11       	cpse	r24, r1
    3f68:	0c 94 00 17 	jmp	0x2e00	; 0x2e00 <__vector_7+0x5e8>
    3f6c:	5d 9a       	sbi	0x0b, 5	; 11
    3f6e:	14 bc       	out	0x24, r1	; 36
    3f70:	15 bc       	out	0x25, r1	; 37
    3f72:	0c 94 00 17 	jmp	0x2e00	; 0x2e00 <__vector_7+0x5e8>
    3f76:	10 92 3c 03 	sts	0x033C, r1	; 0x80033c <_ZN7Display11CrossfadingL18crsf_cycle_counterE>
    3f7a:	0c 94 10 17 	jmp	0x2e20	; 0x2e20 <__vector_7+0x608>
    3f7e:	4c 91       	ld	r20, X
    3f80:	90 81       	ld	r25, Z
    3f82:	94 17       	cp	r25, r20
    3f84:	10 f0       	brcs	.+4      	; 0x3f8a <__vector_7+0x1772>
    3f86:	0c 94 59 17 	jmp	0x2eb2	; 0x2eb2 <__vector_7+0x69a>
    3f8a:	8c 91       	ld	r24, X
    3f8c:	81 50       	subi	r24, 0x01	; 1
    3f8e:	0c 94 57 17 	jmp	0x2eae	; 0x2eae <__vector_7+0x696>
    3f92:	13 e0       	ldi	r17, 0x03	; 3
    3f94:	01 11       	cpse	r16, r1
    3f96:	88 c8       	rjmp	.-3824   	; 0x30a8 <__vector_7+0x890>
    3f98:	0c 94 e3 15 	jmp	0x2bc6	; 0x2bc6 <__vector_7+0x3ae>
    3f9c:	12 e0       	ldi	r17, 0x02	; 2
    3f9e:	fa cf       	rjmp	.-12     	; 0x3f94 <__vector_7+0x177c>
    3fa0:	03 30       	cpi	r16, 0x03	; 3
    3fa2:	09 f0       	breq	.+2      	; 0x3fa6 <__vector_7+0x178e>
    3fa4:	cc cb       	rjmp	.-2152   	; 0x373e <__vector_7+0xf26>
    3fa6:	11 e0       	ldi	r17, 0x01	; 1
    3fa8:	db cb       	rjmp	.-2122   	; 0x3760 <__vector_7+0xf48>

00003faa <_GLOBAL__I_65535_0_buttons.o.3459>:
    3faa:	10 92 c6 04 	sts	0x04C6, r1	; 0x8004c6 <Wire>
    3fae:	10 92 e7 04 	sts	0x04E7, r1	; 0x8004e7 <Wire+0x21>
    3fb2:	10 92 08 05 	sts	0x0508, r1	; 0x800508 <Wire+0x42>
    3fb6:	10 92 09 05 	sts	0x0509, r1	; 0x800509 <Wire+0x43>
    3fba:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    3fbe:	20 91 f0 05 	lds	r18, 0x05F0	; 0x8005f0 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE>
    3fc2:	30 91 f1 05 	lds	r19, 0x05F1	; 0x8005f1 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x1>
    3fc6:	40 91 f2 05 	lds	r20, 0x05F2	; 0x8005f2 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x2>
    3fca:	50 91 f3 05 	lds	r21, 0x05F3	; 0x8005f3 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x3>
    3fce:	60 91 f4 05 	lds	r22, 0x05F4	; 0x8005f4 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x4>
    3fd2:	70 91 f5 05 	lds	r23, 0x05F5	; 0x8005f5 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x5>
    3fd6:	80 91 f6 05 	lds	r24, 0x05F6	; 0x8005f6 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x6>
    3fda:	90 91 f7 05 	lds	r25, 0x05F7	; 0x8005f7 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x7>
    3fde:	a1 e0       	ldi	r26, 0x01	; 1
    3fe0:	5d d7       	rcall	.+3770   	; 0x4e9c <__adddi3_s8>
    3fe2:	20 93 f0 05 	sts	0x05F0, r18	; 0x8005f0 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE>
    3fe6:	30 93 f1 05 	sts	0x05F1, r19	; 0x8005f1 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x1>
    3fea:	40 93 f2 05 	sts	0x05F2, r20	; 0x8005f2 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x2>
    3fee:	50 93 f3 05 	sts	0x05F3, r21	; 0x8005f3 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x3>
    3ff2:	60 93 f4 05 	sts	0x05F4, r22	; 0x8005f4 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x4>
    3ff6:	70 93 f5 05 	sts	0x05F5, r23	; 0x8005f5 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x5>
    3ffa:	80 93 f6 05 	sts	0x05F6, r24	; 0x8005f6 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x6>
    3ffe:	90 93 f7 05 	sts	0x05F7, r25	; 0x8005f7 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x7>
    4002:	58 d7       	rcall	.+3760   	; 0x4eb4 <__cmpdi2_s8>
    4004:	51 f5       	brne	.+84     	; 0x405a <_GLOBAL__I_65535_0_buttons.o.3459+0xb0>
    4006:	8c e2       	ldi	r24, 0x2C	; 44
    4008:	91 e0       	ldi	r25, 0x01	; 1
    400a:	90 93 dd 05 	sts	0x05DD, r25	; 0x8005dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    400e:	80 93 dc 05 	sts	0x05DC, r24	; 0x8005dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    4012:	10 92 de 05 	sts	0x05DE, r1	; 0x8005de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    4016:	10 92 df 05 	sts	0x05DF, r1	; 0x8005df <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    401a:	10 92 e0 05 	sts	0x05E0, r1	; 0x8005e0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    401e:	10 92 e1 05 	sts	0x05E1, r1	; 0x8005e1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    4022:	10 92 e2 05 	sts	0x05E2, r1	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    4026:	10 92 e3 05 	sts	0x05E3, r1	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    402a:	10 92 e4 05 	sts	0x05E4, r1	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    402e:	10 92 e5 05 	sts	0x05E5, r1	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    4032:	10 92 e6 05 	sts	0x05E6, r1	; 0x8005e6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    4036:	10 92 e7 05 	sts	0x05E7, r1	; 0x8005e7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    403a:	10 92 e8 05 	sts	0x05E8, r1	; 0x8005e8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    403e:	10 92 e9 05 	sts	0x05E9, r1	; 0x8005e9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    4042:	10 92 ea 05 	sts	0x05EA, r1	; 0x8005ea <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    4046:	10 92 eb 05 	sts	0x05EB, r1	; 0x8005eb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    404a:	10 92 ec 05 	sts	0x05EC, r1	; 0x8005ec <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    404e:	10 92 ed 05 	sts	0x05ED, r1	; 0x8005ed <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    4052:	10 92 ee 05 	sts	0x05EE, r1	; 0x8005ee <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    4056:	10 92 ef 05 	sts	0x05EF, r1	; 0x8005ef <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    405a:	08 95       	ret

0000405c <main>:
    405c:	cf 93       	push	r28
    405e:	df 93       	push	r29
    4060:	cd b7       	in	r28, 0x3d	; 61
    4062:	de b7       	in	r29, 0x3e	; 62
    4064:	64 97       	sbiw	r28, 0x14	; 20
    4066:	0f b6       	in	r0, 0x3f	; 63
    4068:	f8 94       	cli
    406a:	de bf       	out	0x3e, r29	; 62
    406c:	0f be       	out	0x3f, r0	; 63
    406e:	cd bf       	out	0x3d, r28	; 61
    4070:	14 be       	out	0x34, r1	; 52
    4072:	0f b6       	in	r0, 0x3f	; 63
    4074:	f8 94       	cli
    4076:	a8 95       	wdr
    4078:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    407c:	88 61       	ori	r24, 0x18	; 24
    407e:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4082:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4086:	0f be       	out	0x3f, r0	; 63
    4088:	f8 94       	cli
    408a:	8a e1       	ldi	r24, 0x1A	; 26
    408c:	96 e0       	ldi	r25, 0x06	; 6
    408e:	22 e0       	ldi	r18, 0x02	; 2
    4090:	e2 2e       	mov	r14, r18
    4092:	26 e0       	ldi	r18, 0x06	; 6
    4094:	f2 2e       	mov	r15, r18
    4096:	25 ec       	ldi	r18, 0xC5	; 197
    4098:	d7 01       	movw	r26, r14
    409a:	2d 93       	st	X+, r18
    409c:	7d 01       	movw	r14, r26
    409e:	8a 17       	cp	r24, r26
    40a0:	9b 07       	cpc	r25, r27
    40a2:	d1 f7       	brne	.-12     	; 0x4098 <main+0x3c>
    40a4:	88 b1       	in	r24, 0x08	; 8
    40a6:	80 63       	ori	r24, 0x30	; 48
    40a8:	88 b9       	out	0x08, r24	; 8
    40aa:	87 b1       	in	r24, 0x07	; 7
    40ac:	8f 7c       	andi	r24, 0xCF	; 207
    40ae:	87 b9       	out	0x07, r24	; 7
    40b0:	1c 8a       	std	Y+20, r1	; 0x14
    40b2:	1b 8a       	std	Y+19, r1	; 0x13
    40b4:	ce 01       	movw	r24, r28
    40b6:	43 96       	adiw	r24, 0x13	; 19
    40b8:	9a 8b       	std	Y+18, r25	; 0x12
    40ba:	89 8b       	std	Y+17, r24	; 0x11
    40bc:	81 e0       	ldi	r24, 0x01	; 1
    40be:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    40c2:	19 e0       	ldi	r17, 0x09	; 9
    40c4:	10 93 81 00 	sts	0x0081, r17	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    40c8:	10 92 89 00 	sts	0x0089, r1	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    40cc:	10 92 88 00 	sts	0x0088, r1	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    40d0:	10 92 8b 00 	sts	0x008B, r1	; 0x80008b <__TEXT_REGION_LENGTH__+0x7e008b>
    40d4:	10 92 8a 00 	sts	0x008A, r1	; 0x80008a <__TEXT_REGION_LENGTH__+0x7e008a>
    40d8:	21 9a       	sbi	0x04, 1	; 4
    40da:	29 98       	cbi	0x05, 1	; 5
    40dc:	22 9a       	sbi	0x04, 2	; 4
    40de:	2a 98       	cbi	0x05, 2	; 5
    40e0:	23 9a       	sbi	0x04, 3	; 4
    40e2:	2b 98       	cbi	0x05, 3	; 5
    40e4:	6f e3       	ldi	r22, 0x3F	; 63
    40e6:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    40ea:	6f e1       	ldi	r22, 0x1F	; 31
    40ec:	82 e0       	ldi	r24, 0x02	; 2
    40ee:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    40f2:	10 92 c5 00 	sts	0x00C5, r1	; 0x8000c5 <__TEXT_REGION_LENGTH__+0x7e00c5>
    40f6:	87 e6       	ldi	r24, 0x67	; 103
    40f8:	80 93 c4 00 	sts	0x00C4, r24	; 0x8000c4 <__TEXT_REGION_LENGTH__+0x7e00c4>
    40fc:	10 92 c0 00 	sts	0x00C0, r1	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    4100:	88 e0       	ldi	r24, 0x08	; 8
    4102:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4106:	86 e0       	ldi	r24, 0x06	; 6
    4108:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    410c:	8c b5       	in	r24, 0x2c	; 44
    410e:	8f 7b       	andi	r24, 0xBF	; 191
    4110:	8c bd       	out	0x2c, r24	; 44
    4112:	80 91 64 00 	lds	r24, 0x0064	; 0x800064 <__TEXT_REGION_LENGTH__+0x7e0064>
    4116:	84 60       	ori	r24, 0x04	; 4
    4118:	80 93 64 00 	sts	0x0064, r24	; 0x800064 <__TEXT_REGION_LENGTH__+0x7e0064>
    411c:	8d b3       	in	r24, 0x1d	; 29
    411e:	8c 7f       	andi	r24, 0xFC	; 252
    4120:	8d bb       	out	0x1d, r24	; 29
    4122:	8c b3       	in	r24, 0x1c	; 28
    4124:	83 60       	ori	r24, 0x03	; 3
    4126:	8c bb       	out	0x1c, r24	; 28
    4128:	3a 98       	cbi	0x07, 2	; 7
    412a:	42 9a       	sbi	0x08, 2	; 8
    412c:	56 98       	cbi	0x0a, 6	; 10
    412e:	5e 9a       	sbi	0x0b, 6	; 11
    4130:	38 98       	cbi	0x07, 0	; 7
    4132:	40 9a       	sbi	0x08, 0	; 8
    4134:	28 98       	cbi	0x05, 0	; 5
    4136:	20 9a       	sbi	0x04, 0	; 4
    4138:	5f 98       	cbi	0x0b, 7	; 11
    413a:	57 9a       	sbi	0x0a, 7	; 10
    413c:	2c 98       	cbi	0x05, 4	; 5
    413e:	24 9a       	sbi	0x04, 4	; 4
    4140:	5d 9a       	sbi	0x0b, 5	; 11
    4142:	55 9a       	sbi	0x0a, 5	; 10
    4144:	14 bc       	out	0x24, r1	; 36
    4146:	15 bc       	out	0x25, r1	; 37
    4148:	88 e5       	ldi	r24, 0x58	; 88
    414a:	87 bd       	out	0x27, r24	; 39
    414c:	18 bc       	out	0x28, r1	; 40
    414e:	10 92 6e 00 	sts	0x006E, r1	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    4152:	3b 98       	cbi	0x07, 3	; 7
    4154:	43 98       	cbi	0x08, 3	; 8
    4156:	25 98       	cbi	0x04, 5	; 4
    4158:	2d 98       	cbi	0x05, 5	; 5
    415a:	53 98       	cbi	0x0a, 3	; 10
    415c:	5b 9a       	sbi	0x0b, 3	; 11
    415e:	52 98       	cbi	0x0a, 2	; 10
    4160:	5a 9a       	sbi	0x0b, 2	; 11
    4162:	39 98       	cbi	0x07, 1	; 7
    4164:	41 9a       	sbi	0x08, 1	; 8
    4166:	54 98       	cbi	0x0a, 4	; 10
    4168:	5c 9a       	sbi	0x0b, 4	; 11
    416a:	80 91 7c 00 	lds	r24, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    416e:	80 7f       	andi	r24, 0xF0	; 240
    4170:	83 60       	ori	r24, 0x03	; 3
    4172:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    4176:	87 e0       	ldi	r24, 0x07	; 7
    4178:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    417c:	80 e4       	ldi	r24, 0x40	; 64
    417e:	80 bf       	out	0x30, r24	; 48
    4180:	82 e0       	ldi	r24, 0x02	; 2
    4182:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4186:	94 e0       	ldi	r25, 0x04	; 4
    4188:	90 93 b1 00 	sts	0x00B1, r25	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
    418c:	99 ef       	ldi	r25, 0xF9	; 249
    418e:	90 93 b3 00 	sts	0x00B3, r25	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
    4192:	80 93 70 00 	sts	0x0070, r24	; 0x800070 <__TEXT_REGION_LENGTH__+0x7e0070>
    4196:	10 92 b2 00 	sts	0x00B2, r1	; 0x8000b2 <__TEXT_REGION_LENGTH__+0x7e00b2>
    419a:	78 94       	sei
    419c:	80 91 51 03 	lds	r24, 0x0351	; 0x800351 <timer_counter>
    41a0:	90 91 52 03 	lds	r25, 0x0352	; 0x800352 <timer_counter+0x1>
    41a4:	9c 8b       	std	Y+20, r25	; 0x14
    41a6:	8b 8b       	std	Y+19, r24	; 0x13
    41a8:	c0 90 51 03 	lds	r12, 0x0351	; 0x800351 <timer_counter>
    41ac:	d0 90 52 03 	lds	r13, 0x0352	; 0x800352 <timer_counter+0x1>
    41b0:	81 ea       	ldi	r24, 0xA1	; 161
    41b2:	94 e0       	ldi	r25, 0x04	; 4
    41b4:	0e 94 a7 00 	call	0x14e	; 0x14e <_Z20putDigitsToInputRegsPKhh.constprop.78>
    41b8:	0e 94 b4 0b 	call	0x1768	; 0x1768 <_Z16pushToOutputRegsv>
    41bc:	8f b7       	in	r24, 0x3f	; 63
    41be:	f8 94       	cli
    41c0:	93 e3       	ldi	r25, 0x33	; 51
    41c2:	94 bd       	out	0x24, r25	; 36
    41c4:	15 bd       	out	0x25, r17	; 37
    41c6:	8f bf       	out	0x3f, r24	; 63
    41c8:	10 91 4e 03 	lds	r17, 0x034E	; 0x80034e <MODE>
    41cc:	81 2f       	mov	r24, r17
    41ce:	80 61       	ori	r24, 0x10	; 16
    41d0:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    41d4:	81 ea       	ldi	r24, 0xA1	; 161
    41d6:	94 e0       	ldi	r25, 0x04	; 4
    41d8:	0e 94 a7 00 	call	0x14e	; 0x14e <_Z20putDigitsToInputRegsPKhh.constprop.78>
    41dc:	0e 94 b4 0b 	call	0x1768	; 0x1768 <_Z16pushToOutputRegsv>
    41e0:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    41e4:	81 31       	cpi	r24, 0x11	; 17
    41e6:	20 f4       	brcc	.+8      	; 0x41f0 <main+0x194>
    41e8:	60 e0       	ldi	r22, 0x00	; 0
    41ea:	81 e1       	ldi	r24, 0x11	; 17
    41ec:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    41f0:	13 fd       	sbrc	r17, 3
    41f2:	13 c0       	rjmp	.+38     	; 0x421a <main+0x1be>
    41f4:	18 61       	ori	r17, 0x18	; 24
    41f6:	10 93 4e 03 	sts	0x034E, r17	; 0x80034e <MODE>
    41fa:	ef e7       	ldi	r30, 0x7F	; 127
    41fc:	f0 e0       	ldi	r31, 0x00	; 0
    41fe:	84 91       	lpm	r24, Z
    4200:	80 93 a1 04 	sts	0x04A1, r24	; 0x8004a1 <_ZN7Display6DIGITSE>
    4204:	84 91       	lpm	r24, Z
    4206:	80 93 a2 04 	sts	0x04A2, r24	; 0x8004a2 <_ZN7Display6DIGITSE+0x1>
    420a:	84 91       	lpm	r24, Z
    420c:	80 93 a3 04 	sts	0x04A3, r24	; 0x8004a3 <_ZN7Display6DIGITSE+0x2>
    4210:	e4 91       	lpm	r30, Z
    4212:	e0 93 a4 04 	sts	0x04A4, r30	; 0x8004a4 <_ZN7Display6DIGITSE+0x3>
    4216:	0e 94 8d 0a 	call	0x151a	; 0x151a <_ZN7Display11Crossfading12transitionToEPKh.constprop.93>
    421a:	ce 01       	movw	r24, r28
    421c:	41 96       	adiw	r24, 0x11	; 17
    421e:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    4222:	82 ec       	ldi	r24, 0xC2	; 194
    4224:	90 e0       	ldi	r25, 0x00	; 0
    4226:	0e 94 81 09 	call	0x1302	; 0x1302 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8>
    422a:	0e 94 6e 09 	call	0x12dc	; 0x12dc <_ZN11SerialClass5flushEv.isra.4>
    422e:	0e 94 a7 02 	call	0x54e	; 0x54e <twi_init>
    4232:	0e 94 9c 09 	call	0x1338	; 0x1338 <_ZN7Modules22updateConnectionStatusEv>
    4236:	80 91 53 03 	lds	r24, 0x0353	; 0x800353 <_ZN7ModulesL8_MODULESE>
    423a:	80 ff       	sbrs	r24, 0
    423c:	7d c2       	rjmp	.+1274   	; 0x4738 <main+0x6dc>
    423e:	80 e8       	ldi	r24, 0x80	; 128
    4240:	90 e0       	ldi	r25, 0x00	; 0
    4242:	0e 94 81 09 	call	0x1302	; 0x1302 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8>
    4246:	0e 94 6e 09 	call	0x12dc	; 0x12dc <_ZN11SerialClass5flushEv.isra.4>
    424a:	08 e6       	ldi	r16, 0x68	; 104
    424c:	00 93 c6 04 	sts	0x04C6, r16	; 0x8004c6 <Wire>
    4250:	8e e0       	ldi	r24, 0x0E	; 14
    4252:	80 93 c7 04 	sts	0x04C7, r24	; 0x8004c7 <Wire+0x1>
    4256:	12 e0       	ldi	r17, 0x02	; 2
    4258:	10 93 e7 04 	sts	0x04E7, r17	; 0x8004e7 <Wire+0x21>
    425c:	84 e0       	ldi	r24, 0x04	; 4
    425e:	80 93 c8 04 	sts	0x04C8, r24	; 0x8004c8 <Wire+0x2>
    4262:	0e 94 44 0d 	call	0x1a88	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    4266:	81 11       	cpse	r24, r1
    4268:	28 c0       	rjmp	.+80     	; 0x42ba <main+0x25e>
    426a:	00 93 c6 04 	sts	0x04C6, r16	; 0x8004c6 <Wire>
    426e:	bb 24       	eor	r11, r11
    4270:	b3 94       	inc	r11
    4272:	b0 92 e7 04 	sts	0x04E7, r11	; 0x8004e7 <Wire+0x21>
    4276:	10 93 c7 04 	sts	0x04C7, r17	; 0x8004c7 <Wire+0x1>
    427a:	0e 94 44 0d 	call	0x1a88	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    427e:	81 11       	cpse	r24, r1
    4280:	1c c0       	rjmp	.+56     	; 0x42ba <main+0x25e>
    4282:	61 e0       	ldi	r22, 0x01	; 1
    4284:	88 ee       	ldi	r24, 0xE8	; 232
    4286:	94 e0       	ldi	r25, 0x04	; 4
    4288:	0e 94 85 0c 	call	0x190a	; 0x190a <twi_readFrom.constprop.89>
    428c:	80 93 09 05 	sts	0x0509, r24	; 0x800509 <Wire+0x43>
    4290:	10 92 08 05 	sts	0x0508, r1	; 0x800508 <Wire+0x42>
    4294:	88 23       	and	r24, r24
    4296:	89 f0       	breq	.+34     	; 0x42ba <main+0x25e>
    4298:	b0 92 08 05 	sts	0x0508, r11	; 0x800508 <Wire+0x42>
    429c:	80 91 e8 04 	lds	r24, 0x04E8	; 0x8004e8 <Wire+0x22>
    42a0:	86 ff       	sbrs	r24, 6
    42a2:	0b c0       	rjmp	.+22     	; 0x42ba <main+0x25e>
    42a4:	00 93 c6 04 	sts	0x04C6, r16	; 0x8004c6 <Wire>
    42a8:	10 93 c7 04 	sts	0x04C7, r17	; 0x8004c7 <Wire+0x1>
    42ac:	10 93 e7 04 	sts	0x04E7, r17	; 0x8004e7 <Wire+0x21>
    42b0:	8f 7b       	andi	r24, 0xBF	; 191
    42b2:	80 93 c8 04 	sts	0x04C8, r24	; 0x8004c8 <Wire+0x2>
    42b6:	0e 94 44 0d 	call	0x1a88	; 0x1a88 <_ZN7TwoWire15endTransmissionEh.constprop.85>
    42ba:	ce 01       	movw	r24, r28
    42bc:	41 96       	adiw	r24, 0x11	; 17
    42be:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    42c2:	60 e0       	ldi	r22, 0x00	; 0
    42c4:	81 e1       	ldi	r24, 0x11	; 17
    42c6:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    42ca:	ce 01       	movw	r24, r28
    42cc:	41 96       	adiw	r24, 0x11	; 17
    42ce:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    42d2:	4c 99       	sbic	0x09, 4	; 9
    42d4:	6b c0       	rjmp	.+214    	; 0x43ac <main+0x350>
    42d6:	10 e0       	ldi	r17, 0x00	; 0
    42d8:	81 2f       	mov	r24, r17
    42da:	0e 94 3e 13 	call	0x267c	; 0x267c <_ZN6Config11saveForPageEh>
    42de:	1f 5f       	subi	r17, 0xFF	; 255
    42e0:	19 30       	cpi	r17, 0x09	; 9
    42e2:	d1 f7       	brne	.-12     	; 0x42d8 <main+0x27c>
    42e4:	13 e0       	ldi	r17, 0x03	; 3
    42e6:	80 91 0d 01 	lds	r24, 0x010D	; 0x80010d <led_brightness>
    42ea:	0e 94 60 0a 	call	0x14c0	; 0x14c0 <_ZN3Led13setBrightnessEh>
    42ee:	84 ef       	ldi	r24, 0xF4	; 244
    42f0:	91 e0       	ldi	r25, 0x01	; 1
    42f2:	0e 94 6c 0a 	call	0x14d8	; 0x14d8 <_Z4waitj>
    42f6:	80 e0       	ldi	r24, 0x00	; 0
    42f8:	0e 94 60 0a 	call	0x14c0	; 0x14c0 <_ZN3Led13setBrightnessEh>
    42fc:	84 ef       	ldi	r24, 0xF4	; 244
    42fe:	91 e0       	ldi	r25, 0x01	; 1
    4300:	0e 94 6c 0a 	call	0x14d8	; 0x14d8 <_Z4waitj>
    4304:	11 50       	subi	r17, 0x01	; 1
    4306:	79 f7       	brne	.-34     	; 0x42e6 <main+0x28a>
    4308:	86 e0       	ldi	r24, 0x06	; 6
    430a:	e5 ee       	ldi	r30, 0xE5	; 229
    430c:	f2 e0       	ldi	r31, 0x02	; 2
    430e:	de 01       	movw	r26, r28
    4310:	11 96       	adiw	r26, 0x01	; 1
    4312:	01 90       	ld	r0, Z+
    4314:	0d 92       	st	X+, r0
    4316:	8a 95       	dec	r24
    4318:	e1 f7       	brne	.-8      	; 0x4312 <main+0x2b6>
    431a:	ce 01       	movw	r24, r28
    431c:	01 96       	adiw	r24, 0x01	; 1
    431e:	0e 94 11 0e 	call	0x1c22	; 0x1c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>
    4322:	80 e2       	ldi	r24, 0x20	; 32
    4324:	90 e0       	ldi	r25, 0x00	; 0
    4326:	27 d5       	rcall	.+2638   	; 0x4d76 <eeprom_read_byte>
    4328:	8f 3f       	cpi	r24, 0xFF	; 255
    432a:	21 f0       	breq	.+8      	; 0x4334 <main+0x2d8>
    432c:	6f ef       	ldi	r22, 0xFF	; 255
    432e:	80 e2       	ldi	r24, 0x20	; 32
    4330:	90 e0       	ldi	r25, 0x00	; 0
    4332:	29 d5       	rcall	.+2642   	; 0x4d86 <eeprom_write_byte>
    4334:	80 e2       	ldi	r24, 0x20	; 32
    4336:	90 e0       	ldi	r25, 0x00	; 0
    4338:	1e d5       	rcall	.+2620   	; 0x4d76 <eeprom_read_byte>
    433a:	84 3a       	cpi	r24, 0xA4	; 164
    433c:	b9 f5       	brne	.+110    	; 0x43ac <main+0x350>
    433e:	00 e0       	ldi	r16, 0x00	; 0
    4340:	11 e0       	ldi	r17, 0x01	; 1
    4342:	48 01       	movw	r8, r16
    4344:	81 e2       	ldi	r24, 0x21	; 33
    4346:	a8 2e       	mov	r10, r24
    4348:	b1 2c       	mov	r11, r1
    434a:	c5 01       	movw	r24, r10
    434c:	14 d5       	rcall	.+2600   	; 0x4d76 <eeprom_read_byte>
    434e:	f4 01       	movw	r30, r8
    4350:	81 93       	st	Z+, r24
    4352:	4f 01       	movw	r8, r30
    4354:	ff ef       	ldi	r31, 0xFF	; 255
    4356:	af 1a       	sub	r10, r31
    4358:	bf 0a       	sbc	r11, r31
    435a:	26 e2       	ldi	r18, 0x26	; 38
    435c:	a2 16       	cp	r10, r18
    435e:	b1 04       	cpc	r11, r1
    4360:	a1 f7       	brne	.-24     	; 0x434a <main+0x2ee>
    4362:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <__data_start>
    4366:	24 e0       	ldi	r18, 0x04	; 4
    4368:	31 e0       	ldi	r19, 0x01	; 1
    436a:	f8 01       	movw	r30, r16
    436c:	81 81       	ldd	r24, Z+1	; 0x01
    436e:	90 81       	ld	r25, Z
    4370:	0f 5f       	subi	r16, 0xFF	; 255
    4372:	1f 4f       	sbci	r17, 0xFF	; 255
    4374:	89 17       	cp	r24, r25
    4376:	10 f0       	brcs	.+4      	; 0x437c <main+0x320>
    4378:	81 11       	cpse	r24, r1
    437a:	e5 c1       	rjmp	.+970    	; 0x4746 <main+0x6ea>
    437c:	85 e0       	ldi	r24, 0x05	; 5
    437e:	eb ee       	ldi	r30, 0xEB	; 235
    4380:	f2 e0       	ldi	r31, 0x02	; 2
    4382:	de 01       	movw	r26, r28
    4384:	1b 96       	adiw	r26, 0x0b	; 11
    4386:	01 90       	ld	r0, Z+
    4388:	0d 92       	st	X+, r0
    438a:	8a 95       	dec	r24
    438c:	e1 f7       	brne	.-8      	; 0x4386 <main+0x32a>
    438e:	8b 85       	ldd	r24, Y+11	; 0x0b
    4390:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <__data_start>
    4394:	8c 85       	ldd	r24, Y+12	; 0x0c
    4396:	80 93 01 01 	sts	0x0101, r24	; 0x800101 <__data_start+0x1>
    439a:	8d 85       	ldd	r24, Y+13	; 0x0d
    439c:	80 93 02 01 	sts	0x0102, r24	; 0x800102 <__data_start+0x2>
    43a0:	8e 85       	ldd	r24, Y+14	; 0x0e
    43a2:	80 93 03 01 	sts	0x0103, r24	; 0x800103 <__data_start+0x3>
    43a6:	8f 85       	ldd	r24, Y+15	; 0x0f
    43a8:	80 93 04 01 	sts	0x0104, r24	; 0x800104 <__data_start+0x4>
    43ac:	ce 01       	movw	r24, r28
    43ae:	41 96       	adiw	r24, 0x11	; 17
    43b0:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    43b4:	67 e4       	ldi	r22, 0x47	; 71
    43b6:	70 e1       	ldi	r23, 0x10	; 16
    43b8:	80 e0       	ldi	r24, 0x00	; 0
    43ba:	0e 94 de 0b 	call	0x17bc	; 0x17bc <_ZN6Config22setSaveCallbackForPageEhPFvhhE>
    43be:	64 e1       	ldi	r22, 0x14	; 20
    43c0:	72 e1       	ldi	r23, 0x12	; 18
    43c2:	80 e0       	ldi	r24, 0x00	; 0
    43c4:	0e 94 b9 0b 	call	0x1772	; 0x1772 <_ZN6Config22setLoadCallbackForPageEhPFvhhE>
    43c8:	67 e2       	ldi	r22, 0x27	; 39
    43ca:	7f e0       	ldi	r23, 0x0F	; 15
    43cc:	85 e0       	ldi	r24, 0x05	; 5
    43ce:	0e 94 de 0b 	call	0x17bc	; 0x17bc <_ZN6Config22setSaveCallbackForPageEhPFvhhE>
    43d2:	61 e0       	ldi	r22, 0x01	; 1
    43d4:	70 e1       	ldi	r23, 0x10	; 16
    43d6:	85 e0       	ldi	r24, 0x05	; 5
    43d8:	0e 94 b9 0b 	call	0x1772	; 0x1772 <_ZN6Config22setLoadCallbackForPageEhPFvhhE>
    43dc:	62 e6       	ldi	r22, 0x62	; 98
    43de:	7f e0       	ldi	r23, 0x0F	; 15
    43e0:	84 e0       	ldi	r24, 0x04	; 4
    43e2:	0e 94 b9 0b 	call	0x1772	; 0x1772 <_ZN6Config22setLoadCallbackForPageEhPFvhhE>
    43e6:	6a eb       	ldi	r22, 0xBA	; 186
    43e8:	7f e0       	ldi	r23, 0x0F	; 15
    43ea:	84 e0       	ldi	r24, 0x04	; 4
    43ec:	0e 94 de 0b 	call	0x17bc	; 0x17bc <_ZN6Config22setSaveCallbackForPageEhPFvhhE>
    43f0:	81 e2       	ldi	r24, 0x21	; 33
    43f2:	9c e0       	ldi	r25, 0x0C	; 12
    43f4:	90 93 50 02 	sts	0x0250, r25	; 0x800250 <_ZN6ConfigL7entriesE+0x140>
    43f8:	80 93 4f 02 	sts	0x024F, r24	; 0x80024f <_ZN6ConfigL7entriesE+0x13f>
    43fc:	90 93 5d 02 	sts	0x025D, r25	; 0x80025d <_ZN6ConfigL7entriesE+0x14d>
    4400:	80 93 5c 02 	sts	0x025C, r24	; 0x80025c <_ZN6ConfigL7entriesE+0x14c>
    4404:	8f e2       	ldi	r24, 0x2F	; 47
    4406:	93 e1       	ldi	r25, 0x13	; 19
    4408:	90 93 77 02 	sts	0x0277, r25	; 0x800277 <_ZN6ConfigL7entriesE+0x167>
    440c:	80 93 76 02 	sts	0x0276, r24	; 0x800276 <_ZN6ConfigL7entriesE+0x166>
    4410:	6b e2       	ldi	r22, 0x2B	; 43
    4412:	73 e1       	ldi	r23, 0x13	; 19
    4414:	86 e0       	ldi	r24, 0x06	; 6
    4416:	0e 94 de 0b 	call	0x17bc	; 0x17bc <_ZN6Config22setSaveCallbackForPageEhPFvhhE>
    441a:	6c e5       	ldi	r22, 0x5C	; 92
    441c:	7c e0       	ldi	r23, 0x0C	; 12
    441e:	86 e0       	ldi	r24, 0x06	; 6
    4420:	0e 94 b9 0b 	call	0x1772	; 0x1772 <_ZN6Config22setLoadCallbackForPageEhPFvhhE>
    4424:	8c e1       	ldi	r24, 0x1C	; 28
    4426:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    442a:	8d e1       	ldi	r24, 0x1D	; 29
    442c:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    4430:	8e e1       	ldi	r24, 0x1E	; 30
    4432:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    4436:	8f e1       	ldi	r24, 0x1F	; 31
    4438:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    443c:	80 e2       	ldi	r24, 0x20	; 32
    443e:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    4442:	81 e2       	ldi	r24, 0x21	; 33
    4444:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    4448:	82 e2       	ldi	r24, 0x22	; 34
    444a:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    444e:	83 e2       	ldi	r24, 0x23	; 35
    4450:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6Config4loadENS_2IDE>
    4454:	80 e0       	ldi	r24, 0x00	; 0
    4456:	0e 94 34 0c 	call	0x1868	; 0x1868 <_ZN6TimersL14_loadTimerToUIEh>
    445a:	10 e0       	ldi	r17, 0x00	; 0
    445c:	81 2f       	mov	r24, r17
    445e:	0e 94 cc 12 	call	0x2598	; 0x2598 <_ZN6Config11loadForPageEh>
    4462:	1f 5f       	subi	r17, 0xFF	; 255
    4464:	19 30       	cpi	r17, 0x09	; 9
    4466:	d1 f7       	brne	.-12     	; 0x445c <main+0x400>
    4468:	ce 01       	movw	r24, r28
    446a:	41 96       	adiw	r24, 0x11	; 17
    446c:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    4470:	20 91 51 03 	lds	r18, 0x0351	; 0x800351 <timer_counter>
    4474:	30 91 52 03 	lds	r19, 0x0352	; 0x800352 <timer_counter+0x1>
    4478:	2c 19       	sub	r18, r12
    447a:	3d 09       	sbc	r19, r13
    447c:	20 3d       	cpi	r18, 0xD0	; 208
    447e:	57 e0       	ldi	r21, 0x07	; 7
    4480:	35 07       	cpc	r19, r21
    4482:	30 f4       	brcc	.+12     	; 0x4490 <main+0x434>
    4484:	80 ed       	ldi	r24, 0xD0	; 208
    4486:	97 e0       	ldi	r25, 0x07	; 7
    4488:	82 1b       	sub	r24, r18
    448a:	93 0b       	sbc	r25, r19
    448c:	0e 94 6c 0a 	call	0x14d8	; 0x14d8 <_Z4waitj>
    4490:	ce 01       	movw	r24, r28
    4492:	41 96       	adiw	r24, 0x11	; 17
    4494:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    4498:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    449c:	83 ff       	sbrs	r24, 3
    449e:	03 c0       	rjmp	.+6      	; 0x44a6 <main+0x44a>
    44a0:	87 7f       	andi	r24, 0xF7	; 247
    44a2:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    44a6:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    44aa:	8f 7e       	andi	r24, 0xEF	; 239
    44ac:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    44b0:	80 91 44 01 	lds	r24, 0x0144	; 0x800144 <_ZN6ConfigL7entriesE+0x34>
    44b4:	81 11       	cpse	r24, r1
    44b6:	4c c1       	rjmp	.+664    	; 0x4750 <main+0x6f4>
    44b8:	80 91 6b 01 	lds	r24, 0x016B	; 0x80016b <_ZN6ConfigL7entriesE+0x5b>
    44bc:	8a 30       	cpi	r24, 0x0A	; 10
    44be:	08 f0       	brcs	.+2      	; 0x44c2 <main+0x466>
    44c0:	89 e0       	ldi	r24, 0x09	; 9
    44c2:	af e9       	ldi	r26, 0x9F	; 159
    44c4:	8a 9f       	mul	r24, r26
    44c6:	c0 01       	movw	r24, r0
    44c8:	11 24       	eor	r1, r1
    44ca:	69 e0       	ldi	r22, 0x09	; 9
    44cc:	70 e0       	ldi	r23, 0x00	; 0
    44ce:	96 d4       	rcall	.+2348   	; 0x4dfc <__divmodhi4>
    44d0:	86 2f       	mov	r24, r22
    44d2:	62 e0       	ldi	r22, 0x02	; 2
    44d4:	8f 5e       	subi	r24, 0xEF	; 239
    44d6:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    44da:	ce 01       	movw	r24, r28
    44dc:	41 96       	adiw	r24, 0x11	; 17
    44de:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    44e2:	0e 94 8a 11 	call	0x2314	; 0x2314 <_Z33updateTimeCountersFromTimeSourcesv>
    44e6:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    44ea:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    44ee:	0e 94 d0 0a 	call	0x15a0	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>
    44f2:	ce 01       	movw	r24, r28
    44f4:	41 96       	adiw	r24, 0x11	; 17
    44f6:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    44fa:	80 e0       	ldi	r24, 0x00	; 0
    44fc:	0e 94 60 0a 	call	0x14c0	; 0x14c0 <_ZN3Led13setBrightnessEh>
    4500:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4504:	8f 77       	andi	r24, 0x7F	; 127
    4506:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    450a:	80 91 7b 00 	lds	r24, 0x007B	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    450e:	80 64       	ori	r24, 0x40	; 64
    4510:	80 93 7b 00 	sts	0x007B, r24	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    4514:	80 91 7c 00 	lds	r24, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    4518:	80 7f       	andi	r24, 0xF0	; 240
    451a:	83 60       	ori	r24, 0x03	; 3
    451c:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    4520:	8f b7       	in	r24, 0x3f	; 63
    4522:	f8 94       	cli
    4524:	2d e8       	ldi	r18, 0x8D	; 141
    4526:	33 e0       	ldi	r19, 0x03	; 3
    4528:	30 93 55 03 	sts	0x0355, r19	; 0x800355 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    452c:	20 93 54 03 	sts	0x0354, r18	; 0x800354 <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    4530:	8f bf       	out	0x3f, r24	; 63
    4532:	ea e0       	ldi	r30, 0x0A	; 10
    4534:	f5 e0       	ldi	r31, 0x05	; 5
    4536:	82 ed       	ldi	r24, 0xD2	; 210
    4538:	95 e0       	ldi	r25, 0x05	; 5
    453a:	11 92       	st	Z+, r1
    453c:	11 92       	st	Z+, r1
    453e:	8e 17       	cp	r24, r30
    4540:	9f 07       	cpc	r25, r31
    4542:	d9 f7       	brne	.-10     	; 0x453a <main+0x4de>
    4544:	10 92 d2 05 	sts	0x05D2, r1	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    4548:	10 92 d7 05 	sts	0x05D7, r1	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
    454c:	10 92 d8 05 	sts	0x05D8, r1	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
    4550:	10 92 d9 05 	sts	0x05D9, r1	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
    4554:	10 92 da 05 	sts	0x05DA, r1	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
    4558:	85 e6       	ldi	r24, 0x65	; 101
    455a:	80 93 db 05 	sts	0x05DB, r24	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    455e:	10 92 d3 05 	sts	0x05D3, r1	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
    4562:	10 92 d4 05 	sts	0x05D4, r1	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
    4566:	10 92 d5 05 	sts	0x05D5, r1	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
    456a:	10 92 d6 05 	sts	0x05D6, r1	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
    456e:	10 92 de 05 	sts	0x05DE, r1	; 0x8005de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    4572:	10 92 df 05 	sts	0x05DF, r1	; 0x8005df <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    4576:	10 92 e0 05 	sts	0x05E0, r1	; 0x8005e0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    457a:	10 92 e1 05 	sts	0x05E1, r1	; 0x8005e1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    457e:	10 92 e2 05 	sts	0x05E2, r1	; 0x8005e2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    4582:	10 92 e3 05 	sts	0x05E3, r1	; 0x8005e3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    4586:	10 92 e4 05 	sts	0x05E4, r1	; 0x8005e4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    458a:	10 92 e5 05 	sts	0x05E5, r1	; 0x8005e5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    458e:	10 92 e6 05 	sts	0x05E6, r1	; 0x8005e6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    4592:	10 92 e7 05 	sts	0x05E7, r1	; 0x8005e7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    4596:	10 92 e8 05 	sts	0x05E8, r1	; 0x8005e8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    459a:	10 92 e9 05 	sts	0x05E9, r1	; 0x8005e9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    459e:	10 92 ea 05 	sts	0x05EA, r1	; 0x8005ea <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    45a2:	8c e2       	ldi	r24, 0x2C	; 44
    45a4:	91 e0       	ldi	r25, 0x01	; 1
    45a6:	90 93 dd 05 	sts	0x05DD, r25	; 0x8005dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    45aa:	80 93 dc 05 	sts	0x05DC, r24	; 0x8005dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    45ae:	0e 94 c6 03 	call	0x78c	; 0x78c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    45b2:	10 92 5b 03 	sts	0x035B, r1	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    45b6:	10 92 5a 03 	sts	0x035A, r1	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    45ba:	10 92 66 03 	sts	0x0366, r1	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    45be:	10 92 65 03 	sts	0x0365, r1	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    45c2:	10 92 67 03 	sts	0x0367, r1	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    45c6:	10 92 68 03 	sts	0x0368, r1	; 0x800368 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    45ca:	10 92 69 03 	sts	0x0369, r1	; 0x800369 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    45ce:	10 92 6a 03 	sts	0x036A, r1	; 0x80036a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    45d2:	88 eb       	ldi	r24, 0xB8	; 184
    45d4:	9b e0       	ldi	r25, 0x0B	; 11
    45d6:	a0 e0       	ldi	r26, 0x00	; 0
    45d8:	b0 e0       	ldi	r27, 0x00	; 0
    45da:	80 93 6b 03 	sts	0x036B, r24	; 0x80036b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    45de:	90 93 6c 03 	sts	0x036C, r25	; 0x80036c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    45e2:	a0 93 6d 03 	sts	0x036D, r26	; 0x80036d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    45e6:	b0 93 6e 03 	sts	0x036E, r27	; 0x80036e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    45ea:	10 92 62 03 	sts	0x0362, r1	; 0x800362 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    45ee:	10 92 61 03 	sts	0x0361, r1	; 0x800361 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x7>
    45f2:	10 92 60 03 	sts	0x0360, r1	; 0x800360 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x6>
    45f6:	81 e0       	ldi	r24, 0x01	; 1
    45f8:	80 93 5e 03 	sts	0x035E, r24	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x4>
    45fc:	80 93 5d 03 	sts	0x035D, r24	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x3>
    4600:	10 92 5c 03 	sts	0x035C, r1	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x2>
    4604:	80 93 5f 03 	sts	0x035F, r24	; 0x80035f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x5>
    4608:	10 92 63 03 	sts	0x0363, r1	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    460c:	8c ed       	ldi	r24, 0xDC	; 220
    460e:	92 e0       	ldi	r25, 0x02	; 2
    4610:	90 93 06 01 	sts	0x0106, r25	; 0x800106 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE+0x1>
    4614:	80 93 05 01 	sts	0x0105, r24	; 0x800105 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE>
    4618:	25 9a       	sbi	0x04, 5	; 4
    461a:	ce 01       	movw	r24, r28
    461c:	41 96       	adiw	r24, 0x11	; 17
    461e:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    4622:	ce 01       	movw	r24, r28
    4624:	41 96       	adiw	r24, 0x11	; 17
    4626:	0e 94 08 0a 	call	0x1410	; 0x1410 <_ZZ5setupvENKUlPK19__FlashStringHelperE_clES1_.isra.1>
    462a:	fe 01       	movw	r30, r28
    462c:	31 96       	adiw	r30, 0x01	; 1
    462e:	6f 01       	movw	r12, r30
    4630:	a1 e1       	ldi	r26, 0x11	; 17
    4632:	6a 2e       	mov	r6, r26
    4634:	71 2c       	mov	r7, r1
    4636:	aa 24       	eor	r10, r10
    4638:	aa 94       	dec	r10
    463a:	b3 e0       	ldi	r27, 0x03	; 3
    463c:	bb 2e       	mov	r11, r27
    463e:	12 e0       	ldi	r17, 0x02	; 2
    4640:	81 2e       	mov	r8, r17
    4642:	91 2c       	mov	r9, r1
    4644:	71 e4       	ldi	r23, 0x41	; 65
    4646:	37 2e       	mov	r3, r23
    4648:	ea e0       	ldi	r30, 0x0A	; 10
    464a:	5e 2e       	mov	r5, r30
    464c:	f3 e0       	ldi	r31, 0x03	; 3
    464e:	4f 2e       	mov	r4, r31
    4650:	a8 95       	wdr
    4652:	80 91 40 03 	lds	r24, 0x0340	; 0x800340 <_ZN3LedL10_LED_B_REGE>
    4656:	88 23       	and	r24, r24
    4658:	09 f4       	brne	.+2      	; 0x465c <main+0x600>
    465a:	7e c0       	rjmp	.+252    	; 0x4758 <main+0x6fc>
    465c:	90 91 3f 03 	lds	r25, 0x033F	; 0x80033f <_ZN3LedL10_LED_B_CNTE>
    4660:	98 17       	cp	r25, r24
    4662:	08 f4       	brcc	.+2      	; 0x4666 <main+0x60a>
    4664:	79 c0       	rjmp	.+242    	; 0x4758 <main+0x6fc>
    4666:	2b 9a       	sbi	0x05, 3	; 5
    4668:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    466c:	80 ff       	sbrs	r24, 0
    466e:	9f c1       	rjmp	.+830    	; 0x49ae <main+0x952>
    4670:	80 91 fe 05 	lds	r24, 0x05FE	; 0x8005fe <__brkval>
    4674:	90 91 ff 05 	lds	r25, 0x05FF	; 0x8005ff <__brkval+0x1>
    4678:	00 97       	sbiw	r24, 0x00	; 0
    467a:	11 f4       	brne	.+4      	; 0x4680 <main+0x624>
    467c:	8a e1       	ldi	r24, 0x1A	; 26
    467e:	96 e0       	ldi	r25, 0x06	; 6
    4680:	96 01       	movw	r18, r12
    4682:	28 1b       	sub	r18, r24
    4684:	39 0b       	sbc	r19, r25
    4686:	c9 01       	movw	r24, r18
    4688:	e2 e0       	ldi	r30, 0x02	; 2
    468a:	f6 e0       	ldi	r31, 0x06	; 6
    468c:	21 91       	ld	r18, Z+
    468e:	25 3c       	cpi	r18, 0xC5	; 197
    4690:	09 f0       	breq	.+2      	; 0x4694 <main+0x638>
    4692:	64 c0       	rjmp	.+200    	; 0x475c <main+0x700>
    4694:	ee 15       	cp	r30, r14
    4696:	ff 05       	cpc	r31, r15
    4698:	c9 f7       	brne	.-14     	; 0x468c <main+0x630>
    469a:	80 34       	cpi	r24, 0x40	; 64
    469c:	91 05       	cpc	r25, r1
    469e:	0c f4       	brge	.+2      	; 0x46a2 <main+0x646>
    46a0:	5d c0       	rjmp	.+186    	; 0x475c <main+0x700>
    46a2:	2f b7       	in	r18, 0x3f	; 63
    46a4:	f8 94       	cli
    46a6:	80 91 51 03 	lds	r24, 0x0351	; 0x800351 <timer_counter>
    46aa:	90 91 52 03 	lds	r25, 0x0352	; 0x800352 <timer_counter+0x1>
    46ae:	2f bf       	out	0x3f, r18	; 63
    46b0:	89 2b       	or	r24, r25
    46b2:	f1 f4       	brne	.+60     	; 0x46f0 <main+0x694>
    46b4:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    46b8:	81 11       	cpse	r24, r1
    46ba:	1a c0       	rjmp	.+52     	; 0x46f0 <main+0x694>
    46bc:	20 90 4f 03 	lds	r2, 0x034F	; 0x80034f <t_counter_hours>
    46c0:	0c e7       	ldi	r16, 0x7C	; 124
    46c2:	12 e0       	ldi	r17, 0x02	; 2
    46c4:	d8 01       	movw	r26, r16
    46c6:	9c 91       	ld	r25, X
    46c8:	1d 96       	adiw	r26, 0x0d	; 13
    46ca:	8c 91       	ld	r24, X
    46cc:	88 23       	and	r24, r24
    46ce:	51 f0       	breq	.+20     	; 0x46e4 <main+0x688>
    46d0:	29 12       	cpse	r2, r25
    46d2:	08 c0       	rjmp	.+16     	; 0x46e4 <main+0x688>
    46d4:	82 30       	cpi	r24, 0x02	; 2
    46d6:	09 f4       	brne	.+2      	; 0x46da <main+0x67e>
    46d8:	62 c0       	rjmp	.+196    	; 0x479e <main+0x742>
    46da:	08 f0       	brcs	.+2      	; 0x46de <main+0x682>
    46dc:	4a c0       	rjmp	.+148    	; 0x4772 <main+0x716>
    46de:	81 30       	cpi	r24, 0x01	; 1
    46e0:	09 f4       	brne	.+2      	; 0x46e4 <main+0x688>
    46e2:	4e c0       	rjmp	.+156    	; 0x4780 <main+0x724>
    46e4:	06 5e       	subi	r16, 0xE6	; 230
    46e6:	1f 4f       	sbci	r17, 0xFF	; 255
    46e8:	b2 e0       	ldi	r27, 0x02	; 2
    46ea:	04 3e       	cpi	r16, 0xE4	; 228
    46ec:	1b 07       	cpc	r17, r27
    46ee:	51 f7       	brne	.-44     	; 0x46c4 <main+0x668>
    46f0:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    46f4:	8a 70       	andi	r24, 0x0A	; 10
    46f6:	09 f0       	breq	.+2      	; 0x46fa <main+0x69e>
    46f8:	72 c0       	rjmp	.+228    	; 0x47de <main+0x782>
    46fa:	80 91 41 03 	lds	r24, 0x0341	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    46fe:	8f 5f       	subi	r24, 0xFF	; 255
    4700:	80 93 41 03 	sts	0x0341, r24	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    4704:	90 91 47 03 	lds	r25, 0x0347	; 0x800347 <_ZN5ViewsL18_is_any_view_shownE>
    4708:	91 11       	cpse	r25, r1
    470a:	2f c3       	rjmp	.+1630   	; 0x4d6a <main+0xd0e>
    470c:	8c 33       	cpi	r24, 0x3C	; 60
    470e:	08 f4       	brcc	.+2      	; 0x4712 <main+0x6b6>
    4710:	66 c0       	rjmp	.+204    	; 0x47de <main+0x782>
    4712:	10 92 41 03 	sts	0x0341, r1	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    4716:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <_ZN5ViewsL16_last_view_indexE>
    471a:	08 2e       	mov	r0, r24
    471c:	00 0c       	add	r0, r0
    471e:	99 0b       	sbc	r25, r25
    4720:	01 96       	adiw	r24, 0x01	; 1
    4722:	b4 01       	movw	r22, r8
    4724:	6b d3       	rcall	.+1750   	; 0x4dfc <__divmodhi4>
    4726:	98 2f       	mov	r25, r24
    4728:	82 30       	cpi	r24, 0x02	; 2
    472a:	18 f4       	brcc	.+6      	; 0x4732 <main+0x6d6>
    472c:	9f 3f       	cpi	r25, 0xFF	; 255
    472e:	09 f0       	breq	.+2      	; 0x4732 <main+0x6d6>
    4730:	54 c0       	rjmp	.+168    	; 0x47da <main+0x77e>
    4732:	0e 94 21 0b 	call	0x1642	; 0x1642 <_ZN5Views9hideViewsEv>
    4736:	53 c0       	rjmp	.+166    	; 0x47de <main+0x782>
    4738:	8b e9       	ldi	r24, 0x9B	; 155
    473a:	90 e0       	ldi	r25, 0x00	; 0
    473c:	0e 94 81 09 	call	0x1302	; 0x1302 <_ZN11SerialClass7printlnEPK19__FlashStringHelper.isra.8>
    4740:	0e 94 6e 09 	call	0x12dc	; 0x12dc <_ZN11SerialClass5flushEv.isra.4>
    4744:	ba cd       	rjmp	.-1164   	; 0x42ba <main+0x25e>
    4746:	20 17       	cp	r18, r16
    4748:	31 07       	cpc	r19, r17
    474a:	09 f0       	breq	.+2      	; 0x474e <main+0x6f2>
    474c:	0e ce       	rjmp	.-996    	; 0x436a <main+0x30e>
    474e:	2e ce       	rjmp	.-932    	; 0x43ac <main+0x350>
    4750:	62 e0       	ldi	r22, 0x02	; 2
    4752:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <_ZN7Display21configured_brightnessE>
    4756:	bf ce       	rjmp	.-642    	; 0x44d6 <main+0x47a>
    4758:	2b 98       	cbi	0x05, 3	; 5
    475a:	86 cf       	rjmp	.-244    	; 0x4668 <main+0x60c>
    475c:	88 e1       	ldi	r24, 0x18	; 24
    475e:	98 e0       	ldi	r25, 0x08	; 8
    4760:	0f b6       	in	r0, 0x3f	; 63
    4762:	f8 94       	cli
    4764:	a8 95       	wdr
    4766:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    476a:	0f be       	out	0x3f, r0	; 63
    476c:	90 93 60 00 	sts	0x0060, r25	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4770:	ff cf       	rjmp	.-2      	; 0x4770 <main+0x714>
    4772:	83 30       	cpi	r24, 0x03	; 3
    4774:	49 f1       	breq	.+82     	; 0x47c8 <main+0x76c>
    4776:	84 30       	cpi	r24, 0x04	; 4
    4778:	09 f0       	breq	.+2      	; 0x477c <main+0x720>
    477a:	b4 cf       	rjmp	.-152    	; 0x46e4 <main+0x688>
    477c:	25 9a       	sbi	0x04, 5	; 4
    477e:	b2 cf       	rjmp	.-156    	; 0x46e4 <main+0x688>
    4780:	80 93 46 03 	sts	0x0346, r24	; 0x800346 <_ZN6TimersL11_night_modeE>
    4784:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    4788:	80 62       	ori	r24, 0x20	; 32
    478a:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    478e:	60 e0       	ldi	r22, 0x00	; 0
    4790:	80 e0       	ldi	r24, 0x00	; 0
    4792:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    4796:	50 92 69 00 	sts	0x0069, r5	; 0x800069 <__TEXT_REGION_LENGTH__+0x7e0069>
    479a:	4d ba       	out	0x1d, r4	; 29
    479c:	a3 cf       	rjmp	.-186    	; 0x46e4 <main+0x688>
    479e:	80 91 46 03 	lds	r24, 0x0346	; 0x800346 <_ZN6TimersL11_night_modeE>
    47a2:	88 23       	and	r24, r24
    47a4:	09 f4       	brne	.+2      	; 0x47a8 <main+0x74c>
    47a6:	9e cf       	rjmp	.-196    	; 0x46e4 <main+0x688>
    47a8:	10 92 46 03 	sts	0x0346, r1	; 0x800346 <_ZN6TimersL11_night_modeE>
    47ac:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    47b0:	8f 7d       	andi	r24, 0xDF	; 223
    47b2:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    47b6:	8d b3       	in	r24, 0x1d	; 29
    47b8:	8c 7f       	andi	r24, 0xFC	; 252
    47ba:	8d bb       	out	0x1d, r24	; 29
    47bc:	60 e0       	ldi	r22, 0x00	; 0
    47be:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <_ZN7Display21configured_brightnessE>
    47c2:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    47c6:	8e cf       	rjmp	.-228    	; 0x46e4 <main+0x688>
    47c8:	60 e0       	ldi	r22, 0x00	; 0
    47ca:	88 e5       	ldi	r24, 0x58	; 88
    47cc:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    47d0:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_ZN7Display18_target_brightnessE>
    47d4:	80 93 08 01 	sts	0x0108, r24	; 0x800108 <_ZN7Display21configured_brightnessE>
    47d8:	85 cf       	rjmp	.-246    	; 0x46e4 <main+0x688>
    47da:	0e 94 bc 0a 	call	0x1578	; 0x1578 <_ZN5Views8showViewEa.part.4>
    47de:	0e 94 8a 11 	call	0x2314	; 0x2314 <_Z33updateTimeCountersFromTimeSourcesv>
    47e2:	88 23       	and	r24, r24
    47e4:	71 f0       	breq	.+28     	; 0x4802 <main+0x7a6>
    47e6:	80 91 47 03 	lds	r24, 0x0347	; 0x800347 <_ZN5ViewsL18_is_any_view_shownE>
    47ea:	81 11       	cpse	r24, r1
    47ec:	0a c0       	rjmp	.+20     	; 0x4802 <main+0x7a6>
    47ee:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    47f2:	8a 70       	andi	r24, 0x0A	; 10
    47f4:	31 f4       	brne	.+12     	; 0x4802 <main+0x7a6>
    47f6:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    47fa:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    47fe:	0e 94 d0 0a 	call	0x15a0	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>
    4802:	0e 94 9c 09 	call	0x1338	; 0x1338 <_ZN7Modules22updateConnectionStatusEv>
    4806:	25 9b       	sbis	0x04, 5	; 4
    4808:	5e c0       	rjmp	.+188    	; 0x48c6 <main+0x86a>
    480a:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    480e:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    4812:	82 30       	cpi	r24, 0x02	; 2
    4814:	28 f0       	brcs	.+10     	; 0x4820 <main+0x7c4>
    4816:	20 91 42 03 	lds	r18, 0x0342	; 0x800342 <_ZZN9DCF77SyncL16syncJustHappenedEvE10last_state>
    481a:	22 30       	cpi	r18, 0x02	; 2
    481c:	08 f4       	brcc	.+2      	; 0x4820 <main+0x7c4>
    481e:	f3 c0       	rjmp	.+486    	; 0x4a06 <main+0x9aa>
    4820:	80 93 42 03 	sts	0x0342, r24	; 0x800342 <_ZZN9DCF77SyncL16syncJustHappenedEvE10last_state>
    4824:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4828:	84 ff       	sbrs	r24, 4
    482a:	f5 c0       	rjmp	.+490    	; 0x4a16 <main+0x9ba>
    482c:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4830:	8f 7e       	andi	r24, 0xEF	; 239
    4832:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    4836:	25 98       	cbi	0x04, 5	; 4
    4838:	60 e0       	ldi	r22, 0x00	; 0
    483a:	82 e0       	ldi	r24, 0x02	; 2
    483c:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4840:	c6 01       	movw	r24, r12
    4842:	0e 94 cd 06 	call	0xd9a	; 0xd9a <_ZN11DCF77_Clock17read_current_timeERN5Clock6time_tE>
    4846:	8d 81       	ldd	r24, Y+5	; 0x05
    4848:	98 2f       	mov	r25, r24
    484a:	92 95       	swap	r25
    484c:	9f 70       	andi	r25, 0x0F	; 15
    484e:	8f 70       	andi	r24, 0x0F	; 15
    4850:	95 9d       	mul	r25, r5
    4852:	80 0d       	add	r24, r0
    4854:	11 24       	eor	r1, r1
    4856:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <t_counter_hours>
    485a:	9e 81       	ldd	r25, Y+6	; 0x06
    485c:	29 2f       	mov	r18, r25
    485e:	22 95       	swap	r18
    4860:	2f 70       	andi	r18, 0x0F	; 15
    4862:	9f 70       	andi	r25, 0x0F	; 15
    4864:	25 9d       	mul	r18, r5
    4866:	90 0d       	add	r25, r0
    4868:	11 24       	eor	r1, r1
    486a:	90 93 50 03 	sts	0x0350, r25	; 0x800350 <t_counter_minutes>
    486e:	9b 87       	std	Y+11, r25	; 0x0b
    4870:	8c 87       	std	Y+12, r24	; 0x0c
    4872:	8b 81       	ldd	r24, Y+3	; 0x03
    4874:	98 2f       	mov	r25, r24
    4876:	92 95       	swap	r25
    4878:	9f 70       	andi	r25, 0x0F	; 15
    487a:	8f 70       	andi	r24, 0x0F	; 15
    487c:	95 9d       	mul	r25, r5
    487e:	80 0d       	add	r24, r0
    4880:	11 24       	eor	r1, r1
    4882:	8d 87       	std	Y+13, r24	; 0x0d
    4884:	8a 81       	ldd	r24, Y+2	; 0x02
    4886:	98 2f       	mov	r25, r24
    4888:	92 95       	swap	r25
    488a:	9f 70       	andi	r25, 0x0F	; 15
    488c:	8f 70       	andi	r24, 0x0F	; 15
    488e:	95 9d       	mul	r25, r5
    4890:	80 0d       	add	r24, r0
    4892:	11 24       	eor	r1, r1
    4894:	8e 87       	std	Y+14, r24	; 0x0e
    4896:	89 81       	ldd	r24, Y+1	; 0x01
    4898:	98 2f       	mov	r25, r24
    489a:	92 95       	swap	r25
    489c:	9f 70       	andi	r25, 0x0F	; 15
    489e:	8f 70       	andi	r24, 0x0F	; 15
    48a0:	95 9d       	mul	r25, r5
    48a2:	80 0d       	add	r24, r0
    48a4:	11 24       	eor	r1, r1
    48a6:	90 e0       	ldi	r25, 0x00	; 0
    48a8:	80 53       	subi	r24, 0x30	; 48
    48aa:	98 4f       	sbci	r25, 0xF8	; 248
    48ac:	98 8b       	std	Y+16, r25	; 0x10
    48ae:	8f 87       	std	Y+15, r24	; 0x0f
    48b0:	ce 01       	movw	r24, r28
    48b2:	0b 96       	adiw	r24, 0x0b	; 11
    48b4:	0e 94 11 0e 	call	0x1c22	; 0x1c22 <_ZN7Modules6DS32316adjustERKNS0_8DateTimeE>
    48b8:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    48bc:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    48c0:	0e 94 d0 0a 	call	0x15a0	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>
    48c4:	25 98       	cbi	0x04, 5	; 4
    48c6:	80 91 44 01 	lds	r24, 0x0144	; 0x800144 <_ZN6ConfigL7entriesE+0x34>
    48ca:	88 23       	and	r24, r24
    48cc:	09 f4       	brne	.+2      	; 0x48d0 <main+0x874>
    48ce:	6a c0       	rjmp	.+212    	; 0x49a4 <main+0x948>
    48d0:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    48d4:	8a 70       	andi	r24, 0x0A	; 10
    48d6:	09 f0       	breq	.+2      	; 0x48da <main+0x87e>
    48d8:	65 c0       	rjmp	.+202    	; 0x49a4 <main+0x948>
    48da:	20 91 7c 00 	lds	r18, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    48de:	30 91 7a 00 	lds	r19, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    48e2:	40 91 7b 00 	lds	r20, 0x007B	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    48e6:	80 91 7b 00 	lds	r24, 0x007B	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    48ea:	8f 7b       	andi	r24, 0xBF	; 191
    48ec:	80 93 7b 00 	sts	0x007B, r24	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    48f0:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    48f4:	80 68       	ori	r24, 0x80	; 128
    48f6:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    48fa:	30 92 7c 00 	sts	0x007C, r3	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    48fe:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4902:	80 64       	ori	r24, 0x40	; 64
    4904:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4908:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    490c:	86 fd       	sbrc	r24, 6
    490e:	fc cf       	rjmp	.-8      	; 0x4908 <main+0x8ac>
    4910:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4914:	80 64       	ori	r24, 0x40	; 64
    4916:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    491a:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    491e:	86 fd       	sbrc	r24, 6
    4920:	fc cf       	rjmp	.-8      	; 0x491a <main+0x8be>
    4922:	80 91 78 00 	lds	r24, 0x0078	; 0x800078 <__TEXT_REGION_LENGTH__+0x7e0078>
    4926:	90 91 79 00 	lds	r25, 0x0079	; 0x800079 <__TEXT_REGION_LENGTH__+0x7e0079>
    492a:	40 93 7b 00 	sts	0x007B, r20	; 0x80007b <__TEXT_REGION_LENGTH__+0x7e007b>
    492e:	30 93 7a 00 	sts	0x007A, r19	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4932:	20 93 7c 00 	sts	0x007C, r18	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    4936:	20 91 0e 01 	lds	r18, 0x010E	; 0x80010e <_ZZ4loopvE12ldr_filtered>
    493a:	30 91 0f 01 	lds	r19, 0x010F	; 0x80010f <_ZZ4loopvE12ldr_filtered+0x1>
    493e:	82 1b       	sub	r24, r18
    4940:	93 0b       	sbc	r25, r19
    4942:	ac 01       	movw	r20, r24
    4944:	40 5b       	subi	r20, 0xB0	; 176
    4946:	5f 4f       	sbci	r21, 0xFF	; 255
    4948:	41 3a       	cpi	r20, 0xA1	; 161
    494a:	51 05       	cpc	r21, r1
    494c:	08 f4       	brcc	.+2      	; 0x4950 <main+0x8f4>
    494e:	80 c0       	rjmp	.+256    	; 0x4a50 <main+0x9f4>
    4950:	95 95       	asr	r25
    4952:	87 95       	ror	r24
    4954:	82 0f       	add	r24, r18
    4956:	93 1f       	adc	r25, r19
    4958:	90 93 0f 01 	sts	0x010F, r25	; 0x80010f <_ZZ4loopvE12ldr_filtered+0x1>
    495c:	80 93 0e 01 	sts	0x010E, r24	; 0x80010e <_ZZ4loopvE12ldr_filtered>
    4960:	e0 91 08 01 	lds	r30, 0x0108	; 0x800108 <_ZN7Display21configured_brightnessE>
    4964:	2e 2f       	mov	r18, r30
    4966:	30 e0       	ldi	r19, 0x00	; 0
    4968:	b3 01       	movw	r22, r6
    496a:	62 1b       	sub	r22, r18
    496c:	73 0b       	sbc	r23, r19
    496e:	40 91 0e 01 	lds	r20, 0x010E	; 0x80010e <_ZZ4loopvE12ldr_filtered>
    4972:	50 91 0f 01 	lds	r21, 0x010F	; 0x80010f <_ZZ4loopvE12ldr_filtered+0x1>
    4976:	64 9f       	mul	r22, r20
    4978:	c0 01       	movw	r24, r0
    497a:	65 9f       	mul	r22, r21
    497c:	90 0d       	add	r25, r0
    497e:	74 9f       	mul	r23, r20
    4980:	90 0d       	add	r25, r0
    4982:	11 24       	eor	r1, r1
    4984:	b5 01       	movw	r22, r10
    4986:	3a d2       	rcall	.+1140   	; 0x4dfc <__divmodhi4>
    4988:	62 0f       	add	r22, r18
    498a:	73 1f       	adc	r23, r19
    498c:	61 31       	cpi	r22, 0x11	; 17
    498e:	71 05       	cpc	r23, r1
    4990:	0c f4       	brge	.+2      	; 0x4994 <main+0x938>
    4992:	6f c0       	rjmp	.+222    	; 0x4a72 <main+0xa16>
    4994:	26 17       	cp	r18, r22
    4996:	37 07       	cpc	r19, r23
    4998:	0c f0       	brlt	.+2      	; 0x499c <main+0x940>
    499a:	e6 2f       	mov	r30, r22
    499c:	62 e0       	ldi	r22, 0x02	; 2
    499e:	8e 2f       	mov	r24, r30
    49a0:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    49a4:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    49a8:	8e 7f       	andi	r24, 0xFE	; 254
    49aa:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    49ae:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    49b2:	82 ff       	sbrs	r24, 2
    49b4:	4d ce       	rjmp	.-870    	; 0x4650 <main+0x5f4>
    49b6:	80 91 46 03 	lds	r24, 0x0346	; 0x800346 <_ZN6TimersL11_night_modeE>
    49ba:	88 23       	and	r24, r24
    49bc:	09 f4       	brne	.+2      	; 0x49c0 <main+0x964>
    49be:	7f c0       	rjmp	.+254    	; 0x4abe <main+0xa62>
    49c0:	8f b7       	in	r24, 0x3f	; 63
    49c2:	f8 94       	cli
    49c4:	00 91 51 03 	lds	r16, 0x0351	; 0x800351 <timer_counter>
    49c8:	10 91 52 03 	lds	r17, 0x0352	; 0x800352 <timer_counter+0x1>
    49cc:	8f bf       	out	0x3f, r24	; 63
    49ce:	20 91 0b 01 	lds	r18, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    49d2:	2c 70       	andi	r18, 0x0C	; 12
    49d4:	80 91 44 03 	lds	r24, 0x0344	; 0x800344 <_ZN6TimersL15_preview_end_msE>
    49d8:	90 91 45 03 	lds	r25, 0x0345	; 0x800345 <_ZN6TimersL15_preview_end_msE+0x1>
    49dc:	2c 30       	cpi	r18, 0x0C	; 12
    49de:	19 f0       	breq	.+6      	; 0x49e6 <main+0x98a>
    49e0:	00 97       	sbiw	r24, 0x00	; 0
    49e2:	09 f4       	brne	.+2      	; 0x49e6 <main+0x98a>
    49e4:	48 c0       	rjmp	.+144    	; 0x4a76 <main+0xa1a>
    49e6:	00 97       	sbiw	r24, 0x00	; 0
    49e8:	09 f0       	breq	.+2      	; 0x49ec <main+0x990>
    49ea:	57 c0       	rjmp	.+174    	; 0x4a9a <main+0xa3e>
    49ec:	83 b7       	in	r24, 0x33	; 51
    49ee:	81 7f       	andi	r24, 0xF1	; 241
    49f0:	86 60       	ori	r24, 0x06	; 6
    49f2:	83 bf       	out	0x33, r24	; 51
    49f4:	83 b7       	in	r24, 0x33	; 51
    49f6:	81 60       	ori	r24, 0x01	; 1
    49f8:	83 bf       	out	0x33, r24	; 51
    49fa:	78 94       	sei
    49fc:	88 95       	sleep
    49fe:	83 b7       	in	r24, 0x33	; 51
    4a00:	8e 7f       	andi	r24, 0xFE	; 254
    4a02:	83 bf       	out	0x33, r24	; 51
    4a04:	1f ce       	rjmp	.-962    	; 0x4644 <main+0x5e8>
    4a06:	80 93 42 03 	sts	0x0342, r24	; 0x800342 <_ZZN9DCF77SyncL16syncJustHappenedEvE10last_state>
    4a0a:	25 98       	cbi	0x04, 5	; 4
    4a0c:	60 e0       	ldi	r22, 0x00	; 0
    4a0e:	82 e0       	ldi	r24, 0x02	; 2
    4a10:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4a14:	07 cf       	rjmp	.-498    	; 0x4824 <main+0x7c8>
    4a16:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    4a1a:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    4a1e:	82 30       	cpi	r24, 0x02	; 2
    4a20:	a0 f0       	brcs	.+40     	; 0x4a4a <main+0x9ee>
    4a22:	25 98       	cbi	0x04, 5	; 4
    4a24:	80 91 43 03 	lds	r24, 0x0343	; 0x800343 <_ZZN9DCF77SyncL21handleDCF77ClockStateEvE10last_state>
    4a28:	82 30       	cpi	r24, 0x02	; 2
    4a2a:	28 f4       	brcc	.+10     	; 0x4a36 <main+0x9da>
    4a2c:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4a30:	80 61       	ori	r24, 0x10	; 16
    4a32:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    4a36:	80 e0       	ldi	r24, 0x00	; 0
    4a38:	0e 94 60 0a 	call	0x14c0	; 0x14c0 <_ZN3Led13setBrightnessEh>
    4a3c:	60 e0       	ldi	r22, 0x00	; 0
    4a3e:	82 e0       	ldi	r24, 0x02	; 2
    4a40:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4a44:	10 92 43 03 	sts	0x0343, r1	; 0x800343 <_ZZN9DCF77SyncL21handleDCF77ClockStateEvE10last_state>
    4a48:	3e cf       	rjmp	.-388    	; 0x48c6 <main+0x86a>
    4a4a:	80 93 43 03 	sts	0x0343, r24	; 0x800343 <_ZZN9DCF77SyncL21handleDCF77ClockStateEvE10last_state>
    4a4e:	3b cf       	rjmp	.-394    	; 0x48c6 <main+0x86a>
    4a50:	ac 01       	movw	r20, r24
    4a52:	42 5e       	subi	r20, 0xE2	; 226
    4a54:	5f 4f       	sbci	r21, 0xFF	; 255
    4a56:	4d 33       	cpi	r20, 0x3D	; 61
    4a58:	51 05       	cpc	r21, r1
    4a5a:	28 f0       	brcs	.+10     	; 0x4a66 <main+0xa0a>
    4a5c:	95 95       	asr	r25
    4a5e:	87 95       	ror	r24
    4a60:	95 95       	asr	r25
    4a62:	87 95       	ror	r24
    4a64:	77 cf       	rjmp	.-274    	; 0x4954 <main+0x8f8>
    4a66:	43 e0       	ldi	r20, 0x03	; 3
    4a68:	95 95       	asr	r25
    4a6a:	87 95       	ror	r24
    4a6c:	4a 95       	dec	r20
    4a6e:	e1 f7       	brne	.-8      	; 0x4a68 <main+0xa0c>
    4a70:	71 cf       	rjmp	.-286    	; 0x4954 <main+0x8f8>
    4a72:	e1 e1       	ldi	r30, 0x11	; 17
    4a74:	93 cf       	rjmp	.-218    	; 0x499c <main+0x940>
    4a76:	60 e0       	ldi	r22, 0x00	; 0
    4a78:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <_ZN7Display21configured_brightnessE>
    4a7c:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    4a80:	60 91 4f 03 	lds	r22, 0x034F	; 0x80034f <t_counter_hours>
    4a84:	80 91 50 03 	lds	r24, 0x0350	; 0x800350 <t_counter_minutes>
    4a88:	0e 94 d0 0a 	call	0x15a0	; 0x15a0 <_ZN7Display23displayTimeFromCountersEhh>
    4a8c:	08 57       	subi	r16, 0x78	; 120
    4a8e:	1c 4e       	sbci	r17, 0xEC	; 236
    4a90:	10 93 45 03 	sts	0x0345, r17	; 0x800345 <_ZN6TimersL15_preview_end_msE+0x1>
    4a94:	00 93 44 03 	sts	0x0344, r16	; 0x800344 <_ZN6TimersL15_preview_end_msE>
    4a98:	d5 cd       	rjmp	.-1110   	; 0x4644 <main+0x5e8>
    4a9a:	08 17       	cp	r16, r24
    4a9c:	19 07       	cpc	r17, r25
    4a9e:	08 f4       	brcc	.+2      	; 0x4aa2 <main+0xa46>
    4aa0:	d1 cd       	rjmp	.-1118   	; 0x4644 <main+0x5e8>
    4aa2:	10 92 45 03 	sts	0x0345, r1	; 0x800345 <_ZN6TimersL15_preview_end_msE+0x1>
    4aa6:	10 92 44 03 	sts	0x0344, r1	; 0x800344 <_ZN6TimersL15_preview_end_msE>
    4aaa:	80 91 46 03 	lds	r24, 0x0346	; 0x800346 <_ZN6TimersL11_night_modeE>
    4aae:	88 23       	and	r24, r24
    4ab0:	09 f4       	brne	.+2      	; 0x4ab4 <main+0xa58>
    4ab2:	c8 cd       	rjmp	.-1136   	; 0x4644 <main+0x5e8>
    4ab4:	60 e0       	ldi	r22, 0x00	; 0
    4ab6:	80 e0       	ldi	r24, 0x00	; 0
    4ab8:	0e 94 70 0b 	call	0x16e0	; 0x16e0 <_ZN7Display13setBrightnessEhh>
    4abc:	c3 cd       	rjmp	.-1146   	; 0x4644 <main+0x5e8>
    4abe:	19 b1       	in	r17, 0x09	; 9
    4ac0:	80 91 4c 03 	lds	r24, 0x034C	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4ac4:	83 ff       	sbrs	r24, 3
    4ac6:	d6 c0       	rjmp	.+428    	; 0x4c74 <main+0xc18>
    4ac8:	80 91 0c 01 	lds	r24, 0x010C	; 0x80010c <_ZN7ButtonsL8TEMP_REGE>
    4acc:	91 2f       	mov	r25, r17
    4ace:	98 27       	eor	r25, r24
    4ad0:	9c 70       	andi	r25, 0x0C	; 12
    4ad2:	09 f4       	brne	.+2      	; 0x4ad6 <main+0xa7a>
    4ad4:	45 c0       	rjmp	.+138    	; 0x4b60 <main+0xb04>
    4ad6:	10 92 4b 03 	sts	0x034B, r1	; 0x80034b <_ZN7ButtonsL12debounce_cntE>
    4ada:	10 92 4a 03 	sts	0x034A, r1	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4ade:	10 92 49 03 	sts	0x0349, r1	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4ae2:	10 93 0c 01 	sts	0x010C, r17	; 0x80010c <_ZN7ButtonsL8TEMP_REGE>
    4ae6:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    4aea:	81 ff       	sbrs	r24, 1
    4aec:	10 c0       	rjmp	.+32     	; 0x4b0e <main+0xab2>
    4aee:	2f b7       	in	r18, 0x3f	; 63
    4af0:	f8 94       	cli
    4af2:	80 91 51 03 	lds	r24, 0x0351	; 0x800351 <timer_counter>
    4af6:	90 91 52 03 	lds	r25, 0x0352	; 0x800352 <timer_counter+0x1>
    4afa:	2f bf       	out	0x3f, r18	; 63
    4afc:	80 36       	cpi	r24, 0x60	; 96
    4afe:	9a 4e       	sbci	r25, 0xEA	; 234
    4b00:	30 f0       	brcs	.+12     	; 0x4b0e <main+0xab2>
    4b02:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4b06:	0e 94 cc 12 	call	0x2598	; 0x2598 <_ZN6Config11loadForPageEh>
    4b0a:	0e 94 4d 13 	call	0x269a	; 0x269a <_Z12exitEditModev>
    4b0e:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4b12:	84 fd       	sbrc	r24, 4
    4b14:	1a c0       	rjmp	.+52     	; 0x4b4a <main+0xaee>
    4b16:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4b1a:	83 ff       	sbrs	r24, 3
    4b1c:	22 c1       	rjmp	.+580    	; 0x4d62 <main+0xd06>
    4b1e:	60 91 0d 01 	lds	r22, 0x010D	; 0x80010d <led_brightness>
    4b22:	81 e0       	ldi	r24, 0x01	; 1
    4b24:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4b28:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    4b2c:	90 91 5b 03 	lds	r25, 0x035B	; 0x80035b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    4b30:	81 30       	cpi	r24, 0x01	; 1
    4b32:	59 f4       	brne	.+22     	; 0x4b4a <main+0xaee>
    4b34:	60 91 0d 01 	lds	r22, 0x010D	; 0x80010d <led_brightness>
    4b38:	66 95       	lsr	r22
    4b3a:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4b3e:	60 91 0d 01 	lds	r22, 0x010D	; 0x80010d <led_brightness>
    4b42:	66 95       	lsr	r22
    4b44:	82 e0       	ldi	r24, 0x02	; 2
    4b46:	0e 94 12 0a 	call	0x1424	; 0x1424 <_ZN3Led18setColorBrightnessEhh>
    4b4a:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4b4e:	87 7f       	andi	r24, 0xF7	; 247
    4b50:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    4b54:	80 91 74 03 	lds	r24, 0x0374	; 0x800374 <FLAG>
    4b58:	8b 7f       	andi	r24, 0xFB	; 251
    4b5a:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <FLAG>
    4b5e:	72 cd       	rjmp	.-1308   	; 0x4644 <main+0x5e8>
    4b60:	90 91 4b 03 	lds	r25, 0x034B	; 0x80034b <_ZN7ButtonsL12debounce_cntE>
    4b64:	98 30       	cpi	r25, 0x08	; 8
    4b66:	20 f4       	brcc	.+8      	; 0x4b70 <main+0xb14>
    4b68:	9f 5f       	subi	r25, 0xFF	; 255
    4b6a:	90 93 4b 03 	sts	0x034B, r25	; 0x80034b <_ZN7ButtonsL12debounce_cntE>
    4b6e:	bb cf       	rjmp	.-138    	; 0x4ae6 <main+0xa8a>
    4b70:	90 91 0b 01 	lds	r25, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4b74:	90 93 0a 01 	sts	0x010A, r25	; 0x80010a <_ZN7ButtonsL15PREV_STABLE_REGE>
    4b78:	80 93 0b 01 	sts	0x010B, r24	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4b7c:	28 2f       	mov	r18, r24
    4b7e:	29 27       	eor	r18, r25
    4b80:	2c 70       	andi	r18, 0x0C	; 12
    4b82:	b1 f1       	breq	.+108    	; 0x4bf0 <main+0xb94>
    4b84:	8c 70       	andi	r24, 0x0C	; 12
    4b86:	9c 70       	andi	r25, 0x0C	; 12
    4b88:	9c 30       	cpi	r25, 0x0C	; 12
    4b8a:	69 f4       	brne	.+26     	; 0x4ba6 <main+0xb4a>
    4b8c:	8c 30       	cpi	r24, 0x0C	; 12
    4b8e:	59 f0       	breq	.+22     	; 0x4ba6 <main+0xb4a>
    4b90:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    4b94:	81 ff       	sbrs	r24, 1
    4b96:	07 c0       	rjmp	.+14     	; 0x4ba6 <main+0xb4a>
    4b98:	8f b7       	in	r24, 0x3f	; 63
    4b9a:	f8 94       	cli
    4b9c:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4ba0:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4ba4:	8f bf       	out	0x3f, r24	; 63
    4ba6:	80 91 4c 03 	lds	r24, 0x034C	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4baa:	90 91 0b 01 	lds	r25, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4bae:	29 2f       	mov	r18, r25
    4bb0:	2c 70       	andi	r18, 0x0C	; 12
    4bb2:	80 ff       	sbrs	r24, 0
    4bb4:	45 c0       	rjmp	.+138    	; 0x4c40 <main+0xbe4>
    4bb6:	2c 30       	cpi	r18, 0x0C	; 12
    4bb8:	89 f4       	brne	.+34     	; 0x4bdc <main+0xb80>
    4bba:	82 fd       	sbrc	r24, 2
    4bbc:	0f c0       	rjmp	.+30     	; 0x4bdc <main+0xb80>
    4bbe:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    4bc2:	81 fd       	sbrc	r24, 1
    4bc4:	26 c0       	rjmp	.+76     	; 0x4c12 <main+0xbb6>
    4bc6:	80 91 47 03 	lds	r24, 0x0347	; 0x800347 <_ZN5ViewsL18_is_any_view_shownE>
    4bca:	88 23       	and	r24, r24
    4bcc:	e9 f0       	breq	.+58     	; 0x4c08 <main+0xbac>
    4bce:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <_ZN5ViewsL16_last_view_indexE>
    4bd2:	8f 5f       	subi	r24, 0xFF	; 255
    4bd4:	82 30       	cpi	r24, 0x02	; 2
    4bd6:	d0 f4       	brcc	.+52     	; 0x4c0c <main+0xbb0>
    4bd8:	0e 94 bc 0a 	call	0x1578	; 0x1578 <_ZN5Views8showViewEa.part.4>
    4bdc:	80 91 4c 03 	lds	r24, 0x034C	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4be0:	90 91 0b 01 	lds	r25, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4be4:	9c 70       	andi	r25, 0x0C	; 12
    4be6:	9c 30       	cpi	r25, 0x0C	; 12
    4be8:	19 f4       	brne	.+6      	; 0x4bf0 <main+0xb94>
    4bea:	88 7f       	andi	r24, 0xF8	; 248
    4bec:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4bf0:	10 92 4b 03 	sts	0x034B, r1	; 0x80034b <_ZN7ButtonsL12debounce_cntE>
    4bf4:	10 92 4a 03 	sts	0x034A, r1	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4bf8:	10 92 49 03 	sts	0x0349, r1	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4bfc:	80 91 4c 03 	lds	r24, 0x034C	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4c00:	87 7f       	andi	r24, 0xF7	; 247
    4c02:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4c06:	6f cf       	rjmp	.-290    	; 0x4ae6 <main+0xa8a>
    4c08:	8f ef       	ldi	r24, 0xFF	; 255
    4c0a:	e3 cf       	rjmp	.-58     	; 0x4bd2 <main+0xb76>
    4c0c:	0e 94 21 0b 	call	0x1642	; 0x1642 <_ZN5Views9hideViewsEv>
    4c10:	e5 cf       	rjmp	.-54     	; 0x4bdc <main+0xb80>
    4c12:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4c16:	0e 94 3e 13 	call	0x267c	; 0x267c <_ZN6Config11saveForPageEh>
    4c1a:	8f b7       	in	r24, 0x3f	; 63
    4c1c:	f8 94       	cli
    4c1e:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4c22:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4c26:	8f bf       	out	0x3f, r24	; 63
    4c28:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4c2c:	8f 5f       	subi	r24, 0xFF	; 255
    4c2e:	80 93 4d 03 	sts	0x034D, r24	; 0x80034d <_ZL14cur_page_index>
    4c32:	0e 94 cc 12 	call	0x2598	; 0x2598 <_ZN6Config11loadForPageEh>
    4c36:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4c3a:	0e 94 39 0b 	call	0x1672	; 0x1672 <_ZL11displayPageh>
    4c3e:	ce cf       	rjmp	.-100    	; 0x4bdc <main+0xb80>
    4c40:	21 11       	cpse	r18, r1
    4c42:	04 c0       	rjmp	.+8      	; 0x4c4c <main+0xbf0>
    4c44:	81 60       	ori	r24, 0x01	; 1
    4c46:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4c4a:	c8 cf       	rjmp	.-112    	; 0x4bdc <main+0xb80>
    4c4c:	81 fd       	sbrc	r24, 1
    4c4e:	c6 cf       	rjmp	.-116    	; 0x4bdc <main+0xb80>
    4c50:	93 ff       	sbrs	r25, 3
    4c52:	07 c0       	rjmp	.+14     	; 0x4c62 <main+0xc06>
    4c54:	80 91 0a 01 	lds	r24, 0x010A	; 0x80010a <_ZN7ButtonsL15PREV_STABLE_REGE>
    4c58:	83 fd       	sbrc	r24, 3
    4c5a:	03 c0       	rjmp	.+6      	; 0x4c62 <main+0xc06>
    4c5c:	0e 94 93 12 	call	0x2526	; 0x2526 <_Z20onLeftButtonReleasedv>
    4c60:	bd cf       	rjmp	.-134    	; 0x4bdc <main+0xb80>
    4c62:	92 ff       	sbrs	r25, 2
    4c64:	bb cf       	rjmp	.-138    	; 0x4bdc <main+0xb80>
    4c66:	80 91 0a 01 	lds	r24, 0x010A	; 0x80010a <_ZN7ButtonsL15PREV_STABLE_REGE>
    4c6a:	82 fd       	sbrc	r24, 2
    4c6c:	b7 cf       	rjmp	.-146    	; 0x4bdc <main+0xb80>
    4c6e:	0e 94 62 0c 	call	0x18c4	; 0x18c4 <_Z21onRightButtonReleasedv>
    4c72:	b4 cf       	rjmp	.-152    	; 0x4bdc <main+0xb80>
    4c74:	90 91 0b 01 	lds	r25, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4c78:	49 2f       	mov	r20, r25
    4c7a:	4c 70       	andi	r20, 0x0C	; 12
    4c7c:	4c 30       	cpi	r20, 0x0C	; 12
    4c7e:	a1 f1       	breq	.+104    	; 0x4ce8 <main+0xc8c>
    4c80:	20 91 49 03 	lds	r18, 0x0349	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4c84:	30 91 4a 03 	lds	r19, 0x034A	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4c88:	24 3f       	cpi	r18, 0xF4	; 244
    4c8a:	e1 e0       	ldi	r30, 0x01	; 1
    4c8c:	3e 07       	cpc	r19, r30
    4c8e:	c0 f4       	brcc	.+48     	; 0x4cc0 <main+0xc64>
    4c90:	2f 5f       	subi	r18, 0xFF	; 255
    4c92:	3f 4f       	sbci	r19, 0xFF	; 255
    4c94:	30 93 4a 03 	sts	0x034A, r19	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4c98:	20 93 49 03 	sts	0x0349, r18	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4c9c:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <_ZN7ButtonsL10STABLE_REGE>
    4ca0:	81 27       	eor	r24, r17
    4ca2:	8c 70       	andi	r24, 0x0C	; 12
    4ca4:	09 f4       	brne	.+2      	; 0x4ca8 <main+0xc4c>
    4ca6:	1f cf       	rjmp	.-450    	; 0x4ae6 <main+0xa8a>
    4ca8:	10 92 4b 03 	sts	0x034B, r1	; 0x80034b <_ZN7ButtonsL12debounce_cntE>
    4cac:	10 92 4a 03 	sts	0x034A, r1	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4cb0:	10 92 49 03 	sts	0x0349, r1	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4cb4:	10 93 0c 01 	sts	0x010C, r17	; 0x80010c <_ZN7ButtonsL8TEMP_REGE>
    4cb8:	80 91 4c 03 	lds	r24, 0x034C	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4cbc:	88 60       	ori	r24, 0x08	; 8
    4cbe:	a1 cf       	rjmp	.-190    	; 0x4c02 <main+0xba6>
    4cc0:	41 11       	cpse	r20, r1
    4cc2:	2f c0       	rjmp	.+94     	; 0x4d22 <main+0xcc6>
    4cc4:	82 fd       	sbrc	r24, 2
    4cc6:	10 c0       	rjmp	.+32     	; 0x4ce8 <main+0xc8c>
    4cc8:	84 60       	ori	r24, 0x04	; 4
    4cca:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4cce:	8f b7       	in	r24, 0x3f	; 63
    4cd0:	f8 94       	cli
    4cd2:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4cd6:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4cda:	8f bf       	out	0x3f, r24	; 63
    4cdc:	80 91 4e 03 	lds	r24, 0x034E	; 0x80034e <MODE>
    4ce0:	81 ff       	sbrs	r24, 1
    4ce2:	07 c0       	rjmp	.+14     	; 0x4cf2 <main+0xc96>
    4ce4:	0e 94 4d 13 	call	0x269a	; 0x269a <_Z12exitEditModev>
    4ce8:	10 92 4a 03 	sts	0x034A, r1	; 0x80034a <_ZN7ButtonsL14long_press_cntE+0x1>
    4cec:	10 92 49 03 	sts	0x0349, r1	; 0x800349 <_ZN7ButtonsL14long_press_cntE>
    4cf0:	d5 cf       	rjmp	.-86     	; 0x4c9c <main+0xc40>
    4cf2:	90 91 4d 03 	lds	r25, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4cf6:	98 30       	cpi	r25, 0x08	; 8
    4cf8:	a8 f7       	brcc	.-22     	; 0x4ce4 <main+0xc88>
    4cfa:	82 60       	ori	r24, 0x02	; 2
    4cfc:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <MODE>
    4d00:	8f b7       	in	r24, 0x3f	; 63
    4d02:	f8 94       	cli
    4d04:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4d08:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4d0c:	8f bf       	out	0x3f, r24	; 63
    4d0e:	10 92 4d 03 	sts	0x034D, r1	; 0x80034d <_ZL14cur_page_index>
    4d12:	80 e0       	ldi	r24, 0x00	; 0
    4d14:	0e 94 cc 12 	call	0x2598	; 0x2598 <_ZN6Config11loadForPageEh>
    4d18:	80 91 4d 03 	lds	r24, 0x034D	; 0x80034d <_ZL14cur_page_index>
    4d1c:	0e 94 39 0b 	call	0x1672	; 0x1672 <_ZL11displayPageh>
    4d20:	e3 cf       	rjmp	.-58     	; 0x4ce8 <main+0xc8c>
    4d22:	80 fd       	sbrc	r24, 0
    4d24:	e1 cf       	rjmp	.-62     	; 0x4ce8 <main+0xc8c>
    4d26:	92 fd       	sbrc	r25, 2
    4d28:	0d c0       	rjmp	.+26     	; 0x4d44 <main+0xce8>
    4d2a:	82 60       	ori	r24, 0x02	; 2
    4d2c:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4d30:	8f b7       	in	r24, 0x3f	; 63
    4d32:	f8 94       	cli
    4d34:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4d38:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4d3c:	8f bf       	out	0x3f, r24	; 63
    4d3e:	0e 94 62 0c 	call	0x18c4	; 0x18c4 <_Z21onRightButtonReleasedv>
    4d42:	d2 cf       	rjmp	.-92     	; 0x4ce8 <main+0xc8c>
    4d44:	93 fd       	sbrc	r25, 3
    4d46:	d0 cf       	rjmp	.-96     	; 0x4ce8 <main+0xc8c>
    4d48:	82 60       	ori	r24, 0x02	; 2
    4d4a:	80 93 4c 03 	sts	0x034C, r24	; 0x80034c <_ZN7ButtonsL9STATE_REGE>
    4d4e:	8f b7       	in	r24, 0x3f	; 63
    4d50:	f8 94       	cli
    4d52:	10 92 52 03 	sts	0x0352, r1	; 0x800352 <timer_counter+0x1>
    4d56:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <timer_counter>
    4d5a:	8f bf       	out	0x3f, r24	; 63
    4d5c:	0e 94 93 12 	call	0x2526	; 0x2526 <_Z20onLeftButtonReleasedv>
    4d60:	c3 cf       	rjmp	.-122    	; 0x4ce8 <main+0xc8c>
    4d62:	80 e0       	ldi	r24, 0x00	; 0
    4d64:	0e 94 60 0a 	call	0x14c0	; 0x14c0 <_ZN3Led13setBrightnessEh>
    4d68:	f0 ce       	rjmp	.-544    	; 0x4b4a <main+0xaee>
    4d6a:	8a 30       	cpi	r24, 0x0A	; 10
    4d6c:	08 f4       	brcc	.+2      	; 0x4d70 <main+0xd14>
    4d6e:	37 cd       	rjmp	.-1426   	; 0x47de <main+0x782>
    4d70:	10 92 41 03 	sts	0x0341, r1	; 0x800341 <_ZN5ViewsL18_view_iter_counterE>
    4d74:	de cc       	rjmp	.-1604   	; 0x4732 <main+0x6d6>

00004d76 <eeprom_read_byte>:
    4d76:	f9 99       	sbic	0x1f, 1	; 31
    4d78:	fe cf       	rjmp	.-4      	; 0x4d76 <eeprom_read_byte>
    4d7a:	92 bd       	out	0x22, r25	; 34
    4d7c:	81 bd       	out	0x21, r24	; 33
    4d7e:	f8 9a       	sbi	0x1f, 0	; 31
    4d80:	99 27       	eor	r25, r25
    4d82:	80 b5       	in	r24, 0x20	; 32
    4d84:	08 95       	ret

00004d86 <eeprom_write_byte>:
    4d86:	26 2f       	mov	r18, r22

00004d88 <eeprom_write_r18>:
    4d88:	f9 99       	sbic	0x1f, 1	; 31
    4d8a:	fe cf       	rjmp	.-4      	; 0x4d88 <eeprom_write_r18>
    4d8c:	1f ba       	out	0x1f, r1	; 31
    4d8e:	92 bd       	out	0x22, r25	; 34
    4d90:	81 bd       	out	0x21, r24	; 33
    4d92:	20 bd       	out	0x20, r18	; 32
    4d94:	0f b6       	in	r0, 0x3f	; 63
    4d96:	f8 94       	cli
    4d98:	fa 9a       	sbi	0x1f, 2	; 31
    4d9a:	f9 9a       	sbi	0x1f, 1	; 31
    4d9c:	0f be       	out	0x3f, r0	; 63
    4d9e:	01 96       	adiw	r24, 0x01	; 1
    4da0:	08 95       	ret

00004da2 <__udivmodqi4>:
    4da2:	99 1b       	sub	r25, r25
    4da4:	79 e0       	ldi	r23, 0x09	; 9
    4da6:	04 c0       	rjmp	.+8      	; 0x4db0 <__udivmodqi4_ep>

00004da8 <__udivmodqi4_loop>:
    4da8:	99 1f       	adc	r25, r25
    4daa:	96 17       	cp	r25, r22
    4dac:	08 f0       	brcs	.+2      	; 0x4db0 <__udivmodqi4_ep>
    4dae:	96 1b       	sub	r25, r22

00004db0 <__udivmodqi4_ep>:
    4db0:	88 1f       	adc	r24, r24
    4db2:	7a 95       	dec	r23
    4db4:	c9 f7       	brne	.-14     	; 0x4da8 <__udivmodqi4_loop>
    4db6:	80 95       	com	r24
    4db8:	08 95       	ret

00004dba <__divmodqi4>:
    4dba:	87 fb       	bst	r24, 7
    4dbc:	08 2e       	mov	r0, r24
    4dbe:	06 26       	eor	r0, r22
    4dc0:	87 fd       	sbrc	r24, 7
    4dc2:	81 95       	neg	r24
    4dc4:	67 fd       	sbrc	r22, 7
    4dc6:	61 95       	neg	r22
    4dc8:	ec df       	rcall	.-40     	; 0x4da2 <__udivmodqi4>
    4dca:	0e f4       	brtc	.+2      	; 0x4dce <__divmodqi4_1>
    4dcc:	91 95       	neg	r25

00004dce <__divmodqi4_1>:
    4dce:	07 fc       	sbrc	r0, 7
    4dd0:	81 95       	neg	r24

00004dd2 <__divmodqi4_exit>:
    4dd2:	08 95       	ret

00004dd4 <__udivmodhi4>:
    4dd4:	aa 1b       	sub	r26, r26
    4dd6:	bb 1b       	sub	r27, r27
    4dd8:	51 e1       	ldi	r21, 0x11	; 17
    4dda:	07 c0       	rjmp	.+14     	; 0x4dea <__udivmodhi4_ep>

00004ddc <__udivmodhi4_loop>:
    4ddc:	aa 1f       	adc	r26, r26
    4dde:	bb 1f       	adc	r27, r27
    4de0:	a6 17       	cp	r26, r22
    4de2:	b7 07       	cpc	r27, r23
    4de4:	10 f0       	brcs	.+4      	; 0x4dea <__udivmodhi4_ep>
    4de6:	a6 1b       	sub	r26, r22
    4de8:	b7 0b       	sbc	r27, r23

00004dea <__udivmodhi4_ep>:
    4dea:	88 1f       	adc	r24, r24
    4dec:	99 1f       	adc	r25, r25
    4dee:	5a 95       	dec	r21
    4df0:	a9 f7       	brne	.-22     	; 0x4ddc <__udivmodhi4_loop>
    4df2:	80 95       	com	r24
    4df4:	90 95       	com	r25
    4df6:	bc 01       	movw	r22, r24
    4df8:	cd 01       	movw	r24, r26
    4dfa:	08 95       	ret

00004dfc <__divmodhi4>:
    4dfc:	97 fb       	bst	r25, 7
    4dfe:	07 2e       	mov	r0, r23
    4e00:	16 f4       	brtc	.+4      	; 0x4e06 <__divmodhi4+0xa>
    4e02:	00 94       	com	r0
    4e04:	06 d0       	rcall	.+12     	; 0x4e12 <__divmodhi4_neg1>
    4e06:	77 fd       	sbrc	r23, 7
    4e08:	08 d0       	rcall	.+16     	; 0x4e1a <__divmodhi4_neg2>
    4e0a:	e4 df       	rcall	.-56     	; 0x4dd4 <__udivmodhi4>
    4e0c:	07 fc       	sbrc	r0, 7
    4e0e:	05 d0       	rcall	.+10     	; 0x4e1a <__divmodhi4_neg2>
    4e10:	3e f4       	brtc	.+14     	; 0x4e20 <__divmodhi4_exit>

00004e12 <__divmodhi4_neg1>:
    4e12:	90 95       	com	r25
    4e14:	81 95       	neg	r24
    4e16:	9f 4f       	sbci	r25, 0xFF	; 255
    4e18:	08 95       	ret

00004e1a <__divmodhi4_neg2>:
    4e1a:	70 95       	com	r23
    4e1c:	61 95       	neg	r22
    4e1e:	7f 4f       	sbci	r23, 0xFF	; 255

00004e20 <__divmodhi4_exit>:
    4e20:	08 95       	ret

00004e22 <__divmodsi4>:
    4e22:	05 2e       	mov	r0, r21
    4e24:	97 fb       	bst	r25, 7
    4e26:	16 f4       	brtc	.+4      	; 0x4e2c <__divmodsi4+0xa>
    4e28:	00 94       	com	r0
    4e2a:	0f d0       	rcall	.+30     	; 0x4e4a <__negsi2>
    4e2c:	57 fd       	sbrc	r21, 7
    4e2e:	05 d0       	rcall	.+10     	; 0x4e3a <__divmodsi4_neg2>
    4e30:	4d d0       	rcall	.+154    	; 0x4ecc <__udivmodsi4>
    4e32:	07 fc       	sbrc	r0, 7
    4e34:	02 d0       	rcall	.+4      	; 0x4e3a <__divmodsi4_neg2>
    4e36:	46 f4       	brtc	.+16     	; 0x4e48 <__divmodsi4_exit>
    4e38:	08 c0       	rjmp	.+16     	; 0x4e4a <__negsi2>

00004e3a <__divmodsi4_neg2>:
    4e3a:	50 95       	com	r21
    4e3c:	40 95       	com	r20
    4e3e:	30 95       	com	r19
    4e40:	21 95       	neg	r18
    4e42:	3f 4f       	sbci	r19, 0xFF	; 255
    4e44:	4f 4f       	sbci	r20, 0xFF	; 255
    4e46:	5f 4f       	sbci	r21, 0xFF	; 255

00004e48 <__divmodsi4_exit>:
    4e48:	08 95       	ret

00004e4a <__negsi2>:
    4e4a:	90 95       	com	r25
    4e4c:	80 95       	com	r24
    4e4e:	70 95       	com	r23
    4e50:	61 95       	neg	r22
    4e52:	7f 4f       	sbci	r23, 0xFF	; 255
    4e54:	8f 4f       	sbci	r24, 0xFF	; 255
    4e56:	9f 4f       	sbci	r25, 0xFF	; 255
    4e58:	08 95       	ret

00004e5a <__tablejump2__>:
    4e5a:	ee 0f       	add	r30, r30
    4e5c:	ff 1f       	adc	r31, r31
    4e5e:	05 90       	lpm	r0, Z+
    4e60:	f4 91       	lpm	r31, Z
    4e62:	e0 2d       	mov	r30, r0
    4e64:	09 94       	ijmp

00004e66 <__umulhisi3>:
    4e66:	a2 9f       	mul	r26, r18
    4e68:	b0 01       	movw	r22, r0
    4e6a:	b3 9f       	mul	r27, r19
    4e6c:	c0 01       	movw	r24, r0
    4e6e:	a3 9f       	mul	r26, r19
    4e70:	70 0d       	add	r23, r0
    4e72:	81 1d       	adc	r24, r1
    4e74:	11 24       	eor	r1, r1
    4e76:	91 1d       	adc	r25, r1
    4e78:	b2 9f       	mul	r27, r18
    4e7a:	70 0d       	add	r23, r0
    4e7c:	81 1d       	adc	r24, r1
    4e7e:	11 24       	eor	r1, r1
    4e80:	91 1d       	adc	r25, r1
    4e82:	08 95       	ret

00004e84 <__usmulhisi3>:
    4e84:	f0 df       	rcall	.-32     	; 0x4e66 <__umulhisi3>

00004e86 <__usmulhisi3_tail>:
    4e86:	b7 ff       	sbrs	r27, 7
    4e88:	08 95       	ret
    4e8a:	82 1b       	sub	r24, r18
    4e8c:	93 0b       	sbc	r25, r19
    4e8e:	08 95       	ret

00004e90 <__mulshisi3>:
    4e90:	b7 ff       	sbrs	r27, 7
    4e92:	3e c0       	rjmp	.+124    	; 0x4f10 <__muluhisi3>

00004e94 <__mulohisi3>:
    4e94:	3d d0       	rcall	.+122    	; 0x4f10 <__muluhisi3>
    4e96:	82 1b       	sub	r24, r18
    4e98:	93 0b       	sbc	r25, r19
    4e9a:	08 95       	ret

00004e9c <__adddi3_s8>:
    4e9c:	00 24       	eor	r0, r0
    4e9e:	a7 fd       	sbrc	r26, 7
    4ea0:	00 94       	com	r0
    4ea2:	2a 0f       	add	r18, r26
    4ea4:	30 1d       	adc	r19, r0
    4ea6:	40 1d       	adc	r20, r0
    4ea8:	50 1d       	adc	r21, r0
    4eaa:	60 1d       	adc	r22, r0
    4eac:	70 1d       	adc	r23, r0
    4eae:	80 1d       	adc	r24, r0
    4eb0:	90 1d       	adc	r25, r0
    4eb2:	08 95       	ret

00004eb4 <__cmpdi2_s8>:
    4eb4:	00 24       	eor	r0, r0
    4eb6:	a7 fd       	sbrc	r26, 7
    4eb8:	00 94       	com	r0
    4eba:	2a 17       	cp	r18, r26
    4ebc:	30 05       	cpc	r19, r0
    4ebe:	40 05       	cpc	r20, r0
    4ec0:	50 05       	cpc	r21, r0
    4ec2:	60 05       	cpc	r22, r0
    4ec4:	70 05       	cpc	r23, r0
    4ec6:	80 05       	cpc	r24, r0
    4ec8:	90 05       	cpc	r25, r0
    4eca:	08 95       	ret

00004ecc <__udivmodsi4>:
    4ecc:	a1 e2       	ldi	r26, 0x21	; 33
    4ece:	1a 2e       	mov	r1, r26
    4ed0:	aa 1b       	sub	r26, r26
    4ed2:	bb 1b       	sub	r27, r27
    4ed4:	fd 01       	movw	r30, r26
    4ed6:	0d c0       	rjmp	.+26     	; 0x4ef2 <__udivmodsi4_ep>

00004ed8 <__udivmodsi4_loop>:
    4ed8:	aa 1f       	adc	r26, r26
    4eda:	bb 1f       	adc	r27, r27
    4edc:	ee 1f       	adc	r30, r30
    4ede:	ff 1f       	adc	r31, r31
    4ee0:	a2 17       	cp	r26, r18
    4ee2:	b3 07       	cpc	r27, r19
    4ee4:	e4 07       	cpc	r30, r20
    4ee6:	f5 07       	cpc	r31, r21
    4ee8:	20 f0       	brcs	.+8      	; 0x4ef2 <__udivmodsi4_ep>
    4eea:	a2 1b       	sub	r26, r18
    4eec:	b3 0b       	sbc	r27, r19
    4eee:	e4 0b       	sbc	r30, r20
    4ef0:	f5 0b       	sbc	r31, r21

00004ef2 <__udivmodsi4_ep>:
    4ef2:	66 1f       	adc	r22, r22
    4ef4:	77 1f       	adc	r23, r23
    4ef6:	88 1f       	adc	r24, r24
    4ef8:	99 1f       	adc	r25, r25
    4efa:	1a 94       	dec	r1
    4efc:	69 f7       	brne	.-38     	; 0x4ed8 <__udivmodsi4_loop>
    4efe:	60 95       	com	r22
    4f00:	70 95       	com	r23
    4f02:	80 95       	com	r24
    4f04:	90 95       	com	r25
    4f06:	9b 01       	movw	r18, r22
    4f08:	ac 01       	movw	r20, r24
    4f0a:	bd 01       	movw	r22, r26
    4f0c:	cf 01       	movw	r24, r30
    4f0e:	08 95       	ret

00004f10 <__muluhisi3>:
    4f10:	aa df       	rcall	.-172    	; 0x4e66 <__umulhisi3>
    4f12:	a5 9f       	mul	r26, r21
    4f14:	90 0d       	add	r25, r0
    4f16:	b4 9f       	mul	r27, r20
    4f18:	90 0d       	add	r25, r0
    4f1a:	a4 9f       	mul	r26, r20
    4f1c:	80 0d       	add	r24, r0
    4f1e:	91 1d       	adc	r25, r1
    4f20:	11 24       	eor	r1, r1
    4f22:	08 95       	ret

00004f24 <_exit>:
    4f24:	f8 94       	cli

00004f26 <__stop_program>:
    4f26:	ff cf       	rjmp	.-2      	; 0x4f26 <__stop_program>
