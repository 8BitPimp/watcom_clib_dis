Module: splp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            spawnlp:
0000  53                                push            ebx
0001  8D 44 24 10                       lea             eax,0x10[esp]
0005  50                                push            eax
0006  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
000A  52                                push            edx
000B  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000F  53                                push            ebx
0010  E8 00 00 00 00                    call            spawnvp
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

