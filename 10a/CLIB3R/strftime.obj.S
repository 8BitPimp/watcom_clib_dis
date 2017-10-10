Module: strftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003A9 bytes
0000                            TwoDigits_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  89 C1                             mov             ecx,eax
0005  89 D3                             mov             ebx,edx
0007  BE 0A 00 00 00                    mov             esi,0x0000000a
000C  89 D0                             mov             eax,edx
000E  C1 FA 1F                          sar             edx,0x1f
0011  F7 FE                             idiv            esi
0013  89 DA                             mov             edx,ebx
0015  83 C0 30                          add             eax,0x00000030
0018  C1 FA 1F                          sar             edx,0x1f
001B  88 01                             mov             byte ptr [ecx],al
001D  89 D8                             mov             eax,ebx
001F  F7 FE                             idiv            esi
0021  C6 41 02 00                       mov             byte ptr 0x2[ecx],0x00
0025  83 C2 30                          add             edx,0x00000030
0028  88 51 01                          mov             byte ptr 0x1[ecx],dl
002B  5E                                pop             esi
002C  59                                pop             ecx
002D  5B                                pop             ebx
002E  C3                                ret
002F  90                                nop
0030                            L$1:
0030  79 78 77 74 72 70 6E 6D 6A 68 64 63 62 61 5A 59 yxwtrpnmjhdcbaZY
0040  58 57 55 54 53 4D 49 48 44 42 41 25             XWUTSMIHDBA%
004C                            L$2:
004C  14 03 00 00                                     DD        offset L$37
0050  14 03 00 00                                     DD        offset L$37
0054  27 01 00 00                                     DD        offset L$6
0058  47 01 00 00                                     DD        offset L$8
005C  9C 01 00 00                                     DD        offset L$13
0060  A6 01 00 00                                     DD        offset L$14
0064  B2 01 00 00                                     DD        offset L$15
0068  F6 01 00 00                                     DD        offset L$19
006C  37 02 00 00                                     DD        offset L$24
0070  C4 02 00 00                                     DD        offset L$33
0074  4A 02 00 00                                     DD        offset L$26
0078  85 02 00 00                                     DD        offset L$31
007C  C4 02 00 00                                     DD        offset L$33
0080  EB 02 00 00                                     DD        offset L$35
0084  03 03 00 00                                     DD        offset L$36
0088  16 01 00 00                                     DD        offset L$5
008C  36 01 00 00                                     DD        offset L$7
0090  56 01 00 00                                     DD        offset L$9
0094  90 01 00 00                                     DD        offset L$12
0098  36 01 00 00                                     DD        offset L$7
009C  CF 01 00 00                                     DD        offset L$17
00A0  EC 01 00 00                                     DD        offset L$18
00A4  FF 01 00 00                                     DD        offset L$20
00A8  1D 02 00 00                                     DD        offset L$22
00AC  09 02 00 00                                     DD        offset L$21
00B0  40 02 00 00                                     DD        offset L$25
00B4  71 02 00 00                                     DD        offset L$30
00B8  B0 02 00 00                                     DD        offset L$32
00BC  D7 02 00 00                                     DD        offset L$34

Routine Size: 192 bytes,    Routine Base: _TEXT + 0000

00C0                            strftime_:
00C0  56                                push            esi
00C1  57                                push            edi
00C2  55                                push            ebp
00C3  83 EC 14                          sub             esp,0x00000014
00C6  50                                push            eax
00C7  52                                push            edx
00C8  53                                push            ebx
00C9  89 CD                             mov             ebp,ecx
00CB  31 D2                             xor             edx,edx
00CD  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00D1  89 54 24 18                       mov             dword ptr 0x18[esp],edx
00D5  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00D9  89 54 24 1C                       mov             dword ptr 0x1c[esp],edx
00DD  E9 83 00 00 00                    jmp             L$11
00E2                            L$3:
00E2  80 FA 25                          cmp             dl,0x25
00E5  74 0F                             je              L$4
00E7  30 ED                             xor             ch,ch
00E9  88 54 24 0C                       mov             byte ptr 0xc[esp],dl
00ED  88 6C 24 0D                       mov             byte ptr 0xd[esp],ch
00F1  E9 2D 02 00 00                    jmp             L$38
00F6                            L$4:
00F6  8D 48 01                          lea             ecx,0x1[eax]
00F9  BF 30 00 00 00                    mov             edi,offset L$1
00FE  89 0C 24                          mov             dword ptr [esp],ecx
0101  8A 01                             mov             al,byte ptr [ecx]
0103  B9 1D 00 00 00                    mov             ecx,0x0000001d
0108  06                                push            es
0109  0E                                push            cs
010A  07                                pop             es
010B  F2 AE                             repne scasb
010D  07                                pop             es
010E  2E FF 24 8D 4C 00 00 00           jmp             dword ptr cs:L$2[ecx*4]
0116                            L$5:
0116  8B 75 18                          mov             esi,dword ptr 0x18[ebp]
0119  C1 E6 02                          shl             esi,0x02
011C  81 C6 00 00 00 00                 add             esi,offset _awday_name
0122  E9 FC 01 00 00                    jmp             L$38
0127                            L$6:
0127  8B 75 18                          mov             esi,dword ptr 0x18[ebp]
012A  8B 34 B5 00 00 00 00              mov             esi,dword ptr _wday_name[esi*4]
0131  E9 ED 01 00 00                    jmp             L$38
0136                            L$7:
0136  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
0139  C1 E6 02                          shl             esi,0x02
013C  81 C6 00 00 00 00                 add             esi,offset _amon_name
0142  E9 DC 01 00 00                    jmp             L$38
0147                            L$8:
0147  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
014A  8B 34 B5 00 00 00 00              mov             esi,dword ptr _mon_name[esi*4]
0151  E9 CD 01 00 00                    jmp             L$38
0156                            L$9:
0156  8B 04 24                          mov             eax,dword ptr [esp]
0159  BA 8F 00 00 00                    mov             edx,offset DGROUP:L$62
015E                            L$10:
015E  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
0162  89 14 24                          mov             dword ptr [esp],edx
0165                            L$11:
0165  8B 04 24                          mov             eax,dword ptr [esp]
0168  8A 10                             mov             dl,byte ptr [eax]
016A  8D 74 24 0C                       lea             esi,0xc[esp]
016E  84 D2                             test            dl,dl
0170  0F 85 6C FF FF FF                 jne             L$3
0176  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
017A  85 F6                             test            esi,esi
017C  0F 84 03 02 00 00                 je              L$40
0182  8D 46 01                          lea             eax,0x1[esi]
0185  31 FF                             xor             edi,edi
0187  89 04 24                          mov             dword ptr [esp],eax
018A  89 7C 24 1C                       mov             dword ptr 0x1c[esp],edi
018E  EB D5                             jmp             L$11
0190                            L$12:
0190  8D 44 24 0C                       lea             eax,0xc[esp]
0194  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0197  E9 CB 00 00 00                    jmp             L$29
019C                            L$13:
019C  8B 04 24                          mov             eax,dword ptr [esp]
019F  BA A4 00 00 00                    mov             edx,offset DGROUP:L$63
01A4  EB B8                             jmp             L$10
01A6                            L$14:
01A6  8D 44 24 0C                       lea             eax,0xc[esp]
01AA  8B 55 08                          mov             edx,dword ptr 0x8[ebp]
01AD  E9 B5 00 00 00                    jmp             L$29
01B2                            L$15:
01B2  8B 55 08                          mov             edx,dword ptr 0x8[ebp]
01B5  83 FA 0C                          cmp             edx,0x0000000c
01B8  7E 03                             jle             L$16
01BA  83 EA 0C                          sub             edx,0x0000000c
01BD                            L$16:
01BD  85 D2                             test            edx,edx
01BF  0F 85 9E 00 00 00                 jne             L$28
01C5  BA 0C 00 00 00                    mov             edx,0x0000000c
01CA  E9 94 00 00 00                    jmp             L$28
01CF                            L$17:
01CF  8D 54 24 0C                       lea             edx,0xc[esp]
01D3  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
01D6  BB 0A 00 00 00                    mov             ebx,0x0000000a
01DB  83 C0 65                          add             eax,0x00000065
01DE  E8 00 00 00 00                    call            itoa_
01E3  FE 4C 24 0C                       dec             byte ptr 0xc[esp]
01E7  E9 37 01 00 00                    jmp             L$38
01EC                            L$18:
01EC  8B 55 10                          mov             edx,dword ptr 0x10[ebp]
01EF  8D 44 24 0C                       lea             eax,0xc[esp]
01F3  42                                inc             edx
01F4  EB 71                             jmp             L$29
01F6                            L$19:
01F6  8D 44 24 0C                       lea             eax,0xc[esp]
01FA  8B 55 04                          mov             edx,dword ptr 0x4[ebp]
01FD  EB 68                             jmp             L$29
01FF                            L$20:
01FF  BE AD 00 00 00                    mov             esi,offset DGROUP:L$64
0204  E9 1A 01 00 00                    jmp             L$38
0209                            L$21:
0209  8B 04 24                          mov             eax,dword ptr [esp]
020C  BF AF 00 00 00                    mov             edi,offset DGROUP:L$65
0211  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
0215  89 3C 24                          mov             dword ptr [esp],edi
0218  E9 48 FF FF FF                    jmp             L$11
021D                            L$22:
021D  83 7D 08 0C                       cmp             dword ptr 0x8[ebp],0x0000000c
0221  7D 0A                             jge             L$23
0223  BE BB 00 00 00                    mov             esi,offset DGROUP:L$66
0228  E9 F6 00 00 00                    jmp             L$38
022D                            L$23:
022D  BE BE 00 00 00                    mov             esi,offset DGROUP:L$67
0232  E9 EC 00 00 00                    jmp             L$38
0237                            L$24:
0237  8D 44 24 0C                       lea             eax,0xc[esp]
023B  8B 55 00                          mov             edx,dword ptr [ebp]
023E  EB 27                             jmp             L$29
0240                            L$25:
0240  BE C1 00 00 00                    mov             esi,offset DGROUP:L$68
0245  E9 D9 00 00 00                    jmp             L$38
024A                            L$26:
024A  8B 55 1C                          mov             edx,dword ptr 0x1c[ebp]
024D  8B 7D 18                          mov             edi,dword ptr 0x18[ebp]
0250  83 C2 07                          add             edx,0x00000007
0253  29 FA                             sub             edx,edi
0255  BF 07 00 00 00                    mov             edi,0x00000007
025A  89 D0                             mov             eax,edx
025C                            L$27:
025C  C1 FA 1F                          sar             edx,0x1f
025F  F7 FF                             idiv            edi
0261  89 C2                             mov             edx,eax
0263                            L$28:
0263  8D 44 24 0C                       lea             eax,0xc[esp]
0267                            L$29:
0267  E8 00 00 00 00                    call            TwoDigits_
026C  E9 B2 00 00 00                    jmp             L$38
0271                            L$30:
0271  8A 45 18                          mov             al,byte ptr 0x18[ebp]
0274  30 DB                             xor             bl,bl
0276  04 30                             add             al,0x30
0278  88 5C 24 0D                       mov             byte ptr 0xd[esp],bl
027C  88 44 24 0C                       mov             byte ptr 0xc[esp],al
0280  E9 9E 00 00 00                    jmp             L$38
0285                            L$31:
0285  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
0288  89 C2                             mov             edx,eax
028A  BF 07 00 00 00                    mov             edi,0x00000007
028F  C1 FA 1F                          sar             edx,0x1f
0292  F7 FF                             idiv            edi
0294  2B 55 18                          sub             edx,dword ptr 0x18[ebp]
0297  01 FA                             add             edx,edi
0299  89 D0                             mov             eax,edx
029B  C1 FA 1F                          sar             edx,0x1f
029E  F7 FF                             idiv            edi
02A0  B8 06 00 00 00                    mov             eax,0x00000006
02A5  8B 4D 1C                          mov             ecx,dword ptr 0x1c[ebp]
02A8  29 D0                             sub             eax,edx
02AA  01 C8                             add             eax,ecx
02AC  89 C2                             mov             edx,eax
02AE  EB AC                             jmp             L$27
02B0                            L$32:
02B0  8B 04 24                          mov             eax,dword ptr [esp]
02B3  BE C3 00 00 00                    mov             esi,offset DGROUP:L$69
02B8  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
02BC  89 34 24                          mov             dword ptr [esp],esi
02BF  E9 A1 FE FF FF                    jmp             L$11
02C4                            L$33:
02C4  8B 04 24                          mov             eax,dword ptr [esp]
02C7  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
02CB  C7 04 24 D0 00 00 00              mov             dword ptr [esp],offset DGROUP:L$70
02D2  E9 8E FE FF FF                    jmp             L$11
02D7                            L$34:
02D7  8B 45 14                          mov             eax,dword ptr 0x14[ebp]
02DA  89 C2                             mov             edx,eax
02DC  BF 64 00 00 00                    mov             edi,0x00000064
02E1  C1 FA 1F                          sar             edx,0x1f
02E4  F7 FF                             idiv            edi
02E6  E9 78 FF FF FF                    jmp             L$28
02EB                            L$35:
02EB  8D 54 24 0C                       lea             edx,0xc[esp]
02EF  8B 45 14                          mov             eax,dword ptr 0x14[ebp]
02F2  BB 0A 00 00 00                    mov             ebx,0x0000000a
02F7  05 6C 07 00 00                    add             eax,0x0000076c
02FC  E8 00 00 00 00                    call            itoa_
0301  EB 20                             jmp             L$38
0303                            L$36:
0303  E8 00 00 00 00                    call            tzset_
0308  8B 75 20                          mov             esi,dword ptr 0x20[ebp]
030B  8B 34 B5 00 00 00 00              mov             esi,dword ptr _tzname[esi*4]
0312  EB 0F                             jmp             L$38
0314                            L$37:
0314  8B 04 24                          mov             eax,dword ptr [esp]
0317  8A 00                             mov             al,byte ptr [eax]
0319  30 C9                             xor             cl,cl
031B  88 44 24 0C                       mov             byte ptr 0xc[esp],al
031F  88 4C 24 0D                       mov             byte ptr 0xd[esp],cl
0323                            L$38:
0323  89 F7                             mov             edi,esi
0325  8B 1C 24                          mov             ebx,dword ptr [esp]
0328  06                                push            es
0329  8C D8                             mov             eax,ds
032B  8E C0                             mov             es,eax
032D  29 C9                             sub             ecx,ecx
032F  49                                dec             ecx
0330  31 C0                             xor             eax,eax
0332  F2 AE                             repne scasb
0334  F7 D1                             not             ecx
0336  49                                dec             ecx
0337  07                                pop             es
0338  43                                inc             ebx
0339  89 C8                             mov             eax,ecx
033B  89 CA                             mov             edx,ecx
033D  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0341  89 1C 24                          mov             dword ptr [esp],ebx
0344  39 C8                             cmp             eax,ecx
0346  76 02                             jbe             L$39
0348  89 CA                             mov             edx,ecx
034A                            L$39:
034A  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
034E  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
0352  89 D1                             mov             ecx,edx
0354  01 C7                             add             edi,eax
0356  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
035A  06                                push            es
035B  8C D8                             mov             eax,ds
035D  8E C0                             mov             es,eax
035F  57                                push            edi
0360  89 C8                             mov             eax,ecx
0362  C1 E9 02                          shr             ecx,0x02
0365  F2 A5                             repne movsd
0367  8A C8                             mov             cl,al
0369  80 E1 03                          and             cl,0x03
036C  F2 A4                             repne movsb
036E  5F                                pop             edi
036F  07                                pop             es
0370  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0374  29 D3                             sub             ebx,edx
0376  01 D1                             add             ecx,edx
0378  89 5C 24 14                       mov             dword ptr 0x14[esp],ebx
037C  89 4C 24 18                       mov             dword ptr 0x18[esp],ecx
0380  E9 E0 FD FF FF                    jmp             L$11
0385                            L$40:
0385  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
0389  3B 44 24 04                       cmp             eax,dword ptr 0x4[esp]
038D  73 11                             jae             L$41
038F  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0393  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0397  01 D0                             add             eax,edx
0399  C6 00 00                          mov             byte ptr [eax],0x00
039C  89 D0                             mov             eax,edx
039E  EB 02                             jmp             L$42
03A0                            L$41:
03A0  31 C0                             xor             eax,eax
03A2                            L$42:
03A2  83 C4 20                          add             esp,0x00000020
03A5  5D                                pop             ebp
03A6  5F                                pop             edi
03A7  5E                                pop             esi
03A8  C3                                ret

Routine Size: 745 bytes,    Routine Base: _TEXT + 00C0

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
0000                            _awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C                            _wday_name:
001C  00 00 00 00                                     DD        offset DGROUP:L$43
0020  07 00 00 00                                     DD        offset DGROUP:L$44
0024  0E 00 00 00                                     DD        offset DGROUP:L$45
0028  16 00 00 00                                     DD        offset DGROUP:L$46
002C  20 00 00 00                                     DD        offset DGROUP:L$47
0030  29 00 00 00                                     DD        offset DGROUP:L$48
0034  30 00 00 00                                     DD        offset DGROUP:L$49
0038                            _amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068                            _mon_name:
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

