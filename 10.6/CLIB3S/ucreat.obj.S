Module: ucreat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000                            _ucreat:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  6A 62                             push            0x00000062
0008  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000C  53                                push            ebx
000D  E8 00 00 00 00                    call            _uopen
0012  83 C4 0C                          add             esp,0x0000000c
0015  5B                                pop             ebx
0016  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

