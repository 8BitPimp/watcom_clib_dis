Module: tzset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003CB bytes
0000                            tryOSTimeZone:
0000  53                                push            ebx
0001  56                                push            esi
0002  81 EC AC 00 00 00                 sub             esp,0x000000ac
0008  89 E0                             mov             eax,esp
000A  50                                push            eax
000B  E8 00 00 00 00                    call            _GetTimeZoneInformation
0010  83 F8 01                          cmp             eax,0x00000001
0013  0F 82 A1 00 00 00                 jb              L$9
0019  76 35                             jbe             L$1
001B  83 F8 02                          cmp             eax,0x00000002
001E  0F 85 96 00 00 00                 jne             L$9
0024  C7 05 00 00 00 00 01 00 00 00
                                        mov             dword ptr daylight,0x00000001
002E  8B 94 24 A8 00 00 00              mov             edx,dword ptr 0xa8[esp]
0035  89 D0                             mov             eax,edx
0037  C1 E0 04                          shl             eax,0x04
003A  29 D0                             sub             eax,edx
003C  C1 E0 02                          shl             eax,0x02
003F  89 C3                             mov             ebx,eax
0041  A3 00 00 00 00                    mov             dword ptr __dst_adjust,eax
0046  F7 DB                             neg             ebx
0048  89 1D 00 00 00 00                 mov             dword ptr __dst_adjust,ebx
004E  EB 08                             jmp             L$2
0050                            L$1:
0050  31 C9                             xor             ecx,ecx
0052  89 0D 00 00 00 00                 mov             dword ptr daylight,ecx
0058                            L$2:
0058  8B 54 24 54                       mov             edx,dword ptr 0x54[esp]
005C  8B 34 24                          mov             esi,dword ptr [esp]
005F  01 F2                             add             edx,esi
0061  89 D0                             mov             eax,edx
0063  C1 E0 04                          shl             eax,0x04
0066  29 D0                             sub             eax,edx
0068  B3 20                             mov             bl,0x20
006A  C1 E0 02                          shl             eax,0x02
006D  8D 54 24 04                       lea             edx,0x4[esp]
0071  A3 00 00 00 00                    mov             dword ptr timezone,eax
0076  B8 00 00 00 00                    mov             eax,offset stzone
007B  EB 0F                             jmp             L$5
007D                            L$3:
007D  80 FB 20                          cmp             bl,0x20
0080  75 05                             jne             L$4
0082  8A 1A                             mov             bl,byte ptr [edx]
0084  88 18                             mov             byte ptr [eax],bl
0086  40                                inc             eax
0087                            L$4:
0087  8A 1A                             mov             bl,byte ptr [edx]
0089  83 C2 02                          add             edx,0x00000002
008C                            L$5:
008C  66 83 3A 00                       cmp             word ptr [edx],0x0000
0090  75 EB                             jne             L$3
0092  B3 20                             mov             bl,0x20
0094  8D 54 24 58                       lea             edx,0x58[esp]
0098  C6 00 00                          mov             byte ptr [eax],0x00
009B  B8 00 00 00 00                    mov             eax,offset dtzone
00A0  EB 0F                             jmp             L$8
00A2                            L$6:
00A2  80 FB 20                          cmp             bl,0x20
00A5  75 05                             jne             L$7
00A7  8A 1A                             mov             bl,byte ptr [edx]
00A9  88 18                             mov             byte ptr [eax],bl
00AB  40                                inc             eax
00AC                            L$7:
00AC  8A 1A                             mov             bl,byte ptr [edx]
00AE  83 C2 02                          add             edx,0x00000002
00B1                            L$8:
00B1  66 83 3A 00                       cmp             word ptr [edx],0x0000
00B5  75 EB                             jne             L$6
00B7  C6 00 00                          mov             byte ptr [eax],0x00
00BA                            L$9:
00BA  81 C4 AC 00 00 00                 add             esp,0x000000ac
00C0  5E                                pop             esi
00C1  5B                                pop             ebx
00C2  C3                                ret

Routine Size: 195 bytes,    Routine Base: _TEXT + 0000

00C3                            tzset:
00C3  68 00 00 00 00                    push            offset DGROUP:L$31
00C8  E8 00 00 00 00                    call            getenv
00CD  83 C4 04                          add             esp,0x00000004
00D0  85 C0                             test            eax,eax
00D2  0F 84 00 00 00 00                 je              tryOSTimeZone
00D8  50                                push            eax
00D9  E8 00 00 00 00                    call            __parse_tz
00DE  83 C4 04                          add             esp,0x00000004
00E1  C3                                ret
00E2                            parse_time:
00E2  53                                push            ebx
00E3  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00E7  31 D2                             xor             edx,edx
00E9                            L$10:
00E9  8A 18                             mov             bl,byte ptr [eax]
00EB  80 FB 30                          cmp             bl,0x30
00EE  72 14                             jb              L$11
00F0  80 FB 39                          cmp             bl,0x39
00F3  77 0F                             ja              L$11
00F5  6B D2 0A                          imul            edx,0x0000000a
00F8  31 DB                             xor             ebx,ebx
00FA  8A 18                             mov             bl,byte ptr [eax]
00FC  01 DA                             add             edx,ebx
00FE  40                                inc             eax
00FF  83 EA 30                          sub             edx,0x00000030
0102  EB E5                             jmp             L$10
0104                            L$11:
0104  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0108  89 13                             mov             dword ptr [ebx],edx
010A  5B                                pop             ebx
010B  C3                                ret
010C                            parse_offset:
010C  53                                push            ebx
010D  56                                push            esi
010E  57                                push            edi
010F  55                                push            ebp
0110  83 EC 0C                          sub             esp,0x0000000c
0113  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0117  80 3A 3A                          cmp             byte ptr [edx],0x3a
011A  75 01                             jne             L$12
011C  42                                inc             edx
011D                            L$12:
011D  89 D6                             mov             esi,edx
011F                            L$13:
011F  8A 1A                             mov             bl,byte ptr [edx]
0121  84 DB                             test            bl,bl
0123  74 1C                             je              L$15
0125  80 FB 2C                          cmp             bl,0x2c
0128  74 17                             je              L$15
012A  80 FB 2D                          cmp             bl,0x2d
012D  74 12                             je              L$15
012F  80 FB 2B                          cmp             bl,0x2b
0132  74 0D                             je              L$15
0134  80 FB 30                          cmp             bl,0x30
0137  72 05                             jb              L$14
0139  80 FB 39                          cmp             bl,0x39
013C  76 03                             jbe             L$15
013E                            L$14:
013E  42                                inc             edx
013F  EB DE                             jmp             L$13
0141                            L$15:
0141  89 D5                             mov             ebp,edx
0143  29 F5                             sub             ebp,esi
0145  83 FD 1E                          cmp             ebp,0x0000001e
0148  7E 05                             jle             L$16
014A  BD 1E 00 00 00                    mov             ebp,0x0000001e
014F                            L$16:
014F  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0153  89 E9                             mov             ecx,ebp
0155  01 FD                             add             ebp,edi
0157  06                                push            es
0158  8C D8                             mov             eax,ds
015A  8E C0                             mov             es,eax
015C  57                                push            edi
015D  89 C8                             mov             eax,ecx
015F  C1 E9 02                          shr             ecx,0x02
0162  F2 A5                             repne movsd
0164  8A C8                             mov             cl,al
0166  80 E1 03                          and             cl,0x03
0169  F2 A4                             repne movsb
016B  5F                                pop             edi
016C  07                                pop             es
016D  8D 42 01                          lea             eax,0x1[edx]
0170  C6 45 00 00                       mov             byte ptr [ebp],0x00
0174  31 ED                             xor             ebp,ebp
0176  80 FB 2D                          cmp             bl,0x2d
0179  75 07                             jne             L$17
017B  BD 01 00 00 00                    mov             ebp,0x00000001
0180  EB 05                             jmp             L$18
0182                            L$17:
0182  80 FB 2B                          cmp             bl,0x2b
0185  75 02                             jne             L$19
0187                            L$18:
0187  89 C2                             mov             edx,eax
0189                            L$19:
0189  8A 02                             mov             al,byte ptr [edx]
018B  3C 30                             cmp             al,0x30
018D  0F 82 86 00 00 00                 jb              L$21
0193  3C 39                             cmp             al,0x39
0195  0F 87 7E 00 00 00                 ja              L$21
019B  8D 44 24 08                       lea             eax,0x8[esp]
019F  31 F6                             xor             esi,esi
01A1  50                                push            eax
01A2  89 74 24 04                       mov             dword ptr 0x4[esp],esi
01A6  52                                push            edx
01A7  89 74 24 0C                       mov             dword ptr 0xc[esp],esi
01AB  89 74 24 10                       mov             dword ptr 0x10[esp],esi
01AF  E8 00 00 00 00                    call            parse_time
01B4  83 C4 08                          add             esp,0x00000008
01B7  8A 18                             mov             bl,byte ptr [eax]
01B9  89 C2                             mov             edx,eax
01BB  80 FB 3A                          cmp             bl,0x3a
01BE  75 26                             jne             L$20
01C0  8D 54 24 04                       lea             edx,0x4[esp]
01C4  52                                push            edx
01C5  40                                inc             eax
01C6  50                                push            eax
01C7  E8 00 00 00 00                    call            parse_time
01CC  83 C4 08                          add             esp,0x00000008
01CF  8A 38                             mov             bh,byte ptr [eax]
01D1  89 C2                             mov             edx,eax
01D3  38 DF                             cmp             bh,bl
01D5  75 0F                             jne             L$20
01D7  89 E2                             mov             edx,esp
01D9  52                                push            edx
01DA  40                                inc             eax
01DB  50                                push            eax
01DC  E8 00 00 00 00                    call            parse_time
01E1  83 C4 08                          add             esp,0x00000008
01E4  89 C2                             mov             edx,eax
01E6                            L$20:
01E6  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
01EA  89 F0                             mov             eax,esi
01EC  C1 E0 04                          shl             eax,0x04
01EF  29 F0                             sub             eax,esi
01F1  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
01F5  C1 E0 02                          shl             eax,0x02
01F8  01 C6                             add             esi,eax
01FA  89 F0                             mov             eax,esi
01FC  C1 E0 04                          shl             eax,0x04
01FF  29 F0                             sub             eax,esi
0201  8B 34 24                          mov             esi,dword ptr [esp]
0204  C1 E0 02                          shl             eax,0x02
0207  01 C6                             add             esi,eax
0209  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
020D  89 30                             mov             dword ptr [eax],esi
020F  85 ED                             test            ebp,ebp
0211  74 06                             je              L$21
0213  89 F3                             mov             ebx,esi
0215  F7 DB                             neg             ebx
0217  89 18                             mov             dword ptr [eax],ebx
0219                            L$21:
0219  89 D0                             mov             eax,edx
021B  83 C4 0C                          add             esp,0x0000000c
021E  5D                                pop             ebp
021F  5F                                pop             edi
0220  5E                                pop             esi
0221  5B                                pop             ebx
0222  C3                                ret
0223                            parse_rule:
0223  53                                push            ebx
0224  56                                push            esi
0225  83 EC 10                          sub             esp,0x00000010
0228  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
022C  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0230  8A 22                             mov             ah,byte ptr [edx]
0232  BE FF FF FF FF                    mov             esi,0xffffffff
0237  80 FC 4A                          cmp             ah,0x4a
023A  75 07                             jne             L$22
023C  BE 01 00 00 00                    mov             esi,0x00000001
0241  01 F2                             add             edx,esi
0243                            L$22:
0243  80 3A 4D                          cmp             byte ptr [edx],0x4d
0246  75 03                             jne             L$23
0248  42                                inc             edx
0249  31 F6                             xor             esi,esi
024B                            L$23:
024B  8D 44 24 0C                       lea             eax,0xc[esp]
024F  50                                push            eax
0250  52                                push            edx
0251  89 73 20                          mov             dword ptr 0x20[ebx],esi
0254  E8 00 00 00 00                    call            parse_time
0259  89 C1                             mov             ecx,eax
025B  83 C4 08                          add             esp,0x00000008
025E  89 C2                             mov             edx,eax
0260  85 F6                             test            esi,esi
0262  74 09                             je              L$24
0264  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0268  89 43 1C                          mov             dword ptr 0x1c[ebx],eax
026B  EB 4B                             jmp             L$26
026D                            L$24:
026D  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0271  48                                dec             eax
0272  89 43 10                          mov             dword ptr 0x10[ebx],eax
0275  80 39 2E                          cmp             byte ptr [ecx],0x2e
0278  75 37                             jne             L$25
027A  8D 44 24 0C                       lea             eax,0xc[esp]
027E  50                                push            eax
027F  41                                inc             ecx
0280  51                                push            ecx
0281  E8 00 00 00 00                    call            parse_time
0286  89 C1                             mov             ecx,eax
0288  83 C4 08                          add             esp,0x00000008
028B  89 C2                             mov             edx,eax
028D  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0291  89 43 0C                          mov             dword ptr 0xc[ebx],eax
0294  80 39 2E                          cmp             byte ptr [ecx],0x2e
0297  75 18                             jne             L$25
0299  8D 44 24 0C                       lea             eax,0xc[esp]
029D  50                                push            eax
029E  41                                inc             ecx
029F  51                                push            ecx
02A0  E8 00 00 00 00                    call            parse_time
02A5  83 C4 08                          add             esp,0x00000008
02A8  89 C2                             mov             edx,eax
02AA  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
02AE  89 43 18                          mov             dword ptr 0x18[ebx],eax
02B1                            L$25:
02B1  C7 43 1C 00 00 00 00              mov             dword ptr 0x1c[ebx],0x00000000
02B8                            L$26:
02B8  B9 02 00 00 00                    mov             ecx,0x00000002
02BD  31 F6                             xor             esi,esi
02BF  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
02C3  89 34 24                          mov             dword ptr [esp],esi
02C6  89 74 24 04                       mov             dword ptr 0x4[esp],esi
02CA  80 3A 2F                          cmp             byte ptr [edx],0x2f
02CD  75 3F                             jne             L$27
02CF  8D 44 24 08                       lea             eax,0x8[esp]
02D3  50                                push            eax
02D4  42                                inc             edx
02D5  52                                push            edx
02D6  E8 00 00 00 00                    call            parse_time
02DB  83 C4 08                          add             esp,0x00000008
02DE  8A 28                             mov             ch,byte ptr [eax]
02E0  89 C2                             mov             edx,eax
02E2  80 FD 3A                          cmp             ch,0x3a
02E5  75 27                             jne             L$27
02E7  8D 54 24 04                       lea             edx,0x4[esp]
02EB  52                                push            edx
02EC  40                                inc             eax
02ED  50                                push            eax
02EE  E8 00 00 00 00                    call            parse_time
02F3  83 C4 08                          add             esp,0x00000008
02F6  8A 08                             mov             cl,byte ptr [eax]
02F8  89 C2                             mov             edx,eax
02FA  80 F9 3A                          cmp             cl,0x3a
02FD  75 0F                             jne             L$27
02FF  89 E2                             mov             edx,esp
0301  52                                push            edx
0302  40                                inc             eax
0303  50                                push            eax
0304  E8 00 00 00 00                    call            parse_time
0309  83 C4 08                          add             esp,0x00000008
030C  89 C2                             mov             edx,eax
030E                            L$27:
030E  8B 04 24                          mov             eax,dword ptr [esp]
0311  89 03                             mov             dword ptr [ebx],eax
0313  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0317  89 43 04                          mov             dword ptr 0x4[ebx],eax
031A  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
031E  89 43 08                          mov             dword ptr 0x8[ebx],eax
0321  89 D0                             mov             eax,edx
0323  83 C4 10                          add             esp,0x00000010
0326  5E                                pop             esi
0327  5B                                pop             ebx
0328  C3                                ret

Routine Size: 614 bytes,    Routine Base: _TEXT + 00C3

0329                            __parse_tz:
0329  53                                push            ebx
032A  56                                push            esi
032B  83 EC 04                          sub             esp,0x00000004
032E  68 00 00 00 00                    push            offset timezone
0333  68 00 00 00 00                    push            offset stzone
0338  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
033C  31 D2                             xor             edx,edx
033E  53                                push            ebx
033F  89 15 00 00 00 00                 mov             dword ptr daylight,edx
0345  E8 00 00 00 00                    call            parse_offset
034A  89 C2                             mov             edx,eax
034C  8A 20                             mov             ah,byte ptr [eax]
034E  83 C4 0C                          add             esp,0x0000000c
0351  84 E4                             test            ah,ah
0353  75 08                             jne             L$28
0355  88 25 00 00 00 00                 mov             byte ptr dtzone,ah
035B  EB 68                             jmp             L$30
035D                            L$28:
035D  A1 00 00 00 00                    mov             eax,dword ptr timezone
0362  2D 10 0E 00 00                    sub             eax,0x00000e10
0367  89 04 24                          mov             dword ptr [esp],eax
036A  89 E0                             mov             eax,esp
036C  50                                push            eax
036D  68 00 00 00 00                    push            offset dtzone
0372  B9 01 00 00 00                    mov             ecx,0x00000001
0377  52                                push            edx
0378  89 0D 00 00 00 00                 mov             dword ptr daylight,ecx
037E  E8 00 00 00 00                    call            parse_offset
0383  83 C4 0C                          add             esp,0x0000000c
0386  8B 1D 00 00 00 00                 mov             ebx,dword ptr timezone
038C  8B 34 24                          mov             esi,dword ptr [esp]
038F  29 F3                             sub             ebx,esi
0391  89 1D 00 00 00 00                 mov             dword ptr __dst_adjust,ebx
0397  8A 18                             mov             bl,byte ptr [eax]
0399  89 C2                             mov             edx,eax
039B  80 FB 2C                          cmp             bl,0x2c
039E  75 11                             jne             L$29
03A0  68 00 00 00 00                    push            offset __start_dst
03A5  40                                inc             eax
03A6  50                                push            eax
03A7  E8 00 00 00 00                    call            parse_rule
03AC  83 C4 08                          add             esp,0x00000008
03AF  89 C2                             mov             edx,eax
03B1                            L$29:
03B1  80 3A 2C                          cmp             byte ptr [edx],0x2c
03B4  75 0F                             jne             L$30
03B6  68 00 00 00 00                    push            offset __end_dst
03BB  42                                inc             edx
03BC  52                                push            edx
03BD  E8 00 00 00 00                    call            parse_rule
03C2  83 C4 08                          add             esp,0x00000008
03C5                            L$30:
03C5  83 C4 04                          add             esp,0x00000004
03C8  5E                                pop             esi
03C9  5B                                pop             ebx
03CA  C3                                ret

Routine Size: 162 bytes,    Routine Base: _TEXT + 0329

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000                            L$31:
0000  54 5A 00                                        TZ.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000009A bytes
0000                            __start_dst:
0000  00 00 00 00 00 00 00 00 02 00 00 00 01 00 00 00 ................
0010  03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0020  00 00 00 00                                     ....
0024                            __end_dst:
0024  00 00 00 00 00 00 00 00 02 00 00 00 05 00 00 00 ................
0034  09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00                                     ....
0048                            timezone:
0048  50 46 00 00                                     PF..
004C                            __dst_adjust:
004C  10 0E 00 00                                     ....
0050                            daylight:
0050  01 00 00 00                                     ....
0054                            stzone:
0054  45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EST.............
0064  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0073                            dtzone:
0073  45 44 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EDT.............
0083  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0092                            tzname:
0092  00 00 00 00                                     DD        offset stzone
0096  00 00 00 00                                     DD        offset dtzone

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

