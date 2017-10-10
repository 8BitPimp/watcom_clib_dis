Module: scanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000                            cget_stdin:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  68 00 00 00 00                    push            offset __iob
000A  E8 00 00 00 00                    call            fgetc
000F  83 C4 04                          add             esp,0x00000004
0012  89 C2                             mov             edx,eax
0014  83 F8 FF                          cmp             eax,0xffffffff
0017  75 04                             jne             L$1
0019  80 4B 10 02                       or              byte ptr 0x10[ebx],0x02
001D                            L$1:
001D  89 D0                             mov             eax,edx
001F  5B                                pop             ebx
0020  C3                                ret
0021                            uncget_stdin:
0021  68 00 00 00 00                    push            offset __iob
0026  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
002A  52                                push            edx
002B  E8 00 00 00 00                    call            ungetc
0030  83 C4 08                          add             esp,0x00000008
0033  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

0034                            vscanf:
0034  53                                push            ebx
0035  56                                push            esi
0036  83 EC 14                          sub             esp,0x00000014
0039  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
003D  51                                push            ecx
003E  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0042  BA 00 00 00 00                    mov             edx,offset cget_stdin
0047  56                                push            esi
0048  8D 44 24 08                       lea             eax,0x8[esp]
004C  BB 00 00 00 00                    mov             ebx,offset uncget_stdin
0051  50                                push            eax
0052  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
0056  89 5C 24 10                       mov             dword ptr 0x10[esp],ebx
005A  E8 00 00 00 00                    call            __scnf
005F  83 C4 0C                          add             esp,0x0000000c
0062  83 C4 14                          add             esp,0x00000014
0065  5E                                pop             esi
0066  5B                                pop             ebx
0067  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0034

0068                            scanf:
0068  83 EC 04                          sub             esp,0x00000004
006B  8D 44 24 0C                       lea             eax,0xc[esp]
006F  89 04 24                          mov             dword ptr [esp],eax
0072  89 E0                             mov             eax,esp
0074  50                                push            eax
0075  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0079  52                                push            edx
007A  E8 00 00 00 00                    call            vscanf
007F  83 C4 08                          add             esp,0x00000008
0082  83 C4 04                          add             esp,0x00000004
0085  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0068

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

