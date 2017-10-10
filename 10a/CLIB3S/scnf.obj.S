Module: scnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000C48 bytes
0000                            __scnf:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000B  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
000F  8A 66 10                          mov             ah,byte ptr 0x10[esi]
0012  31 D2                             xor             edx,edx
0014  31 ED                             xor             ebp,ebp
0016  80 E4 FD                          and             ah,0xfd
0019  89 14 24                          mov             dword ptr [esp],edx
001C  88 66 10                          mov             byte ptr 0x10[esi],ah
001F                            L$1:
001F  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
0023  8D 4B 01                          lea             ecx,0x1[ebx]
0026  89 4C 24 1C                       mov             dword ptr 0x1c[esp],ecx
002A  8A 1B                             mov             bl,byte ptr [ebx]
002C  81 E3 FF 00 00 00                 and             ebx,0x000000ff
0032  0F 84 C1 01 00 00                 je              L$30
0038  88 D8                             mov             al,bl
003A  FE C0                             inc             al
003C  25 FF 00 00 00                    and             eax,0x000000ff
0041  F6 80 00 00 00 00 02              test            byte ptr _IsTable[eax],0x02
0048  74 10                             je              L$2
004A  56                                push            esi
004B  E8 00 00 00 00                    call            scan_white
0050  83 C4 04                          add             esp,0x00000004
0053  01 C5                             add             ebp,eax
0055  E9 67 01 00 00                    jmp             L$29
005A                            L$2:
005A  83 FB 25                          cmp             ebx,0x00000025
005D  74 25                             je              L$4
005F  56                                push            esi
0060  FF 16                             call            dword ptr [esi]
0062  83 C4 04                          add             esp,0x00000004
0065  39 D8                             cmp             eax,ebx
0067  0F 84 53 01 00 00                 je              L$28
006D                            L$3:
006D  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
0071  0F 85 82 01 00 00                 jne             L$30
0077  56                                push            esi
0078  50                                push            eax
0079  FF 56 04                          call            dword ptr 0x4[esi]
007C  83 C4 08                          add             esp,0x00000008
007F  E9 75 01 00 00                    jmp             L$30
0084                            L$4:
0084  56                                push            esi
0085  51                                push            ecx
0086  E8 00 00 00 00                    call            get_opt
008B  83 C4 08                          add             esp,0x00000008
008E  31 DB                             xor             ebx,ebx
0090  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
0094  8A 18                             mov             bl,byte ptr [eax]
0096  85 DB                             test            ebx,ebx
0098  74 05                             je              L$5
009A  40                                inc             eax
009B  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
009F                            L$5:
009F  83 FB 65                          cmp             ebx,0x00000065
00A2  72 55                             jb              L$9
00A4  83 FB 67                          cmp             ebx,0x00000067
00A7  0F 86 B3 00 00 00                 jbe             L$20
00AD  83 FB 70                          cmp             ebx,0x00000070
00B0  72 2D                             jb              L$7
00B2  0F 86 A2 00 00 00                 jbe             L$19
00B8  83 FB 75                          cmp             ebx,0x00000075
00BB  72 14                             jb              L$6
00BD  0F 86 93 00 00 00                 jbe             L$18
00C3  83 FB 78                          cmp             ebx,0x00000078
00C6  0F 84 8E 00 00 00                 je              L$19
00CC  E9 F0 00 00 00                    jmp             L$29
00D1                            L$6:
00D1  83 FB 73                          cmp             ebx,0x00000073
00D4  0F 84 92 00 00 00                 je              L$22
00DA  E9 E2 00 00 00                    jmp             L$29
00DF                            L$7:
00DF  83 FB 6E                          cmp             ebx,0x0000006e
00E2  72 0B                             jb              L$8
00E4  0F 86 BB 00 00 00                 jbe             L$26
00EA  E9 61 00 00 00                    jmp             L$17
00EF                            L$8:
00EF  83 FB 69                          cmp             ebx,0x00000069
00F2  74 56                             je              L$16
00F4  E9 C8 00 00 00                    jmp             L$29
00F9                            L$9:
00F9  83 FB 58                          cmp             ebx,0x00000058
00FC  72 1D                             jb              L$11
00FE  76 5A                             jbe             L$19
0100  83 FB 63                          cmp             ebx,0x00000063
0103  72 08                             jb              L$10
0105  0F 86 7B 00 00 00                 jbe             L$24
010B  EB 2D                             jmp             L$13
010D                            L$10:
010D  83 FB 5B                          cmp             ebx,0x0000005b
0110  0F 84 5F 00 00 00                 je              L$23
0116  E9 A6 00 00 00                    jmp             L$29
011B                            L$11:
011B  83 FB 45                          cmp             ebx,0x00000045
011E  72 0C                             jb              L$12
0120  76 3E                             jbe             L$20
0122  83 FB 47                          cmp             ebx,0x00000047
0125  74 39                             je              L$20
0127  E9 95 00 00 00                    jmp             L$29
012C                            L$12:
012C  83 FB 25                          cmp             ebx,0x00000025
012F  0F 84 7D 00 00 00                 je              L$27
0135  E9 87 00 00 00                    jmp             L$29
013A                            L$13:
013A  6A 01                             push            0x00000001
013C                            L$14:
013C  6A 0A                             push            0x0000000a
013E                            L$15:
013E  57                                push            edi
013F  56                                push            esi
0140  E8 00 00 00 00                    call            scan_int
0145  83 C4 10                          add             esp,0x00000010
0148  EB 46                             jmp             L$25
014A                            L$16:
014A  6A 01                             push            0x00000001
014C  6A 00                             push            0x00000000
014E  EB EE                             jmp             L$15
0150                            L$17:
0150  6A 01                             push            0x00000001
0152  6A 08                             push            0x00000008
0154  EB E8                             jmp             L$15
0156                            L$18:
0156  6A 00                             push            0x00000000
0158  EB E2                             jmp             L$14
015A                            L$19:
015A  6A 01                             push            0x00000001
015C  6A 10                             push            0x00000010
015E  EB DE                             jmp             L$15
0160                            L$20:
0160  57                                push            edi
0161  56                                push            esi
0162  E8 00 00 00 00                    call            scan_float
0167                            L$21:
0167  83 C4 08                          add             esp,0x00000008
016A  EB 24                             jmp             L$25
016C                            L$22:
016C  57                                push            edi
016D  56                                push            esi
016E  E8 00 00 00 00                    call            scan_string
0173  EB F2                             jmp             L$21
0175                            L$23:
0175  8D 44 24 1C                       lea             eax,0x1c[esp]
0179  50                                push            eax
017A  57                                push            edi
017B  56                                push            esi
017C  E8 00 00 00 00                    call            scan_arb
0181  83 C4 0C                          add             esp,0x0000000c
0184  EB 0A                             jmp             L$25
0186                            L$24:
0186  57                                push            edi
0187  56                                push            esi
0188  E8 00 00 00 00                    call            scan_char
018D  83 C4 08                          add             esp,0x00000008
0190                            L$25:
0190  89 C3                             mov             ebx,eax
0192  85 DB                             test            ebx,ebx
0194  7E 63                             jle             L$30
0196  8A 76 10                          mov             dh,byte ptr 0x10[esi]
0199  01 DD                             add             ebp,ebx
019B  F6 C6 01                          test            dh,0x01
019E  74 21                             je              L$29
01A0  FF 04 24                          inc             dword ptr [esp]
01A3  EB 1C                             jmp             L$29
01A5                            L$26:
01A5  55                                push            ebp
01A6  57                                push            edi
01A7  56                                push            esi
01A8  E8 00 00 00 00                    call            report_scan
01AD  83 C4 0C                          add             esp,0x0000000c
01B0  EB 0F                             jmp             L$29
01B2                            L$27:
01B2  56                                push            esi
01B3  FF 16                             call            dword ptr [esi]
01B5  83 C4 04                          add             esp,0x00000004
01B8  39 D8                             cmp             eax,ebx
01BA  0F 85 AD FE FF FF                 jne             L$3
01C0                            L$28:
01C0  45                                inc             ebp
01C1                            L$29:
01C1  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
01C5  0F 84 54 FE FF FF                 je              L$1
01CB  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
01CF  80 38 25                          cmp             byte ptr [eax],0x25
01D2  75 25                             jne             L$30
01D4  56                                push            esi
01D5  8D 58 01                          lea             ebx,0x1[eax]
01D8  53                                push            ebx
01D9  89 5C 24 24                       mov             dword ptr 0x24[esp],ebx
01DD  E8 00 00 00 00                    call            get_opt
01E2  83 C4 08                          add             esp,0x00000008
01E5  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
01E9  80 38 6E                          cmp             byte ptr [eax],0x6e
01EC  75 0B                             jne             L$30
01EE  55                                push            ebp
01EF  57                                push            edi
01F0  56                                push            esi
01F1  E8 00 00 00 00                    call            report_scan
01F6  83 C4 0C                          add             esp,0x0000000c
01F9                            L$30:
01F9  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
01FD  75 0D                             jne             L$31
01FF  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
0203  74 07                             je              L$31
0205  B8 FF FF FF FF                    mov             eax,0xffffffff
020A  EB 03                             jmp             L$32
020C                            L$31:
020C  8B 04 24                          mov             eax,dword ptr [esp]
020F                            L$32:
020F  83 C4 04                          add             esp,0x00000004
0212  5D                                pop             ebp
0213  5F                                pop             edi
0214  5E                                pop             esi
0215  5B                                pop             ebx
0216  C3                                ret
0217                            get_opt:
0217  53                                push            ebx
0218  56                                push            esi
0219  83 EC 04                          sub             esp,0x00000004
021C  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0220  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0224  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
0227  80 CA 01                          or              dl,0x01
022A  C7 43 0C FF FF FF FF              mov             dword ptr 0xc[ebx],0xffffffff
0231  88 D6                             mov             dh,dl
0233  88 53 10                          mov             byte ptr 0x10[ebx],dl
0236  80 E6 03                          and             dh,0x03
0239  88 73 10                          mov             byte ptr 0x10[ebx],dh
023C  80 38 2A                          cmp             byte ptr [eax],0x2a
023F  75 0A                             jne             L$33
0241  8A 6B 10                          mov             ch,byte ptr 0x10[ebx]
0244  80 E5 FE                          and             ch,0xfe
0247  40                                inc             eax
0248  88 6B 10                          mov             byte ptr 0x10[ebx],ch
024B                            L$33:
024B  31 D2                             xor             edx,edx
024D  8A 10                             mov             dl,byte ptr [eax]
024F  89 14 24                          mov             dword ptr [esp],edx
0252  8A 14 24                          mov             dl,byte ptr [esp]
0255  FE C2                             inc             dl
0257  81 E2 FF 00 00 00                 and             edx,0x000000ff
025D  F6 82 00 00 00 00 20              test            byte ptr _IsTable[edx],0x20
0264  74 28                             je              L$35
0266  31 D2                             xor             edx,edx
0268                            L$34:
0268  6B D2 0A                          imul            edx,0x0000000a
026B  8B 34 24                          mov             esi,dword ptr [esp]
026E  83 EE 30                          sub             esi,0x00000030
0271  40                                inc             eax
0272  01 F2                             add             edx,esi
0274  0F B6 30                          movzx           esi,byte ptr [eax]
0277  89 34 24                          mov             dword ptr [esp],esi
027A  8A 0C 24                          mov             cl,byte ptr [esp]
027D  FE C1                             inc             cl
027F  0F B6 F1                          movzx           esi,cl
0282  F6 86 00 00 00 00 20              test            byte ptr _IsTable[esi],0x20
0289  75 DD                             jne             L$34
028B  89 53 0C                          mov             dword ptr 0xc[ebx],edx
028E                            L$35:
028E  8A 08                             mov             cl,byte ptr [eax]
0290  8D 50 01                          lea             edx,0x1[eax]
0293  80 F9 4E                          cmp             cl,0x4e
0296  75 06                             jne             L$36
0298  80 4B 10 08                       or              byte ptr 0x10[ebx],0x08
029C  EB 09                             jmp             L$37
029E                            L$36:
029E  80 F9 46                          cmp             cl,0x46
02A1  75 06                             jne             L$38
02A3  80 4B 10 04                       or              byte ptr 0x10[ebx],0x04
02A7                            L$37:
02A7  89 D0                             mov             eax,edx
02A9                            L$38:
02A9  8A 08                             mov             cl,byte ptr [eax]
02AB  8D 50 01                          lea             edx,0x1[eax]
02AE  80 F9 68                          cmp             cl,0x68
02B1  72 10                             jb              L$39
02B3  76 15                             jbe             L$40
02B5  80 F9 6C                          cmp             cl,0x6c
02B8  72 34                             jb              L$43
02BA  76 1B                             jbe             L$41
02BC  80 F9 77                          cmp             cl,0x77
02BF  74 16                             je              L$41
02C1  EB 2B                             jmp             L$43
02C3                            L$39:
02C3  80 F9 4C                          cmp             cl,0x4c
02C6  74 1B                             je              L$42
02C8  EB 24                             jmp             L$43
02CA                            L$40:
02CA  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
02CD  80 C9 10                          or              cl,0x10
02D0  89 D0                             mov             eax,edx
02D2  88 4B 10                          mov             byte ptr 0x10[ebx],cl
02D5  EB 17                             jmp             L$43
02D7                            L$41:
02D7  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
02DA  80 CA 20                          or              dl,0x20
02DD  40                                inc             eax
02DE  88 53 10                          mov             byte ptr 0x10[ebx],dl
02E1  EB 0B                             jmp             L$43
02E3                            L$42:
02E3  8A 6B 10                          mov             ch,byte ptr 0x10[ebx]
02E6  80 CD 40                          or              ch,0x40
02E9  89 D0                             mov             eax,edx
02EB  88 6B 10                          mov             byte ptr 0x10[ebx],ch
02EE                            L$43:
02EE  83 C4 04                          add             esp,0x00000004
02F1  5E                                pop             esi
02F2  5B                                pop             ebx
02F3  C3                                ret
02F4                            scan_white:
02F4  53                                push            ebx
02F5  56                                push            esi
02F6  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
02FA  31 F6                             xor             esi,esi
02FC                            L$44:
02FC  53                                push            ebx
02FD  FF 13                             call            dword ptr [ebx]
02FF  89 C2                             mov             edx,eax
0301  83 C4 04                          add             esp,0x00000004
0304  FE C2                             inc             dl
0306  81 E2 FF 00 00 00                 and             edx,0x000000ff
030C  F6 82 00 00 00 00 02              test            byte ptr _IsTable[edx],0x02
0313  74 03                             je              L$45
0315  46                                inc             esi
0316  EB E4                             jmp             L$44
0318                            L$45:
0318  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
031C  75 08                             jne             L$46
031E  53                                push            ebx
031F  50                                push            eax
0320  FF 53 04                          call            dword ptr 0x4[ebx]
0323  83 C4 08                          add             esp,0x00000008
0326                            L$46:
0326  89 F0                             mov             eax,esi
0328  5E                                pop             esi
0329  5B                                pop             ebx
032A  C3                                ret
032B                            scan_char:
032B  53                                push            ebx
032C  56                                push            esi
032D  57                                push            edi
032E  06                                push            es
032F  55                                push            ebp
0330  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0334  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0338  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
033B  F6 C2 01                          test            dl,0x01
033E  74 34                             je              L$49
0340  F6 C2 04                          test            dl,0x04
0343  74 0C                             je              L$47
0345  8B 30                             mov             esi,dword ptr [eax]
0347  83 C6 08                          add             esi,0x00000008
034A  89 30                             mov             dword ptr [eax],esi
034C  C4 76 F8                          les             esi,fword ptr -0x8[esi]
034F  EB 23                             jmp             L$49
0351                            L$47:
0351  F6 C2 08                          test            dl,0x08
0354  74 10                             je              L$48
0356  8B 08                             mov             ecx,dword ptr [eax]
0358  83 C1 04                          add             ecx,0x00000004
035B  89 08                             mov             dword ptr [eax],ecx
035D  8C D8                             mov             eax,ds
035F  8E C0                             mov             es,eax
0361  8B 71 FC                          mov             esi,dword ptr -0x4[ecx]
0364  EB 0E                             jmp             L$49
0366                            L$48:
0366  8B 10                             mov             edx,dword ptr [eax]
0368  83 C2 04                          add             edx,0x00000004
036B  89 10                             mov             dword ptr [eax],edx
036D  8C D8                             mov             eax,ds
036F  8E C0                             mov             es,eax
0371  8B 72 FC                          mov             esi,dword ptr -0x4[edx]
0374                            L$49:
0374  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
0377  31 ED                             xor             ebp,ebp
0379  83 FF FF                          cmp             edi,0xffffffff
037C  75 05                             jne             L$50
037E  BF 01 00 00 00                    mov             edi,0x00000001
0383                            L$50:
0383  85 FF                             test            edi,edi
0385  7E 29                             jle             L$52
0387  53                                push            ebx
0388  FF 13                             call            dword ptr [ebx]
038A  8A 6B 10                          mov             ch,byte ptr 0x10[ebx]
038D  83 C4 04                          add             esp,0x00000004
0390  F6 C5 02                          test            ch,0x02
0393  75 1B                             jne             L$52
0395  45                                inc             ebp
0396  4F                                dec             edi
0397  F6 C5 01                          test            ch,0x01
039A  74 E7                             je              L$50
039C  F6 C5 20                          test            ch,0x20
039F  74 09                             je              L$51
03A1  66 26 89 06                       mov             word ptr es:[esi],ax
03A5  83 C6 02                          add             esi,0x00000002
03A8  EB D9                             jmp             L$50
03AA                            L$51:
03AA  26 88 06                          mov             byte ptr es:[esi],al
03AD  46                                inc             esi
03AE  EB D3                             jmp             L$50
03B0                            L$52:
03B0  89 E8                             mov             eax,ebp
03B2                            L$53:
03B2  5D                                pop             ebp
03B3  07                                pop             es
03B4  5F                                pop             edi
03B5  5E                                pop             esi
03B6  5B                                pop             ebx
03B7  C3                                ret
03B8                            scan_string:
03B8  53                                push            ebx
03B9  56                                push            esi
03BA  57                                push            edi
03BB  06                                push            es
03BC  55                                push            ebp
03BD  83 EC 08                          sub             esp,0x00000008
03C0  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
03C4  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
03C8  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
03CB  F6 C2 20                          test            dl,0x20
03CE  74 07                             je              L$54
03D0  C6 44 24 04 02                    mov             byte ptr 0x4[esp],0x02
03D5  EB 08                             jmp             L$55
03D7                            L$54:
03D7  F6 C2 10                          test            dl,0x10
03DA  C6 44 24 04 01                    mov             byte ptr 0x4[esp],0x01
03DF                            L$55:
03DF  8A 73 10                          mov             dh,byte ptr 0x10[ebx]
03E2  F6 C6 01                          test            dh,0x01
03E5  74 34                             je              L$58
03E7  F6 C6 04                          test            dh,0x04
03EA  74 0C                             je              L$56
03EC  8B 30                             mov             esi,dword ptr [eax]
03EE  83 C6 08                          add             esi,0x00000008
03F1  89 30                             mov             dword ptr [eax],esi
03F3  C4 76 F8                          les             esi,fword ptr -0x8[esi]
03F6  EB 23                             jmp             L$58
03F8                            L$56:
03F8  F6 C6 08                          test            dh,0x08
03FB  74 10                             je              L$57
03FD  8B 08                             mov             ecx,dword ptr [eax]
03FF  83 C1 04                          add             ecx,0x00000004
0402  89 08                             mov             dword ptr [eax],ecx
0404  8C D8                             mov             eax,ds
0406  8E C0                             mov             es,eax
0408  8B 71 FC                          mov             esi,dword ptr -0x4[ecx]
040B  EB 0E                             jmp             L$58
040D                            L$57:
040D  8B 10                             mov             edx,dword ptr [eax]
040F  83 C2 04                          add             edx,0x00000004
0412  89 10                             mov             dword ptr [eax],edx
0414  8C D8                             mov             eax,ds
0416  8E C0                             mov             es,eax
0418  8B 72 FC                          mov             esi,dword ptr -0x4[edx]
041B                            L$58:
041B  31 FF                             xor             edi,edi
041D                            L$59:
041D  53                                push            ebx
041E  FF 13                             call            dword ptr [ebx]
0420  83 C4 04                          add             esp,0x00000004
0423  89 04 24                          mov             dword ptr [esp],eax
0426  8A 04 24                          mov             al,byte ptr [esp]
0429  FE C0                             inc             al
042B  25 FF 00 00 00                    and             eax,0x000000ff
0430  F6 80 00 00 00 00 02              test            byte ptr _IsTable[eax],0x02
0437  74 03                             je              L$60
0439  47                                inc             edi
043A  EB E1                             jmp             L$59
043C                            L$60:
043C  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0440  74 04                             je              L$61
0442  31 FF                             xor             edi,edi
0444  EB 64                             jmp             L$67
0446                            L$61:
0446  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0449  8D 50 FF                          lea             edx,-0x1[eax]
044C  89 53 0C                          mov             dword ptr 0xc[ebx],edx
044F  85 C0                             test            eax,eax
0451  74 4B                             je              L$66
0453                            L$62:
0453  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
0456  47                                inc             edi
0457  F6 C1 01                          test            cl,0x01
045A  74 1E                             je              L$65
045C  80 7C 24 04 01                    cmp             byte ptr 0x4[esp],0x01
0461  75 08                             jne             L$63
0463  8A 04 24                          mov             al,byte ptr [esp]
0466  26 88 06                          mov             byte ptr es:[esi],al
0469  EB 07                             jmp             L$64
046B                            L$63:
046B  8B 04 24                          mov             eax,dword ptr [esp]
046E  66 26 89 06                       mov             word ptr es:[esi],ax
0472                            L$64:
0472  31 C0                             xor             eax,eax
0474  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0478  01 C6                             add             esi,eax
047A                            L$65:
047A  53                                push            ebx
047B  E8 00 00 00 00                    call            cgetw
0480  83 C4 04                          add             esp,0x00000004
0483  89 04 24                          mov             dword ptr [esp],eax
0486  83 F8 FF                          cmp             eax,0xffffffff
0489  74 1F                             je              L$67
048B  8A 04 24                          mov             al,byte ptr [esp]
048E  FE C0                             inc             al
0490  25 FF 00 00 00                    and             eax,0x000000ff
0495  F6 80 00 00 00 00 02              test            byte ptr _IsTable[eax],0x02
049C  74 B5                             je              L$62
049E                            L$66:
049E  53                                push            ebx
049F  8B 6C 24 04                       mov             ebp,dword ptr 0x4[esp]
04A3  55                                push            ebp
04A4  FF 53 04                          call            dword ptr 0x4[ebx]
04A7  83 C4 08                          add             esp,0x00000008
04AA                            L$67:
04AA  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
04AE  74 17                             je              L$69
04B0  85 FF                             test            edi,edi
04B2  7E 13                             jle             L$69
04B4  80 7C 24 04 01                    cmp             byte ptr 0x4[esp],0x01
04B9  75 06                             jne             L$68
04BB  26 C6 06 00                       mov             byte ptr es:[esi],0x00
04BF  EB 06                             jmp             L$69
04C1                            L$68:
04C1  66 26 C7 06 00 00                 mov             word ptr es:[esi],0x0000
04C7                            L$69:
04C7  89 F8                             mov             eax,edi
04C9  83 C4 08                          add             esp,0x00000008
04CC  E9 E1 FE FF FF                    jmp             L$53
04D1                            report_scan:
04D1  53                                push            ebx
04D2  56                                push            esi
04D3  06                                push            es
04D4  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
04D8  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
04DC  8A 5A 10                          mov             bl,byte ptr 0x10[edx]
04DF  F6 C3 01                          test            bl,0x01
04E2  74 54                             je              L$74
04E4  F6 C3 04                          test            bl,0x04
04E7  74 0C                             je              L$70
04E9  8B 30                             mov             esi,dword ptr [eax]
04EB  83 C6 08                          add             esi,0x00000008
04EE  89 30                             mov             dword ptr [eax],esi
04F0  C4 46 F8                          les             eax,fword ptr -0x8[esi]
04F3  EB 25                             jmp             L$72
04F5                            L$70:
04F5  F6 C3 08                          test            bl,0x08
04F8  74 10                             je              L$71
04FA  8B 08                             mov             ecx,dword ptr [eax]
04FC  83 C1 04                          add             ecx,0x00000004
04FF  8C DB                             mov             ebx,ds
0501  89 08                             mov             dword ptr [eax],ecx
0503  8E C3                             mov             es,ebx
0505  8B 41 FC                          mov             eax,dword ptr -0x4[ecx]
0508  EB 10                             jmp             L$72
050A                            L$71:
050A  8B 18                             mov             ebx,dword ptr [eax]
050C  83 C3 04                          add             ebx,0x00000004
050F  89 18                             mov             dword ptr [eax],ebx
0511  89 D8                             mov             eax,ebx
0513  8C DB                             mov             ebx,ds
0515  8E C3                             mov             es,ebx
0517  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
051A                            L$72:
051A  8A 6A 10                          mov             ch,byte ptr 0x10[edx]
051D  F6 C5 10                          test            ch,0x10
0520  74 0C                             je              L$73
0522  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0526  66 26 89 10                       mov             word ptr es:[eax],dx
052A  07                                pop             es
052B  5E                                pop             esi
052C  5B                                pop             ebx
052D  C3                                ret
052E                            L$73:
052E  F6 C5 20                          test            ch,0x20
0531  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0535  26 89 10                          mov             dword ptr es:[eax],edx
0538                            L$74:
0538  07                                pop             es
0539  5E                                pop             esi
053A  5B                                pop             ebx
053B  C3                                ret
053C                            makelist:
053C  53                                push            ebx
053D  56                                push            esi
053E  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0542  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0546  6A 20                             push            0x00000020
0548  6A 00                             push            0x00000000
054A  56                                push            esi
054B  E8 00 00 00 00                    call            memset
0550  31 C0                             xor             eax,eax
0552  83 C4 0C                          add             esp,0x0000000c
0555  8A 03                             mov             al,byte ptr [ebx]
0557  43                                inc             ebx
0558  85 C0                             test            eax,eax
055A  74 1F                             je              L$76
055C                            L$75:
055C  89 C2                             mov             edx,eax
055E  83 E0 07                          and             eax,0x00000007
0561  C1 FA 03                          sar             edx,0x03
0564  8A 80 00 00 00 00                 mov             al,byte ptr lst_mask[eax]
056A  08 04 32                          or              byte ptr [edx+esi],al
056D  31 C0                             xor             eax,eax
056F  8A 03                             mov             al,byte ptr [ebx]
0571  85 C0                             test            eax,eax
0573  74 06                             je              L$76
0575  43                                inc             ebx
0576  83 F8 5D                          cmp             eax,0x0000005d
0579  75 E1                             jne             L$75
057B                            L$76:
057B  89 D8                             mov             eax,ebx
057D  5E                                pop             esi
057E  5B                                pop             ebx
057F  C3                                ret
0580                            scan_arb:
0580  53                                push            ebx
0581  56                                push            esi
0582  57                                push            edi
0583  06                                push            es
0584  55                                push            ebp
0585  83 EC 2C                          sub             esp,0x0000002c
0588  8B 5C 24 44                       mov             ebx,dword ptr 0x44[esp]
058C  8B 7C 24 48                       mov             edi,dword ptr 0x48[esp]
0590  8B 6C 24 4C                       mov             ebp,dword ptr 0x4c[esp]
0594  8B 45 00                          mov             eax,dword ptr [ebp]
0597  80 38 5E                          cmp             byte ptr [eax],0x5e
059A  0F 94 C2                          sete            dl
059D  81 E2 FF 00 00 00                 and             edx,0x000000ff
05A3  89 54 24 24                       mov             dword ptr 0x24[esp],edx
05A7  74 04                             je              L$77
05A9  40                                inc             eax
05AA  89 45 00                          mov             dword ptr [ebp],eax
05AD                            L$77:
05AD  89 E0                             mov             eax,esp
05AF  50                                push            eax
05B0  8B 55 00                          mov             edx,dword ptr [ebp]
05B3  52                                push            edx
05B4  E8 00 00 00 00                    call            makelist
05B9  89 45 00                          mov             dword ptr [ebp],eax
05BC  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
05BF  83 C4 08                          add             esp,0x00000008
05C2  F6 C1 01                          test            cl,0x01
05C5  74 34                             je              L$80
05C7  F6 C1 04                          test            cl,0x04
05CA  74 0C                             je              L$78
05CC  8B 2F                             mov             ebp,dword ptr [edi]
05CE  83 C5 08                          add             ebp,0x00000008
05D1  89 2F                             mov             dword ptr [edi],ebp
05D3  C4 75 F8                          les             esi,fword ptr -0x8[ebp]
05D6  EB 23                             jmp             L$80
05D8                            L$78:
05D8  F6 C1 08                          test            cl,0x08
05DB  74 10                             je              L$79
05DD  8B 37                             mov             esi,dword ptr [edi]
05DF  83 C6 04                          add             esi,0x00000004
05E2  8C D8                             mov             eax,ds
05E4  89 37                             mov             dword ptr [edi],esi
05E6  8E C0                             mov             es,eax
05E8  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
05EB  EB 0E                             jmp             L$80
05ED                            L$79:
05ED  8B 0F                             mov             ecx,dword ptr [edi]
05EF  83 C1 04                          add             ecx,0x00000004
05F2  8C D8                             mov             eax,ds
05F4  89 0F                             mov             dword ptr [edi],ecx
05F6  8E C0                             mov             es,eax
05F8  8B 71 FC                          mov             esi,dword ptr -0x4[ecx]
05FB                            L$80:
05FB  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
05FE  31 ED                             xor             ebp,ebp
0600                            L$81:
0600  85 FF                             test            edi,edi
0602  76 6A                             jbe             L$83
0604  53                                push            ebx
0605  FF 13                             call            dword ptr [ebx]
0607  83 C4 04                          add             esp,0x00000004
060A  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
060D  89 44 24 28                       mov             dword ptr 0x28[esp],eax
0611  F6 C2 02                          test            dl,0x02
0614  75 58                             jne             L$83
0616  89 C2                             mov             edx,eax
0618  C1 FA 03                          sar             edx,0x03
061B  8A 14 14                          mov             dl,byte ptr [esp+edx]
061E  81 E2 FF 00 00 00                 and             edx,0x000000ff
0624  89 54 24 20                       mov             dword ptr 0x20[esp],edx
0628  89 C2                             mov             edx,eax
062A  83 E2 07                          and             edx,0x00000007
062D  8A 92 00 00 00 00                 mov             dl,byte ptr lst_mask[edx]
0633  8B 4C 24 20                       mov             ecx,dword ptr 0x20[esp]
0637  81 E2 FF 00 00 00                 and             edx,0x000000ff
063D  85 CA                             test            edx,ecx
063F  0F 94 C2                          sete            dl
0642  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
0646  81 E2 FF 00 00 00                 and             edx,0x000000ff
064C  39 CA                             cmp             edx,ecx
064E  74 0A                             je              L$82
0650  53                                push            ebx
0651  50                                push            eax
0652  FF 53 04                          call            dword ptr 0x4[ebx]
0655  83 C4 08                          add             esp,0x00000008
0658  EB 14                             jmp             L$83
065A                            L$82:
065A  45                                inc             ebp
065B  8A 73 10                          mov             dh,byte ptr 0x10[ebx]
065E  4F                                dec             edi
065F  F6 C6 01                          test            dh,0x01
0662  74 9C                             je              L$81
0664  8A 44 24 28                       mov             al,byte ptr 0x28[esp]
0668  26 88 06                          mov             byte ptr es:[esi],al
066B  46                                inc             esi
066C  EB 92                             jmp             L$81
066E                            L$83:
066E  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
0672  74 08                             je              L$84
0674  85 ED                             test            ebp,ebp
0676  7E 04                             jle             L$84
0678  26 C6 06 00                       mov             byte ptr es:[esi],0x00
067C                            L$84:
067C  89 E8                             mov             eax,ebp
067E  83 C4 2C                          add             esp,0x0000002c
0681  E9 2C FD FF FF                    jmp             L$53
0686                            scan_float:
0686  53                                push            ebx
0687  56                                push            esi
0688  57                                push            edi
0689  06                                push            es
068A  55                                push            ebp
068B  83 EC 6C                          sub             esp,0x0000006c
068E  8B B4 24 84 00 00 00              mov             esi,dword ptr 0x84[esp]
0695  89 E3                             mov             ebx,esp
0697  31 FF                             xor             edi,edi
0699  31 ED                             xor             ebp,ebp
069B                            L$85:
069B  56                                push            esi
069C  FF 16                             call            dword ptr [esi]
069E  83 C4 04                          add             esp,0x00000004
06A1  89 44 24 60                       mov             dword ptr 0x60[esp],eax
06A5  8A 4C 24 60                       mov             cl,byte ptr 0x60[esp]
06A9  FE C1                             inc             cl
06AB  81 E1 FF 00 00 00                 and             ecx,0x000000ff
06B1  F6 81 00 00 00 00 02              test            byte ptr _IsTable[ecx],0x02
06B8  74 03                             je              L$86
06BA  45                                inc             ebp
06BB  EB DE                             jmp             L$85
06BD                            L$86:
06BD  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
06C1  0F 85 35 02 00 00                 jne             L$105
06C7  8B 4E 0C                          mov             ecx,dword ptr 0xc[esi]
06CA  8D 51 FF                          lea             edx,-0x1[ecx]
06CD  89 56 0C                          mov             dword ptr 0xc[esi],edx
06D0  85 C9                             test            ecx,ecx
06D2  0F 84 18 02 00 00                 je              L$104
06D8  83 F8 2B                          cmp             eax,0x0000002b
06DB  74 05                             je              L$87
06DD  83 F8 2D                          cmp             eax,0x0000002d
06E0  75 1E                             jne             L$88
06E2                            L$87:
06E2  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
06E6  56                                push            esi
06E7  45                                inc             ebp
06E8  88 03                             mov             byte ptr [ebx],al
06EA  E8 00 00 00 00                    call            cgetw
06EF  83 C4 04                          add             esp,0x00000004
06F2  43                                inc             ebx
06F3  89 44 24 60                       mov             dword ptr 0x60[esp],eax
06F7  83 F8 FF                          cmp             eax,0xffffffff
06FA  0F 84 FC 01 00 00                 je              L$105
0700                            L$88:
0700  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
0704  FE C0                             inc             al
0706  25 FF 00 00 00                    and             eax,0x000000ff
070B  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
0712  75 0B                             jne             L$89
0714  83 7C 24 60 2E                    cmp             dword ptr 0x60[esp],0x0000002e
0719  0F 85 D1 01 00 00                 jne             L$104
071F                            L$89:
071F  31 C9                             xor             ecx,ecx
0721  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
0725  89 4C 24 58                       mov             dword ptr 0x58[esp],ecx
0729  89 4C 24 64                       mov             dword ptr 0x64[esp],ecx
072D  FE C0                             inc             al
072F  25 FF 00 00 00                    and             eax,0x000000ff
0734  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
073B  74 52                             je              L$92
073D  C7 44 24 64 01 00 00 00           mov             dword ptr 0x64[esp],0x00000001
0745                            L$90:
0745  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
0749  88 03                             mov             byte ptr [ebx],al
074B  8A 46 10                          mov             al,byte ptr 0x10[esi]
074E  43                                inc             ebx
074F  A8 10                             test            al,0x10
0751  74 11                             je              L$91
0753  6B 44 24 5A 0A                    imul            eax,dword ptr 0x5a[esp],0x0000000a
0758  03 44 24 60                       add             eax,dword ptr 0x60[esp]
075C  83 E8 30                          sub             eax,0x00000030
075F  66 89 44 24 5A                    mov             word ptr 0x5a[esp],ax
0764                            L$91:
0764  56                                push            esi
0765  E8 00 00 00 00                    call            cgetw
076A  83 C4 04                          add             esp,0x00000004
076D  47                                inc             edi
076E  89 44 24 60                       mov             dword ptr 0x60[esp],eax
0772  83 F8 FF                          cmp             eax,0xffffffff
0775  0F 84 81 01 00 00                 je              L$105
077B  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
077F  FE C0                             inc             al
0781  25 FF 00 00 00                    and             eax,0x000000ff
0786  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
078D  75 B6                             jne             L$90
078F                            L$92:
078F  83 7C 24 60 2E                    cmp             dword ptr 0x60[esp],0x0000002e
0794  0F 85 B2 00 00 00                 jne             L$99
079A  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
079E  56                                push            esi
079F  88 03                             mov             byte ptr [ebx],al
07A1  E8 00 00 00 00                    call            cgetw
07A6  83 C4 04                          add             esp,0x00000004
07A9  43                                inc             ebx
07AA  89 44 24 60                       mov             dword ptr 0x60[esp],eax
07AE  83 F8 FF                          cmp             eax,0xffffffff
07B1  0F 84 45 01 00 00                 je              L$105
07B7  83 7C 24 64 00                    cmp             dword ptr 0x64[esp],0x00000000
07BC  75 18                             jne             L$93
07BE  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
07C2  FE C0                             inc             al
07C4  25 FF 00 00 00                    and             eax,0x000000ff
07C9  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
07D0  0F 84 1A 01 00 00                 je              L$104
07D6                            L$93:
07D6  47                                inc             edi
07D7                            L$94:
07D7  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
07DB  FE C0                             inc             al
07DD  25 FF 00 00 00                    and             eax,0x000000ff
07E2  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
07E9  74 1A                             je              L$95
07EB  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
07EF  56                                push            esi
07F0  47                                inc             edi
07F1  88 03                             mov             byte ptr [ebx],al
07F3  E8 00 00 00 00                    call            cgetw
07F8  83 C4 04                          add             esp,0x00000004
07FB  43                                inc             ebx
07FC  89 44 24 60                       mov             dword ptr 0x60[esp],eax
0800  83 F8 FF                          cmp             eax,0xffffffff
0803  75 D2                             jne             L$94
0805                            L$95:
0805  F6 46 10 10                       test            byte ptr 0x10[esi],0x10
0809  74 36                             je              L$98
080B  31 D2                             xor             edx,edx
080D  89 D9                             mov             ecx,ebx
080F  89 54 24 5C                       mov             dword ptr 0x5c[esp],edx
0813                            L$96:
0813  49                                dec             ecx
0814  8A 01                             mov             al,byte ptr [ecx]
0816  3C 2E                             cmp             al,0x2e
0818  74 1E                             je              L$97
081A  2C 30                             sub             al,0x30
081C  C7 44 24 68 0A 00 00 00           mov             dword ptr 0x68[esp],0x0000000a
0824  88 44 24 5E                       mov             byte ptr 0x5e[esp],al
0828  31 D2                             xor             edx,edx
082A  8B 44 24 5C                       mov             eax,dword ptr 0x5c[esp]
082E  F7 74 24 68                       div             dword ptr 0x68[esp]
0832  89 44 24 5C                       mov             dword ptr 0x5c[esp],eax
0836  EB DB                             jmp             L$96
0838                            L$97:
0838  8B 44 24 5C                       mov             eax,dword ptr 0x5c[esp]
083C  66 89 44 24 58                    mov             word ptr 0x58[esp],ax
0841                            L$98:
0841  83 7C 24 60 FF                    cmp             dword ptr 0x60[esp],0xffffffff
0846  0F 84 B0 00 00 00                 je              L$105
084C                            L$99:
084C  F6 46 10 10                       test            byte ptr 0x10[esi],0x10
0850  0F 85 9A 00 00 00                 jne             L$104
0856  8B 44 24 60                       mov             eax,dword ptr 0x60[esp]
085A  83 F8 65                          cmp             eax,0x00000065
085D  74 09                             je              L$100
085F  83 F8 45                          cmp             eax,0x00000045
0862  0F 85 88 00 00 00                 jne             L$104
0868                            L$100:
0868  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
086C  56                                push            esi
086D  47                                inc             edi
086E  88 03                             mov             byte ptr [ebx],al
0870  E8 00 00 00 00                    call            cgetw
0875  83 C4 04                          add             esp,0x00000004
0878  43                                inc             ebx
0879  89 44 24 60                       mov             dword ptr 0x60[esp],eax
087D  83 F8 FF                          cmp             eax,0xffffffff
0880  0F 84 76 00 00 00                 je              L$105
0886  83 F8 2B                          cmp             eax,0x0000002b
0889  74 05                             je              L$101
088B  83 F8 2D                          cmp             eax,0x0000002d
088E  75 1A                             jne             L$102
0890                            L$101:
0890  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
0894  56                                push            esi
0895  47                                inc             edi
0896  88 03                             mov             byte ptr [ebx],al
0898  E8 00 00 00 00                    call            cgetw
089D  83 C4 04                          add             esp,0x00000004
08A0  43                                inc             ebx
08A1  89 44 24 60                       mov             dword ptr 0x60[esp],eax
08A5  83 F8 FF                          cmp             eax,0xffffffff
08A8  74 52                             je              L$105
08AA                            L$102:
08AA  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
08AE  FE C0                             inc             al
08B0  25 FF 00 00 00                    and             eax,0x000000ff
08B5  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
08BC  75 04                             jne             L$103
08BE  31 FF                             xor             edi,edi
08C0  EB 2E                             jmp             L$104
08C2                            L$103:
08C2  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
08C6  56                                push            esi
08C7  47                                inc             edi
08C8  88 03                             mov             byte ptr [ebx],al
08CA  E8 00 00 00 00                    call            cgetw
08CF  83 C4 04                          add             esp,0x00000004
08D2  43                                inc             ebx
08D3  89 44 24 60                       mov             dword ptr 0x60[esp],eax
08D7  83 F8 FF                          cmp             eax,0xffffffff
08DA  74 20                             je              L$105
08DC  8A 44 24 60                       mov             al,byte ptr 0x60[esp]
08E0  FE C0                             inc             al
08E2  25 FF 00 00 00                    and             eax,0x000000ff
08E7  F6 80 00 00 00 00 20              test            byte ptr _IsTable[eax],0x20
08EE  75 D2                             jne             L$103
08F0                            L$104:
08F0  56                                push            esi
08F1  8B 4C 24 64                       mov             ecx,dword ptr 0x64[esp]
08F5  51                                push            ecx
08F6  FF 56 04                          call            dword ptr 0x4[esi]
08F9  83 C4 08                          add             esp,0x00000008
08FC                            L$105:
08FC  85 FF                             test            edi,edi
08FE  0F 8E BB 00 00 00                 jle             L$115
0904  8A 4E 10                          mov             cl,byte ptr 0x10[esi]
0907  01 EF                             add             edi,ebp
0909  F6 C1 01                          test            cl,0x01
090C  0F 84 AD 00 00 00                 je              L$115
0912  C6 03 00                          mov             byte ptr [ebx],0x00
0915  F6 46 10 10                       test            byte ptr 0x10[esi],0x10
0919  74 0C                             je              L$106
091B  80 3C 24 2D                       cmp             byte ptr [esp],0x2d
091F  75 19                             jne             L$107
0921  F7 5C 24 58                       neg             dword ptr 0x58[esp]
0925  EB 13                             jmp             L$107
0927                            L$106:
0927  8D 44 24 50                       lea             eax,0x50[esp]
092B  50                                push            eax
092C  8D 44 24 04                       lea             eax,0x4[esp]
0930  50                                push            eax
0931  FF 15 00 00 00 00                 call            dword ptr __EFG_scanf
0937  83 C4 08                          add             esp,0x00000008
093A                            L$107:
093A  8A 66 10                          mov             ah,byte ptr 0x10[esi]
093D  F6 C4 04                          test            ah,0x04
0940  74 13                             je              L$108
0942  8B 84 24 88 00 00 00              mov             eax,dword ptr 0x88[esp]
0949  8B 08                             mov             ecx,dword ptr [eax]
094B  83 C1 08                          add             ecx,0x00000008
094E  89 08                             mov             dword ptr [eax],ecx
0950  C4 59 F8                          les             ebx,fword ptr -0x8[ecx]
0953  EB 31                             jmp             L$110
0955                            L$108:
0955  F6 C4 08                          test            ah,0x08
0958  74 17                             je              L$109
095A  8B 84 24 88 00 00 00              mov             eax,dword ptr 0x88[esp]
0961  8B 18                             mov             ebx,dword ptr [eax]
0963  83 C3 04                          add             ebx,0x00000004
0966  89 18                             mov             dword ptr [eax],ebx
0968  8C D8                             mov             eax,ds
096A  8E C0                             mov             es,eax
096C  8B 5B FC                          mov             ebx,dword ptr -0x4[ebx]
096F  EB 15                             jmp             L$110
0971                            L$109:
0971  8B 84 24 88 00 00 00              mov             eax,dword ptr 0x88[esp]
0978  8B 10                             mov             edx,dword ptr [eax]
097A  83 C2 04                          add             edx,0x00000004
097D  89 10                             mov             dword ptr [eax],edx
097F  8C D8                             mov             eax,ds
0981  8E C0                             mov             es,eax
0983  8B 5A FC                          mov             ebx,dword ptr -0x4[edx]
0986                            L$110:
0986  8A 76 10                          mov             dh,byte ptr 0x10[esi]
0989  F6 C6 10                          test            dh,0x10
098C  74 06                             je              L$111
098E  8B 44 24 58                       mov             eax,dword ptr 0x58[esp]
0992  EB 28                             jmp             L$114
0994                            L$111:
0994  F6 C6 20                          test            dh,0x20
0997  75 05                             jne             L$112
0999  F6 C6 40                          test            dh,0x40
099C  74 11                             je              L$113
099E                            L$112:
099E  8B 44 24 50                       mov             eax,dword ptr 0x50[esp]
09A2  26 89 03                          mov             dword ptr es:[ebx],eax
09A5  8B 44 24 54                       mov             eax,dword ptr 0x54[esp]
09A9  26 89 43 04                       mov             dword ptr es:0x4[ebx],eax
09AD  EB 10                             jmp             L$115
09AF                            L$113:
09AF  8B 44 24 50                       mov             eax,dword ptr 0x50[esp]
09B3  8B 54 24 54                       mov             edx,dword ptr 0x54[esp]
09B7  E8 00 00 00 00                    call            __FDFS
09BC                            L$114:
09BC  26 89 03                          mov             dword ptr es:[ebx],eax
09BF                            L$115:
09BF  89 F8                             mov             eax,edi
09C1  83 C4 6C                          add             esp,0x0000006c
09C4  E9 E9 F9 FF FF                    jmp             L$53
09C9                            scan_int:
09C9  53                                push            ebx
09CA  56                                push            esi
09CB  57                                push            edi
09CC  06                                push            es
09CD  55                                push            ebp
09CE  83 EC 0C                          sub             esp,0x0000000c
09D1  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
09D5  8B 6C 24 2C                       mov             ebp,dword ptr 0x2c[esp]
09D9  31 FF                             xor             edi,edi
09DB  31 F6                             xor             esi,esi
09DD  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
09E1                            L$116:
09E1  53                                push            ebx
09E2  FF 13                             call            dword ptr [ebx]
09E4  83 C4 04                          add             esp,0x00000004
09E7  89 44 24 04                       mov             dword ptr 0x4[esp],eax
09EB  8A 54 24 04                       mov             dl,byte ptr 0x4[esp]
09EF  FE C2                             inc             dl
09F1  81 E2 FF 00 00 00                 and             edx,0x000000ff
09F7  F6 82 00 00 00 00 02              test            byte ptr _IsTable[edx],0x02
09FE  74 06                             je              L$117
0A00  FF 44 24 08                       inc             dword ptr 0x8[esp]
0A04  EB DB                             jmp             L$116
0A06                            L$117:
0A06  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0A0A  0F 85 6A 01 00 00                 jne             L$130
0A10  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
0A13  8D 4A FF                          lea             ecx,-0x1[edx]
0A16  89 4B 0C                          mov             dword ptr 0xc[ebx],ecx
0A19  85 D2                             test            edx,edx
0A1B  0F 84 4D 01 00 00                 je              L$129
0A21  BA 2B 00 00 00                    mov             edx,0x0000002b
0A26  8B 4C 24 30                       mov             ecx,dword ptr 0x30[esp]
0A2A  89 14 24                          mov             dword ptr [esp],edx
0A2D  85 C9                             test            ecx,ecx
0A2F  74 2F                             je              L$119
0A31  39 D0                             cmp             eax,edx
0A33  74 05                             je              L$118
0A35  83 F8 2D                          cmp             eax,0x0000002d
0A38  75 26                             jne             L$119
0A3A                            L$118:
0A3A  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0A3E  89 04 24                          mov             dword ptr [esp],eax
0A41  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0A45  40                                inc             eax
0A46  53                                push            ebx
0A47  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0A4B  E8 00 00 00 00                    call            cgetw
0A50  83 C4 04                          add             esp,0x00000004
0A53  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0A57  83 F8 FF                          cmp             eax,0xffffffff
0A5A  0F 84 1A 01 00 00                 je              L$130
0A60                            L$119:
0A60  85 ED                             test            ebp,ebp
0A62  75 64                             jne             L$123
0A64  83 7C 24 04 30                    cmp             dword ptr 0x4[esp],0x00000030
0A69  75 56                             jne             L$122
0A6B  53                                push            ebx
0A6C  E8 00 00 00 00                    call            cgetw
0A71  83 C4 04                          add             esp,0x00000004
0A74  BE 01 00 00 00                    mov             esi,0x00000001
0A79  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0A7D  83 F8 FF                          cmp             eax,0xffffffff
0A80  0F 84 F4 00 00 00                 je              L$130
0A86  83 F8 78                          cmp             eax,0x00000078
0A89  74 05                             je              L$120
0A8B  83 F8 58                          cmp             eax,0x00000058
0A8E  75 2A                             jne             L$121
0A90                            L$120:
0A90  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0A94  83 C0 02                          add             eax,0x00000002
0A97  53                                push            ebx
0A98  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0A9C  E8 00 00 00 00                    call            cgetw
0AA1  83 C4 04                          add             esp,0x00000004
0AA4  31 F6                             xor             esi,esi
0AA6  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0AAA  83 F8 FF                          cmp             eax,0xffffffff
0AAD  0F 84 C7 00 00 00                 je              L$130
0AB3  BD 10 00 00 00                    mov             ebp,0x00000010
0AB8  EB 5E                             jmp             L$126
0ABA                            L$121:
0ABA  BD 08 00 00 00                    mov             ebp,0x00000008
0ABF  EB 57                             jmp             L$126
0AC1                            L$122:
0AC1  BD 0A 00 00 00                    mov             ebp,0x0000000a
0AC6  EB 50                             jmp             L$126
0AC8                            L$123:
0AC8  83 FD 10                          cmp             ebp,0x00000010
0ACB  75 4B                             jne             L$126
0ACD  83 7C 24 04 30                    cmp             dword ptr 0x4[esp],0x00000030
0AD2  75 44                             jne             L$126
0AD4  53                                push            ebx
0AD5  E8 00 00 00 00                    call            cgetw
0ADA  83 C4 04                          add             esp,0x00000004
0ADD  BE 01 00 00 00                    mov             esi,0x00000001
0AE2  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0AE6  83 F8 FF                          cmp             eax,0xffffffff
0AE9  0F 84 8B 00 00 00                 je              L$130
0AEF  83 F8 78                          cmp             eax,0x00000078
0AF2  74 05                             je              L$124
0AF4  83 F8 58                          cmp             eax,0x00000058
0AF7  75 1F                             jne             L$126
0AF9                            L$124:
0AF9  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0AFD  83 C1 02                          add             ecx,0x00000002
0B00  53                                push            ebx
0B01  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
0B05  E8 00 00 00 00                    call            cgetw
0B0A  83 C4 04                          add             esp,0x00000004
0B0D  31 F6                             xor             esi,esi
0B0F                            L$125:
0B0F  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0B13  83 F8 FF                          cmp             eax,0xffffffff
0B16  74 62                             je              L$130
0B18                            L$126:
0B18  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0B1C  52                                push            edx
0B1D  E8 00 00 00 00                    call            radix_value
0B22  83 C4 04                          add             esp,0x00000004
0B25  39 E8                             cmp             eax,ebp
0B27  7D 11                             jge             L$127
0B29  0F AF FD                          imul            edi,ebp
0B2C  53                                push            ebx
0B2D  01 C7                             add             edi,eax
0B2F  E8 00 00 00 00                    call            cgetw
0B34  83 C4 04                          add             esp,0x00000004
0B37  46                                inc             esi
0B38  EB D5                             jmp             L$125
0B3A                            L$127:
0B3A  83 7C 24 04 3A                    cmp             dword ptr 0x4[esp],0x0000003a
0B3F  75 2D                             jne             L$129
0B41  F6 43 10 80                       test            byte ptr 0x10[ebx],0x80
0B45  74 27                             je              L$129
0B47                            L$128:
0B47  53                                push            ebx
0B48  E8 00 00 00 00                    call            cgetw
0B4D  83 C4 04                          add             esp,0x00000004
0B50  46                                inc             esi
0B51  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0B55  83 F8 FF                          cmp             eax,0xffffffff
0B58  74 20                             je              L$130
0B5A  50                                push            eax
0B5B  E8 00 00 00 00                    call            radix_value
0B60  83 C4 04                          add             esp,0x00000004
0B63  39 E8                             cmp             eax,ebp
0B65  7D 07                             jge             L$129
0B67  0F AF FD                          imul            edi,ebp
0B6A  01 C7                             add             edi,eax
0B6C  EB D9                             jmp             L$128
0B6E                            L$129:
0B6E  53                                push            ebx
0B6F  8B 6C 24 08                       mov             ebp,dword ptr 0x8[esp]
0B73  55                                push            ebp
0B74  FF 53 04                          call            dword ptr 0x4[ebx]
0B77  83 C4 08                          add             esp,0x00000008
0B7A                            L$130:
0B7A  83 3C 24 2D                       cmp             dword ptr [esp],0x0000002d
0B7E  75 02                             jne             L$131
0B80  F7 DF                             neg             edi
0B82                            L$131:
0B82  85 F6                             test            esi,esi
0B84  7E 62                             jle             L$136
0B86  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0B8A  8A 63 10                          mov             ah,byte ptr 0x10[ebx]
0B8D  01 D6                             add             esi,edx
0B8F  F6 C4 01                          test            ah,0x01
0B92  74 54                             je              L$136
0B94  F6 C4 04                          test            ah,0x04
0B97  74 10                             je              L$132
0B99  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
0B9D  8B 10                             mov             edx,dword ptr [eax]
0B9F  83 C2 08                          add             edx,0x00000008
0BA2  89 10                             mov             dword ptr [eax],edx
0BA4  C4 42 F8                          les             eax,fword ptr -0x8[edx]
0BA7  EB 2B                             jmp             L$134
0BA9                            L$132:
0BA9  F6 C4 08                          test            ah,0x08
0BAC  74 14                             je              L$133
0BAE  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
0BB2  8B 28                             mov             ebp,dword ptr [eax]
0BB4  83 C5 04                          add             ebp,0x00000004
0BB7  8C DA                             mov             edx,ds
0BB9  89 28                             mov             dword ptr [eax],ebp
0BBB  8E C2                             mov             es,edx
0BBD  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0BC0  EB 12                             jmp             L$134
0BC2                            L$133:
0BC2  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
0BC6  8B 08                             mov             ecx,dword ptr [eax]
0BC8  83 C1 04                          add             ecx,0x00000004
0BCB  8C DA                             mov             edx,ds
0BCD  89 08                             mov             dword ptr [eax],ecx
0BCF  8E C2                             mov             es,edx
0BD1  8B 41 FC                          mov             eax,dword ptr -0x4[ecx]
0BD4                            L$134:
0BD4  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
0BD7  F6 C1 10                          test            cl,0x10
0BDA  74 06                             je              L$135
0BDC  66 26 89 38                       mov             word ptr es:[eax],di
0BE0  EB 06                             jmp             L$136
0BE2                            L$135:
0BE2  F6 C1 20                          test            cl,0x20
0BE5  26 89 38                          mov             dword ptr es:[eax],edi
0BE8                            L$136:
0BE8  89 F0                             mov             eax,esi
0BEA  83 C4 0C                          add             esp,0x0000000c
0BED  E9 C0 F7 FF FF                    jmp             L$53
0BF2                            radix_value:
0BF2  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0BF6  83 F8 30                          cmp             eax,0x00000030
0BF9  7C 09                             jl              L$137
0BFB  83 F8 39                          cmp             eax,0x00000039
0BFE  7F 04                             jg              L$137
0C00  83 E8 30                          sub             eax,0x00000030
0C03  C3                                ret
0C04                            L$137:
0C04  50                                push            eax
0C05  E8 00 00 00 00                    call            tolower
0C0A  83 C4 04                          add             esp,0x00000004
0C0D  83 F8 61                          cmp             eax,0x00000061
0C10  7C 09                             jl              L$138
0C12  83 F8 66                          cmp             eax,0x00000066
0C15  7F 04                             jg              L$138
0C17  83 E8 57                          sub             eax,0x00000057
0C1A  C3                                ret
0C1B                            L$138:
0C1B  B8 10 00 00 00                    mov             eax,0x00000010
0C20  C3                                ret
0C21                            cgetw:
0C21  53                                push            ebx
0C22  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0C26  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0C29  8D 50 FF                          lea             edx,-0x1[eax]
0C2C  89 53 0C                          mov             dword ptr 0xc[ebx],edx
0C2F  85 C0                             test            eax,eax
0C31  74 0E                             je              L$139
0C33  53                                push            ebx
0C34  FF 13                             call            dword ptr [ebx]
0C36  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
0C39  83 C4 04                          add             esp,0x00000004
0C3C  F6 C2 02                          test            dl,0x02
0C3F  74 05                             je              L$140
0C41                            L$139:
0C41  B8 FF FF FF FF                    mov             eax,0xffffffff
0C46                            L$140:
0C46  5B                                pop             ebx
0C47  C3                                ret

Routine Size: 3144 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000                            lst_mask:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

