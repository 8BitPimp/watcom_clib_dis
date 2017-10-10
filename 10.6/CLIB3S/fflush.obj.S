Module: fflush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            fflush:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  85 D2                             test            edx,edx
0006  75 08                             jne             L$1
0008  E8 00 00 00 00                    call            flushall
000D  31 C0                             xor             eax,eax
000F  C3                                ret
0010                            L$1:
0010  52                                push            edx
0011  E8 00 00 00 00                    call            __flush
0016  83 C4 04                          add             esp,0x00000004
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

