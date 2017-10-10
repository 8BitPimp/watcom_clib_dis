Module: setenvp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C8 bytes
0000                            __setenvp:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 3D 00 00 00 00 00              cmp             dword ptr environ,0x00000000
000B  0F 85 B2 00 00 00                 jne             L$10
0011  8B 2D 00 00 00 00                 mov             ebp,dword ptr _Envptr
0017  31 F6                             xor             esi,esi
0019  30 D2                             xor             dl,dl
001B  89 E8                             mov             eax,ebp
001D                            L$1:
001D  3A 10                             cmp             dl,byte ptr [eax]
001F  74 12                             je              L$4
0021                            L$2:
0021  8A 08                             mov             cl,byte ptr [eax]
0023  8D 58 01                          lea             ebx,0x1[eax]
0026  38 CA                             cmp             dl,cl
0028  74 04                             je              L$3
002A  89 D8                             mov             eax,ebx
002C  EB F3                             jmp             L$2
002E                            L$3:
002E  46                                inc             esi
002F  89 D8                             mov             eax,ebx
0031  EB EA                             jmp             L$1
0033                            L$4:
0033  29 E8                             sub             eax,ebp
0035  75 05                             jne             L$5
0037  B8 01 00 00 00                    mov             eax,0x00000001
003C                            L$5:
003C  50                                push            eax
003D  E8 00 00 00 00                    call            _nmalloc
0042  89 C7                             mov             edi,eax
0044  83 C4 04                          add             esp,0x00000004
0047  89 C3                             mov             ebx,eax
0049  85 C0                             test            eax,eax
004B  0F 84 72 00 00 00                 je              L$10
0051  89 F0                             mov             eax,esi
0053  C1 E0 02                          shl             eax,0x02
0056  83 C0 04                          add             eax,0x00000004
0059  01 C6                             add             esi,eax
005B  56                                push            esi
005C  E8 00 00 00 00                    call            _nmalloc
0061  83 C4 04                          add             esp,0x00000004
0064  85 C0                             test            eax,eax
0066  74 52                             je              L$9
0068  A3 00 00 00 00                    mov             dword ptr environ,eax
006D  31 F6                             xor             esi,esi
006F  31 C9                             xor             ecx,ecx
0071  89 E8                             mov             eax,ebp
0073                            L$6:
0073  80 38 00                          cmp             byte ptr [eax],0x00
0076  74 19                             je              L$8
0078  8B 15 00 00 00 00                 mov             edx,dword ptr environ
007E  89 1C 11                          mov             dword ptr [ecx+edx],ebx
0081                            L$7:
0081  8A 10                             mov             dl,byte ptr [eax]
0083  40                                inc             eax
0084  88 13                             mov             byte ptr [ebx],dl
0086  43                                inc             ebx
0087  84 D2                             test            dl,dl
0089  75 F6                             jne             L$7
008B  83 C1 04                          add             ecx,0x00000004
008E  46                                inc             esi
008F  EB E2                             jmp             L$6
0091                            L$8:
0091  8B 15 00 00 00 00                 mov             edx,dword ptr environ
0097  56                                push            esi
0098  C7 04 11 00 00 00 00              mov             dword ptr [ecx+edx],0x00000000
009F  83 C1 04                          add             ecx,0x00000004
00A2  6A 00                             push            0x00000000
00A4  01 CA                             add             edx,ecx
00A6  52                                push            edx
00A7  89 15 00 00 00 00                 mov             dword ptr __env_mask,edx
00AD  E8 00 00 00 00                    call            memset
00B2  83 C4 0C                          add             esp,0x0000000c
00B5  5D                                pop             ebp
00B6  5F                                pop             edi
00B7  5E                                pop             esi
00B8  5B                                pop             ebx
00B9  C3                                ret
00BA                            L$9:
00BA  57                                push            edi
00BB  E8 00 00 00 00                    call            _nfree
00C0  83 C4 04                          add             esp,0x00000004
00C3                            L$10:
00C3  5D                                pop             ebp
00C4  5F                                pop             edi
00C5  5E                                pop             esi
00C6  5B                                pop             ebx
00C7  C3                                ret

Routine Size: 200 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

