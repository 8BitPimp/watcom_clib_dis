Module: qsort
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004BB bytes
0000                            byteswap_:
0000  06                                push            es
0001  1E                                push            ds
0002  07                                pop             es
0003  0F B6 D1                          movzx           edx,cl
0006  C1 E9 02                          shr             ecx,0x02
0009  74 0B                             je              L$2
000B                            L$1:
000B  8B 07                             mov             eax,dword ptr [edi]
000D  87 06                             xchg            dword ptr [esi],eax
000F  AB                                stosd
0010  83 C6 04                          add             esi,0x00000004
0013  49                                dec             ecx
0014  75 F5                             jne             L$1
0016                            L$2:
0016  80 E2 03                          and             dl,0x03
0019  74 09                             je              L$4
001B                            L$3:
001B  8A 07                             mov             al,byte ptr [edi]
001D  86 06                             xchg            byte ptr [esi],al
001F  AA                                stosb
0020  46                                inc             esi
0021  4A                                dec             edx
0022  75 F7                             jne             L$3
0024                            L$4:
0024  07                                pop             es
0025  C3                                ret
0026                            med3_:
0026  56                                push            esi
0027  57                                push            edi
0028  06                                push            es
0029  0F A0                             push            fs
002B  0F A8                             push            gs
002D  C8 04 00 00                       enter           0x0004,0x00
0031  89 C7                             mov             edi,eax
0033  89 D6                             mov             esi,edx
0035  89 4D FC                          mov             dword ptr -0x4[ebp],ecx
0038  FF 55 FC                          call            dword ptr -0x4[ebp]
003B  85 C0                             test            eax,eax
003D  7E 1E                             jle             L$7
003F  89 F8                             mov             eax,edi
0041  89 DA                             mov             edx,ebx
0043  FF 55 FC                          call            dword ptr -0x4[ebp]
0046  85 C0                             test            eax,eax
0048  7E 0F                             jle             L$6
004A  89 F0                             mov             eax,esi
004C  89 DA                             mov             edx,ebx
004E  FF 55 FC                          call            dword ptr -0x4[ebp]
0051  85 C0                             test            eax,eax
0053  7F 1E                             jg              L$8
0055                            L$5:
0055  89 D8                             mov             eax,ebx
0057  EB 1C                             jmp             L$9
0059                            L$6:
0059  89 F8                             mov             eax,edi
005B  EB 18                             jmp             L$9
005D                            L$7:
005D  89 F8                             mov             eax,edi
005F  89 DA                             mov             edx,ebx
0061  FF 55 FC                          call            dword ptr -0x4[ebp]
0064  85 C0                             test            eax,eax
0066  7D F1                             jge             L$6
0068  89 F0                             mov             eax,esi
006A  89 DA                             mov             edx,ebx
006C  FF 55 FC                          call            dword ptr -0x4[ebp]
006F  85 C0                             test            eax,eax
0071  7F E2                             jg              L$5
0073                            L$8:
0073  89 F0                             mov             eax,esi
0075                            L$9:
0075  C9                                leave
0076  0F A9                             pop             gs
0078  0F A1                             pop             fs
007A  07                                pop             es
007B  5F                                pop             edi
007C  5E                                pop             esi
007D  C3                                ret

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

007E                            qsort_:
007E  56                                push            esi
007F  57                                push            edi
0080  06                                push            es
0081  0F A0                             push            fs
0083  0F A8                             push            gs
0085  C8 44 01 00                       enter           0x0144,0x00
0089  50                                push            eax
008A  52                                push            edx
008B  53                                push            ebx
008C  09 D8                             or              eax,ebx
008E  89 4D EC                          mov             dword ptr -0x14[ebp],ecx
0091  A8 03                             test            al,0x03
0093  74 07                             je              L$10
0095  B8 02 00 00 00                    mov             eax,0x00000002
009A  EB 09                             jmp             L$11
009C                            L$10:
009C  83 FB 04                          cmp             ebx,0x00000004
009F  0F 97 C0                          seta            al
00A2  0F B6 C0                          movzx           eax,al
00A5                            L$11:
00A5  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
00A8  6B 85 B0 FE FF FF 03              imul            eax,dword ptr -0x150[ebp],0x00000003
00AF  89 45 C8                          mov             dword ptr -0x38[ebp],eax
00B2  8B 85 B0 FE FF FF                 mov             eax,dword ptr -0x150[ebp]
00B8  01 C0                             add             eax,eax
00BA  C7 45 F0 00 00 00 00              mov             dword ptr -0x10[ebp],0x00000000
00C1  89 45 CC                          mov             dword ptr -0x34[ebp],eax
00C4                            L$12:
00C4  83 BD B4 FE FF FF 01              cmp             dword ptr -0x14c[ebp],0x00000001
00CB  0F 86 91 00 00 00                 jbe             L$22
00D1  83 BD B4 FE FF FF 10              cmp             dword ptr -0x14c[ebp],0x00000010
00D8  0F 83 B3 00 00 00                 jae             L$23
00DE  8B 45 C8                          mov             eax,dword ptr -0x38[ebp]
00E1  89 45 E8                          mov             dword ptr -0x18[ebp],eax
00E4  8B 85 B4 FE FF FF                 mov             eax,dword ptr -0x14c[ebp]
00EA  0F AF 85 B0 FE FF FF              imul            eax,dword ptr -0x150[ebp]
00F1  8B 95 B8 FE FF FF                 mov             edx,dword ptr -0x148[ebp]
00F7  01 C2                             add             edx,eax
00F9  89 55 C4                          mov             dword ptr -0x3c[ebp],edx
00FC  EB 5E                             jmp             L$21
00FE                            L$13:
00FE  8B 85 B8 FE FF FF                 mov             eax,dword ptr -0x148[ebp]
0104  03 45 E8                          add             eax,dword ptr -0x18[ebp]
0107  89 45 DC                          mov             dword ptr -0x24[ebp],eax
010A  EB 42                             jmp             L$20
010C                            L$14:
010C  89 C3                             mov             ebx,eax
010E  EB 20                             jmp             L$18
0110                            L$15:
0110  83 7D E4 00                       cmp             dword ptr -0x1c[ebp],0x00000000
0114  74 0F                             je              L$16
0116  8B 8D B0 FE FF FF                 mov             ecx,dword ptr -0x150[ebp]
011C  89 DE                             mov             esi,ebx
011E  E8 00 00 00 00                    call            byteswap_
0123  EB 08                             jmp             L$17
0125                            L$16:
0125  8B 07                             mov             eax,dword ptr [edi]
0127  8B 13                             mov             edx,dword ptr [ebx]
0129  89 03                             mov             dword ptr [ebx],eax
012B  89 17                             mov             dword ptr [edi],edx
012D                            L$17:
012D  2B 5D E8                          sub             ebx,dword ptr -0x18[ebp]
0130                            L$18:
0130  3B 9D B8 FE FF FF                 cmp             ebx,dword ptr -0x148[ebp]
0136  76 10                             jbe             L$19
0138  89 DF                             mov             edi,ebx
013A  2B 7D E8                          sub             edi,dword ptr -0x18[ebp]
013D  89 DA                             mov             edx,ebx
013F  89 F8                             mov             eax,edi
0141  FF 55 EC                          call            dword ptr -0x14[ebp]
0144  85 C0                             test            eax,eax
0146  7F C8                             jg              L$15
0148                            L$19:
0148  8B 45 E8                          mov             eax,dword ptr -0x18[ebp]
014B  01 45 DC                          add             dword ptr -0x24[ebp],eax
014E                            L$20:
014E  8B 45 DC                          mov             eax,dword ptr -0x24[ebp]
0151  3B 45 C4                          cmp             eax,dword ptr -0x3c[ebp]
0154  72 B6                             jb              L$14
0156  8B 45 CC                          mov             eax,dword ptr -0x34[ebp]
0159  29 45 E8                          sub             dword ptr -0x18[ebp],eax
015C                            L$21:
015C  83 7D E8 00                       cmp             dword ptr -0x18[ebp],0x00000000
0160  7F 9C                             jg              L$13
0162                            L$22:
0162  83 7D F0 00                       cmp             dword ptr -0x10[ebp],0x00000000
0166  0F 84 09 FF FF FF                 je              L$9
016C  FF 4D F0                          dec             dword ptr -0x10[ebp]
016F  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
0172  8B 94 85 BC FE FF FF              mov             edx,dword ptr -0x144[ebp+eax*4]
0179  8B 84 85 3C FF FF FF              mov             eax,dword ptr -0xc4[ebp+eax*4]
0180  89 95 B8 FE FF FF                 mov             dword ptr -0x148[ebp],edx
0186  89 85 B4 FE FF FF                 mov             dword ptr -0x14c[ebp],eax
018C  E9 33 FF FF FF                    jmp             L$12
0191                            L$23:
0191  8B BD B4 FE FF FF                 mov             edi,dword ptr -0x14c[ebp]
0197  D1 EF                             shr             edi,0x01
0199  0F AF BD B0 FE FF FF              imul            edi,dword ptr -0x150[ebp]
01A0  03 BD B8 FE FF FF                 add             edi,dword ptr -0x148[ebp]
01A6  83 BD B4 FE FF FF 1D              cmp             dword ptr -0x14c[ebp],0x0000001d
01AD  0F 86 A2 00 00 00                 jbe             L$25
01B3  8B 85 B8 FE FF FF                 mov             eax,dword ptr -0x148[ebp]
01B9  89 45 D0                          mov             dword ptr -0x30[ebp],eax
01BC  8B 85 B4 FE FF FF                 mov             eax,dword ptr -0x14c[ebp]
01C2  48                                dec             eax
01C3  0F AF 85 B0 FE FF FF              imul            eax,dword ptr -0x150[ebp]
01CA  8B B5 B8 FE FF FF                 mov             esi,dword ptr -0x148[ebp]
01D0  01 C6                             add             esi,eax
01D2  83 BD B4 FE FF FF 2A              cmp             dword ptr -0x14c[ebp],0x0000002a
01D9  76 69                             jbe             L$24
01DB  8B 85 B4 FE FF FF                 mov             eax,dword ptr -0x14c[ebp]
01E1  8B 95 B0 FE FF FF                 mov             edx,dword ptr -0x150[ebp]
01E7  C1 E8 03                          shr             eax,0x03
01EA  0F AF D0                          imul            edx,eax
01ED  8B 9D B8 FE FF FF                 mov             ebx,dword ptr -0x148[ebp]
01F3  8B 4D EC                          mov             ecx,dword ptr -0x14[ebp]
01F6  89 55 E0                          mov             dword ptr -0x20[ebp],edx
01F9  8D 04 12                          lea             eax,[edx+edx]
01FC  8B 95 B8 FE FF FF                 mov             edx,dword ptr -0x148[ebp]
0202  89 45 C0                          mov             dword ptr -0x40[ebp],eax
0205  01 C3                             add             ebx,eax
0207  8B 85 B8 FE FF FF                 mov             eax,dword ptr -0x148[ebp]
020D  03 55 E0                          add             edx,dword ptr -0x20[ebp]
0210  E8 00 00 00 00                    call            med3_
0215  8B 5D E0                          mov             ebx,dword ptr -0x20[ebp]
0218  8B 4D EC                          mov             ecx,dword ptr -0x14[ebp]
021B  89 45 D0                          mov             dword ptr -0x30[ebp],eax
021E  89 FA                             mov             edx,edi
0220  89 F8                             mov             eax,edi
0222  01 FB                             add             ebx,edi
0224  2B 45 E0                          sub             eax,dword ptr -0x20[ebp]
0227  E8 00 00 00 00                    call            med3_
022C  8B 4D EC                          mov             ecx,dword ptr -0x14[ebp]
022F  89 C7                             mov             edi,eax
0231  89 F2                             mov             edx,esi
0233  89 F3                             mov             ebx,esi
0235  89 F0                             mov             eax,esi
0237  2B 55 E0                          sub             edx,dword ptr -0x20[ebp]
023A  2B 45 C0                          sub             eax,dword ptr -0x40[ebp]
023D  E8 00 00 00 00                    call            med3_
0242  89 C6                             mov             esi,eax
0244                            L$24:
0244  8B 45 D0                          mov             eax,dword ptr -0x30[ebp]
0247  8B 4D EC                          mov             ecx,dword ptr -0x14[ebp]
024A  89 FA                             mov             edx,edi
024C  89 F3                             mov             ebx,esi
024E  E8 00 00 00 00                    call            med3_
0253  89 C7                             mov             edi,eax
0255                            L$25:
0255  83 7D E4 00                       cmp             dword ptr -0x1c[ebp],0x00000000
0259  74 2A                             je              L$27
025B  8B 85 B8 FE FF FF                 mov             eax,dword ptr -0x148[ebp]
0261  89 45 D4                          mov             dword ptr -0x2c[ebp],eax
0264  74 0F                             je              L$26
0266  8B 8D B0 FE FF FF                 mov             ecx,dword ptr -0x150[ebp]
026C  89 C6                             mov             esi,eax
026E  E8 00 00 00 00                    call            byteswap_
0273  EB 1B                             jmp             L$28
0275                            L$26:
0275  8B 9D B8 FE FF FF                 mov             ebx,dword ptr -0x148[ebp]
027B  8B 10                             mov             edx,dword ptr [eax]
027D  8B 07                             mov             eax,dword ptr [edi]
027F  89 03                             mov             dword ptr [ebx],eax
0281  89 17                             mov             dword ptr [edi],edx
0283  EB 0B                             jmp             L$28
0285                            L$27:
0285  8D 45 BC                          lea             eax,-0x44[ebp]
0288  89 45 D4                          mov             dword ptr -0x2c[ebp],eax
028B  8B 07                             mov             eax,dword ptr [edi]
028D  89 45 BC                          mov             dword ptr -0x44[ebp],eax
0290                            L$28:
0290  8B 85 B4 FE FF FF                 mov             eax,dword ptr -0x14c[ebp]
0296  48                                dec             eax
0297  0F AF 85 B0 FE FF FF              imul            eax,dword ptr -0x150[ebp]
029E  8B 9D B8 FE FF FF                 mov             ebx,dword ptr -0x148[ebp]
02A4  8D 14 03                          lea             edx,[ebx+eax]
02A7  89 5D F4                          mov             dword ptr -0xc[ebp],ebx
02AA  89 55 F8                          mov             dword ptr -0x8[ebp],edx
02AD  89 55 FC                          mov             dword ptr -0x4[ebp],edx
02B0                            L$29:
02B0  3B 5D FC                          cmp             ebx,dword ptr -0x4[ebp]
02B3  77 45                             ja              L$33
02B5  8B 55 D4                          mov             edx,dword ptr -0x2c[ebp]
02B8  89 D8                             mov             eax,ebx
02BA  FF 55 EC                          call            dword ptr -0x14[ebp]
02BD  85 C0                             test            eax,eax
02BF  7F 39                             jg              L$33
02C1  75 2F                             jne             L$32
02C3  83 7D E4 00                       cmp             dword ptr -0x1c[ebp],0x00000000
02C7  74 12                             je              L$30
02C9  8B 75 F4                          mov             esi,dword ptr -0xc[ebp]
02CC  8B 8D B0 FE FF FF                 mov             ecx,dword ptr -0x150[ebp]
02D2  89 DF                             mov             edi,ebx
02D4  E8 00 00 00 00                    call            byteswap_
02D9  EB 0E                             jmp             L$31
02DB                            L$30:
02DB  8B 55 F4                          mov             edx,dword ptr -0xc[ebp]
02DE  8B 4D F4                          mov             ecx,dword ptr -0xc[ebp]
02E1  8B 03                             mov             eax,dword ptr [ebx]
02E3  8B 12                             mov             edx,dword ptr [edx]
02E5  89 01                             mov             dword ptr [ecx],eax
02E7  89 13                             mov             dword ptr [ebx],edx
02E9                            L$31:
02E9  8B 85 B0 FE FF FF                 mov             eax,dword ptr -0x150[ebp]
02EF  01 45 F4                          add             dword ptr -0xc[ebp],eax
02F2                            L$32:
02F2  03 9D B0 FE FF FF                 add             ebx,dword ptr -0x150[ebp]
02F8  EB B6                             jmp             L$29
02FA                            L$33:
02FA  3B 5D FC                          cmp             ebx,dword ptr -0x4[ebp]
02FD  77 50                             ja              L$37
02FF  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0302  8B 55 D4                          mov             edx,dword ptr -0x2c[ebp]
0305  FF 55 EC                          call            dword ptr -0x14[ebp]
0308  85 C0                             test            eax,eax
030A  7C 43                             jl              L$37
030C  75 36                             jne             L$36
030E  83 7D E4 00                       cmp             dword ptr -0x1c[ebp],0x00000000
0312  74 13                             je              L$34
0314  8B 75 FC                          mov             esi,dword ptr -0x4[ebp]
0317  8B 7D F8                          mov             edi,dword ptr -0x8[ebp]
031A  8B 8D B0 FE FF FF                 mov             ecx,dword ptr -0x150[ebp]
0320  E8 00 00 00 00                    call            byteswap_
0325  EB 14                             jmp             L$35
0327                            L$34:
0327  8B 55 F8                          mov             edx,dword ptr -0x8[ebp]
032A  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
032D  8B 4D FC                          mov             ecx,dword ptr -0x4[ebp]
0330  8B 12                             mov             edx,dword ptr [edx]
0332  8B 00                             mov             eax,dword ptr [eax]
0334  89 11                             mov             dword ptr [ecx],edx
0336  8B 55 F8                          mov             edx,dword ptr -0x8[ebp]
0339  89 02                             mov             dword ptr [edx],eax
033B                            L$35:
033B  8B 85 B0 FE FF FF                 mov             eax,dword ptr -0x150[ebp]
0341  29 45 F8                          sub             dword ptr -0x8[ebp],eax
0344                            L$36:
0344  8B 85 B0 FE FF FF                 mov             eax,dword ptr -0x150[ebp]
034A  29 45 FC                          sub             dword ptr -0x4[ebp],eax
034D  EB AB                             jmp             L$33
034F                            L$37:
034F  3B 5D FC                          cmp             ebx,dword ptr -0x4[ebp]
0352  77 3A                             ja              L$40
0354  83 7D E4 00                       cmp             dword ptr -0x1c[ebp],0x00000000
0358  74 12                             je              L$38
035A  8B 7D FC                          mov             edi,dword ptr -0x4[ebp]
035D  8B 8D B0 FE FF FF                 mov             ecx,dword ptr -0x150[ebp]
0363  89 DE                             mov             esi,ebx
0365  E8 00 00 00 00                    call            byteswap_
036A  EB 0E                             jmp             L$39
036C                            L$38:
036C  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
036F  8B 00                             mov             eax,dword ptr [eax]
0371  8B 13                             mov             edx,dword ptr [ebx]
0373  89 03                             mov             dword ptr [ebx],eax
0375  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0378  89 10                             mov             dword ptr [eax],edx
037A                            L$39:
037A  8B 85 B0 FE FF FF                 mov             eax,dword ptr -0x150[ebp]
0380  03 9D B0 FE FF FF                 add             ebx,dword ptr -0x150[ebp]
0386  29 45 FC                          sub             dword ptr -0x4[ebp],eax
0389  E9 22 FF FF FF                    jmp             L$29
038E                            L$40:
038E  8B 85 B4 FE FF FF                 mov             eax,dword ptr -0x14c[ebp]
0394  0F AF 85 B0 FE FF FF              imul            eax,dword ptr -0x150[ebp]
039B  8B 95 B8 FE FF FF                 mov             edx,dword ptr -0x148[ebp]
03A1  89 D9                             mov             ecx,ebx
03A3  01 C2                             add             edx,eax
03A5  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
03A8  2B 4D F4                          sub             ecx,dword ptr -0xc[ebp]
03AB  2B 85 B8 FE FF FF                 sub             eax,dword ptr -0x148[ebp]
03B1  89 55 D8                          mov             dword ptr -0x28[ebp],edx
03B4  39 C8                             cmp             eax,ecx
03B6  7D 02                             jge             L$41
03B8  89 C1                             mov             ecx,eax
03BA                            L$41:
03BA  85 C9                             test            ecx,ecx
03BC  76 2F                             jbe             L$46
03BE  89 DF                             mov             edi,ebx
03C0  8B B5 B8 FE FF FF                 mov             esi,dword ptr -0x148[ebp]
03C6  29 CF                             sub             edi,ecx
03C8  06                                push            es
03C9  1E                                push            ds
03CA  07                                pop             es
03CB  0F B6 D1                          movzx           edx,cl
03CE  C1 E9 02                          shr             ecx,0x02
03D1  74 0B                             je              L$43
03D3                            L$42:
03D3  8B 07                             mov             eax,dword ptr [edi]
03D5  87 06                             xchg            dword ptr [esi],eax
03D7  AB                                stosd
03D8  83 C6 04                          add             esi,0x00000004
03DB  49                                dec             ecx
03DC  75 F5                             jne             L$42
03DE                            L$43:
03DE  80 E2 03                          and             dl,0x03
03E1  74 09                             je              L$45
03E3                            L$44:
03E3  8A 07                             mov             al,byte ptr [edi]
03E5  86 06                             xchg            byte ptr [esi],al
03E7  AA                                stosb
03E8  46                                inc             esi
03E9  4A                                dec             edx
03EA  75 F7                             jne             L$44
03EC                            L$45:
03EC  07                                pop             es
03ED                            L$46:
03ED  8B 45 D8                          mov             eax,dword ptr -0x28[ebp]
03F0  8B 4D F8                          mov             ecx,dword ptr -0x8[ebp]
03F3  2B 45 F8                          sub             eax,dword ptr -0x8[ebp]
03F6  2B 4D FC                          sub             ecx,dword ptr -0x4[ebp]
03F9  2B 85 B0 FE FF FF                 sub             eax,dword ptr -0x150[ebp]
03FF  39 C1                             cmp             ecx,eax
0401  72 02                             jb              L$47
0403  89 C1                             mov             ecx,eax
0405                            L$47:
0405  85 C9                             test            ecx,ecx
0407  76 2C                             jbe             L$52
0409  8B 7D D8                          mov             edi,dword ptr -0x28[ebp]
040C  89 DE                             mov             esi,ebx
040E  29 CF                             sub             edi,ecx
0410  06                                push            es
0411  1E                                push            ds
0412  07                                pop             es
0413  0F B6 D1                          movzx           edx,cl
0416  C1 E9 02                          shr             ecx,0x02
0419  74 0B                             je              L$49
041B                            L$48:
041B  8B 07                             mov             eax,dword ptr [edi]
041D  87 06                             xchg            dword ptr [esi],eax
041F  AB                                stosd
0420  83 C6 04                          add             esi,0x00000004
0423  49                                dec             ecx
0424  75 F5                             jne             L$48
0426                            L$49:
0426  80 E2 03                          and             dl,0x03
0429  74 09                             je              L$51
042B                            L$50:
042B  8A 07                             mov             al,byte ptr [edi]
042D  86 06                             xchg            byte ptr [esi],al
042F  AA                                stosb
0430  46                                inc             esi
0431  4A                                dec             edx
0432  75 F7                             jne             L$50
0434                            L$51:
0434  07                                pop             es
0435                            L$52:
0435  8B 75 F8                          mov             esi,dword ptr -0x8[ebp]
0438  8B 4D D8                          mov             ecx,dword ptr -0x28[ebp]
043B  89 DF                             mov             edi,ebx
043D  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
0440  2B 7D F4                          sub             edi,dword ptr -0xc[ebp]
0443  2B 75 FC                          sub             esi,dword ptr -0x4[ebp]
0446  C1 E3 02                          shl             ebx,0x02
0449  29 F1                             sub             ecx,esi
044B  39 FE                             cmp             esi,edi
044D  72 24                             jb              L$53
044F  89 F0                             mov             eax,esi
0451  31 D2                             xor             edx,edx
0453  F7 B5 B0 FE FF FF                 div             dword ptr -0x150[ebp]
0459  31 D2                             xor             edx,edx
045B  89 84 2B 3C FF FF FF              mov             dword ptr -0xc4[ebx+ebp],eax
0462  89 F8                             mov             eax,edi
0464  F7 B5 B0 FE FF FF                 div             dword ptr -0x150[ebp]
046A  89 8C 2B BC FE FF FF              mov             dword ptr -0x144[ebx+ebp],ecx
0471  EB 3A                             jmp             L$54
0473                            L$53:
0473  3B BD B0 FE FF FF                 cmp             edi,dword ptr -0x150[ebp]
0479  0F 86 E3 FC FF FF                 jbe             L$22
047F  8B 85 B8 FE FF FF                 mov             eax,dword ptr -0x148[ebp]
0485  31 D2                             xor             edx,edx
0487  89 84 2B BC FE FF FF              mov             dword ptr -0x144[ebx+ebp],eax
048E  89 F8                             mov             eax,edi
0490  F7 B5 B0 FE FF FF                 div             dword ptr -0x150[ebp]
0496  31 D2                             xor             edx,edx
0498  89 84 2B 3C FF FF FF              mov             dword ptr -0xc4[ebx+ebp],eax
049F  89 F0                             mov             eax,esi
04A1  F7 B5 B0 FE FF FF                 div             dword ptr -0x150[ebp]
04A7  89 8D B8 FE FF FF                 mov             dword ptr -0x148[ebp],ecx
04AD                            L$54:
04AD  89 85 B4 FE FF FF                 mov             dword ptr -0x14c[ebp],eax
04B3  FF 45 F0                          inc             dword ptr -0x10[ebp]
04B6  E9 09 FC FF FF                    jmp             L$12

Routine Size: 1085 bytes,    Routine Base: _TEXT + 007E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

