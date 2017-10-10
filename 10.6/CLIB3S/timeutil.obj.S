Module: timeutil
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000480 bytes
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
012D  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0131  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0135  8B 70 10                          mov             esi,dword ptr 0x10[eax]
0138  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
013B  39 D6                             cmp             esi,edx
013D  7E 09                             jle             L$13
013F                            L$12:
013F  B8 01 00 00 00                    mov             eax,0x00000001
0144  5F                                pop             edi
0145  5E                                pop             esi
0146  5B                                pop             ebx
0147  C3                                ret
0148                            L$13:
0148  7C 22                             jl              L$14
014A  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
014E  56                                push            esi
014F  50                                push            eax
0150  E8 00 00 00 00                    call            calc_yday
0155  83 C4 08                          add             esp,0x00000008
0158  8B 7C 24 18                       mov             edi,dword ptr 0x18[esp]
015C  57                                push            edi
015D  53                                push            ebx
015E  89 C6                             mov             esi,eax
0160  E8 00 00 00 00                    call            calc_yday
0165  83 C4 08                          add             esp,0x00000008
0168  39 C6                             cmp             esi,eax
016A  7F D3                             jg              L$12
016C                            L$14:
016C  31 C0                             xor             eax,eax
016E  5F                                pop             edi
016F  5E                                pop             esi
0170  5B                                pop             ebx
0171  C3                                ret

Routine Size: 370 bytes,    Routine Base: _TEXT + 0000

0172                            __isindst:
0172  53                                push            ebx
0173  56                                push            esi
0174  57                                push            edi
0175  55                                push            ebp
0176  83 EC 1C                          sub             esp,0x0000001c
0179  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
017D  A1 04 00 00 00                    mov             eax,dword ptr tzname+0x4
0182  8A 10                             mov             dl,byte ptr [eax]
0184  31 ED                             xor             ebp,ebp
0186  84 D2                             test            dl,dl
0188  0F 84 AF 02 00 00                 je              L$38
018E  8B 53 14                          mov             edx,dword ptr 0x14[ebx]
0191  52                                push            edx
0192  68 00 00 00 00                    push            offset __end_dst
0197  68 00 00 00 00                    push            offset __start_dst
019C  E8 00 00 00 00                    call            check_order
01A1  83 C4 0C                          add             esp,0x0000000c
01A4  89 44 24 08                       mov             dword ptr 0x8[esp],eax
01A8  85 C0                             test            eax,eax
01AA  74 0C                             je              L$15
01AC  BF 00 00 00 00                    mov             edi,offset __end_dst
01B1  BE 00 00 00 00                    mov             esi,offset __start_dst
01B6  EB 0A                             jmp             L$16
01B8                            L$15:
01B8  BF 00 00 00 00                    mov             edi,offset __start_dst
01BD  BE 00 00 00 00                    mov             esi,offset __end_dst
01C2                            L$16:
01C2  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
01C5  89 44 24 14                       mov             dword ptr 0x14[esp],eax
01C9  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
01CC  05 6C 07 00 00                    add             eax,0x0000076c
01D1  50                                push            eax
01D2  E8 00 00 00 00                    call            __leapyear
01D7  83 C4 04                          add             esp,0x00000004
01DA  89 C2                             mov             edx,eax
01DC  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
01E0  01 C0                             add             eax,eax
01E2  85 D2                             test            edx,edx
01E4  74 0E                             je              L$17
01E6  8B 90 00 00 00 00                 mov             edx,dword ptr __dilyr[eax]
01EC  8B 80 FE FF FF FF                 mov             eax,dword ptr __dilyr-0x2[eax]
01F2  EB 0C                             jmp             L$18
01F4                            L$17:
01F4  8B 90 00 00 00 00                 mov             edx,dword ptr __diyr[eax]
01FA  8B 80 FE FF FF FF                 mov             eax,dword ptr __diyr-0x2[eax]
0200                            L$18:
0200  C1 FA 10                          sar             edx,0x10
0203  C1 F8 10                          sar             eax,0x10
0206  29 C2                             sub             edx,eax
0208  89 54 24 04                       mov             dword ptr 0x4[esp],edx
020C  31 C9                             xor             ecx,ecx
020E  8B 47 20                          mov             eax,dword ptr 0x20[edi]
0211  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
0215  85 C0                             test            eax,eax
0217  0F 85 A0 00 00 00                 jne             L$21
021D  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0221  8B 57 10                          mov             edx,dword ptr 0x10[edi]
0224  39 D0                             cmp             eax,edx
0226  7E 0A                             jle             L$19
0228  BD 01 00 00 00                    mov             ebp,0x00000001
022D  E9 E0 00 00 00                    jmp             L$25
0232                            L$19:
0232  0F 85 DA 00 00 00                 jne             L$25
0238  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
023B  8B 47 18                          mov             eax,dword ptr 0x18[edi]
023E  83 C2 07                          add             edx,0x00000007
0241  29 C2                             sub             edx,eax
0243  B9 07 00 00 00                    mov             ecx,0x00000007
0248  89 D0                             mov             eax,edx
024A  C1 FA 1F                          sar             edx,0x1f
024D  F7 F9                             idiv            ecx
024F  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0252  29 D0                             sub             eax,edx
0254  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
0257  8B 4F 18                          mov             ecx,dword ptr 0x18[edi]
025A  83 C2 06                          add             edx,0x00000006
025D  89 04 24                          mov             dword ptr [esp],eax
0260  29 CA                             sub             edx,ecx
0262  B9 07 00 00 00                    mov             ecx,0x00000007
0267  89 D0                             mov             eax,edx
0269  C1 FA 1F                          sar             edx,0x1f
026C  F7 F9                             idiv            ecx
026E  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
0271  49                                dec             ecx
0272  8B 47 0C                          mov             eax,dword ptr 0xc[edi]
0275  29 D1                             sub             ecx,edx
0277  83 F8 05                          cmp             eax,0x00000005
027A  75 24                             jne             L$20
027C  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0280  8B 14 24                          mov             edx,dword ptr [esp]
0283  83 E8 07                          sub             eax,0x00000007
0286  39 D0                             cmp             eax,edx
0288  0F 8D 84 00 00 00                 jge             L$25
028E  BD 01 00 00 00                    mov             ebp,0x00000001
0293  39 C1                             cmp             ecx,eax
0295  0F 8F 77 00 00 00                 jg              L$25
029B  E9 6E 00 00 00                    jmp             L$24
02A0                            L$20:
02A0  8D 50 FF                          lea             edx,-0x1[eax]
02A3  89 D0                             mov             eax,edx
02A5  C1 E0 03                          shl             eax,0x03
02A8  29 D0                             sub             eax,edx
02AA  8B 14 24                          mov             edx,dword ptr [esp]
02AD  40                                inc             eax
02AE  39 D0                             cmp             eax,edx
02B0  7F 60                             jg              L$25
02B2  BD 01 00 00 00                    mov             ebp,0x00000001
02B7  39 C1                             cmp             ecx,eax
02B9  7D 57                             jge             L$25
02BB  EB 51                             jmp             L$24
02BD                            L$21:
02BD  8B 47 1C                          mov             eax,dword ptr 0x1c[edi]
02C0  8B 57 20                          mov             edx,dword ptr 0x20[edi]
02C3  89 44 24 18                       mov             dword ptr 0x18[esp],eax
02C7  83 FA 01                          cmp             edx,0x00000001
02CA  75 30                             jne             L$23
02CC  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02CF  05 6C 07 00 00                    add             eax,0x0000076c
02D4  50                                push            eax
02D5  E8 00 00 00 00                    call            __leapyear
02DA  83 C4 04                          add             esp,0x00000004
02DD  85 C0                             test            eax,eax
02DF  74 17                             je              L$22
02E1  A1 02 00 00 00                    mov             eax,dword ptr __diyr+0x2
02E6  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
02EA  C1 F8 10                          sar             eax,0x10
02ED  39 C8                             cmp             eax,ecx
02EF  7D 07                             jge             L$22
02F1  8D 41 01                          lea             eax,0x1[ecx]
02F4  89 44 24 18                       mov             dword ptr 0x18[esp],eax
02F8                            L$22:
02F8  FF 4C 24 18                       dec             dword ptr 0x18[esp]
02FC                            L$23:
02FC  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0300  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
0303  39 C8                             cmp             eax,ecx
0305  7C 0B                             jl              L$25
0307  BD 01 00 00 00                    mov             ebp,0x00000001
030C  75 04                             jne             L$25
030E                            L$24:
030E  89 6C 24 0C                       mov             dword ptr 0xc[esp],ebp
0312                            L$25:
0312  83 7C 24 0C 00                    cmp             dword ptr 0xc[esp],0x00000000
0317  74 17                             je              L$26
0319  57                                push            edi
031A  53                                push            ebx
031B  E8 00 00 00 00                    call            time_less
0320  83 C4 08                          add             esp,0x00000008
0323  85 C0                             test            eax,eax
0325  0F 94 C0                          sete            al
0328  89 C5                             mov             ebp,eax
032A  81 E5 FF 00 00 00                 and             ebp,0x000000ff
0330                            L$26:
0330  85 ED                             test            ebp,ebp
0332  75 13                             jne             L$27
0334  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0338  85 C9                             test            ecx,ecx
033A  0F 84 FD 00 00 00                 je              L$38
0340  89 CD                             mov             ebp,ecx
0342  E9 F6 00 00 00                    jmp             L$38
0347                            L$27:
0347  31 D2                             xor             edx,edx
0349  8B 4E 20                          mov             ecx,dword ptr 0x20[esi]
034C  89 54 24 10                       mov             dword ptr 0x10[esp],edx
0350  85 C9                             test            ecx,ecx
0352  0F 85 84 00 00 00                 jne             L$32
0358  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
035C  8B 56 10                          mov             edx,dword ptr 0x10[esi]
035F  39 D0                             cmp             eax,edx
0361  7E 07                             jle             L$28
0363  31 ED                             xor             ebp,ebp
0365  E9 B2 00 00 00                    jmp             L$36
036A                            L$28:
036A  0F 85 AC 00 00 00                 jne             L$36
0370  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
0373  8B 7E 18                          mov             edi,dword ptr 0x18[esi]
0376  83 C2 07                          add             edx,0x00000007
0379  29 FA                             sub             edx,edi
037B  B9 07 00 00 00                    mov             ecx,0x00000007
0380  89 D0                             mov             eax,edx
0382  C1 FA 1F                          sar             edx,0x1f
0385  F7 F9                             idiv            ecx
0387  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
038A  29 D7                             sub             edi,edx
038C  8B 53 18                          mov             edx,dword ptr 0x18[ebx]
038F  8B 46 18                          mov             eax,dword ptr 0x18[esi]
0392  83 C2 06                          add             edx,0x00000006
0395  29 C2                             sub             edx,eax
0397  89 D0                             mov             eax,edx
0399  C1 FA 1F                          sar             edx,0x1f
039C  F7 F9                             idiv            ecx
039E  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
03A1  49                                dec             ecx
03A2  29 D1                             sub             ecx,edx
03A4  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
03A7  31 ED                             xor             ebp,ebp
03A9  83 FA 05                          cmp             edx,0x00000005
03AC  75 1B                             jne             L$31
03AE  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
03B2  83 E8 07                          sub             eax,0x00000007
03B5  39 C7                             cmp             edi,eax
03B7  7F 0A                             jg              L$30
03B9                            L$29:
03B9  BD 01 00 00 00                    mov             ebp,0x00000001
03BE  E9 59 00 00 00                    jmp             L$36
03C3                            L$30:
03C3  39 C1                             cmp             ecx,eax
03C5  7F 55                             jg              L$36
03C7  EB 4B                             jmp             L$35
03C9                            L$31:
03C9  4A                                dec             edx
03CA  89 D0                             mov             eax,edx
03CC  C1 E0 03                          shl             eax,0x03
03CF  29 D0                             sub             eax,edx
03D1  40                                inc             eax
03D2  39 C7                             cmp             edi,eax
03D4  7C E3                             jl              L$29
03D6  39 C1                             cmp             ecx,eax
03D8  7D 42                             jge             L$36
03DA  EB 38                             jmp             L$35
03DC                            L$32:
03DC  8B 7E 1C                          mov             edi,dword ptr 0x1c[esi]
03DF  83 F9 01                          cmp             ecx,0x00000001
03E2  75 23                             jne             L$34
03E4  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
03E7  05 6C 07 00 00                    add             eax,0x0000076c
03EC  50                                push            eax
03ED  E8 00 00 00 00                    call            __leapyear
03F2  83 C4 04                          add             esp,0x00000004
03F5  85 C0                             test            eax,eax
03F7  74 0D                             je              L$33
03F9  A1 02 00 00 00                    mov             eax,dword ptr __diyr+0x2
03FE  C1 F8 10                          sar             eax,0x10
0401  39 C7                             cmp             edi,eax
0403  7E 01                             jle             L$33
0405  47                                inc             edi
0406                            L$33:
0406  4F                                dec             edi
0407                            L$34:
0407  8B 53 1C                          mov             edx,dword ptr 0x1c[ebx]
040A  39 D7                             cmp             edi,edx
040C  7F 0E                             jg              L$36
040E  31 ED                             xor             ebp,ebp
0410  39 D7                             cmp             edi,edx
0412  75 08                             jne             L$36
0414                            L$35:
0414  C7 44 24 10 01 00 00 00           mov             dword ptr 0x10[esp],0x00000001
041C                            L$36:
041C  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0421  74 0C                             je              L$37
0423  56                                push            esi
0424  53                                push            ebx
0425  E8 00 00 00 00                    call            time_less
042A  83 C4 08                          add             esp,0x00000008
042D  89 C5                             mov             ebp,eax
042F                            L$37:
042F  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0433  85 D2                             test            edx,edx
0435  74 06                             je              L$38
0437  89 D0                             mov             eax,edx
0439  29 E8                             sub             eax,ebp
043B  89 C5                             mov             ebp,eax
043D                            L$38:
043D  89 E8                             mov             eax,ebp
043F  89 6B 20                          mov             dword ptr 0x20[ebx],ebp
0442  83 C4 1C                          add             esp,0x0000001c
0445  5D                                pop             ebp
0446  5F                                pop             edi
0447  5E                                pop             esi
0448  5B                                pop             ebx
0449  C3                                ret
044A                            time_less:
044A  53                                push            ebx
044B  56                                push            esi
044C  55                                push            ebp
044D  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0451  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0455  8B 4A 08                          mov             ecx,dword ptr 0x8[edx]
0458  8B 70 08                          mov             esi,dword ptr 0x8[eax]
045B  31 DB                             xor             ebx,ebx
045D  39 F1                             cmp             ecx,esi
045F  7C 14                             jl              L$39
0461  75 17                             jne             L$40
0463  8B 4A 04                          mov             ecx,dword ptr 0x4[edx]
0466  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
0469  39 E9                             cmp             ecx,ebp
046B  7C 08                             jl              L$39
046D  75 0B                             jne             L$40
046F  8B 12                             mov             edx,dword ptr [edx]
0471  3B 10                             cmp             edx,dword ptr [eax]
0473  7D 05                             jge             L$40
0475                            L$39:
0475  BB 01 00 00 00                    mov             ebx,0x00000001
047A                            L$40:
047A  89 D8                             mov             eax,ebx
047C  5D                                pop             ebp
047D  5E                                pop             esi
047E  5B                                pop             ebx
047F  C3                                ret

Routine Size: 782 bytes,    Routine Base: _TEXT + 0172

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

