Module: prtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000ADC bytes
0000                            __prtf:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  55                                push            ebp
0005  83 EC 4C                          sub             esp,0x0000004c
0008  8B 5C 24 6C                       mov             ebx,dword ptr 0x6c[esp]
000C  8B 7C 24 68                       mov             edi,dword ptr 0x68[esp]
0010  30 E4                             xor             ah,ah
0012  30 D2                             xor             dl,dl
0014  88 64 24 48                       mov             byte ptr 0x48[esp],ah
0018  88 54 24 3C                       mov             byte ptr 0x3c[esp],dl
001C  8B 44 24 70                       mov             eax,dword ptr 0x70[esp]
0020  31 D2                             xor             edx,edx
0022  89 44 24 44                       mov             dword ptr 0x44[esp],eax
0026  8B 44 24 64                       mov             eax,dword ptr 0x64[esp]
002A  89 54 24 38                       mov             dword ptr 0x38[esp],edx
002E  89 44 24 28                       mov             dword ptr 0x28[esp],eax
0032  EB 6A                             jmp             L$6
0034                            L$1:
0034  8D 74 24 28                       lea             esi,0x28[esp]
0038  56                                push            esi
0039  53                                push            ebx
003A  50                                push            eax
003B  E8 00 00 00 00                    call            getprintspecs
0040  89 C7                             mov             edi,eax
0042  83 C4 0C                          add             esp,0x0000000c
0045  8A 00                             mov             al,byte ptr [eax]
0047  47                                inc             edi
0048  88 44 24 3D                       mov             byte ptr 0x3d[esp],al
004C  84 C0                             test            al,al
004E  0F 84 56 02 00 00                 je              L$27
0054  3C 6E                             cmp             al,0x6e
0056  0F 85 D6 00 00 00                 jne             L$13
005C  8A 74 24 3C                       mov             dh,byte ptr 0x3c[esp]
0060  F6 C6 20                          test            dh,0x20
0063  74 5F                             je              L$7
0065  F6 C6 80                          test            dh,0x80
0068  74 13                             je              L$3
006A  8B 03                             mov             eax,dword ptr [ebx]
006C  83 C0 08                          add             eax,0x00000008
006F  89 03                             mov             dword ptr [ebx],eax
0071  C4 70 F8                          les             esi,fword ptr -0x8[eax]
0074                            L$2:
0074  8B 44 24 38                       mov             eax,dword ptr 0x38[esp]
0078  26 89 06                          mov             dword ptr es:[esi],eax
007B  EB 21                             jmp             L$6
007D                            L$3:
007D  F6 C6 40                          test            dh,0x40
0080  74 0C                             je              L$4
0082  8B 2B                             mov             ebp,dword ptr [ebx]
0084  83 C5 04                          add             ebp,0x00000004
0087  89 2B                             mov             dword ptr [ebx],ebp
0089  8B 75 FC                          mov             esi,dword ptr -0x4[ebp]
008C  EB 0A                             jmp             L$5
008E                            L$4:
008E  8B 33                             mov             esi,dword ptr [ebx]
0090  83 C6 04                          add             esi,0x00000004
0093  89 33                             mov             dword ptr [ebx],esi
0095  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
0098                            L$5:
0098  8B 44 24 38                       mov             eax,dword ptr 0x38[esp]
009C  89 06                             mov             dword ptr [esi],eax
009E                            L$6:
009E  8A 37                             mov             dh,byte ptr [edi]
00A0  84 F6                             test            dh,dh
00A2  0F 84 02 02 00 00                 je              L$27
00A8  8D 47 01                          lea             eax,0x1[edi]
00AB  80 FE 25                          cmp             dh,0x25
00AE  74 84                             je              L$1
00B0  0F B6 F6                          movzx           esi,dh
00B3  56                                push            esi
00B4  8D 74 24 2C                       lea             esi,0x2c[esp]
00B8  56                                push            esi
00B9  89 C7                             mov             edi,eax
00BB  FF 54 24 4C                       call            dword ptr 0x4c[esp]
00BF  83 C4 08                          add             esp,0x00000008
00C2  EB DA                             jmp             L$6
00C4                            L$7:
00C4  F6 C6 10                          test            dh,0x10
00C7  74 3D                             je              L$11
00C9  F6 C6 80                          test            dh,0x80
00CC  74 14                             je              L$8
00CE  8B 0B                             mov             ecx,dword ptr [ebx]
00D0  83 C1 08                          add             ecx,0x00000008
00D3  89 0B                             mov             dword ptr [ebx],ecx
00D5  C4 71 F8                          les             esi,fword ptr -0x8[ecx]
00D8  8B 44 24 38                       mov             eax,dword ptr 0x38[esp]
00DC  66 26 89 06                       mov             word ptr es:[esi],ax
00E0  EB BC                             jmp             L$6
00E2                            L$8:
00E2  F6 C6 40                          test            dh,0x40
00E5  74 13                             je              L$10
00E7  8B 13                             mov             edx,dword ptr [ebx]
00E9  83 C2 04                          add             edx,0x00000004
00EC  89 13                             mov             dword ptr [ebx],edx
00EE  8B 72 FC                          mov             esi,dword ptr -0x4[edx]
00F1                            L$9:
00F1  8B 44 24 38                       mov             eax,dword ptr 0x38[esp]
00F5  66 89 06                          mov             word ptr [esi],ax
00F8  EB A4                             jmp             L$6
00FA                            L$10:
00FA  8B 03                             mov             eax,dword ptr [ebx]
00FC  83 C0 04                          add             eax,0x00000004
00FF  89 03                             mov             dword ptr [ebx],eax
0101  8B 70 FC                          mov             esi,dword ptr -0x4[eax]
0104  EB EB                             jmp             L$9
0106                            L$11:
0106  F6 C6 80                          test            dh,0x80
0109  74 0F                             je              L$12
010B  8B 2B                             mov             ebp,dword ptr [ebx]
010D  83 C5 08                          add             ebp,0x00000008
0110  89 2B                             mov             dword ptr [ebx],ebp
0112  C4 75 F8                          les             esi,fword ptr -0x8[ebp]
0115  E9 5A FF FF FF                    jmp             L$2
011A                            L$12:
011A  F6 C6 40                          test            dh,0x40
011D  0F 85 6B FF FF FF                 jne             L$4
0123  8B 0B                             mov             ecx,dword ptr [ebx]
0125  83 C1 04                          add             ecx,0x00000004
0128  89 0B                             mov             dword ptr [ebx],ecx
012A  8B 71 FC                          mov             esi,dword ptr -0x4[ecx]
012D  E9 66 FF FF FF                    jmp             L$5
0132                            L$13:
0132  8D 44 24 48                       lea             eax,0x48[esp]
0136  50                                push            eax
0137  8D 44 24 2C                       lea             eax,0x2c[esp]
013B  50                                push            eax
013C  53                                push            ebx
013D  8D 44 24 0C                       lea             eax,0xc[esp]
0141  50                                push            eax
0142  E8 00 00 00 00                    call            formstring
0147  83 C4 10                          add             esp,0x00000010
014A  89 C6                             mov             esi,eax
014C  8A 64 24 3C                       mov             ah,byte ptr 0x3c[esp]
0150  8E C2                             mov             es,edx
0152  F6 C4 08                          test            ah,0x08
0155  75 29                             jne             L$15
0157  80 7C 24 3E 20                    cmp             byte ptr 0x3e[esp],0x20
015C  75 22                             jne             L$15
015E                            L$14:
015E  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
0162  4A                                dec             edx
0163  89 54 24 2C                       mov             dword ptr 0x2c[esp],edx
0167  85 D2                             test            edx,edx
0169  7C 15                             jl              L$15
016B  31 C0                             xor             eax,eax
016D  8A 44 24 3E                       mov             al,byte ptr 0x3e[esp]
0171  50                                push            eax
0172  8D 44 24 2C                       lea             eax,0x2c[esp]
0176  50                                push            eax
0177  FF 54 24 4C                       call            dword ptr 0x4c[esp]
017B  83 C4 08                          add             esp,0x00000008
017E  EB DE                             jmp             L$14
0180                            L$15:
0180  8D 6C 24 3F                       lea             ebp,0x3f[esp]
0184                            L$16:
0184  8A 6D 00                          mov             ch,byte ptr [ebp]
0187  84 ED                             test            ch,ch
0189  74 14                             je              L$17
018B  31 C0                             xor             eax,eax
018D  88 E8                             mov             al,ch
018F  50                                push            eax
0190  8D 44 24 2C                       lea             eax,0x2c[esp]
0194  50                                push            eax
0195  45                                inc             ebp
0196  FF 54 24 4C                       call            dword ptr 0x4c[esp]
019A  83 C4 08                          add             esp,0x00000008
019D  EB E5                             jmp             L$16
019F                            L$17:
019F  8B 44 24 34                       mov             eax,dword ptr 0x34[esp]
01A3  8D 68 FF                          lea             ebp,-0x1[eax]
01A6  89 6C 24 34                       mov             dword ptr 0x34[esp],ebp
01AA  85 C0                             test            eax,eax
01AC  74 10                             je              L$18
01AE  6A 30                             push            0x00000030
01B0  8D 44 24 2C                       lea             eax,0x2c[esp]
01B4  50                                push            eax
01B5  FF 54 24 4C                       call            dword ptr 0x4c[esp]
01B9  83 C4 08                          add             esp,0x00000008
01BC  EB E1                             jmp             L$17
01BE                            L$18:
01BE  F6 44 24 3C 08                    test            byte ptr 0x3c[esp],0x08
01C3  75 29                             jne             L$20
01C5  80 7C 24 3E 20                    cmp             byte ptr 0x3e[esp],0x20
01CA  74 22                             je              L$20
01CC                            L$19:
01CC  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
01D0  48                                dec             eax
01D1  89 44 24 2C                       mov             dword ptr 0x2c[esp],eax
01D5  85 C0                             test            eax,eax
01D7  7C 15                             jl              L$20
01D9  31 C0                             xor             eax,eax
01DB  8A 44 24 3E                       mov             al,byte ptr 0x3e[esp]
01DF  50                                push            eax
01E0  8D 44 24 2C                       lea             eax,0x2c[esp]
01E4  50                                push            eax
01E5  FF 54 24 4C                       call            dword ptr 0x4c[esp]
01E9  83 C4 08                          add             esp,0x00000008
01EC  EB DE                             jmp             L$19
01EE                            L$20:
01EE  8A 54 24 3D                       mov             dl,byte ptr 0x3d[esp]
01F2  80 FA 73                          cmp             dl,0x73
01F5  74 05                             je              L$21
01F7  80 FA 53                          cmp             dl,0x53
01FA  75 51                             jne             L$24
01FC                            L$21:
01FC  F6 44 24 3C 20                    test            byte ptr 0x3c[esp],0x20
0201  74 26                             je              L$23
0203                            L$22:
0203  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0207  8D 50 FF                          lea             edx,-0x1[eax]
020A  89 54 24 30                       mov             dword ptr 0x30[esp],edx
020E  85 C0                             test            eax,eax
0210  74 5F                             je              L$25
0212  31 C0                             xor             eax,eax
0214  26 8A 06                          mov             al,byte ptr es:[esi]
0217  50                                push            eax
0218  8D 44 24 2C                       lea             eax,0x2c[esp]
021C  50                                push            eax
021D  83 C6 02                          add             esi,0x00000002
0220  FF 54 24 4C                       call            dword ptr 0x4c[esp]
0224  83 C4 08                          add             esp,0x00000008
0227  EB DA                             jmp             L$22
0229                            L$23:
0229  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
022D  8D 68 FF                          lea             ebp,-0x1[eax]
0230  89 6C 24 30                       mov             dword ptr 0x30[esp],ebp
0234  85 C0                             test            eax,eax
0236  74 39                             je              L$25
0238  31 C0                             xor             eax,eax
023A  26 8A 06                          mov             al,byte ptr es:[esi]
023D  50                                push            eax
023E  8D 44 24 2C                       lea             eax,0x2c[esp]
0242  50                                push            eax
0243  46                                inc             esi
0244  FF 54 24 4C                       call            dword ptr 0x4c[esp]
0248  83 C4 08                          add             esp,0x00000008
024B  EB DC                             jmp             L$23
024D                            L$24:
024D  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0251  8D 48 FF                          lea             ecx,-0x1[eax]
0254  89 4C 24 30                       mov             dword ptr 0x30[esp],ecx
0258  85 C0                             test            eax,eax
025A  74 15                             je              L$25
025C  31 C0                             xor             eax,eax
025E  26 8A 06                          mov             al,byte ptr es:[esi]
0261  50                                push            eax
0262  8D 44 24 2C                       lea             eax,0x2c[esp]
0266  50                                push            eax
0267  46                                inc             esi
0268  FF 54 24 4C                       call            dword ptr 0x4c[esp]
026C  83 C4 08                          add             esp,0x00000008
026F  EB DC                             jmp             L$24
0271                            L$25:
0271  F6 44 24 3C 08                    test            byte ptr 0x3c[esp],0x08
0276  0F 84 22 FE FF FF                 je              L$6
027C  83 7C 24 2C 00                    cmp             dword ptr 0x2c[esp],0x00000000
0281  0F 8E 17 FE FF FF                 jle             L$6
0287                            L$26:
0287  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
028B  8D 70 FF                          lea             esi,-0x1[eax]
028E  89 74 24 2C                       mov             dword ptr 0x2c[esp],esi
0292  85 C0                             test            eax,eax
0294  0F 84 04 FE FF FF                 je              L$6
029A  6A 20                             push            0x00000020
029C  8D 44 24 2C                       lea             eax,0x2c[esp]
02A0  50                                push            eax
02A1  FF 54 24 4C                       call            dword ptr 0x4c[esp]
02A5  83 C4 08                          add             esp,0x00000008
02A8  EB DD                             jmp             L$26
02AA                            L$27:
02AA  8B 44 24 38                       mov             eax,dword ptr 0x38[esp]
02AE  83 C4 4C                          add             esp,0x0000004c
02B1                            L$28:
02B1  5D                                pop             ebp
02B2                            L$29:
02B2  07                                pop             es
02B3  5F                                pop             edi
02B4  5E                                pop             esi
02B5  5B                                pop             ebx
02B6  C3                                ret
02B7                            getprintspecs:
02B7  53                                push            ebx
02B8  56                                push            esi
02B9  57                                push            edi
02BA  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
02BE  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
02C2  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
02C6  53                                push            ebx
02C7  C6 43 17 00                       mov             byte ptr 0x17[ebx],0x00
02CB  50                                push            eax
02CC  C6 43 16 20                       mov             byte ptr 0x16[ebx],0x20
02D0  E8 00 00 00 00                    call            evalflags
02D5  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
02DC  89 C2                             mov             edx,eax
02DE  8A 08                             mov             cl,byte ptr [eax]
02E0  83 C4 08                          add             esp,0x00000008
02E3  80 F9 30                          cmp             cl,0x30
02E6  72 24                             jb              L$31
02E8  80 F9 39                          cmp             cl,0x39
02EB  77 1F                             ja              L$31
02ED                            L$30:
02ED  6B 4B 04 0A                       imul            ecx,dword ptr 0x4[ebx],0x0000000a
02F1  31 D2                             xor             edx,edx
02F3  8A 10                             mov             dl,byte ptr [eax]
02F5  83 EA 30                          sub             edx,0x00000030
02F8  01 D1                             add             ecx,edx
02FA  40                                inc             eax
02FB  89 4B 04                          mov             dword ptr 0x4[ebx],ecx
02FE  8A 08                             mov             cl,byte ptr [eax]
0300  80 F9 30                          cmp             cl,0x30
0303  72 2E                             jb              L$33
0305  80 F9 39                          cmp             cl,0x39
0308  76 E3                             jbe             L$30
030A  EB 27                             jmp             L$33
030C                            L$31:
030C  80 38 2A                          cmp             byte ptr [eax],0x2a
030F  75 22                             jne             L$33
0311  8B 16                             mov             edx,dword ptr [esi]
0313  83 C2 04                          add             edx,0x00000004
0316  89 16                             mov             dword ptr [esi],edx
0318  8B 52 FC                          mov             edx,dword ptr -0x4[edx]
031B  89 53 04                          mov             dword ptr 0x4[ebx],edx
031E  85 D2                             test            edx,edx
0320  7D 10                             jge             L$32
0322  89 D7                             mov             edi,edx
0324  8A 73 14                          mov             dh,byte ptr 0x14[ebx]
0327  F7 DF                             neg             edi
0329  80 CE 08                          or              dh,0x08
032C  89 7B 04                          mov             dword ptr 0x4[ebx],edi
032F  88 73 14                          mov             byte ptr 0x14[ebx],dh
0332                            L$32:
0332  40                                inc             eax
0333                            L$33:
0333  C7 43 08 FF FF FF FF              mov             dword ptr 0x8[ebx],0xffffffff
033A  80 38 2E                          cmp             byte ptr [eax],0x2e
033D  75 47                             jne             L$36
033F  40                                inc             eax
0340  C7 43 08 00 00 00 00              mov             dword ptr 0x8[ebx],0x00000000
0347  80 38 2A                          cmp             byte ptr [eax],0x2a
034A  75 1B                             jne             L$35
034C  8B 16                             mov             edx,dword ptr [esi]
034E  83 C2 04                          add             edx,0x00000004
0351  89 16                             mov             dword ptr [esi],edx
0353  8B 52 FC                          mov             edx,dword ptr -0x4[edx]
0356  89 53 08                          mov             dword ptr 0x8[ebx],edx
0359  85 D2                             test            edx,edx
035B  7D 07                             jge             L$34
035D  C7 43 08 FF FF FF FF              mov             dword ptr 0x8[ebx],0xffffffff
0364                            L$34:
0364  40                                inc             eax
0365  EB 1F                             jmp             L$36
0367                            L$35:
0367  8A 08                             mov             cl,byte ptr [eax]
0369  80 F9 30                          cmp             cl,0x30
036C  72 18                             jb              L$36
036E  80 F9 39                          cmp             cl,0x39
0371  77 13                             ja              L$36
0373  6B 4B 08 0A                       imul            ecx,dword ptr 0x8[ebx],0x0000000a
0377  31 D2                             xor             edx,edx
0379  8A 10                             mov             dl,byte ptr [eax]
037B  83 EA 30                          sub             edx,0x00000030
037E  01 D1                             add             ecx,edx
0380  40                                inc             eax
0381  89 4B 08                          mov             dword ptr 0x8[ebx],ecx
0384  EB E1                             jmp             L$35
0386                            L$36:
0386  8A 08                             mov             cl,byte ptr [eax]
0388  8D 50 01                          lea             edx,0x1[eax]
038B  80 F9 4E                          cmp             cl,0x4e
038E  72 1B                             jb              L$38
0390  76 56                             jbe             L$44
0392  80 F9 6C                          cmp             cl,0x6c
0395  72 0B                             jb              L$37
0397  76 22                             jbe             L$39
0399  80 F9 77                          cmp             cl,0x77
039C  74 1D                             je              L$39
039E  5F                                pop             edi
039F  5E                                pop             esi
03A0  5B                                pop             ebx
03A1  C3                                ret
03A2                            L$37:
03A2  80 F9 68                          cmp             cl,0x68
03A5  74 22                             je              L$40
03A7  5F                                pop             edi
03A8  5E                                pop             esi
03A9  5B                                pop             ebx
03AA  C3                                ret
03AB                            L$38:
03AB  80 F9 46                          cmp             cl,0x46
03AE  72 43                             jb              L$45
03B0  76 30                             jbe             L$43
03B2  80 F9 4C                          cmp             cl,0x4c
03B5  74 21                             je              L$41
03B7  5F                                pop             edi
03B8  5E                                pop             esi
03B9  5B                                pop             ebx
03BA  C3                                ret
03BB                            L$39:
03BB  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
03BE  80 CA 20                          or              dl,0x20
03C1  40                                inc             eax
03C2  88 53 14                          mov             byte ptr 0x14[ebx],dl
03C5  5F                                pop             edi
03C6  5E                                pop             esi
03C7  5B                                pop             ebx
03C8  C3                                ret
03C9                            L$40:
03C9  8A 4B 14                          mov             cl,byte ptr 0x14[ebx]
03CC  80 C9 10                          or              cl,0x10
03CF  89 D0                             mov             eax,edx
03D1  88 4B 14                          mov             byte ptr 0x14[ebx],cl
03D4  5F                                pop             edi
03D5  5E                                pop             esi
03D6  5B                                pop             ebx
03D7  C3                                ret
03D8                            L$41:
03D8  80 4B 14 40                       or              byte ptr 0x14[ebx],0x40
03DC                            L$42:
03DC  89 D0                             mov             eax,edx
03DE  5F                                pop             edi
03DF  5E                                pop             esi
03E0  5B                                pop             ebx
03E1  C3                                ret
03E2                            L$43:
03E2  80 4B 14 80                       or              byte ptr 0x14[ebx],0x80
03E6  EB F4                             jmp             L$42
03E8                            L$44:
03E8  8A 6B 14                          mov             ch,byte ptr 0x14[ebx]
03EB  80 CD 40                          or              ch,0x40
03EE  89 D0                             mov             eax,edx
03F0  88 6B 14                          mov             byte ptr 0x14[ebx],ch
03F3                            L$45:
03F3  5F                                pop             edi
03F4  5E                                pop             esi
03F5  5B                                pop             ebx
03F6  C3                                ret
03F7                            evalflags:
03F7  53                                push            ebx
03F8  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
03FC  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0400  C6 40 14 00                       mov             byte ptr 0x14[eax],0x00
0404                            L$46:
0404  8A 1A                             mov             bl,byte ptr [edx]
0406  80 FB 2D                          cmp             bl,0x2d
0409  75 06                             jne             L$47
040B  80 48 14 08                       or              byte ptr 0x14[eax],0x08
040F  EB 42                             jmp             L$51
0411                            L$47:
0411  80 FB 23                          cmp             bl,0x23
0414  75 06                             jne             L$48
0416  80 48 14 01                       or              byte ptr 0x14[eax],0x01
041A  EB 37                             jmp             L$51
041C                            L$48:
041C  80 FB 2B                          cmp             bl,0x2b
041F  75 13                             jne             L$49
0421  8A 68 14                          mov             ch,byte ptr 0x14[eax]
0424  80 CD 04                          or              ch,0x04
0427  88 EB                             mov             bl,ch
0429  88 68 14                          mov             byte ptr 0x14[eax],ch
042C  80 E3 FD                          and             bl,0xfd
042F  88 58 14                          mov             byte ptr 0x14[eax],bl
0432  EB 1F                             jmp             L$51
0434                            L$49:
0434  80 FB 20                          cmp             bl,0x20
0437  75 12                             jne             L$50
0439  8A 78 14                          mov             bh,byte ptr 0x14[eax]
043C  F6 C7 04                          test            bh,0x04
043F  75 12                             jne             L$51
0441  88 F9                             mov             cl,bh
0443  80 C9 02                          or              cl,0x02
0446  88 48 14                          mov             byte ptr 0x14[eax],cl
0449  EB 08                             jmp             L$51
044B                            L$50:
044B  80 FB 30                          cmp             bl,0x30
044E  75 06                             jne             L$52
0450  88 58 16                          mov             byte ptr 0x16[eax],bl
0453                            L$51:
0453  42                                inc             edx
0454  EB AE                             jmp             L$46
0456                            L$52:
0456  89 D0                             mov             eax,edx
0458  5B                                pop             ebx
0459  C3                                ret
045A                            far_strlen:
045A  53                                push            ebx
045B  56                                push            esi
045C  06                                push            es
045D  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0461  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0465  8E 44 24 14                       mov             es,dword ptr 0x14[esp]
0469  31 C0                             xor             eax,eax
046B                            L$53:
046B  89 DA                             mov             edx,ebx
046D  26 8A 0A                          mov             cl,byte ptr es:[edx]
0470  43                                inc             ebx
0471  84 C9                             test            cl,cl
0473  74 07                             je              L$54
0475  39 F0                             cmp             eax,esi
0477  74 03                             je              L$54
0479  40                                inc             eax
047A  EB EF                             jmp             L$53
047C                            L$54:
047C  07                                pop             es
047D  5E                                pop             esi
047E  5B                                pop             ebx
047F  C3                                ret
0480                            far_other_strlen:
0480  53                                push            ebx
0481  56                                push            esi
0482  57                                push            edi
0483  06                                push            es
0484  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0488  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
048C  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0490  31 C0                             xor             eax,eax
0492                            L$55:
0492  8E C1                             mov             es,ecx
0494  89 D3                             mov             ebx,edx
0496  66 26 8B 3B                       mov             di,word ptr es:[ebx]
049A  83 C2 02                          add             edx,0x00000002
049D  66 85 FF                          test            di,di
04A0  0F 84 0C FE FF FF                 je              L$29
04A6  39 F0                             cmp             eax,esi
04A8  0F 84 04 FE FF FF                 je              L$29
04AE  40                                inc             eax
04AF  EB E1                             jmp             L$55
04B1                            fmt4hex:
04B1  53                                push            ebx
04B2  56                                push            esi
04B3  57                                push            edi
04B4  55                                push            ebp
04B5  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
04B9  6A 10                             push            0x00000010
04BB  55                                push            ebp
04BC  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
04C0  52                                push            edx
04C1  E8 00 00 00 00                    call            itoa
04C6  83 C4 0C                          add             esp,0x0000000c
04C9  89 EF                             mov             edi,ebp
04CB  06                                push            es
04CC  8C D8                             mov             eax,ds
04CE  8E C0                             mov             es,eax
04D0  29 C9                             sub             ecx,ecx
04D2  49                                dec             ecx
04D3  31 C0                             xor             eax,eax
04D5  F2 AE                             repne scasb
04D7  F7 D1                             not             ecx
04D9  49                                dec             ecx
04DA  07                                pop             es
04DB  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
04DF  89 CE                             mov             esi,ecx
04E1  89 EF                             mov             edi,ebp
04E3  48                                dec             eax
04E4  8D 14 29                          lea             edx,[ecx+ebp]
04E7  8D 1C 28                          lea             ebx,[eax+ebp]
04EA  EB 08                             jmp             L$57
04EC                            L$56:
04EC  4A                                dec             edx
04ED  4E                                dec             esi
04EE  8A 0A                             mov             cl,byte ptr [edx]
04F0  48                                dec             eax
04F1  88 0B                             mov             byte ptr [ebx],cl
04F3  4B                                dec             ebx
04F4                            L$57:
04F4  39 FA                             cmp             edx,edi
04F6  75 F4                             jne             L$56
04F8  8D 14 28                          lea             edx,[eax+ebp]
04FB                            L$58:
04FB  85 C0                             test            eax,eax
04FD  7C 07                             jl              L$59
04FF  48                                dec             eax
0500  C6 02 30                          mov             byte ptr [edx],0x30
0503  4A                                dec             edx
0504  EB F5                             jmp             L$58
0506                            L$59:
0506  03 6C 24 1C                       add             ebp,dword ptr 0x1c[esp]
050A  C6 45 00 00                       mov             byte ptr [ebp],0x00
050E  5D                                pop             ebp
050F  5F                                pop             edi
0510  5E                                pop             esi
0511  5B                                pop             ebx
0512  C3                                ret
0513                            FixedPoint_Format:
0513  53                                push            ebx
0514  56                                push            esi
0515  57                                push            edi
0516  83 EC 04                          sub             esp,0x00000004
0519  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
051D  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
0521  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0525  89 04 24                          mov             dword ptr [esp],eax
0528  85 C0                             test            eax,eax
052A  7D 0B                             jge             L$60
052C  89 C2                             mov             edx,eax
052E  C6 03 2D                          mov             byte ptr [ebx],0x2d
0531  F7 DA                             neg             edx
0533  43                                inc             ebx
0534  89 14 24                          mov             dword ptr [esp],edx
0537                            L$60:
0537  83 7E 08 FF                       cmp             dword ptr 0x8[esi],0xffffffff
053B  75 07                             jne             L$61
053D  C7 46 08 04 00 00 00              mov             dword ptr 0x8[esi],0x00000004
0544                            L$61:
0544  6A 0A                             push            0x0000000a
0546  31 C0                             xor             eax,eax
0548  53                                push            ebx
0549  66 8B 44 24 0A                    mov             ax,word ptr 0xa[esp]
054E  50                                push            eax
054F  E8 00 00 00 00                    call            itoa
0554  83 C4 0C                          add             esp,0x0000000c
0557  89 D9                             mov             ecx,ebx
0559                            L$62:
0559  8A 23                             mov             ah,byte ptr [ebx]
055B  8D 53 01                          lea             edx,0x1[ebx]
055E  84 E4                             test            ah,ah
0560  74 04                             je              L$63
0562  89 D3                             mov             ebx,edx
0564  EB F3                             jmp             L$62
0566                            L$63:
0566  83 7E 08 00                       cmp             dword ptr 0x8[esi],0x00000000
056A  74 2C                             je              L$66
056C  C6 03 2E                          mov             byte ptr [ebx],0x2e
056F  31 C0                             xor             eax,eax
0571  89 D3                             mov             ebx,edx
0573  EB 1B                             jmp             L$65
0575                            L$64:
0575  31 D2                             xor             edx,edx
0577  66 89 54 24 02                    mov             word ptr 0x2[esp],dx
057C  8B 3C 24                          mov             edi,dword ptr [esp]
057F  6B D7 0A                          imul            edx,edi,0x0000000a
0582  89 14 24                          mov             dword ptr [esp],edx
0585  8A 54 24 02                       mov             dl,byte ptr 0x2[esp]
0589  80 C2 30                          add             dl,0x30
058C  40                                inc             eax
058D  88 13                             mov             byte ptr [ebx],dl
058F  43                                inc             ebx
0590                            L$65:
0590  3B 46 08                          cmp             eax,dword ptr 0x8[esi]
0593  7C E0                             jl              L$64
0595  C6 03 00                          mov             byte ptr [ebx],0x00
0598                            L$66:
0598  F6 44 24 01 80                    test            byte ptr 0x1[esp],0x80
059D  74 50                             je              L$75
059F                            L$67:
059F  39 CB                             cmp             ebx,ecx
05A1  75 32                             jne             L$72
05A3  8D 59 01                          lea             ebx,0x1[ecx]
05A6  C6 01 31                          mov             byte ptr [ecx],0x31
05A9                            L$68:
05A9  8A 13                             mov             dl,byte ptr [ebx]
05AB  8D 43 01                          lea             eax,0x1[ebx]
05AE  80 FA 30                          cmp             dl,0x30
05B1  75 04                             jne             L$69
05B3  89 C3                             mov             ebx,eax
05B5  EB F2                             jmp             L$68
05B7                            L$69:
05B7  80 FA 2E                          cmp             dl,0x2e
05BA  75 10                             jne             L$71
05BC  C6 03 30                          mov             byte ptr [ebx],0x30
05BF  8D 58 01                          lea             ebx,0x1[eax]
05C2  88 10                             mov             byte ptr [eax],dl
05C4                            L$70:
05C4  80 3B 30                          cmp             byte ptr [ebx],0x30
05C7  75 03                             jne             L$71
05C9  43                                inc             ebx
05CA  EB F8                             jmp             L$70
05CC                            L$71:
05CC  C6 03 30                          mov             byte ptr [ebx],0x30
05CF  43                                inc             ebx
05D0  C6 03 00                          mov             byte ptr [ebx],0x00
05D3  EB 1A                             jmp             L$75
05D5                            L$72:
05D5  4B                                dec             ebx
05D6  80 3B 2E                          cmp             byte ptr [ebx],0x2e
05D9  75 01                             jne             L$73
05DB  4B                                dec             ebx
05DC                            L$73:
05DC  8A 03                             mov             al,byte ptr [ebx]
05DE  3C 39                             cmp             al,0x39
05E0  74 08                             je              L$74
05E2  88 C4                             mov             ah,al
05E4  FE C4                             inc             ah
05E6  88 23                             mov             byte ptr [ebx],ah
05E8  EB 05                             jmp             L$75
05EA                            L$74:
05EA  C6 03 30                          mov             byte ptr [ebx],0x30
05ED  EB B0                             jmp             L$67
05EF                            L$75:
05EF  83 C4 04                          add             esp,0x00000004
05F2  5F                                pop             edi
05F3  5E                                pop             esi
05F4  5B                                pop             ebx
05F5  C3                                ret
05F6                            float_format:
05F6  53                                push            ebx
05F7  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
05FB  52                                push            edx
05FC  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0600  53                                push            ebx
0601  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0605  51                                push            ecx
0606  FF 15 00 00 00 00                 call            dword ptr __EFG_printf
060C  83 C4 0C                          add             esp,0x0000000c
060F                            L$76:
060F  5B                                pop             ebx
0610  C3                                ret
0611                            formstring:
0611  53                                push            ebx
0612  56                                push            esi
0613  57                                push            edi
0614  06                                push            es
0615  55                                push            ebp
0616  83 EC 08                          sub             esp,0x00000008
0619  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
061D  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
0621  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
0625  BA 01 00 00 00                    mov             edx,0x00000001
062A  8C 5C 24 04                       mov             dword ptr 0x4[esp],ds
062E  89 FE                             mov             esi,edi
0630  89 14 24                          mov             dword ptr [esp],edx
0633  8A 53 15                          mov             dl,byte ptr 0x15[ebx]
0636  C7 43 0C 00 00 00 00              mov             dword ptr 0xc[ebx],0x00000000
063D  80 FA 69                          cmp             dl,0x69
0640  72 19                             jb              L$79
0642  0F 86 55 00 00 00                 jbe             L$84
0648  80 FA 75                          cmp             dl,0x75
064B  72 09                             jb              L$78
064D  76 1A                             jbe             L$80
064F  80 FA 78                          cmp             dl,0x78
0652                            L$77:
0652  74 15                             je              L$80
0654  EB 51                             jmp             L$85
0656                            L$78:
0656  80 FA 6F                          cmp             dl,0x6f
0659  EB F7                             jmp             L$77
065B                            L$79:
065B  80 FA 58                          cmp             dl,0x58
065E  72 47                             jb              L$85
0660  76 07                             jbe             L$80
0662  80 FA 64                          cmp             dl,0x64
0665  74 36                             je              L$84
0667  EB 3E                             jmp             L$85
0669                            L$80:
0669  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
066C  F6 C2 20                          test            dl,0x20
066F  74 0C                             je              L$81
0671  8B 10                             mov             edx,dword ptr [eax]
0673  83 C2 04                          add             edx,0x00000004
0676  89 10                             mov             dword ptr [eax],edx
0678  8B 6A FC                          mov             ebp,dword ptr -0x4[edx]
067B  EB 1C                             jmp             L$83
067D                            L$81:
067D  F6 C2 10                          test            dl,0x10
0680  74 0D                             je              L$82
0682  8B 28                             mov             ebp,dword ptr [eax]
0684  83 C5 04                          add             ebp,0x00000004
0687  89 28                             mov             dword ptr [eax],ebp
0689  0F B7 6D FC                       movzx           ebp,word ptr -0x4[ebp]
068D  EB 0A                             jmp             L$83
068F                            L$82:
068F  8B 08                             mov             ecx,dword ptr [eax]
0691  83 C1 04                          add             ecx,0x00000004
0694  89 08                             mov             dword ptr [eax],ecx
0696  8B 69 FC                          mov             ebp,dword ptr -0x4[ecx]
0699                            L$83:
0699  80 63 14 F9                       and             byte ptr 0x14[ebx],0xf9
069D                            L$84:
069D  83 7B 08 FF                       cmp             dword ptr 0x8[ebx],0xffffffff
06A1  74 04                             je              L$85
06A3  C6 43 16 20                       mov             byte ptr 0x16[ebx],0x20
06A7                            L$85:
06A7  8A 53 15                          mov             dl,byte ptr 0x15[ebx]
06AA  B9 0A 00 00 00                    mov             ecx,0x0000000a
06AF  80 FA 65                          cmp             dl,0x65
06B2  72 60                             jb              L$88
06B4  0F 86 D9 00 00 00                 jbe             L$94
06BA  80 FA 6F                          cmp             dl,0x6f
06BD  72 3C                             jb              L$87
06BF  0F 86 ED 00 00 00                 jbe             L$95
06C5  80 FA 73                          cmp             dl,0x73
06C8  72 23                             jb              L$86
06CA  0F 86 75 01 00 00                 jbe             L$108
06D0  80 FA 75                          cmp             dl,0x75
06D3  0F 82 10 03 00 00                 jb              L$127
06D9  0F 86 3B 02 00 00                 jbe             L$120
06DF  80 FA 78                          cmp             dl,0x78
06E2  0F 84 15 02 00 00                 je              L$118
06E8  E9 FC 02 00 00                    jmp             L$127
06ED                            L$86:
06ED  80 FA 70                          cmp             dl,0x70
06F0  0F 84 49 02 00 00                 je              L$121
06F6  E9 EE 02 00 00                    jmp             L$127
06FB                            L$87:
06FB  80 FA 67                          cmp             dl,0x67
06FE  72 62                             jb              L$93
0700  0F 86 8D 00 00 00                 jbe             L$94
0706  80 FA 69                          cmp             dl,0x69
0709  0F 84 C6 00 00 00                 je              L$97
070F  E9 D5 02 00 00                    jmp             L$127
0714                            L$88:
0714  80 FA 50                          cmp             dl,0x50
0717  72 33                             jb              L$90
0719  0F 86 20 02 00 00                 jbe             L$121
071F  80 FA 58                          cmp             dl,0x58
0722  72 1A                             jb              L$89
0724  0F 86 D3 01 00 00                 jbe             L$118
072A  80 FA 63                          cmp             dl,0x63
072D  0F 82 B6 02 00 00                 jb              L$127
0733  0F 86 84 02 00 00                 jbe             L$126
0739  E9 97 00 00 00                    jmp             L$97
073E                            L$89:
073E  80 FA 53                          cmp             dl,0x53
0741  0F 84 FE 00 00 00                 je              L$108
0747  E9 9D 02 00 00                    jmp             L$127
074C                            L$90:
074C  80 FA 46                          cmp             dl,0x46
074F  72 0C                             jb              L$92
0751  76 0F                             jbe             L$93
0753  80 FA 47                          cmp             dl,0x47
0756                            L$91:
0756  74 3B                             je              L$94
0758  E9 8C 02 00 00                    jmp             L$127
075D                            L$92:
075D  80 FA 45                          cmp             dl,0x45
0760  EB F4                             jmp             L$91
0762                            L$93:
0762  F6 43 14 10                       test            byte ptr 0x14[ebx],0x10
0766  74 2B                             je              L$94
0768  8B 10                             mov             edx,dword ptr [eax]
076A  83 C2 04                          add             edx,0x00000004
076D  89 10                             mov             dword ptr [eax],edx
076F  53                                push            ebx
0770  8B 42 FC                          mov             eax,dword ptr -0x4[edx]
0773  50                                push            eax
0774  57                                push            edi
0775  E8 00 00 00 00                    call            FixedPoint_Format
077A  83 C4 0C                          add             esp,0x0000000c
077D  31 C0                             xor             eax,eax
077F  8C 5C 24 04                       mov             dword ptr 0x4[esp],ds
0783  6A FF                             push            0xffffffff
0785  66 8B 44 24 08                    mov             ax,word ptr 0x8[esp]
078A  50                                push            eax
078B  57                                push            edi
078C  89 FE                             mov             esi,edi
078E  E9 A5 00 00 00                    jmp             L$106
0793                            L$94:
0793  53                                push            ebx
0794  50                                push            eax
0795  57                                push            edi
0796  E8 00 00 00 00                    call            float_format
079B  83 C4 0C                          add             esp,0x0000000c
079E  31 C9                             xor             ecx,ecx
07A0  6A FF                             push            0xffffffff
07A2  66 89 D1                          mov             cx,dx
07A5  51                                push            ecx
07A6  50                                push            eax
07A7  89 C6                             mov             esi,eax
07A9  89 54 24 10                       mov             dword ptr 0x10[esp],edx
07AD  E9 86 00 00 00                    jmp             L$106
07B2                            L$95:
07B2  8A 6B 14                          mov             ch,byte ptr 0x14[ebx]
07B5  B8 08 00 00 00                    mov             eax,0x00000008
07BA  F6 C5 01                          test            ch,0x01
07BD  74 04                             je              L$96
07BF  C6 07 30                          mov             byte ptr [edi],0x30
07C2  47                                inc             edi
07C3                            L$96:
07C3  50                                push            eax
07C4  57                                push            edi
07C5  55                                push            ebp
07C6  E8 00 00 00 00                    call            ltoa
07CB  8B 6B 08                          mov             ebp,dword ptr 0x8[ebx]
07CE  83 C4 0C                          add             esp,0x0000000c
07D1  85 ED                             test            ebp,ebp
07D3  EB 49                             jmp             L$103
07D5                            L$97:
07D5  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
07D8  F6 C2 20                          test            dl,0x20
07DB  74 14                             je              L$99
07DD  8B 10                             mov             edx,dword ptr [eax]
07DF  83 C2 04                          add             edx,0x00000004
07E2  51                                push            ecx
07E3  89 10                             mov             dword ptr [eax],edx
07E5  57                                push            edi
07E6  8B 42 FC                          mov             eax,dword ptr -0x4[edx]
07E9                            L$98:
07E9  50                                push            eax
07EA  E8 00 00 00 00                    call            ltoa
07EF  EB 26                             jmp             L$101
07F1                            L$99:
07F1  F6 C2 10                          test            dl,0x10
07F4  74 0F                             je              L$100
07F6  8B 28                             mov             ebp,dword ptr [eax]
07F8  83 C5 04                          add             ebp,0x00000004
07FB  51                                push            ecx
07FC  89 28                             mov             dword ptr [eax],ebp
07FE  57                                push            edi
07FF  0F BF 45 FC                       movsx           eax,word ptr -0x4[ebp]
0803  EB E4                             jmp             L$98
0805                            L$100:
0805  8B 10                             mov             edx,dword ptr [eax]
0807  83 C2 04                          add             edx,0x00000004
080A  51                                push            ecx
080B  89 10                             mov             dword ptr [eax],edx
080D  57                                push            edi
080E  8B 4A FC                          mov             ecx,dword ptr -0x4[edx]
0811  51                                push            ecx
0812  E8 00 00 00 00                    call            itoa
0817                            L$101:
0817  83 C4 0C                          add             esp,0x0000000c
081A                            L$102:
081A  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
081E                            L$103:
081E  75 0D                             jne             L$104
0820  80 3F 30                          cmp             byte ptr [edi],0x30
0823  75 08                             jne             L$104
0825  8E 44 24 04                       mov             es,dword ptr 0x4[esp]
0829  26 C6 06 00                       mov             byte ptr es:[esi],0x00
082D                            L$104:
082D  31 C0                             xor             eax,eax
082F  6A FF                             push            0xffffffff
0831                            L$105:
0831  66 8B 44 24 08                    mov             ax,word ptr 0x8[esp]
0836  50                                push            eax
0837  56                                push            esi
0838                            L$106:
0838  E8 00 00 00 00                    call            far_strlen
083D                            L$107:
083D  83 C4 0C                          add             esp,0x0000000c
0840  E9 CE 01 00 00                    jmp             L$128
0845                            L$108:
0845  8A 73 14                          mov             dh,byte ptr 0x14[ebx]
0848  F6 C6 80                          test            dh,0x80
084B  74 23                             je              L$111
084D  8B 38                             mov             edi,dword ptr [eax]
084F  83 C7 08                          add             edi,0x00000008
0852  89 38                             mov             dword ptr [eax],edi
0854  8B 77 F8                          mov             esi,dword ptr -0x8[edi]
0857  66 8B 57 FC                       mov             dx,word ptr -0x4[edi]
085B  85 F6                             test            esi,esi
085D  75 05                             jne             L$109
085F  66 85 D2                          test            dx,dx
0862  74 06                             je              L$110
0864                            L$109:
0864  89 54 24 04                       mov             dword ptr 0x4[esp],edx
0868  EB 31                             jmp             L$114
086A                            L$110:
086A  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
086E  EB 27                             jmp             L$113
0870                            L$111:
0870  F6 C6 40                          test            dh,0x40
0873  74 10                             je              L$112
0875  8B 30                             mov             esi,dword ptr [eax]
0877  83 C6 04                          add             esi,0x00000004
087A  89 30                             mov             dword ptr [eax],esi
087C  8B 76 FC                          mov             esi,dword ptr -0x4[esi]
087F  85 F6                             test            esi,esi
0881  75 14                             jne             L$113
0883  EB E5                             jmp             L$110
0885                            L$112:
0885  8B 08                             mov             ecx,dword ptr [eax]
0887  83 C1 04                          add             ecx,0x00000004
088A  89 08                             mov             dword ptr [eax],ecx
088C  8B 71 FC                          mov             esi,dword ptr -0x4[ecx]
088F  85 F6                             test            esi,esi
0891  75 04                             jne             L$113
0893  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
0897                            L$113:
0897  8C 5C 24 04                       mov             dword ptr 0x4[esp],ds
089B                            L$114:
089B  8A 6B 14                          mov             ch,byte ptr 0x14[ebx]
089E  8A 43 15                          mov             al,byte ptr 0x15[ebx]
08A1  31 ED                             xor             ebp,ebp
08A3  80 E5 F9                          and             ch,0xf9
08A6  89 2C 24                          mov             dword ptr [esp],ebp
08A9  88 6B 14                          mov             byte ptr 0x14[ebx],ch
08AC  3C 53                             cmp             al,0x53
08AE  75 26                             jne             L$116
08B0  F6 C5 20                          test            ch,0x20
08B3  74 12                             je              L$115
08B5  8E 44 24 04                       mov             es,dword ptr 0x4[esp]
08B9  31 C0                             xor             eax,eax
08BB  66 26 8B 06                       mov             ax,word ptr es:[esi]
08BF  83 C6 02                          add             esi,0x00000002
08C2  E9 4C 01 00 00                    jmp             L$128
08C7                            L$115:
08C7  8E 44 24 04                       mov             es,dword ptr 0x4[esp]
08CB  31 C0                             xor             eax,eax
08CD  26 8A 06                          mov             al,byte ptr es:[esi]
08D0  46                                inc             esi
08D1  E9 3D 01 00 00                    jmp             L$128
08D6                            L$116:
08D6  F6 C5 20                          test            ch,0x20
08D9  74 17                             je              L$117
08DB  8B 53 08                          mov             edx,dword ptr 0x8[ebx]
08DE  31 C0                             xor             eax,eax
08E0  52                                push            edx
08E1  66 8B 44 24 08                    mov             ax,word ptr 0x8[esp]
08E6  50                                push            eax
08E7  56                                push            esi
08E8  E8 00 00 00 00                    call            far_other_strlen
08ED  E9 4B FF FF FF                    jmp             L$107
08F2                            L$117:
08F2  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
08F5  50                                push            eax
08F6  31 C0                             xor             eax,eax
08F8  E9 34 FF FF FF                    jmp             L$105
08FD                            L$118:
08FD  F6 43 14 01                       test            byte ptr 0x14[ebx],0x01
0901  74 12                             je              L$119
0903  85 ED                             test            ebp,ebp
0905  74 0E                             je              L$119
0907  C6 43 17 30                       mov             byte ptr 0x17[ebx],0x30
090B  8A 43 15                          mov             al,byte ptr 0x15[ebx]
090E  C6 43 19 00                       mov             byte ptr 0x19[ebx],0x00
0912  88 43 18                          mov             byte ptr 0x18[ebx],al
0915                            L$119:
0915  B9 10 00 00 00                    mov             ecx,0x00000010
091A                            L$120:
091A  51                                push            ecx
091B  57                                push            edi
091C  55                                push            ebp
091D  E8 00 00 00 00                    call            ultoa
0922  8A 63 15                          mov             ah,byte ptr 0x15[ebx]
0925  83 C4 0C                          add             esp,0x0000000c
0928  80 FC 58                          cmp             ah,0x58
092B  0F 85 E9 FE FF FF                 jne             L$102
0931  57                                push            edi
0932  E8 00 00 00 00                    call            zupstr
0937  83 C4 04                          add             esp,0x00000004
093A  E9 DB FE FF FF                    jmp             L$102
093F                            L$121:
093F  83 7B 04 00                       cmp             dword ptr 0x4[ebx],0x00000000
0943  75 16                             jne             L$123
0945  F6 43 14 80                       test            byte ptr 0x14[ebx],0x80
0949  74 09                             je              L$122
094B  C7 43 04 0D 00 00 00              mov             dword ptr 0x4[ebx],0x0000000d
0952  EB 07                             jmp             L$123
0954                            L$122:
0954  C7 43 04 08 00 00 00              mov             dword ptr 0x4[ebx],0x00000008
095B                            L$123:
095B  80 63 14 F9                       and             byte ptr 0x14[ebx],0xf9
095F  8B 28                             mov             ebp,dword ptr [eax]
0961  83 C5 04                          add             ebp,0x00000004
0964  89 28                             mov             dword ptr [eax],ebp
0966  89 E9                             mov             ecx,ebp
0968  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
096B  8B 6D FC                          mov             ebp,dword ptr -0x4[ebp]
096E  F6 C2 80                          test            dl,0x80
0971  74 26                             je              L$124
0973  83 C1 04                          add             ecx,0x00000004
0976  89 08                             mov             dword ptr [eax],ecx
0978  6A 04                             push            0x00000004
097A  8B 41 FC                          mov             eax,dword ptr -0x4[ecx]
097D  57                                push            edi
097E  25 FF FF 00 00                    and             eax,0x0000ffff
0983  50                                push            eax
0984  E8 00 00 00 00                    call            fmt4hex
0989  83 C4 0C                          add             esp,0x0000000c
098C  6A 08                             push            0x00000008
098E  8D 47 05                          lea             eax,0x5[edi]
0991  50                                push            eax
0992  55                                push            ebp
0993  C6 47 04 3A                       mov             byte ptr 0x4[edi],0x3a
0997  EB 04                             jmp             L$125
0999                            L$124:
0999  6A 08                             push            0x00000008
099B  57                                push            edi
099C  55                                push            ebp
099D                            L$125:
099D  E8 00 00 00 00                    call            fmt4hex
09A2  83 C4 0C                          add             esp,0x0000000c
09A5  80 7B 15 50                       cmp             byte ptr 0x15[ebx],0x50
09A9  0F 85 7E FE FF FF                 jne             L$104
09AF  57                                push            edi
09B0  E8 00 00 00 00                    call            zupstr
09B5  83 C4 04                          add             esp,0x00000004
09B8  E9 70 FE FF FF                    jmp             L$104
09BD                            L$126:
09BD  8B 28                             mov             ebp,dword ptr [eax]
09BF  83 C5 04                          add             ebp,0x00000004
09C2  89 28                             mov             dword ptr [eax],ebp
09C4  8A 45 FC                          mov             al,byte ptr -0x4[ebp]
09C7  C6 47 01 00                       mov             byte ptr 0x1[edi],0x00
09CB  88 07                             mov             byte ptr [edi],al
09CD  C7 43 08 01 00 00 00              mov             dword ptr 0x8[ebx],0x00000001
09D4  8A 6B 14                          mov             ch,byte ptr 0x14[ebx]
09D7  31 C0                             xor             eax,eax
09D9  80 E5 F9                          and             ch,0xf9
09DC  89 04 24                          mov             dword ptr [esp],eax
09DF  B8 01 00 00 00                    mov             eax,0x00000001
09E4  88 6B 14                          mov             byte ptr 0x14[ebx],ch
09E7  EB 2A                             jmp             L$128
09E9                            L$127:
09E9  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
09F0  8A 43 15                          mov             al,byte ptr 0x15[ebx]
09F3  C6 47 01 00                       mov             byte ptr 0x1[edi],0x00
09F7  88 07                             mov             byte ptr [edi],al
09F9  8A 6B 14                          mov             ch,byte ptr 0x14[ebx]
09FC  80 E5 F9                          and             ch,0xf9
09FF  B8 01 00 00 00                    mov             eax,0x00000001
0A04  88 6B 14                          mov             byte ptr 0x14[ebx],ch
0A07  31 C9                             xor             ecx,ecx
0A09  C7 43 08 01 00 00 00              mov             dword ptr 0x8[ebx],0x00000001
0A10  89 0C 24                          mov             dword ptr [esp],ecx
0A13                            L$128:
0A13  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
0A17  74 45                             je              L$134
0A19  8E 44 24 04                       mov             es,dword ptr 0x4[esp]
0A1D  26 8A 16                          mov             dl,byte ptr es:[esi]
0A20  80 FA 2D                          cmp             dl,0x2d
0A23  75 0B                             jne             L$129
0A25  46                                inc             esi
0A26  C6 43 18 00                       mov             byte ptr 0x18[ebx],0x00
0A2A  48                                dec             eax
0A2B  88 53 17                          mov             byte ptr 0x17[ebx],dl
0A2E  EB 1B                             jmp             L$132
0A30                            L$129:
0A30  8A 73 14                          mov             dh,byte ptr 0x14[ebx]
0A33  F6 C6 02                          test            dh,0x02
0A36  74 06                             je              L$130
0A38  C6 43 17 20                       mov             byte ptr 0x17[ebx],0x20
0A3C  EB 09                             jmp             L$131
0A3E                            L$130:
0A3E  F6 C6 04                          test            dh,0x04
0A41  74 08                             je              L$132
0A43  C6 43 17 2B                       mov             byte ptr 0x17[ebx],0x2b
0A47                            L$131:
0A47  C6 43 18 00                       mov             byte ptr 0x18[ebx],0x00
0A4B                            L$132:
0A4B  8B 6B 08                          mov             ebp,dword ptr 0x8[ebx]
0A4E  39 E8                             cmp             eax,ebp
0A50  7E 05                             jle             L$133
0A52  89 43 08                          mov             dword ptr 0x8[ebx],eax
0A55  EB 07                             jmp             L$134
0A57                            L$133:
0A57  89 E9                             mov             ecx,ebp
0A59  29 C1                             sub             ecx,eax
0A5B  89 4B 0C                          mov             dword ptr 0xc[ebx],ecx
0A5E                            L$134:
0A5E  80 7B 16 2A                       cmp             byte ptr 0x16[ebx],0x2a
0A62  75 0D                             jne             L$135
0A64  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
0A67  C6 43 17 00                       mov             byte ptr 0x17[ebx],0x00
0A6B  80 E2 F9                          and             dl,0xf9
0A6E  88 53 14                          mov             byte ptr 0x14[ebx],dl
0A71                            L$135:
0A71  8B 53 08                          mov             edx,dword ptr 0x8[ebx]
0A74  83 FA FF                          cmp             edx,0xffffffff
0A77  74 04                             je              L$136
0A79  39 D0                             cmp             eax,edx
0A7B  7D 09                             jge             L$137
0A7D                            L$136:
0A7D  80 7B 15 63                       cmp             byte ptr 0x15[ebx],0x63
0A81  74 03                             je              L$137
0A83  89 43 08                          mov             dword ptr 0x8[ebx],eax
0A86                            L$137:
0A86  6A FF                             push            0xffffffff
0A88  8D 4B 17                          lea             ecx,0x17[ebx]
0A8B  8C D8                             mov             eax,ds
0A8D  25 FF FF 00 00                    and             eax,0x0000ffff
0A92  50                                push            eax
0A93  51                                push            ecx
0A94  E8 00 00 00 00                    call            far_strlen
0A99  8B 7B 08                          mov             edi,dword ptr 0x8[ebx]
0A9C  8B 6B 0C                          mov             ebp,dword ptr 0xc[ebx]
0A9F  01 F8                             add             eax,edi
0AA1  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
0AA4  01 E8                             add             eax,ebp
0AA6  83 C4 0C                          add             esp,0x0000000c
0AA9  29 C2                             sub             edx,eax
0AAB  89 F0                             mov             eax,esi
0AAD  89 53 04                          mov             dword ptr 0x4[ebx],edx
0AB0  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0AB4  83 C4 08                          add             esp,0x00000008
0AB7  E9 F5 F7 FF FF                    jmp             L$28
0ABC                            zupstr:
0ABC  53                                push            ebx
0ABD  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0AC1                            L$138:
0AC1  80 3B 00                          cmp             byte ptr [ebx],0x00
0AC4  0F 84 45 FB FF FF                 je              L$76
0ACA  31 C0                             xor             eax,eax
0ACC  8A 03                             mov             al,byte ptr [ebx]
0ACE  50                                push            eax
0ACF  E8 00 00 00 00                    call            toupper
0AD4  83 C4 04                          add             esp,0x00000004
0AD7  88 03                             mov             byte ptr [ebx],al
0AD9  43                                inc             ebx
0ADA  EB E5                             jmp             L$138

Routine Size: 2780 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

