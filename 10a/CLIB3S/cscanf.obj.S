Module: cscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000                            cget_console:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  E8 00 00 00 00                    call            getche
000A  83 F8 FF                          cmp             eax,0xffffffff
000D  75 04                             jne             L$1
000F  80 4B 10 02                       or              byte ptr 0x10[ebx],0x02
0013                            L$1:
0013  5B                                pop             ebx
0014  C3                                ret
0015                            uncget_console:
0015  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0019  52                                push            edx
001A  E8 00 00 00 00                    call            ungetch
001F  83 C4 04                          add             esp,0x00000004
0022  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

0023                            vcscanf:
0023  53                                push            ebx
0024  56                                push            esi
0025  83 EC 14                          sub             esp,0x00000014
0028  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
002C  51                                push            ecx
002D  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0031  BA 00 00 00 00                    mov             edx,offset cget_console
0036  56                                push            esi
0037  8D 44 24 08                       lea             eax,0x8[esp]
003B  BB 00 00 00 00                    mov             ebx,offset uncget_console
0040  50                                push            eax
0041  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
0045  89 5C 24 10                       mov             dword ptr 0x10[esp],ebx
0049  E8 00 00 00 00                    call            __scnf
004E  83 C4 0C                          add             esp,0x0000000c
0051  83 C4 14                          add             esp,0x00000014
0054  5E                                pop             esi
0055  5B                                pop             ebx
0056  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0023

0057                            cscanf:
0057  83 EC 04                          sub             esp,0x00000004
005A  8D 44 24 0C                       lea             eax,0xc[esp]
005E  89 04 24                          mov             dword ptr [esp],eax
0061  89 E0                             mov             eax,esp
0063  50                                push            eax
0064  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0068  52                                push            edx
0069  E8 00 00 00 00                    call            vcscanf
006E  83 C4 08                          add             esp,0x00000008
0071  83 C4 04                          add             esp,0x00000004
0074  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0057

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

