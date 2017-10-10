Module: ultoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B2 bytes
0000				Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025				_uultoa:
0025  53				push		ebx
0026  56				push		esi
0027  57				push		edi
0028  83 EC 28				sub		esp,0x00000028
002B  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
002F  8B 7C 24 40			mov		edi,dword ptr 0x40[esp]
0033  8B 74 24 3C			mov		esi,dword ptr 0x3c[esp]
0037  30 D2				xor		dl,dl
0039  8D 4C 24 01			lea		ecx,0x1[esp]
003D  88 14 24				mov		byte ptr [esp],dl
0040				L$1:
0040  8D 5C 24 24			lea		ebx,0x24[esp]
0044  89 7C 24 24			mov		dword ptr 0x24[esp],edi
0048  31 D2				xor		edx,edx
004A  F7 33				div		dword ptr [ebx]
004C  89 13				mov		dword ptr [ebx],edx
004E  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
0052  2E 8A 92 00 00 00 00		mov		dl,byte ptr cs:Alphabet[edx]
0059  88 11				mov		byte ptr [ecx],dl
005B  41				inc		ecx
005C  85 C0				test		eax,eax
005E  75 E0				jne		L$1
0060				L$2:
0060  49				dec		ecx
0061  30 E4				xor		ah,ah
0063  8A 01				mov		al,byte ptr [ecx]
0065  66 89 06				mov		word ptr [esi],ax
0068  83 C6 02				add		esi,0x00000002
006B  66 85 C0				test		ax,ax
006E  75 F0				jne		L$2
0070  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
0074  83 C4 28				add		esp,0x00000028
0077  5F				pop		edi
0078  5E				pop		esi
0079  5B				pop		ebx
007A  C3				ret		

Routine Size: 86 bytes,    Routine Base: _TEXT + 0025

007B				_ultoa:
007B  53				push		ebx
007C  56				push		esi
007D  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0081  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0085  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0089  89 D8				mov		eax,ebx
008B  83 F9 0A				cmp		ecx,0x0000000a
008E  75 0E				jne		L$3
0090  85 D2				test		edx,edx
0092  7D 0A				jge		L$3
0094  F7 DA				neg		edx
0096  8D 43 02				lea		eax,0x2[ebx]
0099  66 C7 03 2D 00			mov		word ptr [ebx],0x002d
009E				L$3:
009E  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
00A2  56				push		esi
00A3  50				push		eax
00A4  52				push		edx
00A5  E8 00 00 00 00			call		_uultoa
00AA  83 C4 0C				add		esp,0x0000000c
00AD  89 D8				mov		eax,ebx
00AF  5E				pop		esi
00B0  5B				pop		ebx
00B1  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 007B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

