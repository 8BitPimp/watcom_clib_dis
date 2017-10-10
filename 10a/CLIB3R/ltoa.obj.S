Module: ltoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000089 bytes
0000				_Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025				ultoa_:
0025  51				push		ecx
0026  56				push		esi
0027  55				push		ebp
0028  83 EC 28				sub		esp,0x00000028
002B  52				push		edx
002C  89 DD				mov		ebp,ebx
002E  89 D6				mov		esi,edx
0030  30 D2				xor		dl,dl
0032  8D 4C 24 05			lea		ecx,0x5[esp]
0036  88 54 24 04			mov		byte ptr 0x4[esp],dl
003A				L$1:
003A  8D 5C 24 28			lea		ebx,0x28[esp]
003E  89 6C 24 28			mov		dword ptr 0x28[esp],ebp
0042  31 D2				xor		edx,edx
0044  F7 33				div		dword ptr [ebx]
0046  89 13				mov		dword ptr [ebx],edx
0048  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
004C  2E 8A 92 00 00 00 00		mov		dl,byte ptr cs:_Alphabet[edx]
0053  88 11				mov		byte ptr [ecx],dl
0055  41				inc		ecx
0056  85 C0				test		eax,eax
0058  75 E0				jne		L$1
005A				L$2:
005A  49				dec		ecx
005B  8A 01				mov		al,byte ptr [ecx]
005D  88 06				mov		byte ptr [esi],al
005F  46				inc		esi
0060  84 C0				test		al,al
0062  75 F6				jne		L$2
0064  8B 04 24				mov		eax,dword ptr [esp]
0067  83 C4 2C				add		esp,0x0000002c
006A  5D				pop		ebp
006B  5E				pop		esi
006C  59				pop		ecx
006D  C3				ret		

Routine Size: 73 bytes,    Routine Base: _TEXT + 0025

006E				_ltoa_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 006E

006E				ltoa_:
006E  51				push		ecx
006F  89 D1				mov		ecx,edx
0071  83 FB 0A				cmp		ebx,0x0000000a
0074  75 0A				jne		L$3
0076  85 C0				test		eax,eax
0078  7D 06				jge		L$3
007A  F7 D8				neg		eax
007C  C6 02 2D				mov		byte ptr [edx],0x2d
007F  42				inc		edx
0080				L$3:
0080  E8 00 00 00 00			call		ultoa_
0085  89 C8				mov		eax,ecx
0087  59				pop		ecx
0088  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 006E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

