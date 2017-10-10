Module: jctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000                            jctime:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            localtime
000A  83 C4 04                          add             esp,0x00000004
000D  50                                push            eax
000E  E8 00 00 00 00                    call            jasctime
0013  83 C4 04                          add             esp,0x00000004
0016  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

