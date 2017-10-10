Module: sleepwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            sleep:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  89 D0                             mov             eax,edx
0006  C1 E0 05                          shl             eax,0x05
0009  29 D0                             sub             eax,edx
000B  C1 E0 02                          shl             eax,0x02
000E  01 D0                             add             eax,edx
0010  C1 E0 03                          shl             eax,0x03
0013  50                                push            eax
0014  E8 00 00 00 00                    call            _Sleep
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

