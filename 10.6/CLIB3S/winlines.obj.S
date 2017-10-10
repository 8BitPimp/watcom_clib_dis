Module: winlines
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000009AA bytes
0000                            createNewEntry:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 53 57                          mov             edx,dword ptr 0x57[ebx]
000A  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
000D  52                                push            edx
000E  83 C0 09                          add             eax,0x00000009
0011  50                                push            eax
0012  E8 00 00 00 00                    call            __mbsninc
0017  C6 00 00                          mov             byte ptr [eax],0x00
001A  83 C4 08                          add             esp,0x00000008
001D  8B 4B 57                          mov             ecx,dword ptr 0x57[ebx]
0020  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0023  51                                push            ecx
0024  83 C0 09                          add             eax,0x00000009
0027  50                                push            eax
0028  E8 00 00 00 00                    call            _mbsnbcnt
002D  83 C4 08                          add             esp,0x00000008
0030  83 C0 0A                          add             eax,0x0000000a
0033  50                                push            eax
0034  E8 00 00 00 00                    call            _MemAlloc
0039  89 C2                             mov             edx,eax
003B  83 C4 04                          add             esp,0x00000004
003E  8B 73 53                          mov             esi,dword ptr 0x53[ebx]
0041  89 C1                             mov             ecx,eax
0043  83 C6 09                          add             esi,0x00000009
0046  8D 78 09                          lea             edi,0x9[eax]
0049  C7 43 57 00 00 00 00              mov             dword ptr 0x57[ebx],0x00000000
0050  57                                push            edi
0051                            L$1:
0051  8A 06                             mov             al,byte ptr [esi]
0053  88 07                             mov             byte ptr [edi],al
0055  3C 00                             cmp             al,0x00
0057  74 10                             je              L$2
0059  8A 46 01                          mov             al,byte ptr 0x1[esi]
005C  83 C6 02                          add             esi,0x00000002
005F  88 47 01                          mov             byte ptr 0x1[edi],al
0062  83 C7 02                          add             edi,0x00000002
0065  3C 00                             cmp             al,0x00
0067  75 E8                             jne             L$1
0069                            L$2:
0069  5F                                pop             edi
006A  8B 73 42                          mov             esi,dword ptr 0x42[ebx]
006D  85 F6                             test            esi,esi
006F  75 08                             jne             L$3
0071  89 53 42                          mov             dword ptr 0x42[ebx],edx
0074  89 53 3E                          mov             dword ptr 0x3e[ebx],edx
0077  EB 0B                             jmp             L$4
0079                            L$3:
0079  89 16                             mov             dword ptr [esi],edx
007B  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
007E  89 42 04                          mov             dword ptr 0x4[edx],eax
0081  89 53 42                          mov             dword ptr 0x42[ebx],edx
0084                            L$4:
0084  89 C8                             mov             eax,ecx
0086  5F                                pop             edi
0087  5E                                pop             esi
0088  5B                                pop             ebx
0089  C3                                ret
008A                            incrementLastLineNumber:
008A  53                                push            ebx
008B  56                                push            esi
008C  57                                push            edi
008D  55                                push            ebp
008E  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0092  8B 53 46                          mov             edx,dword ptr 0x46[ebx]
0095  42                                inc             edx
0096  8B 0D 00 00 00 00                 mov             ecx,dword ptr _AutoClearLines
009C  89 53 46                          mov             dword ptr 0x46[ebx],edx
009F  39 CA                             cmp             edx,ecx
00A1  76 08                             jbe             L$5
00A3  53                                push            ebx
00A4  E8 00 00 00 00                    call            _FreeAllLines
00A9  EB 35                             jmp             L$7
00AB                            L$5:
00AB  89 D0                             mov             eax,edx
00AD  8B 73 4E                          mov             esi,dword ptr 0x4e[ebx]
00B0  8B 7B 24                          mov             edi,dword ptr 0x24[ebx]
00B3  29 F0                             sub             eax,esi
00B5  39 F8                             cmp             eax,edi
00B7  7D 21                             jge             L$6
00B9  8B 6B 4A                          mov             ebp,dword ptr 0x4a[ebx]
00BC  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
00BF  45                                inc             ebp
00C0  4A                                dec             edx
00C1  89 6B 4A                          mov             dword ptr 0x4a[ebx],ebp
00C4  39 D0                             cmp             eax,edx
00C6  75 12                             jne             L$6
00C8  8B 43 4E                          mov             eax,dword ptr 0x4e[ebx]
00CB  6A 01                             push            0x00000001
00CD  40                                inc             eax
00CE  53                                push            ebx
00CF  89 43 4E                          mov             dword ptr 0x4e[ebx],eax
00D2  E8 00 00 00 00                    call            _ShiftWindow
00D7  83 C4 08                          add             esp,0x00000008
00DA                            L$6:
00DA  53                                push            ebx
00DB  E8 00 00 00 00                    call            _PositionScrollThumb
00E0                            L$7:
00E0  83 C4 04                          add             esp,0x00000004
00E3  5D                                pop             ebp
00E4  5F                                pop             edi
00E5  5E                                pop             esi
00E6  5B                                pop             ebx
00E7  C3                                ret
00E8                            replaceTail:
00E8  53                                push            ebx
00E9  56                                push            esi
00EA  57                                push            edi
00EB  55                                push            ebp
00EC  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
00F0  8B 53 57                          mov             edx,dword ptr 0x57[ebx]
00F3  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
00F6  52                                push            edx
00F7  83 C0 09                          add             eax,0x00000009
00FA  50                                push            eax
00FB  E8 00 00 00 00                    call            __mbsninc
0100  C6 00 00                          mov             byte ptr [eax],0x00
0103  83 C4 08                          add             esp,0x00000008
0106  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
0109  50                                push            eax
010A  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
010D  E8 00 00 00 00                    call            _MemFree
0112  8B 43 57                          mov             eax,dword ptr 0x57[ebx]
0115  01 C0                             add             eax,eax
0117  83 C4 04                          add             esp,0x00000004
011A  83 C0 0A                          add             eax,0x0000000a
011D  50                                push            eax
011E  E8 00 00 00 00                    call            _MemAlloc
0123  83 C4 04                          add             esp,0x00000004
0126  8B 73 53                          mov             esi,dword ptr 0x53[ebx]
0129  89 43 42                          mov             dword ptr 0x42[ebx],eax
012C  83 C6 09                          add             esi,0x00000009
012F  8D 78 09                          lea             edi,0x9[eax]
0132  57                                push            edi
0133                            L$8:
0133  8A 06                             mov             al,byte ptr [esi]
0135  88 07                             mov             byte ptr [edi],al
0137  3C 00                             cmp             al,0x00
0139  74 10                             je              L$9
013B  8A 46 01                          mov             al,byte ptr 0x1[esi]
013E  83 C6 02                          add             esi,0x00000002
0141  88 47 01                          mov             byte ptr 0x1[edi],al
0144  83 C7 02                          add             edi,0x00000002
0147  3C 00                             cmp             al,0x00
0149  75 E8                             jne             L$8
014B                            L$9:
014B  5F                                pop             edi
014C  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
014F  89 68 04                          mov             dword ptr 0x4[eax],ebp
0152  85 ED                             test            ebp,ebp
0154  74 08                             je              L$10
0156  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
0159  89 45 00                          mov             dword ptr [ebp],eax
015C  EB 06                             jmp             L$11
015E                            L$10:
015E  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
0161  89 43 3E                          mov             dword ptr 0x3e[ebx],eax
0164                            L$11:
0164  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
0167  83 C0 09                          add             eax,0x00000009
016A  8B 4B 4E                          mov             ecx,dword ptr 0x4e[ebx]
016D  50                                push            eax
016E  8B 43 46                          mov             eax,dword ptr 0x46[ebx]
0171  29 C8                             sub             eax,ecx
0173  40                                inc             eax
0174  50                                push            eax
0175  53                                push            ebx
0176  E8 00 00 00 00                    call            _DisplayLineInWindow
017B  83 C4 0C                          add             esp,0x0000000c
017E  5D                                pop             ebp
017F  5F                                pop             edi
0180  5E                                pop             esi
0181  5B                                pop             ebx
0182  C3                                ret
0183                            addBuff:
0183  53                                push            ebx
0184  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0188  53                                push            ebx
0189  E8 00 00 00 00                    call            createNewEntry
018E  83 C0 09                          add             eax,0x00000009
0191  83 C4 04                          add             esp,0x00000004
0194  C6 40 FF 01                       mov             byte ptr -0x1[eax],0x01
0198  50                                push            eax
0199  8B 53 4E                          mov             edx,dword ptr 0x4e[ebx]
019C  8B 43 46                          mov             eax,dword ptr 0x46[ebx]
019F  29 D0                             sub             eax,edx
01A1  40                                inc             eax
01A2  50                                push            eax
01A3  53                                push            ebx
01A4  E8 00 00 00 00                    call            _DisplayLineInWindow
01A9  83 C4 0C                          add             esp,0x0000000c
01AC  5B                                pop             ebx
01AD  C3                                ret
01AE                            updateBuff:
01AE  53                                push            ebx
01AF  56                                push            esi
01B0  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
01B4  83 7B 3E 00                       cmp             dword ptr 0x3e[ebx],0x00000000
01B8  74 09                             je              L$12
01BA  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
01BD  80 78 08 00                       cmp             byte ptr 0x8[eax],0x00
01C1  74 11                             je              L$13
01C3                            L$12:
01C3  53                                push            ebx
01C4  8B 73 57                          mov             esi,dword ptr 0x57[ebx]
01C7  E8 00 00 00 00                    call            addBuff
01CC  83 C4 04                          add             esp,0x00000004
01CF  89 73 57                          mov             dword ptr 0x57[ebx],esi
01D2  EB 09                             jmp             L$14
01D4                            L$13:
01D4  53                                push            ebx
01D5  E8 00 00 00 00                    call            replaceTail
01DA  83 C4 04                          add             esp,0x00000004
01DD                            L$14:
01DD  8B 5B 42                          mov             ebx,dword ptr 0x42[ebx]
01E0  C6 43 08 00                       mov             byte ptr 0x8[ebx],0x00
01E4  5E                                pop             esi
01E5  5B                                pop             ebx
01E6  C3                                ret
01E7                            newLine:
01E7  53                                push            ebx
01E8  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
01EC  8B 53 42                          mov             edx,dword ptr 0x42[ebx]
01EF  85 D2                             test            edx,edx
01F1  74 1F                             je              L$15
01F3  80 7A 08 00                       cmp             byte ptr 0x8[edx],0x00
01F7  75 19                             jne             L$15
01F9  53                                push            ebx
01FA  E8 00 00 00 00                    call            replaceTail
01FF  8B 43 42                          mov             eax,dword ptr 0x42[ebx]
0202  C7 43 57 00 00 00 00              mov             dword ptr 0x57[ebx],0x00000000
0209  83 C4 04                          add             esp,0x00000004
020C  C6 40 08 01                       mov             byte ptr 0x8[eax],0x01
0210  EB 09                             jmp             L$16
0212                            L$15:
0212  53                                push            ebx
0213  E8 00 00 00 00                    call            addBuff
0218  83 C4 04                          add             esp,0x00000004
021B                            L$16:
021B  53                                push            ebx
021C  C7 43 67 00 00 00 00              mov             dword ptr 0x67[ebx],0x00000000
0223  E8 00 00 00 00                    call            incrementLastLineNumber
0228  83 C4 04                          add             esp,0x00000004
022B  5B                                pop             ebx
022C  C3                                ret

Routine Size: 557 bytes,    Routine Base: _TEXT + 0000

022D                            _AddLine:
022D  53                                push            ebx
022E  56                                push            esi
022F  57                                push            edi
0230  55                                push            ebp
0231  83 EC 10                          sub             esp,0x00000010
0234  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0238  8B 6C 24 28                       mov             ebp,dword ptr 0x28[esp]
023C  31 D2                             xor             edx,edx
023E  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0242  89 54 24 04                       mov             dword ptr 0x4[esp],edx
0246  E8 00 00 00 00                    call            _AccessWinLines
024B  8B 7B 42                          mov             edi,dword ptr 0x42[ebx]
024E  31 F6                             xor             esi,esi
0250  85 FF                             test            edi,edi
0252  74 47                             je              L$19
0254  8A 57 08                          mov             dl,byte ptr 0x8[edi]
0257  89 F8                             mov             eax,edi
0259  84 D2                             test            dl,dl
025B  75 3E                             jne             L$19
025D  8D 77 09                          lea             esi,0x9[edi]
0260  8B 7B 53                          mov             edi,dword ptr 0x53[ebx]
0263  83 C7 09                          add             edi,0x00000009
0266  57                                push            edi
0267                            L$17:
0267  8A 06                             mov             al,byte ptr [esi]
0269  88 07                             mov             byte ptr [edi],al
026B  3C 00                             cmp             al,0x00
026D  74 10                             je              L$18
026F  8A 46 01                          mov             al,byte ptr 0x1[esi]
0272  83 C6 02                          add             esi,0x00000002
0275  88 47 01                          mov             byte ptr 0x1[edi],al
0278  83 C7 02                          add             edi,0x00000002
027B  3C 00                             cmp             al,0x00
027D  75 E8                             jne             L$17
027F                            L$18:
027F  5F                                pop             edi
0280  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0283  83 C0 09                          add             eax,0x00000009
0286  50                                push            eax
0287  E8 00 00 00 00                    call            __mbslen
028C  83 C4 04                          add             esp,0x00000004
028F  8B 53 57                          mov             edx,dword ptr 0x57[ebx]
0292  89 C6                             mov             esi,eax
0294  39 D0                             cmp             eax,edx
0296  7E 03                             jle             L$19
0298  89 43 57                          mov             dword ptr 0x57[ebx],eax
029B                            L$19:
029B  F6 43 52 10                       test            byte ptr 0x52[ebx],0x10
029F  74 02                             je              L$20
02A1  31 F6                             xor             esi,esi
02A3                            L$20:
02A3  31 FF                             xor             edi,edi
02A5  E9 8A 02 00 00                    jmp             L$44
02AA                            L$21:
02AA  80 63 52 EF                       and             byte ptr 0x52[ebx],0xef
02AE                            L$22:
02AE  31 C0                             xor             eax,eax
02B0  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
02B4  89 04 24                          mov             dword ptr [esp],eax
02B7  85 D2                             test            edx,edx
02B9  74 3D                             je              L$24
02BB  68 00 00 00 00                    push            offset DGROUP:L$72
02C0  8D 44 24 10                       lea             eax,0x10[esp]
02C4  50                                push            eax
02C5  E8 00 00 00 00                    call            _mbccpy
02CA  A1 00 00 00 00                    mov             eax,dword ptr __IsDBCS
02CF  83 C4 08                          add             esp,0x00000008
02D2  85 C0                             test            eax,eax
02D4  74 13                             je              L$23
02D6  31 C0                             xor             eax,eax
02D8  8A 44 24 0C                       mov             al,byte ptr 0xc[esp]
02DC  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
02E2  24 01                             and             al,0x01
02E4  25 FF 00 00 00                    and             eax,0x000000ff
02E9                            L$23:
02E9  30 F6                             xor             dh,dh
02EB  88 74 04 0D                       mov             byte ptr 0xd[esp+eax],dh
02EF  FF 4C 24 08                       dec             dword ptr 0x8[esp]
02F3  E9 BB 00 00 00                    jmp             L$32
02F8                            L$24:
02F8  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
02FC  85 C9                             test            ecx,ecx
02FE  74 47                             je              L$27
0300  68 02 00 00 00                    push            offset DGROUP:L$73
0305  8D 44 24 10                       lea             eax,0x10[esp]
0309  50                                push            eax
030A  E8 00 00 00 00                    call            _mbccpy
030F  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0315  83 C4 08                          add             esp,0x00000008
0318  85 D2                             test            edx,edx
031A  74 15                             je              L$25
031C  31 C0                             xor             eax,eax
031E  8A 44 24 0C                       mov             al,byte ptr 0xc[esp]
0322  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0328  24 01                             and             al,0x01
032A  25 FF 00 00 00                    and             eax,0x000000ff
032F  EB 02                             jmp             L$26
0331                            L$25:
0331  31 C0                             xor             eax,eax
0333                            L$26:
0333  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0337  30 D2                             xor             dl,dl
0339  49                                dec             ecx
033A  88 54 04 0D                       mov             byte ptr 0xd[esp+eax],dl
033E  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
0342  E9 6C 00 00 00                    jmp             L$32
0347                            L$27:
0347  A1 00 00 00 00                    mov             eax,dword ptr DGROUP:L$86
034C  85 C0                             test            eax,eax
034E  75 46                             jne             L$30
0350  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0357  74 10                             je              L$28
0359  8A 45 00                          mov             al,byte ptr [ebp]
035C  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0362  24 01                             and             al,0x01
0364  25 FF 00 00 00                    and             eax,0x000000ff
0369                            L$28:
0369  85 C0                             test            eax,eax
036B  74 1A                             je              L$29
036D  C7 05 00 00 00 00 01 00 00 00
                                        mov             dword ptr DGROUP:L$86,0x00000001
0377  8A 45 00                          mov             al,byte ptr [ebp]
037A  A2 04 00 00 00                    mov             byte ptr DGROUP:L$87,al
037F  30 E4                             xor             ah,ah
0381  88 64 24 0C                       mov             byte ptr 0xc[esp],ah
0385  EB 2B                             jmp             L$31
0387                            L$29:
0387  8A 45 00                          mov             al,byte ptr [ebp]
038A  88 44 24 0C                       mov             byte ptr 0xc[esp],al
038E  30 C0                             xor             al,al
0390  88 44 24 0D                       mov             byte ptr 0xd[esp],al
0394  EB 1C                             jmp             L$31
0396                            L$30:
0396  A0 04 00 00 00                    mov             al,byte ptr DGROUP:L$87
039B  88 44 24 0C                       mov             byte ptr 0xc[esp],al
039F  89 15 00 00 00 00                 mov             dword ptr DGROUP:L$86,edx
03A5  8A 45 00                          mov             al,byte ptr [ebp]
03A8  30 F5                             xor             ch,dh
03AA  88 44 24 0D                       mov             byte ptr 0xd[esp],al
03AE  88 6C 24 0E                       mov             byte ptr 0xe[esp],ch
03B2                            L$31:
03B2  45                                inc             ebp
03B3                            L$32:
03B3  6A 01                             push            0x00000001
03B5  68 04 00 00 00                    push            offset DGROUP:L$74
03BA  8D 44 24 14                       lea             eax,0x14[esp]
03BE  50                                push            eax
03BF  E8 00 00 00 00                    call            _mbsncmp
03C4  83 C4 0C                          add             esp,0x0000000c
03C7  85 C0                             test            eax,eax
03C9  75 20                             jne             L$33
03CB  89 F2                             mov             edx,esi
03CD  89 F0                             mov             eax,esi
03CF  C1 FA 1F                          sar             edx,0x1f
03D2  C1 E2 03                          shl             edx,0x03
03D5  1B C2                             sbb             eax,edx
03D7  C1 F8 03                          sar             eax,0x03
03DA  C1 E0 03                          shl             eax,0x03
03DD  83 C0 08                          add             eax,0x00000008
03E0  29 F0                             sub             eax,esi
03E2  89 44 24 08                       mov             dword ptr 0x8[esp],eax
03E6  E9 32 01 00 00                    jmp             L$43
03EB                            L$33:
03EB  6A 01                             push            0x00000001
03ED  68 06 00 00 00                    push            offset DGROUP:L$75
03F2  8D 44 24 14                       lea             eax,0x14[esp]
03F6  50                                push            eax
03F7  E8 00 00 00 00                    call            _mbsncmp
03FC  83 C4 0C                          add             esp,0x0000000c
03FF  85 C0                             test            eax,eax
0401  75 0C                             jne             L$34
0403  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
0406  89 44 24 04                       mov             dword ptr 0x4[esp],eax
040A  E9 0E 01 00 00                    jmp             L$43
040F                            L$34:
040F  6A 01                             push            0x00000001
0411  68 08 00 00 00                    push            offset DGROUP:L$76
0416  8D 44 24 14                       lea             eax,0x14[esp]
041A  50                                push            eax
041B  E8 00 00 00 00                    call            _mbsncmp
0420  83 C4 0C                          add             esp,0x0000000c
0423  85 C0                             test            eax,eax
0425  75 17                             jne             L$35
0427  8A 6B 52                          mov             ch,byte ptr 0x52[ebx]
042A  80 CD 10                          or              ch,0x10
042D  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0430  88 6B 52                          mov             byte ptr 0x52[ebx],ch
0433  31 F6                             xor             esi,esi
0435  C6 40 08 01                       mov             byte ptr 0x8[eax],0x01
0439  E9 DF 00 00 00                    jmp             L$43
043E                            L$35:
043E  6A 01                             push            0x00000001
0440  68 02 00 00 00                    push            offset DGROUP:L$73
0445  8D 44 24 14                       lea             eax,0x14[esp]
0449  50                                push            eax
044A  E8 00 00 00 00                    call            _mbsncmp
044F  83 C4 0C                          add             esp,0x0000000c
0452  85 C0                             test            eax,eax
0454  75 14                             jne             L$36
0456  53                                push            ebx
0457  BE 01 00 00 00                    mov             esi,0x00000001
045C  E8 00 00 00 00                    call            newLine
0461  89 74 24 04                       mov             dword ptr 0x4[esp],esi
0465  E9 AD 00 00 00                    jmp             L$42
046A                            L$36:
046A  6A 01                             push            0x00000001
046C  68 0A 00 00 00                    push            offset DGROUP:L$77
0471  8D 44 24 14                       lea             eax,0x14[esp]
0475  50                                push            eax
0476  E8 00 00 00 00                    call            _mbsncmp
047B  83 C4 0C                          add             esp,0x0000000c
047E  85 C0                             test            eax,eax
0480  75 49                             jne             L$40
0482  85 F6                             test            esi,esi
0484  0F 8E 93 00 00 00                 jle             L$43
048A  8D 46 FF                          lea             eax,-0x1[esi]
048D  50                                push            eax
048E  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0491  83 C0 09                          add             eax,0x00000009
0494  50                                push            eax
0495  E8 00 00 00 00                    call            __mbsninc
049A  8B 0D 00 00 00 00                 mov             ecx,dword ptr __IsDBCS
04A0  83 C4 08                          add             esp,0x00000008
04A3  89 C2                             mov             edx,eax
04A5  85 C9                             test            ecx,ecx
04A7  74 16                             je              L$37
04A9  8A 00                             mov             al,byte ptr [eax]
04AB  25 FF 00 00 00                    and             eax,0x000000ff
04B0  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
04B6  24 01                             and             al,0x01
04B8  25 FF 00 00 00                    and             eax,0x000000ff
04BD  EB 02                             jmp             L$38
04BF                            L$37:
04BF  31 C0                             xor             eax,eax
04C1                            L$38:
04C1  74 05                             je              L$39
04C3  C6 02 20                          mov             byte ptr [edx],0x20
04C6  EB 55                             jmp             L$43
04C8                            L$39:
04C8  4E                                dec             esi
04C9  EB 52                             jmp             L$43
04CB                            L$40:
04CB  80 7C 24 0C 00                    cmp             byte ptr 0xc[esp],0x00
04D0  74 4B                             je              L$43
04D2  8D 44 24 0C                       lea             eax,0xc[esp]
04D6  50                                push            eax
04D7  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
04DA  56                                push            esi
04DB  83 C0 09                          add             eax,0x00000009
04DE  50                                push            eax
04DF  E8 00 00 00 00                    call            __mbsninc
04E4  83 C4 08                          add             esp,0x00000008
04E7  50                                push            eax
04E8  46                                inc             esi
04E9  E8 00 00 00 00                    call            _mbccpy
04EE  8B 4B 57                          mov             ecx,dword ptr 0x57[ebx]
04F1  83 C4 08                          add             esp,0x00000008
04F4  39 CE                             cmp             esi,ecx
04F6  7E 03                             jle             L$41
04F8  89 73 57                          mov             dword ptr 0x57[ebx],esi
04FB                            L$41:
04FB  8B 43 63                          mov             eax,dword ptr 0x63[ebx]
04FE  8B 53 57                          mov             edx,dword ptr 0x57[ebx]
0501  83 E8 02                          sub             eax,0x00000002
0504  39 D0                             cmp             eax,edx
0506  7F 15                             jg              L$43
0508  B9 01 00 00 00                    mov             ecx,0x00000001
050D  53                                push            ebx
050E  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
0512  E8 00 00 00 00                    call            newLine
0517                            L$42:
0517  83 C4 04                          add             esp,0x00000004
051A  8B 73 57                          mov             esi,dword ptr 0x57[ebx]
051D                            L$43:
051D  83 7C 24 08 00                    cmp             dword ptr 0x8[esp],0x00000000
0522  0F 85 86 FD FF FF                 jne             L$22
0528  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
052D  0F 85 7B FD FF FF                 jne             L$22
0533  47                                inc             edi
0534                            L$44:
0534  3B 7C 24 2C                       cmp             edi,dword ptr 0x2c[esp]
0538  0F 82 6C FD FF FF                 jb              L$21
053E  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
0542  75 09                             jne             L$45
0544  53                                push            ebx
0545  E8 00 00 00 00                    call            updateBuff
054A  83 C4 04                          add             esp,0x00000004
054D                            L$45:
054D  E8 00 00 00 00                    call            _ReleaseWinLines
0552  83 C4 10                          add             esp,0x00000010
0555  5D                                pop             ebp
0556  5F                                pop             edi
0557  5E                                pop             esi
0558  5B                                pop             ebx
0559  C3                                ret

Routine Size: 813 bytes,    Routine Base: _TEXT + 022D

055A                            _UpdateInputLine:
055A  53                                push            ebx
055B  56                                push            esi
055C  57                                push            edi
055D  55                                push            ebp
055E  83 EC 04                          sub             esp,0x00000004
0561  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0565  E8 00 00 00 00                    call            _AccessWinLines
056A  C7 43 67 01 00 00 00              mov             dword ptr 0x67[ebx],0x00000001
0571  8B 73 57                          mov             esi,dword ptr 0x57[ebx]
0574  31 ED                             xor             ebp,ebp
0576  31 FF                             xor             edi,edi
0578  89 2C 24                          mov             dword ptr [esp],ebp
057B  EB 6A                             jmp             L$48
057D                            L$46:
057D  8B 43 63                          mov             eax,dword ptr 0x63[ebx]
0580  83 E8 02                          sub             eax,0x00000002
0583  31 ED                             xor             ebp,ebp
0585  39 C6                             cmp             esi,eax
0587  7C 34                             jl              L$47
0589  68 0C 00 00 00                    push            offset DGROUP:L$78
058E  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0591  56                                push            esi
0592  83 C0 09                          add             eax,0x00000009
0595  50                                push            eax
0596  E8 00 00 00 00                    call            __mbsninc
059B  83 C4 08                          add             esp,0x00000008
059E  50                                push            eax
059F  E8 00 00 00 00                    call            _mbccpy
05A4  83 C4 08                          add             esp,0x00000008
05A7  53                                push            ebx
05A8  BD 01 00 00 00                    mov             ebp,0x00000001
05AD  89 73 57                          mov             dword ptr 0x57[ebx],esi
05B0  E8 00 00 00 00                    call            newLine
05B5  83 C4 04                          add             esp,0x00000004
05B8  31 F6                             xor             esi,esi
05BA  89 2C 24                          mov             dword ptr [esp],ebp
05BD                            L$47:
05BD  57                                push            edi
05BE  8B 4C 24 20                       mov             ecx,dword ptr 0x20[esp]
05C2  51                                push            ecx
05C3  E8 00 00 00 00                    call            __mbsninc
05C8  83 C4 08                          add             esp,0x00000008
05CB  50                                push            eax
05CC  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
05CF  56                                push            esi
05D0  83 C0 09                          add             eax,0x00000009
05D3  50                                push            eax
05D4  E8 00 00 00 00                    call            __mbsninc
05D9  83 C4 08                          add             esp,0x00000008
05DC  50                                push            eax
05DD  47                                inc             edi
05DE  46                                inc             esi
05DF  E8 00 00 00 00                    call            _mbccpy
05E4  83 C4 08                          add             esp,0x00000008
05E7                            L$48:
05E7  3B 7C 24 20                       cmp             edi,dword ptr 0x20[esp]
05EB  72 90                             jb              L$46
05ED  68 0C 00 00 00                    push            offset DGROUP:L$78
05F2  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
05F5  56                                push            esi
05F6  83 C0 09                          add             eax,0x00000009
05F9  50                                push            eax
05FA  E8 00 00 00 00                    call            __mbsninc
05FF  83 C4 08                          add             esp,0x00000008
0602  50                                push            eax
0603  E8 00 00 00 00                    call            _mbccpy
0608  83 C4 08                          add             esp,0x00000008
060B  83 7C 24 24 00                    cmp             dword ptr 0x24[esp],0x00000000
0610  74 12                             je              L$49
0612  85 ED                             test            ebp,ebp
0614  75 0E                             jne             L$49
0616  53                                push            ebx
0617  89 73 57                          mov             dword ptr 0x57[ebx],esi
061A  E8 00 00 00 00                    call            newLine
061F  83 C4 04                          add             esp,0x00000004
0622  EB 25                             jmp             L$50
0624                            L$49:
0624  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
0627  83 C0 09                          add             eax,0x00000009
062A  8B 6B 4E                          mov             ebp,dword ptr 0x4e[ebx]
062D  50                                push            eax
062E  8B 43 46                          mov             eax,dword ptr 0x46[ebx]
0631  29 E8                             sub             eax,ebp
0633  40                                inc             eax
0634  50                                push            eax
0635  53                                push            ebx
0636  E8 00 00 00 00                    call            _DisplayLineInWindow
063B  83 C4 0C                          add             esp,0x0000000c
063E  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
0642  75 05                             jne             L$50
0644  BE FF FF FF FF                    mov             esi,0xffffffff
0649                            L$50:
0649  E8 00 00 00 00                    call            _ReleaseWinLines
064E  89 F0                             mov             eax,esi
0650  E9 8B FA FF FF                    jmp             L$7

Routine Size: 251 bytes,    Routine Base: _TEXT + 055A

0655                            _PositionScrollThumb:
0655  53                                push            ebx
0656  56                                push            esi
0657  57                                push            edi
0658  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
065C  56                                push            esi
065D  8B 7E 4E                          mov             edi,dword ptr 0x4e[esi]
0660  E8 00 00 00 00                    call            _GetLastLineNumber
0665  89 C3                             mov             ebx,eax
0667  83 C4 04                          add             esp,0x00000004
066A  89 C1                             mov             ecx,eax
066C  3D 00 80 00 00                    cmp             eax,0x00008000
0671  76 12                             jbe             L$51
0673  89 F8                             mov             eax,edi
0675  31 D2                             xor             edx,edx
0677  C1 E0 0F                          shl             eax,0x0f
067A  F7 F3                             div             ebx
067C  B9 00 80 00 00                    mov             ecx,0x00008000
0681  89 C3                             mov             ebx,eax
0683  EB 02                             jmp             L$52
0685                            L$51:
0685  89 FB                             mov             ebx,edi
0687                            L$52:
0687  31 C0                             xor             eax,eax
0689  6A 00                             push            0x00000000
068B  66 89 C8                          mov             ax,cx
068E  50                                push            eax
068F  6A 01                             push            0x00000001
0691  6A 01                             push            0x00000001
0693  8B 56 3A                          mov             edx,dword ptr 0x3a[esi]
0696  52                                push            edx
0697  E8 00 00 00 00                    call            _SetScrollRange
069C  31 C0                             xor             eax,eax
069E  6A 01                             push            0x00000001
06A0  66 89 D8                          mov             ax,bx
06A3  50                                push            eax
06A4  6A 01                             push            0x00000001
06A6  8B 5E 3A                          mov             ebx,dword ptr 0x3a[esi]
06A9  53                                push            ebx
06AA  E8 00 00 00 00                    call            _SetScrollPos
06AF  5F                                pop             edi
06B0  5E                                pop             esi
06B1  5B                                pop             ebx
06B2  C3                                ret

Routine Size: 94 bytes,    Routine Base: _TEXT + 0655

06B3                            _GetLineFromThumbPosition:
06B3  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
06B7  52                                push            edx
06B8  E8 00 00 00 00                    call            _GetLastLineNumber
06BD  83 C4 04                          add             esp,0x00000004
06C0  3D 00 80 00 00                    cmp             eax,0x00008000
06C5  76 0E                             jbe             L$53
06C7  31 D2                             xor             edx,edx
06C9  66 8B 54 24 08                    mov             dx,word ptr 0x8[esp]
06CE  0F AF C2                          imul            eax,edx
06D1  C1 E8 0F                          shr             eax,0x0f
06D4  C3                                ret
06D5                            L$53:
06D5  31 C0                             xor             eax,eax
06D7  66 8B 44 24 08                    mov             ax,word ptr 0x8[esp]
06DC  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 06B3

06DD                            _GetLineDataPointer:
06DD  53                                push            ebx
06DE  56                                push            esi
06DF  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
06E3  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
06E7  E8 00 00 00 00                    call            _AccessWinLines
06EC  3B 73 46                          cmp             esi,dword ptr 0x46[ebx]
06EF  75 11                             jne             L$54
06F1  83 7B 67 00                       cmp             dword ptr 0x67[ebx],0x00000000
06F5  74 0B                             je              L$54
06F7  E8 00 00 00 00                    call            _ReleaseWinLines
06FC  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
06FF  5E                                pop             esi
0700  5B                                pop             ebx
0701  C3                                ret
0702                            L$54:
0702  B8 01 00 00 00                    mov             eax,0x00000001
0707  8B 5B 3E                          mov             ebx,dword ptr 0x3e[ebx]
070A                            L$55:
070A  39 F0                             cmp             eax,esi
070C  74 09                             je              L$56
070E  85 DB                             test            ebx,ebx
0710  74 05                             je              L$56
0712  40                                inc             eax
0713  8B 1B                             mov             ebx,dword ptr [ebx]
0715  EB F3                             jmp             L$55
0717                            L$56:
0717  E8 00 00 00 00                    call            _ReleaseWinLines
071C  89 D8                             mov             eax,ebx
071E  5E                                pop             esi
071F  5B                                pop             ebx
0720  C3                                ret

Routine Size: 68 bytes,    Routine Base: _TEXT + 06DD

0721                            _FreeAllLines:
0721  53                                push            ebx
0722  56                                push            esi
0723  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0727  E8 00 00 00 00                    call            _AccessWinLines
072C  8B 46 3E                          mov             eax,dword ptr 0x3e[esi]
072F                            L$57:
072F  85 C0                             test            eax,eax
0731  74 0F                             je              L$58
0733  50                                push            eax
0734  8B 18                             mov             ebx,dword ptr [eax]
0736  E8 00 00 00 00                    call            _MemFree
073B  83 C4 04                          add             esp,0x00000004
073E  89 D8                             mov             eax,ebx
0740  EB ED                             jmp             L$57
0742                            L$58:
0742  C7 46 4E 01 00 00 00              mov             dword ptr 0x4e[esi],0x00000001
0749  89 46 42                          mov             dword ptr 0x42[esi],eax
074C  89 46 3E                          mov             dword ptr 0x3e[esi],eax
074F  89 46 57                          mov             dword ptr 0x57[esi],eax
0752  8B 46 4E                          mov             eax,dword ptr 0x4e[esi]
0755  89 46 46                          mov             dword ptr 0x46[esi],eax
0758  56                                push            esi
0759  89 46 4A                          mov             dword ptr 0x4a[esi],eax
075C  E8 00 00 00 00                    call            _PositionScrollThumb
0761  83 C4 04                          add             esp,0x00000004
0764  E8 00 00 00 00                    call            _ReleaseWinLines
0769  5E                                pop             esi
076A  5B                                pop             ebx
076B  C3                                ret

Routine Size: 75 bytes,    Routine Base: _TEXT + 0721

076C                            _SaveAllLines:
076C  53                                push            ebx
076D  56                                push            esi
076E  57                                push            edi
076F  55                                push            ebp
0770  81 EC 50 01 00 00                 sub             esp,0x00000150
0776  6A 4C                             push            0x0000004c
0778  BB 00 00 00 00                    mov             ebx,offset filterFiles
077D  30 E4                             xor             ah,ah
077F  6A 00                             push            0x00000000
0781  88 64 24 08                       mov             byte ptr 0x8[esp],ah
0785  8D 84 24 0C 01 00 00              lea             eax,0x10c[esp]
078C  BE 04 01 00 00                    mov             esi,0x00000104
0791  50                                push            eax
0792  BF 0D 00 00 00                    mov             edi,offset DGROUP:L$79
0797  BD 04 00 00 00                    mov             ebp,0x00000004
079C  E8 00 00 00 00                    call            memset
07A1  BA 4C 00 00 00                    mov             edx,0x0000004c
07A6  B9 01 00 00 00                    mov             ecx,0x00000001
07AB  83 C4 0C                          add             esp,0x0000000c
07AE  A1 00 00 00 00                    mov             eax,dword ptr _MainWindow
07B3  89 94 24 04 01 00 00              mov             dword ptr 0x104[esp],edx
07BA  89 84 24 08 01 00 00              mov             dword ptr 0x108[esp],eax
07C1  89 9C 24 10 01 00 00              mov             dword ptr 0x110[esp],ebx
07C8  89 E0                             mov             eax,esp
07CA  89 8C 24 1C 01 00 00              mov             dword ptr 0x11c[esp],ecx
07D1  89 84 24 20 01 00 00              mov             dword ptr 0x120[esp],eax
07D8  8D 84 24 04 01 00 00              lea             eax,0x104[esp]
07DF  89 B4 24 24 01 00 00              mov             dword ptr 0x124[esp],esi
07E6  50                                push            eax
07E7  89 BC 24 38 01 00 00              mov             dword ptr 0x138[esp],edi
07EE  89 AC 24 3C 01 00 00              mov             dword ptr 0x13c[esp],ebp
07F5  E8 00 00 00 00                    call            _GetSaveFileNameA
07FA  85 C0                             test            eax,eax
07FC  74 6E                             je              L$63
07FE  E8 00 00 00 00                    call            _AccessWinLines
0803  68 26 00 00 00                    push            offset DGROUP:L$80
0808  8D 44 24 04                       lea             eax,0x4[esp]
080C  50                                push            eax
080D  E8 00 00 00 00                    call            fopen
0812  83 C4 08                          add             esp,0x00000008
0815  89 C6                             mov             esi,eax
0817  85 C0                             test            eax,eax
0819  75 0E                             jne             L$59
081B  50                                push            eax
081C  68 28 00 00 00                    push            offset DGROUP:L$81
0821  8D 44 24 08                       lea             eax,0x8[esp]
0825  50                                push            eax
0826  56                                push            esi
0827  EB 3E                             jmp             L$62
0829                            L$59:
0829  8B 9C 24 64 01 00 00              mov             ebx,dword ptr 0x164[esp]
0830  8B 5B 3E                          mov             ebx,dword ptr 0x3e[ebx]
0833                            L$60:
0833  85 DB                             test            ebx,ebx
0835  74 16                             je              L$61
0837  8D 43 09                          lea             eax,0x9[ebx]
083A  50                                push            eax
083B  68 3B 00 00 00                    push            offset DGROUP:L$82
0840  56                                push            esi
0841  E8 00 00 00 00                    call            fprintf
0846  83 C4 0C                          add             esp,0x0000000c
0849  8B 1B                             mov             ebx,dword ptr [ebx]
084B  EB E6                             jmp             L$60
084D                            L$61:
084D  56                                push            esi
084E  E8 00 00 00 00                    call            fclose
0853  83 C4 04                          add             esp,0x00000004
0856  E8 00 00 00 00                    call            _ReleaseWinLines
085B  53                                push            ebx
085C  68 3F 00 00 00                    push            offset DGROUP:L$83
0861  8D 44 24 08                       lea             eax,0x8[esp]
0865  50                                push            eax
0866  53                                push            ebx
0867                            L$62:
0867  E8 00 00 00 00                    call            _MessageBoxA
086C                            L$63:
086C  81 C4 50 01 00 00                 add             esp,0x00000150
0872  5D                                pop             ebp
0873  5F                                pop             edi
0874  5E                                pop             esi
0875  5B                                pop             ebx
0876  C3                                ret

Routine Size: 267 bytes,    Routine Base: _TEXT + 076C

0877                            _CopyAllLines:
0877  53                                push            ebx
0878  56                                push            esi
0879  57                                push            edi
087A  55                                push            ebp
087B  83 EC 08                          sub             esp,0x00000008
087E  E8 00 00 00 00                    call            _AccessWinLines
0883  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0887  31 DB                             xor             ebx,ebx
0889  8B 52 3E                          mov             edx,dword ptr 0x3e[edx]
088C                            L$64:
088C  85 D2                             test            edx,edx
088E  74 1C                             je              L$65
0890  8D 7A 09                          lea             edi,0x9[edx]
0893  06                                push            es
0894  8C D8                             mov             eax,ds
0896  8E C0                             mov             es,eax
0898  29 C9                             sub             ecx,ecx
089A  49                                dec             ecx
089B  31 C0                             xor             eax,eax
089D  F2 AE                             repne scasb
089F  F7 D1                             not             ecx
08A1  49                                dec             ecx
08A2  07                                pop             es
08A3  83 C1 02                          add             ecx,0x00000002
08A6  8B 12                             mov             edx,dword ptr [edx]
08A8  01 CB                             add             ebx,ecx
08AA  EB E0                             jmp             L$64
08AC                            L$65:
08AC  81 FB FE FF 00 00                 cmp             ebx,0x0000fffe
08B2  76 05                             jbe             L$66
08B4  BB FE FF 00 00                    mov             ebx,0x0000fffe
08B9                            L$66:
08B9  43                                inc             ebx
08BA  53                                push            ebx
08BB  6A 02                             push            0x00000002
08BD  E8 00 00 00 00                    call            _GlobalAlloc
08C2  89 04 24                          mov             dword ptr [esp],eax
08C5  85 C0                             test            eax,eax
08C7  75 16                             jne             L$67
08C9  50                                push            eax
08CA  68 52 00 00 00                    push            offset DGROUP:L$84
08CF  68 64 00 00 00                    push            offset DGROUP:L$85
08D4  50                                push            eax
08D5  E8 00 00 00 00                    call            _MessageBoxA
08DA  E9 AC 00 00 00                    jmp             L$70
08DF                            L$67:
08DF  50                                push            eax
08E0  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
08E4  E8 00 00 00 00                    call            _GlobalLock
08E9  89 44 24 04                       mov             dword ptr 0x4[esp],eax
08ED  8B 5B 3E                          mov             ebx,dword ptr 0x3e[ebx]
08F0  31 D2                             xor             edx,edx
08F2                            L$68:
08F2  85 DB                             test            ebx,ebx
08F4  74 5D                             je              L$69
08F6  8D 73 09                          lea             esi,0x9[ebx]
08F9  89 F7                             mov             edi,esi
08FB  06                                push            es
08FC  8C D8                             mov             eax,ds
08FE  8E C0                             mov             es,eax
0900  29 C9                             sub             ecx,ecx
0902  49                                dec             ecx
0903  31 C0                             xor             eax,eax
0905  F2 AE                             repne scasb
0907  F7 D1                             not             ecx
0909  49                                dec             ecx
090A  07                                pop             es
090B  8D 41 02                          lea             eax,0x2[ecx]
090E  8D 2C 02                          lea             ebp,[edx+eax]
0911  81 FD FE FF 00 00                 cmp             ebp,0x0000fffe
0917  77 3A                             ja              L$69
0919  8B 7C 24 04                       mov             edi,dword ptr 0x4[esp]
091D  83 E8 02                          sub             eax,0x00000002
0920  8C D9                             mov             ecx,ds
0922  01 D7                             add             edi,edx
0924  8C DA                             mov             edx,ds
0926  1E                                push            ds
0927  06                                push            es
0928  57                                push            edi
0929  91                                xchg            eax,ecx
092A  8E D8                             mov             ds,eax
092C  8E C2                             mov             es,edx
092E  89 C8                             mov             eax,ecx
0930  C1 E9 02                          shr             ecx,0x02
0933  F2 A5                             repne movsd
0935  8A C8                             mov             cl,al
0937  80 E1 03                          and             cl,0x03
093A  F2 A4                             repne movsb
093C  58                                pop             eax
093D  07                                pop             es
093E  1F                                pop             ds
093F  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0943  C6 44 2A FE 0D                    mov             byte ptr -0x2[edx+ebp],0x0d
0948  C6 44 2A FF 0A                    mov             byte ptr -0x1[edx+ebp],0x0a
094D  89 EA                             mov             edx,ebp
094F  8B 1B                             mov             ebx,dword ptr [ebx]
0951  EB 9F                             jmp             L$68
0953                            L$69:
0953  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
0957  8B 0C 24                          mov             ecx,dword ptr [esp]
095A  01 DA                             add             edx,ebx
095C  51                                push            ecx
095D  C6 02 00                          mov             byte ptr [edx],0x00
0960  E8 00 00 00 00                    call            _GlobalUnlock
0965  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0969  8B 70 3A                          mov             esi,dword ptr 0x3a[eax]
096C  56                                push            esi
096D  E8 00 00 00 00                    call            _OpenClipboard
0972  85 C0                             test            eax,eax
0974  74 15                             je              L$70
0976  8B 3C 24                          mov             edi,dword ptr [esp]
0979  E8 00 00 00 00                    call            _EmptyClipboard
097E  57                                push            edi
097F  6A 01                             push            0x00000001
0981  E8 00 00 00 00                    call            _SetClipboardData
0986  E8 00 00 00 00                    call            _CloseClipboard
098B                            L$70:
098B  E8 00 00 00 00                    call            _ReleaseWinLines
0990  83 C4 08                          add             esp,0x00000008
0993  5D                                pop             ebp
0994  5F                                pop             edi
0995  5E                                pop             esi
0996  5B                                pop             ebx
0997  C3                                ret

Routine Size: 289 bytes,    Routine Base: _TEXT + 0877

0998                            _GetLastLineNumber:
0998  53                                push            ebx
0999  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
099D  8B 5A 67                          mov             ebx,dword ptr 0x67[edx]
09A0  8B 42 46                          mov             eax,dword ptr 0x46[edx]
09A3  85 DB                             test            ebx,ebx
09A5  74 01                             je              L$71
09A7  40                                inc             eax
09A8                            L$71:
09A8  5B                                pop             ebx
09A9  C3                                ret

Routine Size: 18 bytes,    Routine Base: _TEXT + 0998

No disassembly errors

Segment: CONST DWORD USE32 00000072 bytes
0000                            L$72:
0000  20 00                                            .
0002                            L$73:
0002  0A 00                                           ..
0004                            L$74:
0004  09 00                                           ..
0006                            L$75:
0006  0C 00                                           ..
0008                            L$76:
0008  0D 00                                           ..
000A                            L$77:
000A  08 00                                           ..
000C                            L$78:
000C  00                                              .
000D                            L$79:
000D  53 61 76 65 20 46 69 6C 65 20 4E 61 6D 65 20 53 Save File Name S
001D  65 6C 65 63 74 69 6F 6E 00                      election.
0026                            L$80:
0026  77 00                                           w.
0028                            L$81:
0028  45 72 72 6F 72 20 6F 70 65 6E 69 6E 67 20 66 69 Error opening fi
0038  6C 65 00                                        le.
003B                            L$82:
003B  25 73 0A 00                                     %s..
003F                            L$83:
003F  44 61 74 61 20 73 61 76 65 64 20 74 6F 20 66 69 Data saved to fi
004F  6C 65 00                                        le.
0052                            L$84:
0052  43 6F 70 79 20 74 6F 20 43 6C 69 70 62 6F 61 72 Copy to Clipboar
0062  64 00                                           d.
0064                            L$85:
0064  4F 75 74 20 6F 66 20 4D 65 6D 6F 72 79 00       Out of Memory.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000001D bytes
0000                            filterFiles:
0000  52 65 73 75 6C 74 20 46 69 6C 65 73 20 28 2A 2E Result Files (*.
0010  54 58 54 29 00 2A 2E 54 58 54 00 00 00          TXT).*.TXT...

Segment: _BSS DWORD USE32 00000005 bytes
0000                            L$86:
0004                            L$87:

BSS Size: 5 bytes

