Module: strtime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000040 bytes
0000                            _strtime:
0000  83 EC 28                          sub             esp,0x00000028
0003  6A 00                             push            0x00000000
0005  E8 00 00 00 00                    call            time
000A  83 C4 04                          add             esp,0x00000004
000D  89 44 24 24                       mov             dword ptr 0x24[esp],eax
0011  89 E0                             mov             eax,esp
0013  50                                push            eax
0014  8D 44 24 28                       lea             eax,0x28[esp]
0018  50                                push            eax
0019  E8 00 00 00 00                    call            _localtime
001E  83 C4 08                          add             esp,0x00000008
0021  89 E0                             mov             eax,esp
0023  50                                push            eax
0024  68 00 00 00 00                    push            offset DGROUP:L$1
0029  6A 09                             push            0x00000009
002B  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
002F  52                                push            edx
0030  E8 00 00 00 00                    call            strftime
0035  83 C4 10                          add             esp,0x00000010
0038  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
003C  83 C4 28                          add             esp,0x00000028
003F  C3                                ret

Routine Size: 64 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000                            L$1:
0000  25 54 00                                        %T.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

