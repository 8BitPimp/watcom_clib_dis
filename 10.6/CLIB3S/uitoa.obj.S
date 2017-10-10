Module: uitoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B4 bytes
0000				Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025				_uutoa:
0025  53				push		ebx
0026  56				push		esi
0027  57				push		edi
0028  83 EC 28				sub		esp,0x00000028
002B  8B 54 24 38			mov		edx,dword ptr 0x38[esp]
002F  8B 7C 24 40			mov		edi,dword ptr 0x40[esp]
0033  8B 74 24 3C			mov		esi,dword ptr 0x3c[esp]
0037  30 E4				xor		ah,ah
0039  8D 4C 24 01			lea		ecx,0x1[esp]
003D  88 24 24				mov		byte ptr [esp],ah
0040				L$1:
0040  8D 5C 24 24			lea		ebx,0x24[esp]
0044  89 D0				mov		eax,edx
0046  89 7C 24 24			mov		dword ptr 0x24[esp],edi
004A  31 D2				xor		edx,edx
004C  F7 33				div		dword ptr [ebx]
004E  89 03				mov		dword ptr [ebx],eax
0050  2E 8A 92 00 00 00 00		mov		dl,byte ptr cs:Alphabet[edx]
0057  88 11				mov		byte ptr [ecx],dl
0059  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
005D  41				inc		ecx
005E  85 D2				test		edx,edx
0060  75 DE				jne		L$1
0062				L$2:
0062  49				dec		ecx
0063  30 F6				xor		dh,dh
0065  8A 11				mov		dl,byte ptr [ecx]
0067  66 89 16				mov		word ptr [esi],dx
006A  83 C6 02				add		esi,0x00000002
006D  66 85 D2				test		dx,dx
0070  75 F0				jne		L$2
0072  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
0076  83 C4 28				add		esp,0x00000028
0079  5F				pop		edi
007A  5E				pop		esi
007B  5B				pop		ebx
007C  C3				ret		

Routine Size: 88 bytes,    Routine Base: _TEXT + 0025

007D				_uitoa:
007D  53				push		ebx
007E  56				push		esi
007F  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0083  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0087  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
008B  89 D8				mov		eax,ebx
008D  83 F9 0A				cmp		ecx,0x0000000a
0090  75 0E				jne		L$3
0092  85 D2				test		edx,edx
0094  7D 0A				jge		L$3
0096  F7 DA				neg		edx
0098  8D 43 02				lea		eax,0x2[ebx]
009B  66 C7 03 2D 00			mov		word ptr [ebx],0x002d
00A0				L$3:
00A0  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
00A4  56				push		esi
00A5  50				push		eax
00A6  52				push		edx
00A7  E8 00 00 00 00			call		_uutoa
00AC  83 C4 0C				add		esp,0x0000000c
00AF  89 D8				mov		eax,ebx
00B1  5E				pop		esi
00B2  5B				pop		ebx
00B3  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 007D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

