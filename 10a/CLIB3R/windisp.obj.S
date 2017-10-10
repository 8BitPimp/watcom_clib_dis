Module: windisp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003A7 bytes
0000                            _DisplayAllLines_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  55                                push            ebp
0006  83 EC 04                          sub             esp,0x00000004
0009  89 C6                             mov             esi,eax
000B  8B 78 4E                          mov             edi,dword ptr 0x4e[eax]
000E  89 FA                             mov             edx,edi
0010  B9 01 00 00 00                    mov             ecx,0x00000001
0015  E8 00 00 00 00                    call            _GetLineDataPointer_
001A  8B 5E 24                          mov             ebx,dword ptr 0x24[esi]
001D  89 C5                             mov             ebp,eax
001F  89 1C 24                          mov             dword ptr [esp],ebx
0022  EB 2D                             jmp             L$4
0024                            L$1:
0024  85 ED                             test            ebp,ebp
0026  75 10                             jne             L$2
0028  BB 00 00 00 00                    mov             ebx,offset DGROUP:L$13
002D  89 F0                             mov             eax,esi
002F  89 CA                             mov             edx,ecx
0031  E8 00 00 00 00                    call            _DisplayLineInWindow_
0036  EB 18                             jmp             L$3
0038                            L$2:
0038  8D 5D 09                          lea             ebx,0x9[ebp]
003B  89 F0                             mov             eax,esi
003D  89 CA                             mov             edx,ecx
003F  E8 00 00 00 00                    call            _DisplayLineInWindow_
0044  47                                inc             edi
0045  89 F0                             mov             eax,esi
0047  89 FA                             mov             edx,edi
0049  E8 00 00 00 00                    call            _GetLineDataPointer_
004E  89 C5                             mov             ebp,eax
0050                            L$3:
0050  41                                inc             ecx
0051                            L$4:
0051  3B 0C 24                          cmp             ecx,dword ptr [esp]
0054  7C CE                             jl              L$1
0056  83 C4 04                          add             esp,0x00000004
0059                            L$5:
0059  5D                                pop             ebp
005A  5F                                pop             edi
005B  5E                                pop             esi
005C  5A                                pop             edx
005D  59                                pop             ecx
005E  5B                                pop             ebx
005F  C3                                ret

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

0060                            _DisplayLineInWindowWithColor_:
0060  56                                push            esi
0061  57                                push            edi
0062  55                                push            ebp
0063  81 EC 14 01 00 00                 sub             esp,0x00000114
0069  89 C5                             mov             ebp,eax
006B  89 94 24 10 01 00 00              mov             dword ptr 0x110[esp],edx
0072  89 8C 24 08 01 00 00              mov             dword ptr 0x108[esp],ecx
0079  8B B4 24 2C 01 00 00              mov             esi,dword ptr 0x12c[esp]
0080  01 DE                             add             esi,ebx
0082  8B 40 3A                          mov             eax,dword ptr 0x3a[eax]
0085  89 F7                             mov             edi,esi
0087  89 84 24 0C 01 00 00              mov             dword ptr 0x10c[esp],eax
008E  06                                push            es
008F  8C D8                             mov             eax,ds
0091  8E C0                             mov             es,eax
0093  29 C9                             sub             ecx,ecx
0095  49                                dec             ecx
0096  31 C0                             xor             eax,eax
0098  F2 AE                             repne scasb
009A  F7 D1                             not             ecx
009C  49                                dec             ecx
009D  07                                pop             es
009E  83 FA 01                          cmp             edx,0x00000001
00A1  0F 8C 33 01 00 00                 jl              L$7
00A7  3B 55 24                          cmp             edx,dword ptr 0x24[ebp]
00AA  0F 8D 2A 01 00 00                 jge             L$7
00B0  8B BC 24 28 01 00 00              mov             edi,dword ptr 0x128[esp]
00B7  8B 45 20                          mov             eax,dword ptr 0x20[ebp]
00BA  29 F8                             sub             eax,edi
00BC  31 D2                             xor             edx,edx
00BE  89 C3                             mov             ebx,eax
00C0  39 C1                             cmp             ecx,eax
00C2  7D 02                             jge             L$6
00C4  89 C8                             mov             eax,ecx
00C6                            L$6:
00C6  89 E7                             mov             edi,esp
00C8  89 C1                             mov             ecx,eax
00CA  29 C3                             sub             ebx,eax
00CC  29 D1                             sub             ecx,edx
00CE  89 9C 24 00 01 00 00              mov             dword ptr 0x100[esp],ebx
00D5  89 8C 24 04 01 00 00              mov             dword ptr 0x104[esp],ecx
00DC  06                                push            es
00DD  8C D8                             mov             eax,ds
00DF  8E C0                             mov             es,eax
00E1  57                                push            edi
00E2  89 C8                             mov             eax,ecx
00E4  C1 E9 02                          shr             ecx,0x02
00E7  F2 A5                             repne movsd
00E9  8A C8                             mov             cl,al
00EB  80 E1 03                          and             cl,0x03
00EE  F2 A4                             repne movsb
00F0  5F                                pop             edi
00F1  07                                pop             es
00F2  89 E0                             mov             eax,esp
00F4  8B 94 24 04 01 00 00              mov             edx,dword ptr 0x104[esp]
00FB  8B 8C 24 0C 01 00 00              mov             ecx,dword ptr 0x10c[esp]
0102  8B B4 24 10 01 00 00              mov             esi,dword ptr 0x110[esp]
0109  01 D0                             add             eax,edx
010B  BA 20 00 00 00                    mov             edx,0x00000020
0110  4E                                dec             esi
0111  E8 00 00 00 00                    call            memset_
0116  8B 84 24 04 01 00 00              mov             eax,dword ptr 0x104[esp]
011D  8B 9C 24 00 01 00 00              mov             ebx,dword ptr 0x100[esp]
0124  51                                push            ecx
0125  01 D8                             add             eax,ebx
0127  30 D2                             xor             dl,dl
0129  89 B4 24 14 01 00 00              mov             dword ptr 0x114[esp],esi
0130  88 54 04 04                       mov             byte ptr 0x4[esp+eax],dl
0134  E8 00 00 00 00                    call            _GetDC
0139  8B 94 24 24 01 00 00              mov             edx,dword ptr 0x124[esp]
0140  89 C6                             mov             esi,eax
0142  8B 84 24 08 01 00 00              mov             eax,dword ptr 0x108[esp]
0149  8B 14 95 00 00 00 00              mov             edx,dword ptr __ColorMap[edx*4]
0150  8B 1C 85 00 00 00 00              mov             ebx,dword ptr __ColorMap[eax*4]
0157  89 F0                             mov             eax,esi
0159  E8 00 00 00 00                    call            _SetMyDC_
015E  8B 7D 20                          mov             edi,dword ptr 0x20[ebp]
0161  57                                push            edi
0162  8D 44 24 04                       lea             eax,0x4[esp]
0166  8B 55 2C                          mov             edx,dword ptr 0x2c[ebp]
0169  50                                push            eax
016A  8B 84 24 18 01 00 00              mov             eax,dword ptr 0x118[esp]
0171  0F AF C2                          imul            eax,edx
0174  8B 5D 28                          mov             ebx,dword ptr 0x28[ebp]
0177  50                                push            eax
0178  8B 84 24 38 01 00 00              mov             eax,dword ptr 0x138[esp]
017F  0F AF C3                          imul            eax,ebx
0182  50                                push            eax
0183  56                                push            esi
0184  E8 00 00 00 00                    call            _TextOutA
0189  56                                push            esi
018A  8B 8C 24 10 01 00 00              mov             ecx,dword ptr 0x110[esp]
0191  51                                push            ecx
0192  E8 00 00 00 00                    call            _ReleaseDC
0197  8B 84 24 10 01 00 00              mov             eax,dword ptr 0x110[esp]
019E  66 0F AF 45 20                    imul            ax,word ptr 0x20[ebp]
01A3  8B B4 24 2C 01 00 00              mov             esi,dword ptr 0x12c[esp]
01AA  8B 4D 20                          mov             ecx,dword ptr 0x20[ebp]
01AD  8B 9C 24 2C 01 00 00              mov             ebx,dword ptr 0x12c[esp]
01B4  29 F1                             sub             ecx,esi
01B6  01 D8                             add             eax,ebx
01B8  25 FF FF 00 00                    and             eax,0x0000ffff
01BD  8B 7D 32                          mov             edi,dword ptr 0x32[ebp]
01C0  89 E6                             mov             esi,esp
01C2  01 C7                             add             edi,eax
01C4  06                                push            es
01C5  8C D8                             mov             eax,ds
01C7  8E C0                             mov             es,eax
01C9  57                                push            edi
01CA  89 C8                             mov             eax,ecx
01CC  C1 E9 02                          shr             ecx,0x02
01CF  F2 A5                             repne movsd
01D1  8A C8                             mov             cl,al
01D3  80 E1 03                          and             cl,0x03
01D6  F2 A4                             repne movsb
01D8  5F                                pop             edi
01D9  07                                pop             es
01DA                            L$7:
01DA  81 C4 14 01 00 00                 add             esp,0x00000114
01E0  5D                                pop             ebp
01E1  5F                                pop             edi
01E2  5E                                pop             esi
01E3  C2 0C 00                          ret             0x000c

Routine Size: 390 bytes,    Routine Base: _TEXT + 0060

01E6                            _DisplayLineInWindow_:
01E6  51                                push            ecx
01E7  56                                push            esi
01E8  6A 00                             push            0x00000000
01EA  6A 00                             push            0x00000000
01EC  8B 70 0C                          mov             esi,dword ptr 0xc[eax]
01EF  56                                push            esi
01F0  8B 48 08                          mov             ecx,dword ptr 0x8[eax]
01F3  E8 00 00 00 00                    call            _DisplayLineInWindowWithColor_
01F8  5E                                pop             esi
01F9  59                                pop             ecx
01FA  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 01E6

01FB                            _ClearWindow_:
01FB  53                                push            ebx
01FC  51                                push            ecx
01FD  52                                push            edx
01FE  56                                push            esi
01FF  57                                push            edi
0200  55                                push            ebp
0201  83 EC 10                          sub             esp,0x00000010
0204  89 C6                             mov             esi,eax
0206  8B 58 20                          mov             ebx,dword ptr 0x20[eax]
0209  0F AF 58 24                       imul            ebx,dword ptr 0x24[eax]
020D  8B 78 3A                          mov             edi,dword ptr 0x3a[eax]
0210  8B 40 32                          mov             eax,dword ptr 0x32[eax]
0213  BA 20 00 00 00                    mov             edx,0x00000020
0218  E8 00 00 00 00                    call            memset_
021D  57                                push            edi
021E  E8 00 00 00 00                    call            _GetDC
0223  8B 4E 36                          mov             ecx,dword ptr 0x36[esi]
0226  51                                push            ecx
0227  50                                push            eax
0228  89 C3                             mov             ebx,eax
022A  E8 00 00 00 00                    call            _SelectObject
022F  6A 00                             push            0x00000000
0231  6A 00                             push            0x00000000
0233  6A 00                             push            0x00000000
0235  53                                push            ebx
0236  E8 00 00 00 00                    call            _SetBrushOrgEx
023B  89 E0                             mov             eax,esp
023D  50                                push            eax
023E  57                                push            edi
023F  E8 00 00 00 00                    call            _GetClientRect
0244  8B 6E 36                          mov             ebp,dword ptr 0x36[esi]
0247  55                                push            ebp
0248  8D 44 24 04                       lea             eax,0x4[esp]
024C  50                                push            eax
024D  53                                push            ebx
024E  E8 00 00 00 00                    call            _FillRect
0253  53                                push            ebx
0254  57                                push            edi
0255  E8 00 00 00 00                    call            _ReleaseDC
025A  83 C4 10                          add             esp,0x00000010
025D  E9 F7 FD FF FF                    jmp             L$5

Routine Size: 103 bytes,    Routine Base: _TEXT + 01FB

0262                            _ShiftWindow_:
0262  53                                push            ebx
0263  51                                push            ecx
0264  56                                push            esi
0265  57                                push            edi
0266  55                                push            ebp
0267  83 EC 18                          sub             esp,0x00000018
026A  89 C3                             mov             ebx,eax
026C  89 D5                             mov             ebp,edx
026E  89 D7                             mov             edi,edx
0270  F7 DF                             neg             edi
0272  0F AF 78 2C                       imul            edi,dword ptr 0x2c[eax]
0276  8B 70 3A                          mov             esi,dword ptr 0x3a[eax]
0279  89 E0                             mov             eax,esp
027B  50                                push            eax
027C  56                                push            esi
027D  E8 00 00 00 00                    call            _GetClientRect
0282  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0286  89 C2                             mov             edx,eax
0288  8B 4B 2C                          mov             ecx,dword ptr 0x2c[ebx]
028B  C1 FA 1F                          sar             edx,0x1f
028E  F7 F9                             idiv            ecx
0290  89 CA                             mov             edx,ecx
0292  0F AF D0                          imul            edx,eax
0295  89 E0                             mov             eax,esp
0297  50                                push            eax
0298  6A 00                             push            0x00000000
029A  57                                push            edi
029B  6A 00                             push            0x00000000
029D  56                                push            esi
029E  89 54 24 20                       mov             dword ptr 0x20[esp],edx
02A2  E8 00 00 00 00                    call            _ScrollWindow
02A7  85 ED                             test            ebp,ebp
02A9  7D 19                             jge             L$8
02AB  B8 FF FF FF FF                    mov             eax,0xffffffff
02B0  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
02B3  31 FF                             xor             edi,edi
02B5  83 EA 03                          sub             edx,0x00000003
02B8  89 7C 24 14                       mov             dword ptr 0x14[esp],edi
02BC  89 44 24 10                       mov             dword ptr 0x10[esp],eax
02C0  01 EA                             add             edx,ebp
02C2  EB 13                             jmp             L$9
02C4                            L$8:
02C4  BE 01 00 00 00                    mov             esi,0x00000001
02C9  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
02CC  89 EA                             mov             edx,ebp
02CE  48                                dec             eax
02CF  89 74 24 10                       mov             dword ptr 0x10[esp],esi
02D3  89 44 24 14                       mov             dword ptr 0x14[esp],eax
02D7                            L$9:
02D7  8B 73 20                          mov             esi,dword ptr 0x20[ebx]
02DA  0F AF F2                          imul            esi,edx
02DD  89 D1                             mov             ecx,edx
02DF  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
02E2  29 E9                             sub             ecx,ebp
02E4  0F AF C8                          imul            ecx,eax
02E7  8B 7B 32                          mov             edi,dword ptr 0x32[ebx]
02EA  01 FE                             add             esi,edi
02EC  01 CF                             add             edi,ecx
02EE  89 C1                             mov             ecx,eax
02F0  06                                push            es
02F1  8C D8                             mov             eax,ds
02F3  8E C0                             mov             es,eax
02F5  57                                push            edi
02F6  89 C8                             mov             eax,ecx
02F8  C1 E9 02                          shr             ecx,0x02
02FB  F2 A5                             repne movsd
02FD  8A C8                             mov             cl,al
02FF  80 E1 03                          and             cl,0x03
0302  F2 A4                             repne movsb
0304  5F                                pop             edi
0305  07                                pop             es
0306  3B 54 24 14                       cmp             edx,dword ptr 0x14[esp]
030A  74 06                             je              L$10
030C  03 54 24 10                       add             edx,dword ptr 0x10[esp]
0310  EB C5                             jmp             L$9
0312                            L$10:
0312  83 C4 18                          add             esp,0x00000018
0315  5D                                pop             ebp
0316  5F                                pop             edi
0317  5E                                pop             esi
0318  59                                pop             ecx
0319  5B                                pop             ebx
031A  C3                                ret

Routine Size: 185 bytes,    Routine Base: _TEXT + 0262

031B                            _ResizeWin_:
031B  56                                push            esi
031C  57                                push            edi
031D  55                                push            ebp
031E  89 C6                             mov             esi,eax
0320  89 D5                             mov             ebp,edx
0322  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0326  29 DA                             sub             edx,ebx
0328  42                                inc             edx
0329  8B 7E 2C                          mov             edi,dword ptr 0x2c[esi]
032C  89 D0                             mov             eax,edx
032E  C1 FA 1F                          sar             edx,0x1f
0331  F7 FF                             idiv            edi
0333  8D 78 01                          lea             edi,0x1[eax]
0336  8B 56 4A                          mov             edx,dword ptr 0x4a[esi]
0339  8B 46 4E                          mov             eax,dword ptr 0x4e[esi]
033C  29 C2                             sub             edx,eax
033E  39 FA                             cmp             edx,edi
0340  72 06                             jb              L$11
0342  01 F8                             add             eax,edi
0344  48                                dec             eax
0345  89 46 4A                          mov             dword ptr 0x4a[esi],eax
0348                            L$11:
0348  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
034C  89 CA                             mov             edx,ecx
034E  89 5E 14                          mov             dword ptr 0x14[esi],ebx
0351  29 EA                             sub             edx,ebp
0353  8B 5E 28                          mov             ebx,dword ptr 0x28[esi]
0356  42                                inc             edx
0357  89 46 1C                          mov             dword ptr 0x1c[esi],eax
035A  89 D0                             mov             eax,edx
035C  C1 FA 1F                          sar             edx,0x1f
035F  F7 FB                             idiv            ebx
0361  89 6E 10                          mov             dword ptr 0x10[esi],ebp
0364  89 4E 18                          mov             dword ptr 0x18[esi],ecx
0367  40                                inc             eax
0368  89 46 20                          mov             dword ptr 0x20[esi],eax
036B  8B 46 32                          mov             eax,dword ptr 0x32[esi]
036E  89 7E 24                          mov             dword ptr 0x24[esi],edi
0371  E8 00 00 00 00                    call            _MemFree_
0376  8B 46 20                          mov             eax,dword ptr 0x20[esi]
0379  0F AF 46 24                       imul            eax,dword ptr 0x24[esi]
037D  E8 00 00 00 00                    call            _MemAlloc_
0382  8B 5E 20                          mov             ebx,dword ptr 0x20[esi]
0385  0F AF 5E 24                       imul            ebx,dword ptr 0x24[esi]
0389  BA 20 00 00 00                    mov             edx,0x00000020
038E  89 46 32                          mov             dword ptr 0x32[esi],eax
0391  E8 00 00 00 00                    call            memset_
0396  8B 46 20                          mov             eax,dword ptr 0x20[esi]
0399  3B 46 63                          cmp             eax,dword ptr 0x63[esi]
039C  7E 03                             jle             L$12
039E  89 46 63                          mov             dword ptr 0x63[esi],eax
03A1                            L$12:
03A1  5D                                pop             ebp
03A2  5F                                pop             edi
03A3  5E                                pop             esi
03A4  C2 04 00                          ret             0x0004

Routine Size: 140 bytes,    Routine Base: _TEXT + 031B

No disassembly errors

Segment: CONST DWORD USE32 00000002 bytes
0000                            L$13:
0000  20 00                                            .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

