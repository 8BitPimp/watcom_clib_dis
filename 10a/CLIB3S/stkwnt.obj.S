Module: stkwnt
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT WORD USE32 0000001C bytes
0000                            L$1:
0000  C3                                ret

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001                            __CHK:
0001  87 44 24 04                       xchg            dword ptr 0x4[esp],eax
0005  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0009  C2 04 00                          ret             0x0004

Routine Size: 11 bytes,    Routine Base: _TEXT + 0001

000C                            __GRO:
000C  C2 04 00                          ret             0x0004

Routine Size: 3 bytes,    Routine Base: _TEXT + 000C

000F                            __STKOVERFLOW:
000F  58                                pop             eax
0010  68 00 00 00 00                    push            offset DGROUP:L$2
0015  6A 01                             push            0x00000001
0017  E8 00 00 00 00                    call            __fatal_runtime_error

Routine Size: 13 bytes,    Routine Base: _TEXT + 000F

No disassembly errors

Segment: _DATA DWORD USE32 00000012 bytes
0000                            L$2:
0000  53 74 61 63 6B 20 4F 76 65 72 66 6C 6F 77 21 0D Stack Overflow!.
0010  0A 00                                           ..

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000006 bytes
0000  00 20                                           .
0002  00 00 00 00                                     DD        offset L$1

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

