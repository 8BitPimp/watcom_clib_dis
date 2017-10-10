Module: uscnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000B1E bytes
0000                            cget:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006  50                                push            eax
0007  FF 10                             call            dword ptr [eax]
0009  83 C4 04                          add             esp,0x00000004
000C  5D                                pop             ebp
000D  C3                                ret
000E                            uncget:
000E  55                                push            ebp
000F  89 E5                             mov             ebp,esp
0011  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0014  50                                push            eax
0015  FF 75 08                          push            dword ptr 0x8[ebp]
0018  FF 50 04                          call            dword ptr 0x4[eax]
001B  83 C4 08                          add             esp,0x00000008
001E  5D                                pop             ebp
001F  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020                            __uscnf:
0020  53                                push            ebx
0021  56                                push            esi
0022  57                                push            edi
0023  C8 08 00 00                       enter           0x0008,0x00
0027  8B 5D 14                          mov             ebx,dword ptr 0x14[ebp]
002A  8B 7D 1C                          mov             edi,dword ptr 0x1c[ebp]
002D  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
0034  31 F6                             xor             esi,esi
0036  80 63 10 FD                       and             byte ptr 0x10[ebx],0xfd
003A                            L$1:
003A  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
003D  83 45 18 02                       add             dword ptr 0x18[ebp],0x00000002
0041  0F B7 00                          movzx           eax,word ptr [eax]
0044  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0047  85 C0                             test            eax,eax
0049  0F 84 C0 01 00 00                 je              L$30
004F  50                                push            eax
0050  E8 00 00 00 00                    call            _uisspace
0055  83 C4 04                          add             esp,0x00000004
0058  85 C0                             test            eax,eax
005A  74 10                             je              L$2
005C  53                                push            ebx
005D  E8 00 00 00 00                    call            scan_white
0062  83 C4 04                          add             esp,0x00000004
0065  01 C6                             add             esi,eax
0067  E9 68 01 00 00                    jmp             L$29
006C                            L$2:
006C  83 7D FC 25                       cmp             dword ptr -0x4[ebp],0x00000025
0070  74 2B                             je              L$4
0072  53                                push            ebx
0073  E8 00 00 00 00                    call            cget
0078  83 C4 04                          add             esp,0x00000004
007B  3B 45 FC                          cmp             eax,dword ptr -0x4[ebp]
007E  0F 84 4F 01 00 00                 je              L$28
0084                            L$3:
0084  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0088  0F 85 81 01 00 00                 jne             L$30
008E  53                                push            ebx
008F  50                                push            eax
0090  E8 00 00 00 00                    call            uncget
0095  83 C4 08                          add             esp,0x00000008
0098  E9 72 01 00 00                    jmp             L$30
009D                            L$4:
009D  53                                push            ebx
009E  FF 75 18                          push            dword ptr 0x18[ebp]
00A1  E8 00 00 00 00                    call            get_opt
00A6  89 45 18                          mov             dword ptr 0x18[ebp],eax
00A9  89 C2                             mov             edx,eax
00AB  0F B7 00                          movzx           eax,word ptr [eax]
00AE  83 C4 08                          add             esp,0x00000008
00B1  85 C0                             test            eax,eax
00B3  74 05                             je              L$5
00B5  42                                inc             edx
00B6  42                                inc             edx
00B7  89 55 18                          mov             dword ptr 0x18[ebp],edx
00BA                            L$5:
00BA  83 F8 65                          cmp             eax,0x00000065
00BD  72 55                             jb              L$9
00BF  83 F8 67                          cmp             eax,0x00000067
00C2  0F 86 AF 00 00 00                 jbe             L$20
00C8  83 F8 70                          cmp             eax,0x00000070
00CB  72 2D                             jb              L$7
00CD  0F 86 9E 00 00 00                 jbe             L$19
00D3  83 F8 75                          cmp             eax,0x00000075
00D6  72 14                             jb              L$6
00D8  0F 86 8F 00 00 00                 jbe             L$18
00DE  83 F8 78                          cmp             eax,0x00000078
00E1  0F 84 8A 00 00 00                 je              L$19
00E7  E9 E8 00 00 00                    jmp             L$29
00EC                            L$6:
00EC  83 F8 73                          cmp             eax,0x00000073
00EF  0F 84 8B 00 00 00                 je              L$21
00F5  E9 DA 00 00 00                    jmp             L$29
00FA                            L$7:
00FA  83 F8 6E                          cmp             eax,0x0000006e
00FD  72 0B                             jb              L$8
00FF  0F 86 AF 00 00 00                 jbe             L$26
0105  E9 5D 00 00 00                    jmp             L$17
010A                            L$8:
010A  83 F8 69                          cmp             eax,0x00000069
010D  74 52                             je              L$16
010F  E9 C0 00 00 00                    jmp             L$29
0114                            L$9:
0114  83 F8 58                          cmp             eax,0x00000058
0117  72 19                             jb              L$11
0119  76 56                             jbe             L$19
011B  83 F8 63                          cmp             eax,0x00000063
011E  72 08                             jb              L$10
0120  0F 86 73 00 00 00                 jbe             L$23
0126  EB 29                             jmp             L$13
0128                            L$10:
0128  83 F8 5B                          cmp             eax,0x0000005b
012B  74 5C                             je              L$22
012D  E9 A2 00 00 00                    jmp             L$29
0132                            L$11:
0132  83 F8 45                          cmp             eax,0x00000045
0135  72 0C                             jb              L$12
0137  76 3E                             jbe             L$20
0139  83 F8 47                          cmp             eax,0x00000047
013C  74 39                             je              L$20
013E  E9 91 00 00 00                    jmp             L$29
0143                            L$12:
0143  83 F8 25                          cmp             eax,0x00000025
0146  0F 84 75 00 00 00                 je              L$27
014C  E9 83 00 00 00                    jmp             L$29
0151                            L$13:
0151  6A 01                             push            0x00000001
0153                            L$14:
0153  6A 0A                             push            0x0000000a
0155                            L$15:
0155  57                                push            edi
0156  53                                push            ebx
0157  E8 00 00 00 00                    call            scan_int
015C  83 C4 10                          add             esp,0x00000010
015F  EB 42                             jmp             L$25
0161                            L$16:
0161  6A 01                             push            0x00000001
0163  6A 00                             push            0x00000000
0165  EB EE                             jmp             L$15
0167                            L$17:
0167  6A 01                             push            0x00000001
0169  6A 08                             push            0x00000008
016B  EB E8                             jmp             L$15
016D                            L$18:
016D  6A 00                             push            0x00000000
016F  EB E2                             jmp             L$14
0171                            L$19:
0171  6A 01                             push            0x00000001
0173  6A 10                             push            0x00000010
0175  EB DE                             jmp             L$15
0177                            L$20:
0177  57                                push            edi
0178  53                                push            ebx
0179  E8 00 00 00 00                    call            scan_float
017E  EB 20                             jmp             L$24
0180                            L$21:
0180  57                                push            edi
0181  53                                push            ebx
0182  E8 00 00 00 00                    call            scan_string
0187  EB 17                             jmp             L$24
0189                            L$22:
0189  8D 45 18                          lea             eax,0x18[ebp]
018C  50                                push            eax
018D  57                                push            edi
018E  53                                push            ebx
018F  E8 00 00 00 00                    call            scan_arb
0194  83 C4 0C                          add             esp,0x0000000c
0197  EB 0A                             jmp             L$25
0199                            L$23:
0199  57                                push            edi
019A  53                                push            ebx
019B  E8 00 00 00 00                    call            scan_char
01A0                            L$24:
01A0  83 C4 08                          add             esp,0x00000008
01A3                            L$25:
01A3  85 C0                             test            eax,eax
01A5  7E 68                             jle             L$30
01A7  01 C6                             add             esi,eax
01A9  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
01AD  74 25                             je              L$29
01AF  FF 45 F8                          inc             dword ptr -0x8[ebp]
01B2  EB 20                             jmp             L$29
01B4                            L$26:
01B4  56                                push            esi
01B5  57                                push            edi
01B6  53                                push            ebx
01B7  E8 00 00 00 00                    call            report_scan
01BC  83 C4 0C                          add             esp,0x0000000c
01BF  EB 13                             jmp             L$29
01C1                            L$27:
01C1  53                                push            ebx
01C2  E8 00 00 00 00                    call            cget
01C7  83 C4 04                          add             esp,0x00000004
01CA  83 F8 25                          cmp             eax,0x00000025
01CD  0F 85 B1 FE FF FF                 jne             L$3
01D3                            L$28:
01D3  46                                inc             esi
01D4                            L$29:
01D4  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
01D8  0F 84 5C FE FF FF                 je              L$1
01DE  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
01E1  0F B7 00                          movzx           eax,word ptr [eax]
01E4  83 F8 25                          cmp             eax,0x00000025
01E7  75 26                             jne             L$30
01E9  53                                push            ebx
01EA  83 45 18 02                       add             dword ptr 0x18[ebp],0x00000002
01EE  FF 75 18                          push            dword ptr 0x18[ebp]
01F1  E8 00 00 00 00                    call            get_opt
01F6  89 45 18                          mov             dword ptr 0x18[ebp],eax
01F9  0F B7 00                          movzx           eax,word ptr [eax]
01FC  83 C4 08                          add             esp,0x00000008
01FF  83 F8 6E                          cmp             eax,0x0000006e
0202  75 0B                             jne             L$30
0204  56                                push            esi
0205  57                                push            edi
0206  53                                push            ebx
0207  E8 00 00 00 00                    call            report_scan
020C  83 C4 0C                          add             esp,0x0000000c
020F                            L$30:
020F  83 7D F8 00                       cmp             dword ptr -0x8[ebp],0x00000000
0213  75 10                             jne             L$31
0215  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0219  74 0A                             je              L$31
021B  B8 FF FF FF FF                    mov             eax,0xffffffff
0220  C9                                leave
0221  5F                                pop             edi
0222  5E                                pop             esi
0223  5B                                pop             ebx
0224  C3                                ret
0225                            L$31:
0225  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0228  C9                                leave
0229  5F                                pop             edi
022A  5E                                pop             esi
022B  5B                                pop             ebx
022C  C3                                ret
022D                            get_opt:
022D  53                                push            ebx
022E  56                                push            esi
022F  57                                push            edi
0230  C8 04 00 00                       enter           0x0004,0x00
0234  8B 75 14                          mov             esi,dword ptr 0x14[ebp]
0237  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
023A  C7 43 0C FF FF FF FF              mov             dword ptr 0xc[ebx],0xffffffff
0241  80 4B 10 01                       or              byte ptr 0x10[ebx],0x01
0245  80 63 10 03                       and             byte ptr 0x10[ebx],0x03
0249  0F B7 06                          movzx           eax,word ptr [esi]
024C  83 F8 2A                          cmp             eax,0x0000002a
024F  75 06                             jne             L$32
0251  46                                inc             esi
0252  46                                inc             esi
0253  80 63 10 FE                       and             byte ptr 0x10[ebx],0xfe
0257                            L$32:
0257  0F B7 06                          movzx           eax,word ptr [esi]
025A  50                                push            eax
025B  89 45 FC                          mov             dword ptr -0x4[ebp],eax
025E  E8 00 00 00 00                    call            _uisdigit
0263  83 C4 04                          add             esp,0x00000004
0266  85 C0                             test            eax,eax
0268  74 25                             je              L$34
026A  31 FF                             xor             edi,edi
026C                            L$33:
026C  6B FF 0A                          imul            edi,0x0000000a
026F  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0272  83 E8 30                          sub             eax,0x00000030
0275  46                                inc             esi
0276  46                                inc             esi
0277  01 C7                             add             edi,eax
0279  0F B7 06                          movzx           eax,word ptr [esi]
027C  50                                push            eax
027D  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0280  E8 00 00 00 00                    call            _uisdigit
0285  83 C4 04                          add             esp,0x00000004
0288  85 C0                             test            eax,eax
028A  75 E0                             jne             L$33
028C  89 7B 0C                          mov             dword ptr 0xc[ebx],edi
028F                            L$34:
028F  0F B7 06                          movzx           eax,word ptr [esi]
0292  8D 7E 02                          lea             edi,0x2[esi]
0295  83 F8 4E                          cmp             eax,0x0000004e
0298  75 08                             jne             L$35
029A  89 FE                             mov             esi,edi
029C  80 4B 10 08                       or              byte ptr 0x10[ebx],0x08
02A0  EB 0B                             jmp             L$36
02A2                            L$35:
02A2  83 F8 46                          cmp             eax,0x00000046
02A5  75 06                             jne             L$36
02A7  89 FE                             mov             esi,edi
02A9  80 4B 10 04                       or              byte ptr 0x10[ebx],0x04
02AD                            L$36:
02AD  66 8B 06                          mov             ax,word ptr [esi]
02B0  8D 7E 02                          lea             edi,0x2[esi]
02B3  66 3D 68 00                       cmp             ax,0x0068
02B7  72 12                             jb              L$37
02B9  76 18                             jbe             L$38
02BB  66 3D 6C 00                       cmp             ax,0x006c
02BF  72 28                             jb              L$41
02C1  76 18                             jbe             L$39
02C3  66 3D 77 00                       cmp             ax,0x0077
02C7  74 12                             je              L$39
02C9  EB 1E                             jmp             L$41
02CB                            L$37:
02CB  66 3D 4C 00                       cmp             ax,0x004c
02CF  74 12                             je              L$40
02D1  EB 16                             jmp             L$41
02D3                            L$38:
02D3  89 FE                             mov             esi,edi
02D5  80 4B 10 10                       or              byte ptr 0x10[ebx],0x10
02D9  EB 0E                             jmp             L$41
02DB                            L$39:
02DB  46                                inc             esi
02DC  46                                inc             esi
02DD  80 4B 10 20                       or              byte ptr 0x10[ebx],0x20
02E1  EB 06                             jmp             L$41
02E3                            L$40:
02E3  89 FE                             mov             esi,edi
02E5  80 4B 10 40                       or              byte ptr 0x10[ebx],0x40
02E9                            L$41:
02E9  89 F0                             mov             eax,esi
02EB  C9                                leave
02EC  5F                                pop             edi
02ED  5E                                pop             esi
02EE  5B                                pop             ebx
02EF  C3                                ret
02F0                            scan_white:
02F0  53                                push            ebx
02F1  56                                push            esi
02F2  57                                push            edi
02F3  55                                push            ebp
02F4  89 E5                             mov             ebp,esp
02F6  8B 7D 14                          mov             edi,dword ptr 0x14[ebp]
02F9  31 DB                             xor             ebx,ebx
02FB                            L$42:
02FB  57                                push            edi
02FC  E8 00 00 00 00                    call            cget
0301  83 C4 04                          add             esp,0x00000004
0304  50                                push            eax
0305  89 C6                             mov             esi,eax
0307  E8 00 00 00 00                    call            _uisspace
030C  83 C4 04                          add             esp,0x00000004
030F  85 C0                             test            eax,eax
0311  74 03                             je              L$43
0313  43                                inc             ebx
0314  EB E5                             jmp             L$42
0316                            L$43:
0316  F6 47 10 02                       test            byte ptr 0x10[edi],0x02
031A  75 0A                             jne             L$44
031C  57                                push            edi
031D  56                                push            esi
031E  E8 00 00 00 00                    call            uncget
0323  83 C4 08                          add             esp,0x00000008
0326                            L$44:
0326  89 D8                             mov             eax,ebx
0328  5D                                pop             ebp
0329  5F                                pop             edi
032A  5E                                pop             esi
032B  5B                                pop             ebx
032C  C3                                ret
032D                            scan_char:
032D  53                                push            ebx
032E  56                                push            esi
032F  57                                push            edi
0330  06                                push            es
0331  C8 04 00 00                       enter           0x0004,0x00
0335  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
0338  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
033B  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
033F  74 1E                             je              L$46
0341  F6 43 10 04                       test            byte ptr 0x10[ebx],0x04
0345  74 0A                             je              L$45
0347  83 00 08                          add             dword ptr [eax],0x00000008
034A  8B 30                             mov             esi,dword ptr [eax]
034C  C4 76 F8                          les             esi,fword ptr -0x8[esi]
034F  EB 0E                             jmp             L$46
0351                            L$45:
0351  F6 43 10 08                       test            byte ptr 0x10[ebx],0x08
0355  83 00 04                          add             dword ptr [eax],0x00000004
0358  8B 30                             mov             esi,dword ptr [eax]
035A  1E                                push            ds
035B  07                                pop             es
035C  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
035F                            L$46:
035F  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
0362  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
0369  83 FF FF                          cmp             edi,0xffffffff
036C  75 05                             jne             L$47
036E  BF 01 00 00 00                    mov             edi,0x00000001
0373                            L$47:
0373  85 FF                             test            edi,edi
0375  7E 2D                             jle             L$49
0377  53                                push            ebx
0378  E8 00 00 00 00                    call            cget
037D  83 C4 04                          add             esp,0x00000004
0380  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0384  75 1E                             jne             L$49
0386  FF 45 FC                          inc             dword ptr -0x4[ebp]
0389  4F                                dec             edi
038A  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
038E  74 E3                             je              L$47
0390  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0394  74 06                             je              L$48
0396  26 88 06                          mov             byte ptr es:[esi],al
0399  46                                inc             esi
039A  EB D7                             jmp             L$47
039C                            L$48:
039C  66 26 89 06                       mov             word ptr es:[esi],ax
03A0  46                                inc             esi
03A1  46                                inc             esi
03A2  EB CF                             jmp             L$47
03A4                            L$49:
03A4  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
03A7                            L$50:
03A7  C9                                leave
03A8  07                                pop             es
03A9  5F                                pop             edi
03AA  5E                                pop             esi
03AB  5B                                pop             ebx
03AC  C3                                ret
03AD                            scan_string:
03AD  53                                push            ebx
03AE  56                                push            esi
03AF  57                                push            edi
03B0  06                                push            es
03B1  C8 08 00 00                       enter           0x0008,0x00
03B5  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
03B8  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
03BB  F6 43 10 20                       test            byte ptr 0x10[ebx],0x20
03BF  75 0C                             jne             L$51
03C1  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
03C5  74 06                             je              L$51
03C7  C6 45 FC 01                       mov             byte ptr -0x4[ebp],0x01
03CB  EB 04                             jmp             L$52
03CD                            L$51:
03CD  C6 45 FC 02                       mov             byte ptr -0x4[ebp],0x02
03D1                            L$52:
03D1  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
03D5  74 1E                             je              L$54
03D7  F6 43 10 04                       test            byte ptr 0x10[ebx],0x04
03DB  74 0A                             je              L$53
03DD  83 00 08                          add             dword ptr [eax],0x00000008
03E0  8B 30                             mov             esi,dword ptr [eax]
03E2  C4 76 F8                          les             esi,fword ptr -0x8[esi]
03E5  EB 0E                             jmp             L$54
03E7                            L$53:
03E7  F6 43 10 08                       test            byte ptr 0x10[ebx],0x08
03EB  83 00 04                          add             dword ptr [eax],0x00000004
03EE  8B 30                             mov             esi,dword ptr [eax]
03F0  1E                                push            ds
03F1  07                                pop             es
03F2  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
03F5                            L$54:
03F5  31 FF                             xor             edi,edi
03F7                            L$55:
03F7  53                                push            ebx
03F8  E8 00 00 00 00                    call            cget
03FD  83 C4 04                          add             esp,0x00000004
0400  50                                push            eax
0401  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0404  E8 00 00 00 00                    call            _uisspace
0409  83 C4 04                          add             esp,0x00000004
040C  85 C0                             test            eax,eax
040E  74 03                             je              L$56
0410  47                                inc             edi
0411  EB E4                             jmp             L$55
0413                            L$56:
0413  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0417  74 04                             je              L$57
0419  31 FF                             xor             edi,edi
041B  EB 5C                             jmp             L$63
041D                            L$57:
041D  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0420  8D 50 FF                          lea             edx,-0x1[eax]
0423  89 53 0C                          mov             dword ptr 0xc[ebx],edx
0426  85 C0                             test            eax,eax
0428  74 43                             je              L$62
042A                            L$58:
042A  47                                inc             edi
042B  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
042F  74 1E                             je              L$61
0431  0F B6 45 FC                       movzx           eax,byte ptr -0x4[ebp]
0435  83 F8 01                          cmp             eax,0x00000001
0438  75 08                             jne             L$59
043A  8A 45 F8                          mov             al,byte ptr -0x8[ebp]
043D  26 88 06                          mov             byte ptr es:[esi],al
0440  EB 07                             jmp             L$60
0442                            L$59:
0442  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0445  66 26 89 06                       mov             word ptr es:[esi],ax
0449                            L$60:
0449  0F B6 45 FC                       movzx           eax,byte ptr -0x4[ebp]
044D  01 C6                             add             esi,eax
044F                            L$61:
044F  53                                push            ebx
0450  E8 00 00 00 00                    call            cgetw
0455  83 C4 04                          add             esp,0x00000004
0458  89 45 F8                          mov             dword ptr -0x8[ebp],eax
045B  83 F8 FF                          cmp             eax,0xffffffff
045E  74 19                             je              L$63
0460  50                                push            eax
0461  E8 00 00 00 00                    call            _uisspace
0466  83 C4 04                          add             esp,0x00000004
0469  85 C0                             test            eax,eax
046B  74 BD                             je              L$58
046D                            L$62:
046D  53                                push            ebx
046E  FF 75 F8                          push            dword ptr -0x8[ebp]
0471  E8 00 00 00 00                    call            uncget
0476  83 C4 08                          add             esp,0x00000008
0479                            L$63:
0479  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
047D  74 19                             je              L$65
047F  85 FF                             test            edi,edi
0481  7E 15                             jle             L$65
0483  0F B6 45 FC                       movzx           eax,byte ptr -0x4[ebp]
0487  83 F8 01                          cmp             eax,0x00000001
048A  75 06                             jne             L$64
048C  26 C6 06 00                       mov             byte ptr es:[esi],0x00
0490  EB 06                             jmp             L$65
0492                            L$64:
0492  66 26 C7 06 00 00                 mov             word ptr es:[esi],0x0000
0498                            L$65:
0498  89 F8                             mov             eax,edi
049A  E9 08 FF FF FF                    jmp             L$50
049F                            report_scan:
049F  06                                push            es
04A0  55                                push            ebp
04A1  89 E5                             mov             ebp,esp
04A3  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
04A6  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
04A9  F6 42 10 01                       test            byte ptr 0x10[edx],0x01
04AD  74 38                             je              L$69
04AF  F6 42 10 04                       test            byte ptr 0x10[edx],0x04
04B3  74 0A                             je              L$66
04B5  83 00 08                          add             dword ptr [eax],0x00000008
04B8  8B 00                             mov             eax,dword ptr [eax]
04BA  C4 40 F8                          les             eax,fword ptr -0x8[eax]
04BD  EB 0E                             jmp             L$67
04BF                            L$66:
04BF  F6 42 10 08                       test            byte ptr 0x10[edx],0x08
04C3  83 00 04                          add             dword ptr [eax],0x00000004
04C6  8B 00                             mov             eax,dword ptr [eax]
04C8  1E                                push            ds
04C9  07                                pop             es
04CA  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
04CD                            L$67:
04CD  F6 42 10 10                       test            byte ptr 0x10[edx],0x10
04D1  74 0A                             je              L$68
04D3  8B 55 14                          mov             edx,dword ptr 0x14[ebp]
04D6  66 26 89 10                       mov             word ptr es:[eax],dx
04DA  5D                                pop             ebp
04DB  07                                pop             es
04DC  C3                                ret
04DD                            L$68:
04DD  F6 42 10 20                       test            byte ptr 0x10[edx],0x20
04E1  8B 55 14                          mov             edx,dword ptr 0x14[ebp]
04E4  26 89 10                          mov             dword ptr es:[eax],edx
04E7                            L$69:
04E7  5D                                pop             ebp
04E8  07                                pop             es
04E9  C3                                ret
04EA                            scan_arb:
04EA  53                                push            ebx
04EB  56                                push            esi
04EC  57                                push            edi
04ED  06                                push            es
04EE  C8 10 00 00                       enter           0x0010,0x00
04F2  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
04F5  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
04F8  8B 7D 20                          mov             edi,dword ptr 0x20[ebp]
04FB  8B 3F                             mov             edi,dword ptr [edi]
04FD  0F B7 17                          movzx           edx,word ptr [edi]
0500  83 FA 5E                          cmp             edx,0x0000005e
0503  0F 94 C2                          sete            dl
0506  0F B6 D2                          movzx           edx,dl
0509  89 55 F4                          mov             dword ptr -0xc[ebp],edx
050C  85 D2                             test            edx,edx
050E  74 07                             je              L$70
0510  8B 55 20                          mov             edx,dword ptr 0x20[ebp]
0513  47                                inc             edi
0514  47                                inc             edi
0515  89 3A                             mov             dword ptr [edx],edi
0517                            L$70:
0517  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
051B  74 1E                             je              L$72
051D  F6 43 10 04                       test            byte ptr 0x10[ebx],0x04
0521  74 0A                             je              L$71
0523  83 00 08                          add             dword ptr [eax],0x00000008
0526  8B 30                             mov             esi,dword ptr [eax]
0528  C4 76 F8                          les             esi,fword ptr -0x8[esi]
052B  EB 0E                             jmp             L$72
052D                            L$71:
052D  F6 43 10 08                       test            byte ptr 0x10[ebx],0x08
0531  83 00 04                          add             dword ptr [eax],0x00000004
0534  8B 30                             mov             esi,dword ptr [eax]
0536  1E                                push            ds
0537  07                                pop             es
0538  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
053B                            L$72:
053B  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
053E  31 FF                             xor             edi,edi
0540  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0543                            L$73:
0543  83 7D F0 00                       cmp             dword ptr -0x10[ebp],0x00000000
0547  76 63                             jbe             L$77
0549  53                                push            ebx
054A  E8 00 00 00 00                    call            cget
054F  83 C4 04                          add             esp,0x00000004
0552  89 C2                             mov             edx,eax
0554  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0558  75 52                             jne             L$77
055A  8B 45 20                          mov             eax,dword ptr 0x20[ebp]
055D  8B 00                             mov             eax,dword ptr [eax]
055F  66 8B 08                          mov             cx,word ptr [eax]
0562  C6 45 FC 01                       mov             byte ptr -0x4[ebp],0x01
0566  89 4D F8                          mov             dword ptr -0x8[ebp],ecx
0569                            L$74:
0569  0F B7 4D F8                       movzx           ecx,word ptr -0x8[ebp]
056D  39 CA                             cmp             edx,ecx
056F  74 14                             je              L$75
0571  40                                inc             eax
0572  40                                inc             eax
0573  66 8B 08                          mov             cx,word ptr [eax]
0576  89 4D F8                          mov             dword ptr -0x8[ebp],ecx
0579  0F B7 C9                          movzx           ecx,cx
057C  83 F9 5D                          cmp             ecx,0x0000005d
057F  75 E8                             jne             L$74
0581  C6 45 FC 00                       mov             byte ptr -0x4[ebp],0x00
0585                            L$75:
0585  0F B6 45 FC                       movzx           eax,byte ptr -0x4[ebp]
0589  3B 45 F4                          cmp             eax,dword ptr -0xc[ebp]
058C  75 0C                             jne             L$76
058E  53                                push            ebx
058F  52                                push            edx
0590  E8 00 00 00 00                    call            uncget
0595  83 C4 08                          add             esp,0x00000008
0598  EB 12                             jmp             L$77
059A                            L$76:
059A  FF 4D F0                          dec             dword ptr -0x10[ebp]
059D  47                                inc             edi
059E  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
05A2  74 9F                             je              L$73
05A4  66 26 89 16                       mov             word ptr es:[esi],dx
05A8  46                                inc             esi
05A9  46                                inc             esi
05AA  EB 97                             jmp             L$73
05AC                            L$77:
05AC  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
05B0  0F 84 E2 FE FF FF                 je              L$65
05B6  85 FF                             test            edi,edi
05B8  0F 8E DA FE FF FF                 jle             L$65
05BE  E9 CF FE FF FF                    jmp             L$64
05C3                            scan_float:
05C3  53                                push            ebx
05C4  56                                push            esi
05C5  57                                push            edi
05C6  06                                push            es
05C7  C8 78 00 00                       enter           0x0078,0x00
05CB  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
05CE  8B 7D 1C                          mov             edi,dword ptr 0x1c[ebp]
05D1  8D 75 88                          lea             esi,-0x78[ebp]
05D4  C7 45 E8 00 00 00 00              mov             dword ptr -0x18[ebp],0x00000000
05DB  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
05E2                            L$78:
05E2  53                                push            ebx
05E3  E8 00 00 00 00                    call            cget
05E8  83 C4 04                          add             esp,0x00000004
05EB  50                                push            eax
05EC  89 45 F0                          mov             dword ptr -0x10[ebp],eax
05EF  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
05F2  E8 00 00 00 00                    call            _uisspace
05F7  83 C4 04                          add             esp,0x00000004
05FA  85 C0                             test            eax,eax
05FC  74 05                             je              L$79
05FE  FF 45 F8                          inc             dword ptr -0x8[ebp]
0601  EB DF                             jmp             L$78
0603                            L$79:
0603  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0607  0F 85 06 02 00 00                 jne             L$98
060D  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0610  8D 48 FF                          lea             ecx,-0x1[eax]
0613  89 4B 0C                          mov             dword ptr 0xc[ebx],ecx
0616  85 C0                             test            eax,eax
0618  0F 84 E9 01 00 00                 je              L$97
061E  83 7D F0 2B                       cmp             dword ptr -0x10[ebp],0x0000002b
0622  74 06                             je              L$80
0624  83 7D F0 2D                       cmp             dword ptr -0x10[ebp],0x0000002d
0628  75 1E                             jne             L$81
062A                            L$80:
062A  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
062D  53                                push            ebx
062E  FF 45 F8                          inc             dword ptr -0x8[ebp]
0631  88 06                             mov             byte ptr [esi],al
0633  E8 00 00 00 00                    call            cgetw
0638  46                                inc             esi
0639  83 C4 04                          add             esp,0x00000004
063C  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
063F  83 F8 FF                          cmp             eax,0xffffffff
0642  0F 84 CB 01 00 00                 je              L$98
0648                            L$81:
0648  FF 75 E4                          push            dword ptr -0x1c[ebp]
064B  E8 00 00 00 00                    call            _uisdigit
0650  83 C4 04                          add             esp,0x00000004
0653  85 C0                             test            eax,eax
0655  75 0A                             jne             L$82
0657  83 7D E4 2E                       cmp             dword ptr -0x1c[ebp],0x0000002e
065B  0F 85 A6 01 00 00                 jne             L$97
0661                            L$82:
0661  C7 45 E0 00 00 00 00              mov             dword ptr -0x20[ebp],0x00000000
0668  FF 75 E4                          push            dword ptr -0x1c[ebp]
066B  C7 45 EC 00 00 00 00              mov             dword ptr -0x14[ebp],0x00000000
0672  E8 00 00 00 00                    call            _uisdigit
0677  83 C4 04                          add             esp,0x00000004
067A  85 C0                             test            eax,eax
067C  74 46                             je              L$85
067E  C7 45 EC 01 00 00 00              mov             dword ptr -0x14[ebp],0x00000001
0685                            L$83:
0685  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
0688  88 06                             mov             byte ptr [esi],al
068A  46                                inc             esi
068B  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
068F  74 0E                             je              L$84
0691  6B 45 E2 0A                       imul            eax,dword ptr -0x1e[ebp],0x0000000a
0695  03 45 E4                          add             eax,dword ptr -0x1c[ebp]
0698  83 E8 30                          sub             eax,0x00000030
069B  66 89 45 E2                       mov             word ptr -0x1e[ebp],ax
069F                            L$84:
069F  53                                push            ebx
06A0  FF 45 E8                          inc             dword ptr -0x18[ebp]
06A3  E8 00 00 00 00                    call            cgetw
06A8  83 C4 04                          add             esp,0x00000004
06AB  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
06AE  83 F8 FF                          cmp             eax,0xffffffff
06B1  0F 84 5C 01 00 00                 je              L$98
06B7  50                                push            eax
06B8  E8 00 00 00 00                    call            _uisdigit
06BD  83 C4 04                          add             esp,0x00000004
06C0  85 C0                             test            eax,eax
06C2  75 C1                             jne             L$83
06C4                            L$85:
06C4  83 7D E4 2E                       cmp             dword ptr -0x1c[ebp],0x0000002e
06C8  0F 85 A2 00 00 00                 jne             L$92
06CE  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
06D1  53                                push            ebx
06D2  88 06                             mov             byte ptr [esi],al
06D4  E8 00 00 00 00                    call            cgetw
06D9  46                                inc             esi
06DA  83 C4 04                          add             esp,0x00000004
06DD  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
06E0  83 F8 FF                          cmp             eax,0xffffffff
06E3  0F 84 2A 01 00 00                 je              L$98
06E9  83 7D EC 00                       cmp             dword ptr -0x14[ebp],0x00000000
06ED  75 11                             jne             L$86
06EF  50                                push            eax
06F0  E8 00 00 00 00                    call            _uisdigit
06F5  83 C4 04                          add             esp,0x00000004
06F8  85 C0                             test            eax,eax
06FA  0F 84 07 01 00 00                 je              L$97
0700                            L$86:
0700  FF 45 E8                          inc             dword ptr -0x18[ebp]
0703                            L$87:
0703  FF 75 E4                          push            dword ptr -0x1c[ebp]
0706  E8 00 00 00 00                    call            _uisdigit
070B  83 C4 04                          add             esp,0x00000004
070E  85 C0                             test            eax,eax
0710  74 1A                             je              L$88
0712  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
0715  53                                push            ebx
0716  FF 45 E8                          inc             dword ptr -0x18[ebp]
0719  88 06                             mov             byte ptr [esi],al
071B  E8 00 00 00 00                    call            cgetw
0720  46                                inc             esi
0721  83 C4 04                          add             esp,0x00000004
0724  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
0727  83 F8 FF                          cmp             eax,0xffffffff
072A  75 D7                             jne             L$87
072C                            L$88:
072C  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0730  74 34                             je              L$91
0732  C7 45 F4 00 00 00 00              mov             dword ptr -0xc[ebp],0x00000000
0739  89 F1                             mov             ecx,esi
073B                            L$89:
073B  49                                dec             ecx
073C  0F B6 01                          movzx           eax,byte ptr [ecx]
073F  83 F8 2E                          cmp             eax,0x0000002e
0742  74 1B                             je              L$90
0744  8A 01                             mov             al,byte ptr [ecx]
0746  2C 30                             sub             al,0x30
0748  C7 45 FC 0A 00 00 00              mov             dword ptr -0x4[ebp],0x0000000a
074F  88 45 F6                          mov             byte ptr -0xa[ebp],al
0752  31 D2                             xor             edx,edx
0754  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0757  F7 75 FC                          div             dword ptr -0x4[ebp]
075A  89 45 F4                          mov             dword ptr -0xc[ebp],eax
075D  EB DC                             jmp             L$89
075F                            L$90:
075F  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0762  66 89 45 E0                       mov             word ptr -0x20[ebp],ax
0766                            L$91:
0766  83 7D E4 FF                       cmp             dword ptr -0x1c[ebp],0xffffffff
076A  0F 84 A3 00 00 00                 je              L$98
0770                            L$92:
0770  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0774  0F 85 8D 00 00 00                 jne             L$97
077A  83 7D E4 65                       cmp             dword ptr -0x1c[ebp],0x00000065
077E  74 0A                             je              L$93
0780  83 7D E4 45                       cmp             dword ptr -0x1c[ebp],0x00000045
0784  0F 85 7D 00 00 00                 jne             L$97
078A                            L$93:
078A  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
078D  53                                push            ebx
078E  FF 45 E8                          inc             dword ptr -0x18[ebp]
0791  88 06                             mov             byte ptr [esi],al
0793  E8 00 00 00 00                    call            cgetw
0798  46                                inc             esi
0799  83 C4 04                          add             esp,0x00000004
079C  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
079F  83 F8 FF                          cmp             eax,0xffffffff
07A2  0F 84 6B 00 00 00                 je              L$98
07A8  83 F8 2B                          cmp             eax,0x0000002b
07AB  74 05                             je              L$94
07AD  83 F8 2D                          cmp             eax,0x0000002d
07B0  75 1A                             jne             L$95
07B2                            L$94:
07B2  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
07B5  53                                push            ebx
07B6  FF 45 E8                          inc             dword ptr -0x18[ebp]
07B9  88 06                             mov             byte ptr [esi],al
07BB  E8 00 00 00 00                    call            cgetw
07C0  46                                inc             esi
07C1  83 C4 04                          add             esp,0x00000004
07C4  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
07C7  83 F8 FF                          cmp             eax,0xffffffff
07CA  74 47                             je              L$98
07CC                            L$95:
07CC  FF 75 E4                          push            dword ptr -0x1c[ebp]
07CF  E8 00 00 00 00                    call            _uisdigit
07D4  83 C4 04                          add             esp,0x00000004
07D7  85 C0                             test            eax,eax
07D9  75 05                             jne             L$96
07DB  89 45 E8                          mov             dword ptr -0x18[ebp],eax
07DE  EB 27                             jmp             L$97
07E0                            L$96:
07E0  8A 45 E4                          mov             al,byte ptr -0x1c[ebp]
07E3  53                                push            ebx
07E4  FF 45 E8                          inc             dword ptr -0x18[ebp]
07E7  88 06                             mov             byte ptr [esi],al
07E9  E8 00 00 00 00                    call            cgetw
07EE  46                                inc             esi
07EF  83 C4 04                          add             esp,0x00000004
07F2  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
07F5  83 F8 FF                          cmp             eax,0xffffffff
07F8  74 19                             je              L$98
07FA  50                                push            eax
07FB  E8 00 00 00 00                    call            _uisdigit
0800  83 C4 04                          add             esp,0x00000004
0803  85 C0                             test            eax,eax
0805  75 D9                             jne             L$96
0807                            L$97:
0807  53                                push            ebx
0808  FF 75 E4                          push            dword ptr -0x1c[ebp]
080B  E8 00 00 00 00                    call            uncget
0810  83 C4 08                          add             esp,0x00000008
0813                            L$98:
0813  83 7D E8 00                       cmp             dword ptr -0x18[ebp],0x00000000
0817  0F 8E 8A 00 00 00                 jle             L$107
081D  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0820  01 45 E8                          add             dword ptr -0x18[ebp],eax
0823  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
0827  0F 84 7A 00 00 00                 je              L$107
082D  C6 06 00                          mov             byte ptr [esi],0x00
0830  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0834  74 0E                             je              L$99
0836  0F B6 45 88                       movzx           eax,byte ptr -0x78[ebp]
083A  83 F8 2D                          cmp             eax,0x0000002d
083D  75 16                             jne             L$100
083F  F7 5D E0                          neg             dword ptr -0x20[ebp]
0842  EB 11                             jmp             L$100
0844                            L$99:
0844  8D 45 D8                          lea             eax,-0x28[ebp]
0847  50                                push            eax
0848  8D 45 88                          lea             eax,-0x78[ebp]
084B  50                                push            eax
084C  FF 15 00 00 00 00                 call            dword ptr __EFG_scanf
0852  83 C4 08                          add             esp,0x00000008
0855                            L$100:
0855  F6 43 10 04                       test            byte ptr 0x10[ebx],0x04
0859  74 0A                             je              L$101
085B  83 07 08                          add             dword ptr [edi],0x00000008
085E  8B 37                             mov             esi,dword ptr [edi]
0860  C4 76 F8                          les             esi,fword ptr -0x8[esi]
0863  EB 0E                             jmp             L$102
0865                            L$101:
0865  F6 43 10 08                       test            byte ptr 0x10[ebx],0x08
0869  83 07 04                          add             dword ptr [edi],0x00000004
086C  8B 37                             mov             esi,dword ptr [edi]
086E  1E                                push            ds
086F  07                                pop             es
0870  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
0873                            L$102:
0873  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0877  74 05                             je              L$103
0879  8B 45 E0                          mov             eax,dword ptr -0x20[ebp]
087C  EB 26                             jmp             L$106
087E                            L$103:
087E  F6 43 10 20                       test            byte ptr 0x10[ebx],0x20
0882  75 06                             jne             L$104
0884  F6 43 10 40                       test            byte ptr 0x10[ebx],0x40
0888  74 0F                             je              L$105
088A                            L$104:
088A  8B 45 D8                          mov             eax,dword ptr -0x28[ebp]
088D  26 89 06                          mov             dword ptr es:[esi],eax
0890  8B 45 DC                          mov             eax,dword ptr -0x24[ebp]
0893  26 89 46 04                       mov             dword ptr es:0x4[esi],eax
0897  EB 0E                             jmp             L$107
0899                            L$105:
0899  8B 45 D8                          mov             eax,dword ptr -0x28[ebp]
089C  8B 55 DC                          mov             edx,dword ptr -0x24[ebp]
089F  E8 00 00 00 00                    call            __FDFS
08A4                            L$106:
08A4  26 89 06                          mov             dword ptr es:[esi],eax
08A7                            L$107:
08A7  8B 45 E8                          mov             eax,dword ptr -0x18[ebp]
08AA  E9 F8 FA FF FF                    jmp             L$50
08AF                            scan_int:
08AF  53                                push            ebx
08B0  56                                push            esi
08B1  57                                push            edi
08B2  06                                push            es
08B3  C8 10 00 00                       enter           0x0010,0x00
08B7  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
08BA  8B 75 1C                          mov             esi,dword ptr 0x1c[ebp]
08BD  C7 45 F4 00 00 00 00              mov             dword ptr -0xc[ebp],0x00000000
08C4  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
08CB  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
08D2                            L$108:
08D2  53                                push            ebx
08D3  E8 00 00 00 00                    call            cget
08D8  83 C4 04                          add             esp,0x00000004
08DB  50                                push            eax
08DC  89 C7                             mov             edi,eax
08DE  E8 00 00 00 00                    call            _uisspace
08E3  83 C4 04                          add             esp,0x00000004
08E6  85 C0                             test            eax,eax
08E8  74 05                             je              L$109
08EA  FF 45 F8                          inc             dword ptr -0x8[ebp]
08ED  EB E3                             jmp             L$108
08EF                            L$109:
08EF  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
08F3  0F 85 64 01 00 00                 jne             L$122
08F9  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
08FC  8D 50 FF                          lea             edx,-0x1[eax]
08FF  89 53 0C                          mov             dword ptr 0xc[ebx],edx
0902  85 C0                             test            eax,eax
0904  0F 84 49 01 00 00                 je              L$121
090A  C7 45 F0 2B 00 00 00              mov             dword ptr -0x10[ebp],0x0000002b
0911  83 7D 24 00                       cmp             dword ptr 0x24[ebp],0x00000000
0915  74 24                             je              L$111
0917  83 FF 2B                          cmp             edi,0x0000002b
091A  74 05                             je              L$110
091C  83 FF 2D                          cmp             edi,0x0000002d
091F  75 1A                             jne             L$111
0921                            L$110:
0921  53                                push            ebx
0922  FF 45 F8                          inc             dword ptr -0x8[ebp]
0925  89 7D F0                          mov             dword ptr -0x10[ebp],edi
0928  E8 00 00 00 00                    call            cgetw
092D  83 C4 04                          add             esp,0x00000004
0930  89 C7                             mov             edi,eax
0932  83 F8 FF                          cmp             eax,0xffffffff
0935  0F 84 22 01 00 00                 je              L$122
093B                            L$111:
093B  83 7D 20 00                       cmp             dword ptr 0x20[ebp],0x00000000
093F  75 64                             jne             L$115
0941  83 FF 30                          cmp             edi,0x00000030
0944  75 56                             jne             L$114
0946  53                                push            ebx
0947  C7 45 FC 01 00 00 00              mov             dword ptr -0x4[ebp],0x00000001
094E  E8 00 00 00 00                    call            cgetw
0953  83 C4 04                          add             esp,0x00000004
0956  89 C7                             mov             edi,eax
0958  83 F8 FF                          cmp             eax,0xffffffff
095B  0F 84 FC 00 00 00                 je              L$122
0961  83 F8 78                          cmp             eax,0x00000078
0964  74 05                             je              L$112
0966  83 F8 58                          cmp             eax,0x00000058
0969  75 28                             jne             L$113
096B                            L$112:
096B  53                                push            ebx
096C  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
0973  83 45 F8 02                       add             dword ptr -0x8[ebp],0x00000002
0977  E8 00 00 00 00                    call            cgetw
097C  83 C4 04                          add             esp,0x00000004
097F  89 C7                             mov             edi,eax
0981  83 F8 FF                          cmp             eax,0xffffffff
0984  0F 84 D3 00 00 00                 je              L$122
098A  C7 45 20 10 00 00 00              mov             dword ptr 0x20[ebp],0x00000010
0991  EB 61                             jmp             L$118
0993                            L$113:
0993  C7 45 20 08 00 00 00              mov             dword ptr 0x20[ebp],0x00000008
099A  EB 58                             jmp             L$118
099C                            L$114:
099C  C7 45 20 0A 00 00 00              mov             dword ptr 0x20[ebp],0x0000000a
09A3  EB 4F                             jmp             L$118
09A5                            L$115:
09A5  83 7D 20 10                       cmp             dword ptr 0x20[ebp],0x00000010
09A9  75 49                             jne             L$118
09AB  83 FF 30                          cmp             edi,0x00000030
09AE  75 44                             jne             L$118
09B0  53                                push            ebx
09B1  C7 45 FC 01 00 00 00              mov             dword ptr -0x4[ebp],0x00000001
09B8  E8 00 00 00 00                    call            cgetw
09BD  83 C4 04                          add             esp,0x00000004
09C0  89 C7                             mov             edi,eax
09C2  83 F8 FF                          cmp             eax,0xffffffff
09C5  0F 84 92 00 00 00                 je              L$122
09CB  83 F8 78                          cmp             eax,0x00000078
09CE  74 05                             je              L$116
09D0  83 F8 58                          cmp             eax,0x00000058
09D3  75 1F                             jne             L$118
09D5                            L$116:
09D5  53                                push            ebx
09D6  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
09DD  83 45 F8 02                       add             dword ptr -0x8[ebp],0x00000002
09E1  E8 00 00 00 00                    call            cgetw
09E6                            L$117:
09E6  83 C4 04                          add             esp,0x00000004
09E9  89 C7                             mov             edi,eax
09EB  83 F8 FF                          cmp             eax,0xffffffff
09EE  0F 84 69 00 00 00                 je              L$122
09F4                            L$118:
09F4  57                                push            edi
09F5  E8 00 00 00 00                    call            radix_value
09FA  83 C4 04                          add             esp,0x00000004
09FD  3B 45 20                          cmp             eax,dword ptr 0x20[ebp]
0A00  7D 17                             jge             L$119
0A02  8B 7D F4                          mov             edi,dword ptr -0xc[ebp]
0A05  0F AF 7D 20                       imul            edi,dword ptr 0x20[ebp]
0A09  53                                push            ebx
0A0A  FF 45 FC                          inc             dword ptr -0x4[ebp]
0A0D  01 C7                             add             edi,eax
0A0F  E8 00 00 00 00                    call            cgetw
0A14  89 7D F4                          mov             dword ptr -0xc[ebp],edi
0A17  EB CD                             jmp             L$117
0A19                            L$119:
0A19  83 FF 3A                          cmp             edi,0x0000003a
0A1C  75 35                             jne             L$121
0A1E  F6 43 10 80                       test            byte ptr 0x10[ebx],0x80
0A22  74 2F                             je              L$121
0A24                            L$120:
0A24  53                                push            ebx
0A25  FF 45 FC                          inc             dword ptr -0x4[ebp]
0A28  E8 00 00 00 00                    call            cgetw
0A2D  83 C4 04                          add             esp,0x00000004
0A30  89 C7                             mov             edi,eax
0A32  83 F8 FF                          cmp             eax,0xffffffff
0A35  74 26                             je              L$122
0A37  50                                push            eax
0A38  E8 00 00 00 00                    call            radix_value
0A3D  83 C4 04                          add             esp,0x00000004
0A40  3B 45 20                          cmp             eax,dword ptr 0x20[ebp]
0A43  7D 0E                             jge             L$121
0A45  8B 7D F4                          mov             edi,dword ptr -0xc[ebp]
0A48  0F AF 7D 20                       imul            edi,dword ptr 0x20[ebp]
0A4C  01 C7                             add             edi,eax
0A4E  89 7D F4                          mov             dword ptr -0xc[ebp],edi
0A51  EB D1                             jmp             L$120
0A53                            L$121:
0A53  53                                push            ebx
0A54  57                                push            edi
0A55  E8 00 00 00 00                    call            uncget
0A5A  83 C4 08                          add             esp,0x00000008
0A5D                            L$122:
0A5D  83 7D F0 2D                       cmp             dword ptr -0x10[ebp],0x0000002d
0A61  75 03                             jne             L$123
0A63  F7 5D F4                          neg             dword ptr -0xc[ebp]
0A66                            L$123:
0A66  83 7D FC 00                       cmp             dword ptr -0x4[ebp],0x00000000
0A6A  0F 8E 34 F9 FF FF                 jle             L$49
0A70  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0A73  01 45 FC                          add             dword ptr -0x4[ebp],eax
0A76  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
0A7A  0F 84 24 F9 FF FF                 je              L$49
0A80  F6 43 10 04                       test            byte ptr 0x10[ebx],0x04
0A84  74 0A                             je              L$124
0A86  83 06 08                          add             dword ptr [esi],0x00000008
0A89  8B 36                             mov             esi,dword ptr [esi]
0A8B  C4 76 F8                          les             esi,fword ptr -0x8[esi]
0A8E  EB 0E                             jmp             L$125
0A90                            L$124:
0A90  F6 43 10 08                       test            byte ptr 0x10[ebx],0x08
0A94  83 06 04                          add             dword ptr [esi],0x00000004
0A97  8B 36                             mov             esi,dword ptr [esi]
0A99  1E                                push            ds
0A9A  07                                pop             es
0A9B  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
0A9E                            L$125:
0A9E  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
0AA2  74 0C                             je              L$126
0AA4  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0AA7  66 26 89 06                       mov             word ptr es:[esi],ax
0AAB  E9 F4 F8 FF FF                    jmp             L$49
0AB0                            L$126:
0AB0  F6 43 10 20                       test            byte ptr 0x10[ebx],0x20
0AB4  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0AB7  26 89 06                          mov             dword ptr es:[esi],eax
0ABA  E9 E5 F8 FF FF                    jmp             L$49
0ABF                            radix_value:
0ABF  55                                push            ebp
0AC0  89 E5                             mov             ebp,esp
0AC2  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0AC5  83 F8 30                          cmp             eax,0x00000030
0AC8  7C 0A                             jl              L$127
0ACA  83 F8 39                          cmp             eax,0x00000039
0ACD  7F 05                             jg              L$127
0ACF  83 E8 30                          sub             eax,0x00000030
0AD2  5D                                pop             ebp
0AD3  C3                                ret
0AD4                            L$127:
0AD4  50                                push            eax
0AD5  E8 00 00 00 00                    call            _utolower
0ADA  83 C4 04                          add             esp,0x00000004
0ADD  83 F8 61                          cmp             eax,0x00000061
0AE0  7C 0A                             jl              L$128
0AE2  83 F8 66                          cmp             eax,0x00000066
0AE5  7F 05                             jg              L$128
0AE7  83 E8 57                          sub             eax,0x00000057
0AEA  5D                                pop             ebp
0AEB  C3                                ret
0AEC                            L$128:
0AEC  B8 10 00 00 00                    mov             eax,0x00000010
0AF1  5D                                pop             ebp
0AF2  C3                                ret
0AF3                            cgetw:
0AF3  53                                push            ebx
0AF4  55                                push            ebp
0AF5  89 E5                             mov             ebp,esp
0AF7  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0AFA  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0AFD  8D 50 FF                          lea             edx,-0x1[eax]
0B00  89 53 0C                          mov             dword ptr 0xc[ebx],edx
0B03  85 C0                             test            eax,eax
0B05  74 0F                             je              L$129
0B07  53                                push            ebx
0B08  E8 00 00 00 00                    call            cget
0B0D  83 C4 04                          add             esp,0x00000004
0B10  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0B14  74 05                             je              L$130
0B16                            L$129:
0B16  B8 FF FF FF FF                    mov             eax,0xffffffff
0B1B                            L$130:
0B1B  5D                                pop             ebp
0B1C  5B                                pop             ebx
0B1D  C3                                ret

Routine Size: 2814 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

