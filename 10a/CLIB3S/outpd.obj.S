Module: outpd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000A bytes
0000                            outpd:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0008  EF                                out             dx,eax
0009  C3                                ret

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

