Module: nullargv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000                            __Null_Argv:
0000  E8 00 00 00 00                    call            main
0005  50                                push            eax
0006  E8 00 00 00 00                    call            exit
000B  83 C4 04                          add             esp,0x00000004
000E  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

