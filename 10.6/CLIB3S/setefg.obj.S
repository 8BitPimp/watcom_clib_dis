Module: setefg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				__setEFGfmt:
0000  53				push		ebx
0001  BA 00 00 00 00			mov		edx,offset _EFG_Format
0006  BB 00 00 00 00			mov		ebx,offset __cnvs2d
000B  89 15 00 00 00 00			mov		dword ptr __EFG_printf,edx
0011  89 1D 00 00 00 00			mov		dword ptr __EFG_scanf,ebx
0017  5B				pop		ebx
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

