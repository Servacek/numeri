
.pio/build/uno_usbasp_dev/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 3b 00 	jmp	0x76	; 0x76 <__ctors_end>
   4:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
   8:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
   c:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  10:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  14:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  18:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  1c:	0c 94 95 01 	jmp	0x32a	; 0x32a <__vector_7>
  20:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  24:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  28:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  2c:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  30:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  34:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  38:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  3c:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  40:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  44:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  48:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  4c:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  50:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  54:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  58:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  5c:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  60:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>
  64:	0c 94 58 00 	jmp	0xb0	; 0xb0 <__bad_interrupt>

00000068 <__trampolines_end>:
  68:	7b 60       	ori	r23, 0x0B	; 11
  6a:	57 76       	andi	r21, 0x67	; 103
  6c:	6c 3e       	cpi	r22, 0xEC	; 236
  6e:	3f 70       	andi	r19, 0x0F	; 15
  70:	7f 7e       	andi	r23, 0xEF	; 239
  72:	5c 04       	cpc	r5, r12
  74:	1b 00       	.word	0x001b	; ????

00000076 <__ctors_end>:
  76:	11 24       	eor	r1, r1
  78:	1f be       	out	0x3f, r1	; 63
  7a:	cf ef       	ldi	r28, 0xFF	; 255
  7c:	d8 e0       	ldi	r29, 0x08	; 8
  7e:	de bf       	out	0x3e, r29	; 62
  80:	cd bf       	out	0x3d, r28	; 61

00000082 <__do_copy_data>:
  82:	11 e0       	ldi	r17, 0x01	; 1
  84:	a0 e0       	ldi	r26, 0x00	; 0
  86:	b1 e0       	ldi	r27, 0x01	; 1
  88:	e4 e5       	ldi	r30, 0x54	; 84
  8a:	fb e0       	ldi	r31, 0x0B	; 11
  8c:	02 c0       	rjmp	.+4      	; 0x92 <__do_copy_data+0x10>
  8e:	05 90       	lpm	r0, Z+
  90:	0d 92       	st	X+, r0
  92:	aa 30       	cpi	r26, 0x0A	; 10
  94:	b1 07       	cpc	r27, r17
  96:	d9 f7       	brne	.-10     	; 0x8e <__do_copy_data+0xc>

00000098 <__do_clear_bss>:
  98:	21 e0       	ldi	r18, 0x01	; 1
  9a:	aa e0       	ldi	r26, 0x0A	; 10
  9c:	b1 e0       	ldi	r27, 0x01	; 1
  9e:	01 c0       	rjmp	.+2      	; 0xa2 <.do_clear_bss_start>

000000a0 <.do_clear_bss_loop>:
  a0:	1d 92       	st	X+, r1

000000a2 <.do_clear_bss_start>:
  a2:	aa 32       	cpi	r26, 0x2A	; 42
  a4:	b2 07       	cpc	r27, r18
  a6:	e1 f7       	brne	.-8      	; 0xa0 <.do_clear_bss_loop>
  a8:	0e 94 5a 02 	call	0x4b4	; 0x4b4 <main>
  ac:	0c 94 a8 05 	jmp	0xb50	; 0xb50 <_exit>

000000b0 <__bad_interrupt>:
  b0:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000b4 <_Z20putDigitsToInputRegsPhh.constprop.4>:
  b4:	5f 98       	cbi	0x0b, 7	; 11
  b6:	28 98       	cbi	0x05, 0	; 5
  b8:	fc 01       	movw	r30, r24
  ba:	94 e0       	ldi	r25, 0x04	; 4
  bc:	50 e0       	ldi	r21, 0x00	; 0
  be:	40 e0       	ldi	r20, 0x00	; 0
  c0:	20 81       	ld	r18, Z
  c2:	30 e0       	ldi	r19, 0x00	; 0
  c4:	04 2e       	mov	r0, r20
  c6:	02 c0       	rjmp	.+4      	; 0xcc <_Z20putDigitsToInputRegsPhh.constprop.4+0x18>
  c8:	35 95       	asr	r19
  ca:	27 95       	ror	r18
  cc:	0a 94       	dec	r0
  ce:	e2 f7       	brpl	.-8      	; 0xc8 <_Z20putDigitsToInputRegsPhh.constprop.4+0x14>
  d0:	20 ff       	sbrs	r18, 0
  d2:	0d c0       	rjmp	.+26     	; 0xee <_Z20putDigitsToInputRegsPhh.constprop.4+0x3a>
  d4:	2c 9a       	sbi	0x05, 4	; 5
  d6:	28 9a       	sbi	0x05, 0	; 5
  d8:	28 98       	cbi	0x05, 0	; 5
  da:	4f 5f       	subi	r20, 0xFF	; 255
  dc:	5f 4f       	sbci	r21, 0xFF	; 255
  de:	48 30       	cpi	r20, 0x08	; 8
  e0:	51 05       	cpc	r21, r1
  e2:	71 f7       	brne	.-36     	; 0xc0 <_Z20putDigitsToInputRegsPhh.constprop.4+0xc>
  e4:	91 50       	subi	r25, 0x01	; 1
  e6:	31 96       	adiw	r30, 0x01	; 1
  e8:	91 11       	cpse	r25, r1
  ea:	e8 cf       	rjmp	.-48     	; 0xbc <_Z20putDigitsToInputRegsPhh.constprop.4+0x8>
  ec:	08 95       	ret
  ee:	2c 98       	cbi	0x05, 4	; 5
  f0:	f2 cf       	rjmp	.-28     	; 0xd6 <_Z20putDigitsToInputRegsPhh.constprop.4+0x22>

000000f2 <_Z16getTimeInMinutesv>:
  f2:	80 91 0c 01 	lds	r24, 0x010C	; 0x80010c <minutes_count>
  f6:	90 91 0d 01 	lds	r25, 0x010D	; 0x80010d <minutes_count+0x1>
  fa:	01 96       	adiw	r24, 0x01	; 1
  fc:	90 93 0d 01 	sts	0x010D, r25	; 0x80010d <minutes_count+0x1>
 100:	80 93 0c 01 	sts	0x010C, r24	; 0x80010c <minutes_count>
 104:	80 91 0c 01 	lds	r24, 0x010C	; 0x80010c <minutes_count>
 108:	90 91 0d 01 	lds	r25, 0x010D	; 0x80010d <minutes_count+0x1>
 10c:	80 3a       	cpi	r24, 0xA0	; 160
 10e:	95 40       	sbci	r25, 0x05	; 5
 110:	20 f0       	brcs	.+8      	; 0x11a <_Z16getTimeInMinutesv+0x28>
 112:	10 92 0d 01 	sts	0x010D, r1	; 0x80010d <minutes_count+0x1>
 116:	10 92 0c 01 	sts	0x010C, r1	; 0x80010c <minutes_count>
 11a:	80 91 0c 01 	lds	r24, 0x010C	; 0x80010c <minutes_count>
 11e:	90 91 0d 01 	lds	r25, 0x010D	; 0x80010d <minutes_count+0x1>
 122:	08 95       	ret

00000124 <_Z13setBrightnessh>:
 124:	82 31       	cpi	r24, 0x12	; 18
 126:	08 f0       	brcs	.+2      	; 0x12a <_Z13setBrightnessh+0x6>
 128:	81 e1       	ldi	r24, 0x11	; 17
 12a:	90 91 17 01 	lds	r25, 0x0117	; 0x800117 <_target_brightness>
 12e:	98 13       	cpse	r25, r24
 130:	80 93 17 01 	sts	0x0117, r24	; 0x800117 <_target_brightness>
 134:	08 95       	ret

00000136 <_Z15stopDiagnosticsv>:
 136:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 13a:	8b 7f       	andi	r24, 0xFB	; 251
 13c:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 140:	80 91 01 01 	lds	r24, 0x0101	; 0x800101 <configured_brightness>
 144:	0c 94 92 00 	jmp	0x124	; 0x124 <_Z13setBrightnessh>

00000148 <_Z10showDigitsv>:
 148:	85 e2       	ldi	r24, 0x25	; 37
 14a:	91 e0       	ldi	r25, 0x01	; 1
 14c:	0e 94 5a 00 	call	0xb4	; 0xb4 <_Z20putDigitsToInputRegsPhh.constprop.4>
 150:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 154:	82 60       	ori	r24, 0x02	; 2
 156:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 15a:	08 95       	ret

0000015c <_Z18setNumitronSegmenthhb.constprop.2>:
 15c:	90 91 29 01 	lds	r25, 0x0129	; 0x800129 <MODE>
 160:	92 fd       	sbrc	r25, 2
 162:	12 c0       	rjmp	.+36     	; 0x188 <_Z18setNumitronSegmenthhb.constprop.2+0x2c>
 164:	28 2f       	mov	r18, r24
 166:	30 e0       	ldi	r19, 0x00	; 0
 168:	f9 01       	movw	r30, r18
 16a:	eb 5d       	subi	r30, 0xDB	; 219
 16c:	fe 4f       	sbci	r31, 0xFE	; 254
 16e:	90 81       	ld	r25, Z
 170:	2f 5d       	subi	r18, 0xDF	; 223
 172:	3e 4f       	sbci	r19, 0xFE	; 254
 174:	d9 01       	movw	r26, r18
 176:	9c 93       	st	X, r25
 178:	66 23       	and	r22, r22
 17a:	21 f0       	breq	.+8      	; 0x184 <_Z18setNumitronSegmenthhb.constprop.2+0x28>
 17c:	90 68       	ori	r25, 0x80	; 128
 17e:	90 83       	st	Z, r25
 180:	0c 94 a4 00 	jmp	0x148	; 0x148 <_Z10showDigitsv>
 184:	9f 77       	andi	r25, 0x7F	; 127
 186:	fb cf       	rjmp	.-10     	; 0x17e <_Z18setNumitronSegmenthhb.constprop.2+0x22>
 188:	08 95       	ret

0000018a <_Z22setSymbolRawOnNumitronhh.constprop.0>:
 18a:	90 e0       	ldi	r25, 0x00	; 0
 18c:	fc 01       	movw	r30, r24
 18e:	eb 5d       	subi	r30, 0xDB	; 219
 190:	fe 4f       	sbci	r31, 0xFE	; 254
 192:	20 81       	ld	r18, Z
 194:	2f 3f       	cpi	r18, 0xFF	; 255
 196:	41 f0       	breq	.+16     	; 0x1a8 <_Z22setSymbolRawOnNumitronhh.constprop.0+0x1e>
 198:	8f 5d       	subi	r24, 0xDF	; 223
 19a:	9e 4f       	sbci	r25, 0xFE	; 254
 19c:	dc 01       	movw	r26, r24
 19e:	2c 93       	st	X, r18
 1a0:	8f ef       	ldi	r24, 0xFF	; 255
 1a2:	80 83       	st	Z, r24
 1a4:	0c 94 a4 00 	jmp	0x148	; 0x148 <_Z10showDigitsv>
 1a8:	08 95       	ret

000001aa <_ZL11getEEConfigh>:
 1aa:	e8 2f       	mov	r30, r24
 1ac:	f0 e0       	ldi	r31, 0x00	; 0
 1ae:	eb 5e       	subi	r30, 0xEB	; 235
 1b0:	fe 4f       	sbci	r31, 0xFE	; 254
 1b2:	80 81       	ld	r24, Z
 1b4:	87 fd       	sbrc	r24, 7
 1b6:	02 c0       	rjmp	.+4      	; 0x1bc <_ZL11getEEConfigh+0x12>
 1b8:	80 68       	ori	r24, 0x80	; 128
 1ba:	80 83       	st	Z, r24
 1bc:	80 81       	ld	r24, Z
 1be:	8f 77       	andi	r24, 0x7F	; 127
 1c0:	08 95       	ret

000001c2 <_Z11displayTimej.part.2>:
 1c2:	af 92       	push	r10
 1c4:	bf 92       	push	r11
 1c6:	cf 92       	push	r12
 1c8:	df 92       	push	r13
 1ca:	ef 92       	push	r14
 1cc:	ff 92       	push	r15
 1ce:	0f 93       	push	r16
 1d0:	1f 93       	push	r17
 1d2:	cf 93       	push	r28
 1d4:	df 93       	push	r29
 1d6:	6c e3       	ldi	r22, 0x3C	; 60
 1d8:	70 e0       	ldi	r23, 0x00	; 0
 1da:	0e 94 56 04 	call	0x8ac	; 0x8ac <__udivmodhi4>
 1de:	95 e2       	ldi	r25, 0x25	; 37
 1e0:	e9 2e       	mov	r14, r25
 1e2:	91 e0       	ldi	r25, 0x01	; 1
 1e4:	f9 2e       	mov	r15, r25
 1e6:	01 e2       	ldi	r16, 0x21	; 33
 1e8:	11 e0       	ldi	r17, 0x01	; 1
 1ea:	d0 e0       	ldi	r29, 0x00	; 0
 1ec:	d1 2c       	mov	r13, r1
 1ee:	c8 2e       	mov	r12, r24
 1f0:	b6 2e       	mov	r11, r22
 1f2:	2a e0       	ldi	r18, 0x0A	; 10
 1f4:	a2 2e       	mov	r10, r18
 1f6:	81 e0       	ldi	r24, 0x01	; 1
 1f8:	cb 2d       	mov	r28, r11
 1fa:	8d 15       	cp	r24, r13
 1fc:	08 f4       	brcc	.+2      	; 0x200 <_Z11displayTimej.part.2+0x3e>
 1fe:	cc 2d       	mov	r28, r12
 200:	83 e0       	ldi	r24, 0x03	; 3
 202:	0e 94 d5 00 	call	0x1aa	; 0x1aa <_ZL11getEEConfigh>
 206:	80 ff       	sbrs	r24, 0
 208:	05 c0       	rjmp	.+10     	; 0x214 <_Z11displayTimej.part.2+0x52>
 20a:	cc 23       	and	r28, r28
 20c:	79 f1       	breq	.+94     	; 0x26c <_Z11displayTimej.part.2+0xaa>
 20e:	cd 30       	cpi	r28, 0x0D	; 13
 210:	08 f0       	brcs	.+2      	; 0x214 <_Z11displayTimej.part.2+0x52>
 212:	cc 50       	subi	r28, 0x0C	; 12
 214:	8c 2f       	mov	r24, r28
 216:	6a 2d       	mov	r22, r10
 218:	0e 94 4a 04 	call	0x894	; 0x894 <__udivmodqi4>
 21c:	d0 fe       	sbrs	r13, 0
 21e:	28 c0       	rjmp	.+80     	; 0x270 <_Z11displayTimej.part.2+0xae>
 220:	e9 2f       	mov	r30, r25
 222:	f0 e0       	ldi	r31, 0x00	; 0
 224:	e8 59       	subi	r30, 0x98	; 152
 226:	ff 4f       	sbci	r31, 0xFF	; 255
 228:	e4 91       	lpm	r30, Z
 22a:	d7 01       	movw	r26, r14
 22c:	9d 91       	ld	r25, X+
 22e:	7d 01       	movw	r14, r26
 230:	e9 17       	cp	r30, r25
 232:	41 f0       	breq	.+16     	; 0x244 <_Z11displayTimej.part.2+0x82>
 234:	d8 01       	movw	r26, r16
 236:	9c 93       	st	X, r25
 238:	d7 01       	movw	r26, r14
 23a:	11 97       	sbiw	r26, 0x01	; 1
 23c:	ec 93       	st	X, r30
 23e:	dd 20       	and	r13, r13
 240:	c9 f0       	breq	.+50     	; 0x274 <_Z11displayTimej.part.2+0xb2>
 242:	d1 e0       	ldi	r29, 0x01	; 1
 244:	d3 94       	inc	r13
 246:	0f 5f       	subi	r16, 0xFF	; 255
 248:	1f 4f       	sbci	r17, 0xFF	; 255
 24a:	b4 e0       	ldi	r27, 0x04	; 4
 24c:	db 12       	cpse	r13, r27
 24e:	d3 cf       	rjmp	.-90     	; 0x1f6 <_Z11displayTimej.part.2+0x34>
 250:	dd 23       	and	r29, r29
 252:	d1 f0       	breq	.+52     	; 0x288 <_Z11displayTimej.part.2+0xc6>
 254:	df 91       	pop	r29
 256:	cf 91       	pop	r28
 258:	1f 91       	pop	r17
 25a:	0f 91       	pop	r16
 25c:	ff 90       	pop	r15
 25e:	ef 90       	pop	r14
 260:	df 90       	pop	r13
 262:	cf 90       	pop	r12
 264:	bf 90       	pop	r11
 266:	af 90       	pop	r10
 268:	0c 94 a4 00 	jmp	0x148	; 0x148 <_Z10showDigitsv>
 26c:	cc e0       	ldi	r28, 0x0C	; 12
 26e:	d2 cf       	rjmp	.-92     	; 0x214 <_Z11displayTimej.part.2+0x52>
 270:	98 2f       	mov	r25, r24
 272:	d6 cf       	rjmp	.-84     	; 0x220 <_Z11displayTimej.part.2+0x5e>
 274:	ca 30       	cpi	r28, 0x0A	; 10
 276:	28 f7       	brcc	.-54     	; 0x242 <_Z11displayTimej.part.2+0x80>
 278:	83 e0       	ldi	r24, 0x03	; 3
 27a:	0e 94 d5 00 	call	0x1aa	; 0x1aa <_ZL11getEEConfigh>
 27e:	81 fd       	sbrc	r24, 1
 280:	e0 cf       	rjmp	.-64     	; 0x242 <_Z11displayTimej.part.2+0x80>
 282:	10 92 25 01 	sts	0x0125, r1	; 0x800125 <DIGITS>
 286:	dd cf       	rjmp	.-70     	; 0x242 <_Z11displayTimej.part.2+0x80>
 288:	df 91       	pop	r29
 28a:	cf 91       	pop	r28
 28c:	1f 91       	pop	r17
 28e:	0f 91       	pop	r16
 290:	ff 90       	pop	r15
 292:	ef 90       	pop	r14
 294:	df 90       	pop	r13
 296:	cf 90       	pop	r12
 298:	bf 90       	pop	r11
 29a:	af 90       	pop	r10
 29c:	08 95       	ret

0000029e <_Z16configBrightnessh>:
 29e:	cf 93       	push	r28
 2a0:	80 93 01 01 	sts	0x0101, r24	; 0x800101 <configured_brightness>
 2a4:	80 91 01 01 	lds	r24, 0x0101	; 0x800101 <configured_brightness>
 2a8:	0e 94 92 00 	call	0x124	; 0x124 <_Z13setBrightnessh>
 2ac:	c0 91 01 01 	lds	r28, 0x0101	; 0x800101 <configured_brightness>
 2b0:	82 e0       	ldi	r24, 0x02	; 2
 2b2:	0e 94 d5 00 	call	0x1aa	; 0x1aa <_ZL11getEEConfigh>
 2b6:	c8 17       	cp	r28, r24
 2b8:	19 f0       	breq	.+6      	; 0x2c0 <_Z16configBrightnessh+0x22>
 2ba:	c0 68       	ori	r28, 0x80	; 128
 2bc:	c0 93 17 01 	sts	0x0117, r28	; 0x800117 <_target_brightness>
 2c0:	cf 91       	pop	r28
 2c2:	08 95       	ret

000002c4 <_Z16startDiagnosticsv>:
 2c4:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 2c8:	84 60       	ori	r24, 0x04	; 4
 2ca:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 2ce:	80 91 17 01 	lds	r24, 0x0117	; 0x800117 <_target_brightness>
 2d2:	0e 94 4f 01 	call	0x29e	; 0x29e <_Z16configBrightnessh>
 2d6:	81 e1       	ldi	r24, 0x11	; 17
 2d8:	0e 94 92 00 	call	0x124	; 0x124 <_Z13setBrightnessh>
 2dc:	80 e0       	ldi	r24, 0x00	; 0
 2de:	0e 94 c5 00 	call	0x18a	; 0x18a <_Z22setSymbolRawOnNumitronhh.constprop.0>
 2e2:	81 e0       	ldi	r24, 0x01	; 1
 2e4:	0e 94 c5 00 	call	0x18a	; 0x18a <_Z22setSymbolRawOnNumitronhh.constprop.0>
 2e8:	82 e0       	ldi	r24, 0x02	; 2
 2ea:	0e 94 c5 00 	call	0x18a	; 0x18a <_Z22setSymbolRawOnNumitronhh.constprop.0>
 2ee:	83 e0       	ldi	r24, 0x03	; 3
 2f0:	0c 94 c5 00 	jmp	0x18a	; 0x18a <_Z22setSymbolRawOnNumitronhh.constprop.0>

000002f4 <_Z16pushToOutputRegsv>:
 2f4:	5f 98       	cbi	0x0b, 7	; 11
 2f6:	00 00       	nop
 2f8:	00 00       	nop
 2fa:	5f 9a       	sbi	0x0b, 7	; 11
 2fc:	08 95       	ret

000002fe <_Z4waitj>:
 2fe:	90 93 12 01 	sts	0x0112, r25	; 0x800112 <ms_ticks+0x1>
 302:	80 93 11 01 	sts	0x0111, r24	; 0x800111 <ms_ticks>
 306:	83 b7       	in	r24, 0x33	; 51
 308:	81 7f       	andi	r24, 0xF1	; 241
 30a:	83 bf       	out	0x33, r24	; 51
 30c:	83 b7       	in	r24, 0x33	; 51
 30e:	81 60       	ori	r24, 0x01	; 1
 310:	83 bf       	out	0x33, r24	; 51
 312:	80 91 11 01 	lds	r24, 0x0111	; 0x800111 <ms_ticks>
 316:	90 91 12 01 	lds	r25, 0x0112	; 0x800112 <ms_ticks+0x1>
 31a:	89 2b       	or	r24, r25
 31c:	11 f0       	breq	.+4      	; 0x322 <_Z4waitj+0x24>
 31e:	88 95       	sleep
 320:	f8 cf       	rjmp	.-16     	; 0x312 <_Z4waitj+0x14>
 322:	83 b7       	in	r24, 0x33	; 51
 324:	8e 7f       	andi	r24, 0xFE	; 254
 326:	83 bf       	out	0x33, r24	; 51
 328:	08 95       	ret
393-
0000032a <__vector_7>:
 32a:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 32e:	81 ff       	sbrs	r24, 1
 330:	09 c0       	rjmp	.+18     	; 0x344 <__vector_7+0x1a>
 332:	80 91 20 01 	lds	r24, 0x0120	; 0x800120 <blink_timer_counter>
 336:	88 3c       	cpi	r24, 0xC8	; 200
 338:	28 f4       	brcc	.+10     	; 0x344 <__vector_7+0x1a>
 33a:	80 91 20 01 	lds	r24, 0x0120	; 0x800120 <blink_timer_counter>
 33e:	8f 5f       	subi	r24, 0xFF	; 255
 340:	80 93 20 01 	sts	0x0120, r24	; 0x800120 <blink_timer_counter>
 344:	80 91 1c 01 	lds	r24, 0x011C	; 0x80011c <LED_B_CNT>
 348:	80 5f       	subi	r24, 0xF0	; 240
 34a:	80 93 1c 01 	sts	0x011C, r24	; 0x80011c <LED_B_CNT>
 34e:	80 91 13 01 	lds	r24, 0x0113	; 0x800113 <timer_counter>
 352:	90 91 14 01 	lds	r25, 0x0114	; 0x800114 <timer_counter+0x1>
 356:	01 96       	adiw	r24, 0x01	; 1
 358:	90 93 14 01 	sts	0x0114, r25	; 0x800114 <timer_counter+0x1>
 35c:	80 93 13 01 	sts	0x0113, r24	; 0x800113 <timer_counter>
 360:	80 91 13 01 	lds	r24, 0x0113	; 0x800113 <timer_counter>
 364:	90 91 14 01 	lds	r25, 0x0114	; 0x800114 <timer_counter+0x1>
 368:	68 ee       	ldi	r22, 0xE8	; 232
 36a:	73 e0       	ldi	r23, 0x03	; 3
 36c:	0e 94 56 04 	call	0x8ac	; 0x8ac <__udivmodhi4>
 370:	89 2b       	or	r24, r25
 372:	19 f4       	brne	.+6      	; 0x37a <__vector_7+0x50>
 374:	81 e0       	ldi	r24, 0x01	; 1
 376:	80 93 1a 01 	sts	0x011A, r24	; 0x80011a <new_second_flag>
 37a:	80 91 13 01 	lds	r24, 0x0113	; 0x800113 <timer_counter>
 37e:	90 91 14 01 	lds	r25, 0x0114	; 0x800114 <timer_counter+0x1>
 382:	80 36       	cpi	r24, 0x60	; 96
 384:	9a 4e       	sbci	r25, 0xEA	; 234
 386:	38 f0       	brcs	.+14     	; 0x396 <__vector_7+0x6c>
 388:	81 e0       	ldi	r24, 0x01	; 1
 38a:	80 93 1b 01 	sts	0x011B, r24	; 0x80011b <new_minute_flag>
 38e:	10 92 14 01 	sts	0x0114, r1	; 0x800114 <timer_counter+0x1>
 392:	10 92 13 01 	sts	0x0113, r1	; 0x800113 <timer_counter>
 396:	80 91 11 01 	lds	r24, 0x0111	; 0x800111 <ms_ticks>
 39a:	90 91 12 01 	lds	r25, 0x0112	; 0x800112 <ms_ticks+0x1>
 39e:	89 2b       	or	r24, r25
 3a0:	49 f0       	breq	.+18     	; 0x3b4 <__vector_7+0x8a>
 3a2:	80 91 11 01 	lds	r24, 0x0111	; 0x800111 <ms_ticks>
 3a6:	90 91 12 01 	lds	r25, 0x0112	; 0x800112 <ms_ticks+0x1>
 3aa:	01 97       	sbiw	r24, 0x01	; 1
 3ac:	90 93 12 01 	sts	0x0112, r25	; 0x800112 <ms_ticks+0x1>
 3b0:	80 93 11 01 	sts	0x0111, r24	; 0x800111 <ms_ticks>
 3b4:	98 b5       	in	r25, 0x28	; 40
 3b6:	80 91 17 01 	lds	r24, 0x0117	; 0x800117 <_target_brightness>
 3ba:	98 17       	cp	r25, r24
 3bc:	51 f0       	breq	.+20     	; 0x3d2 <__vector_7+0xa8>
 3be:	80 91 0f 01 	lds	r24, 0x010F	; 0x80010f <brightness_counter>
 3c2:	90 91 10 01 	lds	r25, 0x0110	; 0x800110 <brightness_counter+0x1>
 3c6:	01 96       	adiw	r24, 0x01	; 1
 3c8:	90 93 10 01 	sts	0x0110, r25	; 0x800110 <brightness_counter+0x1>
 3cc:	80 93 0f 01 	sts	0x010F, r24	; 0x80010f <brightness_counter>
 3d0:	04 c0       	rjmp	.+8      	; 0x3da <__vector_7+0xb0>
 3d2:	10 92 10 01 	sts	0x0110, r1	; 0x800110 <brightness_counter+0x1>
 3d6:	10 92 0f 01 	sts	0x010F, r1	; 0x80010f <brightness_counter>
 3da:	80 91 0f 01 	lds	r24, 0x010F	; 0x80010f <brightness_counter>
 3de:	90 91 10 01 	lds	r25, 0x0110	; 0x800110 <brightness_counter+0x1>
 3e2:	82 34       	cpi	r24, 0x42	; 66
 3e4:	91 05       	cpc	r25, r1
 3e6:	c0 f0       	brcs	.+48     	; 0x418 <__LOCK_REGION_LENGTH__+0x18>
 3e8:	98 b5       	in	r25, 0x28	; 40
 3ea:	80 91 17 01 	lds	r24, 0x0117	; 0x800117 <_target_brightness>
 3ee:	98 17       	cp	r25, r24
 3f0:	38 f4       	brcc	.+14     	; 0x400 <__LOCK_REGION_LENGTH__>
 3f2:	88 b5       	in	r24, 0x28	; 40
 3f4:	8f 5f       	subi	r24, 0xFF	; 255
 3f6:	88 bd       	out	0x28, r24	; 40
 3f8:	83 e3       	ldi	r24, 0x33	; 51
 3fa:	84 bd       	out	0x24, r24	; 36
 3fc:	5d 98       	cbi	0x0b, 5	; 11
 3fe:	08 c0       	rjmp	.+16     	; 0x410 <__LOCK_REGION_LENGTH__+0x10>
 400:	88 b5       	in	r24, 0x28	; 40
 402:	81 50       	subi	r24, 0x01	; 1
 404:	88 bd       	out	0x28, r24	; 40
 406:	88 b5       	in	r24, 0x28	; 40
 408:	81 11       	cpse	r24, r1
 40a:	02 c0       	rjmp	.+4      	; 0x410 <__LOCK_REGION_LENGTH__+0x10>
 40c:	5d 9a       	sbi	0x0b, 5	; 11
 40e:	14 bc       	out	0x24, r1	; 36
 410:	10 92 10 01 	sts	0x0110, r1	; 0x800110 <brightness_counter+0x1>
 414:	10 92 0f 01 	sts	0x010F, r1	; 0x80010f <brightness_counter>
 418:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 41c:	82 ff       	sbrs	r24, 2
 41e:	30 c0       	rjmp	.+96     	; 0x480 <__LOCK_REGION_LENGTH__+0x80>
 420:	80 91 1e 01 	lds	r24, 0x011E	; 0x80011e <crossfade_flip_counter>
 424:	8f 5f       	subi	r24, 0xFF	; 255
 426:	80 93 1e 01 	sts	0x011E, r24	; 0x80011e <crossfade_flip_counter>
 42a:	80 91 0e 01 	lds	r24, 0x010E	; 0x80010e <crossfade_step_counter>
 42e:	8f 5f       	subi	r24, 0xFF	; 255
 430:	80 93 0e 01 	sts	0x010E, r24	; 0x80010e <crossfade_step_counter>
 434:	90 e0       	ldi	r25, 0x00	; 0
 436:	20 91 29 01 	lds	r18, 0x0129	; 0x800129 <MODE>
 43a:	21 fd       	sbrc	r18, 1
 43c:	03 c0       	rjmp	.+6      	; 0x444 <__LOCK_REGION_LENGTH__+0x44>
 43e:	20 e8       	ldi	r18, 0x80	; 128
 440:	30 e0       	ldi	r19, 0x00	; 0
 442:	02 c0       	rjmp	.+4      	; 0x448 <__LOCK_REGION_LENGTH__+0x48>
 444:	2a e2       	ldi	r18, 0x2A	; 42
 446:	30 e0       	ldi	r19, 0x00	; 0
 448:	28 17       	cp	r18, r24
 44a:	39 07       	cpc	r19, r25
 44c:	cc f4       	brge	.+50     	; 0x480 <__LOCK_REGION_LENGTH__+0x80>
 44e:	10 92 0e 01 	sts	0x010E, r1	; 0x80010e <crossfade_step_counter>
 452:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <digit_flipper>
 456:	88 23       	and	r24, r24
 458:	29 f0       	breq	.+10     	; 0x464 <__LOCK_REGION_LENGTH__+0x64>
 45a:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <digit_flipper>
 45e:	81 50       	subi	r24, 0x01	; 1
 460:	80 93 09 01 	sts	0x0109, r24	; 0x800109 <digit_flipper>
 464:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <digit_flipper>
 468:	81 11       	cpse	r24, r1
 46a:	0a c0       	rjmp	.+20     	; 0x480 <__LOCK_REGION_LENGTH__+0x80>
 46c:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 470:	8d 7f       	andi	r24, 0xFD	; 253
 472:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 476:	10 92 1e 01 	sts	0x011E, r1	; 0x80011e <crossfade_flip_counter>
 47a:	80 e2       	ldi	r24, 0x20	; 32
 47c:	80 93 09 01 	sts	0x0109, r24	; 0x800109 <digit_flipper>
 480:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <debounce_cnt>
 484:	80 34       	cpi	r24, 0x40	; 64
 486:	28 f4       	brcc	.+10     	; 0x492 <__LOCK_REGION_LENGTH__+0x92>
 488:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <debounce_cnt>
 48c:	8f 5f       	subi	r24, 0xFF	; 255
 48e:	80 93 08 01 	sts	0x0108, r24	; 0x800108 <debounce_cnt>
 492:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 496:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 49a:	8e 3e       	cpi	r24, 0xEE	; 238
 49c:	22 e0       	ldi	r18, 0x02	; 2
 49e:	92 07       	cpc	r25, r18
 4a0:	48 f4       	brcc	.+18     	; 0x4b4 <main>
 4a2:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 4a6:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 4aa:	01 96       	adiw	r24, 0x01	; 1
 4ac:	90 93 06 01 	sts	0x0106, r25	; 0x800106 <long_press_cnt+0x1>
 4b0:	80 93 05 01 	sts	0x0105, r24	; 0x800105 <long_press_cnt>

000004b4 <main>:
 4b4:	3a 9a       	sbi	0x07, 2	; 7
 4b6:	42 98       	cbi	0x08, 2	; 8
 4b8:	56 9a       	sbi	0x0a, 6	; 10
 4ba:	5e 98       	cbi	0x0b, 6	; 11
 4bc:	8f b7       	in	r24, 0x3f	; 63
 4be:	f8 94       	cli
 4c0:	94 e6       	ldi	r25, 0x64	; 100
 4c2:	97 bd       	out	0x27, r25	; 39
 4c4:	18 bc       	out	0x28, r1	; 40
 4c6:	93 e3       	ldi	r25, 0x33	; 51
 4c8:	94 bd       	out	0x24, r25	; 36
 4ca:	99 e0       	ldi	r25, 0x09	; 9
 4cc:	95 bd       	out	0x25, r25	; 37
 4ce:	10 92 6e 00 	sts	0x006E, r1	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
 4d2:	8f bf       	out	0x3f, r24	; 63
 4d4:	28 98       	cbi	0x05, 0	; 5
 4d6:	20 9a       	sbi	0x04, 0	; 4
 4d8:	5f 98       	cbi	0x0b, 7	; 11
 4da:	57 9a       	sbi	0x0a, 7	; 10
 4dc:	2c 98       	cbi	0x05, 4	; 5
 4de:	24 9a       	sbi	0x04, 4	; 4
 4e0:	5d 98       	cbi	0x0b, 5	; 11
 4e2:	55 9a       	sbi	0x0a, 5	; 10
 4e4:	9f b7       	in	r25, 0x3f	; 63
 4e6:	f8 94       	cli
 4e8:	82 e0       	ldi	r24, 0x02	; 2
 4ea:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 4ee:	24 e0       	ldi	r18, 0x04	; 4
 4f0:	20 93 b1 00 	sts	0x00B1, r18	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
 4f4:	29 ef       	ldi	r18, 0xF9	; 249
 4f6:	20 93 b3 00 	sts	0x00B3, r18	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
 4fa:	80 93 70 00 	sts	0x0070, r24	; 0x800070 <__TEXT_REGION_LENGTH__+0x7e0070>
 4fe:	10 92 b2 00 	sts	0x00B2, r1	; 0x8000b2 <__TEXT_REGION_LENGTH__+0x7e00b2>
 502:	9f bf       	out	0x3f, r25	; 63
 504:	53 98       	cbi	0x0a, 3	; 10
 506:	5b 9a       	sbi	0x0b, 3	; 11
 508:	52 98       	cbi	0x0a, 2	; 10
 50a:	5a 9a       	sbi	0x0b, 2	; 11
 50c:	39 98       	cbi	0x07, 1	; 7
 50e:	41 9a       	sbi	0x08, 1	; 8
 510:	54 98       	cbi	0x0a, 4	; 10
 512:	5c 9a       	sbi	0x0b, 4	; 11
 514:	21 9a       	sbi	0x04, 1	; 4
 516:	29 98       	cbi	0x05, 1	; 5
 518:	22 9a       	sbi	0x04, 2	; 4
 51a:	2a 98       	cbi	0x05, 2	; 5
 51c:	23 9a       	sbi	0x04, 3	; 4
 51e:	2b 98       	cbi	0x05, 3	; 5
 520:	81 e1       	ldi	r24, 0x11	; 17
 522:	0e 94 92 00 	call	0x124	; 0x124 <_Z13setBrightnessh>
 526:	85 e2       	ldi	r24, 0x25	; 37
 528:	91 e0       	ldi	r25, 0x01	; 1
 52a:	0e 94 5a 00 	call	0xb4	; 0xb4 <_Z20putDigitsToInputRegsPhh.constprop.4>
 52e:	0e 94 7a 01 	call	0x2f4	; 0x2f4 <_Z16pushToOutputRegsv>
 532:	88 ee       	ldi	r24, 0xE8	; 232
 534:	93 e0       	ldi	r25, 0x03	; 3
 536:	0e 94 7f 01 	call	0x2fe	; 0x2fe <_Z4waitj>
 53a:	0e 94 62 01 	call	0x2c4	; 0x2c4 <_Z16startDiagnosticsv>
 53e:	80 ea       	ldi	r24, 0xA0	; 160
 540:	9f e1       	ldi	r25, 0x1F	; 31
 542:	0e 94 7f 01 	call	0x2fe	; 0x2fe <_Z4waitj>
 546:	0e 94 9b 00 	call	0x136	; 0x136 <_Z15stopDiagnosticsv>
 54a:	5c 9b       	sbis	0x0b, 4	; 11
 54c:	05 c0       	rjmp	.+10     	; 0x558 <main+0xa4>
 54e:	82 e0       	ldi	r24, 0x02	; 2
 550:	0e 94 d5 00 	call	0x1aa	; 0x1aa <_ZL11getEEConfigh>
 554:	0e 94 4f 01 	call	0x29e	; 0x29e <_Z16configBrightnessh>
 558:	0e 94 79 00 	call	0xf2	; 0xf2 <_Z16getTimeInMinutesv>
 55c:	20 91 29 01 	lds	r18, 0x0129	; 0x800129 <MODE>
 560:	21 11       	cpse	r18, r1
 562:	02 c0       	rjmp	.+4      	; 0x568 <main+0xb4>
 564:	0e 94 e1 00 	call	0x1c2	; 0x1c2 <_Z11displayTimej.part.2>
 568:	ff 24       	eor	r15, r15
 56a:	f3 94       	inc	r15
 56c:	ca e0       	ldi	r28, 0x0A	; 10
 56e:	d0 e0       	ldi	r29, 0x00	; 0
 570:	80 91 20 01 	lds	r24, 0x0120	; 0x800120 <blink_timer_counter>
 574:	88 3c       	cpi	r24, 0xC8	; 200
 576:	98 f0       	brcs	.+38     	; 0x59e <main+0xea>
 578:	10 92 20 01 	sts	0x0120, r1	; 0x800120 <blink_timer_counter>
 57c:	80 91 1f 01 	lds	r24, 0x011F	; 0x80011f <selected_digit>
 580:	e8 2f       	mov	r30, r24
 582:	f0 e0       	ldi	r31, 0x00	; 0
 584:	eb 5d       	subi	r30, 0xDB	; 219
 586:	fe 4f       	sbci	r31, 0xFE	; 254
 588:	60 81       	ld	r22, Z
 58a:	70 e0       	ldi	r23, 0x00	; 0
 58c:	66 0f       	add	r22, r22
 58e:	67 2f       	mov	r22, r23
 590:	66 1f       	adc	r22, r22
 592:	77 0b       	sbc	r23, r23
 594:	21 e0       	ldi	r18, 0x01	; 1
 596:	62 27       	eor	r22, r18
 598:	61 70       	andi	r22, 0x01	; 1
 59a:	0e 94 ae 00 	call	0x15c	; 0x15c <_Z18setNumitronSegmenthhb.constprop.2>
 59e:	90 91 1e 01 	lds	r25, 0x011E	; 0x80011e <crossfade_flip_counter>
 5a2:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <digit_flipper>
 5a6:	89 17       	cp	r24, r25
 5a8:	08 f0       	brcs	.+2      	; 0x5ac <main+0xf8>
 5aa:	56 c0       	rjmp	.+172    	; 0x658 <main+0x1a4>
 5ac:	85 e2       	ldi	r24, 0x25	; 37
 5ae:	91 e0       	ldi	r25, 0x01	; 1
 5b0:	0e 94 5a 00 	call	0xb4	; 0xb4 <_Z20putDigitsToInputRegsPhh.constprop.4>
 5b4:	0e 94 7a 01 	call	0x2f4	; 0x2f4 <_Z16pushToOutputRegsv>
 5b8:	80 91 1e 01 	lds	r24, 0x011E	; 0x80011e <crossfade_flip_counter>
 5bc:	80 32       	cpi	r24, 0x20	; 32
 5be:	10 f0       	brcs	.+4      	; 0x5c4 <main+0x110>
 5c0:	10 92 1e 01 	sts	0x011E, r1	; 0x80011e <crossfade_flip_counter>
 5c4:	80 91 1d 01 	lds	r24, 0x011D	; 0x80011d <LED_B_REG>
 5c8:	88 23       	and	r24, r24
 5ca:	09 f4       	brne	.+2      	; 0x5ce <main+0x11a>
 5cc:	4c c0       	rjmp	.+152    	; 0x666 <main+0x1b2>
 5ce:	90 91 1c 01 	lds	r25, 0x011C	; 0x80011c <LED_B_CNT>
 5d2:	80 91 1d 01 	lds	r24, 0x011D	; 0x80011d <LED_B_REG>
 5d6:	98 17       	cp	r25, r24
 5d8:	08 f4       	brcc	.+2      	; 0x5dc <main+0x128>
 5da:	45 c0       	rjmp	.+138    	; 0x666 <main+0x1b2>
 5dc:	2b 9a       	sbi	0x05, 3	; 5
 5de:	80 91 1b 01 	lds	r24, 0x011B	; 0x80011b <new_minute_flag>
 5e2:	88 23       	and	r24, r24
 5e4:	71 f0       	breq	.+28     	; 0x602 <main+0x14e>
 5e6:	10 92 1b 01 	sts	0x011B, r1	; 0x80011b <new_minute_flag>
 5ea:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 5ee:	81 11       	cpse	r24, r1
 5f0:	08 c0       	rjmp	.+16     	; 0x602 <main+0x14e>
 5f2:	0e 94 79 00 	call	0xf2	; 0xf2 <_Z16getTimeInMinutesv>
 5f6:	20 91 29 01 	lds	r18, 0x0129	; 0x800129 <MODE>
 5fa:	21 11       	cpse	r18, r1
 5fc:	02 c0       	rjmp	.+4      	; 0x602 <main+0x14e>
 5fe:	0e 94 e1 00 	call	0x1c2	; 0x1c2 <_Z11displayTimej.part.2>
 602:	80 91 1a 01 	lds	r24, 0x011A	; 0x80011a <new_second_flag>
 606:	81 11       	cpse	r24, r1
 608:	10 92 1a 01 	sts	0x011A, r1	; 0x80011a <new_second_flag>
 60c:	4c 9b       	sbis	0x09, 4	; 9
 60e:	f0 92 19 01 	sts	0x0119, r15	; 0x800119 <MS_mode>
 612:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <debounce_cnt>
 616:	80 34       	cpi	r24, 0x40	; 64
 618:	08 f4       	brcc	.+2      	; 0x61c <main+0x168>
 61a:	aa cf       	rjmp	.-172    	; 0x570 <main+0xbc>
 61c:	89 b1       	in	r24, 0x09	; 9
 61e:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <STABLE_REG>
 622:	89 27       	eor	r24, r25
 624:	8c 70       	andi	r24, 0x0C	; 12
 626:	41 f4       	brne	.+16     	; 0x638 <main+0x184>
 628:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 62c:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 630:	8e 3e       	cpi	r24, 0xEE	; 238
 632:	92 40       	sbci	r25, 0x02	; 2
 634:	08 f4       	brcc	.+2      	; 0x638 <main+0x184>
 636:	9c cf       	rjmp	.-200    	; 0x570 <main+0xbc>
 638:	89 b1       	in	r24, 0x09	; 9
 63a:	90 91 04 01 	lds	r25, 0x0104	; 0x800104 <TEMP_REG>
 63e:	89 27       	eor	r24, r25
 640:	8c 70       	andi	r24, 0x0C	; 12
 642:	99 f0       	breq	.+38     	; 0x66a <main+0x1b6>
 644:	10 92 08 01 	sts	0x0108, r1	; 0x800108 <debounce_cnt>
 648:	89 b1       	in	r24, 0x09	; 9
 64a:	80 93 04 01 	sts	0x0104, r24	; 0x800104 <TEMP_REG>
 64e:	10 92 06 01 	sts	0x0106, r1	; 0x800106 <long_press_cnt+0x1>
 652:	10 92 05 01 	sts	0x0105, r1	; 0x800105 <long_press_cnt>
 656:	8c cf       	rjmp	.-232    	; 0x570 <main+0xbc>
 658:	81 e2       	ldi	r24, 0x21	; 33
 65a:	91 e0       	ldi	r25, 0x01	; 1
 65c:	0e 94 5a 00 	call	0xb4	; 0xb4 <_Z20putDigitsToInputRegsPhh.constprop.4>
 660:	0e 94 7a 01 	call	0x2f4	; 0x2f4 <_Z16pushToOutputRegsv>
 664:	af cf       	rjmp	.-162    	; 0x5c4 <main+0x110>
 666:	2b 98       	cbi	0x05, 3	; 5
 668:	ba cf       	rjmp	.-140    	; 0x5de <main+0x12a>
 66a:	80 91 04 01 	lds	r24, 0x0104	; 0x800104 <TEMP_REG>
 66e:	80 93 07 01 	sts	0x0107, r24	; 0x800107 <STABLE_REG>
 672:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 676:	8c 70       	andi	r24, 0x0C	; 12
 678:	e1 f4       	brne	.+56     	; 0x6b2 <main+0x1fe>
 67a:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 67e:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 682:	8e 3e       	cpi	r24, 0xEE	; 238
 684:	92 40       	sbci	r25, 0x02	; 2
 686:	70 f0       	brcs	.+28     	; 0x6a4 <main+0x1f0>
 688:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <BOTH_FLAG>
 68c:	84 60       	ori	r24, 0x04	; 4
 68e:	80 93 18 01 	sts	0x0118, r24	; 0x800118 <BOTH_FLAG>
 692:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 696:	81 ff       	sbrs	r24, 1
 698:	0e 94 62 01 	call	0x2c4	; 0x2c4 <_Z16startDiagnosticsv>
 69c:	10 92 06 01 	sts	0x0106, r1	; 0x800106 <long_press_cnt+0x1>
 6a0:	10 92 05 01 	sts	0x0105, r1	; 0x800105 <long_press_cnt>
 6a4:	f0 92 18 01 	sts	0x0118, r15	; 0x800118 <BOTH_FLAG>
 6a8:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 6ac:	80 93 02 01 	sts	0x0102, r24	; 0x800102 <PREV_STABLE_REG>
 6b0:	5f cf       	rjmp	.-322    	; 0x570 <main+0xbc>
 6b2:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <BOTH_FLAG>
 6b6:	88 23       	and	r24, r24
 6b8:	31 f0       	breq	.+12     	; 0x6c6 <main+0x212>
 6ba:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 6be:	8c 70       	andi	r24, 0x0C	; 12
 6c0:	8c 30       	cpi	r24, 0x0C	; 12
 6c2:	09 f4       	brne	.+2      	; 0x6c6 <main+0x212>
 6c4:	42 c0       	rjmp	.+132    	; 0x74a <main+0x296>
 6c6:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 6ca:	82 ff       	sbrs	r24, 2
 6cc:	6e c0       	rjmp	.+220    	; 0x7aa <main+0x2f6>
 6ce:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 6d2:	83 ff       	sbrs	r24, 3
 6d4:	8c c0       	rjmp	.+280    	; 0x7ee <main+0x33a>
 6d6:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <BOTH_FLAG>
 6da:	88 23       	and	r24, r24
 6dc:	09 f4       	brne	.+2      	; 0x6e0 <main+0x22c>
 6de:	a1 c0       	rjmp	.+322    	; 0x822 <main+0x36e>
 6e0:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <BOTH_FLAG>
 6e4:	81 11       	cpse	r24, r1
 6e6:	e0 cf       	rjmp	.-64     	; 0x6a8 <main+0x1f4>
 6e8:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 6ec:	83 ff       	sbrs	r24, 3
 6ee:	dc cf       	rjmp	.-72     	; 0x6a8 <main+0x1f4>
 6f0:	80 91 02 01 	lds	r24, 0x0102	; 0x800102 <PREV_STABLE_REG>
 6f4:	83 fd       	sbrc	r24, 3
 6f6:	d8 cf       	rjmp	.-80     	; 0x6a8 <main+0x1f4>
 6f8:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 6fc:	81 ff       	sbrs	r24, 1
 6fe:	be c0       	rjmp	.+380    	; 0x87c <main+0x3c8>
 700:	e0 91 1f 01 	lds	r30, 0x011F	; 0x80011f <selected_digit>
 704:	f0 e0       	ldi	r31, 0x00	; 0
 706:	eb 5d       	subi	r30, 0xDB	; 219
 708:	fe 4f       	sbci	r31, 0xFE	; 254
 70a:	90 81       	ld	r25, Z
 70c:	9f 77       	andi	r25, 0x7F	; 127
 70e:	e8 e6       	ldi	r30, 0x68	; 104
 710:	f0 e0       	ldi	r31, 0x00	; 0
 712:	80 e0       	ldi	r24, 0x00	; 0
 714:	24 91       	lpm	r18, Z
 716:	92 17       	cp	r25, r18
 718:	29 f0       	breq	.+10     	; 0x724 <main+0x270>
 71a:	8f 5f       	subi	r24, 0xFF	; 255
 71c:	31 96       	adiw	r30, 0x01	; 1
 71e:	8a 30       	cpi	r24, 0x0A	; 10
 720:	c9 f7       	brne	.-14     	; 0x714 <main+0x260>
 722:	80 e0       	ldi	r24, 0x00	; 0
 724:	20 91 1f 01 	lds	r18, 0x011F	; 0x80011f <selected_digit>
 728:	90 e0       	ldi	r25, 0x00	; 0
 72a:	01 96       	adiw	r24, 0x01	; 1
 72c:	be 01       	movw	r22, r28
 72e:	0e 94 6a 04 	call	0x8d4	; 0x8d4 <__divmodhi4>
 732:	fc 01       	movw	r30, r24
 734:	e8 59       	subi	r30, 0x98	; 152
 736:	ff 4f       	sbci	r31, 0xFF	; 255
 738:	e4 91       	lpm	r30, Z
 73a:	a2 2f       	mov	r26, r18
 73c:	b0 e0       	ldi	r27, 0x00	; 0
 73e:	ab 5d       	subi	r26, 0xDB	; 219
 740:	be 4f       	sbci	r27, 0xFE	; 254
 742:	ec 93       	st	X, r30
 744:	0e 94 a4 00 	call	0x148	; 0x148 <_Z10showDigitsv>
 748:	af cf       	rjmp	.-162    	; 0x6a8 <main+0x1f4>
 74a:	0e 94 9b 00 	call	0x136	; 0x136 <_Z15stopDiagnosticsv>
 74e:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <BOTH_FLAG>
 752:	82 fd       	sbrc	r24, 2
 754:	1a c0       	rjmp	.+52     	; 0x78a <main+0x2d6>
 756:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 75a:	81 ff       	sbrs	r24, 1
 75c:	19 c0       	rjmp	.+50     	; 0x790 <main+0x2dc>
 75e:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 762:	81 60       	ori	r24, 0x01	; 1
 764:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 768:	10 92 20 01 	sts	0x0120, r1	; 0x800120 <blink_timer_counter>
 76c:	80 91 1f 01 	lds	r24, 0x011F	; 0x80011f <selected_digit>
 770:	60 e0       	ldi	r22, 0x00	; 0
 772:	0e 94 ae 00 	call	0x15c	; 0x15c <_Z18setNumitronSegmenthhb.constprop.2>
 776:	10 91 01 01 	lds	r17, 0x0101	; 0x800101 <configured_brightness>
 77a:	82 e0       	ldi	r24, 0x02	; 2
 77c:	0e 94 d5 00 	call	0x1aa	; 0x1aa <_ZL11getEEConfigh>
 780:	18 17       	cp	r17, r24
 782:	19 f0       	breq	.+6      	; 0x78a <main+0x2d6>
 784:	10 68       	ori	r17, 0x80	; 128
 786:	10 93 17 01 	sts	0x0117, r17	; 0x800117 <_target_brightness>
 78a:	10 92 18 01 	sts	0x0118, r1	; 0x800118 <BOTH_FLAG>
 78e:	8c cf       	rjmp	.-232    	; 0x6a8 <main+0x1f4>
 790:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 794:	81 60       	ori	r24, 0x01	; 1
 796:	80 93 29 01 	sts	0x0129, r24	; 0x800129 <MODE>
 79a:	10 92 20 01 	sts	0x0120, r1	; 0x800120 <blink_timer_counter>
 79e:	80 91 1f 01 	lds	r24, 0x011F	; 0x80011f <selected_digit>
 7a2:	61 e0       	ldi	r22, 0x01	; 1
 7a4:	0e 94 ae 00 	call	0x15c	; 0x15c <_Z18setNumitronSegmenthhb.constprop.2>
 7a8:	f0 cf       	rjmp	.-32     	; 0x78a <main+0x2d6>
 7aa:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 7ae:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 7b2:	8e 3e       	cpi	r24, 0xEE	; 238
 7b4:	92 40       	sbci	r25, 0x02	; 2
 7b6:	08 f4       	brcc	.+2      	; 0x7ba <main+0x306>
 7b8:	8a cf       	rjmp	.-236    	; 0x6ce <main+0x21a>
 7ba:	10 92 06 01 	sts	0x0106, r1	; 0x800106 <long_press_cnt+0x1>
 7be:	10 92 05 01 	sts	0x0105, r1	; 0x800105 <long_press_cnt>
 7c2:	60 91 17 01 	lds	r22, 0x0117	; 0x800117 <_target_brightness>
 7c6:	70 e0       	ldi	r23, 0x00	; 0
 7c8:	90 e0       	ldi	r25, 0x00	; 0
 7ca:	80 e0       	ldi	r24, 0x00	; 0
 7cc:	0e 94 1c 05 	call	0xa38	; 0xa38 <__floatsisf>
 7d0:	2a e9       	ldi	r18, 0x9A	; 154
 7d2:	39 e9       	ldi	r19, 0x99	; 153
 7d4:	49 ed       	ldi	r20, 0xD9	; 217
 7d6:	5f e3       	ldi	r21, 0x3F	; 63
 7d8:	0e 94 7e 04 	call	0x8fc	; 0x8fc <__subsf3>
 7dc:	0e 94 eb 04 	call	0x9d6	; 0x9d6 <__fixunssfsi>
 7e0:	60 93 03 01 	sts	0x0103, r22	; 0x800103 <minimum_brightness>
 7e4:	80 91 03 01 	lds	r24, 0x0103	; 0x800103 <minimum_brightness>
 7e8:	0e 94 4f 01 	call	0x29e	; 0x29e <_Z16configBrightnessh>
 7ec:	5d cf       	rjmp	.-326    	; 0x6a8 <main+0x1f4>
 7ee:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <long_press_cnt>
 7f2:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <long_press_cnt+0x1>
 7f6:	8e 3e       	cpi	r24, 0xEE	; 238
 7f8:	92 40       	sbci	r25, 0x02	; 2
 7fa:	08 f4       	brcc	.+2      	; 0x7fe <main+0x34a>
 7fc:	6c cf       	rjmp	.-296    	; 0x6d6 <main+0x222>
 7fe:	10 92 06 01 	sts	0x0106, r1	; 0x800106 <long_press_cnt+0x1>
 802:	10 92 05 01 	sts	0x0105, r1	; 0x800105 <long_press_cnt>
 806:	60 91 17 01 	lds	r22, 0x0117	; 0x800117 <_target_brightness>
 80a:	70 e0       	ldi	r23, 0x00	; 0
 80c:	90 e0       	ldi	r25, 0x00	; 0
 80e:	80 e0       	ldi	r24, 0x00	; 0
 810:	0e 94 1c 05 	call	0xa38	; 0xa38 <__floatsisf>
 814:	2a e9       	ldi	r18, 0x9A	; 154
 816:	39 e9       	ldi	r19, 0x99	; 153
 818:	49 ed       	ldi	r20, 0xD9	; 217
 81a:	5f e3       	ldi	r21, 0x3F	; 63
 81c:	0e 94 7f 04 	call	0x8fe	; 0x8fe <__addsf3>
 820:	dd cf       	rjmp	.-70     	; 0x7dc <main+0x328>
 822:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <STABLE_REG>
 826:	82 ff       	sbrs	r24, 2
 828:	5b cf       	rjmp	.-330    	; 0x6e0 <main+0x22c>
 82a:	80 91 02 01 	lds	r24, 0x0102	; 0x800102 <PREV_STABLE_REG>
 82e:	82 fd       	sbrc	r24, 2
 830:	57 cf       	rjmp	.-338    	; 0x6e0 <main+0x22c>
 832:	80 91 29 01 	lds	r24, 0x0129	; 0x800129 <MODE>
 836:	81 ff       	sbrs	r24, 1
 838:	15 c0       	rjmp	.+42     	; 0x864 <main+0x3b0>
 83a:	00 91 1f 01 	lds	r16, 0x011F	; 0x80011f <selected_digit>
 83e:	10 e0       	ldi	r17, 0x00	; 0
 840:	0f 5f       	subi	r16, 0xFF	; 255
 842:	1f 4f       	sbci	r17, 0xFF	; 255
 844:	03 70       	andi	r16, 0x03	; 3
 846:	11 27       	eor	r17, r17
 848:	80 91 1f 01 	lds	r24, 0x011F	; 0x80011f <selected_digit>
 84c:	60 e0       	ldi	r22, 0x00	; 0
 84e:	0e 94 ae 00 	call	0x15c	; 0x15c <_Z18setNumitronSegmenthhb.constprop.2>
 852:	10 92 20 01 	sts	0x0120, r1	; 0x800120 <blink_timer_counter>
 856:	61 e0       	ldi	r22, 0x01	; 1
 858:	80 2f       	mov	r24, r16
 85a:	0e 94 ae 00 	call	0x15c	; 0x15c <_Z18setNumitronSegmenthhb.constprop.2>
 85e:	00 93 1f 01 	sts	0x011F, r16	; 0x80011f <selected_digit>
 862:	22 cf       	rjmp	.-444    	; 0x6a8 <main+0x1f4>
 864:	60 91 17 01 	lds	r22, 0x0117	; 0x800117 <_target_brightness>
 868:	70 e0       	ldi	r23, 0x00	; 0
 86a:	90 e0       	ldi	r25, 0x00	; 0
 86c:	80 e0       	ldi	r24, 0x00	; 0
 86e:	0e 94 1c 05 	call	0xa38	; 0xa38 <__floatsisf>
 872:	2a e9       	ldi	r18, 0x9A	; 154
 874:	39 e9       	ldi	r19, 0x99	; 153
 876:	49 e5       	ldi	r20, 0x59	; 89
 878:	50 e4       	ldi	r21, 0x40	; 64
 87a:	ae cf       	rjmp	.-164    	; 0x7d8 <main+0x324>
 87c:	60 91 17 01 	lds	r22, 0x0117	; 0x800117 <_target_brightness>
 880:	70 e0       	ldi	r23, 0x00	; 0
 882:	90 e0       	ldi	r25, 0x00	; 0
 884:	80 e0       	ldi	r24, 0x00	; 0
 886:	0e 94 1c 05 	call	0xa38	; 0xa38 <__floatsisf>
 88a:	2a e9       	ldi	r18, 0x9A	; 154
 88c:	39 e9       	ldi	r19, 0x99	; 153
 88e:	49 e5       	ldi	r20, 0x59	; 89
 890:	50 e4       	ldi	r21, 0x40	; 64
 892:	c4 cf       	rjmp	.-120    	; 0x81c <main+0x368>

00000894 <__udivmodqi4>:
 894:	99 1b       	sub	r25, r25
 896:	79 e0       	ldi	r23, 0x09	; 9
 898:	04 c0       	rjmp	.+8      	; 0x8a2 <__udivmodqi4_ep>

0000089a <__udivmodqi4_loop>:
 89a:	99 1f       	adc	r25, r25
 89c:	96 17       	cp	r25, r22
 89e:	08 f0       	brcs	.+2      	; 0x8a2 <__udivmodqi4_ep>
 8a0:	96 1b       	sub	r25, r22

000008a2 <__udivmodqi4_ep>:
 8a2:	88 1f       	adc	r24, r24
 8a4:	7a 95       	dec	r23
 8a6:	c9 f7       	brne	.-14     	; 0x89a <__udivmodqi4_loop>
 8a8:	80 95       	com	r24
 8aa:	08 95       	ret

000008ac <__udivmodhi4>:
 8ac:	aa 1b       	sub	r26, r26
 8ae:	bb 1b       	sub	r27, r27
 8b0:	51 e1       	ldi	r21, 0x11	; 17
 8b2:	07 c0       	rjmp	.+14     	; 0x8c2 <__udivmodhi4_ep>

000008b4 <__udivmodhi4_loop>:
 8b4:	aa 1f       	adc	r26, r26
 8b6:	bb 1f       	adc	r27, r27
 8b8:	a6 17       	cp	r26, r22
 8ba:	b7 07       	cpc	r27, r23
 8bc:	10 f0       	brcs	.+4      	; 0x8c2 <__udivmodhi4_ep>
 8be:	a6 1b       	sub	r26, r22
 8c0:	b7 0b       	sbc	r27, r23

000008c2 <__udivmodhi4_ep>:
 8c2:	88 1f       	adc	r24, r24
 8c4:	99 1f       	adc	r25, r25
 8c6:	5a 95       	dec	r21
 8c8:	a9 f7       	brne	.-22     	; 0x8b4 <__udivmodhi4_loop>
 8ca:	80 95       	com	r24
 8cc:	90 95       	com	r25
 8ce:	bc 01       	movw	r22, r24
 8d0:	cd 01       	movw	r24, r26
 8d2:	08 95       	ret

000008d4 <__divmodhi4>:
 8d4:	97 fb       	bst	r25, 7
 8d6:	07 2e       	mov	r0, r23
 8d8:	16 f4       	brtc	.+4      	; 0x8de <__divmodhi4+0xa>
 8da:	00 94       	com	r0
 8dc:	07 d0       	rcall	.+14     	; 0x8ec <__divmodhi4_neg1>
 8de:	77 fd       	sbrc	r23, 7
 8e0:	09 d0       	rcall	.+18     	; 0x8f4 <__divmodhi4_neg2>
 8e2:	0e 94 56 04 	call	0x8ac	; 0x8ac <__udivmodhi4>
 8e6:	07 fc       	sbrc	r0, 7
 8e8:	05 d0       	rcall	.+10     	; 0x8f4 <__divmodhi4_neg2>
 8ea:	3e f4       	brtc	.+14     	; 0x8fa <__divmodhi4_exit>

000008ec <__divmodhi4_neg1>:
 8ec:	90 95       	com	r25
 8ee:	81 95       	neg	r24
 8f0:	9f 4f       	sbci	r25, 0xFF	; 255
 8f2:	08 95       	ret

000008f4 <__divmodhi4_neg2>:
 8f4:	70 95       	com	r23
 8f6:	61 95       	neg	r22
 8f8:	7f 4f       	sbci	r23, 0xFF	; 255

000008fa <__divmodhi4_exit>:
 8fa:	08 95       	ret

000008fc <__subsf3>:
 8fc:	50 58       	subi	r21, 0x80	; 128

000008fe <__addsf3>:
 8fe:	bb 27       	eor	r27, r27
 900:	aa 27       	eor	r26, r26
 902:	0e 94 96 04 	call	0x92c	; 0x92c <__addsf3x>
 906:	0c 94 6e 05 	jmp	0xadc	; 0xadc <__fp_round>
 90a:	0e 94 60 05 	call	0xac0	; 0xac0 <__fp_pscA>
 90e:	38 f0       	brcs	.+14     	; 0x91e <__stack+0x1f>
 910:	0e 94 67 05 	call	0xace	; 0xace <__fp_pscB>
 914:	20 f0       	brcs	.+8      	; 0x91e <__stack+0x1f>
 916:	39 f4       	brne	.+14     	; 0x926 <__stack+0x27>
 918:	9f 3f       	cpi	r25, 0xFF	; 255
 91a:	19 f4       	brne	.+6      	; 0x922 <__stack+0x23>
 91c:	26 f4       	brtc	.+8      	; 0x926 <__stack+0x27>
 91e:	0c 94 5d 05 	jmp	0xaba	; 0xaba <__fp_nan>
 922:	0e f4       	brtc	.+2      	; 0x926 <__stack+0x27>
 924:	e0 95       	com	r30
 926:	e7 fb       	bst	r30, 7
 928:	0c 94 57 05 	jmp	0xaae	; 0xaae <__fp_inf>

0000092c <__addsf3x>:
 92c:	e9 2f       	mov	r30, r25
 92e:	0e 94 7f 05 	call	0xafe	; 0xafe <__fp_split3>
 932:	58 f3       	brcs	.-42     	; 0x90a <__stack+0xb>
 934:	ba 17       	cp	r27, r26
 936:	62 07       	cpc	r22, r18
 938:	73 07       	cpc	r23, r19
 93a:	84 07       	cpc	r24, r20
 93c:	95 07       	cpc	r25, r21
 93e:	20 f0       	brcs	.+8      	; 0x948 <__addsf3x+0x1c>
 940:	79 f4       	brne	.+30     	; 0x960 <__addsf3x+0x34>
 942:	a6 f5       	brtc	.+104    	; 0x9ac <__addsf3x+0x80>
 944:	0c 94 a1 05 	jmp	0xb42	; 0xb42 <__fp_zero>
 948:	0e f4       	brtc	.+2      	; 0x94c <__addsf3x+0x20>
 94a:	e0 95       	com	r30
 94c:	0b 2e       	mov	r0, r27
 94e:	ba 2f       	mov	r27, r26
 950:	a0 2d       	mov	r26, r0
 952:	0b 01       	movw	r0, r22
 954:	b9 01       	movw	r22, r18
 956:	90 01       	movw	r18, r0
 958:	0c 01       	movw	r0, r24
 95a:	ca 01       	movw	r24, r20
 95c:	a0 01       	movw	r20, r0
 95e:	11 24       	eor	r1, r1
 960:	ff 27       	eor	r31, r31
 962:	59 1b       	sub	r21, r25
 964:	99 f0       	breq	.+38     	; 0x98c <__addsf3x+0x60>
 966:	59 3f       	cpi	r21, 0xF9	; 249
 968:	50 f4       	brcc	.+20     	; 0x97e <__addsf3x+0x52>
 96a:	50 3e       	cpi	r21, 0xE0	; 224
 96c:	68 f1       	brcs	.+90     	; 0x9c8 <__addsf3x+0x9c>
 96e:	1a 16       	cp	r1, r26
 970:	f0 40       	sbci	r31, 0x00	; 0
 972:	a2 2f       	mov	r26, r18
 974:	23 2f       	mov	r18, r19
 976:	34 2f       	mov	r19, r20
 978:	44 27       	eor	r20, r20
 97a:	58 5f       	subi	r21, 0xF8	; 248
 97c:	f3 cf       	rjmp	.-26     	; 0x964 <__addsf3x+0x38>
 97e:	46 95       	lsr	r20
 980:	37 95       	ror	r19
 982:	27 95       	ror	r18
 984:	a7 95       	ror	r26
 986:	f0 40       	sbci	r31, 0x00	; 0
 988:	53 95       	inc	r21
 98a:	c9 f7       	brne	.-14     	; 0x97e <__addsf3x+0x52>
 98c:	7e f4       	brtc	.+30     	; 0x9ac <__addsf3x+0x80>
 98e:	1f 16       	cp	r1, r31
 990:	ba 0b       	sbc	r27, r26
 992:	62 0b       	sbc	r22, r18
 994:	73 0b       	sbc	r23, r19
 996:	84 0b       	sbc	r24, r20
 998:	ba f0       	brmi	.+46     	; 0x9c8 <__addsf3x+0x9c>
 99a:	91 50       	subi	r25, 0x01	; 1
 99c:	a1 f0       	breq	.+40     	; 0x9c6 <__addsf3x+0x9a>
 99e:	ff 0f       	add	r31, r31
 9a0:	bb 1f       	adc	r27, r27
 9a2:	66 1f       	adc	r22, r22
 9a4:	77 1f       	adc	r23, r23
 9a6:	88 1f       	adc	r24, r24
 9a8:	c2 f7       	brpl	.-16     	; 0x99a <__addsf3x+0x6e>
 9aa:	0e c0       	rjmp	.+28     	; 0x9c8 <__addsf3x+0x9c>
 9ac:	ba 0f       	add	r27, r26
 9ae:	62 1f       	adc	r22, r18
 9b0:	73 1f       	adc	r23, r19
 9b2:	84 1f       	adc	r24, r20
 9b4:	48 f4       	brcc	.+18     	; 0x9c8 <__addsf3x+0x9c>
 9b6:	87 95       	ror	r24
 9b8:	77 95       	ror	r23
 9ba:	67 95       	ror	r22
 9bc:	b7 95       	ror	r27
 9be:	f7 95       	ror	r31
 9c0:	9e 3f       	cpi	r25, 0xFE	; 254
 9c2:	08 f0       	brcs	.+2      	; 0x9c6 <__addsf3x+0x9a>
 9c4:	b0 cf       	rjmp	.-160    	; 0x926 <__stack+0x27>
 9c6:	93 95       	inc	r25
 9c8:	88 0f       	add	r24, r24
 9ca:	08 f0       	brcs	.+2      	; 0x9ce <__addsf3x+0xa2>
 9cc:	99 27       	eor	r25, r25
 9ce:	ee 0f       	add	r30, r30
 9d0:	97 95       	ror	r25
 9d2:	87 95       	ror	r24
 9d4:	08 95       	ret

000009d6 <__fixunssfsi>:
 9d6:	0e 94 87 05 	call	0xb0e	; 0xb0e <__fp_splitA>
 9da:	88 f0       	brcs	.+34     	; 0x9fe <__fixunssfsi+0x28>
 9dc:	9f 57       	subi	r25, 0x7F	; 127
 9de:	98 f0       	brcs	.+38     	; 0xa06 <__fixunssfsi+0x30>
 9e0:	b9 2f       	mov	r27, r25
 9e2:	99 27       	eor	r25, r25
 9e4:	b7 51       	subi	r27, 0x17	; 23
 9e6:	b0 f0       	brcs	.+44     	; 0xa14 <__fixunssfsi+0x3e>
 9e8:	e1 f0       	breq	.+56     	; 0xa22 <__fixunssfsi+0x4c>
 9ea:	66 0f       	add	r22, r22
 9ec:	77 1f       	adc	r23, r23
 9ee:	88 1f       	adc	r24, r24
 9f0:	99 1f       	adc	r25, r25
 9f2:	1a f0       	brmi	.+6      	; 0x9fa <__fixunssfsi+0x24>
 9f4:	ba 95       	dec	r27
 9f6:	c9 f7       	brne	.-14     	; 0x9ea <__fixunssfsi+0x14>
 9f8:	14 c0       	rjmp	.+40     	; 0xa22 <__fixunssfsi+0x4c>
 9fa:	b1 30       	cpi	r27, 0x01	; 1
 9fc:	91 f0       	breq	.+36     	; 0xa22 <__fixunssfsi+0x4c>
 9fe:	0e 94 a1 05 	call	0xb42	; 0xb42 <__fp_zero>
 a02:	b1 e0       	ldi	r27, 0x01	; 1
 a04:	08 95       	ret
 a06:	0c 94 a1 05 	jmp	0xb42	; 0xb42 <__fp_zero>
 a0a:	67 2f       	mov	r22, r23
 a0c:	78 2f       	mov	r23, r24
 a0e:	88 27       	eor	r24, r24
 a10:	b8 5f       	subi	r27, 0xF8	; 248
 a12:	39 f0       	breq	.+14     	; 0xa22 <__fixunssfsi+0x4c>
 a14:	b9 3f       	cpi	r27, 0xF9	; 249
 a16:	cc f3       	brlt	.-14     	; 0xa0a <__fixunssfsi+0x34>
 a18:	86 95       	lsr	r24
 a1a:	77 95       	ror	r23
 a1c:	67 95       	ror	r22
 a1e:	b3 95       	inc	r27
 a20:	d9 f7       	brne	.-10     	; 0xa18 <__fixunssfsi+0x42>
 a22:	3e f4       	brtc	.+14     	; 0xa32 <__fixunssfsi+0x5c>
 a24:	90 95       	com	r25
 a26:	80 95       	com	r24
 a28:	70 95       	com	r23
 a2a:	61 95       	neg	r22
 a2c:	7f 4f       	sbci	r23, 0xFF	; 255
 a2e:	8f 4f       	sbci	r24, 0xFF	; 255
 a30:	9f 4f       	sbci	r25, 0xFF	; 255
 a32:	08 95       	ret

00000a34 <__floatunsisf>:
 a34:	e8 94       	clt
 a36:	09 c0       	rjmp	.+18     	; 0xa4a <__floatsisf+0x12>

00000a38 <__floatsisf>:
 a38:	97 fb       	bst	r25, 7
 a3a:	3e f4       	brtc	.+14     	; 0xa4a <__floatsisf+0x12>
 a3c:	90 95       	com	r25
 a3e:	80 95       	com	r24
 a40:	70 95       	com	r23
 a42:	61 95       	neg	r22
 a44:	7f 4f       	sbci	r23, 0xFF	; 255
 a46:	8f 4f       	sbci	r24, 0xFF	; 255
 a48:	9f 4f       	sbci	r25, 0xFF	; 255
 a4a:	99 23       	and	r25, r25
 a4c:	a9 f0       	breq	.+42     	; 0xa78 <__floatsisf+0x40>
 a4e:	f9 2f       	mov	r31, r25
 a50:	96 e9       	ldi	r25, 0x96	; 150
 a52:	bb 27       	eor	r27, r27
 a54:	93 95       	inc	r25
 a56:	f6 95       	lsr	r31
 a58:	87 95       	ror	r24
 a5a:	77 95       	ror	r23
 a5c:	67 95       	ror	r22
 a5e:	b7 95       	ror	r27
 a60:	f1 11       	cpse	r31, r1
 a62:	f8 cf       	rjmp	.-16     	; 0xa54 <__floatsisf+0x1c>
 a64:	fa f4       	brpl	.+62     	; 0xaa4 <__floatsisf+0x6c>
 a66:	bb 0f       	add	r27, r27
 a68:	11 f4       	brne	.+4      	; 0xa6e <__floatsisf+0x36>
 a6a:	60 ff       	sbrs	r22, 0
 a6c:	1b c0       	rjmp	.+54     	; 0xaa4 <__floatsisf+0x6c>
 a6e:	6f 5f       	subi	r22, 0xFF	; 255
 a70:	7f 4f       	sbci	r23, 0xFF	; 255
 a72:	8f 4f       	sbci	r24, 0xFF	; 255
 a74:	9f 4f       	sbci	r25, 0xFF	; 255
 a76:	16 c0       	rjmp	.+44     	; 0xaa4 <__floatsisf+0x6c>
 a78:	88 23       	and	r24, r24
 a7a:	11 f0       	breq	.+4      	; 0xa80 <__floatsisf+0x48>
 a7c:	96 e9       	ldi	r25, 0x96	; 150
 a7e:	11 c0       	rjmp	.+34     	; 0xaa2 <__floatsisf+0x6a>
 a80:	77 23       	and	r23, r23
 a82:	21 f0       	breq	.+8      	; 0xa8c <__floatsisf+0x54>
 a84:	9e e8       	ldi	r25, 0x8E	; 142
 a86:	87 2f       	mov	r24, r23
 a88:	76 2f       	mov	r23, r22
 a8a:	05 c0       	rjmp	.+10     	; 0xa96 <__floatsisf+0x5e>
 a8c:	66 23       	and	r22, r22
 a8e:	71 f0       	breq	.+28     	; 0xaac <__floatsisf+0x74>
 a90:	96 e8       	ldi	r25, 0x86	; 134
 a92:	86 2f       	mov	r24, r22
 a94:	70 e0       	ldi	r23, 0x00	; 0
 a96:	60 e0       	ldi	r22, 0x00	; 0
 a98:	2a f0       	brmi	.+10     	; 0xaa4 <__floatsisf+0x6c>
 a9a:	9a 95       	dec	r25
 a9c:	66 0f       	add	r22, r22
 a9e:	77 1f       	adc	r23, r23
 aa0:	88 1f       	adc	r24, r24
 aa2:	da f7       	brpl	.-10     	; 0xa9a <__floatsisf+0x62>
 aa4:	88 0f       	add	r24, r24
 aa6:	96 95       	lsr	r25
 aa8:	87 95       	ror	r24
 aaa:	97 f9       	bld	r25, 7
 aac:	08 95       	ret

00000aae <__fp_inf>:
 aae:	97 f9       	bld	r25, 7
 ab0:	9f 67       	ori	r25, 0x7F	; 127
 ab2:	80 e8       	ldi	r24, 0x80	; 128
 ab4:	70 e0       	ldi	r23, 0x00	; 0
 ab6:	60 e0       	ldi	r22, 0x00	; 0
 ab8:	08 95       	ret

00000aba <__fp_nan>:
 aba:	9f ef       	ldi	r25, 0xFF	; 255
 abc:	80 ec       	ldi	r24, 0xC0	; 192
 abe:	08 95       	ret

00000ac0 <__fp_pscA>:
 ac0:	00 24       	eor	r0, r0
 ac2:	0a 94       	dec	r0
 ac4:	16 16       	cp	r1, r22
 ac6:	17 06       	cpc	r1, r23
 ac8:	18 06       	cpc	r1, r24
 aca:	09 06       	cpc	r0, r25
 acc:	08 95       	ret

00000ace <__fp_pscB>:
 ace:	00 24       	eor	r0, r0
 ad0:	0a 94       	dec	r0
 ad2:	12 16       	cp	r1, r18
 ad4:	13 06       	cpc	r1, r19
 ad6:	14 06       	cpc	r1, r20
 ad8:	05 06       	cpc	r0, r21
 ada:	08 95       	ret

00000adc <__fp_round>:
 adc:	09 2e       	mov	r0, r25
 ade:	03 94       	inc	r0
 ae0:	00 0c       	add	r0, r0
 ae2:	11 f4       	brne	.+4      	; 0xae8 <__fp_round+0xc>
 ae4:	88 23       	and	r24, r24
 ae6:	52 f0       	brmi	.+20     	; 0xafc <__fp_round+0x20>
 ae8:	bb 0f       	add	r27, r27
 aea:	40 f4       	brcc	.+16     	; 0xafc <__fp_round+0x20>
 aec:	bf 2b       	or	r27, r31
 aee:	11 f4       	brne	.+4      	; 0xaf4 <__fp_round+0x18>
 af0:	60 ff       	sbrs	r22, 0
 af2:	04 c0       	rjmp	.+8      	; 0xafc <__fp_round+0x20>
 af4:	6f 5f       	subi	r22, 0xFF	; 255
 af6:	7f 4f       	sbci	r23, 0xFF	; 255
 af8:	8f 4f       	sbci	r24, 0xFF	; 255
 afa:	9f 4f       	sbci	r25, 0xFF	; 255
 afc:	08 95       	ret

00000afe <__fp_split3>:
 afe:	57 fd       	sbrc	r21, 7
 b00:	90 58       	subi	r25, 0x80	; 128
 b02:	44 0f       	add	r20, r20
 b04:	55 1f       	adc	r21, r21
 b06:	59 f0       	breq	.+22     	; 0xb1e <__fp_splitA+0x10>
 b08:	5f 3f       	cpi	r21, 0xFF	; 255
 b0a:	71 f0       	breq	.+28     	; 0xb28 <__fp_splitA+0x1a>
 b0c:	47 95       	ror	r20

00000b0e <__fp_splitA>:
 b0e:	88 0f       	add	r24, r24
 b10:	97 fb       	bst	r25, 7
 b12:	99 1f       	adc	r25, r25
 b14:	61 f0       	breq	.+24     	; 0xb2e <__fp_splitA+0x20>
 b16:	9f 3f       	cpi	r25, 0xFF	; 255
 b18:	79 f0       	breq	.+30     	; 0xb38 <__fp_splitA+0x2a>
 b1a:	87 95       	ror	r24
 b1c:	08 95       	ret
 b1e:	12 16       	cp	r1, r18
 b20:	13 06       	cpc	r1, r19
 b22:	14 06       	cpc	r1, r20
 b24:	55 1f       	adc	r21, r21
 b26:	f2 cf       	rjmp	.-28     	; 0xb0c <__fp_split3+0xe>
 b28:	46 95       	lsr	r20
 b2a:	f1 df       	rcall	.-30     	; 0xb0e <__fp_splitA>
 b2c:	08 c0       	rjmp	.+16     	; 0xb3e <__fp_splitA+0x30>
 b2e:	16 16       	cp	r1, r22
 b30:	17 06       	cpc	r1, r23
 b32:	18 06       	cpc	r1, r24
 b34:	99 1f       	adc	r25, r25
 b36:	f1 cf       	rjmp	.-30     	; 0xb1a <__fp_splitA+0xc>
 b38:	86 95       	lsr	r24
 b3a:	71 05       	cpc	r23, r1
 b3c:	61 05       	cpc	r22, r1
 b3e:	08 94       	sec
 b40:	08 95       	ret

00000b42 <__fp_zero>:
 b42:	e8 94       	clt

00000b44 <__fp_szero>:
 b44:	bb 27       	eor	r27, r27
 b46:	66 27       	eor	r22, r22
 b48:	77 27       	eor	r23, r23
 b4a:	cb 01       	movw	r24, r22
 b4c:	97 f9       	bld	r25, 7
 b4e:	08 95       	ret

00000b50 <_exit>:
 b50:	f8 94       	cli

00000b52 <__stop_program>:
 b52:	ff cf       	rjmp	.-2      	; 0xb52 <__stop_program>
