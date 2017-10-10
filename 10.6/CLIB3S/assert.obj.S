Module: assert
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000032 bytes
0000                            __assert:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 7C 24 0C 00                    cmp             dword ptr 0xc[esp],0x00000000
0007  75 26                             jne             L$1
0009  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000D  53                                push            ebx
000E  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0012  51                                push            ecx
0013  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0017  56                                push            esi
0018  68 00 00 00 00                    push            offset DGROUP:L$2
001D  68 34 00 00 00                    push            offset __iob+0x34
0022  E8 00 00 00 00                    call            fprintf
0027  83 C4 14                          add             esp,0x00000014
002A  E8 00 00 00 00                    call            abort
002F                            L$1:
002F  5E                                pop             esi
0030  5B                                pop             ebx
0031  C3                                ret

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000002A bytes
0000                            L$2:
0000  41 73 73 65 72 74 69 6F 6E 20 66 61 69 6C 65 64 Assertion failed
0010  3A 20 25 68 73 2C 20 66 69 6C 65 20 25 68 73 2C : %hs, file %hs,
0020  20 6C 69 6E 65 20 25 64 0A 00                    line %d..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

