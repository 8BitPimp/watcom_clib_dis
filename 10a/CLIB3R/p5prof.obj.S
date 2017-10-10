Module: p5prof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 000000B7 bytes
0000				fini_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  81 EC 08 03 00 00			sub		esp,0x00000308
000B  6A 00				push		0x00000000
000D  8D 94 24 08 03 00 00		lea		edx,0x308[esp]
0014  A1 00 00 00 00			mov		eax,dword ptr ____Argv
0019  8D 9C 24 08 01 00 00		lea		ebx,0x108[esp]
0020  8D 8C 24 08 02 00 00		lea		ecx,0x208[esp]
0027  8B 00				mov		eax,dword ptr [eax]
0029  E8 00 00 00 00			call		_splitpath_
002E  68 00 00 00 00			push		offset DGROUP:L$4
0033  8D 44 24 04			lea		eax,0x4[esp]
0037  8D 94 24 08 03 00 00		lea		edx,0x308[esp]
003E  8D 9C 24 08 01 00 00		lea		ebx,0x108[esp]
0045  8D 8C 24 08 02 00 00		lea		ecx,0x208[esp]
004C  E8 00 00 00 00			call		_makepath_
0051  89 E0				mov		eax,esp
0053  BA 05 00 00 00			mov		edx,offset DGROUP:L$5
0058  BE 00 00 00 00			mov		esi,offset __start_TI
005D  E8 00 00 00 00			call		fopen_
0062  89 C2				mov		edx,eax
0064  85 C0				test		eax,eax
0066  74 43				je		L$3
0068				L$1:
0068  81 FE 00 00 00 00			cmp		esi,offset __end_TI
006E  73 34				jae		L$2
0070  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
0073  53				push		ebx
0074  8B 4E 0C				mov		ecx,dword ptr 0xc[esi]
0077  51				push		ecx
0078  8B 3E				mov		edi,dword ptr [esi]
007A  57				push		edi
007B  8D 7E 10				lea		edi,0x10[esi]
007E  57				push		edi
007F  68 09 00 00 00			push		offset DGROUP:L$6
0084  52				push		edx
0085  E8 00 00 00 00			call		fprintf_
008A  83 C4 18				add		esp,0x00000018
008D  06				push		es
008E  8C D8				mov		eax,ds
0090  8E C0				mov		es,eax
0092  29 C9				sub		ecx,ecx
0094  49				dec		ecx
0095  31 C0				xor		eax,eax
0097  F2 AE				repne scasb	
0099  F7 D1				not		ecx
009B  49				dec		ecx
009C  07				pop		es
009D  83 C1 11				add		ecx,0x00000011
00A0  01 CE				add		esi,ecx
00A2  EB C4				jmp		L$1
00A4				L$2:
00A4  89 D0				mov		eax,edx
00A6  E8 00 00 00 00			call		fclose_
00AB				L$3:
00AB  81 C4 08 03 00 00			add		esp,0x00000308
00B1  5F				pop		edi
00B2  5E				pop		esi
00B3  5A				pop		edx
00B4  59				pop		ecx
00B5  5B				pop		ebx
00B6  C3				ret		

Routine Size: 183 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000020 bytes
0000				L$4:
0000  2E 70 72 66 00                                  .prf.
0005				L$5:
0005  77 74 2B 00                                     wt+.
0009				L$6:
0009  25 32 30 2E 32 30 73 09 25 30 38 78 09 25 30 38 %20.20s.%08x.%08
0019  78 25 30 38 78 0A 00                            x%08x..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				__p5_profile:
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset fini_

Segment: YIE BYTE USE32 00000000 bytes

