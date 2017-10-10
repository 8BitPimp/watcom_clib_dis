Module: ustrftim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000037A bytes
0000                            TwoDigits_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  89 C3                             mov             ebx,eax
0005  89 D1                             mov             ecx,edx
0007  89 D0                             mov             eax,edx
0009  BE 0A 00 00 00                    mov             esi,0x0000000a
000E  99                                cdq
000F  F7 FE                             idiv            esi
0011  83 C0 30                          add             eax,0x00000030
0014  66 89 03                          mov             word ptr [ebx],ax
0017  89 C8                             mov             eax,ecx
0019  99                                cdq
001A  F7 FE                             idiv            esi
001C  66 C7 43 04 00 00                 mov             word ptr 0x4[ebx],0x0000
0022  83 C2 30                          add             edx,0x00000030
0025  66 89 53 02                       mov             word ptr 0x2[ebx],dx
0029  5E                                pop             esi
002A  59                                pop             ecx
002B  5B                                pop             ebx
002C  C3                                ret
002D                            L$1:
002D  54 53 52 4F 4D 4B 49 48 45 43 3F 3E 3D 3C 35 34 TSROMKIHEC?>=<54
003D  33 32 30 2F 2E 28 24 23 1F 1D 1C 00             320/.($#....
0049                            L$2:
0049  EE 02 00 00                                     DD        offset L$40
004D  EE 02 00 00                                     DD        offset L$40
0051  30 01 00 00                                     DD        offset L$7
0055  4C 01 00 00                                     DD        offset L$10
0059  A4 01 00 00                                     DD        offset L$16
005D  AE 01 00 00                                     DD        offset L$17
0061  B9 01 00 00                                     DD        offset L$18
0065  FB 01 00 00                                     DD        offset L$22
0069  3A 02 00 00                                     DD        offset L$27
006D  A9 02 00 00                                     DD        offset L$36
0071  4D 02 00 00                                     DD        offset L$29
0075  7B 02 00 00                                     DD        offset L$34
0079  A9 02 00 00                                     DD        offset L$36
007D  C3 02 00 00                                     DD        offset L$38
0081  DA 02 00 00                                     DD        offset L$39
0085  1B 01 00 00                                     DD        offset L$5
0089  42 01 00 00                                     DD        offset L$9
008D  58 01 00 00                                     DD        offset L$11
0091  99 01 00 00                                     DD        offset L$15
0095  42 01 00 00                                     DD        offset L$9
0099  D6 01 00 00                                     DD        offset L$20
009D  F2 01 00 00                                     DD        offset L$21
00A1  03 02 00 00                                     DD        offset L$23
00A5  1C 02 00 00                                     DD        offset L$25
00A9  0F 02 00 00                                     DD        offset L$24
00AD  41 02 00 00                                     DD        offset L$28
00B1  6D 02 00 00                                     DD        offset L$33
00B5  9C 02 00 00                                     DD        offset L$35
00B9  B6 02 00 00                                     DD        offset L$37

Routine Size: 189 bytes,    Routine Base: _TEXT + 0000

00BD                            _ustrftime_:
00BD  56                                push            esi
00BE  57                                push            edi
00BF  C8 5C 00 00                       enter           0x005c,0x00
00C3  50                                push            eax
00C4  52                                push            edx
00C5  53                                push            ebx
00C6  89 CE                             mov             esi,ecx
00C8  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
00CF  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
00D6  89 55 F4                          mov             dword ptr -0xc[ebp],edx
00D9  E9 90 00 00 00                    jmp             L$14
00DE                            L$3:
00DE  66 83 38 25                       cmp             word ptr [eax],0x0025
00E2  74 08                             je              L$4
00E4  66 8B 00                          mov             ax,word ptr [eax]
00E7  E9 08 02 00 00                    jmp             L$41
00EC                            L$4:
00EC  83 45 98 02                       add             dword ptr -0x68[ebp],0x00000002
00F0  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
00F3  66 8B 00                          mov             ax,word ptr [eax]
00F6  83 E8 25                          sub             eax,0x00000025
00F9  66 3D 54 00                       cmp             ax,0x0054
00FD  0F 87 EB 01 00 00                 ja              L$40
0103  B9 1D 00 00 00                    mov             ecx,0x0000001d
0108  BF 2D 00 00 00                    mov             edi,offset L$1
010D  06                                push            es
010E  0E                                push            cs
010F  07                                pop             es
0110  F2 AE                             repne scasb
0112  07                                pop             es
0113  2E FF 24 8D 49 00 00 00           jmp             dword ptr cs:L$2[ecx*4]
011B                            L$5:
011B  8B 46 18                          mov             eax,dword ptr 0x18[esi]
011E  BA 00 00 00 00                    mov             edx,offset _awday_name
0123                            L$6:
0123  C1 E0 02                          shl             eax,0x02
0126  01 C2                             add             edx,eax
0128  89 55 F0                          mov             dword ptr -0x10[ebp],edx
012B  E9 CE 01 00 00                    jmp             L$42
0130                            L$7:
0130  8B 46 18                          mov             eax,dword ptr 0x18[esi]
0133  8B 04 85 00 00 00 00              mov             eax,dword ptr _wday_name[eax*4]
013A                            L$8:
013A  89 45 F0                          mov             dword ptr -0x10[ebp],eax
013D  E9 BC 01 00 00                    jmp             L$42
0142                            L$9:
0142  8B 46 10                          mov             eax,dword ptr 0x10[esi]
0145  BA 00 00 00 00                    mov             edx,offset _amon_name
014A  EB D7                             jmp             L$6
014C                            L$10:
014C  8B 46 10                          mov             eax,dword ptr 0x10[esi]
014F  8B 04 85 00 00 00 00              mov             eax,dword ptr _mon_name[eax*4]
0156  EB E2                             jmp             L$8
0158                            L$11:
0158  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
015B  BA 8F 00 00 00                    mov             edx,offset DGROUP:L$68
0160                            L$12:
0160  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0163  8D 45 A4                          lea             eax,-0x5c[ebp]
0166  E8 00 00 00 00                    call            _atouni_
016B                            L$13:
016B  89 45 98                          mov             dword ptr -0x68[ebp],eax
016E                            L$14:
016E  8D 45 E0                          lea             eax,-0x20[ebp]
0171  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0174  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
0177  66 83 38 00                       cmp             word ptr [eax],0x0000
017B  0F 85 5D FF FF FF                 jne             L$3
0181  83 7D FC 00                       cmp             dword ptr -0x4[ebp],0x00000000
0185  0F 84 D0 01 00 00                 je              L$47
018B  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
018E  40                                inc             eax
018F  40                                inc             eax
0190  C7 45 FC 00 00 00 00              mov             dword ptr -0x4[ebp],0x00000000
0197  EB D2                             jmp             L$13
0199                            L$15:
0199  8D 45 E0                          lea             eax,-0x20[ebp]
019C  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
019F  E9 BF 00 00 00                    jmp             L$32
01A4                            L$16:
01A4  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
01A7  BA A4 00 00 00                    mov             edx,offset DGROUP:L$69
01AC  EB B2                             jmp             L$12
01AE                            L$17:
01AE  8D 45 E0                          lea             eax,-0x20[ebp]
01B1  8B 56 08                          mov             edx,dword ptr 0x8[esi]
01B4  E9 AA 00 00 00                    jmp             L$32
01B9                            L$18:
01B9  8B 56 08                          mov             edx,dword ptr 0x8[esi]
01BC  83 FA 0C                          cmp             edx,0x0000000c
01BF  7E 03                             jle             L$19
01C1  83 EA 0C                          sub             edx,0x0000000c
01C4                            L$19:
01C4  85 D2                             test            edx,edx
01C6  0F 85 94 00 00 00                 jne             L$31
01CC  BA 0C 00 00 00                    mov             edx,0x0000000c
01D1  E9 8A 00 00 00                    jmp             L$31
01D6                            L$20:
01D6  8D 55 E0                          lea             edx,-0x20[ebp]
01D9  8B 46 1C                          mov             eax,dword ptr 0x1c[esi]
01DC  BB 0A 00 00 00                    mov             ebx,0x0000000a
01E1  83 C0 65                          add             eax,0x00000065
01E4  E8 00 00 00 00                    call            _uitoa_
01E9  66 FF 4D E0                       dec             word ptr -0x20[ebp]
01ED  E9 0C 01 00 00                    jmp             L$42
01F2                            L$21:
01F2  8B 56 10                          mov             edx,dword ptr 0x10[esi]
01F5  8D 45 E0                          lea             eax,-0x20[ebp]
01F8  42                                inc             edx
01F9  EB 68                             jmp             L$32
01FB                            L$22:
01FB  8D 45 E0                          lea             eax,-0x20[ebp]
01FE  8B 56 04                          mov             edx,dword ptr 0x4[esi]
0201  EB 60                             jmp             L$32
0203                            L$23:
0203  C7 45 F0 AD 00 00 00              mov             dword ptr -0x10[ebp],offset DGROUP:L$70
020A  E9 EF 00 00 00                    jmp             L$42
020F                            L$24:
020F  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
0212  BA AF 00 00 00                    mov             edx,offset DGROUP:L$71
0217  E9 44 FF FF FF                    jmp             L$12
021C                            L$25:
021C  83 7E 08 0C                       cmp             dword ptr 0x8[esi],0x0000000c
0220  7D 0C                             jge             L$26
0222  C7 45 F0 BB 00 00 00              mov             dword ptr -0x10[ebp],offset DGROUP:L$72
0229  E9 D0 00 00 00                    jmp             L$42
022E                            L$26:
022E  C7 45 F0 BE 00 00 00              mov             dword ptr -0x10[ebp],offset DGROUP:L$73
0235  E9 C4 00 00 00                    jmp             L$42
023A                            L$27:
023A  8D 45 E0                          lea             eax,-0x20[ebp]
023D  8B 16                             mov             edx,dword ptr [esi]
023F  EB 22                             jmp             L$32
0241                            L$28:
0241  C7 45 F0 C1 00 00 00              mov             dword ptr -0x10[ebp],offset DGROUP:L$74
0248  E9 B1 00 00 00                    jmp             L$42
024D                            L$29:
024D  8B 46 1C                          mov             eax,dword ptr 0x1c[esi]
0250  83 C0 07                          add             eax,0x00000007
0253  2B 46 18                          sub             eax,dword ptr 0x18[esi]
0256  BB 07 00 00 00                    mov             ebx,0x00000007
025B                            L$30:
025B  99                                cdq
025C  F7 FB                             idiv            ebx
025E  89 C2                             mov             edx,eax
0260                            L$31:
0260  8D 45 E0                          lea             eax,-0x20[ebp]
0263                            L$32:
0263  E8 00 00 00 00                    call            TwoDigits_
0268  E9 91 00 00 00                    jmp             L$42
026D                            L$33:
026D  66 8B 46 18                       mov             ax,word ptr 0x18[esi]
0271  05 30 00 00 00                    add             eax,0x00000030
0276  E9 79 00 00 00                    jmp             L$41
027B                            L$34:
027B  8B 46 1C                          mov             eax,dword ptr 0x1c[esi]
027E  BB 07 00 00 00                    mov             ebx,0x00000007
0283  99                                cdq
0284  F7 FB                             idiv            ebx
0286  89 D0                             mov             eax,edx
0288  2B 46 18                          sub             eax,dword ptr 0x18[esi]
028B  01 D8                             add             eax,ebx
028D  99                                cdq
028E  F7 FB                             idiv            ebx
0290  B8 06 00 00 00                    mov             eax,0x00000006
0295  29 D0                             sub             eax,edx
0297  03 46 1C                          add             eax,dword ptr 0x1c[esi]
029A  EB BF                             jmp             L$30
029C                            L$35:
029C  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
029F  BA C3 00 00 00                    mov             edx,offset DGROUP:L$75
02A4  E9 B7 FE FF FF                    jmp             L$12
02A9                            L$36:
02A9  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
02AC  BA D0 00 00 00                    mov             edx,offset DGROUP:L$76
02B1  E9 AA FE FF FF                    jmp             L$12
02B6                            L$37:
02B6  8B 46 14                          mov             eax,dword ptr 0x14[esi]
02B9  BB 64 00 00 00                    mov             ebx,0x00000064
02BE  99                                cdq
02BF  F7 FB                             idiv            ebx
02C1  EB 9D                             jmp             L$31
02C3                            L$38:
02C3  8D 55 E0                          lea             edx,-0x20[ebp]
02C6  8B 46 14                          mov             eax,dword ptr 0x14[esi]
02C9  BB 0A 00 00 00                    mov             ebx,0x0000000a
02CE  05 6C 07 00 00                    add             eax,0x0000076c
02D3  E8 00 00 00 00                    call            _uitoa_
02D8  EB 24                             jmp             L$42
02DA                            L$39:
02DA  E8 00 00 00 00                    call            tzset_
02DF  8B 46 20                          mov             eax,dword ptr 0x20[esi]
02E2  8B 04 85 00 00 00 00              mov             eax,dword ptr _tzname[eax*4]
02E9  E9 4C FE FF FF                    jmp             L$8
02EE                            L$40:
02EE  8B 45 98                          mov             eax,dword ptr -0x68[ebp]
02F1  66 8B 00                          mov             ax,word ptr [eax]
02F4                            L$41:
02F4  66 C7 45 E2 00 00                 mov             word ptr -0x1e[ebp],0x0000
02FA  66 89 45 E0                       mov             word ptr -0x20[ebp],ax
02FE                            L$42:
02FE  8D 45 E0                          lea             eax,-0x20[ebp]
0301  3B 45 F0                          cmp             eax,dword ptr -0x10[ebp]
0304  74 21                             je              L$45
0306                            L$43:
0306  8B 55 F0                          mov             edx,dword ptr -0x10[ebp]
0309  80 3A 00                          cmp             byte ptr [edx],0x00
030C  74 0E                             je              L$44
030E  66 0F B6 12                       movzx           dx,byte ptr [edx]
0312  FF 45 F0                          inc             dword ptr -0x10[ebp]
0315  66 89 10                          mov             word ptr [eax],dx
0318  40                                inc             eax
0319  40                                inc             eax
031A  EB EA                             jmp             L$43
031C                            L$44:
031C  66 C7 00 00 00                    mov             word ptr [eax],0x0000
0321  8D 45 E0                          lea             eax,-0x20[ebp]
0324  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0327                            L$45:
0327  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
032A  83 45 98 02                       add             dword ptr -0x68[ebp],0x00000002
032E  E8 00 00 00 00                    call            _ustrlen_
0333  89 C1                             mov             ecx,eax
0335  3B 45 F4                          cmp             eax,dword ptr -0xc[ebp]
0338  76 03                             jbe             L$46
033A  8B 4D F4                          mov             ecx,dword ptr -0xc[ebp]
033D                            L$46:
033D  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0340  8B 55 F0                          mov             edx,dword ptr -0x10[ebp]
0343  29 4D F4                          sub             dword ptr -0xc[ebp],ecx
0346  01 C0                             add             eax,eax
0348  8D 1C 09                          lea             ebx,[ecx+ecx]
034B  03 45 A0                          add             eax,dword ptr -0x60[ebp]
034E  01 4D F8                          add             dword ptr -0x8[ebp],ecx
0351  E8 00 00 00 00                    call            memcpy_
0356  E9 13 FE FF FF                    jmp             L$14
035B                            L$47:
035B  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
035E  3B 45 9C                          cmp             eax,dword ptr -0x64[ebp]
0361  73 11                             jae             L$48
0363  01 C0                             add             eax,eax
0365  03 45 A0                          add             eax,dword ptr -0x60[ebp]
0368  66 C7 00 00 00                    mov             word ptr [eax],0x0000
036D  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
0370  C9                                leave
0371  5F                                pop             edi
0372  5E                                pop             esi
0373  C3                                ret
0374                            L$48:
0374  31 C0                             xor             eax,eax
0376  C9                                leave
0377  5F                                pop             edi
0378  5E                                pop             esi
0379  C3                                ret

Routine Size: 701 bytes,    Routine Base: _TEXT + 00BD

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000                            L$49:
0000  53 75 6E 64 61 79 00                            Sunday.
0007                            L$50:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E                            L$51:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016                            L$52:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020                            L$53:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029                            L$54:
0029  46 72 69 64 61 79 00                            Friday.
0030                            L$55:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039                            L$56:
0039  4A 61 6E 75 61 72 79 00                         January.
0041                            L$57:
0041  46 65 62 72 75 61 72 79 00                      February.
004A                            L$58:
004A  4D 61 72 63 68 00                               March.
0050                            L$59:
0050  41 70 72 69 6C 00                               April.
0056                            L$60:
0056  4D 61 79 00                                     May.
005A                            L$61:
005A  4A 75 6E 65 00                                  June.
005F                            L$62:
005F  4A 75 6C 79 00                                  July.
0064                            L$63:
0064  41 75 67 75 73 74 00                            August.
006B                            L$64:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075                            L$65:
0075  4F 63 74 6F 62 65 72 00                         October.
007D                            L$66:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086                            L$67:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F                            L$68:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4                            L$69:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD                            L$70:
00AD  0A 00                                           ..
00AF                            L$71:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB                            L$72:
00BB  41 4D 00                                        AM.
00BE                            L$73:
00BE  50 4D 00                                        PM.
00C1                            L$74:
00C1  09 00                                           ..
00C3                            L$75:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0                            L$76:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000                            _awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C                            _wday_name:
001C  00 00 00 00                                     DD        offset DGROUP:L$49
0020  07 00 00 00                                     DD        offset DGROUP:L$50
0024  0E 00 00 00                                     DD        offset DGROUP:L$51
0028  16 00 00 00                                     DD        offset DGROUP:L$52
002C  20 00 00 00                                     DD        offset DGROUP:L$53
0030  29 00 00 00                                     DD        offset DGROUP:L$54
0034  30 00 00 00                                     DD        offset DGROUP:L$55
0038                            _amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068                            _mon_name:
0068  39 00 00 00                                     DD        offset DGROUP:L$56
006C  41 00 00 00                                     DD        offset DGROUP:L$57
0070  4A 00 00 00                                     DD        offset DGROUP:L$58
0074  50 00 00 00                                     DD        offset DGROUP:L$59
0078  56 00 00 00                                     DD        offset DGROUP:L$60
007C  5A 00 00 00                                     DD        offset DGROUP:L$61
0080  5F 00 00 00                                     DD        offset DGROUP:L$62
0084  64 00 00 00                                     DD        offset DGROUP:L$63
0088  6B 00 00 00                                     DD        offset DGROUP:L$64
008C  75 00 00 00                                     DD        offset DGROUP:L$65
0090  7D 00 00 00                                     DD        offset DGROUP:L$66
0094  86 00 00 00                                     DD        offset DGROUP:L$67

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

