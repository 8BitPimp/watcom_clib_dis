Module: spvp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000                            spawnvp:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 15 00 00 00 00                 mov             edx,dword ptr environ
0008  52                                push            edx
0009  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000D  53                                push            ebx
000E  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0012  51                                push            ecx
0013  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0017  56                                push            esi
0018  E8 00 00 00 00                    call            spawnvpe
001D  83 C4 10                          add             esp,0x00000010
0020  5E                                pop             esi
0021  5B                                pop             ebx
0022  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

