Module: getw
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            _getw:
0000  83 EC 04                          sub             esp,0x00000004
0003  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0007  52                                push            edx
0008  6A 01                             push            0x00000001
000A  6A 04                             push            0x00000004
000C  8D 44 24 0C                       lea             eax,0xc[esp]
0010  50                                push            eax
0011  E8 00 00 00 00                    call            fread
0016  83 C4 10                          add             esp,0x00000010
0019  85 C0                             test            eax,eax
001B  76 07                             jbe             L$1
001D  8B 04 24                          mov             eax,dword ptr [esp]
0020  83 C4 04                          add             esp,0x00000004
0023  C3                                ret
0024                            L$1:
0024  B8 FF FF FF FF                    mov             eax,0xffffffff
0029  83 C4 04                          add             esp,0x00000004
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

