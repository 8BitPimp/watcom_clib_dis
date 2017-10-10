Module: nomem
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000010 bytes
0000                            _Not_Enough_Memory:
0000  6A 01                             push            0x00000001
0002  68 00 00 00 00                    push            offset DGROUP:L$1
0007  E8 00 00 00 00                    call            __fatal_runtime_error
000C  83 C4 08                          add             esp,0x00000008
000F  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000014 bytes
0000                            L$1:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 0D 0A 00                                     y...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

