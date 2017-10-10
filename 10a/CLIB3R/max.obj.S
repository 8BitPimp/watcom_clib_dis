Module: max
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000007 bytes
0000				max_:
0000  39 D0				cmp		eax,edx
0002  7F 02				jg		L$1
0004  89 D0				mov		eax,edx
0006				L$1:
0006  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

