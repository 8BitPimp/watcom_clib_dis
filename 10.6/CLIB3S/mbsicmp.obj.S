Module: mbsicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000277 bytes
0000                            _mbsicmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000B  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
000F  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0016  0F 84 92 00 00 00                 je              L$6
001C                            L$1:
001C  8D 44 24 04                       lea             eax,0x4[esp]
0020  50                                push            eax
0021  56                                push            esi
0022  E8 00 00 00 00                    call            _mbgetcode
0027  83 C4 08                          add             esp,0x00000008
002A  89 C6                             mov             esi,eax
002C  89 E0                             mov             eax,esp
002E  50                                push            eax
002F  53                                push            ebx
0030  E8 00 00 00 00                    call            _mbgetcode
0035  83 C4 08                          add             esp,0x00000008
0038  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
003C  51                                push            ecx
003D  89 C3                             mov             ebx,eax
003F  E8 00 00 00 00                    call            _ismbclegal
0044  83 C4 04                          add             esp,0x00000004
0047  85 C0                             test            eax,eax
0049  75 11                             jne             L$2
004B  8B 7C 24 04                       mov             edi,dword ptr 0x4[esp]
004F  57                                push            edi
0050  E8 00 00 00 00                    call            toupper
0055  83 C4 04                          add             esp,0x00000004
0058  89 44 24 04                       mov             dword ptr 0x4[esp],eax
005C                            L$2:
005C  8B 2C 24                          mov             ebp,dword ptr [esp]
005F  55                                push            ebp
0060  E8 00 00 00 00                    call            _ismbclegal
0065  83 C4 04                          add             esp,0x00000004
0068  85 C0                             test            eax,eax
006A  75 0F                             jne             L$3
006C  8B 04 24                          mov             eax,dword ptr [esp]
006F  50                                push            eax
0070  E8 00 00 00 00                    call            toupper
0075  83 C4 04                          add             esp,0x00000004
0078  89 04 24                          mov             dword ptr [esp],eax
007B                            L$3:
007B  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
007F  8B 14 24                          mov             edx,dword ptr [esp]
0082  39 D0                             cmp             eax,edx
0084  74 16                             je              L$5
0086  73 0A                             jae             L$4
0088  B8 FF FF FF FF                    mov             eax,0xffffffff
008D  E9 E9 00 00 00                    jmp             L$15
0092                            L$4:
0092  B8 01 00 00 00                    mov             eax,0x00000001
0097  E9 DF 00 00 00                    jmp             L$15
009C                            L$5:
009C  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
00A1  0F 85 75 FF FF FF                 jne             L$1
00A7  31 D0                             xor             eax,edx
00A9  E9 CD 00 00 00                    jmp             L$15
00AE                            L$6:
00AE  53                                push            ebx
00AF  56                                push            esi
00B0  E8 00 00 00 00                    call            stricmp
00B5  83 C4 08                          add             esp,0x00000008
00B8  E9 BE 00 00 00                    jmp             L$15

Routine Size: 189 bytes,    Routine Base: _TEXT + 0000

00BD                            _mbsnicmp:
00BD  53                                push            ebx
00BE  56                                push            esi
00BF  57                                push            edi
00C0  55                                push            ebp
00C1  83 EC 08                          sub             esp,0x00000008
00C4  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
00C8  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
00CC  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
00D0  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
00D7  0F 84 93 00 00 00                 je              L$13
00DD                            L$7:
00DD  4B                                dec             ebx
00DE  83 FB FF                          cmp             ebx,0xffffffff
00E1  0F 84 85 00 00 00                 je              L$12
00E7  8D 44 24 04                       lea             eax,0x4[esp]
00EB  50                                push            eax
00EC  57                                push            edi
00ED  E8 00 00 00 00                    call            _mbgetcode
00F2  83 C4 08                          add             esp,0x00000008
00F5  89 C7                             mov             edi,eax
00F7  89 E0                             mov             eax,esp
00F9  50                                push            eax
00FA  56                                push            esi
00FB  E8 00 00 00 00                    call            _mbgetcode
0100  83 C4 08                          add             esp,0x00000008
0103  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0107  51                                push            ecx
0108  89 C6                             mov             esi,eax
010A  E8 00 00 00 00                    call            _ismbclegal
010F  83 C4 04                          add             esp,0x00000004
0112  85 C0                             test            eax,eax
0114  75 11                             jne             L$8
0116  8B 6C 24 04                       mov             ebp,dword ptr 0x4[esp]
011A  55                                push            ebp
011B  E8 00 00 00 00                    call            toupper
0120  83 C4 04                          add             esp,0x00000004
0123  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0127                            L$8:
0127  8B 04 24                          mov             eax,dword ptr [esp]
012A  50                                push            eax
012B  E8 00 00 00 00                    call            _ismbclegal
0130  83 C4 04                          add             esp,0x00000004
0133  85 C0                             test            eax,eax
0135  75 0F                             jne             L$9
0137  8B 14 24                          mov             edx,dword ptr [esp]
013A  52                                push            edx
013B  E8 00 00 00 00                    call            toupper
0140  83 C4 04                          add             esp,0x00000004
0143  89 04 24                          mov             dword ptr [esp],eax
0146                            L$9:
0146  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
014A  8B 0C 24                          mov             ecx,dword ptr [esp]
014D  39 C8                             cmp             eax,ecx
014F  74 10                             je              L$11
0151  73 07                             jae             L$10
0153  B8 FF FF FF FF                    mov             eax,0xffffffff
0158  EB 21                             jmp             L$15
015A                            L$10:
015A  B8 01 00 00 00                    mov             eax,0x00000001
015F  EB 1A                             jmp             L$15
0161                            L$11:
0161  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
0166  0F 85 71 FF FF FF                 jne             L$7
016C                            L$12:
016C  31 C0                             xor             eax,eax
016E  EB 0B                             jmp             L$15
0170                            L$13:
0170  53                                push            ebx
0171  56                                push            esi
0172  57                                push            edi
0173                            L$14:
0173  E8 00 00 00 00                    call            strnicmp
0178  83 C4 0C                          add             esp,0x0000000c
017B                            L$15:
017B  83 C4 08                          add             esp,0x00000008
017E  5D                                pop             ebp
017F  5F                                pop             edi
0180  5E                                pop             esi
0181  5B                                pop             ebx
0182  C3                                ret

Routine Size: 198 bytes,    Routine Base: _TEXT + 00BD

0183                            _mbsnbicmp:
0183  53                                push            ebx
0184  56                                push            esi
0185  57                                push            edi
0186  55                                push            ebp
0187  83 EC 08                          sub             esp,0x00000008
018A  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
018E  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0192  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0196  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
019D  0F 84 CC 00 00 00                 je              L$25
01A3  85 DB                             test            ebx,ebx
01A5  7F 04                             jg              L$17
01A7                            L$16:
01A7  31 C0                             xor             eax,eax
01A9  EB D0                             jmp             L$15
01AB                            L$17:
01AB  8B 0D 00 00 00 00                 mov             ecx,dword ptr __IsDBCS
01B1  4B                                dec             ebx
01B2  85 C9                             test            ecx,ecx
01B4  74 13                             je              L$18
01B6  31 C0                             xor             eax,eax
01B8  8A 06                             mov             al,byte ptr [esi]
01BA  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
01C0  24 01                             and             al,0x01
01C2  25 FF 00 00 00                    and             eax,0x000000ff
01C7  EB 02                             jmp             L$19
01C9                            L$18:
01C9  31 C0                             xor             eax,eax
01CB                            L$19:
01CB  74 01                             je              L$20
01CD  4B                                dec             ebx
01CE                            L$20:
01CE  8D 44 24 04                       lea             eax,0x4[esp]
01D2  50                                push            eax
01D3  56                                push            esi
01D4  E8 00 00 00 00                    call            _mbgetcode
01D9  83 C4 08                          add             esp,0x00000008
01DC  89 C6                             mov             esi,eax
01DE  89 E0                             mov             eax,esp
01E0  50                                push            eax
01E1  57                                push            edi
01E2  E8 00 00 00 00                    call            _mbgetcode
01E7  83 C4 08                          add             esp,0x00000008
01EA  8B 6C 24 04                       mov             ebp,dword ptr 0x4[esp]
01EE  55                                push            ebp
01EF  89 C7                             mov             edi,eax
01F1  E8 00 00 00 00                    call            _ismbclegal
01F6  83 C4 04                          add             esp,0x00000004
01F9  85 C0                             test            eax,eax
01FB  75 11                             jne             L$21
01FD  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0201  50                                push            eax
0202  E8 00 00 00 00                    call            toupper
0207  83 C4 04                          add             esp,0x00000004
020A  89 44 24 04                       mov             dword ptr 0x4[esp],eax
020E                            L$21:
020E  8B 14 24                          mov             edx,dword ptr [esp]
0211  52                                push            edx
0212  E8 00 00 00 00                    call            _ismbclegal
0217  83 C4 04                          add             esp,0x00000004
021A  85 C0                             test            eax,eax
021C  75 0F                             jne             L$22
021E  8B 0C 24                          mov             ecx,dword ptr [esp]
0221  51                                push            ecx
0222  E8 00 00 00 00                    call            toupper
0227  83 C4 04                          add             esp,0x00000004
022A  89 04 24                          mov             dword ptr [esp],eax
022D                            L$22:
022D  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0231  8B 2C 24                          mov             ebp,dword ptr [esp]
0234  39 E8                             cmp             eax,ebp
0236  74 16                             je              L$24
0238  73 0A                             jae             L$23
023A  B8 FF FF FF FF                    mov             eax,0xffffffff
023F  E9 37 FF FF FF                    jmp             L$15
0244                            L$23:
0244  B8 01 00 00 00                    mov             eax,0x00000001
0249  E9 2D FF FF FF                    jmp             L$15
024E                            L$24:
024E  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
0253  0F 84 4E FF FF FF                 je              L$16
0259  85 ED                             test            ebp,ebp
025B  0F 84 46 FF FF FF                 je              L$16
0261  83 FB 01                          cmp             ebx,0x00000001
0264  0F 8D 41 FF FF FF                 jge             L$17
026A  E9 38 FF FF FF                    jmp             L$16
026F                            L$25:
026F  53                                push            ebx
0270  57                                push            edi
0271  56                                push            esi
0272  E9 FC FE FF FF                    jmp             L$14

Routine Size: 244 bytes,    Routine Base: _TEXT + 0183

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

