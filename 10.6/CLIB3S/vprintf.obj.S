Module: vprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            vprintf:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
000A  53                                push            ebx
000B  68 1A 00 00 00                    push            offset __iob+0x1a
0010  E8 00 00 00 00                    call            __fprtf
0015  83 C4 0C                          add             esp,0x0000000c
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

