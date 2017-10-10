Module: max
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000				max:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0008  39 D0				cmp		eax,edx
000A  7F 02				jg		L$1
000C  89 D0				mov		eax,edx
000E				L$1:
000E  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

