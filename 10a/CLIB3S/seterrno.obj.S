Module: seterrno
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000046 bytes
0000				__set_EDOM:
0000  6A 0D				push		0x0000000d
0002				L$1:
0002  E8 18 00 00 00			call		__set_errno
0007  83 C4 04				add		esp,0x00000004
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

000B				__set_ERANGE:
000B  6A 0E				push		0x0000000e
000D  EB F3				jmp		L$1

Routine Size: 4 bytes,    Routine Base: _TEXT + 000B

000F				__set_EINVAL:
000F  6A 09				push		0x00000009
0011  E8 09 00 00 00			call		__set_errno
0016  B8 FF FF FF FF			mov		eax,0xffffffff
001B  83 C4 04				add		esp,0x00000004
001E  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 000F

001F				__set_errno:
001F  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0025  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0029  89 50 04				mov		dword ptr 0x4[eax],edx
002C  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 001F

002D				__set_doserrno:
002D  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0033  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0037  89 50 08				mov		dword ptr 0x8[eax],edx
003A  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 002D

003B				__FPE_exception_:
003B  50				push		eax
003C  FF 15 00 00 00 00			call		dword ptr __FPE_handler
0042  83 C4 04				add		esp,0x00000004
0045  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 003B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

