Module: sple
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000                            spawnle:
0000  53                                push            ebx
0001  8D 44 24 10                       lea             eax,0x10[esp]
0005                            L$1:
0005  8B 10                             mov             edx,dword ptr [eax]
0007  83 C0 04                          add             eax,0x00000004
000A  85 D2                             test            edx,edx
000C  75 F7                             jne             L$1
000E  83 C0 04                          add             eax,0x00000004
0011  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
0014  50                                push            eax
0015  8D 44 24 14                       lea             eax,0x14[esp]
0019  50                                push            eax
001A  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
001E  52                                push            edx
001F  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0023  53                                push            ebx
0024  E8 00 00 00 00                    call            spawnve
0029  83 C4 10                          add             esp,0x00000010
002C  5B                                pop             ebx
002D  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

