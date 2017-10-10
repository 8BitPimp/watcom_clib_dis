Module: jstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B6 bytes
0000                            jstrstr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
000B  8B 6C 24 20                       mov             ebp,dword ptr 0x20[esp]
000F  8D 44 24 04                       lea             eax,0x4[esp]
0013  50                                push            eax
0014  55                                push            ebp
0015  E8 00 00 00 00                    call            jgetmoji
001A  83 C4 08                          add             esp,0x00000008
001D  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0021  89 C6                             mov             esi,eax
0023  66 85 D2                          test            dx,dx
0026  75 07                             jne             L$1
0028  89 D8                             mov             eax,ebx
002A  E9 7F 00 00 00                    jmp             L$6
002F                            L$1:
002F  89 E0                             mov             eax,esp
0031  50                                push            eax
0032  53                                push            ebx
0033  E8 00 00 00 00                    call            jgetmoji
0038  83 C4 08                          add             esp,0x00000008
003B  89 DF                             mov             edi,ebx
003D  8B 0C 24                          mov             ecx,dword ptr [esp]
0040  89 C3                             mov             ebx,eax
0042  66 85 C9                          test            cx,cx
0045  75 04                             jne             L$3
0047                            L$2:
0047  31 C0                             xor             eax,eax
0049  EB 63                             jmp             L$6
004B                            L$3:
004B  8B 04 24                          mov             eax,dword ptr [esp]
004E  66 3B 44 24 04                    cmp             ax,word ptr 0x4[esp]
0053  75 DA                             jne             L$1
0055                            L$4:
0055  89 E0                             mov             eax,esp
0057  50                                push            eax
0058  53                                push            ebx
0059  E8 00 00 00 00                    call            jgetmoji
005E  83 C4 08                          add             esp,0x00000008
0061  89 C3                             mov             ebx,eax
0063  8D 44 24 04                       lea             eax,0x4[esp]
0067  50                                push            eax
0068  56                                push            esi
0069  E8 00 00 00 00                    call            jgetmoji
006E  83 C4 08                          add             esp,0x00000008
0071  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0075  89 C6                             mov             esi,eax
0077  66 85 C9                          test            cx,cx
007A  75 04                             jne             L$5
007C  89 F8                             mov             eax,edi
007E  EB 2E                             jmp             L$6
0080                            L$5:
0080  8B 04 24                          mov             eax,dword ptr [esp]
0083  66 85 C0                          test            ax,ax
0086  74 BF                             je              L$2
0088  66 39 C1                          cmp             cx,ax
008B  74 C8                             je              L$4
008D  89 E0                             mov             eax,esp
008F  50                                push            eax
0090  47                                inc             edi
0091  57                                push            edi
0092  E8 00 00 00 00                    call            jgetmoji
0097  83 C4 08                          add             esp,0x00000008
009A  89 C3                             mov             ebx,eax
009C  8D 44 24 04                       lea             eax,0x4[esp]
00A0  50                                push            eax
00A1  55                                push            ebp
00A2  E8 00 00 00 00                    call            jgetmoji
00A7  83 C4 08                          add             esp,0x00000008
00AA  89 C6                             mov             esi,eax
00AC  EB 9D                             jmp             L$3
00AE                            L$6:
00AE  83 C4 08                          add             esp,0x00000008
00B1  5D                                pop             ebp
00B2  5F                                pop             edi
00B3  5E                                pop             esi
00B4  5B                                pop             ebx
00B5  C3                                ret

Routine Size: 182 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

