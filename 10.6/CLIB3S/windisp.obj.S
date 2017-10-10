Module: windisp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004C3 bytes
0000                            _DisplayAllLines:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 14                          sub             esp,0x00000014
0007  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
000B  83 7C 24 2C 00                    cmp             dword ptr 0x2c[esp],0x00000000
0010  74 51                             je              L$1
0012  8B 5E 3A                          mov             ebx,dword ptr 0x3a[esi]
0015  53                                push            ebx
0016  E8 00 00 00 00                    call            _GetDC
001B  8B 4E 36                          mov             ecx,dword ptr 0x36[esi]
001E  51                                push            ecx
001F  50                                push            eax
0020  89 C3                             mov             ebx,eax
0022  E8 00 00 00 00                    call            _SelectObject
0027  6A 00                             push            0x00000000
0029  6A 00                             push            0x00000000
002B  6A 00                             push            0x00000000
002D  53                                push            ebx
002E  8D 6C 24 10                       lea             ebp,0x10[esp]
0032  89 C7                             mov             edi,eax
0034  E8 00 00 00 00                    call            _SetBrushOrgEx
0039  55                                push            ebp
003A  8B 6E 3A                          mov             ebp,dword ptr 0x3a[esi]
003D  55                                push            ebp
003E  E8 00 00 00 00                    call            _GetClientRect
0043  8B 46 36                          mov             eax,dword ptr 0x36[esi]
0046  50                                push            eax
0047  8D 6C 24 04                       lea             ebp,0x4[esp]
004B  55                                push            ebp
004C  53                                push            ebx
004D  E8 00 00 00 00                    call            _FillRect
0052  57                                push            edi
0053  53                                push            ebx
0054  E8 00 00 00 00                    call            _SelectObject
0059  53                                push            ebx
005A  8B 56 3A                          mov             edx,dword ptr 0x3a[esi]
005D  52                                push            edx
005E  E8 00 00 00 00                    call            _ReleaseDC
0063                            L$1:
0063  8B 7E 4E                          mov             edi,dword ptr 0x4e[esi]
0066  57                                push            edi
0067  56                                push            esi
0068  E8 00 00 00 00                    call            _GetLineDataPointer
006D  83 C4 08                          add             esp,0x00000008
0070  8B 5E 24                          mov             ebx,dword ptr 0x24[esi]
0073  89 C5                             mov             ebp,eax
0075  89 5C 24 10                       mov             dword ptr 0x10[esp],ebx
0079  BB 01 00 00 00                    mov             ebx,0x00000001
007E  EB 31                             jmp             L$5
0080                            L$2:
0080  85 ED                             test            ebp,ebp
0082  75 11                             jne             L$3
0084  68 00 00 00 00                    push            offset DGROUP:L$21
0089  53                                push            ebx
008A  56                                push            esi
008B  E8 00 00 00 00                    call            _DisplayLineInWindow
0090  83 C4 0C                          add             esp,0x0000000c
0093  EB 1B                             jmp             L$4
0095                            L$3:
0095  83 C5 09                          add             ebp,0x00000009
0098  55                                push            ebp
0099  53                                push            ebx
009A  56                                push            esi
009B  E8 00 00 00 00                    call            _DisplayLineInWindow
00A0  83 C4 0C                          add             esp,0x0000000c
00A3  47                                inc             edi
00A4  57                                push            edi
00A5  56                                push            esi
00A6  E8 00 00 00 00                    call            _GetLineDataPointer
00AB  89 C5                             mov             ebp,eax
00AD  83 C4 08                          add             esp,0x00000008
00B0                            L$4:
00B0  43                                inc             ebx
00B1                            L$5:
00B1  3B 5C 24 10                       cmp             ebx,dword ptr 0x10[esp]
00B5  7C C9                             jl              L$2
00B7  83 C4 14                          add             esp,0x00000014
00BA  5D                                pop             ebp
00BB  5F                                pop             edi
00BC  5E                                pop             esi
00BD  5B                                pop             ebx
00BE  C3                                ret

Routine Size: 191 bytes,    Routine Base: _TEXT + 0000

00BF                            _DisplayLineInWindowWithColor:
00BF  53                                push            ebx
00C0  56                                push            esi
00C1  57                                push            edi
00C2  55                                push            ebp
00C3  81 EC 10 01 00 00                 sub             esp,0x00000110
00C9  8B B4 24 24 01 00 00              mov             esi,dword ptr 0x124[esp]
00D0  8B 94 24 3C 01 00 00              mov             edx,dword ptr 0x13c[esp]
00D7  52                                push            edx
00D8  8B 9C 24 30 01 00 00              mov             ebx,dword ptr 0x130[esp]
00DF  8B 46 3A                          mov             eax,dword ptr 0x3a[esi]
00E2  53                                push            ebx
00E3  89 84 24 0C 01 00 00              mov             dword ptr 0x10c[esp],eax
00EA  E8 00 00 00 00                    call            __mbsninc
00EF  83 C4 08                          add             esp,0x00000008
00F2  50                                push            eax
00F3  89 84 24 0C 01 00 00              mov             dword ptr 0x10c[esp],eax
00FA  E8 00 00 00 00                    call            __mbslen
00FF  83 C4 04                          add             esp,0x00000004
0102  8B 8C 24 28 01 00 00              mov             ecx,dword ptr 0x128[esp]
0109  83 F9 01                          cmp             ecx,0x00000001
010C  0F 8C 77 01 00 00                 jl              L$11
0112  3B 4E 24                          cmp             ecx,dword ptr 0x24[esi]
0115  0F 8D 6E 01 00 00                 jge             L$11
011B  8B 94 24 38 01 00 00              mov             edx,dword ptr 0x138[esp]
0122  8B 5E 20                          mov             ebx,dword ptr 0x20[esi]
0125  29 D3                             sub             ebx,edx
0127  31 ED                             xor             ebp,ebp
0129  89 9C 24 00 01 00 00              mov             dword ptr 0x100[esp],ebx
0130  39 D8                             cmp             eax,ebx
0132  7D 02                             jge             L$6
0134  89 C3                             mov             ebx,eax
0136                            L$6:
0136  89 D8                             mov             eax,ebx
0138  29 E8                             sub             eax,ebp
013A  50                                push            eax
013B  8B 8C 24 0C 01 00 00              mov             ecx,dword ptr 0x10c[esp]
0142  51                                push            ecx
0143  E8 00 00 00 00                    call            _mbsnbcnt
0148  83 C4 08                          add             esp,0x00000008
014B  89 C7                             mov             edi,eax
014D  8B 84 24 00 01 00 00              mov             eax,dword ptr 0x100[esp]
0154  29 D8                             sub             eax,ebx
0156  89 C3                             mov             ebx,eax
0158  89 F8                             mov             eax,edi
015A  29 E8                             sub             eax,ebp
015C  50                                push            eax
015D  8B AC 24 0C 01 00 00              mov             ebp,dword ptr 0x10c[esp]
0164  55                                push            ebp
0165  8D 44 24 08                       lea             eax,0x8[esp]
0169  50                                push            eax
016A  E8 00 00 00 00                    call            _mbsnbcpy
016F  83 C4 0C                          add             esp,0x0000000c
0172  53                                push            ebx
0173  8D 44 24 04                       lea             eax,0x4[esp]
0177  6A 20                             push            0x00000020
0179  01 F8                             add             eax,edi
017B  50                                push            eax
017C  E8 00 00 00 00                    call            memset
0181  83 C4 0C                          add             esp,0x0000000c
0184  01 FB                             add             ebx,edi
0186  53                                push            ebx
0187  8D 44 24 04                       lea             eax,0x4[esp]
018B  50                                push            eax
018C  E8 00 00 00 00                    call            __mbsninc
0191  83 C4 08                          add             esp,0x00000008
0194  C6 00 00                          mov             byte ptr [eax],0x00
0197  8B 94 24 28 01 00 00              mov             edx,dword ptr 0x128[esp]
019E  8B 84 24 04 01 00 00              mov             eax,dword ptr 0x104[esp]
01A5  4A                                dec             edx
01A6  50                                push            eax
01A7  89 94 24 2C 01 00 00              mov             dword ptr 0x12c[esp],edx
01AE  E8 00 00 00 00                    call            _GetDC
01B3  89 C3                             mov             ebx,eax
01B5  8B 84 24 30 01 00 00              mov             eax,dword ptr 0x130[esp]
01BC  8B 0C 85 00 00 00 00              mov             ecx,dword ptr _ColorMap[eax*4]
01C3  8B 84 24 34 01 00 00              mov             eax,dword ptr 0x134[esp]
01CA  51                                push            ecx
01CB  8B 3C 85 00 00 00 00              mov             edi,dword ptr _ColorMap[eax*4]
01D2  57                                push            edi
01D3  53                                push            ebx
01D4  E8 00 00 00 00                    call            _SetMyDC
01D9  83 C4 0C                          add             esp,0x0000000c
01DC  8B 6E 20                          mov             ebp,dword ptr 0x20[esi]
01DF  55                                push            ebp
01E0  8D 44 24 04                       lea             eax,0x4[esp]
01E4  50                                push            eax
01E5  E8 00 00 00 00                    call            _mbsnbcnt
01EA  83 C4 08                          add             esp,0x00000008
01ED  50                                push            eax
01EE  8D 44 24 04                       lea             eax,0x4[esp]
01F2  8B 56 2C                          mov             edx,dword ptr 0x2c[esi]
01F5  50                                push            eax
01F6  8B 84 24 30 01 00 00              mov             eax,dword ptr 0x130[esp]
01FD  0F AF C2                          imul            eax,edx
0200  50                                push            eax
0201  6A 00                             push            0x00000000
0203  53                                push            ebx
0204  E8 00 00 00 00                    call            _TextOutA
0209  53                                push            ebx
020A  8B 9C 24 08 01 00 00              mov             ebx,dword ptr 0x108[esp]
0211  53                                push            ebx
0212  E8 00 00 00 00                    call            _ReleaseDC
0217  8B 84 24 28 01 00 00              mov             eax,dword ptr 0x128[esp]
021E  66 0F AF 46 20                    imul            ax,word ptr 0x20[esi]
0223  8B 94 24 3C 01 00 00              mov             edx,dword ptr 0x13c[esp]
022A  31 FF                             xor             edi,edi
022C  01 C2                             add             edx,eax
022E  89 E3                             mov             ebx,esp
0230  89 94 24 0C 01 00 00              mov             dword ptr 0x10c[esp],edx
0237  EB 40                             jmp             L$10
0239                            L$7:
0239  53                                push            ebx
023A  E8 00 00 00 00                    call            _mbptov
023F  8B 2D 00 00 00 00                 mov             ebp,dword ptr __IsDBCS
0245  83 C4 04                          add             esp,0x00000004
0248  89 C1                             mov             ecx,eax
024A  85 ED                             test            ebp,ebp
024C  74 13                             je              L$8
024E  31 C0                             xor             eax,eax
0250  8A 03                             mov             al,byte ptr [ebx]
0252  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0258  24 01                             and             al,0x01
025A  25 FF 00 00 00                    and             eax,0x000000ff
025F  EB 02                             jmp             L$9
0261                            L$8:
0261  31 C0                             xor             eax,eax
0263                            L$9:
0263  43                                inc             ebx
0264  01 C3                             add             ebx,eax
0266  31 C0                             xor             eax,eax
0268  66 8B 84 24 0C 01 00 00           mov             ax,word ptr 0x10c[esp]
0270  8B 56 32                          mov             edx,dword ptr 0x32[esi]
0273  01 F8                             add             eax,edi
0275  47                                inc             edi
0276  89 0C 82                          mov             dword ptr [edx+eax*4],ecx
0279                            L$10:
0279  8B 8C 24 3C 01 00 00              mov             ecx,dword ptr 0x13c[esp]
0280  8B 46 20                          mov             eax,dword ptr 0x20[esi]
0283  29 C8                             sub             eax,ecx
0285  39 C7                             cmp             edi,eax
0287  7C B0                             jl              L$7
0289                            L$11:
0289  81 C4 10 01 00 00                 add             esp,0x00000110
028F  5D                                pop             ebp
0290  5F                                pop             edi
0291  5E                                pop             esi
0292  5B                                pop             ebx
0293  C3                                ret

Routine Size: 469 bytes,    Routine Base: _TEXT + 00BF

0294                            _DisplayLineInWindow:
0294  53                                push            ebx
0295  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0299  6A 00                             push            0x00000000
029B  6A 00                             push            0x00000000
029D  8B 58 0C                          mov             ebx,dword ptr 0xc[eax]
02A0  53                                push            ebx
02A1  8B 50 08                          mov             edx,dword ptr 0x8[eax]
02A4  52                                push            edx
02A5  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
02A9  52                                push            edx
02AA  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
02AE  53                                push            ebx
02AF  50                                push            eax
02B0  E8 00 00 00 00                    call            _DisplayLineInWindowWithColor
02B5  83 C4 1C                          add             esp,0x0000001c
02B8  5B                                pop             ebx
02B9  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0294

02BA                            _ClearWindow:
02BA  53                                push            ebx
02BB  56                                push            esi
02BC  57                                push            edi
02BD  83 EC 10                          sub             esp,0x00000010
02C0  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
02C4  68 00 00 00 00                    push            offset DGROUP:L$21
02C9  8B 7B 3A                          mov             edi,dword ptr 0x3a[ebx]
02CC  E8 00 00 00 00                    call            _mbptov
02D1  83 C4 04                          add             esp,0x00000004
02D4  89 C6                             mov             esi,eax
02D6  31 C9                             xor             ecx,ecx
02D8  31 D2                             xor             edx,edx
02DA  EB 0A                             jmp             L$13
02DC                            L$12:
02DC  8B 43 32                          mov             eax,dword ptr 0x32[ebx]
02DF  41                                inc             ecx
02E0  89 34 02                          mov             dword ptr [edx+eax],esi
02E3  83 C2 04                          add             edx,0x00000004
02E6                            L$13:
02E6  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
02E9  0F AF 43 24                       imul            eax,dword ptr 0x24[ebx]
02ED  39 C1                             cmp             ecx,eax
02EF  7C EB                             jl              L$12
02F1  57                                push            edi
02F2  E8 00 00 00 00                    call            _GetDC
02F7  89 C6                             mov             esi,eax
02F9  8B 43 36                          mov             eax,dword ptr 0x36[ebx]
02FC  50                                push            eax
02FD  56                                push            esi
02FE  E8 00 00 00 00                    call            _SelectObject
0303  6A 00                             push            0x00000000
0305  6A 00                             push            0x00000000
0307  6A 00                             push            0x00000000
0309  56                                push            esi
030A  E8 00 00 00 00                    call            _SetBrushOrgEx
030F  89 E0                             mov             eax,esp
0311  50                                push            eax
0312  57                                push            edi
0313  E8 00 00 00 00                    call            _GetClientRect
0318  8B 53 36                          mov             edx,dword ptr 0x36[ebx]
031B  52                                push            edx
031C  8D 44 24 04                       lea             eax,0x4[esp]
0320  50                                push            eax
0321  56                                push            esi
0322  E8 00 00 00 00                    call            _FillRect
0327  56                                push            esi
0328  57                                push            edi
0329  E8 00 00 00 00                    call            _ReleaseDC
032E  83 C4 10                          add             esp,0x00000010
0331  5F                                pop             edi
0332  5E                                pop             esi
0333  5B                                pop             ebx
0334  C3                                ret

Routine Size: 123 bytes,    Routine Base: _TEXT + 02BA

0335                            _ShiftWindow:
0335  53                                push            ebx
0336  56                                push            esi
0337  57                                push            edi
0338  55                                push            ebp
0339  83 EC 18                          sub             esp,0x00000018
033C  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0340  8B 6C 24 30                       mov             ebp,dword ptr 0x30[esp]
0344  89 EF                             mov             edi,ebp
0346  8B 53 2C                          mov             edx,dword ptr 0x2c[ebx]
0349  F7 DF                             neg             edi
034B  0F AF FA                          imul            edi,edx
034E  89 E0                             mov             eax,esp
0350  50                                push            eax
0351  8B 73 3A                          mov             esi,dword ptr 0x3a[ebx]
0354  56                                push            esi
0355  E8 00 00 00 00                    call            _GetClientRect
035A  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
035E  42                                inc             edx
035F  8B 4B 2C                          mov             ecx,dword ptr 0x2c[ebx]
0362  89 D0                             mov             eax,edx
0364  C1 FA 1F                          sar             edx,0x1f
0367  F7 F9                             idiv            ecx
0369  89 CA                             mov             edx,ecx
036B  0F AF D0                          imul            edx,eax
036E  89 E0                             mov             eax,esp
0370  50                                push            eax
0371  6A 00                             push            0x00000000
0373  57                                push            edi
0374  6A 00                             push            0x00000000
0376  56                                push            esi
0377  89 54 24 20                       mov             dword ptr 0x20[esp],edx
037B  E8 00 00 00 00                    call            _ScrollWindow
0380  85 ED                             test            ebp,ebp
0382  7D 19                             jge             L$14
0384  B8 FF FF FF FF                    mov             eax,0xffffffff
0389  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
038C  31 FF                             xor             edi,edi
038E  83 EA 03                          sub             edx,0x00000003
0391  89 7C 24 10                       mov             dword ptr 0x10[esp],edi
0395  89 44 24 14                       mov             dword ptr 0x14[esp],eax
0399  01 EA                             add             edx,ebp
039B  EB 13                             jmp             L$15
039D                            L$14:
039D  BE 01 00 00 00                    mov             esi,0x00000001
03A2  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
03A5  89 EA                             mov             edx,ebp
03A7  48                                dec             eax
03A8  89 74 24 14                       mov             dword ptr 0x14[esp],esi
03AC  89 44 24 10                       mov             dword ptr 0x10[esp],eax
03B0                            L$15:
03B0  8B 73 20                          mov             esi,dword ptr 0x20[ebx]
03B3  0F AF F2                          imul            esi,edx
03B6  89 D1                             mov             ecx,edx
03B8  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
03BB  29 E9                             sub             ecx,ebp
03BD  0F AF C8                          imul            ecx,eax
03C0  8B 7B 32                          mov             edi,dword ptr 0x32[ebx]
03C3  C1 E6 02                          shl             esi,0x02
03C6  C1 E1 02                          shl             ecx,0x02
03C9  01 FE                             add             esi,edi
03CB  01 CF                             add             edi,ecx
03CD  89 C1                             mov             ecx,eax
03CF  C1 E1 02                          shl             ecx,0x02
03D2  06                                push            es
03D3  8C D8                             mov             eax,ds
03D5  8E C0                             mov             es,eax
03D7  57                                push            edi
03D8  89 C8                             mov             eax,ecx
03DA  C1 E9 02                          shr             ecx,0x02
03DD  F2 A5                             repne movsd
03DF  8A C8                             mov             cl,al
03E1  80 E1 03                          and             cl,0x03
03E4  F2 A4                             repne movsb
03E6  5F                                pop             edi
03E7  07                                pop             es
03E8  3B 54 24 10                       cmp             edx,dword ptr 0x10[esp]
03EC  74 06                             je              L$16
03EE  03 54 24 14                       add             edx,dword ptr 0x14[esp]
03F2  EB BC                             jmp             L$15
03F4                            L$16:
03F4  83 C4 18                          add             esp,0x00000018
03F7  5D                                pop             ebp
03F8  5F                                pop             edi
03F9  5E                                pop             esi
03FA  5B                                pop             ebx
03FB  C3                                ret

Routine Size: 199 bytes,    Routine Base: _TEXT + 0335

03FC                            _ResizeWin:
03FC  53                                push            ebx
03FD  56                                push            esi
03FE  57                                push            edi
03FF  55                                push            ebp
0400  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0404  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
0408  2B 54 24 1C                       sub             edx,dword ptr 0x1c[esp]
040C  42                                inc             edx
040D  8B 73 2C                          mov             esi,dword ptr 0x2c[ebx]
0410  89 D0                             mov             eax,edx
0412  C1 FA 1F                          sar             edx,0x1f
0415  F7 FE                             idiv            esi
0417  8D 48 01                          lea             ecx,0x1[eax]
041A  8B 7B 4E                          mov             edi,dword ptr 0x4e[ebx]
041D  8B 43 4A                          mov             eax,dword ptr 0x4a[ebx]
0420  29 F8                             sub             eax,edi
0422  39 C8                             cmp             eax,ecx
0424  72 07                             jb              L$17
0426  8D 44 0F FF                       lea             eax,-0x1[edi+ecx]
042A  89 43 4A                          mov             dword ptr 0x4a[ebx],eax
042D                            L$17:
042D  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
0431  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0435  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
0439  89 43 10                          mov             dword ptr 0x10[ebx],eax
043C  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0440  8B 73 28                          mov             esi,dword ptr 0x28[ebx]
0443  89 43 18                          mov             dword ptr 0x18[ebx],eax
0446  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
044A  29 EA                             sub             edx,ebp
044C  89 43 14                          mov             dword ptr 0x14[ebx],eax
044F  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
0453  42                                inc             edx
0454  89 43 1C                          mov             dword ptr 0x1c[ebx],eax
0457  89 D0                             mov             eax,edx
0459  C1 FA 1F                          sar             edx,0x1f
045C  F7 FE                             idiv            esi
045E  8B 7B 32                          mov             edi,dword ptr 0x32[ebx]
0461  89 4B 24                          mov             dword ptr 0x24[ebx],ecx
0464  40                                inc             eax
0465  57                                push            edi
0466  89 43 20                          mov             dword ptr 0x20[ebx],eax
0469  E8 00 00 00 00                    call            _MemFree
046E  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
0471  8B 6B 24                          mov             ebp,dword ptr 0x24[ebx]
0474  C1 E0 02                          shl             eax,0x02
0477  0F AF C5                          imul            eax,ebp
047A  83 C4 04                          add             esp,0x00000004
047D  50                                push            eax
047E  E8 00 00 00 00                    call            _MemAlloc
0483  83 C4 04                          add             esp,0x00000004
0486  68 00 00 00 00                    push            offset DGROUP:L$21
048B  89 43 32                          mov             dword ptr 0x32[ebx],eax
048E  E8 00 00 00 00                    call            _mbptov
0493  83 C4 04                          add             esp,0x00000004
0496  89 C6                             mov             esi,eax
0498  31 D2                             xor             edx,edx
049A  31 C9                             xor             ecx,ecx
049C  EB 0A                             jmp             L$19
049E                            L$18:
049E  8B 43 32                          mov             eax,dword ptr 0x32[ebx]
04A1  42                                inc             edx
04A2  89 34 01                          mov             dword ptr [ecx+eax],esi
04A5  83 C1 04                          add             ecx,0x00000004
04A8                            L$19:
04A8  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
04AB  0F AF 43 24                       imul            eax,dword ptr 0x24[ebx]
04AF  39 C2                             cmp             edx,eax
04B1  7C EB                             jl              L$18
04B3  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
04B6  3B 43 63                          cmp             eax,dword ptr 0x63[ebx]
04B9  7E 03                             jle             L$20
04BB  89 43 63                          mov             dword ptr 0x63[ebx],eax
04BE                            L$20:
04BE  5D                                pop             ebp
04BF  5F                                pop             edi
04C0  5E                                pop             esi
04C1  5B                                pop             ebx
04C2  C3                                ret

Routine Size: 199 bytes,    Routine Base: _TEXT + 03FC

No disassembly errors

Segment: CONST DWORD USE32 00000002 bytes
0000                            L$21:
0000  20 00                                            .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

