Module: write
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002AF bytes
0000                            write_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  89 E5                             mov             ebp,esp
0006  83 EC 10                          sub             esp,0x00000010
0009  50                                push            eax
000A  52                                push            edx
000B  53                                push            ebx
000C  8B 15 00 00 00 00                 mov             edx,dword ptr ___FileHandleIDs
0012  8B 04 82                          mov             eax,dword ptr [edx+eax*4]
0015  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0018  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
001B  E8 00 00 00 00                    call            __IOMode_
0020  89 C2                             mov             edx,eax
0022  89 C3                             mov             ebx,eax
0024  85 C0                             test            eax,eax
0026  75 14                             jne             L$2
0028  B8 04 00 00 00                    mov             eax,0x00000004
002D                            L$1:
002D  E8 00 00 00 00                    call            __set_errno_
0032  B8 FF FF FF FF                    mov             eax,0xffffffff
0037  E9 6C 02 00 00                    jmp             L$23
003C                            L$2:
003C  A8 02                             test            al,0x02
003E  75 07                             jne             L$3
0040  B8 06 00 00 00                    mov             eax,0x00000006
0045  EB E6                             jmp             L$1
0047                            L$3:
0047  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
004A  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0050  F6 C2 80                          test            dl,0x80
0053  74 27                             je              L$5
0055  6A 02                             push            0x00000002
0057  6A 00                             push            0x00000000
0059  6A 00                             push            0x00000000
005B  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
005E  52                                push            edx
005F  E8 00 00 00 00                    call            _SetFilePointer
0064  83 F8 FF                          cmp             eax,0xffffffff
0067  75 13                             jne             L$5
0069                            L$4:
0069  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
006C  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0072  E8 00 00 00 00                    call            __set_errno_nt_
0077  E9 2C 02 00 00                    jmp             L$23
007C                            L$5:
007C  F6 C3 40                          test            bl,0x40
007F  74 63                             je              L$8
0081  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsStdout,0x00000000
0088  74 1E                             je              L$6
008A  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
008D  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
0093  85 C0                             test            eax,eax
0095  74 11                             je              L$6
0097  8B 55 E8                          mov             edx,dword ptr -0x18[ebp]
009A  8B 5D E4                          mov             ebx,dword ptr -0x1c[ebp]
009D  FF 15 00 00 00 00                 call            dword ptr __WindowsStdout
00A3  89 45 F8                          mov             dword ptr -0x8[ebp],eax
00A6  EB 1B                             jmp             L$7
00A8                            L$6:
00A8  6A 00                             push            0x00000000
00AA  8D 45 F8                          lea             eax,-0x8[ebp]
00AD  50                                push            eax
00AE  8B 4D E4                          mov             ecx,dword ptr -0x1c[ebp]
00B1  51                                push            ecx
00B2  8B 75 E8                          mov             esi,dword ptr -0x18[ebp]
00B5  56                                push            esi
00B6  8B 7D FC                          mov             edi,dword ptr -0x4[ebp]
00B9  57                                push            edi
00BA  E8 00 00 00 00                    call            _WriteFile
00BF  85 C0                             test            eax,eax
00C1  74 A6                             je              L$4
00C3                            L$7:
00C3  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
00C6  3B 45 E4                          cmp             eax,dword ptr -0x1c[ebp]
00C9  0F 84 CD 01 00 00                 je              L$22
00CF  B8 0C 00 00 00                    mov             eax,0x0000000c
00D4  E8 00 00 00 00                    call            __set_errno_
00D9  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
00DC  89 45 E4                          mov             dword ptr -0x1c[ebp],eax
00DF  E9 B8 01 00 00                    jmp             L$22
00E4                            L$8:
00E4  E8 00 00 00 00                    call            stackavail_
00E9  89 45 F4                          mov             dword ptr -0xc[ebp],eax
00EC  3D B0 00 00 00                    cmp             eax,0x000000b0
00F1  73 05                             jae             L$9
00F3  E8 00 00 00 00                    call            __STKOVERFLOW_
00F8                            L$9:
00F8  8B 5D F4                          mov             ebx,dword ptr -0xc[ebp]
00FB  BE 00 02 00 00                    mov             esi,0x00000200
0100  81 FB 30 02 00 00                 cmp             ebx,0x00000230
0106  73 05                             jae             L$10
0108  BE 80 00 00 00                    mov             esi,0x00000080
010D                            L$10:
010D  8D 46 03                          lea             eax,0x3[esi]
0110  24 FC                             and             al,0xfc
0112  31 C9                             xor             ecx,ecx
0114  29 C4                             sub             esp,eax
0116  89 E7                             mov             edi,esp
0118  89 4D F4                          mov             dword ptr -0xc[ebp],ecx
011B  89 4D F0                          mov             dword ptr -0x10[ebp],ecx
011E  89 4D F8                          mov             dword ptr -0x8[ebp],ecx
0121                            L$11:
0121  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0124  3B 45 E4                          cmp             eax,dword ptr -0x1c[ebp]
0127  0F 83 04 01 00 00                 jae             L$19
012D  8B 45 E8                          mov             eax,dword ptr -0x18[ebp]
0130  03 45 F4                          add             eax,dword ptr -0xc[ebp]
0133  80 38 0A                          cmp             byte ptr [eax],0x0a
0136  0F 85 7C 00 00 00                 jne             L$16
013C  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
013F  C6 04 07 0D                       mov             byte ptr [edi+eax],0x0d
0143  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
0146  43                                inc             ebx
0147  89 5D F0                          mov             dword ptr -0x10[ebp],ebx
014A  39 DE                             cmp             esi,ebx
014C  75 6A                             jne             L$16
014E  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsStdout,0x00000000
0155  74 1A                             je              L$12
0157  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
015A  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
0160  85 C0                             test            eax,eax
0162  74 0D                             je              L$12
0164  89 FA                             mov             edx,edi
0166  FF 15 00 00 00 00                 call            dword ptr __WindowsStdout
016C  89 45 F0                          mov             dword ptr -0x10[ebp],eax
016F  EB 19                             jmp             L$13
0171                            L$12:
0171  6A 00                             push            0x00000000
0173  8D 45 F0                          lea             eax,-0x10[ebp]
0176  50                                push            eax
0177  56                                push            esi
0178  57                                push            edi
0179  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
017C  52                                push            edx
017D  E8 00 00 00 00                    call            _WriteFile
0182  85 C0                             test            eax,eax
0184  0F 84 DF FE FF FF                 je              L$4
018A                            L$13:
018A  3B 75 F0                          cmp             esi,dword ptr -0x10[ebp]
018D  74 1E                             je              L$15
018F                            L$14:
018F  B8 0C 00 00 00                    mov             eax,0x0000000c
0194  E8 00 00 00 00                    call            __set_errno_
0199  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
019C  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
01A2  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
01A5  03 45 F0                          add             eax,dword ptr -0x10[ebp]
01A8  E9 FB 00 00 00                    jmp             L$23
01AD                            L$15:
01AD  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
01B0  31 C9                             xor             ecx,ecx
01B2  89 45 F8                          mov             dword ptr -0x8[ebp],eax
01B5  89 4D F0                          mov             dword ptr -0x10[ebp],ecx
01B8                            L$16:
01B8  8B 55 E8                          mov             edx,dword ptr -0x18[ebp]
01BB  03 55 F4                          add             edx,dword ptr -0xc[ebp]
01BE  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
01C1  8A 12                             mov             dl,byte ptr [edx]
01C3  88 14 07                          mov             byte ptr [edi+eax],dl
01C6  8B 55 F4                          mov             edx,dword ptr -0xc[ebp]
01C9  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
01CC  42                                inc             edx
01CD  43                                inc             ebx
01CE  89 55 F4                          mov             dword ptr -0xc[ebp],edx
01D1  89 5D F0                          mov             dword ptr -0x10[ebp],ebx
01D4  39 DE                             cmp             esi,ebx
01D6  0F 85 45 FF FF FF                 jne             L$11
01DC  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsStdout,0x00000000
01E3  74 1A                             je              L$17
01E5  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
01E8  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
01EE  85 C0                             test            eax,eax
01F0  74 0D                             je              L$17
01F2  89 FA                             mov             edx,edi
01F4  FF 15 00 00 00 00                 call            dword ptr __WindowsStdout
01FA  89 45 F0                          mov             dword ptr -0x10[ebp],eax
01FD  EB 19                             jmp             L$18
01FF                            L$17:
01FF  6A 00                             push            0x00000000
0201  8D 45 F0                          lea             eax,-0x10[ebp]
0204  50                                push            eax
0205  56                                push            esi
0206  57                                push            edi
0207  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
020A  52                                push            edx
020B  E8 00 00 00 00                    call            _WriteFile
0210  85 C0                             test            eax,eax
0212  0F 84 51 FE FF FF                 je              L$4
0218                            L$18:
0218  3B 75 F0                          cmp             esi,dword ptr -0x10[ebp]
021B  0F 85 6E FF FF FF                 jne             L$14
0221  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0224  31 C9                             xor             ecx,ecx
0226  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0229  89 4D F0                          mov             dword ptr -0x10[ebp],ecx
022C  E9 F0 FE FF FF                    jmp             L$11
0231                            L$19:
0231  83 7D F0 00                       cmp             dword ptr -0x10[ebp],0x00000000
0235  74 65                             je              L$22
0237  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsStdout,0x00000000
023E  74 1D                             je              L$20
0240  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
0243  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
0249  85 C0                             test            eax,eax
024B  74 10                             je              L$20
024D  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
0250  89 FA                             mov             edx,edi
0252  FF 15 00 00 00 00                 call            dword ptr __WindowsStdout
0258  89 45 F4                          mov             dword ptr -0xc[ebp],eax
025B  EB 1C                             jmp             L$21
025D                            L$20:
025D  6A 00                             push            0x00000000
025F  8D 45 F4                          lea             eax,-0xc[ebp]
0262  50                                push            eax
0263  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
0266  50                                push            eax
0267  57                                push            edi
0268  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
026B  52                                push            edx
026C  E8 00 00 00 00                    call            _WriteFile
0271  85 C0                             test            eax,eax
0273  0F 84 F0 FD FF FF                 je              L$4
0279                            L$21:
0279  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
027C  3B 45 F0                          cmp             eax,dword ptr -0x10[ebp]
027F  74 1B                             je              L$22
0281  B8 0C 00 00 00                    mov             eax,0x0000000c
0286  E8 00 00 00 00                    call            __set_errno_
028B  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
028E  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0294  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0297  03 45 F4                          add             eax,dword ptr -0xc[ebp]
029A  EB 0C                             jmp             L$23
029C                            L$22:
029C  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
029F  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
02A5  8B 45 E4                          mov             eax,dword ptr -0x1c[ebp]
02A8                            L$23:
02A8  89 EC                             mov             esp,ebp
02AA  5D                                pop             ebp
02AB  5F                                pop             edi
02AC  5E                                pop             esi
02AD  59                                pop             ecx
02AE  C3                                ret

Routine Size: 687 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

