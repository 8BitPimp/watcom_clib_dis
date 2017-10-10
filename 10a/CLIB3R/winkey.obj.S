Module: winkey
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000568 bytes
0000                            _WindowsKeyUp_:
0000  66 3D 10 00                       cmp             ax,0x0010
0004  72 18                             jb              L$3
0006  76 07                             jbe             L$1
0008  66 3D 11 00                       cmp             ax,0x0011
000C  74 09                             je              L$2
000E  C3                                ret
000F                            L$1:
000F  80 25 00 00 00 00 FD              and             byte ptr _shiftState,0xfd
0016  C3                                ret
0017                            L$2:
0017  80 25 00 00 00 00 F7              and             byte ptr _shiftState,0xf7
001E                            L$3:
001E  C3                                ret

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

001F                            _WindowsKeyPush_:
001F  53                                push            ebx
0020  51                                push            ecx
0021  56                                push            esi
0022  83 EC 10                          sub             esp,0x00000010
0025  89 C3                             mov             ebx,eax
0027  BE 01 00 00 00                    mov             esi,0x00000001
002C  88 54 24 0C                       mov             byte ptr 0xc[esp],dl
0030  66 3D 23 00                       cmp             ax,0x0023
0034  72 1C                             jb              L$4
0036  66 3D 25 00                       cmp             ax,0x0025
003A  76 24                             jbe             L$5
003C  66 3D 27 00                       cmp             ax,0x0027
0040  72 36                             jb              L$6
0042  76 1C                             jbe             L$5
0044  66 3D 2D 00                       cmp             ax,0x002d
0048  72 2E                             jb              L$6
004A  66 3D 2E 00                       cmp             ax,0x002e
004E  76 10                             jbe             L$5
0050  EB 26                             jmp             L$6
0052                            L$4:
0052  66 3D 08 00                       cmp             ax,0x0008
0056  72 20                             jb              L$6
0058  76 06                             jbe             L$5
005A  66 3D 0D 00                       cmp             ax,0x000d
005E  75 18                             jne             L$6
0060                            L$5:
0060  31 C0                             xor             eax,eax
0062  66 89 D8                          mov             ax,bx
0065  05 80 00 00 00                    add             eax,0x00000080
006A  89 44 24 08                       mov             dword ptr 0x8[esp],eax
006E  C6 44 24 0C FF                    mov             byte ptr 0xc[esp],0xff
0073  E9 81 00 00 00                    jmp             L$8
0078                            L$6:
0078  68 00 00 00 00                    push            offset _pbKeyState
007D  E8 00 00 00 00                    call            _GetKeyboardState
0082  6A 00                             push            0x00000000
0084  8D 44 24 04                       lea             eax,0x4[esp]
0088  50                                push            eax
0089  31 C0                             xor             eax,eax
008B  68 00 00 00 00                    push            offset _pbKeyState
0090  8A 44 24 18                       mov             al,byte ptr 0x18[esp]
0094  50                                push            eax
0095  31 C0                             xor             eax,eax
0097  66 89 D8                          mov             ax,bx
009A  50                                push            eax
009B  E8 00 00 00 00                    call            _ToAscii
00A0  85 C0                             test            eax,eax
00A2  7F 04                             jg              L$7
00A4  31 F6                             xor             esi,esi
00A6  EB 51                             jmp             L$8
00A8                            L$7:
00A8  31 D2                             xor             edx,edx
00AA  66 8B 14 24                       mov             dx,word ptr [esp]
00AE  89 54 24 08                       mov             dword ptr 0x8[esp],edx
00B2  83 F8 02                          cmp             eax,0x00000002
00B5  75 42                             jne             L$8
00B7  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
00BC  8A 54 24 08                       mov             dl,byte ptr 0x8[esp]
00C0  88 90 00 00 00 00                 mov             byte ptr _charList[eax],dl
00C6  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
00CB  8A 54 24 0C                       mov             dl,byte ptr 0xc[esp]
00CF  88 90 00 00 00 00                 mov             byte ptr _scanList[eax],dl
00D5  8B 15 00 00 00 00                 mov             edx,dword ptr _keyTop
00DB  42                                inc             edx
00DC  BB 20 00 00 00                    mov             ebx,0x00000020
00E1  89 D0                             mov             eax,edx
00E3  C1 FA 1F                          sar             edx,0x1f
00E6  F7 FB                             idiv            ebx
00E8  89 15 00 00 00 00                 mov             dword ptr _keyTop,edx
00EE  31 C0                             xor             eax,eax
00F0  66 8B 44 24 02                    mov             ax,word ptr 0x2[esp]
00F5  89 44 24 08                       mov             dword ptr 0x8[esp],eax
00F9                            L$8:
00F9  85 F6                             test            esi,esi
00FB  74 37                             je              L$9
00FD  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
0102  8A 54 24 08                       mov             dl,byte ptr 0x8[esp]
0106  88 90 00 00 00 00                 mov             byte ptr _charList[eax],dl
010C  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
0111  8A 54 24 0C                       mov             dl,byte ptr 0xc[esp]
0115  88 90 00 00 00 00                 mov             byte ptr _scanList[eax],dl
011B  8B 15 00 00 00 00                 mov             edx,dword ptr _keyTop
0121  42                                inc             edx
0122  BE 20 00 00 00                    mov             esi,0x00000020
0127  89 D0                             mov             eax,edx
0129  C1 FA 1F                          sar             edx,0x1f
012C  F7 FE                             idiv            esi
012E  89 15 00 00 00 00                 mov             dword ptr _keyTop,edx
0134                            L$9:
0134  83 C4 10                          add             esp,0x00000010
0137  5E                                pop             esi
0138  59                                pop             ecx
0139  5B                                pop             ebx
013A  C3                                ret

Routine Size: 284 bytes,    Routine Base: _TEXT + 001F

013B                            _KeyboardHit_:
013B  53                                push            ebx
013C  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
0141  3B 05 00 00 00 00                 cmp             eax,dword ptr _keyBottom
0147  74 07                             je              L$11
0149                            L$10:
0149  B8 01 00 00 00                    mov             eax,0x00000001
014E  5B                                pop             ebx
014F  C3                                ret
0150                            L$11:
0150  B8 01 00 00 00                    mov             eax,0x00000001
0155  E8 00 00 00 00                    call            _MessageLoop_
015A  A1 00 00 00 00                    mov             eax,dword ptr _keyTop
015F  8B 1D 00 00 00 00                 mov             ebx,dword ptr _keyBottom
0165  39 D8                             cmp             eax,ebx
0167  75 E0                             jne             L$10
0169  31 D8                             xor             eax,ebx
016B  5B                                pop             ebx
016C  C3                                ret

Routine Size: 50 bytes,    Routine Base: _TEXT + 013B

016D                            _GetKeyboard_:
016D  53                                push            ebx
016E  51                                push            ecx
016F  52                                push            edx
0170  8B 15 00 00 00 00                 mov             edx,dword ptr _keyBottom
0176  31 DB                             xor             ebx,ebx
0178  8A 9A 00 00 00 00                 mov             bl,byte ptr _charList[edx]
017E  85 C0                             test            eax,eax
0180  74 14                             je              L$12
0182  8B 15 00 00 00 00                 mov             edx,dword ptr _keyBottom
0188  8A 92 00 00 00 00                 mov             dl,byte ptr _scanList[edx]
018E  81 E2 FF 00 00 00                 and             edx,0x000000ff
0194  89 10                             mov             dword ptr [eax],edx
0196                            L$12:
0196  8B 15 00 00 00 00                 mov             edx,dword ptr _keyBottom
019C  42                                inc             edx
019D  B9 20 00 00 00                    mov             ecx,0x00000020
01A2  89 D0                             mov             eax,edx
01A4  C1 FA 1F                          sar             edx,0x1f
01A7  F7 F9                             idiv            ecx
01A9  89 15 00 00 00 00                 mov             dword ptr _keyBottom,edx
01AF  89 D8                             mov             eax,ebx
01B1  5A                                pop             edx
01B2  59                                pop             ecx
01B3  5B                                pop             ebx
01B4  C3                                ret

Routine Size: 72 bytes,    Routine Base: _TEXT + 016D

01B5                            _GetString_:
01B5  51                                push            ecx
01B6  56                                push            esi
01B7  57                                push            edi
01B8  55                                push            ebp
01B9  83 EC 24                          sub             esp,0x00000024
01BC  50                                push            eax
01BD  52                                push            edx
01BE  8D 43 01                          lea             eax,0x1[ebx]
01C1  89 5C 24 20                       mov             dword ptr 0x20[esp],ebx
01C5  E8 00 00 00 00                    call            _MemAlloc_
01CA  31 ED                             xor             ebp,ebp
01CC  31 F6                             xor             esi,esi
01CE  89 6C 24 10                       mov             dword ptr 0x10[esp],ebp
01D2  89 6C 24 0C                       mov             dword ptr 0xc[esp],ebp
01D6  89 44 24 18                       mov             dword ptr 0x18[esp],eax
01DA  85 C0                             test            eax,eax
01DC  0F 84 63 02 00 00                 je              L$36
01E2  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
01E6  8B 40 3A                          mov             eax,dword ptr 0x3a[eax]
01E9  89 44 24 08                       mov             dword ptr 0x8[esp],eax
01ED  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
01F1  31 DB                             xor             ebx,ebx
01F3  E8 00 00 00 00                    call            _GetLastLineNumber_
01F8  89 C2                             mov             edx,eax
01FA  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
01FE  E8 00 00 00 00                    call            _MoveToLine_
0203  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0207  31 D2                             xor             edx,edx
0209  E8 00 00 00 00                    call            _NewCursor_
020E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0212  BA 01 00 00 00                    mov             edx,0x00000001
0217  E8 00 00 00 00                    call            _SetInputMode_
021C  8B 04 24                          mov             eax,dword ptr [esp]
021F  89 2D 00 00 00 00                 mov             dword ptr __GotEOF,ebp
0225  C6 00 00                          mov             byte ptr [eax],0x00
0228                            L$13:
0228  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
022C  89 70 5B                          mov             dword ptr 0x5b[eax],esi
022F  E8 00 00 00 00                    call            _DisplayCursor_
0234                            L$14:
0234  E8 00 00 00 00                    call            _KeyboardHit_
0239  85 C0                             test            eax,eax
023B  74 F7                             je              L$14
023D  8D 44 24 14                       lea             eax,0x14[esp]
0241  E8 00 00 00 00                    call            _GetKeyboard_
0246  89 C3                             mov             ebx,eax
0248  88 44 24 24                       mov             byte ptr 0x24[esp],al
024C  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0250  50                                push            eax
0251  E8 00 00 00 00                    call            _HideCaret
0256  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
025B  74 15                             je              L$15
025D  8B 0C 24                          mov             ecx,dword ptr [esp]
0260  89 F0                             mov             eax,esi
0262  31 FF                             xor             edi,edi
0264  01 C8                             add             eax,ecx
0266  46                                inc             esi
0267  89 7C 24 10                       mov             dword ptr 0x10[esp],edi
026B  88 18                             mov             byte ptr [eax],bl
026D  E9 35 02 00 00                    jmp             L$47
0272                            L$15:
0272  80 FB 16                          cmp             bl,0x16
0275  74 0E                             je              L$16
0277  81 7C 24 14 FF 00 00 00           cmp             dword ptr 0x14[esp],0x000000ff
027F  0F 84 9A 00 00 00                 je              L$24
0285                            L$16:
0285  80 7C 24 24 16                    cmp             byte ptr 0x24[esp],0x16
028A  75 0F                             jne             L$17
028C  B9 01 00 00 00                    mov             ecx,0x00000001
0291  B2 5E                             mov             dl,0x5e
0293  89 4C 24 10                       mov             dword ptr 0x10[esp],ecx
0297  88 54 24 24                       mov             byte ptr 0x24[esp],dl
029B                            L$17:
029B  83 7C 24 0C 00                    cmp             dword ptr 0xc[esp],0x00000000
02A0  74 3E                             je              L$20
02A2  3B 6C 24 20                       cmp             ebp,dword ptr 0x20[esp]
02A6  7D 80                             jge             L$13
02A8  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
02AC  8B 40 63                          mov             eax,dword ptr 0x63[eax]
02AF  83 E8 02                          sub             eax,0x00000002
02B2  39 C5                             cmp             ebp,eax
02B4  0F 9C C0                          setl            al
02B7  25 FF 00 00 00                    and             eax,0x000000ff
02BC  0F 84 66 FF FF FF                 je              L$13
02C2  8B 04 24                          mov             eax,dword ptr [esp]
02C5  89 EA                             mov             edx,ebp
02C7  01 E8                             add             eax,ebp
02C9  EB 07                             jmp             L$19
02CB                            L$18:
02CB  8A 18                             mov             bl,byte ptr [eax]
02CD  48                                dec             eax
02CE  4A                                dec             edx
02CF  88 58 02                          mov             byte ptr 0x2[eax],bl
02D2                            L$19:
02D2  39 F2                             cmp             edx,esi
02D4  7D F5                             jge             L$18
02D6  8B 04 24                          mov             eax,dword ptr [esp]
02D9  8A 54 24 24                       mov             dl,byte ptr 0x24[esp]
02DD  45                                inc             ebp
02DE  EB 2B                             jmp             L$22
02E0                            L$20:
02E0  39 EE                             cmp             esi,ebp
02E2  75 20                             jne             L$21
02E4  3B 6C 24 20                       cmp             ebp,dword ptr 0x20[esp]
02E8  0F 8D 3A FF FF FF                 jge             L$13
02EE  8B 14 24                          mov             edx,dword ptr [esp]
02F1  8D 04 16                          lea             eax,[esi+edx]
02F4  8A 54 24 24                       mov             dl,byte ptr 0x24[esp]
02F8  45                                inc             ebp
02F9  88 10                             mov             byte ptr [eax],dl
02FB  8B 04 24                          mov             eax,dword ptr [esp]
02FE  C6 04 28 00                       mov             byte ptr [eax+ebp],0x00
0302  EB 0A                             jmp             L$23
0304                            L$21:
0304  8B 04 24                          mov             eax,dword ptr [esp]
0307  8A 54 24 24                       mov             dl,byte ptr 0x24[esp]
030B                            L$22:
030B  88 14 06                          mov             byte ptr [esi+eax],dl
030E                            L$23:
030E  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0313  0F 85 8E 01 00 00                 jne             L$47
0319  46                                inc             esi
031A  E9 88 01 00 00                    jmp             L$47
031F                            L$24:
031F  88 D8                             mov             al,bl
0321  80 FB 80                          cmp             bl,0x80
0324  72 02                             jb              L$25
0326  2C 80                             sub             al,0x80
0328                            L$25:
0328  3C 24                             cmp             al,0x24
032A  72 37                             jb              L$27
032C  76 51                             jbe             L$29
032E  3C 27                             cmp             al,0x27
0330  72 24                             jb              L$26
0332  8D 56 01                          lea             edx,0x1[esi]
0335  0F 86 19 01 00 00                 jbe             L$39
033B  3C 2D                             cmp             al,0x2d
033D  0F 82 E5 FE FF FF                 jb              L$13
0343  0F 86 34 01 00 00                 jbe             L$44
0349  3C 2E                             cmp             al,0x2e
034B  0F 84 0B 01 00 00                 je              L$40
0351  E9 D2 FE FF FF                    jmp             L$13
0356                            L$26:
0356  3C 25                             cmp             al,0x25
0358  0F 84 EF 00 00 00                 je              L$37
035E  E9 C5 FE FF FF                    jmp             L$13
0363                            L$27:
0363  3C 0D                             cmp             al,0x0d
0365  72 0B                             jb              L$28
0367  76 24                             jbe             L$31
0369  3C 23                             cmp             al,0x23
036B  74 19                             je              L$30
036D  E9 B6 FE FF FF                    jmp             L$13
0372                            L$28:
0372  3C 08                             cmp             al,0x08
0374  0F 84 E8 00 00 00                 je              L$41
037A  E9 A9 FE FF FF                    jmp             L$13
037F                            L$29:
037F  31 F6                             xor             esi,esi
0381  E9 21 01 00 00                    jmp             L$47
0386                            L$30:
0386  89 EE                             mov             esi,ebp
0388  E9 1A 01 00 00                    jmp             L$47
038D                            L$31:
038D  8B 1C 24                          mov             ebx,dword ptr [esp]
0390  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0394  01 DD                             add             ebp,ebx
0396  BA 02 00 00 00                    mov             edx,0x00000002
039B  89 DF                             mov             edi,ebx
039D  C6 45 00 00                       mov             byte ptr [ebp],0x00
03A1  E8 00 00 00 00                    call            _NewCursor_
03A6  06                                push            es
03A7  8C D8                             mov             eax,ds
03A9  8E C0                             mov             es,eax
03AB  29 C9                             sub             ecx,ecx
03AD  49                                dec             ecx
03AE  31 C0                             xor             eax,eax
03B0  F2 AE                             repne scasb
03B2  F7 D1                             not             ecx
03B4  49                                dec             ecx
03B5  07                                pop             es
03B6  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
03BA  8B 14 24                          mov             edx,dword ptr [esp]
03BD  89 CB                             mov             ebx,ecx
03BF  B9 01 00 00 00                    mov             ecx,0x00000001
03C4  8B 34 24                          mov             esi,dword ptr [esp]
03C7  E8 00 00 00 00                    call            _UpdateInputLine_
03CC  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
03D0  31 D2                             xor             edx,edx
03D2  8B 7C 24 18                       mov             edi,dword ptr 0x18[esp]
03D6  E8 00 00 00 00                    call            _SetInputMode_
03DB  06                                push            es
03DC  1E                                push            ds
03DD  07                                pop             es
03DE  57                                push            edi
03DF  2B C9                             sub             ecx,ecx
03E1  49                                dec             ecx
03E2  B0 00                             mov             al,0x00
03E4  F2 AE                             repne scasb
03E6  4F                                dec             edi
03E7                            L$32:
03E7  8A 06                             mov             al,byte ptr [esi]
03E9  88 07                             mov             byte ptr [edi],al
03EB  3C 00                             cmp             al,0x00
03ED  0F 84 10 00 00 00                 je              L$33
03F3  8A 46 01                          mov             al,byte ptr 0x1[esi]
03F6  83 C6 02                          add             esi,0x00000002
03F9  88 47 01                          mov             byte ptr 0x1[edi],al
03FC  83 C7 02                          add             edi,0x00000002
03FF  3C 00                             cmp             al,0x00
0401  75 E4                             jne             L$32
0403                            L$33:
0403  5F                                pop             edi
0404  07                                pop             es
0405  8B 3C 24                          mov             edi,dword ptr [esp]
0408  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
040C  57                                push            edi
040D                            L$34:
040D  8A 06                             mov             al,byte ptr [esi]
040F  88 07                             mov             byte ptr [edi],al
0411  3C 00                             cmp             al,0x00
0413  0F 84 10 00 00 00                 je              L$35
0419  8A 46 01                          mov             al,byte ptr 0x1[esi]
041C  83 C6 02                          add             esi,0x00000002
041F  88 47 01                          mov             byte ptr 0x1[edi],al
0422  83 C7 02                          add             edi,0x00000002
0425  3C 00                             cmp             al,0x00
0427  75 E4                             jne             L$34
0429                            L$35:
0429  5F                                pop             edi
042A  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
042E  E8 00 00 00 00                    call            _MemFree_
0433  06                                push            es
0434  8C D8                             mov             eax,ds
0436  8E C0                             mov             es,eax
0438  29 C9                             sub             ecx,ecx
043A  49                                dec             ecx
043B  31 C0                             xor             eax,eax
043D  F2 AE                             repne scasb
043F  F7 D1                             not             ecx
0441  49                                dec             ecx
0442  07                                pop             es
0443  89 C8                             mov             eax,ecx
0445                            L$36:
0445  83 C4 2C                          add             esp,0x0000002c
0448  5D                                pop             ebp
0449  5F                                pop             edi
044A  5E                                pop             esi
044B  59                                pop             ecx
044C  C3                                ret
044D                            L$37:
044D  85 F6                             test            esi,esi
044F  7E 56                             jle             L$47
0451                            L$38:
0451  4E                                dec             esi
0452  EB 53                             jmp             L$47
0454                            L$39:
0454  39 EE                             cmp             esi,ebp
0456  7D 4F                             jge             L$47
0458  89 D6                             mov             esi,edx
045A  EB 4B                             jmp             L$47
045C                            L$40:
045C  39 EE                             cmp             esi,ebp
045E  7D 02                             jge             L$41
0460  89 D6                             mov             esi,edx
0462                            L$41:
0462  85 F6                             test            esi,esi
0464  7E 41                             jle             L$47
0466  8B 04 24                          mov             eax,dword ptr [esp]
0469  89 F2                             mov             edx,esi
046B  01 F0                             add             eax,esi
046D  EB 07                             jmp             L$43
046F                            L$42:
046F  8A 18                             mov             bl,byte ptr [eax]
0471  40                                inc             eax
0472  42                                inc             edx
0473  88 58 FE                          mov             byte ptr -0x2[eax],bl
0476                            L$43:
0476  39 EA                             cmp             edx,ebp
0478  7E F5                             jle             L$42
047A  4D                                dec             ebp
047B  EB D4                             jmp             L$38
047D                            L$44:
047D  83 7C 24 0C 00                    cmp             dword ptr 0xc[esp],0x00000000
0482  74 0C                             je              L$45
0484  31 D2                             xor             edx,edx
0486  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
048A  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
048E  EB 12                             jmp             L$46
0490                            L$45:
0490  B8 01 00 00 00                    mov             eax,0x00000001
0495  BA 01 00 00 00                    mov             edx,0x00000001
049A  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
049E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
04A2                            L$46:
04A2  E8 00 00 00 00                    call            _NewCursor_
04A7                            L$47:
04A7  8B 3C 24                          mov             edi,dword ptr [esp]
04AA  8B 14 24                          mov             edx,dword ptr [esp]
04AD  06                                push            es
04AE  8C D8                             mov             eax,ds
04B0  8E C0                             mov             es,eax
04B2  29 C9                             sub             ecx,ecx
04B4  49                                dec             ecx
04B5  31 C0                             xor             eax,eax
04B7  F2 AE                             repne scasb
04B9  F7 D1                             not             ecx
04BB  49                                dec             ecx
04BC  07                                pop             es
04BD  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
04C1  89 CB                             mov             ebx,ecx
04C3  31 C9                             xor             ecx,ecx
04C5  E8 00 00 00 00                    call            _UpdateInputLine_
04CA  89 C2                             mov             edx,eax
04CC  89 C3                             mov             ebx,eax
04CE  85 C0                             test            eax,eax
04D0  0F 8C 52 FD FF FF                 jl              L$13
04D6  8B 3C 24                          mov             edi,dword ptr [esp]
04D9  06                                push            es
04DA  8C D8                             mov             eax,ds
04DC  8E C0                             mov             es,eax
04DE  29 C9                             sub             ecx,ecx
04E0  49                                dec             ecx
04E1  31 C0                             xor             eax,eax
04E3  F2 AE                             repne scasb
04E5  F7 D1                             not             ecx
04E7  49                                dec             ecx
04E8  07                                pop             es
04E9  89 C8                             mov             eax,ecx
04EB  29 D0                             sub             eax,edx
04ED  8B 14 24                          mov             edx,dword ptr [esp]
04F0  01 C2                             add             edx,eax
04F2  8B 34 24                          mov             esi,dword ptr [esp]
04F5  8B 7C 24 18                       mov             edi,dword ptr 0x18[esp]
04F9  8A 02                             mov             al,byte ptr [edx]
04FB  89 4C 24 1C                       mov             dword ptr 0x1c[esp],ecx
04FF  88 44 24 28                       mov             byte ptr 0x28[esp],al
0503  C6 02 00                          mov             byte ptr [edx],0x00
0506  06                                push            es
0507  1E                                push            ds
0508  07                                pop             es
0509  57                                push            edi
050A  2B C9                             sub             ecx,ecx
050C  49                                dec             ecx
050D  B0 00                             mov             al,0x00
050F  F2 AE                             repne scasb
0511  4F                                dec             edi
0512                            L$48:
0512  8A 06                             mov             al,byte ptr [esi]
0514  88 07                             mov             byte ptr [edi],al
0516  3C 00                             cmp             al,0x00
0518  0F 84 10 00 00 00                 je              L$49
051E  8A 46 01                          mov             al,byte ptr 0x1[esi]
0521  83 C6 02                          add             esi,0x00000002
0524  88 47 01                          mov             byte ptr 0x1[edi],al
0527  83 C7 02                          add             edi,0x00000002
052A  3C 00                             cmp             al,0x00
052C  75 E4                             jne             L$48
052E                            L$49:
052E  5F                                pop             edi
052F  07                                pop             es
0530  8A 44 24 28                       mov             al,byte ptr 0x28[esp]
0534  88 02                             mov             byte ptr [edx],al
0536  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
053A  8B 14 24                          mov             edx,dword ptr [esp]
053D  29 D8                             sub             eax,ebx
053F  31 F6                             xor             esi,esi
0541  01 D0                             add             eax,edx
0543  EB 07                             jmp             L$51
0545                            L$50:
0545  46                                inc             esi
0546  8A 08                             mov             cl,byte ptr [eax]
0548  40                                inc             eax
0549  88 0A                             mov             byte ptr [edx],cl
054B  42                                inc             edx
054C                            L$51:
054C  39 DE                             cmp             esi,ebx
054E  7E F5                             jle             L$50
0550  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0554  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0558  40                                inc             eax
0559  89 DE                             mov             esi,ebx
055B  29 C7                             sub             edi,eax
055D  89 DD                             mov             ebp,ebx
055F  89 7C 24 20                       mov             dword ptr 0x20[esp],edi
0563  E9 C0 FC FF FF                    jmp             L$13

Routine Size: 947 bytes,    Routine Base: _TEXT + 01B5

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000                            _keyTop:
0000  00 00 00 00                                     ....
0004                            _keyBottom:
0004  00 00 00 00                                     ....
0008                            _shiftState:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000140 bytes
0000                            _pbKeyState:
0100                            _scanList:
0120                            _charList:

BSS Size: 320 bytes

