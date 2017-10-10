Module: fstat386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000059 bytes
0000				F8UnderFlow:
0000  29 D2				sub		edx,edx

Routine Size: 2 bytes,    Routine Base: _TEXT + 0000

0002				F4UnderFlow:
0002  29 C0				sub		eax,eax
0004  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0002

0005				F8DivZero:
0005  B8 83 00 00 00			mov		eax,0x00000083
000A  E8 00 00 00 00			call		__FPE_exception_
000F  EB 11				jmp		L$1

Routine Size: 12 bytes,    Routine Base: _TEXT + 0005

0011				_F8RetInf_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 0011

0011				F8RetInf_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 0011

0011				F8OverFlow:
0011  50				push		eax
0012  E8 00 00 00 00			call		__set_ERANGE
0017  B8 84 00 00 00			mov		eax,0x00000084
001C  E8 00 00 00 00			call		__FPE_exception_
0021  58				pop		eax
0022				L$1:
0022  25 00 00 00 80			and		eax,0x80000000
0027  0D 00 00 F0 7F			or		eax,0x7ff00000
002C  89 C2				mov		edx,eax
002E  29 C0				sub		eax,eax
0030  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0011

0031				F4DivZero:
0031  B8 83 00 00 00			mov		eax,0x00000083
0036  E8 00 00 00 00			call		__FPE_exception_
003B  EB 11				jmp		L$2
003D				F4RetInf:

Routine Size: 12 bytes,    Routine Base: _TEXT + 0031

003D				F4OverFlow:
003D  50				push		eax
003E  E8 00 00 00 00			call		__set_ERANGE
0043  B8 84 00 00 00			mov		eax,0x00000084
0048  E8 00 00 00 00			call		__FPE_exception_
004D  58				pop		eax
004E				L$2:
004E  25 00 00 00 80			and		eax,0x80000000
0053  0D 00 00 80 7F			or		eax,0x7f800000
0058  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 003D

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

