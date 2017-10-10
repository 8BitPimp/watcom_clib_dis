Module: ismbc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000038C bytes
0000                            _ismbclegal:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  8B 1D 00 00 00 00                 mov             ebx,dword ptr __IsDBCS
000B  85 DB                             test            ebx,ebx
000D  74 4D                             je              L$6
000F  74 19                             je              L$1
0011  89 D0                             mov             eax,edx
0013  C1 E8 08                          shr             eax,0x08
0016  25 FF 00 00 00                    and             eax,0x000000ff
001B  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0021  24 01                             and             al,0x01
0023  25 FF 00 00 00                    and             eax,0x000000ff
0028  EB 02                             jmp             L$2
002A                            L$1:
002A  31 C0                             xor             eax,eax
002C                            L$2:
002C  74 2A                             je              L$5
002E  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0035  74 16                             je              L$3
0037  88 D0                             mov             al,dl
0039  25 FF 00 00 00                    and             eax,0x000000ff
003E  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0044  24 02                             and             al,0x02
0046  25 FF 00 00 00                    and             eax,0x000000ff
004B  EB 02                             jmp             L$4
004D                            L$3:
004D  31 C0                             xor             eax,eax
004F                            L$4:
004F  74 07                             je              L$5
0051  B8 01 00 00 00                    mov             eax,0x00000001
0056  5B                                pop             ebx
0057  C3                                ret
0058                            L$5:
0058  31 C0                             xor             eax,eax
005A  5B                                pop             ebx
005B  C3                                ret
005C                            L$6:
005C  F6 C6 FF                          test            dh,0xff
005F  0F 94 C0                          sete            al
0062  25 FF 00 00 00                    and             eax,0x000000ff
0067  5B                                pop             ebx
0068  C3                                ret

Routine Size: 105 bytes,    Routine Base: _TEXT + 0000

0069                            _ismbcl0:
0069  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
006D  52                                push            edx
006E  E8 00 00 00 00                    call            _ismbclegal
0073  83 C4 04                          add             esp,0x00000004
0076  85 C0                             test            eax,eax
0078  74 10                             je              L$7
007A  81 7C 24 04 9E 88 00 00           cmp             dword ptr 0x4[esp],0x0000889e
0082  77 06                             ja              L$7
0084  B8 01 00 00 00                    mov             eax,0x00000001
0089  C3                                ret
008A                            L$7:
008A  31 C0                             xor             eax,eax
008C  C3                                ret

Routine Size: 36 bytes,    Routine Base: _TEXT + 0069

008D                            _ismbcl1:
008D  53                                push            ebx
008E  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0092  52                                push            edx
0093  E8 00 00 00 00                    call            _ismbclegal
0098  83 C4 04                          add             esp,0x00000004
009B  85 C0                             test            eax,eax
009D  74 1B                             je              L$8
009F  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
00A3  81 FB 9F 88 00 00                 cmp             ebx,0x0000889f
00A9  72 0F                             jb              L$8
00AB  81 FB 72 98 00 00                 cmp             ebx,0x00009872
00B1  77 07                             ja              L$8
00B3  B8 01 00 00 00                    mov             eax,0x00000001
00B8  5B                                pop             ebx
00B9  C3                                ret
00BA                            L$8:
00BA  31 C0                             xor             eax,eax
00BC  5B                                pop             ebx
00BD  C3                                ret

Routine Size: 49 bytes,    Routine Base: _TEXT + 008D

00BE                            _ismbcl2:
00BE  53                                push            ebx
00BF  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00C3  52                                push            edx
00C4  E8 00 00 00 00                    call            _ismbclegal
00C9  83 C4 04                          add             esp,0x00000004
00CC  85 C0                             test            eax,eax
00CE  74 1B                             je              L$9
00D0  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
00D4  81 FB 9F 98 00 00                 cmp             ebx,0x0000989f
00DA  72 0F                             jb              L$9
00DC  81 FB 9E EA 00 00                 cmp             ebx,0x0000ea9e
00E2  77 07                             ja              L$9
00E4  B8 01 00 00 00                    mov             eax,0x00000001
00E9  5B                                pop             ebx
00EA  C3                                ret
00EB                            L$9:
00EB  31 C0                             xor             eax,eax
00ED  5B                                pop             ebx
00EE  C3                                ret

Routine Size: 49 bytes,    Routine Base: _TEXT + 00BE

00EF                            _ismbcalpha:
00EF  53                                push            ebx
00F0  56                                push            esi
00F1  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
00F5  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
00FB  FE C3                             inc             bl
00FD  85 D2                             test            edx,edx
00FF  74 37                             je              L$11
0101  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
0105  51                                push            ecx
0106  E8 00 00 00 00                    call            _ismbclegal
010B  83 C4 04                          add             esp,0x00000004
010E  85 C0                             test            eax,eax
0110  74 28                             je              L$12
0112  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0116  56                                push            esi
0117  E8 00 00 00 00                    call            _ismbdupper
011C  83 C4 04                          add             esp,0x00000004
011F  85 C0                             test            eax,eax
0121  75 0D                             jne             L$10
0123  56                                push            esi
0124  E8 00 00 00 00                    call            _ismbdlower
0129  83 C4 04                          add             esp,0x00000004
012C  85 C0                             test            eax,eax
012E  74 19                             je              L$13
0130                            L$10:
0130  B8 01 00 00 00                    mov             eax,0x00000001
0135  5E                                pop             esi
0136  5B                                pop             ebx
0137  C3                                ret
0138                            L$11:
0138  31 C0                             xor             eax,eax
013A                            L$12:
013A  88 D8                             mov             al,bl
013C  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
0142  24 C0                             and             al,0xc0
0144  25 FF 00 00 00                    and             eax,0x000000ff
0149                            L$13:
0149  5E                                pop             esi
014A  5B                                pop             ebx
014B  C3                                ret

Routine Size: 93 bytes,    Routine Base: _TEXT + 00EF

014C                            _ismbcupper:
014C  53                                push            ebx
014D  56                                push            esi
014E  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
0152  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0158  FE C3                             inc             bl
015A  85 D2                             test            edx,edx
015C  74 21                             je              L$14
015E  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
0162  51                                push            ecx
0163  E8 00 00 00 00                    call            _ismbclegal
0168  83 C4 04                          add             esp,0x00000004
016B  85 C0                             test            eax,eax
016D  74 12                             je              L$15
016F  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0173  56                                push            esi
0174  E8 00 00 00 00                    call            _ismbdupper
0179  83 C4 04                          add             esp,0x00000004
017C  5E                                pop             esi
017D  5B                                pop             ebx
017E  C3                                ret
017F                            L$14:
017F  31 C0                             xor             eax,eax
0181                            L$15:
0181  88 D8                             mov             al,bl
0183  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
0189  24 40                             and             al,0x40
018B  25 FF 00 00 00                    and             eax,0x000000ff
0190  5E                                pop             esi
0191  5B                                pop             ebx
0192  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 014C

0193                            _ismbclower:
0193  53                                push            ebx
0194  56                                push            esi
0195  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
0199  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
019F  FE C3                             inc             bl
01A1  85 D2                             test            edx,edx
01A3  74 21                             je              L$16
01A5  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
01A9  51                                push            ecx
01AA  E8 00 00 00 00                    call            _ismbclegal
01AF  83 C4 04                          add             esp,0x00000004
01B2  85 C0                             test            eax,eax
01B4  74 12                             je              L$17
01B6  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
01BA  56                                push            esi
01BB  E8 00 00 00 00                    call            _ismbdlower
01C0  83 C4 04                          add             esp,0x00000004
01C3  5E                                pop             esi
01C4  5B                                pop             ebx
01C5  C3                                ret
01C6                            L$16:
01C6  31 C0                             xor             eax,eax
01C8                            L$17:
01C8  88 D8                             mov             al,bl
01CA  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
01D0  24 80                             and             al,0x80
01D2  25 FF 00 00 00                    and             eax,0x000000ff
01D7  5E                                pop             esi
01D8  5B                                pop             ebx
01D9  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0193

01DA                            _ismbcdigit:
01DA  53                                push            ebx
01DB  56                                push            esi
01DC  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
01E0  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
01E6  FE C3                             inc             bl
01E8  85 D2                             test            edx,edx
01EA  74 21                             je              L$18
01EC  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
01F0  51                                push            ecx
01F1  E8 00 00 00 00                    call            _ismbclegal
01F6  83 C4 04                          add             esp,0x00000004
01F9  85 C0                             test            eax,eax
01FB  74 12                             je              L$19
01FD  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0201  56                                push            esi
0202  E8 00 00 00 00                    call            _ismbddigit
0207  83 C4 04                          add             esp,0x00000004
020A  5E                                pop             esi
020B  5B                                pop             ebx
020C  C3                                ret
020D                            L$18:
020D  31 C0                             xor             eax,eax
020F                            L$19:
020F  88 D8                             mov             al,bl
0211  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
0217  24 20                             and             al,0x20
0219  25 FF 00 00 00                    and             eax,0x000000ff
021E  5E                                pop             esi
021F  5B                                pop             ebx
0220  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 01DA

0221                            _ismbckata:
0221  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0225  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
022C  74 1E                             je              L$21
022E  3D 40 83 00 00                    cmp             eax,0x00008340
0233  72 14                             jb              L$20
0235  3D 96 83 00 00                    cmp             eax,0x00008396
023A  77 0D                             ja              L$20
023C  3D 7F 83 00 00                    cmp             eax,0x0000837f
0241  74 06                             je              L$20
0243  B8 01 00 00 00                    mov             eax,0x00000001
0248  C3                                ret
0249                            L$20:
0249  31 C0                             xor             eax,eax
024B  C3                                ret
024C                            L$21:
024C  31 C0                             xor             eax,eax
024E  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 0221

024F                            _ismbchira:
024F  53                                push            ebx
0250  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0257  74 1F                             je              L$23
0259  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
025D  81 FB 9F 82 00 00                 cmp             ebx,0x0000829f
0263  72 0F                             jb              L$22
0265  81 FB F1 82 00 00                 cmp             ebx,0x000082f1
026B  77 07                             ja              L$22
026D  B8 01 00 00 00                    mov             eax,0x00000001
0272  5B                                pop             ebx
0273  C3                                ret
0274                            L$22:
0274  31 C0                             xor             eax,eax
0276  5B                                pop             ebx
0277  C3                                ret
0278                            L$23:
0278  31 C0                             xor             eax,eax
027A  5B                                pop             ebx
027B  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 024F

027C                            _ismbcprint:
027C  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0280  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0286  FE C0                             inc             al
0288  85 D2                             test            edx,edx
028A  0F 84 74 00 00 00                 je              L$28
0290  25 FF 00 00 00                    and             eax,0x000000ff
0295  8A 90 00 00 00 00                 mov             dl,byte ptr _IsTable[eax]
029B  80 E2 08                          and             dl,0x08
029E  81 E2 FF 00 00 00                 and             edx,0x000000ff
02A4  75 58                             jne             L$27
02A6  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
02AD  74 15                             je              L$24
02AF  31 C0                             xor             eax,eax
02B1  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
02B5  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
02BB  24 0C                             and             al,0x0c
02BD  25 FF 00 00 00                    and             eax,0x000000ff
02C2  EB 25                             jmp             L$26
02C4                            L$24:
02C4  8A 90 00 00 00 00                 mov             dl,byte ptr _IsTable[eax]
02CA  80 E2 C0                          and             dl,0xc0
02CD  81 E2 FF 00 00 00                 and             edx,0x000000ff
02D3  75 0F                             jne             L$25
02D5  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
02DB  24 04                             and             al,0x04
02DD  25 FF 00 00 00                    and             eax,0x000000ff
02E2  74 05                             je              L$26
02E4                            L$25:
02E4  B8 01 00 00 00                    mov             eax,0x00000001
02E9                            L$26:
02E9  85 C0                             test            eax,eax
02EB  75 11                             jne             L$27
02ED  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
02F1  51                                push            ecx
02F2  E8 00 00 00 00                    call            _ismbclegal
02F7  83 C4 04                          add             esp,0x00000004
02FA  85 C0                             test            eax,eax
02FC  74 18                             je              L$29
02FE                            L$27:
02FE  B8 01 00 00 00                    mov             eax,0x00000001
0303  C3                                ret
0304                            L$28:
0304  25 FF 00 00 00                    and             eax,0x000000ff
0309  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
030F  24 08                             and             al,0x08
0311  25 FF 00 00 00                    and             eax,0x000000ff
0316                            L$29:
0316  C3                                ret

Routine Size: 155 bytes,    Routine Base: _TEXT + 027C

0317                            _ismbcsymbol:
0317  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
031B  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0322  74 1E                             je              L$31
0324  3D 41 81 00 00                    cmp             eax,0x00008141
0329  72 14                             jb              L$30
032B  3D AC 81 00 00                    cmp             eax,0x000081ac
0330  77 0D                             ja              L$30
0332  3D 7F 81 00 00                    cmp             eax,0x0000817f
0337  74 06                             je              L$30
0339  B8 01 00 00 00                    mov             eax,0x00000001
033E  C3                                ret
033F                            L$30:
033F  31 C0                             xor             eax,eax
0341  C3                                ret
0342                            L$31:
0342  31 C0                             xor             eax,eax
0344  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 0317

0345                            _ismbcspace:
0345  53                                push            ebx
0346  56                                push            esi
0347  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
034B  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0351  FE C3                             inc             bl
0353  85 D2                             test            edx,edx
0355  74 21                             je              L$32
0357  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
035B  51                                push            ecx
035C  E8 00 00 00 00                    call            _ismbclegal
0361  83 C4 04                          add             esp,0x00000004
0364  85 C0                             test            eax,eax
0366  74 12                             je              L$33
0368  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
036C  56                                push            esi
036D  E8 00 00 00 00                    call            _ismbdspace
0372  83 C4 04                          add             esp,0x00000004
0375  5E                                pop             esi
0376  5B                                pop             ebx
0377  C3                                ret
0378                            L$32:
0378  31 C0                             xor             eax,eax
037A                            L$33:
037A  88 D8                             mov             al,bl
037C  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
0382  24 02                             and             al,0x02
0384  25 FF 00 00 00                    and             eax,0x000000ff
0389  5E                                pop             esi
038A  5B                                pop             ebx
038B  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0345

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

