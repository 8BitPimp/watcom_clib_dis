Module: timeutil
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000474 bytes
0000                            __leapyear:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  F6 C3 03                          test            bl,0x03
0008  75 2B                             jne             L$3
000A  B9 64 00 00 00                    mov             ecx,0x00000064
000F  89 DA                             mov             edx,ebx
0011  89 D8                             mov             eax,ebx
0013  C1 FA 1F                          sar             edx,0x1f
0016  F7 F9                             idiv            ecx
0018  85 D2                             test            edx,edx
001A  74 07                             je              L$2
001C                            L$1:
001C  B8 01 00 00 00                    mov             eax,0x00000001
0021  5B                                pop             ebx
0022  C3                                ret
0023                            L$2:
0023  B9 90 01 00 00                    mov             ecx,0x00000190
0028  89 DA                             mov             edx,ebx
002A  89 D8                             mov             eax,ebx
002C  C1 FA 1F                          sar             edx,0x1f
002F  F7 F9                             idiv            ecx
0031  85 D2                             test            edx,edx
0033  74 E7                             je              L$1
0035                            L$3:
0035  31 C0                             xor             eax,eax
0037  5B                                pop             ebx
0038  C3                                ret
0039                            calc_yday:
0039  53                                push            ebx
003A  56                                push            esi
003B  57                                push            edi
003C  55                                push            ebp
003D  83 EC 24                          sub             esp,0x00000024
0040  8B 5C 24 38                       mov             ebx,dword ptr 0x38[esp]
0044  8B 53 20                          mov             edx,dword ptr 0x20[ebx]
0047  85 D2                             test            edx,edx
0049  0F 85 C4 00 00 00                 jne             L$9
004F  8B 44 24 3C                       mov             eax,dword ptr 0x3c[esp]
0053  05 6C 07 00 00                    add             eax,0x0000076c
0058  50                                push            eax
0059  E8 00 00 00 00                    call            __leapyear
005E  83 C4 04                          add             esp,0x00000004
0061  85 C0                             test            eax,eax
0063  74 13                             je              L$4
0065  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0068  8B 34 45 00 00 00 00              mov             esi,dword ptr __dilyr[eax*2]
006F  8B 04 45 FE FF FF FF              mov             eax,dword ptr __dilyr-0x2[eax*2]
0076  EB 11                             jmp             L$5
0078                            L$4:
0078  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
007B  8B 34 45 00 00 00 00              mov             esi,dword ptr __diyr[eax*2]
0082  8B 04 45 FE FF FF FF              mov             eax,dword ptr __diyr-0x2[eax*2]
0089                            L$5:
0089  C1 FE 10                          sar             esi,0x10
008C  C1 F8 10                          sar             eax,0x10
008F  29 C6                             sub             esi,eax
0091  31 FF                             xor             edi,edi
0093  BA 01 00 00 00                    mov             edx,0x00000001
0098  89 3C 24                          mov             dword ptr [esp],edi
009B  89 7C 24 04                       mov             dword ptr 0x4[esp],edi
009F  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
00A3  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
00A7  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
00AA  89 44 24 10                       mov             dword ptr 0x10[esp],eax
00AE  8B 44 24 3C                       mov             eax,dword ptr 0x3c[esp]
00B2  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00B6  89 E0                             mov             eax,esp
00B8  50                                push            eax
00B9  89 7C 24 24                       mov             dword ptr 0x24[esp],edi
00BD  E8 00 00 00 00                    call            mktime
00C2  83 C4 04                          add             esp,0x00000004
00C5  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
00C8  2B 54 24 18                       sub             edx,dword ptr 0x18[esp]
00CC  83 C2 07                          add             edx,0x00000007
00CF  B9 07 00 00 00                    mov             ecx,0x00000007
00D4  89 D0                             mov             eax,edx
00D6  C1 FA 1F                          sar             edx,0x1f
00D9  F7 F9                             idiv            ecx
00DB  8B 6B 0C                          mov             ebp,dword ptr 0xc[ebx]
00DE  83 FD 05                          cmp             ebp,0x00000005
00E1  75 1C                             jne             L$7
00E3  8D 4D FF                          lea             ecx,-0x1[ebp]
00E6  89 CF                             mov             edi,ecx
00E8  C1 E7 03                          shl             edi,0x03
00EB  8D 42 01                          lea             eax,0x1[edx]
00EE  29 CF                             sub             edi,ecx
00F0  01 F8                             add             eax,edi
00F2  39 F0                             cmp             eax,esi
00F4  7E 05                             jle             L$6
00F6  8D 45 FE                          lea             eax,-0x2[ebp]
00F9  EB 07                             jmp             L$8
00FB                            L$6:
00FB  89 C8                             mov             eax,ecx
00FD  EB 03                             jmp             L$8
00FF                            L$7:
00FF  8D 45 FF                          lea             eax,-0x1[ebp]
0102                            L$8:
0102  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
0106  01 D3                             add             ebx,edx
0108  89 C2                             mov             edx,eax
010A  C1 E0 03                          shl             eax,0x03
010D  29 D0                             sub             eax,edx
010F  01 D8                             add             eax,ebx
0111  EB 0F                             jmp             L$11
0113                            L$9:
0113  83 FA 01                          cmp             edx,0x00000001
0116  75 07                             jne             L$10
0118  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
011B  29 D0                             sub             eax,edx
011D  EB 03                             jmp             L$11
011F                            L$10:
011F  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
0122                            L$11:
0122  83 C4 24                          add             esp,0x00000024
0125  5D                                pop             ebp
0126  5F                                pop             edi
0127  5E                                pop             esi
0128  5B                                pop             ebx
0129  C3                                ret
012A                            check_order:
012A  53                                push            ebx
012B  56                                push            esi
012C  57                                push            edi
012D  55                                push            ebp
012E  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0132  52                                push            edx
0133  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0137  51                                push            ecx
0138  E8 00 00 00 00                    call            calc_yday
013D  83 C4 08                          add             esp,0x00000008
0140  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
0144  57                                push            edi
0145  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
0149  55                                push            ebp
014A  31 DB                             xor             ebx,ebx
014C  89 C6                             mov             esi,eax
014E  E8 00 00 00 00                    call            calc_yday
0153  83 C4 08                          add             esp,0x00000008
0156  39 C6                             cmp             esi,eax
0158  7E 05                             jle             L$12
015A  BB 01 00 00 00                    mov             ebx,0x00000001
015F                            L$12:
015F  89 D8                             mov             eax,ebx
0161  5D                                pop             ebp
0162  5F                                pop             edi
0163  5E                                pop             esi
0164  5B                                pop             ebx
0165  C3                                ret

Routine Size: 358 bytes,    Routine Base: _TEXT + 0000

0166                            __isindst:
0166  53                                push            ebx
0167  56                                push            esi
0168  57                                push            edi
0169  55                                push            ebp
016A  83 EC 1C                          sub             esp,0x0000001c
016D  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
0171  A1 04 00 00 00                    mov             eax,dword ptr tzname+0x4
0176  8A 10                             mov             dl,byte ptr [eax]
0178  31 ED                             xor             ebp,ebp
017A  84 D2                             test            dl,dl
017C  0F 84 AF 02 00 00                 je              L$36
0182  8B 53 14                          mov             edx,dword ptr 0x14[ebx]
0185  52                                push            edx
0186  68 00 00 00 00                    push            offset __end_dst
018B  68 00 00 00 00                    push            offset __start_dst
0190  E8 00 00 00 00                    call            check_order
0195  83 C4 0C                          add             esp,0x0000000c
0198  89 44 24 08                       mov             dword ptr 0x8[esp],eax
019C  85 C0                             test            eax,eax
019E  74 0C                             je              L$13
01A0  BF 00 00 00 00                    mov             edi,offset __end_dst
01A5  BE 00 00 00 00                    mov             esi,offset __start_dst
01AA  EB 0A                             jmp             L$14
01AC                            L$13:
01AC  BF 00 00 00 00                    mov             edi,offset __start_dst
01B1  BE 00 00 00 00                    mov             esi,offset __end_dst
01B6                            L$14:
01B6  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
01B9  89 44 24 14                       mov             dword ptr 0x14[esp],eax
01BD  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
01C0  05 6C 07 00 00                    add             eax,0x0000076c
01C5  50                                push            eax
01C6  E8 00 00 00 00                    call            __leapyear
01CB  83 C4 04                          add             esp,0x00000004
01CE  89 C2                             mov             edx,eax
01D0  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
01D4  01 C0                             add             eax,eax
01D6  85 D2                             test            edx,edx
01D8  74 0E                             je              L$15
01DA  8B 90 00 00 00 00                 mov             edx,dword ptr __dilyr[eax]
01E0  8B 80 FE FF FF FF                 mov             eax,dword ptr __dilyr-0x2[eax]
01E6  EB 0C                             jmp             L$16
01E8                            L$15:
01E8  8B 90 00 00 00 00                 mov             edx,dword ptr __diyr[eax]
01EE  8B 80 FE FF FF FF                 mov             eax,dword ptr __diyr-0x2[eax]
01F4                            L$16:
01F4  C1 FA 10                          sar             edx,0x10
01F7  C1 F8 10                          sar             eax,0x10
01FA  29 C2                             sub             edx,eax
01FC  89 54 24 04                       mov             dword ptr 0x4[esp],edx
0200  31 C9                             xor             ecx,ecx
0202  8B 47 20                          mov             eax,dword ptr 0x20[edi]
0205  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
0209  85 C0                             test            eax,eax
020B  0F 85 A0 00 00 00                 jne             L$19
0211  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0215  8B 57 10                          mov             edx,dword ptr 0x10[edi]
0218  39 D0                             cmp             eax,edx
021A  7E 0A                             jle             L$17
021C  BD 01 00 00 00                    mov             ebp,0x00000001
0221  E9 E0 00 00 00                    jmp             L$23
0226                            L$17:
0226  0F 85 DA 00 00 00                 jne             L$23
022C  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
022F  8B 47 18                          mov             eax,dword ptr 0x18[edi]
0232  83 C2 07                          add             edx,0x00000007
0235  29 C2                             sub             edx,eax
0237  B9 07 00 00 00                    mov             ecx,0x00000007
023C  89 D0                             mov             eax,edx
023E  C1 FA 1F                          sar             edx,0x1f
0241  F7 F9                             idiv            ecx
0243  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0246  29 D0                             sub             eax,edx
0248  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
024B  8B 4F 18                          mov             ecx,dword ptr 0x18[edi]
024E  83 C2 06                          add             edx,0x00000006
0251  89 04 24                          mov             dword ptr [esp],eax
0254  29 CA                             sub             edx,ecx
0256  B9 07 00 00 00                    mov             ecx,0x00000007
025B  89 D0                             mov             eax,edx
025D  C1 FA 1F                          sar             edx,0x1f
0260  F7 F9                             idiv            ecx
0262  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
0265  49                                dec             ecx
0266  8B 47 0C                          mov             eax,dword ptr 0xc[edi]
0269  29 D1                             sub             ecx,edx
026B  83 F8 05                          cmp             eax,0x00000005
026E  75 24                             jne             L$18
0270  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0274  8B 14 24                          mov             edx,dword ptr [esp]
0277  83 E8 07                          sub             eax,0x00000007
027A  39 D0                             cmp             eax,edx
027C  0F 8D 84 00 00 00                 jge             L$23
0282  BD 01 00 00 00                    mov             ebp,0x00000001
0287  39 C1                             cmp             ecx,eax
0289  0F 8F 77 00 00 00                 jg              L$23
028F  E9 6E 00 00 00                    jmp             L$22
0294                            L$18:
0294  8D 50 FF                          lea             edx,-0x1[eax]
0297  89 D0                             mov             eax,edx
0299  C1 E0 03                          shl             eax,0x03
029C  29 D0                             sub             eax,edx
029E  8B 14 24                          mov             edx,dword ptr [esp]
02A1  40                                inc             eax
02A2  39 D0                             cmp             eax,edx
02A4  7F 60                             jg              L$23
02A6  BD 01 00 00 00                    mov             ebp,0x00000001
02AB  39 C1                             cmp             ecx,eax
02AD  7D 57                             jge             L$23
02AF  EB 51                             jmp             L$22
02B1                            L$19:
02B1  8B 47 1C                          mov             eax,dword ptr 0x1c[edi]
02B4  8B 57 20                          mov             edx,dword ptr 0x20[edi]
02B7  89 44 24 18                       mov             dword ptr 0x18[esp],eax
02BB  83 FA 01                          cmp             edx,0x00000001
02BE  75 30                             jne             L$21
02C0  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02C3  05 6C 07 00 00                    add             eax,0x0000076c
02C8  50                                push            eax
02C9  E8 00 00 00 00                    call            __leapyear
02CE  83 C4 04                          add             esp,0x00000004
02D1  85 C0                             test            eax,eax
02D3  74 17                             je              L$20
02D5  A1 02 00 00 00                    mov             eax,dword ptr __diyr+0x2
02DA  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
02DE  C1 F8 10                          sar             eax,0x10
02E1  39 C8                             cmp             eax,ecx
02E3  7D 07                             jge             L$20
02E5  8D 41 01                          lea             eax,0x1[ecx]
02E8  89 44 24 18                       mov             dword ptr 0x18[esp],eax
02EC                            L$20:
02EC  FF 4C 24 18                       dec             dword ptr 0x18[esp]
02F0                            L$21:
02F0  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
02F4  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
02F7  39 C8                             cmp             eax,ecx
02F9  7C 0B                             jl              L$23
02FB  BD 01 00 00 00                    mov             ebp,0x00000001
0300  75 04                             jne             L$23
0302                            L$22:
0302  89 6C 24 0C                       mov             dword ptr 0xc[esp],ebp
0306                            L$23:
0306  83 7C 24 0C 00                    cmp             dword ptr 0xc[esp],0x00000000
030B  74 17                             je              L$24
030D  57                                push            edi
030E  53                                push            ebx
030F  E8 00 00 00 00                    call            time_less
0314  83 C4 08                          add             esp,0x00000008
0317  85 C0                             test            eax,eax
0319  0F 94 C0                          sete            al
031C  89 C5                             mov             ebp,eax
031E  81 E5 FF 00 00 00                 and             ebp,0x000000ff
0324                            L$24:
0324  85 ED                             test            ebp,ebp
0326  75 13                             jne             L$25
0328  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
032C  85 C9                             test            ecx,ecx
032E  0F 84 FD 00 00 00                 je              L$36
0334  89 CD                             mov             ebp,ecx
0336  E9 F6 00 00 00                    jmp             L$36
033B                            L$25:
033B  31 D2                             xor             edx,edx
033D  8B 4E 20                          mov             ecx,dword ptr 0x20[esi]
0340  89 54 24 10                       mov             dword ptr 0x10[esp],edx
0344  85 C9                             test            ecx,ecx
0346  0F 85 84 00 00 00                 jne             L$30
034C  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0350  8B 56 10                          mov             edx,dword ptr 0x10[esi]
0353  39 D0                             cmp             eax,edx
0355  7E 07                             jle             L$26
0357  31 ED                             xor             ebp,ebp
0359  E9 B2 00 00 00                    jmp             L$34
035E                            L$26:
035E  0F 85 AC 00 00 00                 jne             L$34
0364  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
0367  8B 7E 18                          mov             edi,dword ptr 0x18[esi]
036A  83 C2 07                          add             edx,0x00000007
036D  29 FA                             sub             edx,edi
036F  B9 07 00 00 00                    mov             ecx,0x00000007
0374  89 D0                             mov             eax,edx
0376  C1 FA 1F                          sar             edx,0x1f
0379  F7 F9                             idiv            ecx
037B  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
037E  29 D7                             sub             edi,edx
0380  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
0383  8B 46 18                          mov             eax,dword ptr 0x18[esi]
0386  83 C2 06                          add             edx,0x00000006
0389  29 C2                             sub             edx,eax
038B  89 D0                             mov             eax,edx
038D  C1 FA 1F                          sar             edx,0x1f
0390  F7 F9                             idiv            ecx
0392  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
0395  49                                dec             ecx
0396  29 D1                             sub             ecx,edx
0398  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
039B  31 ED                             xor             ebp,ebp
039D  83 FA 05                          cmp             edx,0x00000005
03A0  75 1B                             jne             L$29
03A2  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
03A6  83 E8 07                          sub             eax,0x00000007
03A9  39 C7                             cmp             edi,eax
03AB  7F 0A                             jg              L$28
03AD                            L$27:
03AD  BD 01 00 00 00                    mov             ebp,0x00000001
03B2  E9 59 00 00 00                    jmp             L$34
03B7                            L$28:
03B7  39 C1                             cmp             ecx,eax
03B9  7F 55                             jg              L$34
03BB  EB 4B                             jmp             L$33
03BD                            L$29:
03BD  4A                                dec             edx
03BE  89 D0                             mov             eax,edx
03C0  C1 E0 03                          shl             eax,0x03
03C3  29 D0                             sub             eax,edx
03C5  40                                inc             eax
03C6  39 C7                             cmp             edi,eax
03C8  7C E3                             jl              L$27
03CA  39 C1                             cmp             ecx,eax
03CC  7D 42                             jge             L$34
03CE  EB 38                             jmp             L$33
03D0                            L$30:
03D0  8B 7E 1C                          mov             edi,dword ptr 0x1c[esi]
03D3  83 F9 01                          cmp             ecx,0x00000001
03D6  75 23                             jne             L$32
03D8  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
03DB  05 6C 07 00 00                    add             eax,0x0000076c
03E0  50                                push            eax
03E1  E8 00 00 00 00                    call            __leapyear
03E6  83 C4 04                          add             esp,0x00000004
03E9  85 C0                             test            eax,eax
03EB  74 0D                             je              L$31
03ED  A1 02 00 00 00                    mov             eax,dword ptr __diyr+0x2
03F2  C1 F8 10                          sar             eax,0x10
03F5  39 C7                             cmp             edi,eax
03F7  7E 01                             jle             L$31
03F9  47                                inc             edi
03FA                            L$31:
03FA  4F                                dec             edi
03FB                            L$32:
03FB  8B 53 1C                          mov             edx,dword ptr 0x1c[ebx]
03FE  39 D7                             cmp             edi,edx
0400  7F 0E                             jg              L$34
0402  31 ED                             xor             ebp,ebp
0404  39 D7                             cmp             edi,edx
0406  75 08                             jne             L$34
0408                            L$33:
0408  C7 44 24 10 01 00 00 00           mov             dword ptr 0x10[esp],0x00000001
0410                            L$34:
0410  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0415  74 0C                             je              L$35
0417  56                                push            esi
0418  53                                push            ebx
0419  E8 00 00 00 00                    call            time_less
041E  83 C4 08                          add             esp,0x00000008
0421  89 C5                             mov             ebp,eax
0423                            L$35:
0423  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0427  85 D2                             test            edx,edx
0429  74 06                             je              L$36
042B  89 D0                             mov             eax,edx
042D  29 E8                             sub             eax,ebp
042F  89 C5                             mov             ebp,eax
0431                            L$36:
0431  89 E8                             mov             eax,ebp
0433  89 6B 20                          mov             dword ptr 0x20[ebx],ebp
0436  83 C4 1C                          add             esp,0x0000001c
0439  5D                                pop             ebp
043A  5F                                pop             edi
043B  5E                                pop             esi
043C  5B                                pop             ebx
043D  C3                                ret
043E                            time_less:
043E  53                                push            ebx
043F  56                                push            esi
0440  55                                push            ebp
0441  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0445  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0449  8B 4A 08                          mov             ecx,dword ptr 0x8[edx]
044C  8B 70 08                          mov             esi,dword ptr 0x8[eax]
044F  31 DB                             xor             ebx,ebx
0451  39 F1                             cmp             ecx,esi
0453  7C 14                             jl              L$37
0455  75 17                             jne             L$38
0457  8B 4A 04                          mov             ecx,dword ptr 0x4[edx]
045A  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
045D  39 E9                             cmp             ecx,ebp
045F  7C 08                             jl              L$37
0461  75 0B                             jne             L$38
0463  8B 12                             mov             edx,dword ptr [edx]
0465  3B 10                             cmp             edx,dword ptr [eax]
0467  7D 05                             jge             L$38
0469                            L$37:
0469  BB 01 00 00 00                    mov             ebx,0x00000001
046E                            L$38:
046E  89 D8                             mov             eax,ebx
0470  5D                                pop             ebp
0471  5E                                pop             esi
0472  5B                                pop             ebx
0473  C3                                ret

Routine Size: 782 bytes,    Routine Base: _TEXT + 0166

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000034 bytes
0000                            __diyr:
0000  00 00 1F 00 3B 00 5A 00 78 00 97 00 B5 00 D4 00 ....;.Z.x.......
0010  F3 00 11 01 30 01 4E 01 6D 01                   ....0.N.m.
001A                            __dilyr:
001A  00 00 1F 00 3C 00 5B 00 79 00 98 00 B6 00 D5 00 ....<.[.y.......
002A  F4 00 12 01 31 01 4F 01 6E 01                   ....1.O.n.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

