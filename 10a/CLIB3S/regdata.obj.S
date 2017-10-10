Module: regdata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000012 bytes
0000				__RegisterThreadDataSize:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  A1 00 00 00 00			mov		eax,dword ptr __ThreadDataSize
0009  01 C2				add		edx,eax
000B  89 15 00 00 00 00			mov		dword ptr __ThreadDataSize,edx
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				__ThreadDataSize:
0000  DE 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

