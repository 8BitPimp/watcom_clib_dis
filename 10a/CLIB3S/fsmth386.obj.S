Module: fsmth386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000261 bytes
0000				__FSS:
0000  09 D2				or		edx,edx
0002  74 10				je		L$1
0004  81 F2 00 00 00 80			xor		edx,0x80000000

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

000A				__FSA:
000A  09 D2				or		edx,edx
000C  74 06				je		L$1
000E  09 C0				or		eax,eax
0010  75 03				jne		L$2
0012  89 D0				mov		eax,edx
0014				L$1:
0014  C3				ret		
0015				L$2:
0015  FF 25 00 00 00 00			jmp		dword ptr DGROUP:L$41
001B				L$3:
001B  55				push		ebp
001C  89 E5				mov		ebp,esp
001E  50				push		eax
001F  D9 45 FC				fld		dword ptr -0x4[ebp]
0022  52				push		edx
0023  D8 45 F8				fadd		dword ptr -0x8[ebp]
0026				L$4:
0026  D9 5D FC				fstp		dword ptr -0x4[ebp]
0029  83 C4 04				add		esp,0x00000004
002C  9B				fwait		
002D  58				pop		eax
002E  3D 00 00 00 80			cmp		eax,0x80000000
0033  75 02				jne		L$5
0035  31 C0				xor		eax,eax
0037				L$5:
0037  5D				pop		ebp
0038  C3				ret		
0039				L$6:
0039  51				push		ecx
003A  53				push		ebx
003B  29 C9				sub		ecx,ecx
003D  01 C0				add		eax,eax
003F  10 C9				adc		cl,cl
0041  88 CD				mov		ch,cl
0043  00 C9				add		cl,cl
0045  00 C9				add		cl,cl
0047  00 E9				add		cl,ch
0049  C1 C0 08				rol		eax,0x08
004C  01 D2				add		edx,edx
004E  80 D1 00				adc		cl,0x00
0051  C1 C2 08				rol		edx,0x08
0054  88 C3				mov		bl,al
0056  88 D7				mov		bh,dl
0058  B0 00				mov		al,0x00
005A  F9				stc		
005B  D1 D8				rcr		eax,0x01
005D  B2 00				mov		dl,0x00
005F  F9				stc		
0060  D1 DA				rcr		edx,0x01
0062  88 DD				mov		ch,bl
0064  28 FB				sub		bl,bh
0066  74 19				je		L$10
0068  73 08				jae		L$7
006A  88 FD				mov		ch,bh
006C  F6 DB				neg		bl
006E  92				xchg		eax,edx
006F  80 F1 04				xor		cl,0x04
0072				L$7:
0072  86 D9				xchg		cl,bl
0074  80 F9 20				cmp		cl,0x20
0077  7C 04				jl		L$8
0079  29 D2				sub		edx,edx
007B  EB 02				jmp		L$9
007D				L$8:
007D  D3 EA				shr		edx,cl
007F				L$9:
007F  86 D9				xchg		cl,bl
0081				L$10:
0081  D0 E9				shr		cl,0x01
0083  72 12				jb		L$12
0085  01 D0				add		eax,edx
0087  73 0C				jae		L$11
0089  D1 D8				rcr		eax,0x01
008B  FE C5				inc		ch
008D  75 06				jne		L$11
008F  D0 C9				ror		cl,0x01
0091  D1 D8				rcr		eax,0x01
0093  EB 3F				jmp		L$18
0095				L$11:
0095  EB 13				jmp		L$14
0097				L$12:
0097  D0 E9				shr		cl,0x01
0099  29 D0				sub		eax,edx
009B  73 06				jae		L$13
009D  FE C1				inc		cl
009F  F7 D8				neg		eax
00A1  EB 07				jmp		L$14
00A3				L$13:
00A3  09 C0				or		eax,eax
00A5  75 03				jne		L$14
00A7  5B				pop		ebx
00A8  59				pop		ecx
00A9  C3				ret		
00AA				L$14:
00AA  05 80 00 00 00			add		eax,0x00000080
00AF  B0 00				mov		al,0x00
00B1  73 04				jae		L$15
00B3  FE C5				inc		ch
00B5  EB 0A				jmp		L$16
00B7				L$15:
00B7  01 C0				add		eax,eax
00B9  72 06				jb		L$16
00BB  FE CD				dec		ch
00BD  75 F8				jne		L$15
00BF  EB 0C				jmp		L$17
00C1				L$16:
00C1  88 E8				mov		al,ch
00C3  C1 C8 08				ror		eax,0x08
00C6  D0 C9				ror		cl,0x01
00C8  D1 D8				rcr		eax,0x01
00CA  5B				pop		ebx
00CB  59				pop		ecx
00CC  C3				ret		
00CD				L$17:
00CD  5B				pop		ebx
00CE  59				pop		ecx
00CF  E9 00 00 00 00			jmp		F4UnderFlow
00D4				L$18:
00D4  5B				pop		ebx
00D5  59				pop		ecx
00D6  E9 00 00 00 00			jmp		F4OverFlow

Routine Size: 209 bytes,    Routine Base: _TEXT + 000A

00DB				__FSM:
00DB  09 C0				or		eax,eax
00DD  74 0A				je		L$19
00DF  09 D2				or		edx,edx
00E1  74 06				je		L$19
00E3  FF 25 04 00 00 00			jmp		dword ptr DGROUP:L$42
00E9				L$19:
00E9  29 C0				sub		eax,eax
00EB  C3				ret		
00EC				L$20:
00EC  55				push		ebp
00ED  89 E5				mov		ebp,esp
00EF  50				push		eax
00F0  D9 45 FC				fld		dword ptr -0x4[ebp]
00F3  52				push		edx
00F4  D8 4D F8				fmul		dword ptr -0x8[ebp]
00F7  E9 2A FF FF FF			jmp		L$4
00FC				L$21:
00FC  51				push		ecx
00FD  01 C0				add		eax,eax
00FF  11 C9				adc		ecx,ecx
0101  01 D2				add		edx,edx
0103  83 D1 00				adc		ecx,0x00000000
0106  D1 C9				ror		ecx,0x01
0108  C1 C0 08				rol		eax,0x08
010B  C1 C2 08				rol		edx,0x08
010E  2C 7F				sub		al,0x7f
0110  80 EA 7F				sub		dl,0x7f
0113  00 C2				add		dl,al
0115  71 04				jno		L$22
0117  78 41				js		L$25
0119  EB 39				jmp		L$24
011B				L$22:
011B  80 FA 81				cmp		dl,0x81
011E  7E 34				jle		L$24
0120  80 C2 80				add		dl,0x80
0123  88 D1				mov		cl,dl
0125  B0 00				mov		al,0x00
0127  B2 00				mov		dl,0x00
0129  F9				stc		
012A  D1 D8				rcr		eax,0x01
012C  F9				stc		
012D  D1 DA				rcr		edx,0x01
012F  F7 E2				mul		edx
0131  09 D2				or		edx,edx
0133  78 04				js		L$23
0135  01 D2				add		edx,edx
0137  FE C9				dec		cl
0139				L$23:
0139  C1 FA 08				sar		edx,0x08
013C  83 D2 00				adc		edx,0x00000000
013F  80 D1 00				adc		cl,0x00
0142  74 16				je		L$25
0144  C1 E2 09				shl		edx,0x09
0147  88 CA				mov		dl,cl
0149  C1 CA 08				ror		edx,0x08
014C  01 C9				add		ecx,ecx
014E  D1 DA				rcr		edx,0x01
0150  89 D0				mov		eax,edx
0152  59				pop		ecx
0153  C3				ret		
0154				L$24:
0154  59				pop		ecx
0155  E9 00 00 00 00			jmp		F4UnderFlow
015A				L$25:
015A  89 C8				mov		eax,ecx
015C  59				pop		ecx
015D  E9 00 00 00 00			jmp		F4OverFlow

Routine Size: 135 bytes,    Routine Base: _TEXT + 00DB

0162				__FSD:
0162  FF 25 08 00 00 00			jmp		dword ptr DGROUP:L$43
0168				L$26:
0168  55				push		ebp
0169  89 E5				mov		ebp,esp
016B  50				push		eax
016C  D9 45 FC				fld		dword ptr -0x4[ebp]
016F  52				push		edx
0170  D8 75 F8				fdiv		dword ptr -0x8[ebp]
0173  E9 AE FE FF FF			jmp		L$4
0178				L$27:
0178  01 D2				add		edx,edx
017A  75 05				jne		L$28
017C  E9 00 00 00 00			jmp		F4DivZero
0181				L$28:
0181  51				push		ecx
0182  11 C9				adc		ecx,ecx
0184  01 C0				add		eax,eax
0186  75 02				jne		L$29
0188  59				pop		ecx
0189  C3				ret		
018A				L$29:
018A  83 D1 00				adc		ecx,0x00000000
018D  D1 C9				ror		ecx,0x01
018F  C1 C0 08				rol		eax,0x08
0192  C1 C2 08				rol		edx,0x08
0195  2C 7F				sub		al,0x7f
0197  80 EA 7F				sub		dl,0x7f
019A  28 D0				sub		al,dl
019C  71 08				jno		L$30
019E  79 4A				jns		L$33
01A0  01 C9				add		ecx,ecx
01A2  D1 D8				rcr		eax,0x01
01A4  EB 4A				jmp		L$34
01A6				L$30:
01A6  3C 81				cmp		al,0x81
01A8  7E 40				jle		L$33
01AA  04 7F				add		al,0x7f
01AC  88 C5				mov		ch,al
01AE  B0 00				mov		al,0x00
01B0  B2 00				mov		dl,0x00
01B2  F9				stc		
01B3  D1 DA				rcr		edx,0x01
01B5  F9				stc		
01B6  D1 D8				rcr		eax,0x01
01B8  51				push		ecx
01B9  89 D1				mov		ecx,edx
01BB  89 C2				mov		edx,eax
01BD  29 C0				sub		eax,eax
01BF  D1 EA				shr		edx,0x01
01C1  F7 F1				div		ecx
01C3  59				pop		ecx
01C4  09 C0				or		eax,eax
01C6  78 04				js		L$31
01C8  01 C0				add		eax,eax
01CA  FE CD				dec		ch
01CC				L$31:
01CC  C1 F8 08				sar		eax,0x08
01CF  83 D0 00				adc		eax,0x00000000
01D2  73 08				jae		L$32
01D4  FE C5				inc		ch
01D6  75 04				jne		L$32
01D8  89 C8				mov		eax,ecx
01DA  EB 14				jmp		L$34
01DC				L$32:
01DC  C1 E0 09				shl		eax,0x09
01DF  88 E8				mov		al,ch
01E1  C1 C8 08				ror		eax,0x08
01E4  01 C9				add		ecx,ecx
01E6  D1 D8				rcr		eax,0x01
01E8  59				pop		ecx
01E9  C3				ret		
01EA				L$33:
01EA  59				pop		ecx
01EB  E9 00 00 00 00			jmp		F4UnderFlow
01F0				L$34:
01F0  59				pop		ecx
01F1  E9 00 00 00 00			jmp		F4OverFlow
01F6				L$35:
01F6  E8 1C 00 00 00			call		L$38
01FB  FF 25 00 00 00 00			jmp		dword ptr DGROUP:L$41
0201				L$36:
0201  E8 11 00 00 00			call		L$38
0206  FF 25 04 00 00 00			jmp		dword ptr DGROUP:L$42
020C				L$37:
020C  E8 06 00 00 00			call		L$38
0211  FF 25 08 00 00 00			jmp		dword ptr DGROUP:L$43
0217				L$38:
0217  50				push		eax
0218  80 3D 00 00 00 00 00		cmp		byte ptr DGROUP:__real87,0x00
021F  74 20				je		L$39
0221  B8 1B 00 00 00			mov		eax,offset L$3
0226  A3 00 00 00 00			mov		dword ptr DGROUP:L$41,eax
022B  B8 EC 00 00 00			mov		eax,offset L$20
0230  A3 04 00 00 00			mov		dword ptr DGROUP:L$42,eax
0235  B8 68 01 00 00			mov		eax,offset L$26
023A  A3 08 00 00 00			mov		dword ptr DGROUP:L$43,eax
023F  EB 1E				jmp		L$40
0241				L$39:
0241  B8 39 00 00 00			mov		eax,offset L$6
0246  A3 00 00 00 00			mov		dword ptr DGROUP:L$41,eax
024B  B8 FC 00 00 00			mov		eax,offset L$21
0250  A3 04 00 00 00			mov		dword ptr DGROUP:L$42,eax
0255  B8 78 01 00 00			mov		eax,offset L$27
025A  A3 08 00 00 00			mov		dword ptr DGROUP:L$43,eax
025F				L$40:
025F  58				pop		eax
0260  C3				ret		

Routine Size: 255 bytes,    Routine Base: _TEXT + 0162

No disassembly errors

Segment: _DATA DWORD USE32 0000000C bytes
0000				L$41:
0000  F6 01 00 00                                     DD	offset L$35
0004				L$42:
0004  01 02 00 00                                     DD	offset L$36
0008				L$43:
0008  0C 02 00 00                                     DD	offset L$37

