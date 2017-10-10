Module: putenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000267 bytes
0000                            putenv:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
000B  85 D2                             test            edx,edx
000D  75 0A                             jne             L$2
000F                            L$1:
000F  B8 FF FF FF FF                    mov             eax,0xffffffff
0014  E9 4F 01 00 00                    jmp             L$12
0019                            L$2:
0019  89 D0                             mov             eax,edx
001B  EB 06                             jmp             L$4
001D                            L$3:
001D  80 FA 3D                          cmp             dl,0x3d
0020  74 07                             je              L$5
0022  40                                inc             eax
0023                            L$4:
0023  8A 10                             mov             dl,byte ptr [eax]
0025  84 D2                             test            dl,dl
0027  75 F4                             jne             L$3
0029                            L$5:
0029  80 38 00                          cmp             byte ptr [eax],0x00
002C  74 E1                             je              L$1
002E  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
0032  0F 94 C0                          sete            al
0035  8B 1D 00 00 00 00                 mov             ebx,dword ptr environ
003B  0F B6 E8                          movzx           ebp,al
003E  85 DB                             test            ebx,ebx
0040  75 2F                             jne             L$6
0042  85 ED                             test            ebp,ebp
0044  0F 85 1C 01 00 00                 jne             L$11
004A  6A 09                             push            0x00000009
004C  E8 00 00 00 00                    call            malloc
0051  83 C4 04                          add             esp,0x00000004
0054  89 C3                             mov             ebx,eax
0056  85 C0                             test            eax,eax
0058  74 B5                             je              L$1
005A  A3 00 00 00 00                    mov             dword ptr environ,eax
005F  89 28                             mov             dword ptr [eax],ebp
0061  83 C0 08                          add             eax,0x00000008
0064  89 68 FC                          mov             dword ptr -0x4[eax],ebp
0067  A3 00 00 00 00                    mov             dword ptr __env_mask,eax
006C  E9 DF 00 00 00                    jmp             L$10
0071                            L$6:
0071  55                                push            ebp
0072  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
0076  51                                push            ecx
0077  E8 00 00 00 00                    call            findenv
007C  83 C4 08                          add             esp,0x00000008
007F  85 ED                             test            ebp,ebp
0081  0F 85 DF 00 00 00                 jne             L$11
0087  85 C0                             test            eax,eax
0089  0F 8F BE 00 00 00                 jg              L$9
008F  F7 D8                             neg             eax
0091  89 C5                             mov             ebp,eax
0093  40                                inc             eax
0094  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0098  89 E8                             mov             eax,ebp
009A  C1 E0 02                          shl             eax,0x02
009D  8B 3D 00 00 00 00                 mov             edi,dword ptr __env_mask
00A3  89 04 24                          mov             dword ptr [esp],eax
00A6  83 C0 08                          add             eax,0x00000008
00A9  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
00AD  89 44 24 08                       mov             dword ptr 0x8[esp],eax
00B1  01 F0                             add             eax,esi
00B3  85 FF                             test            edi,edi
00B5  75 53                             jne             L$7
00B7  50                                push            eax
00B8  E8 00 00 00 00                    call            malloc
00BD  89 C2                             mov             edx,eax
00BF  83 C4 04                          add             esp,0x00000004
00C2  89 C3                             mov             ebx,eax
00C4  85 C0                             test            eax,eax
00C6  0F 84 43 FF FF FF                 je              L$1
00CC  8B 0C 24                          mov             ecx,dword ptr [esp]
00CF  8B 35 00 00 00 00                 mov             esi,dword ptr environ
00D5  89 C7                             mov             edi,eax
00D7  06                                push            es
00D8  8C D8                             mov             eax,ds
00DA  8E C0                             mov             es,eax
00DC  57                                push            edi
00DD  89 C8                             mov             eax,ecx
00DF  C1 E9 02                          shr             ecx,0x02
00E2  F2 A5                             repne movsd
00E4  8A C8                             mov             cl,al
00E6  80 E1 03                          and             cl,0x03
00E9  F2 A4                             repne movsb
00EB  5F                                pop             edi
00EC  07                                pop             es
00ED  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
00F1  51                                push            ecx
00F2  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
00F6  6A 00                             push            0x00000000
00F8  01 D0                             add             eax,edx
00FA  50                                push            eax
00FB  A3 00 00 00 00                    mov             dword ptr __env_mask,eax
0100  E8 00 00 00 00                    call            memset
0105  83 C4 0C                          add             esp,0x0000000c
0108  EB 31                             jmp             L$8
010A                            L$7:
010A  50                                push            eax
010B  53                                push            ebx
010C  E8 00 00 00 00                    call            realloc
0111  83 C4 08                          add             esp,0x00000008
0114  89 C3                             mov             ebx,eax
0116  85 C0                             test            eax,eax
0118  0F 84 F1 FE FF FF                 je              L$1
011E  55                                push            ebp
011F  8B 15 00 00 00 00                 mov             edx,dword ptr __env_mask
0125  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0129  52                                push            edx
012A  01 C6                             add             esi,eax
012C  56                                push            esi
012D  E8 00 00 00 00                    call            memmove
0132  83 C4 0C                          add             esp,0x0000000c
0135  89 35 00 00 00 00                 mov             dword ptr __env_mask,esi
013B                            L$8:
013B  89 E8                             mov             eax,ebp
013D  89 1D 00 00 00 00                 mov             dword ptr environ,ebx
0143  C7 44 83 04 00 00 00 00           mov             dword ptr 0x4[ebx+eax*4],0x00000000
014B  EB 03                             jmp             L$10
014D                            L$9:
014D  8D 68 FF                          lea             ebp,-0x1[eax]
0150                            L$10:
0150  89 E8                             mov             eax,ebp
0152  C1 E0 02                          shl             eax,0x02
0155  01 C3                             add             ebx,eax
0157  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
015B  89 03                             mov             dword ptr [ebx],eax
015D  A1 00 00 00 00                    mov             eax,dword ptr __env_mask
0162  C6 04 28 00                       mov             byte ptr [eax+ebp],0x00
0166                            L$11:
0166  31 C0                             xor             eax,eax
0168                            L$12:
0168  83 C4 0C                          add             esp,0x0000000c
016B  5D                                pop             ebp
016C  5F                                pop             edi
016D  5E                                pop             esi
016E  5B                                pop             ebx
016F  C3                                ret
0170                            findenv:
0170  53                                push            ebx
0171  56                                push            esi
0172  57                                push            edi
0173  55                                push            ebp
0174  8B 2D 00 00 00 00                 mov             ebp,dword ptr environ
017A  E9 CE 00 00 00                    jmp             L$25
017F                            L$13:
017F  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
0183  E9 B9 00 00 00                    jmp             L$23
0188                            L$14:
0188  31 C0                             xor             eax,eax
018A  8A 03                             mov             al,byte ptr [ebx]
018C  50                                push            eax
018D  E8 00 00 00 00                    call            toupper
0192  89 C7                             mov             edi,eax
0194  31 C0                             xor             eax,eax
0196  83 C4 04                          add             esp,0x00000004
0199  8A 06                             mov             al,byte ptr [esi]
019B  50                                push            eax
019C  E8 00 00 00 00                    call            toupper
01A1  83 C4 04                          add             esp,0x00000004
01A4  39 C7                             cmp             edi,eax
01A6  0F 85 9E 00 00 00                 jne             L$24
01AC  80 3B 3D                          cmp             byte ptr [ebx],0x3d
01AF  0F 85 8A 00 00 00                 jne             L$22
01B5  8B 15 00 00 00 00                 mov             edx,dword ptr environ
01BB  89 EE                             mov             esi,ebp
01BD  29 D6                             sub             esi,edx
01BF  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
01C3  C1 FE 02                          sar             esi,0x02
01C6  85 DB                             test            ebx,ebx
01C8  0F 84 69 00 00 00                 je              L$21
01CE  89 EB                             mov             ebx,ebp
01D0  8B 7D 00                          mov             edi,dword ptr [ebp]
01D3  EB 08                             jmp             L$16
01D5                            L$15:
01D5  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
01D8  89 03                             mov             dword ptr [ebx],eax
01DA  83 C3 04                          add             ebx,0x00000004
01DD                            L$16:
01DD  83 3B 00                          cmp             dword ptr [ebx],0x00000000
01E0  75 F3                             jne             L$15
01E2  8B 2D 00 00 00 00                 mov             ebp,dword ptr __env_mask
01E8  85 ED                             test            ebp,ebp
01EA  74 44                             je              L$20
01EC  89 E8                             mov             eax,ebp
01EE  80 3C 06 00                       cmp             byte ptr [esi+eax],0x00
01F2  74 09                             je              L$17
01F4  57                                push            edi
01F5  E8 00 00 00 00                    call            free
01FA  83 C4 04                          add             esp,0x00000004
01FD                            L$17:
01FD  A1 00 00 00 00                    mov             eax,dword ptr environ
0202  89 DF                             mov             edi,ebx
0204  29 C7                             sub             edi,eax
0206  C1 FF 02                          sar             edi,0x02
0209  57                                push            edi
020A  8B 15 00 00 00 00                 mov             edx,dword ptr __env_mask
0210  52                                push            edx
0211  53                                push            ebx
0212  E8 00 00 00 00                    call            memmove
0217  83 C4 0C                          add             esp,0x0000000c
021A  89 1D 00 00 00 00                 mov             dword ptr __env_mask,ebx
0220  8D 04 1E                          lea             eax,[esi+ebx]
0223  EB 07                             jmp             L$19
0225                            L$18:
0225  8A 58 01                          mov             bl,byte ptr 0x1[eax]
0228  46                                inc             esi
0229  88 18                             mov             byte ptr [eax],bl
022B  40                                inc             eax
022C                            L$19:
022C  39 FE                             cmp             esi,edi
022E  7C F5                             jl              L$18
0230                            L$20:
0230  31 C0                             xor             eax,eax
0232  5D                                pop             ebp
0233  5F                                pop             edi
0234  5E                                pop             esi
0235  5B                                pop             ebx
0236  C3                                ret
0237                            L$21:
0237  8D 46 01                          lea             eax,0x1[esi]
023A  5D                                pop             ebp
023B  5F                                pop             edi
023C  5E                                pop             esi
023D  5B                                pop             ebx
023E  C3                                ret
023F                            L$22:
023F  43                                inc             ebx
0240  46                                inc             esi
0241                            L$23:
0241  80 3E 00                          cmp             byte ptr [esi],0x00
0244  0F 85 3E FF FF FF                 jne             L$14
024A                            L$24:
024A  83 C5 04                          add             ebp,0x00000004
024D                            L$25:
024D  8B 5D 00                          mov             ebx,dword ptr [ebp]
0250  85 DB                             test            ebx,ebx
0252  0F 85 27 FF FF FF                 jne             L$13
0258  A1 00 00 00 00                    mov             eax,dword ptr environ
025D  29 E8                             sub             eax,ebp
025F  C1 F8 02                          sar             eax,0x02
0262  5D                                pop             ebp
0263  5F                                pop             edi
0264  5E                                pop             esi
0265  5B                                pop             ebx
0266  C3                                ret

Routine Size: 615 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

