Module: close
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000                            close:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0006  56                                push            esi
0007  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
000D  83 C4 04                          add             esp,0x00000004
0010  56                                push            esi
0011  E8 00 00 00 00                    call            __close
0016  83 C4 04                          add             esp,0x00000004
0019  56                                push            esi
001A  89 C3                             mov             ebx,eax
001C  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0022  83 C4 04                          add             esp,0x00000004
0025  56                                push            esi
0026  FF 15 00 00 00 00                 call            dword ptr _FiniAccessH
002C  83 C4 04                          add             esp,0x00000004
002F  89 D8                             mov             eax,ebx
0031  5E                                pop             esi
0032  5B                                pop             ebx
0033  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

