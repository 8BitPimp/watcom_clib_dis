Module: sscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000093 bytes
0000                            cget_string:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
0008  31 D2                             xor             edx,edx
000A  8A 13                             mov             dl,byte ptr [ebx]
000C  85 D2                             test            edx,edx
000E  74 08                             je              L$1
0010  43                                inc             ebx
0011  89 58 08                          mov             dword ptr 0x8[eax],ebx
0014  89 D0                             mov             eax,edx
0016  5B                                pop             ebx
0017  C3                                ret
0018                            L$1:
0018  8A 58 10                          mov             bl,byte ptr 0x10[eax]
001B  80 CB 02                          or              bl,0x02
001E  BA FF FF FF FF                    mov             edx,0xffffffff
0023  88 58 10                          mov             byte ptr 0x10[eax],bl
0026  89 D0                             mov             eax,edx
0028  5B                                pop             ebx
0029  C3                                ret
002A                            uncget_string:
002A  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
002E  FF 48 08                          dec             dword ptr 0x8[eax]
0031  C3                                ret

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

0032                            vsscanf:
0032  53                                push            ebx
0033  56                                push            esi
0034  83 EC 14                          sub             esp,0x00000014
0037  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
003B  8B 4C 24 28                       mov             ecx,dword ptr 0x28[esp]
003F  BA 00 00 00 00                    mov             edx,offset cget_string
0044  51                                push            ecx
0045  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
0049  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
004D  56                                push            esi
004E  8D 44 24 08                       lea             eax,0x8[esp]
0052  BB 00 00 00 00                    mov             ebx,offset uncget_string
0057  50                                push            eax
0058  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
005C  89 5C 24 10                       mov             dword ptr 0x10[esp],ebx
0060  E8 00 00 00 00                    call            __scnf
0065  83 C4 0C                          add             esp,0x0000000c
0068  83 C4 14                          add             esp,0x00000014
006B  5E                                pop             esi
006C  5B                                pop             ebx
006D  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0032

006E                            sscanf:
006E  53                                push            ebx
006F  83 EC 04                          sub             esp,0x00000004
0072  8D 44 24 14                       lea             eax,0x14[esp]
0076  89 04 24                          mov             dword ptr [esp],eax
0079  89 E0                             mov             eax,esp
007B  50                                push            eax
007C  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0080  52                                push            edx
0081  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0085  53                                push            ebx
0086  E8 00 00 00 00                    call            vsscanf
008B  83 C4 0C                          add             esp,0x0000000c
008E  83 C4 04                          add             esp,0x00000004
0091  5B                                pop             ebx
0092  C3                                ret

Routine Size: 37 bytes,    Routine Base: _TEXT + 006E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

