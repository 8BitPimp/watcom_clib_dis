Module: lrotr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000B bytes
0000                            _lrotr:
0000  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0004  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0008  D3 C8                             ror             eax,cl
000A  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

