Module: fpexcept
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000B bytes
0000                            __FPE_exception_:
0000  50                                push            eax
0001  FF 15 00 00 00 00                 call            dword ptr __FPE_handler
0007  83 C4 04                          add             esp,0x00000004
000A  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

