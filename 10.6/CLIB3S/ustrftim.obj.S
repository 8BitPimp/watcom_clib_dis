Module: ustrftim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003BD bytes
0000                            TwoDigits:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0007  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
000A  B9 0A 00 00 00                    mov             ecx,0x0000000a
000F  99                                cdq
0010  F7 F9                             idiv            ecx
0012  83 C0 30                          add             eax,0x00000030
0015  66 89 03                          mov             word ptr [ebx],ax
0018  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
001B  99                                cdq
001C  F7 F9                             idiv            ecx
001E  66 C7 43 04 00 00                 mov             word ptr 0x4[ebx],0x0000
0024  83 C2 30                          add             edx,0x00000030
0027  66 89 53 02                       mov             word ptr 0x2[ebx],dx
002B  5D                                pop             ebp
002C  5B                                pop             ebx
002D  C3                                ret
002E                            L$1:
002E  54 53 52 4F 4D 4B 49 48 45 43 3F 3E 3D 3C 35 34 TSROMKIHEC?>=<54
003E  33 32 30 2F 2E 28 24 23 1F 1D 1C 00             320/.($#....
004A                            L$2:
004A  D8 02 00 00                                     DD        offset L$40
004E  D8 02 00 00                                     DD        offset L$40
0052  33 01 00 00                                     DD        offset L$7
0056  4F 01 00 00                                     DD        offset L$10
005A  A1 01 00 00                                     DD        offset L$15
005E  A8 01 00 00                                     DD        offset L$16
0062  B0 01 00 00                                     DD        offset L$17
0066  F1 01 00 00                                     DD        offset L$22
006A  2A 02 00 00                                     DD        offset L$27
006E  93 02 00 00                                     DD        offset L$36
0072  3A 02 00 00                                     DD        offset L$29
0076  68 02 00 00                                     DD        offset L$34
007A  93 02 00 00                                     DD        offset L$36
007E  AB 02 00 00                                     DD        offset L$38
0082  C4 02 00 00                                     DD        offset L$39
0086  1E 01 00 00                                     DD        offset L$5
008A  45 01 00 00                                     DD        offset L$9
008E  5B 01 00 00                                     DD        offset L$11
0092  99 01 00 00                                     DD        offset L$14
0096  45 01 00 00                                     DD        offset L$9
009A  CD 01 00 00                                     DD        offset L$19
009E  EB 01 00 00                                     DD        offset L$21
00A2  F6 01 00 00                                     DD        offset L$23
00A6  0C 02 00 00                                     DD        offset L$25
00AA  02 02 00 00                                     DD        offset L$24
00AE  2E 02 00 00                                     DD        offset L$28
00B2  5D 02 00 00                                     DD        offset L$33
00B6  89 02 00 00                                     DD        offset L$35
00BA  9D 02 00 00                                     DD        offset L$37

Routine Size: 190 bytes,    Routine Base: _TEXT + 0000

00BE                            _ustrftime:
00BE  53                                push            ebx
00BF  56                                push            esi
00C0  57                                push            edi
00C1  C8 5C 00 00                       enter           0x005c,0x00
00C5  8B 75 1C                          mov             esi,dword ptr 0x1c[ebp]
00C8  8B 5D 20                          mov             ebx,dword ptr 0x20[ebp]
00CB  C7 45 F0 00 00 00 00              mov             dword ptr -0x10[ebp],0x00000000
00D2  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
00D5  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
00DC  89 45 F4                          mov             dword ptr -0xc[ebp],eax
00DF  E9 8D 00 00 00                    jmp             L$13
00E4                            L$3:
00E4  0F B7 06                          movzx           eax,word ptr [esi]
00E7  83 F8 25                          cmp             eax,0x00000025
00EA  74 08                             je              L$4
00EC  66 8B 06                          mov             ax,word ptr [esi]
00EF  E9 E7 01 00 00                    jmp             L$41
00F4                            L$4:
00F4  46                                inc             esi
00F5  46                                inc             esi
00F6  66 8B 06                          mov             ax,word ptr [esi]
00F9  83 E8 25                          sub             eax,0x00000025
00FC  66 3D 54 00                       cmp             ax,0x0054
0100  0F 87 D2 01 00 00                 ja              L$40
0106  B9 1D 00 00 00                    mov             ecx,0x0000001d
010B  BF 2E 00 00 00                    mov             edi,offset L$1
0110  06                                push            es
0111  0E                                push            cs
0112  07                                pop             es
0113  F2 AE                             repne scasb
0115  07                                pop             es
0116  2E FF 24 8D 4A 00 00 00           jmp             dword ptr cs:L$2[ecx*4]
011E                            L$5:
011E  8B 43 18                          mov             eax,dword ptr 0x18[ebx]
0121  BA 00 00 00 00                    mov             edx,offset awday_name
0126                            L$6:
0126  C1 E0 02                          shl             eax,0x02
0129  01 C2                             add             edx,eax
012B  89 55 FC                          mov             dword ptr -0x4[ebp],edx
012E  E9 B2 01 00 00                    jmp             L$42
0133                            L$7:
0133  8B 43 18                          mov             eax,dword ptr 0x18[ebx]
0136  8B 04 85 00 00 00 00              mov             eax,dword ptr wday_name[eax*4]
013D                            L$8:
013D  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0140  E9 A0 01 00 00                    jmp             L$42
0145                            L$9:
0145  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0148  BA 00 00 00 00                    mov             edx,offset amon_name
014D  EB D7                             jmp             L$6
014F                            L$10:
014F  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0152  8B 04 85 00 00 00 00              mov             eax,dword ptr mon_name[eax*4]
0159  EB E2                             jmp             L$8
015B                            L$11:
015B  68 8F 00 00 00                    push            offset DGROUP:L$70
0160                            L$12:
0160  8D 45 A4                          lea             eax,-0x5c[ebp]
0163  50                                push            eax
0164  89 75 F8                          mov             dword ptr -0x8[ebp],esi
0167  E8 00 00 00 00                    call            _atouni
016C  83 C4 08                          add             esp,0x00000008
016F  89 C6                             mov             esi,eax
0171                            L$13:
0171  8D 45 E0                          lea             eax,-0x20[ebp]
0174  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0177  66 83 3E 00                       cmp             word ptr [esi],0x0000
017B  0F 85 63 FF FF FF                 jne             L$3
0181  83 7D F8 00                       cmp             dword ptr -0x8[ebp],0x00000000
0185  0F 84 BD 01 00 00                 je              L$47
018B  8B 75 F8                          mov             esi,dword ptr -0x8[ebp]
018E  C7 45 F8 00 00 00 00              mov             dword ptr -0x8[ebp],0x00000000
0195  46                                inc             esi
0196  46                                inc             esi
0197  EB D8                             jmp             L$13
0199                            L$14:
0199  FF 73 0C                          push            dword ptr 0xc[ebx]
019C  E9 AB 00 00 00                    jmp             L$32
01A1                            L$15:
01A1  68 A4 00 00 00                    push            offset DGROUP:L$71
01A6  EB B8                             jmp             L$12
01A8                            L$16:
01A8  FF 73 08                          push            dword ptr 0x8[ebx]
01AB  E9 9C 00 00 00                    jmp             L$32
01B0                            L$17:
01B0  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
01B3  83 F8 0C                          cmp             eax,0x0000000c
01B6  7E 03                             jle             L$18
01B8  83 E8 0C                          sub             eax,0x0000000c
01BB                            L$18:
01BB  85 C0                             test            eax,eax
01BD  0F 85 88 00 00 00                 jne             L$31
01C3  B8 0C 00 00 00                    mov             eax,0x0000000c
01C8  E9 7E 00 00 00                    jmp             L$31
01CD                            L$19:
01CD  6A 0A                             push            0x0000000a
01CF  8D 45 E0                          lea             eax,-0x20[ebp]
01D2  50                                push            eax
01D3  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
01D6  83 C0 65                          add             eax,0x00000065
01D9  50                                push            eax
01DA  E8 00 00 00 00                    call            _uitoa
01DF  66 FF 4D E0                       dec             word ptr -0x20[ebp]
01E3                            L$20:
01E3  83 C4 0C                          add             esp,0x0000000c
01E6  E9 FA 00 00 00                    jmp             L$42
01EB                            L$21:
01EB  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
01EE  40                                inc             eax
01EF  EB 5A                             jmp             L$31
01F1                            L$22:
01F1  FF 73 04                          push            dword ptr 0x4[ebx]
01F4  EB 56                             jmp             L$32
01F6                            L$23:
01F6  C7 45 FC AD 00 00 00              mov             dword ptr -0x4[ebp],offset DGROUP:L$72
01FD  E9 E3 00 00 00                    jmp             L$42
0202                            L$24:
0202  68 AF 00 00 00                    push            offset DGROUP:L$73
0207  E9 54 FF FF FF                    jmp             L$12
020C                            L$25:
020C  83 7B 08 0C                       cmp             dword ptr 0x8[ebx],0x0000000c
0210  7D 0C                             jge             L$26
0212  C7 45 FC BB 00 00 00              mov             dword ptr -0x4[ebp],offset DGROUP:L$74
0219  E9 C7 00 00 00                    jmp             L$42
021E                            L$26:
021E  C7 45 FC BE 00 00 00              mov             dword ptr -0x4[ebp],offset DGROUP:L$75
0225  E9 BB 00 00 00                    jmp             L$42
022A                            L$27:
022A  FF 33                             push            dword ptr [ebx]
022C  EB 1E                             jmp             L$32
022E                            L$28:
022E  C7 45 FC C1 00 00 00              mov             dword ptr -0x4[ebp],offset DGROUP:L$76
0235  E9 AB 00 00 00                    jmp             L$42
023A                            L$29:
023A  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
023D  83 C0 07                          add             eax,0x00000007
0240  2B 43 18                          sub             eax,dword ptr 0x18[ebx]
0243  BF 07 00 00 00                    mov             edi,0x00000007
0248                            L$30:
0248  99                                cdq
0249  F7 FF                             idiv            edi
024B                            L$31:
024B  50                                push            eax
024C                            L$32:
024C  8D 45 E0                          lea             eax,-0x20[ebp]
024F  50                                push            eax
0250  E8 00 00 00 00                    call            TwoDigits
0255  83 C4 08                          add             esp,0x00000008
0258  E9 88 00 00 00                    jmp             L$42
025D                            L$33:
025D  66 8B 43 18                       mov             ax,word ptr 0x18[ebx]
0261  05 30 00 00 00                    add             eax,0x00000030
0266  EB 73                             jmp             L$41
0268                            L$34:
0268  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
026B  BF 07 00 00 00                    mov             edi,0x00000007
0270  99                                cdq
0271  F7 FF                             idiv            edi
0273  89 D0                             mov             eax,edx
0275  2B 43 18                          sub             eax,dword ptr 0x18[ebx]
0278  01 F8                             add             eax,edi
027A  99                                cdq
027B  F7 FF                             idiv            edi
027D  B8 06 00 00 00                    mov             eax,0x00000006
0282  29 D0                             sub             eax,edx
0284  03 43 1C                          add             eax,dword ptr 0x1c[ebx]
0287  EB BF                             jmp             L$30
0289                            L$35:
0289  68 C3 00 00 00                    push            offset DGROUP:L$77
028E  E9 CD FE FF FF                    jmp             L$12
0293                            L$36:
0293  68 D0 00 00 00                    push            offset DGROUP:L$78
0298  E9 C3 FE FF FF                    jmp             L$12
029D                            L$37:
029D  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02A0  BF 64 00 00 00                    mov             edi,0x00000064
02A5  99                                cdq
02A6  F7 FF                             idiv            edi
02A8  52                                push            edx
02A9  EB A1                             jmp             L$32
02AB                            L$38:
02AB  6A 0A                             push            0x0000000a
02AD  8D 45 E0                          lea             eax,-0x20[ebp]
02B0  50                                push            eax
02B1  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
02B4  05 6C 07 00 00                    add             eax,0x0000076c
02B9  50                                push            eax
02BA  E8 00 00 00 00                    call            _uitoa
02BF  E9 1F FF FF FF                    jmp             L$20
02C4                            L$39:
02C4  E8 00 00 00 00                    call            tzset
02C9  8B 43 20                          mov             eax,dword ptr 0x20[ebx]
02CC  8B 04 85 00 00 00 00              mov             eax,dword ptr tzname[eax*4]
02D3  E9 65 FE FF FF                    jmp             L$8
02D8                            L$40:
02D8  66 8B 06                          mov             ax,word ptr [esi]
02DB                            L$41:
02DB  66 C7 45 E2 00 00                 mov             word ptr -0x1e[ebp],0x0000
02E1  66 89 45 E0                       mov             word ptr -0x20[ebp],ax
02E5                            L$42:
02E5  8D 45 E0                          lea             eax,-0x20[ebp]
02E8  3B 45 FC                          cmp             eax,dword ptr -0x4[ebp]
02EB  74 21                             je              L$45
02ED                            L$43:
02ED  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
02F0  80 3A 00                          cmp             byte ptr [edx],0x00
02F3  74 0E                             je              L$44
02F5  66 0F B6 12                       movzx           dx,byte ptr [edx]
02F9  FF 45 FC                          inc             dword ptr -0x4[ebp]
02FC  66 89 10                          mov             word ptr [eax],dx
02FF  40                                inc             eax
0300  40                                inc             eax
0301  EB EA                             jmp             L$43
0303                            L$44:
0303  66 C7 00 00 00                    mov             word ptr [eax],0x0000
0308  8D 45 E0                          lea             eax,-0x20[ebp]
030B  89 45 FC                          mov             dword ptr -0x4[ebp],eax
030E                            L$45:
030E  FF 75 FC                          push            dword ptr -0x4[ebp]
0311  46                                inc             esi
0312  46                                inc             esi
0313  E8 00 00 00 00                    call            _ustrlen
0318  83 C4 04                          add             esp,0x00000004
031B  89 C7                             mov             edi,eax
031D  3B 45 F4                          cmp             eax,dword ptr -0xc[ebp]
0320  76 03                             jbe             L$46
0322  8B 7D F4                          mov             edi,dword ptr -0xc[ebp]
0325                            L$46:
0325  8D 04 3F                          lea             eax,[edi+edi]
0328  50                                push            eax
0329  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
032C  01 C0                             add             eax,eax
032E  FF 75 FC                          push            dword ptr -0x4[ebp]
0331  03 45 14                          add             eax,dword ptr 0x14[ebp]
0334  50                                push            eax
0335  29 7D F4                          sub             dword ptr -0xc[ebp],edi
0338  01 7D F0                          add             dword ptr -0x10[ebp],edi
033B  E8 00 00 00 00                    call            memcpy
0340  83 C4 0C                          add             esp,0x0000000c
0343  E9 29 FE FF FF                    jmp             L$13
0348                            L$47:
0348  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
034B  3B 45 18                          cmp             eax,dword ptr 0x18[ebp]
034E  73 12                             jae             L$48
0350  01 C0                             add             eax,eax
0352  03 45 14                          add             eax,dword ptr 0x14[ebp]
0355  66 C7 00 00 00                    mov             word ptr [eax],0x0000
035A  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
035D  C9                                leave
035E  5F                                pop             edi
035F  5E                                pop             esi
0360  5B                                pop             ebx
0361  C3                                ret
0362                            L$48:
0362  31 C0                             xor             eax,eax
0364  C9                                leave
0365  5F                                pop             edi
0366  5E                                pop             esi
0367  5B                                pop             ebx
0368  C3                                ret

Routine Size: 683 bytes,    Routine Base: _TEXT + 00BE

0369                            _ustrftime_ms:
0369  53                                push            ebx
036A  56                                push            esi
036B  55                                push            ebp
036C  89 E5                             mov             ebp,esp
036E  FF 75 18                          push            dword ptr 0x18[ebp]
0371  E8 00 00 00 00                    call            strlen
0376  01 C0                             add             eax,eax
0378  8D 70 02                          lea             esi,0x2[eax]
037B  83 C0 05                          add             eax,0x00000005
037E  24 FC                             and             al,0xfc
0380  83 C4 04                          add             esp,0x00000004
0383  89 C3                             mov             ebx,eax
0385  E8 00 00 00 00                    call            stackavail
038A  39 C3                             cmp             ebx,eax
038C  73 0B                             jae             L$49
038E  8D 46 03                          lea             eax,0x3[esi]
0391  24 FC                             and             al,0xfc
0393  29 C4                             sub             esp,eax
0395  89 E0                             mov             eax,esp
0397  EB 02                             jmp             L$50
0399                            L$49:
0399  31 C0                             xor             eax,eax
039B                            L$50:
039B  FF 75 18                          push            dword ptr 0x18[ebp]
039E  50                                push            eax
039F  E8 00 00 00 00                    call            _atouni
03A4  83 C4 08                          add             esp,0x00000008
03A7  FF 75 1C                          push            dword ptr 0x1c[ebp]
03AA  50                                push            eax
03AB  FF 75 14                          push            dword ptr 0x14[ebp]
03AE  FF 75 10                          push            dword ptr 0x10[ebp]
03B1  E8 00 00 00 00                    call            _ustrftime
03B6  83 C4 10                          add             esp,0x00000010
03B9  C9                                leave
03BA  5E                                pop             esi
03BB  5B                                pop             ebx
03BC  C3                                ret

Routine Size: 84 bytes,    Routine Base: _TEXT + 0369

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000                            L$51:
0000  53 75 6E 64 61 79 00                            Sunday.
0007                            L$52:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E                            L$53:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016                            L$54:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020                            L$55:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029                            L$56:
0029  46 72 69 64 61 79 00                            Friday.
0030                            L$57:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039                            L$58:
0039  4A 61 6E 75 61 72 79 00                         January.
0041                            L$59:
0041  46 65 62 72 75 61 72 79 00                      February.
004A                            L$60:
004A  4D 61 72 63 68 00                               March.
0050                            L$61:
0050  41 70 72 69 6C 00                               April.
0056                            L$62:
0056  4D 61 79 00                                     May.
005A                            L$63:
005A  4A 75 6E 65 00                                  June.
005F                            L$64:
005F  4A 75 6C 79 00                                  July.
0064                            L$65:
0064  41 75 67 75 73 74 00                            August.
006B                            L$66:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075                            L$67:
0075  4F 63 74 6F 62 65 72 00                         October.
007D                            L$68:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086                            L$69:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F                            L$70:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4                            L$71:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD                            L$72:
00AD  0A 00                                           ..
00AF                            L$73:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB                            L$74:
00BB  41 4D 00                                        AM.
00BE                            L$75:
00BE  50 4D 00                                        PM.
00C1                            L$76:
00C1  09 00                                           ..
00C3                            L$77:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0                            L$78:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000                            awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C                            wday_name:
001C  00 00 00 00                                     DD        offset DGROUP:L$51
0020  07 00 00 00                                     DD        offset DGROUP:L$52
0024  0E 00 00 00                                     DD        offset DGROUP:L$53
0028  16 00 00 00                                     DD        offset DGROUP:L$54
002C  20 00 00 00                                     DD        offset DGROUP:L$55
0030  29 00 00 00                                     DD        offset DGROUP:L$56
0034  30 00 00 00                                     DD        offset DGROUP:L$57
0038                            amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068                            mon_name:
0068  39 00 00 00                                     DD        offset DGROUP:L$58
006C  41 00 00 00                                     DD        offset DGROUP:L$59
0070  4A 00 00 00                                     DD        offset DGROUP:L$60
0074  50 00 00 00                                     DD        offset DGROUP:L$61
0078  56 00 00 00                                     DD        offset DGROUP:L$62
007C  5A 00 00 00                                     DD        offset DGROUP:L$63
0080  5F 00 00 00                                     DD        offset DGROUP:L$64
0084  64 00 00 00                                     DD        offset DGROUP:L$65
0088  6B 00 00 00                                     DD        offset DGROUP:L$66
008C  75 00 00 00                                     DD        offset DGROUP:L$67
0090  7D 00 00 00                                     DD        offset DGROUP:L$68
0094  86 00 00 00                                     DD        offset DGROUP:L$69

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

