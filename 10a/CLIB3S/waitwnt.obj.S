Module: waitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000012 bytes
0000				wait:
0000  6A 00				push		0x00000000
0002  6A 00				push		0x00000000
0004  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0008  52				push		edx
0009  E8 00 00 00 00			call		cwait
000E  83 C4 0C				add		esp,0x0000000c
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

