Module: onexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000                            onexit:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            atexit
000A  83 C4 04                          add             esp,0x00000004
000D  85 C0                             test            eax,eax
000F  75 05                             jne             L$1
0011  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0015  C3                                ret
0016                            L$1:
0016  31 C0                             xor             eax,eax
0018  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

