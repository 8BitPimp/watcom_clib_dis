Module: atexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000                            _Full_at_exit_rtn:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 35 00 00 00 00                 mov             esi,dword ptr _ExitCount
000B  83 FE 21                          cmp             esi,0x00000021
000E  74 26                             je              L$2
0010  BA 21 00 00 00                    mov             edx,0x00000021
0015  89 F3                             mov             ebx,esi
0017  89 15 00 00 00 00                 mov             dword ptr _ExitCount,edx
001D  C1 E3 02                          shl             ebx,0x02
0020                            L$1:
0020  85 DB                             test            ebx,ebx
0022  74 12                             je              L$2
0024  8B 83 FC FF FF FF                 mov             eax,dword ptr _ExitList-0x4[ebx]
002A  83 EB 04                          sub             ebx,0x00000004
002D  89 04 24                          mov             dword ptr [esp],eax
0030  4E                                dec             esi
0031  FF 14 24                          call            dword ptr [esp]
0034  EB EA                             jmp             L$1
0036                            L$2:
0036  83 C4 04                          add             esp,0x00000004
0039  5E                                pop             esi
003A  5B                                pop             ebx
003B  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

003C                            atexit:
003C  53                                push            ebx
003D  BA 00 00 00 00                    mov             edx,offset _Full_at_exit_rtn
0042  8B 1D 00 00 00 00                 mov             ebx,dword ptr _ExitCount
0048  89 15 00 00 00 00                 mov             dword ptr __atexit,edx
004E  83 FB 20                          cmp             ebx,0x00000020
0051  7D 1A                             jge             L$3
0053  89 DA                             mov             edx,ebx
0055  89 D8                             mov             eax,ebx
0057  31 D0                             xor             eax,edx
0059  42                                inc             edx
005A  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
005E  89 1C 95 FC FF FF FF              mov             dword ptr _ExitList-0x4[edx*4],ebx
0065  89 15 00 00 00 00                 mov             dword ptr _ExitCount,edx
006B  5B                                pop             ebx
006C  C3                                ret
006D                            L$3:
006D  B8 FF FF FF FF                    mov             eax,0xffffffff
0072  5B                                pop             ebx
0073  C3                                ret

Routine Size: 56 bytes,    Routine Base: _TEXT + 003C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000084 bytes
0000                            _ExitList:
0080                            _ExitCount:

BSS Size: 132 bytes

