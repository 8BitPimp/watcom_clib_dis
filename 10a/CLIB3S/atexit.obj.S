Module: atexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000                            _Full_at_exit_rtn:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 35 00 00 00 00                 mov             esi,dword ptr _ExitCount
000B  BA 20 00 00 00                    mov             edx,0x00000020
0010  89 F3                             mov             ebx,esi
0012  89 15 00 00 00 00                 mov             dword ptr _ExitCount,edx
0018  C1 E3 02                          shl             ebx,0x02
001B                            L$1:
001B  85 DB                             test            ebx,ebx
001D  74 12                             je              L$2
001F  8B 83 FC FF FF FF                 mov             eax,dword ptr _ExitList-0x4[ebx]
0025  83 EB 04                          sub             ebx,0x00000004
0028  89 04 24                          mov             dword ptr [esp],eax
002B  4E                                dec             esi
002C  FF 14 24                          call            dword ptr [esp]
002F  EB EA                             jmp             L$1
0031                            L$2:
0031  83 C4 04                          add             esp,0x00000004
0034  5E                                pop             esi
0035  5B                                pop             ebx
0036  C3                                ret

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037                            atexit:
0037  53                                push            ebx
0038  BA 00 00 00 00                    mov             edx,offset _Full_at_exit_rtn
003D  8B 1D 00 00 00 00                 mov             ebx,dword ptr _ExitCount
0043  89 15 00 00 00 00                 mov             dword ptr __atexit,edx
0049  83 FB 20                          cmp             ebx,0x00000020
004C  7D 1A                             jge             L$3
004E  89 DA                             mov             edx,ebx
0050  89 D8                             mov             eax,ebx
0052  31 D0                             xor             eax,edx
0054  42                                inc             edx
0055  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0059  89 1C 95 FC FF FF FF              mov             dword ptr _ExitList-0x4[edx*4],ebx
0060  89 15 00 00 00 00                 mov             dword ptr _ExitCount,edx
0066  5B                                pop             ebx
0067  C3                                ret
0068                            L$3:
0068  B8 FF FF FF FF                    mov             eax,0xffffffff
006D  5B                                pop             ebx
006E  C3                                ret

Routine Size: 56 bytes,    Routine Base: _TEXT + 0037

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000084 bytes
0000                            _ExitList:
0080                            _ExitCount:

BSS Size: 132 bytes

