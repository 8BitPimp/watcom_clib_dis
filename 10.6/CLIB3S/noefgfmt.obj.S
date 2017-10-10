Module: noefgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000010 bytes
0000                            _no_support_loaded:
0000  6A 01                             push            0x00000001
0002  68 00 00 00 00                    push            offset DGROUP:L$1
0007  E8 00 00 00 00                    call            __fatal_runtime_error
000C  83 C4 08                          add             esp,0x00000008
000F  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000024 bytes
0000                            L$1:
0000  46 6C 6F 61 74 69 6E 67 2D 70 6F 69 6E 74 20 73 Floating-point s
0010  75 70 70 6F 72 74 20 6E 6F 74 20 6C 6F 61 64 65 upport not loade
0020  64 0D 0A 00                                     d...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000                            __EFG_printf:
0000  00 00 00 00                                     DD        offset _no_support_loaded
0004                            __EFG_scanf:
0004  00 00 00 00                                     DD        offset _no_support_loaded

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

