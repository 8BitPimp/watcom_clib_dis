Module: mbschr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000220 bytes
0000                            _mbstok:
0000  53                                push            ebx
0001  56                                push            esi
0002  55                                push            ebp
0003  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0007  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
000E  0F 84 86 00 00 00                 je              L$8
0014  85 C0                             test            eax,eax
0016  75 05                             jne             L$1
0018  A1 00 00 00 00                    mov             eax,dword ptr tokn
001D                            L$1:
001D  85 C0                             test            eax,eax
001F  0F 84 83 00 00 00                 je              L$9
0025  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0029  51                                push            ecx
002A  50                                push            eax
002B  E8 00 00 00 00                    call            _mbsspnp
0030  83 C4 08                          add             esp,0x00000008
0033  8A 10                             mov             dl,byte ptr [eax]
0035  89 C3                             mov             ebx,eax
0037  84 D2                             test            dl,dl
0039  75 06                             jne             L$2
003B  31 C0                             xor             eax,eax
003D  5D                                pop             ebp
003E  5E                                pop             esi
003F  5B                                pop             ebx
0040  C3                                ret
0041                            L$2:
0041  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
0045  56                                push            esi
0046  50                                push            eax
0047  E8 00 00 00 00                    call            _mbspbrk
004C  89 C2                             mov             edx,eax
004E  8A 08                             mov             cl,byte ptr [eax]
0050  83 C4 08                          add             esp,0x00000008
0053  84 C9                             test            cl,cl
0055  75 0A                             jne             L$3
0057  31 ED                             xor             ebp,ebp
0059  89 2D 00 00 00 00                 mov             dword ptr tokn,ebp
005F  EB 33                             jmp             L$7
0061                            L$3:
0061  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0068  74 19                             je              L$4
006A  88 CA                             mov             dl,cl
006C  81 E2 FF 00 00 00                 and             edx,0x000000ff
0072  8A 92 01 00 00 00                 mov             dl,byte ptr __MBCSIsTable+0x1[edx]
0078  80 E2 01                          and             dl,0x01
007B  81 E2 FF 00 00 00                 and             edx,0x000000ff
0081  EB 02                             jmp             L$5
0083                            L$4:
0083  31 C2                             xor             edx,eax
0085                            L$5:
0085  74 04                             je              L$6
0087  C6 00 00                          mov             byte ptr [eax],0x00
008A  40                                inc             eax
008B                            L$6:
008B  C6 00 00                          mov             byte ptr [eax],0x00
008E  40                                inc             eax
008F  A3 00 00 00 00                    mov             dword ptr tokn,eax
0094                            L$7:
0094  89 D8                             mov             eax,ebx
0096  5D                                pop             ebp
0097  5E                                pop             esi
0098  5B                                pop             ebx
0099  C3                                ret
009A                            L$8:
009A  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
009E  53                                push            ebx
009F  50                                push            eax
00A0  E8 00 00 00 00                    call            strtok
00A5  83 C4 08                          add             esp,0x00000008
00A8                            L$9:
00A8  5D                                pop             ebp
00A9  5E                                pop             esi
00AA  5B                                pop             ebx
00AB  C3                                ret

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

00AC                            _mbschr:
00AC  53                                push            ebx
00AD  56                                push            esi
00AE  83 EC 04                          sub             esp,0x00000004
00B1  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
00B5  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
00B9  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
00C0  74 1D                             je              L$11
00C2                            L$10:
00C2  89 E0                             mov             eax,esp
00C4  50                                push            eax
00C5  56                                push            esi
00C6  E8 00 00 00 00                    call            _mbgetcode
00CB  83 C4 08                          add             esp,0x00000008
00CE  8B 0C 24                          mov             ecx,dword ptr [esp]
00D1  39 CB                             cmp             ebx,ecx
00D3  74 24                             je              L$14
00D5  89 C6                             mov             esi,eax
00D7  85 C9                             test            ecx,ecx
00D9  75 E7                             jne             L$10
00DB  31 C0                             xor             eax,eax
00DD  EB 1C                             jmp             L$15
00DF                            L$11:
00DF  88 DA                             mov             dl,bl
00E1                            L$12:
00E1  8A 06                             mov             al,byte ptr [esi]
00E3  3A C2                             cmp             al,dl
00E5  74 12                             je              L$14
00E7  3C 00                             cmp             al,0x00
00E9  74 0C                             je              L$13
00EB  46                                inc             esi
00EC  8A 06                             mov             al,byte ptr [esi]
00EE  3A C2                             cmp             al,dl
00F0  74 07                             je              L$14
00F2  46                                inc             esi
00F3  3C 00                             cmp             al,0x00
00F5  75 EA                             jne             L$12
00F7                            L$13:
00F7  2B F6                             sub             esi,esi
00F9                            L$14:
00F9  89 F0                             mov             eax,esi
00FB                            L$15:
00FB  83 C4 04                          add             esp,0x00000004
00FE  5E                                pop             esi
00FF  5B                                pop             ebx
0100  C3                                ret

Routine Size: 85 bytes,    Routine Base: _TEXT + 00AC

0101                            _mbsrchr:
0101  53                                push            ebx
0102  56                                push            esi
0103  57                                push            edi
0104  83 EC 04                          sub             esp,0x00000004
0107  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
010B  8B 7C 24 18                       mov             edi,dword ptr 0x18[esp]
010F  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0116  74 23                             je              L$19
0118  31 F6                             xor             esi,esi
011A                            L$16:
011A  89 E0                             mov             eax,esp
011C  50                                push            eax
011D  53                                push            ebx
011E  E8 00 00 00 00                    call            _mbgetcode
0123  83 C4 08                          add             esp,0x00000008
0126  8B 0C 24                          mov             ecx,dword ptr [esp]
0129  85 C9                             test            ecx,ecx
012B  74 0A                             je              L$18
012D  39 CF                             cmp             edi,ecx
012F  75 02                             jne             L$17
0131  89 DE                             mov             esi,ebx
0133                            L$17:
0133  89 C3                             mov             ebx,eax
0135  EB E3                             jmp             L$16
0137                            L$18:
0137  89 F0                             mov             eax,esi
0139  EB 0A                             jmp             L$20
013B                            L$19:
013B  57                                push            edi
013C  53                                push            ebx
013D  E8 00 00 00 00                    call            strrchr
0142  83 C4 08                          add             esp,0x00000008
0145                            L$20:
0145  83 C4 04                          add             esp,0x00000004
0148  5F                                pop             edi
0149  5E                                pop             esi
014A  5B                                pop             ebx
014B  C3                                ret

Routine Size: 75 bytes,    Routine Base: _TEXT + 0101

014C                            _mbspbrk:
014C  53                                push            ebx
014D  56                                push            esi
014E  57                                push            edi
014F  55                                push            ebp
0150  83 EC 08                          sub             esp,0x00000008
0153  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0157  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
015B  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0162  75 28                             jne             L$24
0164  EB 44                             jmp             L$26
0166                            L$21:
0166  89 FA                             mov             edx,edi
0168                            L$22:
0168  89 E0                             mov             eax,esp
016A  50                                push            eax
016B  52                                push            edx
016C  E8 00 00 00 00                    call            _mbgetcode
0171  83 C4 08                          add             esp,0x00000008
0174  89 C2                             mov             edx,eax
0176  3B 2C 24                          cmp             ebp,dword ptr [esp]
0179  75 04                             jne             L$23
017B  89 DE                             mov             esi,ebx
017D  EB 0F                             jmp             L$25
017F                            L$23:
017F  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0183  3B 04 24                          cmp             eax,dword ptr [esp]
0186  75 E0                             jne             L$22
0188  89 F0                             mov             eax,esi
018A  EB 28                             jmp             L$28
018C                            L$24:
018C  31 ED                             xor             ebp,ebp
018E                            L$25:
018E  8D 44 24 04                       lea             eax,0x4[esp]
0192  50                                push            eax
0193  56                                push            esi
0194  E8 00 00 00 00                    call            _mbgetcode
0199  83 C4 08                          add             esp,0x00000008
019C  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
01A0  89 C3                             mov             ebx,eax
01A2  39 CD                             cmp             ebp,ecx
01A4  75 C0                             jne             L$21
01A6  31 C0                             xor             eax,eax
01A8  EB 0A                             jmp             L$28
01AA                            L$26:
01AA  57                                push            edi
01AB  56                                push            esi
01AC  E8 00 00 00 00                    call            strpbrk
01B1                            L$27:
01B1  83 C4 08                          add             esp,0x00000008
01B4                            L$28:
01B4  83 C4 08                          add             esp,0x00000008
01B7  5D                                pop             ebp
01B8  5F                                pop             edi
01B9  5E                                pop             esi
01BA  5B                                pop             ebx
01BB  C3                                ret

Routine Size: 112 bytes,    Routine Base: _TEXT + 014C

01BC                            _mbscspn:
01BC  53                                push            ebx
01BD  56                                push            esi
01BE  57                                push            edi
01BF  55                                push            ebp
01C0  83 EC 08                          sub             esp,0x00000008
01C3  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
01C7  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
01CB  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
01D2  74 43                             je              L$34
01D4  31 DB                             xor             ebx,ebx
01D6  31 ED                             xor             ebp,ebp
01D8  EB 16                             jmp             L$31
01DA                            L$29:
01DA  89 FA                             mov             edx,edi
01DC                            L$30:
01DC  89 E0                             mov             eax,esp
01DE  50                                push            eax
01DF  52                                push            edx
01E0  E8 00 00 00 00                    call            _mbgetcode
01E5  83 C4 08                          add             esp,0x00000008
01E8  89 C2                             mov             edx,eax
01EA  3B 2C 24                          cmp             ebp,dword ptr [esp]
01ED  75 1B                             jne             L$32
01EF  43                                inc             ebx
01F0                            L$31:
01F0  8D 44 24 04                       lea             eax,0x4[esp]
01F4  50                                push            eax
01F5  56                                push            esi
01F6  E8 00 00 00 00                    call            _mbgetcode
01FB  83 C4 08                          add             esp,0x00000008
01FE  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0202  89 C6                             mov             esi,eax
0204  39 CD                             cmp             ebp,ecx
0206  75 D2                             jne             L$29
0208  EB 09                             jmp             L$33
020A                            L$32:
020A  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
020E  3B 04 24                          cmp             eax,dword ptr [esp]
0211  75 C9                             jne             L$30
0213                            L$33:
0213  89 D8                             mov             eax,ebx
0215  EB 9D                             jmp             L$28
0217                            L$34:
0217  57                                push            edi
0218  56                                push            esi
0219  E8 00 00 00 00                    call            strcspn
021E  EB 91                             jmp             L$27

Routine Size: 100 bytes,    Routine Base: _TEXT + 01BC

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000                            tokn:

BSS Size: 4 bytes

