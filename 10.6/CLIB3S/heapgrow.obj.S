Module: heapgrow
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000                            _heapgrow:
0000                            _nheapgrow:
0000  6A 01                             push            0x00000001
0002  E8 00 00 00 00                    call            _nmalloc
0007  83 C4 04                          add             esp,0x00000004
000A  50                                push            eax
000B  E8 00 00 00 00                    call            _nfree
0010  83 C4 04                          add             esp,0x00000004
0013  C3                                ret

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

