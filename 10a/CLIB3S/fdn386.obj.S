Module: fdn386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000000B bytes
0000				__FDN:
0000  85 D2				test		edx,edx
0002  74 06				je		L$1
0004  81 F2 00 00 00 80			xor		edx,0x80000000
000A				L$1:
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

