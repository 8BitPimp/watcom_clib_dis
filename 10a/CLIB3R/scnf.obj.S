Module: scnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000B4A bytes
0000                            __scnf_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  89 C6                             mov             esi,eax
0009  89 14 24                          mov             dword ptr [esp],edx
000C  89 DF                             mov             edi,ebx
000E  8A 60 10                          mov             ah,byte ptr 0x10[eax]
0011  31 D2                             xor             edx,edx
0013  31 ED                             xor             ebp,ebp
0015  80 E4 FD                          and             ah,0xfd
0018  89 54 24 04                       mov             dword ptr 0x4[esp],edx
001C  88 66 10                          mov             byte ptr 0x10[esi],ah
001F                            L$1:
001F  8B 1C 24                          mov             ebx,dword ptr [esp]
0022  8D 4B 01                          lea             ecx,0x1[ebx]
0025  89 0C 24                          mov             dword ptr [esp],ecx
0028  8A 1B                             mov             bl,byte ptr [ebx]
002A  81 E3 FF 00 00 00                 and             ebx,0x000000ff
0030  0F 84 CB 01 00 00                 je              L$29
0036  88 D8                             mov             al,bl
0038  FE C0                             inc             al
003A  25 FF 00 00 00                    and             eax,0x000000ff
003F  F6 80 00 00 00 00 02              test            byte ptr __IsTable[eax],0x02
0046  74 0E                             je              L$2
0048  89 F0                             mov             eax,esi
004A  E8 00 00 00 00                    call            scan_white_
004F  01 C5                             add             ebp,eax
0051  E9 77 01 00 00                    jmp             L$28
0056                            L$2:
0056  83 FB 25                          cmp             ebx,0x00000025
0059  74 20                             je              L$4
005B  89 F0                             mov             eax,esi
005D  FF 16                             call            dword ptr [esi]
005F  39 D8                             cmp             eax,ebx
0061  0F 84 65 01 00 00                 je              L$27
0067                            L$3:
0067  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
006B  0F 85 90 01 00 00                 jne             L$29
0071  89 F2                             mov             edx,esi
0073  FF 56 04                          call            dword ptr 0x4[esi]
0076  E9 86 01 00 00                    jmp             L$29
007B                            L$4:
007B  89 C8                             mov             eax,ecx
007D  89 F2                             mov             edx,esi
007F  E8 00 00 00 00                    call            get_opt_
0084  31 DB                             xor             ebx,ebx
0086  89 04 24                          mov             dword ptr [esp],eax
0089  8A 18                             mov             bl,byte ptr [eax]
008B  89 C2                             mov             edx,eax
008D  85 DB                             test            ebx,ebx
008F  74 06                             je              L$5
0091  8D 50 01                          lea             edx,0x1[eax]
0094  89 14 24                          mov             dword ptr [esp],edx
0097                            L$5:
0097  83 FB 65                          cmp             ebx,0x00000065
009A  72 55                             jb              L$9
009C  83 FB 67                          cmp             ebx,0x00000067
009F  0F 86 CE 00 00 00                 jbe             L$20
00A5  83 FB 70                          cmp             ebx,0x00000070
00A8  72 2D                             jb              L$7
00AA  0F 86 BC 00 00 00                 jbe             L$19
00B0  83 FB 75                          cmp             ebx,0x00000075
00B3  72 14                             jb              L$6
00B5  0F 86 A4 00 00 00                 jbe             L$18
00BB  83 FB 78                          cmp             ebx,0x00000078
00BE  0F 84 A8 00 00 00                 je              L$19
00C4  E9 04 01 00 00                    jmp             L$28
00C9                            L$6:
00C9  83 FB 73                          cmp             ebx,0x00000073
00CC  0F 84 AC 00 00 00                 je              L$21
00D2  E9 F6 00 00 00                    jmp             L$28
00D7                            L$7:
00D7  83 FB 6E                          cmp             ebx,0x0000006e
00DA  72 0B                             jb              L$8
00DC  0F 86 D1 00 00 00                 jbe             L$25
00E2  E9 71 00 00 00                    jmp             L$17
00E7                            L$8:
00E7  83 FB 69                          cmp             ebx,0x00000069
00EA  74 5F                             je              L$16
00EC  E9 DC 00 00 00                    jmp             L$28
00F1                            L$9:
00F1  83 FB 58                          cmp             ebx,0x00000058
00F4  72 21                             jb              L$11
00F6  0F 86 70 00 00 00                 jbe             L$19
00FC  83 FB 63                          cmp             ebx,0x00000063
00FF  72 08                             jb              L$10
0101  0F 86 8F 00 00 00                 jbe             L$23
0107  EB 2D                             jmp             L$13
0109                            L$10:
0109  83 FB 5B                          cmp             ebx,0x0000005b
010C  0F 84 77 00 00 00                 je              L$22
0112  E9 B6 00 00 00                    jmp             L$28
0117                            L$11:
0117  83 FB 45                          cmp             ebx,0x00000045
011A  72 0C                             jb              L$12
011C  76 55                             jbe             L$20
011E  83 FB 47                          cmp             ebx,0x00000047
0121  74 50                             je              L$20
0123  E9 A5 00 00 00                    jmp             L$28
0128                            L$12:
0128  83 FB 25                          cmp             ebx,0x00000025
012B  0F 84 8F 00 00 00                 je              L$26
0131  E9 97 00 00 00                    jmp             L$28
0136                            L$13:
0136  BB 0A 00 00 00                    mov             ebx,0x0000000a
013B                            L$14:
013B  B9 01 00 00 00                    mov             ecx,0x00000001
0140  89 F0                             mov             eax,esi
0142  89 FA                             mov             edx,edi
0144                            L$15:
0144  E8 00 00 00 00                    call            scan_int_
0149  EB 54                             jmp             L$24
014B                            L$16:
014B  B9 01 00 00 00                    mov             ecx,0x00000001
0150  89 F0                             mov             eax,esi
0152  89 FA                             mov             edx,edi
0154  31 DB                             xor             ebx,ebx
0156  EB EC                             jmp             L$15
0158                            L$17:
0158  BB 08 00 00 00                    mov             ebx,0x00000008
015D  EB DC                             jmp             L$14
015F                            L$18:
015F  BB 0A 00 00 00                    mov             ebx,0x0000000a
0164  89 F0                             mov             eax,esi
0166  89 FA                             mov             edx,edi
0168  31 C9                             xor             ecx,ecx
016A  EB D8                             jmp             L$15
016C                            L$19:
016C  BB 10 00 00 00                    mov             ebx,0x00000010
0171  EB C8                             jmp             L$14
0173                            L$20:
0173  89 F0                             mov             eax,esi
0175  89 FA                             mov             edx,edi
0177  E8 00 00 00 00                    call            scan_float_
017C  EB 21                             jmp             L$24
017E                            L$21:
017E  89 F0                             mov             eax,esi
0180  89 FA                             mov             edx,edi
0182  E8 00 00 00 00                    call            scan_string_
0187  EB 16                             jmp             L$24
0189                            L$22:
0189  89 E3                             mov             ebx,esp
018B  89 F0                             mov             eax,esi
018D  89 FA                             mov             edx,edi
018F  E8 00 00 00 00                    call            scan_arb_
0194  EB 09                             jmp             L$24
0196                            L$23:
0196  89 F0                             mov             eax,esi
0198  89 FA                             mov             edx,edi
019A  E8 00 00 00 00                    call            scan_char_
019F                            L$24:
019F  85 C0                             test            eax,eax
01A1  7E 5E                             jle             L$29
01A3  8A 76 10                          mov             dh,byte ptr 0x10[esi]
01A6  01 C5                             add             ebp,eax
01A8  F6 C6 01                          test            dh,0x01
01AB  74 20                             je              L$28
01AD  FF 44 24 04                       inc             dword ptr 0x4[esp]
01B1  EB 1A                             jmp             L$28
01B3                            L$25:
01B3  89 F0                             mov             eax,esi
01B5  89 FA                             mov             edx,edi
01B7  89 EB                             mov             ebx,ebp
01B9  E8 00 00 00 00                    call            report_scan_
01BE  EB 0D                             jmp             L$28
01C0                            L$26:
01C0  89 F0                             mov             eax,esi
01C2  FF 16                             call            dword ptr [esi]
01C4  39 D8                             cmp             eax,ebx
01C6  0F 85 9B FE FF FF                 jne             L$3
01CC                            L$27:
01CC  45                                inc             ebp
01CD                            L$28:
01CD  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
01D1  0F 84 48 FE FF FF                 je              L$1
01D7  8B 04 24                          mov             eax,dword ptr [esp]
01DA  80 38 25                          cmp             byte ptr [eax],0x25
01DD  75 22                             jne             L$29
01DF  8D 50 01                          lea             edx,0x1[eax]
01E2  89 14 24                          mov             dword ptr [esp],edx
01E5  89 D0                             mov             eax,edx
01E7  89 F2                             mov             edx,esi
01E9  E8 00 00 00 00                    call            get_opt_
01EE  89 04 24                          mov             dword ptr [esp],eax
01F1  80 38 6E                          cmp             byte ptr [eax],0x6e
01F4  75 0B                             jne             L$29
01F6  89 F0                             mov             eax,esi
01F8  89 FA                             mov             edx,edi
01FA  89 EB                             mov             ebx,ebp
01FC  E8 00 00 00 00                    call            report_scan_
0201                            L$29:
0201  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
0206  75 0D                             jne             L$30
0208  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
020C  74 07                             je              L$30
020E  B8 FF FF FF FF                    mov             eax,0xffffffff
0213  EB 04                             jmp             L$31
0215                            L$30:
0215  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0219                            L$31:
0219  83 C4 08                          add             esp,0x00000008
021C  5D                                pop             ebp
021D  5F                                pop             edi
021E  5E                                pop             esi
021F  59                                pop             ecx
0220  C3                                ret
0221                            get_opt_:
0221  53                                push            ebx
0222  51                                push            ecx
0223  56                                push            esi
0224  83 EC 04                          sub             esp,0x00000004
0227  89 D3                             mov             ebx,edx
0229  8A 52 10                          mov             dl,byte ptr 0x10[edx]
022C  80 CA 01                          or              dl,0x01
022F  C7 43 0C FF FF FF FF              mov             dword ptr 0xc[ebx],0xffffffff
0236  88 D6                             mov             dh,dl
0238  88 53 10                          mov             byte ptr 0x10[ebx],dl
023B  80 E6 03                          and             dh,0x03
023E  88 73 10                          mov             byte ptr 0x10[ebx],dh
0241  80 38 2A                          cmp             byte ptr [eax],0x2a
0244  75 0A                             jne             L$32
0246  8A 6B 10                          mov             ch,byte ptr 0x10[ebx]
0249  80 E5 FE                          and             ch,0xfe
024C  40                                inc             eax
024D  88 6B 10                          mov             byte ptr 0x10[ebx],ch
0250                            L$32:
0250  31 D2                             xor             edx,edx
0252  8A 10                             mov             dl,byte ptr [eax]
0254  89 14 24                          mov             dword ptr [esp],edx
0257  8A 14 24                          mov             dl,byte ptr [esp]
025A  FE C2                             inc             dl
025C  81 E2 FF 00 00 00                 and             edx,0x000000ff
0262  F6 82 00 00 00 00 20              test            byte ptr __IsTable[edx],0x20
0269  74 28                             je              L$34
026B  31 D2                             xor             edx,edx
026D                            L$33:
026D  6B D2 0A                          imul            edx,0x0000000a
0270  8B 34 24                          mov             esi,dword ptr [esp]
0273  83 EE 30                          sub             esi,0x00000030
0276  40                                inc             eax
0277  01 F2                             add             edx,esi
0279  0F B6 30                          movzx           esi,byte ptr [eax]
027C  89 34 24                          mov             dword ptr [esp],esi
027F  8A 0C 24                          mov             cl,byte ptr [esp]
0282  FE C1                             inc             cl
0284  0F B6 F1                          movzx           esi,cl
0287  F6 86 00 00 00 00 20              test            byte ptr __IsTable[esi],0x20
028E  75 DD                             jne             L$33
0290  89 53 0C                          mov             dword ptr 0xc[ebx],edx
0293                            L$34:
0293  8A 08                             mov             cl,byte ptr [eax]
0295  8D 50 01                          lea             edx,0x1[eax]
0298  80 F9 4E                          cmp             cl,0x4e
029B  75 06                             jne             L$35
029D  80 4B 10 08                       or              byte ptr 0x10[ebx],0x08
02A1  EB 09                             jmp             L$36
02A3                            L$35:
02A3  80 F9 46                          cmp             cl,0x46
02A6  75 06                             jne             L$37
02A8  80 4B 10 04                       or              byte ptr 0x10[ebx],0x04
02AC                            L$36:
02AC  89 D0                             mov             eax,edx
02AE                            L$37:
02AE  8A 08                             mov             cl,byte ptr [eax]
02B0  8D 50 01                          lea             edx,0x1[eax]
02B3  80 F9 68                          cmp             cl,0x68
02B6  72 10                             jb              L$38
02B8  76 15                             jbe             L$39
02BA  80 F9 6C                          cmp             cl,0x6c
02BD  72 34                             jb              L$42
02BF  76 1B                             jbe             L$40
02C1  80 F9 77                          cmp             cl,0x77
02C4  74 16                             je              L$40
02C6  EB 2B                             jmp             L$42
02C8                            L$38:
02C8  80 F9 4C                          cmp             cl,0x4c
02CB  74 1B                             je              L$41
02CD  EB 24                             jmp             L$42
02CF                            L$39:
02CF  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
02D2  80 C9 10                          or              cl,0x10
02D5  89 D0                             mov             eax,edx
02D7  88 4B 10                          mov             byte ptr 0x10[ebx],cl
02DA  EB 17                             jmp             L$42
02DC                            L$40:
02DC  8A 53 10                          mov             dl,byte ptr 0x10[ebx]
02DF  80 CA 20                          or              dl,0x20
02E2  40                                inc             eax
02E3  88 53 10                          mov             byte ptr 0x10[ebx],dl
02E6  EB 0B                             jmp             L$42
02E8                            L$41:
02E8  8A 6B 10                          mov             ch,byte ptr 0x10[ebx]
02EB  80 CD 40                          or              ch,0x40
02EE  89 D0                             mov             eax,edx
02F0  88 6B 10                          mov             byte ptr 0x10[ebx],ch
02F3                            L$42:
02F3  83 C4 04                          add             esp,0x00000004
02F6  5E                                pop             esi
02F7  59                                pop             ecx
02F8  5B                                pop             ebx
02F9  C3                                ret
02FA                            scan_white_:
02FA  53                                push            ebx
02FB  51                                push            ecx
02FC  52                                push            edx
02FD  56                                push            esi
02FE  89 C3                             mov             ebx,eax
0300  31 C9                             xor             ecx,ecx
0302                            L$43:
0302  89 D8                             mov             eax,ebx
0304  FF 13                             call            dword ptr [ebx]
0306  89 C6                             mov             esi,eax
0308  FE C0                             inc             al
030A  25 FF 00 00 00                    and             eax,0x000000ff
030F  F6 80 00 00 00 00 02              test            byte ptr __IsTable[eax],0x02
0316  74 03                             je              L$44
0318  41                                inc             ecx
0319  EB E7                             jmp             L$43
031B                            L$44:
031B  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
031F  75 07                             jne             L$45
0321  89 F0                             mov             eax,esi
0323  89 DA                             mov             edx,ebx
0325  FF 53 04                          call            dword ptr 0x4[ebx]
0328                            L$45:
0328  89 C8                             mov             eax,ecx
032A  5E                                pop             esi
032B  5A                                pop             edx
032C  59                                pop             ecx
032D  5B                                pop             ebx
032E  C3                                ret
032F                            scan_char_:
032F  53                                push            ebx
0330  51                                push            ecx
0331  56                                push            esi
0332  57                                push            edi
0333  06                                push            es
0334  89 C3                             mov             ebx,eax
0336  F6 40 10 01                       test            byte ptr 0x10[eax],0x01
033A  74 37                             je              L$48
033C  8A 4B 10                          mov             cl,byte ptr 0x10[ebx]
033F  F6 C1 04                          test            cl,0x04
0342  74 0C                             je              L$46
0344  8B 3A                             mov             edi,dword ptr [edx]
0346  83 C7 08                          add             edi,0x00000008
0349  89 3A                             mov             dword ptr [edx],edi
034B  C4 4F F8                          les             ecx,fword ptr -0x8[edi]
034E  EB 23                             jmp             L$48
0350                            L$46:
0350  F6 C1 08                          test            cl,0x08
0353  74 10                             je              L$47
0355  8B 32                             mov             esi,dword ptr [edx]
0357  83 C6 04                          add             esi,0x00000004
035A  8C D8                             mov             eax,ds
035C  89 32                             mov             dword ptr [edx],esi
035E  8E C0                             mov             es,eax
0360  8B 4E FC                          mov             ecx,dword ptr -0x4[esi]
0363  EB 0E                             jmp             L$48
0365                            L$47:
0365  8B 0A                             mov             ecx,dword ptr [edx]
0367  83 C1 04                          add             ecx,0x00000004
036A  8C D8                             mov             eax,ds
036C  89 0A                             mov             dword ptr [edx],ecx
036E  8E C0                             mov             es,eax
0370  8B 49 FC                          mov             ecx,dword ptr -0x4[ecx]
0373                            L$48:
0373  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
0376  31 F6                             xor             esi,esi
0378  83 FA FF                          cmp             edx,0xffffffff
037B  75 05                             jne             L$49
037D  BA 01 00 00 00                    mov             edx,0x00000001
0382                            L$49:
0382  85 D2                             test            edx,edx
0384  7E 27                             jle             L$51
0386  89 D8                             mov             eax,ebx
0388  FF 13                             call            dword ptr [ebx]
038A  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
038E  75 1D                             jne             L$51
0390  46                                inc             esi
0391  4A                                dec             edx
0392  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
0396  74 EA                             je              L$49
0398  F6 43 10 20                       test            byte ptr 0x10[ebx],0x20
039C  74 09                             je              L$50
039E  66 26 89 01                       mov             word ptr es:[ecx],ax
03A2  83 C1 02                          add             ecx,0x00000002
03A5  EB DB                             jmp             L$49
03A7                            L$50:
03A7  26 88 01                          mov             byte ptr es:[ecx],al
03AA  41                                inc             ecx
03AB  EB D5                             jmp             L$49
03AD                            L$51:
03AD  89 F0                             mov             eax,esi
03AF                            L$52:
03AF  07                                pop             es
03B0  5F                                pop             edi
03B1  5E                                pop             esi
03B2  59                                pop             ecx
03B3  5B                                pop             ebx
03B4  C3                                ret
03B5                            scan_string_:
03B5  53                                push            ebx
03B6  51                                push            ecx
03B7  56                                push            esi
03B8  57                                push            edi
03B9  06                                push            es
03BA  83 EC 04                          sub             esp,0x00000004
03BD  89 C3                             mov             ebx,eax
03BF  F6 40 10 20                       test            byte ptr 0x10[eax],0x20
03C3  74 06                             je              L$53
03C5  C6 04 24 02                       mov             byte ptr [esp],0x02
03C9  EB 08                             jmp             L$54
03CB                            L$53:
03CB  F6 43 10 10                       test            byte ptr 0x10[ebx],0x10
03CF  C6 04 24 01                       mov             byte ptr [esp],0x01
03D3                            L$54:
03D3  8A 43 10                          mov             al,byte ptr 0x10[ebx]
03D6  A8 01                             test            al,0x01
03D8  74 32                             je              L$57
03DA  A8 04                             test            al,0x04
03DC  74 0C                             je              L$55
03DE  8B 3A                             mov             edi,dword ptr [edx]
03E0  83 C7 08                          add             edi,0x00000008
03E3  89 3A                             mov             dword ptr [edx],edi
03E5  C4 4F F8                          les             ecx,fword ptr -0x8[edi]
03E8  EB 22                             jmp             L$57
03EA                            L$55:
03EA  A8 08                             test            al,0x08
03EC  74 10                             je              L$56
03EE  8B 32                             mov             esi,dword ptr [edx]
03F0  83 C6 04                          add             esi,0x00000004
03F3  89 32                             mov             dword ptr [edx],esi
03F5  8C DA                             mov             edx,ds
03F7  8E C2                             mov             es,edx
03F9  8B 4E FC                          mov             ecx,dword ptr -0x4[esi]
03FC  EB 0E                             jmp             L$57
03FE                            L$56:
03FE  8B 0A                             mov             ecx,dword ptr [edx]
0400  83 C1 04                          add             ecx,0x00000004
0403  89 0A                             mov             dword ptr [edx],ecx
0405  8C DA                             mov             edx,ds
0407  8E C2                             mov             es,edx
0409  8B 49 FC                          mov             ecx,dword ptr -0x4[ecx]
040C                            L$57:
040C  31 F6                             xor             esi,esi
040E                            L$58:
040E  89 D8                             mov             eax,ebx
0410  FF 13                             call            dword ptr [ebx]
0412  89 C2                             mov             edx,eax
0414  FE C0                             inc             al
0416  0F B6 F8                          movzx           edi,al
0419  F6 87 00 00 00 00 02              test            byte ptr __IsTable[edi],0x02
0420  74 03                             je              L$59
0422  46                                inc             esi
0423  EB E9                             jmp             L$58
0425                            L$59:
0425  F6 43 10 02                       test            byte ptr 0x10[ebx],0x02
0429  74 04                             je              L$60
042B  31 F6                             xor             esi,esi
042D  EB 4E                             jmp             L$66
042F                            L$60:
042F  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
0432  8D 47 FF                          lea             eax,-0x1[edi]
0435  89 43 0C                          mov             dword ptr 0xc[ebx],eax
0438  85 FF                             test            edi,edi
043A  74 3A                             je              L$65
043C                            L$61:
043C  8A 43 10                          mov             al,byte ptr 0x10[ebx]
043F  46                                inc             esi
0440  A8 01                             test            al,0x01
0442  74 16                             je              L$64
0444  80 3C 24 01                       cmp             byte ptr [esp],0x01
0448  75 05                             jne             L$62
044A  26 88 11                          mov             byte ptr es:[ecx],dl
044D  EB 04                             jmp             L$63
044F                            L$62:
044F  66 26 89 11                       mov             word ptr es:[ecx],dx
0453                            L$63:
0453  31 D2                             xor             edx,edx
0455  8A 14 24                          mov             dl,byte ptr [esp]
0458  01 D1                             add             ecx,edx
045A                            L$64:
045A  89 D8                             mov             eax,ebx
045C  E8 00 00 00 00                    call            cgetw_
0461  89 C2                             mov             edx,eax
0463  83 F8 FF                          cmp             eax,0xffffffff
0466  74 15                             je              L$66
0468  FE C0                             inc             al
046A  0F B6 F8                          movzx           edi,al
046D  F6 87 00 00 00 00 02              test            byte ptr __IsTable[edi],0x02
0474  74 C6                             je              L$61
0476                            L$65:
0476  89 D0                             mov             eax,edx
0478  89 DA                             mov             edx,ebx
047A  FF 53 04                          call            dword ptr 0x4[ebx]
047D                            L$66:
047D  F6 43 10 01                       test            byte ptr 0x10[ebx],0x01
0481  74 16                             je              L$68
0483  85 F6                             test            esi,esi
0485  7E 12                             jle             L$68
0487  80 3C 24 01                       cmp             byte ptr [esp],0x01
048B  75 06                             jne             L$67
048D  26 C6 01 00                       mov             byte ptr es:[ecx],0x00
0491  EB 06                             jmp             L$68
0493                            L$67:
0493  66 26 C7 01 00 00                 mov             word ptr es:[ecx],0x0000
0499                            L$68:
0499  89 F0                             mov             eax,esi
049B  83 C4 04                          add             esp,0x00000004
049E  E9 0C FF FF FF                    jmp             L$52
04A3                            report_scan_:
04A3  51                                push            ecx
04A4  56                                push            esi
04A5  57                                push            edi
04A6  06                                push            es
04A7  8A 48 10                          mov             cl,byte ptr 0x10[eax]
04AA  F6 C1 01                          test            cl,0x01
04AD  74 4D                             je              L$73
04AF  F6 C1 04                          test            cl,0x04
04B2  74 0C                             je              L$69
04B4  8B 3A                             mov             edi,dword ptr [edx]
04B6  83 C7 08                          add             edi,0x00000008
04B9  89 3A                             mov             dword ptr [edx],edi
04BB  C4 57 F8                          les             edx,fword ptr -0x8[edi]
04BE  EB 25                             jmp             L$71
04C0                            L$69:
04C0  F6 C1 08                          test            cl,0x08
04C3  74 10                             je              L$70
04C5  8B 32                             mov             esi,dword ptr [edx]
04C7  83 C6 04                          add             esi,0x00000004
04CA  8C D9                             mov             ecx,ds
04CC  89 32                             mov             dword ptr [edx],esi
04CE  8E C1                             mov             es,ecx
04D0  8B 56 FC                          mov             edx,dword ptr -0x4[esi]
04D3  EB 10                             jmp             L$71
04D5                            L$70:
04D5  8B 0A                             mov             ecx,dword ptr [edx]
04D7  83 C1 04                          add             ecx,0x00000004
04DA  89 0A                             mov             dword ptr [edx],ecx
04DC  89 CA                             mov             edx,ecx
04DE  8C D9                             mov             ecx,ds
04E0  8E C1                             mov             es,ecx
04E2  8B 52 FC                          mov             edx,dword ptr -0x4[edx]
04E5                            L$71:
04E5  8A 68 10                          mov             ch,byte ptr 0x10[eax]
04E8  F6 C5 10                          test            ch,0x10
04EB  74 09                             je              L$72
04ED  66 26 89 1A                       mov             word ptr es:[edx],bx
04F1  07                                pop             es
04F2  5F                                pop             edi
04F3  5E                                pop             esi
04F4  59                                pop             ecx
04F5  C3                                ret
04F6                            L$72:
04F6  F6 C5 20                          test            ch,0x20
04F9  26 89 1A                          mov             dword ptr es:[edx],ebx
04FC                            L$73:
04FC  07                                pop             es
04FD  5F                                pop             edi
04FE  5E                                pop             esi
04FF  59                                pop             ecx
0500  C3                                ret
0501                            makelist_:
0501  53                                push            ebx
0502  51                                push            ecx
0503  56                                push            esi
0504  89 C1                             mov             ecx,eax
0506  89 D6                             mov             esi,edx
0508  BB 20 00 00 00                    mov             ebx,0x00000020
050D  89 D0                             mov             eax,edx
050F  31 D2                             xor             edx,edx
0511  E8 00 00 00 00                    call            memset_
0516  31 C0                             xor             eax,eax
0518  8A 01                             mov             al,byte ptr [ecx]
051A  41                                inc             ecx
051B  85 C0                             test            eax,eax
051D  74 1F                             je              L$75
051F                            L$74:
051F  89 C2                             mov             edx,eax
0521  83 E0 07                          and             eax,0x00000007
0524  C1 FA 03                          sar             edx,0x03
0527  8A 80 00 00 00 00                 mov             al,byte ptr _lst_mask[eax]
052D  08 04 32                          or              byte ptr [edx+esi],al
0530  31 C0                             xor             eax,eax
0532  8A 01                             mov             al,byte ptr [ecx]
0534  85 C0                             test            eax,eax
0536  74 06                             je              L$75
0538  41                                inc             ecx
0539  83 F8 5D                          cmp             eax,0x0000005d
053C  75 E1                             jne             L$74
053E                            L$75:
053E  89 C8                             mov             eax,ecx
0540  5E                                pop             esi
0541  59                                pop             ecx
0542  5B                                pop             ebx
0543  C3                                ret
0544                            scan_arb_:
0544  51                                push            ecx
0545  56                                push            esi
0546  57                                push            edi
0547  06                                push            es
0548  55                                push            ebp
0549  83 EC 28                          sub             esp,0x00000028
054C  89 C1                             mov             ecx,eax
054E  89 D7                             mov             edi,edx
0550  8B 03                             mov             eax,dword ptr [ebx]
0552  80 38 5E                          cmp             byte ptr [eax],0x5e
0555  0F 94 C2                          sete            dl
0558  81 E2 FF 00 00 00                 and             edx,0x000000ff
055E  89 54 24 20                       mov             dword ptr 0x20[esp],edx
0562  74 03                             je              L$76
0564  40                                inc             eax
0565  89 03                             mov             dword ptr [ebx],eax
0567                            L$76:
0567  89 E2                             mov             edx,esp
0569  8B 03                             mov             eax,dword ptr [ebx]
056B  E8 00 00 00 00                    call            makelist_
0570  89 03                             mov             dword ptr [ebx],eax
0572  8A 59 10                          mov             bl,byte ptr 0x10[ecx]
0575  F6 C3 01                          test            bl,0x01
0578  74 34                             je              L$79
057A  F6 C3 04                          test            bl,0x04
057D  74 0C                             je              L$77
057F  8B 37                             mov             esi,dword ptr [edi]
0581  83 C6 08                          add             esi,0x00000008
0584  89 37                             mov             dword ptr [edi],esi
0586  C4 76 F8                          les             esi,fword ptr -0x8[esi]
0589  EB 23                             jmp             L$79
058B                            L$77:
058B  F6 C3 08                          test            bl,0x08
058E  74 10                             je              L$78
0590  8B 1F                             mov             ebx,dword ptr [edi]
0592  83 C3 04                          add             ebx,0x00000004
0595  8C D8                             mov             eax,ds
0597  89 1F                             mov             dword ptr [edi],ebx
0599  8E C0                             mov             es,eax
059B  8B 73 FC                          mov             esi,dword ptr -0x4[ebx]
059E  EB 0E                             jmp             L$79
05A0                            L$78:
05A0  8B 17                             mov             edx,dword ptr [edi]
05A2  83 C2 04                          add             edx,0x00000004
05A5  8C D8                             mov             eax,ds
05A7  89 17                             mov             dword ptr [edi],edx
05A9  8E C0                             mov             es,eax
05AB  8B 72 FC                          mov             esi,dword ptr -0x4[edx]
05AE                            L$79:
05AE  8B 6C 24 20                       mov             ebp,dword ptr 0x20[esp]
05B2  31 FF                             xor             edi,edi
05B4  8B 59 0C                          mov             ebx,dword ptr 0xc[ecx]
05B7  89 7C 24 24                       mov             dword ptr 0x24[esp],edi
05BB                            L$80:
05BB  85 DB                             test            ebx,ebx
05BD  76 4D                             jbe             L$82
05BF  89 C8                             mov             eax,ecx
05C1  FF 11                             call            dword ptr [ecx]
05C3  89 C2                             mov             edx,eax
05C5  F6 41 10 02                       test            byte ptr 0x10[ecx],0x02
05C9  75 41                             jne             L$82
05CB  89 C7                             mov             edi,eax
05CD  83 E2 07                          and             edx,0x00000007
05D0  C1 FF 03                          sar             edi,0x03
05D3  8A 92 00 00 00 00                 mov             dl,byte ptr _lst_mask[edx]
05D9  0F B6 3C 3C                       movzx           edi,byte ptr [esp+edi]
05DD  81 E2 FF 00 00 00                 and             edx,0x000000ff
05E3  85 D7                             test            edi,edx
05E5  0F 94 C2                          sete            dl
05E8  81 E2 FF 00 00 00                 and             edx,0x000000ff
05EE  39 EA                             cmp             edx,ebp
05F0  74 07                             je              L$81
05F2  89 CA                             mov             edx,ecx
05F4  FF 51 04                          call            dword ptr 0x4[ecx]
05F7  EB 13                             jmp             L$82
05F9                            L$81:
05F9  FF 44 24 24                       inc             dword ptr 0x24[esp]
05FD  8A 51 10                          mov             dl,byte ptr 0x10[ecx]
0600  4B                                dec             ebx
0601  F6 C2 01                          test            dl,0x01
0604  74 B5                             je              L$80
0606  26 88 06                          mov             byte ptr es:[esi],al
0609  46                                inc             esi
060A  EB AF                             jmp             L$80
060C                            L$82:
060C  F6 41 10 01                       test            byte ptr 0x10[ecx],0x01
0610  74 0B                             je              L$83
0612  83 7C 24 24 00                    cmp             dword ptr 0x24[esp],0x00000000
0617  7E 04                             jle             L$83
0619  26 C6 06 00                       mov             byte ptr es:[esi],0x00
061D                            L$83:
061D  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
0621  83 C4 28                          add             esp,0x00000028
0624  5D                                pop             ebp
0625  07                                pop             es
0626  5F                                pop             edi
0627  5E                                pop             esi
0628  59                                pop             ecx
0629  C3                                ret
062A                            scan_float_:
062A  53                                push            ebx
062B  51                                push            ecx
062C  56                                push            esi
062D  57                                push            edi
062E  06                                push            es
062F  55                                push            ebp
0630  83 EC 70                          sub             esp,0x00000070
0633  89 C1                             mov             ecx,eax
0635  89 54 24 58                       mov             dword ptr 0x58[esp],edx
0639  31 FF                             xor             edi,edi
063B  89 E6                             mov             esi,esp
063D  89 7C 24 6C                       mov             dword ptr 0x6c[esp],edi
0641                            L$84:
0641  89 C8                             mov             eax,ecx
0643  FF 11                             call            dword ptr [ecx]
0645  89 C5                             mov             ebp,eax
0647  89 C3                             mov             ebx,eax
0649  FE C0                             inc             al
064B  25 FF 00 00 00                    and             eax,0x000000ff
0650  F6 80 00 00 00 00 02              test            byte ptr __IsTable[eax],0x02
0657  74 06                             je              L$85
0659  FF 44 24 6C                       inc             dword ptr 0x6c[esp]
065D  EB E2                             jmp             L$84
065F                            L$85:
065F  F6 41 10 02                       test            byte ptr 0x10[ecx],0x02
0663  0F 85 E1 01 00 00                 jne             L$104
0669  8B 41 0C                          mov             eax,dword ptr 0xc[ecx]
066C  8D 50 FF                          lea             edx,-0x1[eax]
066F  89 51 0C                          mov             dword ptr 0xc[ecx],edx
0672  85 C0                             test            eax,eax
0674  0F 84 C9 01 00 00                 je              L$103
067A  83 FD 2B                          cmp             ebp,0x0000002b
067D  74 05                             je              L$86
067F  83 FD 2D                          cmp             ebp,0x0000002d
0682  75 1E                             jne             L$87
0684                            L$86:
0684  8B 6C 24 6C                       mov             ebp,dword ptr 0x6c[esp]
0688  89 C8                             mov             eax,ecx
068A  88 1E                             mov             byte ptr [esi],bl
068C  E8 00 00 00 00                    call            cgetw_
0691  46                                inc             esi
0692  45                                inc             ebp
0693  89 C3                             mov             ebx,eax
0695  89 6C 24 6C                       mov             dword ptr 0x6c[esp],ebp
0699  83 F8 FF                          cmp             eax,0xffffffff
069C  0F 84 A8 01 00 00                 je              L$104
06A2                            L$87:
06A2  88 D8                             mov             al,bl
06A4  FE C0                             inc             al
06A6  25 FF 00 00 00                    and             eax,0x000000ff
06AB  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
06B2  75 09                             jne             L$88
06B4  83 FB 2E                          cmp             ebx,0x0000002e
06B7  0F 85 86 01 00 00                 jne             L$103
06BD                            L$88:
06BD  31 C0                             xor             eax,eax
06BF  89 44 24 68                       mov             dword ptr 0x68[esp],eax
06C3  89 44 24 5C                       mov             dword ptr 0x5c[esp],eax
06C7  88 D8                             mov             al,bl
06C9  FE C0                             inc             al
06CB  25 FF 00 00 00                    and             eax,0x000000ff
06D0  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
06D7  74 44                             je              L$91
06D9  C7 44 24 5C 01 00 00 00           mov             dword ptr 0x5c[esp],0x00000001
06E1                            L$89:
06E1  88 1E                             mov             byte ptr [esi],bl
06E3  8A 41 10                          mov             al,byte ptr 0x10[ecx]
06E6  46                                inc             esi
06E7  A8 10                             test            al,0x10
06E9  74 0F                             je              L$90
06EB  6B 44 24 6A 0A                    imul            eax,dword ptr 0x6a[esp],0x0000000a
06F0  01 C3                             add             ebx,eax
06F2  83 EB 30                          sub             ebx,0x00000030
06F5  66 89 5C 24 6A                    mov             word ptr 0x6a[esp],bx
06FA                            L$90:
06FA  89 C8                             mov             eax,ecx
06FC  47                                inc             edi
06FD  E8 00 00 00 00                    call            cgetw_
0702  89 C3                             mov             ebx,eax
0704  83 F8 FF                          cmp             eax,0xffffffff
0707  0F 84 3D 01 00 00                 je              L$104
070D  FE C0                             inc             al
070F  25 FF 00 00 00                    and             eax,0x000000ff
0714  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
071B  75 C4                             jne             L$89
071D                            L$91:
071D  83 FB 2E                          cmp             ebx,0x0000002e
0720  0F 85 9D 00 00 00                 jne             L$98
0726  89 C8                             mov             eax,ecx
0728  88 1E                             mov             byte ptr [esi],bl
072A  E8 00 00 00 00                    call            cgetw_
072F  46                                inc             esi
0730  89 C3                             mov             ebx,eax
0732  83 F8 FF                          cmp             eax,0xffffffff
0735  0F 84 0F 01 00 00                 je              L$104
073B  83 7C 24 5C 00                    cmp             dword ptr 0x5c[esp],0x00000000
0740  75 16                             jne             L$92
0742  88 D8                             mov             al,bl
0744  FE C0                             inc             al
0746  25 FF 00 00 00                    and             eax,0x000000ff
074B  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
0752  0F 84 EB 00 00 00                 je              L$103
0758                            L$92:
0758  47                                inc             edi
0759                            L$93:
0759  88 D8                             mov             al,bl
075B  FE C0                             inc             al
075D  25 FF 00 00 00                    and             eax,0x000000ff
0762  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
0769  74 12                             je              L$94
076B  47                                inc             edi
076C  89 C8                             mov             eax,ecx
076E  88 1E                             mov             byte ptr [esi],bl
0770  E8 00 00 00 00                    call            cgetw_
0775  46                                inc             esi
0776  89 C3                             mov             ebx,eax
0778  83 F8 FF                          cmp             eax,0xffffffff
077B  75 DC                             jne             L$93
077D                            L$94:
077D  F6 41 10 10                       test            byte ptr 0x10[ecx],0x10
0781  74 37                             je              L$97
0783  31 D2                             xor             edx,edx
0785  89 F5                             mov             ebp,esi
0787  89 54 24 64                       mov             dword ptr 0x64[esp],edx
078B                            L$95:
078B  4D                                dec             ebp
078C  8A 45 00                          mov             al,byte ptr [ebp]
078F  3C 2E                             cmp             al,0x2e
0791  74 1E                             je              L$96
0793  2C 30                             sub             al,0x30
0795  C7 44 24 60 0A 00 00 00           mov             dword ptr 0x60[esp],0x0000000a
079D  88 44 24 66                       mov             byte ptr 0x66[esp],al
07A1  31 D2                             xor             edx,edx
07A3  8B 44 24 64                       mov             eax,dword ptr 0x64[esp]
07A7  F7 74 24 60                       div             dword ptr 0x60[esp]
07AB  89 44 24 64                       mov             dword ptr 0x64[esp],eax
07AF  EB DA                             jmp             L$95
07B1                            L$96:
07B1  8B 44 24 64                       mov             eax,dword ptr 0x64[esp]
07B5  66 89 44 24 68                    mov             word ptr 0x68[esp],ax
07BA                            L$97:
07BA  83 FB FF                          cmp             ebx,0xffffffff
07BD  0F 84 87 00 00 00                 je              L$104
07C3                            L$98:
07C3  F6 41 10 10                       test            byte ptr 0x10[ecx],0x10
07C7  0F 85 76 00 00 00                 jne             L$103
07CD  83 FB 65                          cmp             ebx,0x00000065
07D0  74 09                             je              L$99
07D2  83 FB 45                          cmp             ebx,0x00000045
07D5  0F 85 68 00 00 00                 jne             L$103
07DB                            L$99:
07DB  47                                inc             edi
07DC  89 C8                             mov             eax,ecx
07DE  88 1E                             mov             byte ptr [esi],bl
07E0  E8 00 00 00 00                    call            cgetw_
07E5  46                                inc             esi
07E6  89 C5                             mov             ebp,eax
07E8  89 C3                             mov             ebx,eax
07EA  83 F8 FF                          cmp             eax,0xffffffff
07ED  74 5B                             je              L$104
07EF  83 F8 2B                          cmp             eax,0x0000002b
07F2  74 05                             je              L$100
07F4  83 F8 2D                          cmp             eax,0x0000002d
07F7  75 12                             jne             L$101
07F9                            L$100:
07F9  47                                inc             edi
07FA  89 C8                             mov             eax,ecx
07FC  88 1E                             mov             byte ptr [esi],bl
07FE  E8 00 00 00 00                    call            cgetw_
0803  46                                inc             esi
0804  89 C3                             mov             ebx,eax
0806  83 F8 FF                          cmp             eax,0xffffffff
0809  74 3F                             je              L$104
080B                            L$101:
080B  88 D8                             mov             al,bl
080D  FE C0                             inc             al
080F  25 FF 00 00 00                    and             eax,0x000000ff
0814  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
081B  75 04                             jne             L$102
081D  31 FF                             xor             edi,edi
081F  EB 22                             jmp             L$103
0821                            L$102:
0821  47                                inc             edi
0822  89 C8                             mov             eax,ecx
0824  88 1E                             mov             byte ptr [esi],bl
0826  E8 00 00 00 00                    call            cgetw_
082B  46                                inc             esi
082C  89 C3                             mov             ebx,eax
082E  83 F8 FF                          cmp             eax,0xffffffff
0831  74 17                             je              L$104
0833  FE C0                             inc             al
0835  25 FF 00 00 00                    and             eax,0x000000ff
083A  F6 80 00 00 00 00 20              test            byte ptr __IsTable[eax],0x20
0841  75 DE                             jne             L$102
0843                            L$103:
0843  89 D8                             mov             eax,ebx
0845  89 CA                             mov             edx,ecx
0847  FF 51 04                          call            dword ptr 0x4[ecx]
084A                            L$104:
084A  85 FF                             test            edi,edi
084C  0F 8E AB 00 00 00                 jle             L$114
0852  03 7C 24 6C                       add             edi,dword ptr 0x6c[esp]
0856  F6 41 10 01                       test            byte ptr 0x10[ecx],0x01
085A  0F 84 9D 00 00 00                 je              L$114
0860  C6 06 00                          mov             byte ptr [esi],0x00
0863  F6 41 10 10                       test            byte ptr 0x10[ecx],0x10
0867  74 0C                             je              L$105
0869  80 3C 24 2D                       cmp             byte ptr [esp],0x2d
086D  75 12                             jne             L$106
086F  F7 5C 24 68                       neg             dword ptr 0x68[esp]
0873  EB 0C                             jmp             L$106
0875                            L$105:
0875  89 E0                             mov             eax,esp
0877  8D 54 24 50                       lea             edx,0x50[esp]
087B  FF 15 00 00 00 00                 call            dword ptr ___EFG_scanf
0881                            L$106:
0881  8A 61 10                          mov             ah,byte ptr 0x10[ecx]
0884  F6 C4 04                          test            ah,0x04
0887  74 10                             je              L$107
0889  8B 44 24 58                       mov             eax,dword ptr 0x58[esp]
088D  8B 18                             mov             ebx,dword ptr [eax]
088F  83 C3 08                          add             ebx,0x00000008
0892  89 18                             mov             dword ptr [eax],ebx
0894  C4 5B F8                          les             ebx,fword ptr -0x8[ebx]
0897  EB 2B                             jmp             L$109
0899                            L$107:
0899  F6 C4 08                          test            ah,0x08
089C  74 14                             je              L$108
089E  8B 44 24 58                       mov             eax,dword ptr 0x58[esp]
08A2  8B 10                             mov             edx,dword ptr [eax]
08A4  83 C2 04                          add             edx,0x00000004
08A7  89 10                             mov             dword ptr [eax],edx
08A9  8C D8                             mov             eax,ds
08AB  8E C0                             mov             es,eax
08AD  8B 5A FC                          mov             ebx,dword ptr -0x4[edx]
08B0  EB 12                             jmp             L$109
08B2                            L$108:
08B2  8B 44 24 58                       mov             eax,dword ptr 0x58[esp]
08B6  8B 28                             mov             ebp,dword ptr [eax]
08B8  83 C5 04                          add             ebp,0x00000004
08BB  89 28                             mov             dword ptr [eax],ebp
08BD  8C D8                             mov             eax,ds
08BF  8E C0                             mov             es,eax
08C1  8B 5D FC                          mov             ebx,dword ptr -0x4[ebp]
08C4                            L$109:
08C4  8A 71 10                          mov             dh,byte ptr 0x10[ecx]
08C7  F6 C6 10                          test            dh,0x10
08CA  74 06                             je              L$110
08CC  8B 44 24 68                       mov             eax,dword ptr 0x68[esp]
08D0  EB 28                             jmp             L$113
08D2                            L$110:
08D2  F6 C6 20                          test            dh,0x20
08D5  75 05                             jne             L$111
08D7  F6 C6 40                          test            dh,0x40
08DA  74 11                             je              L$112
08DC                            L$111:
08DC  8B 44 24 50                       mov             eax,dword ptr 0x50[esp]
08E0  26 89 03                          mov             dword ptr es:[ebx],eax
08E3  8B 44 24 54                       mov             eax,dword ptr 0x54[esp]
08E7  26 89 43 04                       mov             dword ptr es:0x4[ebx],eax
08EB  EB 10                             jmp             L$114
08ED                            L$112:
08ED  8B 44 24 50                       mov             eax,dword ptr 0x50[esp]
08F1  8B 54 24 54                       mov             edx,dword ptr 0x54[esp]
08F5  E8 00 00 00 00                    call            __FDFS
08FA                            L$113:
08FA  26 89 03                          mov             dword ptr es:[ebx],eax
08FD                            L$114:
08FD  89 F8                             mov             eax,edi
08FF  83 C4 70                          add             esp,0x00000070
0902  5D                                pop             ebp
0903  E9 A7 FA FF FF                    jmp             L$52
0908                            scan_int_:
0908  56                                push            esi
0909  57                                push            edi
090A  06                                push            es
090B  55                                push            ebp
090C  83 EC 10                          sub             esp,0x00000010
090F  89 C6                             mov             esi,eax
0911  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
0915  89 DF                             mov             edi,ebx
0917  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
091B  31 D2                             xor             edx,edx
091D  31 DB                             xor             ebx,ebx
091F  31 ED                             xor             ebp,ebp
0921  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0925                            L$115:
0925  89 F0                             mov             eax,esi
0927  FF 16                             call            dword ptr [esi]
0929  89 C2                             mov             edx,eax
092B  FE C0                             inc             al
092D  25 FF 00 00 00                    and             eax,0x000000ff
0932  F6 80 00 00 00 00 02              test            byte ptr __IsTable[eax],0x02
0939  74 03                             je              L$116
093B  45                                inc             ebp
093C  EB E7                             jmp             L$115
093E                            L$116:
093E  F6 46 10 02                       test            byte ptr 0x10[esi],0x02
0942  0F 85 36 01 00 00                 jne             L$129
0948  8B 46 0C                          mov             eax,dword ptr 0xc[esi]
094B  8D 48 FF                          lea             ecx,-0x1[eax]
094E  89 4E 0C                          mov             dword ptr 0xc[esi],ecx
0951  85 C0                             test            eax,eax
0953  0F 84 1E 01 00 00                 je              L$128
0959  B9 2B 00 00 00                    mov             ecx,0x0000002b
095E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0962  89 0C 24                          mov             dword ptr [esp],ecx
0965  85 C0                             test            eax,eax
0967  74 20                             je              L$118
0969  83 FA 2B                          cmp             edx,0x0000002b
096C  74 05                             je              L$117
096E  83 FA 2D                          cmp             edx,0x0000002d
0971  75 16                             jne             L$118
0973                            L$117:
0973  89 14 24                          mov             dword ptr [esp],edx
0976  89 F0                             mov             eax,esi
0978  45                                inc             ebp
0979  E8 00 00 00 00                    call            cgetw_
097E  89 C2                             mov             edx,eax
0980  83 F8 FF                          cmp             eax,0xffffffff
0983  0F 84 F5 00 00 00                 je              L$129
0989                            L$118:
0989  85 FF                             test            edi,edi
098B  75 54                             jne             L$122
098D  83 FA 30                          cmp             edx,0x00000030
0990  75 48                             jne             L$121
0992  89 F0                             mov             eax,esi
0994  BB 01 00 00 00                    mov             ebx,0x00000001
0999  E8 00 00 00 00                    call            cgetw_
099E  89 C1                             mov             ecx,eax
09A0  89 C2                             mov             edx,eax
09A2  83 F8 FF                          cmp             eax,0xffffffff
09A5  0F 84 D3 00 00 00                 je              L$129
09AB  83 F8 78                          cmp             eax,0x00000078
09AE  74 05                             je              L$119
09B0  83 F8 58                          cmp             eax,0x00000058
09B3  75 1E                             jne             L$120
09B5                            L$119:
09B5  89 F0                             mov             eax,esi
09B7  83 C5 02                          add             ebp,0x00000002
09BA  E8 00 00 00 00                    call            cgetw_
09BF  31 DB                             xor             ebx,ebx
09C1  89 C2                             mov             edx,eax
09C3  83 F8 FF                          cmp             eax,0xffffffff
09C6  0F 84 B2 00 00 00                 je              L$129
09CC  BF 10 00 00 00                    mov             edi,0x00000010
09D1  EB 4E                             jmp             L$125
09D3                            L$120:
09D3  BF 08 00 00 00                    mov             edi,0x00000008
09D8  EB 47                             jmp             L$125
09DA                            L$121:
09DA  BF 0A 00 00 00                    mov             edi,0x0000000a
09DF  EB 40                             jmp             L$125
09E1                            L$122:
09E1  83 FF 10                          cmp             edi,0x00000010
09E4  75 3B                             jne             L$125
09E6  83 FA 30                          cmp             edx,0x00000030
09E9  75 36                             jne             L$125
09EB  89 F0                             mov             eax,esi
09ED  BB 01 00 00 00                    mov             ebx,0x00000001
09F2  E8 00 00 00 00                    call            cgetw_
09F7  89 C1                             mov             ecx,eax
09F9  89 C2                             mov             edx,eax
09FB  83 F8 FF                          cmp             eax,0xffffffff
09FE  0F 84 7A 00 00 00                 je              L$129
0A04  83 F8 78                          cmp             eax,0x00000078
0A07  74 05                             je              L$123
0A09  83 F8 58                          cmp             eax,0x00000058
0A0C  75 13                             jne             L$125
0A0E                            L$123:
0A0E  89 F0                             mov             eax,esi
0A10  83 C5 02                          add             ebp,0x00000002
0A13  E8 00 00 00 00                    call            cgetw_
0A18  31 DB                             xor             ebx,ebx
0A1A                            L$124:
0A1A  89 C2                             mov             edx,eax
0A1C  83 F8 FF                          cmp             eax,0xffffffff
0A1F  74 5D                             je              L$129
0A21                            L$125:
0A21  89 D0                             mov             eax,edx
0A23  E8 D8 00 00 00                    call            radix_value_
0A28  39 F8                             cmp             eax,edi
0A2A  7D 17                             jge             L$126
0A2C  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0A30  0F AF D7                          imul            edx,edi
0A33  43                                inc             ebx
0A34  01 C2                             add             edx,eax
0A36  89 F0                             mov             eax,esi
0A38  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0A3C  E8 00 00 00 00                    call            cgetw_
0A41  EB D7                             jmp             L$124
0A43                            L$126:
0A43  83 FA 3A                          cmp             edx,0x0000003a
0A46  75 2F                             jne             L$128
0A48  F6 46 10 80                       test            byte ptr 0x10[esi],0x80
0A4C  74 29                             je              L$128
0A4E                            L$127:
0A4E  89 F0                             mov             eax,esi
0A50  43                                inc             ebx
0A51  E8 00 00 00 00                    call            cgetw_
0A56  89 C1                             mov             ecx,eax
0A58  89 C2                             mov             edx,eax
0A5A  83 F8 FF                          cmp             eax,0xffffffff
0A5D  74 1F                             je              L$129
0A5F  E8 9C 00 00 00                    call            radix_value_
0A64  39 F8                             cmp             eax,edi
0A66  7D 0F                             jge             L$128
0A68  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0A6C  0F AF D7                          imul            edx,edi
0A6F  01 C2                             add             edx,eax
0A71  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0A75  EB D7                             jmp             L$127
0A77                            L$128:
0A77  89 D0                             mov             eax,edx
0A79  89 F2                             mov             edx,esi
0A7B  FF 56 04                          call            dword ptr 0x4[esi]
0A7E                            L$129:
0A7E  83 3C 24 2D                       cmp             dword ptr [esp],0x0000002d
0A82  75 04                             jne             L$130
0A84  F7 5C 24 08                       neg             dword ptr 0x8[esp]
0A88                            L$130:
0A88  85 DB                             test            ebx,ebx
0A8A  0F 8E 66 00 00 00                 jle             L$135
0A90  8A 66 10                          mov             ah,byte ptr 0x10[esi]
0A93  01 EB                             add             ebx,ebp
0A95  F6 C4 01                          test            ah,0x01
0A98  74 5C                             je              L$135
0A9A  F6 C4 04                          test            ah,0x04
0A9D  74 10                             je              L$131
0A9F  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0AA3  8B 10                             mov             edx,dword ptr [eax]
0AA5  83 C2 08                          add             edx,0x00000008
0AA8  89 10                             mov             dword ptr [eax],edx
0AAA  C4 42 F8                          les             eax,fword ptr -0x8[edx]
0AAD  EB 2B                             jmp             L$133
0AAF                            L$131:
0AAF  F6 C4 08                          test            ah,0x08
0AB2  74 14                             je              L$132
0AB4  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0AB8  8B 28                             mov             ebp,dword ptr [eax]
0ABA  83 C5 04                          add             ebp,0x00000004
0ABD  8C DA                             mov             edx,ds
0ABF  89 28                             mov             dword ptr [eax],ebp
0AC1  8E C2                             mov             es,edx
0AC3  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0AC6  EB 12                             jmp             L$133
0AC8                            L$132:
0AC8  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0ACC  8B 38                             mov             edi,dword ptr [eax]
0ACE  83 C7 04                          add             edi,0x00000004
0AD1  8C DA                             mov             edx,ds
0AD3  89 38                             mov             dword ptr [eax],edi
0AD5  8E C2                             mov             es,edx
0AD7  8B 47 FC                          mov             eax,dword ptr -0x4[edi]
0ADA                            L$133:
0ADA  8A 4E 10                          mov             cl,byte ptr 0x10[esi]
0ADD  F6 C1 10                          test            cl,0x10
0AE0  74 0A                             je              L$134
0AE2  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0AE6  66 26 89 10                       mov             word ptr es:[eax],dx
0AEA  EB 0A                             jmp             L$135
0AEC                            L$134:
0AEC  F6 C1 20                          test            cl,0x20
0AEF  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0AF3  26 89 10                          mov             dword ptr es:[eax],edx
0AF6                            L$135:
0AF6  89 D8                             mov             eax,ebx
0AF8  83 C4 10                          add             esp,0x00000010
0AFB  5D                                pop             ebp
0AFC  07                                pop             es
0AFD  5F                                pop             edi
0AFE  5E                                pop             esi
0AFF  C3                                ret
0B00                            radix_value_:
0B00  83 F8 30                          cmp             eax,0x00000030
0B03  7C 09                             jl              L$136
0B05  83 F8 39                          cmp             eax,0x00000039
0B08  7F 04                             jg              L$136
0B0A  83 E8 30                          sub             eax,0x00000030
0B0D  C3                                ret
0B0E                            L$136:
0B0E  E8 00 00 00 00                    call            tolower_
0B13  83 F8 61                          cmp             eax,0x00000061
0B16  7C 09                             jl              L$137
0B18  83 F8 66                          cmp             eax,0x00000066
0B1B  7F 04                             jg              L$137
0B1D  83 E8 57                          sub             eax,0x00000057
0B20  C3                                ret
0B21                            L$137:
0B21  B8 10 00 00 00                    mov             eax,0x00000010
0B26  C3                                ret
0B27                            cgetw_:
0B27  53                                push            ebx
0B28  52                                push            edx
0B29  89 C2                             mov             edx,eax
0B2B  8B 40 0C                          mov             eax,dword ptr 0xc[eax]
0B2E  8D 58 FF                          lea             ebx,-0x1[eax]
0B31  89 5A 0C                          mov             dword ptr 0xc[edx],ebx
0B34  85 C0                             test            eax,eax
0B36  74 0A                             je              L$138
0B38  89 D0                             mov             eax,edx
0B3A  FF 12                             call            dword ptr [edx]
0B3C  F6 42 10 02                       test            byte ptr 0x10[edx],0x02
0B40  74 05                             je              L$139
0B42                            L$138:
0B42  B8 FF FF FF FF                    mov             eax,0xffffffff
0B47                            L$139:
0B47  5A                                pop             edx
0B48  5B                                pop             ebx
0B49  C3                                ret

Routine Size: 2890 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000                            _lst_mask:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

