Module: ltoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C4 bytes
0000				Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025				ultoa:
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
0061  8A 01				mov		al,byte ptr [ecx]
0063  88 06				mov		byte ptr [esi],al
0065  46				inc		esi
0066  84 C0				test		al,al
0068  75 F6				jne		L$2
006A  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
006E  83 C4 28				add		esp,0x00000028
0071  5F				pop		edi
0072  5E				pop		esi
0073  5B				pop		ebx
0074  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 0025

0075				ltoa:
0075  53				push		ebx
0076  56				push		esi
0077  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
007B  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
007F  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0083  89 D8				mov		eax,ebx
0085  83 F9 0A				cmp		ecx,0x0000000a
0088  75 0C				jne		L$3
008A  85 D2				test		edx,edx
008C  7D 08				jge		L$3
008E  F7 DA				neg		edx
0090  8D 43 01				lea		eax,0x1[ebx]
0093  C6 03 2D				mov		byte ptr [ebx],0x2d
0096				L$3:
0096  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
009A  56				push		esi
009B  50				push		eax
009C  52				push		edx
009D  E8 00 00 00 00			call		ultoa
00A2  83 C4 0C				add		esp,0x0000000c
00A5  89 D8				mov		eax,ebx
00A7  5E				pop		esi
00A8  5B				pop		ebx
00A9  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0075

00AA				_ltoa:
00AA  53				push		ebx
00AB  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
00AF  52				push		edx
00B0  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
00B4  53				push		ebx
00B5  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
00B9  51				push		ecx
00BA  E8 00 00 00 00			call		ltoa
00BF  83 C4 0C				add		esp,0x0000000c
00C2  5B				pop		ebx
00C3  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 00AA

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

