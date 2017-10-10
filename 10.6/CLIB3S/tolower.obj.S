Module: tolower
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000                            _tolower:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            tolower
000A  83 C4 04                          add             esp,0x00000004
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E                            tolower:
000E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0012  83 F8 41                          cmp             eax,0x00000041
0015  7C 08                             jl              L$1
0017  83 F8 5A                          cmp             eax,0x0000005a
001A  7F 03                             jg              L$1
001C  83 C0 20                          add             eax,0x00000020
001F                            L$1:
001F  C3                                ret

Routine Size: 18 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

