Module: ufputcha
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				_ufputchar:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  68 1A 00 00 00			push		offset __iob+0x1a
0008  FF 75 08				push		dword ptr 0x8[ebp]
000B  E8 00 00 00 00			call		_ufputc
0010  83 C4 08				add		esp,0x00000008
0013  5D				pop		ebp
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

