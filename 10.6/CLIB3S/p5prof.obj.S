Module: p5prof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 00000156 bytes
0000				fini:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  81 EC 40 02 00 00			sub		esp,0x00000240
000B  8C D8				mov		eax,ds
000D  89 E7				mov		edi,esp
000F  8E C0				mov		es,eax
0011  BE 00 00 00 00			mov		esi,offset DGROUP:L$8
0016  BD 00 00 00 00			mov		ebp,offset _start_TI
001B  A1 00 00 00 00			mov		eax,dword ptr _argv
0020  A5				movsd		
0021  A5				movsd		
0022  A5				movsd		
0023  BA 00 00 00 00			mov		edx,offset _end_TI
0028  8B 18				mov		ebx,dword ptr [eax]
002A  89 94 24 3C 02 00 00		mov		dword ptr 0x23c[esp],edx
0031  85 DB				test		ebx,ebx
0033  74 55				je		L$1
0035  6A 00				push		0x00000000
0037  8D 94 24 34 02 00 00		lea		edx,0x234[esp]
003E  52				push		edx
003F  8D 94 24 3C 02 00 00		lea		edx,0x23c[esp]
0046  52				push		edx
0047  8D 94 24 44 02 00 00		lea		edx,0x244[esp]
004E  52				push		edx
004F  8D 94 24 18 01 00 00		lea		edx,0x118[esp]
0056  52				push		edx
0057  53				push		ebx
0058  E8 00 00 00 00			call		_splitpath2
005D  83 C4 18				add		esp,0x00000018
0060  68 0C 00 00 00			push		offset DGROUP:L$9
0065  8B B4 24 34 02 00 00		mov		esi,dword ptr 0x234[esp]
006C  56				push		esi
006D  8B BC 24 3C 02 00 00		mov		edi,dword ptr 0x23c[esp]
0074  57				push		edi
0075  8B 84 24 44 02 00 00		mov		eax,dword ptr 0x244[esp]
007C  50				push		eax
007D  8D 44 24 10			lea		eax,0x10[esp]
0081  50				push		eax
0082  E8 00 00 00 00			call		_makepath
0087  83 C4 14				add		esp,0x00000014
008A				L$1:
008A  68 11 00 00 00			push		offset DGROUP:L$10
008F  8D 44 24 04			lea		eax,0x4[esp]
0093  50				push		eax
0094  E8 00 00 00 00			call		fopen
0099  83 C4 08				add		esp,0x00000008
009C  89 C6				mov		esi,eax
009E  85 C0				test		eax,eax
00A0  0F 84 A4 00 00 00			je		L$7
00A6				L$2:
00A6  8B 94 24 3C 02 00 00		mov		edx,dword ptr 0x23c[esp]
00AD  8D 45 10				lea		eax,0x10[ebp]
00B0  39 D0				cmp		eax,edx
00B2  0F 83 89 00 00 00			jae		L$6
00B8  8B 45 08				mov		eax,dword ptr 0x8[ebp]
00BB  89 84 24 28 02 00 00		mov		dword ptr 0x228[esp],eax
00C2  BB 14 00 00 00			mov		ebx,0x00000014
00C7  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
00CA  8D 94 24 10 02 00 00		lea		edx,0x210[esp]
00D1  89 84 24 2C 02 00 00		mov		dword ptr 0x22c[esp],eax
00D8  8D 84 24 28 02 00 00		lea		eax,0x228[esp]
00DF  E8 00 00 00 00			call		__Bin2String
00E4  31 C0				xor		eax,eax
00E6  EB 17				jmp		L$4
00E8				L$3:
00E8  31 D2				xor		edx,edx
00EA  8A 94 04 10 02 00 00		mov		dl,byte ptr 0x210[esp+eax]
00F1  83 FA 30				cmp		edx,0x00000030
00F4  75 13				jne		L$5
00F6  40				inc		eax
00F7  C6 84 04 0F 02 00 00 20		mov		byte ptr 0x20f[esp+eax],0x20
00FF				L$4:
00FF  80 BC 04 11 02 00 00 00		cmp		byte ptr 0x211[esp+eax],0x00
0107  75 DF				jne		L$3
0109				L$5:
0109  8D 7D 10				lea		edi,0x10[ebp]
010C  57				push		edi
010D  8B 5D 00				mov		ebx,dword ptr [ebp]
0110  53				push		ebx
0111  8D 84 24 18 02 00 00		lea		eax,0x218[esp]
0118  50				push		eax
0119  68 15 00 00 00			push		offset DGROUP:L$11
011E  56				push		esi
011F  E8 00 00 00 00			call		fprintf
0124  83 C4 14				add		esp,0x00000014
0127  06				push		es
0128  8C D8				mov		eax,ds
012A  8E C0				mov		es,eax
012C  29 C9				sub		ecx,ecx
012E  49				dec		ecx
012F  31 C0				xor		eax,eax
0131  F2 AE				repne scasb	
0133  F7 D1				not		ecx
0135  49				dec		ecx
0136  07				pop		es
0137  83 C1 11				add		ecx,0x00000011
013A  01 CD				add		ebp,ecx
013C  E9 65 FF FF FF			jmp		L$2
0141				L$6:
0141  56				push		esi
0142  E8 00 00 00 00			call		fclose
0147  83 C4 04				add		esp,0x00000004
014A				L$7:
014A  81 C4 40 02 00 00			add		esp,0x00000240
0150  5D				pop		ebp
0151  07				pop		es
0152  5F				pop		edi
0153  5E				pop		esi
0154  5B				pop		ebx
0155  C3				ret		

Routine Size: 342 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000022 bytes
0000				L$8:
0000  72 65 73 75 6C 74 73 2E 70 72 66 00             results.prf.
000C				L$9:
000C  2E 70 72 66 00                                  .prf.
0011				L$10:
0011  77 74 2B 00                                     wt+.
0015				L$11:
0015  25 73 25 31 31 6C 75 20 20 25 73 0A 00          %s%11lu  %s..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				__p5_profile:
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset fini

Segment: YIE BYTE USE32 00000000 bytes

