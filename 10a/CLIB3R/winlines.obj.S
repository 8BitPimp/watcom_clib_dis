Module: winlines
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000078D bytes
0000                            createNewEntry_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  89 C2                             mov             edx,eax
0007  8B 40 53                          mov             eax,dword ptr 0x53[eax]
000A  03 42 57                          add             eax,dword ptr 0x57[edx]
000D  C6 40 09 00                       mov             byte ptr 0x9[eax],0x00
0011  B8 0A 00 00 00                    mov             eax,0x0000000a
0016  03 42 57                          add             eax,dword ptr 0x57[edx]
0019  E8 00 00 00 00                    call            _MemAlloc_
001E  89 C3                             mov             ebx,eax
0020  89 C1                             mov             ecx,eax
0022  8B 72 53                          mov             esi,dword ptr 0x53[edx]
0025  8D 78 09                          lea             edi,0x9[eax]
0028  83 C6 09                          add             esi,0x00000009
002B  C7 42 57 00 00 00 00              mov             dword ptr 0x57[edx],0x00000000
0032  57                                push            edi
0033                            L$1:
0033  8A 06                             mov             al,byte ptr [esi]
0035  88 07                             mov             byte ptr [edi],al
0037  3C 00                             cmp             al,0x00
0039  0F 84 10 00 00 00                 je              L$2
003F  8A 46 01                          mov             al,byte ptr 0x1[esi]
0042  83 C6 02                          add             esi,0x00000002
0045  88 47 01                          mov             byte ptr 0x1[edi],al
0048  83 C7 02                          add             edi,0x00000002
004B  3C 00                             cmp             al,0x00
004D  75 E4                             jne             L$1
004F                            L$2:
004F  5F                                pop             edi
0050  8B 72 42                          mov             esi,dword ptr 0x42[edx]
0053  85 F6                             test            esi,esi
0055  75 08                             jne             L$3
0057  89 5A 42                          mov             dword ptr 0x42[edx],ebx
005A  89 5A 3E                          mov             dword ptr 0x3e[edx],ebx
005D  EB 0B                             jmp             L$4
005F                            L$3:
005F  89 1E                             mov             dword ptr [esi],ebx
0061  8B 42 42                          mov             eax,dword ptr 0x42[edx]
0064  89 43 04                          mov             dword ptr 0x4[ebx],eax
0067  89 5A 42                          mov             dword ptr 0x42[edx],ebx
006A                            L$4:
006A  89 C8                             mov             eax,ecx
006C  EB 58                             jmp             L$8
006E                            incrementLastLineNumber_:
006E  53                                push            ebx
006F  51                                push            ecx
0070  52                                push            edx
0071  56                                push            esi
0072  57                                push            edi
0073  55                                push            ebp
0074  89 C3                             mov             ebx,eax
0076  8B 50 46                          mov             edx,dword ptr 0x46[eax]
0079  42                                inc             edx
007A  8B 0D 00 00 00 00                 mov             ecx,dword ptr __AutoClearLines
0080  89 50 46                          mov             dword ptr 0x46[eax],edx
0083  39 CA                             cmp             edx,ecx
0085  76 07                             jbe             L$5
0087  E8 00 00 00 00                    call            _FreeAllLines_
008C  EB 37                             jmp             L$7
008E                            L$5:
008E  89 D0                             mov             eax,edx
0090  8B 73 4E                          mov             esi,dword ptr 0x4e[ebx]
0093  8B 7B 24                          mov             edi,dword ptr 0x24[ebx]
0096  29 F0                             sub             eax,esi
0098  39 F8                             cmp             eax,edi
009A  7D 22                             jge             L$6
009C  8B 6B 4A                          mov             ebp,dword ptr 0x4a[ebx]
009F  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
00A2  45                                inc             ebp
00A3  4A                                dec             edx
00A4  89 6B 4A                          mov             dword ptr 0x4a[ebx],ebp
00A7  39 D0                             cmp             eax,edx
00A9  75 13                             jne             L$6
00AB  8B 43 4E                          mov             eax,dword ptr 0x4e[ebx]
00AE  40                                inc             eax
00AF  BA 01 00 00 00                    mov             edx,0x00000001
00B4  89 43 4E                          mov             dword ptr 0x4e[ebx],eax
00B7  89 D8                             mov             eax,ebx
00B9  E8 00 00 00 00                    call            _ShiftWindow_
00BE                            L$6:
00BE  89 D8                             mov             eax,ebx
00C0  E8 00 00 00 00                    call            _PositionScrollThumb_
00C5                            L$7:
00C5  5D                                pop             ebp
00C6                            L$8:
00C6  5F                                pop             edi
00C7  5E                                pop             esi
00C8  5A                                pop             edx
00C9  59                                pop             ecx
00CA  5B                                pop             ebx
00CB  C3                                ret
00CC                            replaceTail_:
00CC  53                                push            ebx
00CD  51                                push            ecx
00CE  52                                push            edx
00CF  56                                push            esi
00D0  57                                push            edi
00D1  89 C2                             mov             edx,eax
00D3  8B 40 53                          mov             eax,dword ptr 0x53[eax]
00D6  03 42 57                          add             eax,dword ptr 0x57[edx]
00D9  C6 40 09 00                       mov             byte ptr 0x9[eax],0x00
00DD  8B 42 42                          mov             eax,dword ptr 0x42[edx]
00E0  8B 58 04                          mov             ebx,dword ptr 0x4[eax]
00E3  E8 00 00 00 00                    call            _MemFree_
00E8  B8 0A 00 00 00                    mov             eax,0x0000000a
00ED  03 42 57                          add             eax,dword ptr 0x57[edx]
00F0  E8 00 00 00 00                    call            _MemAlloc_
00F5  8B 72 53                          mov             esi,dword ptr 0x53[edx]
00F8  8D 78 09                          lea             edi,0x9[eax]
00FB  83 C6 09                          add             esi,0x00000009
00FE  89 42 42                          mov             dword ptr 0x42[edx],eax
0101  57                                push            edi
0102                            L$9:
0102  8A 06                             mov             al,byte ptr [esi]
0104  88 07                             mov             byte ptr [edi],al
0106  3C 00                             cmp             al,0x00
0108  0F 84 10 00 00 00                 je              L$10
010E  8A 46 01                          mov             al,byte ptr 0x1[esi]
0111  83 C6 02                          add             esi,0x00000002
0114  88 47 01                          mov             byte ptr 0x1[edi],al
0117  83 C7 02                          add             edi,0x00000002
011A  3C 00                             cmp             al,0x00
011C  75 E4                             jne             L$9
011E                            L$10:
011E  5F                                pop             edi
011F  8B 42 42                          mov             eax,dword ptr 0x42[edx]
0122  89 58 04                          mov             dword ptr 0x4[eax],ebx
0125  85 DB                             test            ebx,ebx
0127  74 07                             je              L$11
0129  8B 42 42                          mov             eax,dword ptr 0x42[edx]
012C  89 03                             mov             dword ptr [ebx],eax
012E  EB 06                             jmp             L$12
0130                            L$11:
0130  8B 42 42                          mov             eax,dword ptr 0x42[edx]
0133  89 42 3E                          mov             dword ptr 0x3e[edx],eax
0136                            L$12:
0136  8B 42 46                          mov             eax,dword ptr 0x46[edx]
0139  8B 72 4E                          mov             esi,dword ptr 0x4e[edx]
013C  8B 4A 42                          mov             ecx,dword ptr 0x42[edx]
013F  29 F0                             sub             eax,esi
0141  83 C1 09                          add             ecx,0x00000009
0144  8D 58 01                          lea             ebx,0x1[eax]
0147  89 D0                             mov             eax,edx
0149  89 DA                             mov             edx,ebx
014B  89 CB                             mov             ebx,ecx
014D  E8 00 00 00 00                    call            _DisplayLineInWindow_
0152  E9 6F FF FF FF                    jmp             L$8
0157                            addBuff_:
0157  53                                push            ebx
0158  51                                push            ecx
0159  52                                push            edx
015A  89 C2                             mov             edx,eax
015C  E8 00 00 00 00                    call            createNewEntry_
0161  C6 40 08 01                       mov             byte ptr 0x8[eax],0x01
0165  8D 48 09                          lea             ecx,0x9[eax]
0168  8B 42 46                          mov             eax,dword ptr 0x46[edx]
016B  2B 42 4E                          sub             eax,dword ptr 0x4e[edx]
016E  8D 58 01                          lea             ebx,0x1[eax]
0171  89 D0                             mov             eax,edx
0173  89 DA                             mov             edx,ebx
0175  89 CB                             mov             ebx,ecx
0177  E8 00 00 00 00                    call            _DisplayLineInWindow_
017C  5A                                pop             edx
017D  59                                pop             ecx
017E  5B                                pop             ebx
017F  C3                                ret
0180                            updateBuff_:
0180  53                                push            ebx
0181  52                                push            edx
0182  89 C2                             mov             edx,eax
0184  83 78 3E 00                       cmp             dword ptr 0x3e[eax],0x00000000
0188  74 09                             je              L$13
018A  8B 40 42                          mov             eax,dword ptr 0x42[eax]
018D  80 78 08 00                       cmp             byte ptr 0x8[eax],0x00
0191  74 0F                             je              L$14
0193                            L$13:
0193  89 D0                             mov             eax,edx
0195  8B 5A 57                          mov             ebx,dword ptr 0x57[edx]
0198  E8 00 00 00 00                    call            addBuff_
019D  89 5A 57                          mov             dword ptr 0x57[edx],ebx
01A0  EB 07                             jmp             L$15
01A2                            L$14:
01A2  89 D0                             mov             eax,edx
01A4  E8 00 00 00 00                    call            replaceTail_
01A9                            L$15:
01A9  8B 52 42                          mov             edx,dword ptr 0x42[edx]
01AC  C6 42 08 00                       mov             byte ptr 0x8[edx],0x00
01B0  5A                                pop             edx
01B1  5B                                pop             ebx
01B2  C3                                ret
01B3                            newLine_:
01B3  53                                push            ebx
01B4  52                                push            edx
01B5  89 C2                             mov             edx,eax
01B7  8B 58 42                          mov             ebx,dword ptr 0x42[eax]
01BA  85 DB                             test            ebx,ebx
01BC  74 1B                             je              L$16
01BE  80 7B 08 00                       cmp             byte ptr 0x8[ebx],0x00
01C2  75 15                             jne             L$16
01C4  E8 00 00 00 00                    call            replaceTail_
01C9  8B 42 42                          mov             eax,dword ptr 0x42[edx]
01CC  C7 42 57 00 00 00 00              mov             dword ptr 0x57[edx],0x00000000
01D3  C6 40 08 01                       mov             byte ptr 0x8[eax],0x01
01D7  EB 07                             jmp             L$17
01D9                            L$16:
01D9  89 D0                             mov             eax,edx
01DB  E8 00 00 00 00                    call            addBuff_
01E0                            L$17:
01E0  89 D0                             mov             eax,edx
01E2  C7 42 67 00 00 00 00              mov             dword ptr 0x67[edx],0x00000000
01E9  E8 00 00 00 00                    call            incrementLastLineNumber_
01EE  5A                                pop             edx
01EF  5B                                pop             ebx
01F0  C3                                ret

Routine Size: 497 bytes,    Routine Base: _TEXT + 0000

01F1                            _AddLine_:
01F1  51                                push            ecx
01F2  56                                push            esi
01F3  57                                push            edi
01F4  55                                push            ebp
01F5  83 EC 1C                          sub             esp,0x0000001c
01F8  89 C5                             mov             ebp,eax
01FA  89 14 24                          mov             dword ptr [esp],edx
01FD  89 5C 24 04                       mov             dword ptr 0x4[esp],ebx
0201  E8 00 00 00 00                    call            _AccessWinLines_
0206  8B 75 42                          mov             esi,dword ptr 0x42[ebp]
0209  31 D2                             xor             edx,edx
020B  31 C9                             xor             ecx,ecx
020D  89 54 24 14                       mov             dword ptr 0x14[esp],edx
0211  85 F6                             test            esi,esi
0213  74 52                             je              L$20
0215  8A 5E 08                          mov             bl,byte ptr 0x8[esi]
0218  89 F0                             mov             eax,esi
021A  84 DB                             test            bl,bl
021C  75 49                             jne             L$20
021E  8B 7D 53                          mov             edi,dword ptr 0x53[ebp]
0221  83 C6 09                          add             esi,0x00000009
0224  83 C7 09                          add             edi,0x00000009
0227  57                                push            edi
0228                            L$18:
0228  8A 06                             mov             al,byte ptr [esi]
022A  88 07                             mov             byte ptr [edi],al
022C  3C 00                             cmp             al,0x00
022E  0F 84 10 00 00 00                 je              L$19
0234  8A 46 01                          mov             al,byte ptr 0x1[esi]
0237  83 C6 02                          add             esi,0x00000002
023A  88 47 01                          mov             byte ptr 0x1[edi],al
023D  83 C7 02                          add             edi,0x00000002
0240  3C 00                             cmp             al,0x00
0242  75 E4                             jne             L$18
0244                            L$19:
0244  5F                                pop             edi
0245  8B 7D 53                          mov             edi,dword ptr 0x53[ebp]
0248  83 C7 09                          add             edi,0x00000009
024B  06                                push            es
024C  8C D8                             mov             eax,ds
024E  8E C0                             mov             es,eax
0250  29 C9                             sub             ecx,ecx
0252  49                                dec             ecx
0253  31 C0                             xor             eax,eax
0255  F2 AE                             repne scasb
0257  F7 D1                             not             ecx
0259  49                                dec             ecx
025A  07                                pop             es
025B  8B 7D 57                          mov             edi,dword ptr 0x57[ebp]
025E  89 C8                             mov             eax,ecx
0260  39 F9                             cmp             ecx,edi
0262  7E 03                             jle             L$20
0264  89 4D 57                          mov             dword ptr 0x57[ebp],ecx
0267                            L$20:
0267  F6 45 52 10                       test            byte ptr 0x52[ebp],0x10
026B  74 02                             je              L$21
026D  31 C9                             xor             ecx,ecx
026F                            L$21:
026F  31 C0                             xor             eax,eax
0271  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0275  8B 04 24                          mov             eax,dword ptr [esp]
0278  89 44 24 08                       mov             dword ptr 0x8[esp],eax
027C  31 FF                             xor             edi,edi
027E  E9 FA 00 00 00                    jmp             L$34
0283                            L$22:
0283  8A 45 52                          mov             al,byte ptr 0x52[ebp]
0286  24 EF                             and             al,0xef
0288  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
028C  88 45 52                          mov             byte ptr 0x52[ebp],al
028F                            L$23:
028F  89 7C 24 10                       mov             dword ptr 0x10[esp],edi
0293  85 D2                             test            edx,edx
0295  74 09                             je              L$24
0297  B3 20                             mov             bl,0x20
0299  4A                                dec             edx
029A  88 5C 24 18                       mov             byte ptr 0x18[esp],bl
029E  EB 1D                             jmp             L$26
02A0                            L$24:
02A0  3B 7C 24 14                       cmp             edi,dword ptr 0x14[esp]
02A4  74 11                             je              L$25
02A6  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
02AA  B4 0A                             mov             ah,0x0a
02AC  4B                                dec             ebx
02AD  88 64 24 18                       mov             byte ptr 0x18[esp],ah
02B1  89 5C 24 14                       mov             dword ptr 0x14[esp],ebx
02B5  EB 06                             jmp             L$26
02B7                            L$25:
02B7  8A 06                             mov             al,byte ptr [esi]
02B9  88 44 24 18                       mov             byte ptr 0x18[esp],al
02BD                            L$26:
02BD  8A 7C 24 18                       mov             bh,byte ptr 0x18[esp]
02C1  80 FF 09                          cmp             bh,0x09
02C4  75 1F                             jne             L$27
02C6  8B 5D 57                          mov             ebx,dword ptr 0x57[ebp]
02C9  89 DA                             mov             edx,ebx
02CB  89 D8                             mov             eax,ebx
02CD  C1 FA 1F                          sar             edx,0x1f
02D0  C1 E2 03                          shl             edx,0x03
02D3  1B C2                             sbb             eax,edx
02D5  C1 F8 03                          sar             eax,0x03
02D8  C1 E0 03                          shl             eax,0x03
02DB  8D 50 08                          lea             edx,0x8[eax]
02DE  29 DA                             sub             edx,ebx
02E0  E9 74 00 00 00                    jmp             L$33
02E5                            L$27:
02E5  80 FF 0C                          cmp             bh,0x0c
02E8  75 09                             jne             L$28
02EA  8B 45 24                          mov             eax,dword ptr 0x24[ebp]
02ED  89 44 24 14                       mov             dword ptr 0x14[esp],eax
02F1  EB 66                             jmp             L$33
02F3                            L$28:
02F3  80 FF 0D                          cmp             bh,0x0d
02F6  75 14                             jne             L$29
02F8  8A 7D 52                          mov             bh,byte ptr 0x52[ebp]
02FB  80 CF 10                          or              bh,0x10
02FE  8B 45 53                          mov             eax,dword ptr 0x53[ebp]
0301  88 7D 52                          mov             byte ptr 0x52[ebp],bh
0304  89 F9                             mov             ecx,edi
0306  C6 40 08 01                       mov             byte ptr 0x8[eax],0x01
030A  EB 4D                             jmp             L$33
030C                            L$29:
030C  80 FF 0A                          cmp             bh,0x0a
030F  75 11                             jne             L$30
0311  C7 44 24 10 01 00 00 00           mov             dword ptr 0x10[esp],0x00000001
0319  89 E8                             mov             eax,ebp
031B  E8 00 00 00 00                    call            newLine_
0320  EB 34                             jmp             L$32
0322                            L$30:
0322  89 C8                             mov             eax,ecx
0324  8B 5D 53                          mov             ebx,dword ptr 0x53[ebp]
0327  01 D8                             add             eax,ebx
0329  8A 5C 24 18                       mov             bl,byte ptr 0x18[esp]
032D  88 58 09                          mov             byte ptr 0x9[eax],bl
0330  41                                inc             ecx
0331  3B 4D 57                          cmp             ecx,dword ptr 0x57[ebp]
0334  7E 03                             jle             L$31
0336  89 4D 57                          mov             dword ptr 0x57[ebp],ecx
0339                            L$31:
0339  8B 45 63                          mov             eax,dword ptr 0x63[ebp]
033C  8B 5D 57                          mov             ebx,dword ptr 0x57[ebp]
033F  83 E8 02                          sub             eax,0x00000002
0342  39 D8                             cmp             eax,ebx
0344  7F 13                             jg              L$33
0346  89 E8                             mov             eax,ebp
0348  B9 01 00 00 00                    mov             ecx,0x00000001
034D  E8 00 00 00 00                    call            newLine_
0352  89 4C 24 10                       mov             dword ptr 0x10[esp],ecx
0356                            L$32:
0356  8B 4D 57                          mov             ecx,dword ptr 0x57[ebp]
0359                            L$33:
0359  85 D2                             test            edx,edx
035B  0F 85 2E FF FF FF                 jne             L$23
0361  3B 7C 24 14                       cmp             edi,dword ptr 0x14[esp]
0365  0F 85 24 FF FF FF                 jne             L$23
036B  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
036F  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0373  46                                inc             esi
0374  40                                inc             eax
0375  89 74 24 08                       mov             dword ptr 0x8[esp],esi
0379  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
037D                            L$34:
037D  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0381  3B 44 24 04                       cmp             eax,dword ptr 0x4[esp]
0385  0F 82 F8 FE FF FF                 jb              L$22
038B  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0390  75 07                             jne             L$35
0392  89 E8                             mov             eax,ebp
0394  E8 00 00 00 00                    call            updateBuff_
0399                            L$35:
0399  E8 00 00 00 00                    call            _ReleaseWinLines_
039E  83 C4 1C                          add             esp,0x0000001c
03A1  5D                                pop             ebp
03A2  5F                                pop             edi
03A3  5E                                pop             esi
03A4  59                                pop             ecx
03A5  C3                                ret

Routine Size: 437 bytes,    Routine Base: _TEXT + 01F1

03A6                            _UpdateInputLine_:
03A6  56                                push            esi
03A7  57                                push            edi
03A8  55                                push            ebp
03A9  83 EC 0C                          sub             esp,0x0000000c
03AC  89 C6                             mov             esi,eax
03AE  89 5C 24 04                       mov             dword ptr 0x4[esp],ebx
03B2  89 0C 24                          mov             dword ptr [esp],ecx
03B5  E8 00 00 00 00                    call            _AccessWinLines_
03BA  C7 46 67 01 00 00 00              mov             dword ptr 0x67[esi],0x00000001
03C1  8B 4E 57                          mov             ecx,dword ptr 0x57[esi]
03C4  31 ED                             xor             ebp,ebp
03C6  31 DB                             xor             ebx,ebx
03C8  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
03CC  EB 35                             jmp             L$38
03CE                            L$36:
03CE  8B 7E 63                          mov             edi,dword ptr 0x63[esi]
03D1  83 EF 02                          sub             edi,0x00000002
03D4  31 ED                             xor             ebp,ebp
03D6  39 F9                             cmp             ecx,edi
03D8  7C 1D                             jl              L$37
03DA  8B 7E 53                          mov             edi,dword ptr 0x53[esi]
03DD  BD 01 00 00 00                    mov             ebp,0x00000001
03E2  89 F0                             mov             eax,esi
03E4  C6 44 39 09 00                    mov             byte ptr 0x9[ecx+edi],0x00
03E9  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
03ED  89 4E 57                          mov             dword ptr 0x57[esi],ecx
03F0  E8 00 00 00 00                    call            newLine_
03F5  31 C9                             xor             ecx,ecx
03F7                            L$37:
03F7  41                                inc             ecx
03F8  43                                inc             ebx
03F9  8B 7E 53                          mov             edi,dword ptr 0x53[esi]
03FC  8A 02                             mov             al,byte ptr [edx]
03FE  42                                inc             edx
03FF  88 44 39 08                       mov             byte ptr 0x8[ecx+edi],al
0403                            L$38:
0403  3B 5C 24 04                       cmp             ebx,dword ptr 0x4[esp]
0407  72 C5                             jb              L$36
0409  8B 56 53                          mov             edx,dword ptr 0x53[esi]
040C  8B 04 24                          mov             eax,dword ptr [esp]
040F  C6 44 11 09 00                    mov             byte ptr 0x9[ecx+edx],0x00
0414  85 C0                             test            eax,eax
0416  74 10                             je              L$39
0418  85 ED                             test            ebp,ebp
041A  75 0C                             jne             L$39
041C  89 F0                             mov             eax,esi
041E  89 4E 57                          mov             dword ptr 0x57[esi],ecx
0421  E8 00 00 00 00                    call            newLine_
0426  EB 23                             jmp             L$40
0428                            L$39:
0428  89 F0                             mov             eax,esi
042A  8B 56 46                          mov             edx,dword ptr 0x46[esi]
042D  8B 7E 4E                          mov             edi,dword ptr 0x4e[esi]
0430  8B 5E 53                          mov             ebx,dword ptr 0x53[esi]
0433  29 FA                             sub             edx,edi
0435  83 C3 09                          add             ebx,0x00000009
0438  42                                inc             edx
0439  8B 6C 24 08                       mov             ebp,dword ptr 0x8[esp]
043D  E8 00 00 00 00                    call            _DisplayLineInWindow_
0442  85 ED                             test            ebp,ebp
0444  75 05                             jne             L$40
0446  B9 FF FF FF FF                    mov             ecx,0xffffffff
044B                            L$40:
044B  E8 00 00 00 00                    call            _ReleaseWinLines_
0450  89 C8                             mov             eax,ecx
0452  83 C4 0C                          add             esp,0x0000000c
0455  5D                                pop             ebp
0456  5F                                pop             edi
0457  5E                                pop             esi
0458  C3                                ret

Routine Size: 179 bytes,    Routine Base: _TEXT + 03A6

0459                            _PositionScrollThumb_:
0459  53                                push            ebx
045A  51                                push            ecx
045B  52                                push            edx
045C  56                                push            esi
045D  57                                push            edi
045E  89 C3                             mov             ebx,eax
0460  8B 50 4E                          mov             edx,dword ptr 0x4e[eax]
0463  E8 00 00 00 00                    call            _GetLastLineNumber_
0468  89 C1                             mov             ecx,eax
046A  3D 00 80 00 00                    cmp             eax,0x00008000
046F  76 12                             jbe             L$41
0471  89 D0                             mov             eax,edx
0473  C1 E0 0F                          shl             eax,0x0f
0476  31 D2                             xor             edx,edx
0478  F7 F1                             div             ecx
047A  BF 00 80 00 00                    mov             edi,0x00008000
047F  89 C6                             mov             esi,eax
0481  EB 04                             jmp             L$42
0483                            L$41:
0483  89 C7                             mov             edi,eax
0485  89 D6                             mov             esi,edx
0487                            L$42:
0487  31 C0                             xor             eax,eax
0489  6A 00                             push            0x00000000
048B  66 89 F8                          mov             ax,di
048E  50                                push            eax
048F  6A 01                             push            0x00000001
0491  6A 01                             push            0x00000001
0493  8B 53 3A                          mov             edx,dword ptr 0x3a[ebx]
0496  52                                push            edx
0497  E8 00 00 00 00                    call            _SetScrollRange
049C  31 C0                             xor             eax,eax
049E  6A 01                             push            0x00000001
04A0  66 89 F0                          mov             ax,si
04A3  50                                push            eax
04A4  6A 01                             push            0x00000001
04A6  8B 4B 3A                          mov             ecx,dword ptr 0x3a[ebx]
04A9  51                                push            ecx
04AA  E8 00 00 00 00                    call            _SetScrollPos
04AF  E9 12 FC FF FF                    jmp             L$8

Routine Size: 91 bytes,    Routine Base: _TEXT + 0459

04B4                            _GetLineFromThumbPosition_:
04B4  E8 00 00 00 00                    call            _GetLastLineNumber_
04B9  3D 00 80 00 00                    cmp             eax,0x00008000
04BE  76 0D                             jbe             L$43
04C0  81 E2 FF FF 00 00                 and             edx,0x0000ffff
04C6  0F AF C2                          imul            eax,edx
04C9  C1 E8 0F                          shr             eax,0x0f
04CC  C3                                ret
04CD                            L$43:
04CD  31 C0                             xor             eax,eax
04CF  66 89 D0                          mov             ax,dx
04D2  C3                                ret

Routine Size: 31 bytes,    Routine Base: _TEXT + 04B4

04D3                            _GetLineDataPointer_:
04D3  53                                push            ebx
04D4  51                                push            ecx
04D5  89 C1                             mov             ecx,eax
04D7  89 D3                             mov             ebx,edx
04D9  E8 00 00 00 00                    call            _AccessWinLines_
04DE  3B 59 46                          cmp             ebx,dword ptr 0x46[ecx]
04E1  75 11                             jne             L$44
04E3  83 79 67 00                       cmp             dword ptr 0x67[ecx],0x00000000
04E7  74 0B                             je              L$44
04E9  E8 00 00 00 00                    call            _ReleaseWinLines_
04EE  8B 41 53                          mov             eax,dword ptr 0x53[ecx]
04F1  59                                pop             ecx
04F2  5B                                pop             ebx
04F3  C3                                ret
04F4                            L$44:
04F4  B8 01 00 00 00                    mov             eax,0x00000001
04F9  8B 51 3E                          mov             edx,dword ptr 0x3e[ecx]
04FC                            L$45:
04FC  39 D8                             cmp             eax,ebx
04FE  74 09                             je              L$46
0500  85 D2                             test            edx,edx
0502  74 05                             je              L$46
0504  40                                inc             eax
0505  8B 12                             mov             edx,dword ptr [edx]
0507  EB F3                             jmp             L$45
0509                            L$46:
0509  E8 00 00 00 00                    call            _ReleaseWinLines_
050E  89 D0                             mov             eax,edx
0510  59                                pop             ecx
0511  5B                                pop             ebx
0512  C3                                ret

Routine Size: 64 bytes,    Routine Base: _TEXT + 04D3

0513                            _FreeAllLines_:
0513  53                                push            ebx
0514  52                                push            edx
0515  89 C2                             mov             edx,eax
0517  E8 00 00 00 00                    call            _AccessWinLines_
051C  8B 42 3E                          mov             eax,dword ptr 0x3e[edx]
051F                            L$47:
051F  85 C0                             test            eax,eax
0521  74 0B                             je              L$48
0523  8B 18                             mov             ebx,dword ptr [eax]
0525  E8 00 00 00 00                    call            _MemFree_
052A  89 D8                             mov             eax,ebx
052C  EB F1                             jmp             L$47
052E                            L$48:
052E  C7 42 4E 01 00 00 00              mov             dword ptr 0x4e[edx],0x00000001
0535  89 42 42                          mov             dword ptr 0x42[edx],eax
0538  89 42 3E                          mov             dword ptr 0x3e[edx],eax
053B  89 42 57                          mov             dword ptr 0x57[edx],eax
053E  8B 42 4E                          mov             eax,dword ptr 0x4e[edx]
0541  89 42 46                          mov             dword ptr 0x46[edx],eax
0544  89 42 4A                          mov             dword ptr 0x4a[edx],eax
0547  89 D0                             mov             eax,edx
0549  E8 00 00 00 00                    call            _PositionScrollThumb_
054E  E8 00 00 00 00                    call            _ReleaseWinLines_
0553  5A                                pop             edx
0554  5B                                pop             ebx
0555  C3                                ret

Routine Size: 67 bytes,    Routine Base: _TEXT + 0513

0556                            _SaveAllLines_:
0556  53                                push            ebx
0557  51                                push            ecx
0558  52                                push            edx
0559  56                                push            esi
055A  57                                push            edi
055B  55                                push            ebp
055C  81 EC 50 01 00 00                 sub             esp,0x00000150
0562  89 C6                             mov             esi,eax
0564  BB 4C 00 00 00                    mov             ebx,0x0000004c
0569  B9 01 00 00 00                    mov             ecx,0x00000001
056E  BF 04 01 00 00                    mov             edi,0x00000104
0573  30 E4                             xor             ah,ah
0575  31 D2                             xor             edx,edx
0577  88 24 24                          mov             byte ptr [esp],ah
057A  8D 84 24 04 01 00 00              lea             eax,0x104[esp]
0581  BD 00 00 00 00                    mov             ebp,offset DGROUP:L$62
0586  E8 00 00 00 00                    call            memset_
058B  BA 4C 00 00 00                    mov             edx,0x0000004c
0590  A1 00 00 00 00                    mov             eax,dword ptr __MainWindow
0595  BB 00 00 00 00                    mov             ebx,offset _filterFiles
059A  89 84 24 08 01 00 00              mov             dword ptr 0x108[esp],eax
05A1  89 E0                             mov             eax,esp
05A3  89 8C 24 1C 01 00 00              mov             dword ptr 0x11c[esp],ecx
05AA  89 84 24 20 01 00 00              mov             dword ptr 0x120[esp],eax
05B1  B8 04 00 00 00                    mov             eax,0x00000004
05B6  89 BC 24 24 01 00 00              mov             dword ptr 0x124[esp],edi
05BD  89 84 24 38 01 00 00              mov             dword ptr 0x138[esp],eax
05C4  8D 84 24 04 01 00 00              lea             eax,0x104[esp]
05CB  89 AC 24 34 01 00 00              mov             dword ptr 0x134[esp],ebp
05D2  50                                push            eax
05D3  89 94 24 08 01 00 00              mov             dword ptr 0x108[esp],edx
05DA  89 9C 24 14 01 00 00              mov             dword ptr 0x114[esp],ebx
05E1  E8 00 00 00 00                    call            _GetSaveFileNameA
05E6  85 C0                             test            eax,eax
05E8  74 5F                             je              L$53
05EA  E8 00 00 00 00                    call            _AccessWinLines_
05EF  89 E0                             mov             eax,esp
05F1  BA 19 00 00 00                    mov             edx,offset DGROUP:L$63
05F6  E8 00 00 00 00                    call            fopen_
05FB  89 C3                             mov             ebx,eax
05FD  85 C0                             test            eax,eax
05FF  75 0E                             jne             L$49
0601  50                                push            eax
0602  68 1B 00 00 00                    push            offset DGROUP:L$64
0607  8D 44 24 08                       lea             eax,0x8[esp]
060B  50                                push            eax
060C  53                                push            ebx
060D  EB 35                             jmp             L$52
060F                            L$49:
060F  8B 56 3E                          mov             edx,dword ptr 0x3e[esi]
0612                            L$50:
0612  85 D2                             test            edx,edx
0614  74 16                             je              L$51
0616  8D 42 09                          lea             eax,0x9[edx]
0619  50                                push            eax
061A  68 2E 00 00 00                    push            offset DGROUP:L$65
061F  53                                push            ebx
0620  E8 00 00 00 00                    call            fprintf_
0625  83 C4 0C                          add             esp,0x0000000c
0628  8B 12                             mov             edx,dword ptr [edx]
062A  EB E6                             jmp             L$50
062C                            L$51:
062C  89 D8                             mov             eax,ebx
062E  E8 00 00 00 00                    call            fclose_
0633  E8 00 00 00 00                    call            _ReleaseWinLines_
0638  52                                push            edx
0639  68 32 00 00 00                    push            offset DGROUP:L$66
063E  8D 44 24 08                       lea             eax,0x8[esp]
0642  50                                push            eax
0643  52                                push            edx
0644                            L$52:
0644  E8 00 00 00 00                    call            _MessageBoxA
0649                            L$53:
0649  81 C4 50 01 00 00                 add             esp,0x00000150
064F  E9 71 FA FF FF                    jmp             L$7

Routine Size: 254 bytes,    Routine Base: _TEXT + 0556

0654                            _CopyAllLines_:
0654  53                                push            ebx
0655  51                                push            ecx
0656  52                                push            edx
0657  56                                push            esi
0658  57                                push            edi
0659  55                                push            ebp
065A  83 EC 08                          sub             esp,0x00000008
065D  50                                push            eax
065E  8B 14 24                          mov             edx,dword ptr [esp]
0661  E8 00 00 00 00                    call            _AccessWinLines_
0666  31 DB                             xor             ebx,ebx
0668  8B 52 3E                          mov             edx,dword ptr 0x3e[edx]
066B                            L$54:
066B  85 D2                             test            edx,edx
066D  74 1C                             je              L$55
066F  8D 7A 09                          lea             edi,0x9[edx]
0672  06                                push            es
0673  8C D8                             mov             eax,ds
0675  8E C0                             mov             es,eax
0677  29 C9                             sub             ecx,ecx
0679  49                                dec             ecx
067A  31 C0                             xor             eax,eax
067C  F2 AE                             repne scasb
067E  F7 D1                             not             ecx
0680  49                                dec             ecx
0681  07                                pop             es
0682  83 C1 02                          add             ecx,0x00000002
0685  8B 12                             mov             edx,dword ptr [edx]
0687  01 CB                             add             ebx,ecx
0689  EB E0                             jmp             L$54
068B                            L$55:
068B  81 FB FE FF 00 00                 cmp             ebx,0x0000fffe
0691  76 05                             jbe             L$56
0693  BB FE FF 00 00                    mov             ebx,0x0000fffe
0698                            L$56:
0698  43                                inc             ebx
0699  53                                push            ebx
069A  6A 02                             push            0x00000002
069C  E8 00 00 00 00                    call            _GlobalAlloc
06A1  89 C2                             mov             edx,eax
06A3  89 44 24 04                       mov             dword ptr 0x4[esp],eax
06A7  85 C0                             test            eax,eax
06A9  75 16                             jne             L$57
06AB  50                                push            eax
06AC  68 45 00 00 00                    push            offset DGROUP:L$67
06B1  68 57 00 00 00                    push            offset DGROUP:L$68
06B6  50                                push            eax
06B7  E8 00 00 00 00                    call            _MessageBoxA
06BC  E9 AD 00 00 00                    jmp             L$60
06C1                            L$57:
06C1  50                                push            eax
06C2  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
06C6  E8 00 00 00 00                    call            _GlobalLock
06CB  89 44 24 08                       mov             dword ptr 0x8[esp],eax
06CF  8B 5B 3E                          mov             ebx,dword ptr 0x3e[ebx]
06D2  31 D2                             xor             edx,edx
06D4                            L$58:
06D4  85 DB                             test            ebx,ebx
06D6  74 5D                             je              L$59
06D8  8D 73 09                          lea             esi,0x9[ebx]
06DB  89 F7                             mov             edi,esi
06DD  06                                push            es
06DE  8C D8                             mov             eax,ds
06E0  8E C0                             mov             es,eax
06E2  29 C9                             sub             ecx,ecx
06E4  49                                dec             ecx
06E5  31 C0                             xor             eax,eax
06E7  F2 AE                             repne scasb
06E9  F7 D1                             not             ecx
06EB  49                                dec             ecx
06EC  07                                pop             es
06ED  8D 41 02                          lea             eax,0x2[ecx]
06F0  8D 2C 02                          lea             ebp,[edx+eax]
06F3  81 FD FE FF 00 00                 cmp             ebp,0x0000fffe
06F9  77 3A                             ja              L$59
06FB  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
06FF  83 E8 02                          sub             eax,0x00000002
0702  8C D9                             mov             ecx,ds
0704  01 D7                             add             edi,edx
0706  8C DA                             mov             edx,ds
0708  1E                                push            ds
0709  06                                push            es
070A  57                                push            edi
070B  91                                xchg            eax,ecx
070C  8E D8                             mov             ds,eax
070E  8E C2                             mov             es,edx
0710  89 C8                             mov             eax,ecx
0712  C1 E9 02                          shr             ecx,0x02
0715  F2 A5                             repne movsd
0717  8A C8                             mov             cl,al
0719  80 E1 03                          and             cl,0x03
071C  F2 A4                             repne movsb
071E  58                                pop             eax
071F  07                                pop             es
0720  1F                                pop             ds
0721  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0725  C6 44 2A FE 0D                    mov             byte ptr -0x2[edx+ebp],0x0d
072A  C6 44 2A FF 0A                    mov             byte ptr -0x1[edx+ebp],0x0a
072F  89 EA                             mov             edx,ebp
0731  8B 1B                             mov             ebx,dword ptr [ebx]
0733  EB 9F                             jmp             L$58
0735                            L$59:
0735  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0739  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
073D  01 DA                             add             edx,ebx
073F  51                                push            ecx
0740  C6 02 00                          mov             byte ptr [edx],0x00
0743  E8 00 00 00 00                    call            _GlobalUnlock
0748  8B 04 24                          mov             eax,dword ptr [esp]
074B  8B 70 3A                          mov             esi,dword ptr 0x3a[eax]
074E  56                                push            esi
074F  E8 00 00 00 00                    call            _OpenClipboard
0754  85 C0                             test            eax,eax
0756  74 16                             je              L$60
0758  8B 7C 24 04                       mov             edi,dword ptr 0x4[esp]
075C  E8 00 00 00 00                    call            _EmptyClipboard
0761  57                                push            edi
0762  6A 01                             push            0x00000001
0764  E8 00 00 00 00                    call            _SetClipboardData
0769  E8 00 00 00 00                    call            _CloseClipboard
076E                            L$60:
076E  E8 00 00 00 00                    call            _ReleaseWinLines_
0773  83 C4 0C                          add             esp,0x0000000c
0776  E9 4A F9 FF FF                    jmp             L$7

Routine Size: 295 bytes,    Routine Base: _TEXT + 0654

077B                            _GetLastLineNumber_:
077B  53                                push            ebx
077C  52                                push            edx
077D  8B 58 67                          mov             ebx,dword ptr 0x67[eax]
0780  8B 50 46                          mov             edx,dword ptr 0x46[eax]
0783  85 DB                             test            ebx,ebx
0785  74 01                             je              L$61
0787  42                                inc             edx
0788                            L$61:
0788  89 D0                             mov             eax,edx
078A  5A                                pop             edx
078B  5B                                pop             ebx
078C  C3                                ret

Routine Size: 18 bytes,    Routine Base: _TEXT + 077B

No disassembly errors

Segment: CONST DWORD USE32 00000065 bytes
0000                            L$62:
0000  53 61 76 65 20 46 69 6C 65 20 4E 61 6D 65 20 53 Save File Name S
0010  65 6C 65 63 74 69 6F 6E 00                      election.
0019                            L$63:
0019  77 00                                           w.
001B                            L$64:
001B  45 72 72 6F 72 20 6F 70 65 6E 69 6E 67 20 66 69 Error opening fi
002B  6C 65 00                                        le.
002E                            L$65:
002E  25 73 0A 00                                     %s..
0032                            L$66:
0032  44 61 74 61 20 73 61 76 65 64 20 74 6F 20 66 69 Data saved to fi
0042  6C 65 00                                        le.
0045                            L$67:
0045  43 6F 70 79 20 74 6F 20 43 6C 69 70 62 6F 61 72 Copy to Clipboar
0055  64 00                                           d.
0057                            L$68:
0057  4F 75 74 20 6F 66 20 4D 65 6D 6F 72 79 00       Out of Memory.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000001D bytes
0000                            _filterFiles:
0000  52 65 73 75 6C 74 20 46 69 6C 65 73 20 28 2A 2E Result Files (*.
0010  54 58 54 29 00 2A 2E 54 58 54 00 00 00          TXT).*.TXT...

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

