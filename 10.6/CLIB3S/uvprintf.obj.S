Module: uvprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				_uvprintf:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  FF 75 0C				push		dword ptr 0xc[ebp]
0006  FF 75 08				push		dword ptr 0x8[ebp]
0009  68 1A 00 00 00			push		offset __iob+0x1a
000E  E8 00 00 00 00			call		__ufprtf
0013  83 C4 0C				add		esp,0x0000000c
0016  5D				pop		ebp
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

