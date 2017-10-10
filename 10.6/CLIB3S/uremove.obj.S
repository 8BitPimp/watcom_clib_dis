Module: uremove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000010 bytes
0000				_uremove:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  FF 75 08				push		dword ptr 0x8[ebp]
0006  E8 00 00 00 00			call		_uunlink
000B  83 C4 04				add		esp,0x00000004
000E  5D				pop		ebp
000F  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

