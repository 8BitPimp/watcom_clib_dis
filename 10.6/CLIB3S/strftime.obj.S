Module: strftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000037B bytes
0000                            TwoDigits:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  BE 0A 00 00 00                    mov             esi,0x0000000a
000F  89 DA                             mov             edx,ebx
0011  89 D8                             mov             eax,ebx
0013  C1 FA 1F                          sar             edx,0x1f
0016  F7 FE                             idiv            esi
0018  89 DA                             mov             edx,ebx
001A  83 C0 30                          add             eax,0x00000030
001D  C1 FA 1F                          sar             edx,0x1f
0020  88 01                             mov             byte ptr [ecx],al
0022  89 D8                             mov             eax,ebx
0024  F7 FE                             idiv            esi
0026  C6 41 02 00                       mov             byte ptr 0x2[ecx],0x00
002A  83 C2 30                          add             edx,0x00000030
002D  88 51 01                          mov             byte ptr 0x1[ecx],dl
0030  5E                                pop             esi
0031  5B                                pop             ebx
0032  C3                                ret
0033  90                                nop
0034                            L$1:
0034  79 78 77 74 72 70 6E 6D 6A 68 64 63 62 61 5A 59 yxwtrpnmjhdcbaZY
0044  58 57 55 54 53 4D 49 48 44 42 41 25             XWUTSMIHDBA%
0050                            L$2:
0050  F0 02 00 00                                     DD        offset L$37
0054  F0 02 00 00                                     DD        offset L$37
0058  4A 01 00 00                                     DD        offset L$7
005C  6A 01 00 00                                     DD        offset L$9
0060  8D 01 00 00                                     DD        offset L$12
0064  9B 01 00 00                                     DD        offset L$13
0068  A1 01 00 00                                     DD        offset L$14
006C  E2 01 00 00                                     DD        offset L$18
0070  2A 02 00 00                                     DD        offset L$25
0074  A3 02 00 00                                     DD        offset L$33
0078  38 02 00 00                                     DD        offset L$27
007C  65 02 00 00                                     DD        offset L$31
0080  A3 02 00 00                                     DD        offset L$33
0084  C5 02 00 00                                     DD        offset L$35
0088  DF 02 00 00                                     DD        offset L$36
008C  39 01 00 00                                     DD        offset L$6
0090  59 01 00 00                                     DD        offset L$8
0094  79 01 00 00                                     DD        offset L$10
0098  87 01 00 00                                     DD        offset L$11
009C  59 01 00 00                                     DD        offset L$8
00A0  BE 01 00 00                                     DD        offset L$16
00A4  DC 01 00 00                                     DD        offset L$17
00A8  F8 01 00 00                                     DD        offset L$21
00AC  10 02 00 00                                     DD        offset L$23
00B0  02 02 00 00                                     DD        offset L$22
00B4  2E 02 00 00                                     DD        offset L$26
00B8  52 02 00 00                                     DD        offset L$30
00BC  95 02 00 00                                     DD        offset L$32
00C0  B1 02 00 00                                     DD        offset L$34

Routine Size: 196 bytes,    Routine Base: _TEXT + 0000

00C4                            strftime:
00C4  53                                push            ebx
00C5  56                                push            esi
00C6  57                                push            edi
00C7  55                                push            ebp
00C8  83 EC 14                          sub             esp,0x00000014
00CB  8B 6C 24 30                       mov             ebp,dword ptr 0x30[esp]
00CF  8B 5C 24 34                       mov             ebx,dword ptr 0x34[esp]
00D3  31 D2                             xor             edx,edx
00D5  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
00D9  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
00DD  89 44 24 10                       mov             dword ptr 0x10[esp],eax
00E1  89 54 24 08                       mov             dword ptr 0x8[esp],edx
00E5                            L$3:
00E5  8A 65 00                          mov             ah,byte ptr [ebp]
00E8  89 E6                             mov             esi,esp
00EA  84 E4                             test            ah,ah
00EC  75 17                             jne             L$4
00EE  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
00F2  85 FF                             test            edi,edi
00F4  0F 84 5C 02 00 00                 je              L$40
00FA  31 C0                             xor             eax,eax
00FC  8D 6F 01                          lea             ebp,0x1[edi]
00FF  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0103  EB E0                             jmp             L$3
0105                            L$4:
0105  31 C0                             xor             eax,eax
0107  8A 45 00                          mov             al,byte ptr [ebp]
010A  83 F8 25                          cmp             eax,0x00000025
010D  74 0E                             je              L$5
010F  30 ED                             xor             ch,ch
0111  88 04 24                          mov             byte ptr [esp],al
0114  88 6C 24 01                       mov             byte ptr 0x1[esp],ch
0118  E9 DF 01 00 00                    jmp             L$38
011D                            L$5:
011D  45                                inc             ebp
011E  B9 1D 00 00 00                    mov             ecx,0x0000001d
0123  BF 34 00 00 00                    mov             edi,offset L$1
0128  8A 45 00                          mov             al,byte ptr [ebp]
012B  06                                push            es
012C  0E                                push            cs
012D  07                                pop             es
012E  F2 AE                             repne scasb
0130  07                                pop             es
0131  2E FF 24 8D 50 00 00 00           jmp             dword ptr cs:L$2[ecx*4]
0139                            L$6:
0139  8B 73 18                          mov             esi,dword ptr 0x18[ebx]
013C  C1 E6 02                          shl             esi,0x02
013F  81 C6 00 00 00 00                 add             esi,offset awday_name
0145  E9 B2 01 00 00                    jmp             L$38
014A                            L$7:
014A  8B 73 18                          mov             esi,dword ptr 0x18[ebx]
014D  8B 34 B5 00 00 00 00              mov             esi,dword ptr wday_name[esi*4]
0154  E9 A3 01 00 00                    jmp             L$38
0159                            L$8:
0159  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
015C  C1 E6 02                          shl             esi,0x02
015F  81 C6 00 00 00 00                 add             esi,offset amon_name
0165  E9 92 01 00 00                    jmp             L$38
016A                            L$9:
016A  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
016D  8B 34 B5 00 00 00 00              mov             esi,dword ptr mon_name[esi*4]
0174  E9 83 01 00 00                    jmp             L$38
0179                            L$10:
0179  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
017D  BD 8F 00 00 00                    mov             ebp,offset DGROUP:L$62
0182  E9 5E FF FF FF                    jmp             L$3
0187                            L$11:
0187  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
018A  57                                push            edi
018B  EB 59                             jmp             L$20
018D                            L$12:
018D  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
0191  BD A4 00 00 00                    mov             ebp,offset DGROUP:L$63
0196  E9 4A FF FF FF                    jmp             L$3
019B                            L$13:
019B  8B 4B 08                          mov             ecx,dword ptr 0x8[ebx]
019E  51                                push            ecx
019F  EB 45                             jmp             L$20
01A1                            L$14:
01A1  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
01A4  83 F8 0C                          cmp             eax,0x0000000c
01A7  7E 03                             jle             L$15
01A9  83 E8 0C                          sub             eax,0x0000000c
01AC                            L$15:
01AC  85 C0                             test            eax,eax
01AE  0F 85 9B 00 00 00                 jne             L$29
01B4  B8 0C 00 00 00                    mov             eax,0x0000000c
01B9  E9 91 00 00 00                    jmp             L$29
01BE                            L$16:
01BE  6A 0A                             push            0x0000000a
01C0  8D 44 24 04                       lea             eax,0x4[esp]
01C4  50                                push            eax
01C5  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
01C8  83 C0 65                          add             eax,0x00000065
01CB  50                                push            eax
01CC  E8 00 00 00 00                    call            itoa
01D1  83 C4 0C                          add             esp,0x0000000c
01D4  FE 0C 24                          dec             byte ptr [esp]
01D7  E9 20 01 00 00                    jmp             L$38
01DC                            L$17:
01DC  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
01DF  40                                inc             eax
01E0  EB 6D                             jmp             L$29
01E2                            L$18:
01E2  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
01E5                            L$19:
01E5  52                                push            edx
01E6                            L$20:
01E6  8D 44 24 04                       lea             eax,0x4[esp]
01EA  50                                push            eax
01EB  E8 00 00 00 00                    call            TwoDigits
01F0  83 C4 08                          add             esp,0x00000008
01F3  E9 04 01 00 00                    jmp             L$38
01F8                            L$21:
01F8  BE AD 00 00 00                    mov             esi,offset DGROUP:L$64
01FD  E9 FA 00 00 00                    jmp             L$38
0202                            L$22:
0202  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
0206  BD AF 00 00 00                    mov             ebp,offset DGROUP:L$65
020B  E9 D5 FE FF FF                    jmp             L$3
0210                            L$23:
0210  83 7B 08 0C                       cmp             dword ptr 0x8[ebx],0x0000000c
0214  7D 0A                             jge             L$24
0216  BE BB 00 00 00                    mov             esi,offset DGROUP:L$66
021B  E9 DC 00 00 00                    jmp             L$38
0220                            L$24:
0220  BE BE 00 00 00                    mov             esi,offset DGROUP:L$67
0225  E9 D2 00 00 00                    jmp             L$38
022A                            L$25:
022A  8B 03                             mov             eax,dword ptr [ebx]
022C  EB 21                             jmp             L$29
022E                            L$26:
022E  BE C1 00 00 00                    mov             esi,offset DGROUP:L$68
0233  E9 C4 00 00 00                    jmp             L$38
0238                            L$27:
0238  8B 53 1C                          mov             edx,dword ptr 0x1c[ebx]
023B  8B 7B 18                          mov             edi,dword ptr 0x18[ebx]
023E  83 C2 07                          add             edx,0x00000007
0241  29 FA                             sub             edx,edi
0243  B9 07 00 00 00                    mov             ecx,0x00000007
0248  89 D0                             mov             eax,edx
024A                            L$28:
024A  C1 FA 1F                          sar             edx,0x1f
024D  F7 F9                             idiv            ecx
024F                            L$29:
024F  50                                push            eax
0250  EB 94                             jmp             L$20
0252                            L$30:
0252  8A 43 18                          mov             al,byte ptr 0x18[ebx]
0255  30 D2                             xor             dl,dl
0257  04 30                             add             al,0x30
0259  88 54 24 01                       mov             byte ptr 0x1[esp],dl
025D  88 04 24                          mov             byte ptr [esp],al
0260  E9 97 00 00 00                    jmp             L$38
0265                            L$31:
0265  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
0268  89 C2                             mov             edx,eax
026A  B9 07 00 00 00                    mov             ecx,0x00000007
026F  C1 FA 1F                          sar             edx,0x1f
0272  F7 F9                             idiv            ecx
0274  2B 53 18                          sub             edx,dword ptr 0x18[ebx]
0277  01 CA                             add             edx,ecx
0279  89 D0                             mov             eax,edx
027B  C1 FA 1F                          sar             edx,0x1f
027E  F7 F9                             idiv            ecx
0280  B8 06 00 00 00                    mov             eax,0x00000006
0285  8B 4B 1C                          mov             ecx,dword ptr 0x1c[ebx]
0288  29 D0                             sub             eax,edx
028A  01 C8                             add             eax,ecx
028C  89 C2                             mov             edx,eax
028E  B9 07 00 00 00                    mov             ecx,0x00000007
0293  EB B5                             jmp             L$28
0295                            L$32:
0295  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
0299  BD C3 00 00 00                    mov             ebp,offset DGROUP:L$69
029E  E9 42 FE FF FF                    jmp             L$3
02A3                            L$33:
02A3  89 6C 24 08                       mov             dword ptr 0x8[esp],ebp
02A7  BD D0 00 00 00                    mov             ebp,offset DGROUP:L$70
02AC  E9 34 FE FF FF                    jmp             L$3
02B1                            L$34:
02B1  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02B4  89 C2                             mov             edx,eax
02B6  B9 64 00 00 00                    mov             ecx,0x00000064
02BB  C1 FA 1F                          sar             edx,0x1f
02BE  F7 F9                             idiv            ecx
02C0  E9 20 FF FF FF                    jmp             L$19
02C5                            L$35:
02C5  6A 0A                             push            0x0000000a
02C7  8D 44 24 04                       lea             eax,0x4[esp]
02CB  50                                push            eax
02CC  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02CF  05 6C 07 00 00                    add             eax,0x0000076c
02D4  50                                push            eax
02D5  E8 00 00 00 00                    call            itoa
02DA  83 C4 0C                          add             esp,0x0000000c
02DD  EB 1D                             jmp             L$38
02DF                            L$36:
02DF  E8 00 00 00 00                    call            tzset
02E4  8B 73 20                          mov             esi,dword ptr 0x20[ebx]
02E7  8B 34 B5 00 00 00 00              mov             esi,dword ptr tzname[esi*4]
02EE  EB 0C                             jmp             L$38
02F0                            L$37:
02F0  8A 45 00                          mov             al,byte ptr [ebp]
02F3  30 C9                             xor             cl,cl
02F5  88 04 24                          mov             byte ptr [esp],al
02F8  88 4C 24 01                       mov             byte ptr 0x1[esp],cl
02FC                            L$38:
02FC  89 F7                             mov             edi,esi
02FE  45                                inc             ebp
02FF  06                                push            es
0300  8C D8                             mov             eax,ds
0302  8E C0                             mov             es,eax
0304  29 C9                             sub             ecx,ecx
0306  49                                dec             ecx
0307  31 C0                             xor             eax,eax
0309  F2 AE                             repne scasb
030B  F7 D1                             not             ecx
030D  49                                dec             ecx
030E  07                                pop             es
030F  8B 7C 24 10                       mov             edi,dword ptr 0x10[esp]
0313  89 CA                             mov             edx,ecx
0315  39 F9                             cmp             ecx,edi
0317  76 02                             jbe             L$39
0319  89 FA                             mov             edx,edi
031B                            L$39:
031B  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
031F  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0323  89 D1                             mov             ecx,edx
0325  01 C7                             add             edi,eax
0327  06                                push            es
0328  8C D8                             mov             eax,ds
032A  8E C0                             mov             es,eax
032C  57                                push            edi
032D  89 C8                             mov             eax,ecx
032F  C1 E9 02                          shr             ecx,0x02
0332  F2 A5                             repne movsd
0334  8A C8                             mov             cl,al
0336  80 E1 03                          and             cl,0x03
0339  F2 A4                             repne movsb
033B  5F                                pop             edi
033C  07                                pop             es
033D  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0341  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0345  29 D1                             sub             ecx,edx
0347  01 D6                             add             esi,edx
0349  89 4C 24 10                       mov             dword ptr 0x10[esp],ecx
034D  89 74 24 0C                       mov             dword ptr 0xc[esp],esi
0351  E9 8F FD FF FF                    jmp             L$3
0356                            L$40:
0356  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
035A  3B 44 24 2C                       cmp             eax,dword ptr 0x2c[esp]
035E  73 11                             jae             L$41
0360  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
0364  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0368  01 D8                             add             eax,ebx
036A  C6 00 00                          mov             byte ptr [eax],0x00
036D  89 D8                             mov             eax,ebx
036F  EB 02                             jmp             L$42
0371                            L$41:
0371  31 C0                             xor             eax,eax
0373                            L$42:
0373  83 C4 14                          add             esp,0x00000014
0376  5D                                pop             ebp
0377  5F                                pop             edi
0378  5E                                pop             esi
0379  5B                                pop             ebx
037A  C3                                ret

Routine Size: 695 bytes,    Routine Base: _TEXT + 00C4

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000                            L$43:
0000  53 75 6E 64 61 79 00                            Sunday.
0007                            L$44:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E                            L$45:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016                            L$46:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020                            L$47:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029                            L$48:
0029  46 72 69 64 61 79 00                            Friday.
0030                            L$49:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039                            L$50:
0039  4A 61 6E 75 61 72 79 00                         January.
0041                            L$51:
0041  46 65 62 72 75 61 72 79 00                      February.
004A                            L$52:
004A  4D 61 72 63 68 00                               March.
0050                            L$53:
0050  41 70 72 69 6C 00                               April.
0056                            L$54:
0056  4D 61 79 00                                     May.
005A                            L$55:
005A  4A 75 6E 65 00                                  June.
005F                            L$56:
005F  4A 75 6C 79 00                                  July.
0064                            L$57:
0064  41 75 67 75 73 74 00                            August.
006B                            L$58:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075                            L$59:
0075  4F 63 74 6F 62 65 72 00                         October.
007D                            L$60:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086                            L$61:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F                            L$62:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4                            L$63:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD                            L$64:
00AD  0A 00                                           ..
00AF                            L$65:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB                            L$66:
00BB  41 4D 00                                        AM.
00BE                            L$67:
00BE  50 4D 00                                        PM.
00C1                            L$68:
00C1  09 00                                           ..
00C3                            L$69:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0                            L$70:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000                            awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C                            wday_name:
001C  00 00 00 00                                     DD        offset DGROUP:L$43
0020  07 00 00 00                                     DD        offset DGROUP:L$44
0024  0E 00 00 00                                     DD        offset DGROUP:L$45
0028  16 00 00 00                                     DD        offset DGROUP:L$46
002C  20 00 00 00                                     DD        offset DGROUP:L$47
0030  29 00 00 00                                     DD        offset DGROUP:L$48
0034  30 00 00 00                                     DD        offset DGROUP:L$49
0038                            amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068                            mon_name:
0068  39 00 00 00                                     DD        offset DGROUP:L$50
006C  41 00 00 00                                     DD        offset DGROUP:L$51
0070  4A 00 00 00                                     DD        offset DGROUP:L$52
0074  50 00 00 00                                     DD        offset DGROUP:L$53
0078  56 00 00 00                                     DD        offset DGROUP:L$54
007C  5A 00 00 00                                     DD        offset DGROUP:L$55
0080  5F 00 00 00                                     DD        offset DGROUP:L$56
0084  64 00 00 00                                     DD        offset DGROUP:L$57
0088  6B 00 00 00                                     DD        offset DGROUP:L$58
008C  75 00 00 00                                     DD        offset DGROUP:L$59
0090  7D 00 00 00                                     DD        offset DGROUP:L$60
0094  86 00 00 00                                     DD        offset DGROUP:L$61

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

