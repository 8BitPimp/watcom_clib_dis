Module: ldiv386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000015 bytes
0000                            ldiv:
0000  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0004  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0008  53                                push            ebx
0009  89 D3                             mov             ebx,edx
000B  99                                cdq
000C  F7 FB                             idiv            ebx
000E  89 06                             mov             dword ptr [esi],eax
0010  89 56 04                          mov             dword ptr 0x4[esi],edx
0013  5B                                pop             ebx
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

