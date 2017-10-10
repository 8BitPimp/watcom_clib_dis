Module: nmsize
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000D bytes
0000				_msize:
0000				_nmsize:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  8B 40 FC				mov		eax,dword ptr -0x4[eax]
0007  24 FE				and		al,0xfe
0009  83 E8 04				sub		eax,0x00000004
000C  C3				ret		

Routine Size: 13 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

