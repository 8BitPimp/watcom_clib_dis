Module: div386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000001F7 bytes
0000				__FDD:
0000  09 DB				or		ebx,ebx
0002  75 0B				jne		L$2
0004  01 C9				add		ecx,ecx
0006  75 05				jne		L$1
0008  E9 00 00 00 00			jmp		F8DivZero
000D				L$1:
000D  D1 D9				rcr		ecx,0x01
000F				L$2:
000F  09 C0				or		eax,eax
0011  75 07				jne		L$4
0013  01 D2				add		edx,edx
0015  75 01				jne		L$3
0017  C3				ret		
0018				L$3:
0018  D1 DA				rcr		edx,0x01
001A				L$4:
001A  80 3D 00 00 00 00 00		cmp		byte ptr DGROUP:__real87,0x00
0021  74 21				je		L$6
0023  52				push		edx
0024  50				push		eax
0025  DD 04 24				fld		qword ptr [esp]
0028  51				push		ecx
0029  53				push		ebx
002A  DC 34 24				fdiv		qword ptr [esp]
002D  DD 5C 24 08			fstp		qword ptr 0x8[esp]
0031  83 C4 08				add		esp,0x00000008
0034  9B				fwait		
0035  58				pop		eax
0036  5A				pop		edx
0037  81 FA 00 00 00 80			cmp		edx,0x80000000
003D  75 04				jne		L$5
003F  29 D2				sub		edx,edx
0041  89 D0				mov		eax,edx
0043				L$5:
0043  C3				ret		
0044				L$6:
0044  55				push		ebp
0045  89 E5				mov		ebp,esp
0047  57				push		edi
0048  56				push		esi
0049  89 D7				mov		edi,edx
004B  89 CE				mov		esi,ecx
004D  C1 FF 14				sar		edi,0x14
0050  C1 F9 14				sar		ecx,0x14
0053  81 E7 FF 07 00 80			and		edi,0x800007ff
0059  81 E1 FF 07 00 80			and		ecx,0x800007ff
005F  C1 C7 10				rol		edi,0x10
0062  C1 C1 10				rol		ecx,0x10
0065  66 01 CF				add		di,cx
0068  C1 C7 10				rol		edi,0x10
006B  C1 C1 10				rol		ecx,0x10
006E  81 E2 FF FF 0F 00			and		edx,0x000fffff
0074  81 E6 FF FF 0F 00			and		esi,0x000fffff
007A  66 09 FF				or		di,di
007D  74 08				je		L$7
007F  81 CA 00 00 10 00			or		edx,0x00100000
0085  EB 0E				jmp		L$8
0087				L$7:
0087  01 C0				add		eax,eax
0089  11 D2				adc		edx,edx
008B  66 4F				dec		di
008D  F7 C2 00 00 10 00			test		edx,0x00100000
0093  74 F2				je		L$7
0095				L$8:
0095  66 09 C9				or		cx,cx
0098  74 08				je		L$9
009A  81 CE 00 00 10 00			or		esi,0x00100000
00A0  EB 0E				jmp		L$10
00A2				L$9:
00A2  01 DB				add		ebx,ebx
00A4  11 F6				adc		esi,esi
00A6  66 49				dec		cx
00A8  F7 C6 00 00 10 00			test		esi,0x00100000
00AE  74 F2				je		L$9
00B0				L$10:
00B0  66 29 CF				sub		di,cx
00B3  66 81 C7 FF 03			add		di,0x03ff
00B8  78 11				js		L$11
00BA  66 81 FF FF 07			cmp		di,0x07ff
00BF  72 0A				jb		L$11
00C1  89 C8				mov		eax,ecx
00C3  5E				pop		esi
00C4  5F				pop		edi
00C5  5D				pop		ebp
00C6  E9 00 00 00 00			jmp		F8OverFlow
00CB				L$11:
00CB  66 83 FF CC			cmp		di,0xffcc
00CF  7D 08				jge		L$12
00D1  5E				pop		esi
00D2  5F				pop		edi
00D3  5D				pop		ebp
00D4  E9 00 00 00 00			jmp		F8UnderFlow
00D9				L$12:
00D9  57				push		edi
00DA  B1 0B				mov		cl,0x0b
00DC  0F A5 C2				shld		edx,eax,cl
00DF  0F A5 E8				shld		eax,ebp,cl
00E2  25 00 F8 FF FF			and		eax,0xfffff800
00E7  0F A5 DE				shld		esi,ebx,cl
00EA  0F A5 EB				shld		ebx,ebp,cl
00ED  81 E3 00 F8 FF FF			and		ebx,0xfffff800
00F3  56				push		esi
00F4  53				push		ebx
00F5  89 F1				mov		ecx,esi
00F7  89 D7				mov		edi,edx
00F9  89 C6				mov		esi,eax
00FB  29 C0				sub		eax,eax
00FD  39 D1				cmp		ecx,edx
00FF  77 03				ja		L$13
0101  29 CA				sub		edx,ecx
0103  40				inc		eax
0104				L$13:
0104  50				push		eax
0105  89 F0				mov		eax,esi
0107  F7 F1				div		ecx
0109  50				push		eax
010A  93				xchg		eax,ebx
010B  F7 E3				mul		ebx
010D  91				xchg		eax,ecx
010E  87 D3				xchg		ebx,edx
0110  F7 E2				mul		edx
0112  01 D8				add		eax,ebx
0114  83 D2 00				adc		edx,0x00000000
0117  8B 5D EC				mov		ebx,dword ptr -0x14[ebp]
011A  F6 45 E8 01			test		byte ptr -0x18[ebp],0x01
011E  74 05				je		L$14
0120  01 D8				add		eax,ebx
0122  13 55 F0				adc		edx,dword ptr -0x10[ebp]
0125				L$14:
0125  F7 D9				neg		ecx
0127  19 C6				sbb		esi,eax
0129  19 D7				sbb		edi,edx
012B  74 12				je		L$16
012D				L$15:
012D  83 6D E4 01			sub		dword ptr -0x1c[ebp],0x00000001
0131  83 5D E8 00			sbb		dword ptr -0x18[ebp],0x00000000
0135  01 D9				add		ecx,ebx
0137  13 75 F0				adc		esi,dword ptr -0x10[ebp]
013A  83 D7 00				adc		edi,0x00000000
013D  75 EE				jne		L$15
013F				L$16:
013F  89 F7				mov		edi,esi
0141  89 CE				mov		esi,ecx
0143  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
0146  39 F9				cmp		ecx,edi
0148  77 0A				ja		L$17
014A  29 CF				sub		edi,ecx
014C  83 45 E4 01			add		dword ptr -0x1c[ebp],0x00000001
0150  83 55 E8 00			adc		dword ptr -0x18[ebp],0x00000000
0154				L$17:
0154  89 FA				mov		edx,edi
0156  89 F0				mov		eax,esi
0158  F7 F1				div		ecx
015A  50				push		eax
015B  09 C0				or		eax,eax
015D  74 2C				je		L$19
015F  93				xchg		eax,ebx
0160  F7 E3				mul		ebx
0162  91				xchg		eax,ecx
0163  87 D3				xchg		ebx,edx
0165  F7 E2				mul		edx
0167  01 D8				add		eax,ebx
0169  83 D2 00				adc		edx,0x00000000
016C  F7 D9				neg		ecx
016E  19 C6				sbb		esi,eax
0170  19 D7				sbb		edi,edx
0172  74 17				je		L$19
0174				L$18:
0174  83 6D E0 01			sub		dword ptr -0x20[ebp],0x00000001
0178  83 5D E4 00			sbb		dword ptr -0x1c[ebp],0x00000000
017C  83 5D E8 00			sbb		dword ptr -0x18[ebp],0x00000000
0180  03 4D EC				add		ecx,dword ptr -0x14[ebp]
0183  13 75 F0				adc		esi,dword ptr -0x10[ebp]
0186  83 D7 00				adc		edi,0x00000000
0189  75 E9				jne		L$18
018B				L$19:
018B  58				pop		eax
018C  5A				pop		edx
018D  5B				pop		ebx
018E  83 C4 08				add		esp,0x00000008
0191  5F				pop		edi
0192  66 4F				dec		di
0194  D1 EB				shr		ebx,0x01
0196  73 05				jae		L$20
0198  D1 DA				rcr		edx,0x01
019A  D1 D8				rcr		eax,0x01
019C  47				inc		edi
019D				L$20:
019D  29 F6				sub		esi,esi
019F  B1 0B				mov		cl,0x0b
01A1  0F AD D0				shrd		eax,edx,cl
01A4  D1 DE				rcr		esi,0x01
01A6  0F AD F2				shrd		edx,esi,cl
01A9  81 CA 00 00 F0 FF			or		edx,0xfff00000
01AF  01 F6				add		esi,esi
01B1  83 D0 00				adc		eax,0x00000000
01B4  83 D2 00				adc		edx,0x00000000
01B7  83 D7 00				adc		edi,0x00000000
01BA  66 09 FF				or		di,di
01BD  7F 1D				jg		L$23
01BF  75 04				jne		L$21
01C1  B1 01				mov		cl,0x01
01C3  EB 06				jmp		L$22
01C5				L$21:
01C5  66 F7 DF				neg		di
01C8  66 89 F9				mov		cx,di
01CB				L$22:
01CB  81 E2 FF FF 1F 00			and		edx,0x001fffff
01D1  29 DB				sub		ebx,ebx
01D3  0F AD D0				shrd		eax,edx,cl
01D6  0F AD DA				shrd		edx,ebx,cl
01D9  66 29 FF				sub		di,di
01DC				L$23:
01DC  81 E2 FF FF 0F 00			and		edx,0x000fffff
01E2  89 FE				mov		esi,edi
01E4  C1 CF 0B				ror		edi,0x0b
01E7  01 F6				add		esi,esi
01E9  D1 DF				rcr		edi,0x01
01EB  81 E7 00 00 F0 FF			and		edi,0xfff00000
01F1  09 FA				or		edx,edi
01F3  5E				pop		esi
01F4  5F				pop		edi
01F5  5D				pop		ebp
01F6  C3				ret		

Routine Size: 503 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000000 bytes

