Module: setenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000334 bytes
0000                            setenv:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
000B  85 D2                             test            edx,edx
000D  75 0A                             jne             L$2
000F                            L$1:
000F  B8 FF FF FF FF                    mov             eax,0xffffffff
0014  E9 F7 01 00 00                    jmp             L$13
0019                            L$2:
0019  80 3A 00                          cmp             byte ptr [edx],0x00
001C  74 F1                             je              L$1
001E  8B 2D 00 00 00 00                 mov             ebp,dword ptr environ
0024  85 ED                             test            ebp,ebp
0026  75 3C                             jne             L$3
0028  83 7C 24 24 00                    cmp             dword ptr 0x24[esp],0x00000000
002D  0F 84 DB 01 00 00                 je              L$12
0033  6A 09                             push            0x00000009
0035  E8 00 00 00 00                    call            malloc
003A  83 C4 04                          add             esp,0x00000004
003D  89 C5                             mov             ebp,eax
003F  85 C0                             test            eax,eax
0041  74 CC                             je              L$1
0043  C7 00 00 00 00 00                 mov             dword ptr [eax],0x00000000
0049  A3 00 00 00 00                    mov             dword ptr environ,eax
004E  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],0x00000000
0055  83 C0 08                          add             eax,0x00000008
0058  31 DB                             xor             ebx,ebx
005A  A3 00 00 00 00                    mov             dword ptr __env_mask,eax
005F  E9 F1 00 00 00                    jmp             L$7
0064                            L$3:
0064  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0068  53                                push            ebx
0069  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
006D  51                                push            ecx
006E  E8 00 00 00 00                    call            findenv
0073  83 C4 08                          add             esp,0x00000008
0076  85 DB                             test            ebx,ebx
0078  0F 84 90 01 00 00                 je              L$12
007E  85 C0                             test            eax,eax
0080  0F 8F C1 00 00 00                 jg              L$6
0086  F7 D8                             neg             eax
0088  89 C3                             mov             ebx,eax
008A  8B 0D 00 00 00 00                 mov             ecx,dword ptr __env_mask
0090  89 DE                             mov             esi,ebx
0092  40                                inc             eax
0093  C1 E6 02                          shl             esi,0x02
0096  89 04 24                          mov             dword ptr [esp],eax
0099  8D 46 08                          lea             eax,0x8[esi]
009C  8B 14 24                          mov             edx,dword ptr [esp]
009F  89 44 24 04                       mov             dword ptr 0x4[esp],eax
00A3  01 D0                             add             eax,edx
00A5  85 C9                             test            ecx,ecx
00A7  75 52                             jne             L$4
00A9  50                                push            eax
00AA  E8 00 00 00 00                    call            malloc
00AF  89 C2                             mov             edx,eax
00B1  83 C4 04                          add             esp,0x00000004
00B4  89 C5                             mov             ebp,eax
00B6  85 C0                             test            eax,eax
00B8  0F 84 51 FF FF FF                 je              L$1
00BE  A1 00 00 00 00                    mov             eax,dword ptr environ
00C3  89 F1                             mov             ecx,esi
00C5  89 D7                             mov             edi,edx
00C7  89 C6                             mov             esi,eax
00C9  06                                push            es
00CA  8C D8                             mov             eax,ds
00CC  8E C0                             mov             es,eax
00CE  57                                push            edi
00CF  89 C8                             mov             eax,ecx
00D1  C1 E9 02                          shr             ecx,0x02
00D4  F2 A5                             repne movsd
00D6  8A C8                             mov             cl,al
00D8  80 E1 03                          and             cl,0x03
00DB  F2 A4                             repne movsb
00DD  5F                                pop             edi
00DE  07                                pop             es
00DF  8B 3C 24                          mov             edi,dword ptr [esp]
00E2  57                                push            edi
00E3  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00E7  6A 00                             push            0x00000000
00E9  01 D0                             add             eax,edx
00EB  50                                push            eax
00EC  A3 00 00 00 00                    mov             dword ptr __env_mask,eax
00F1  E8 00 00 00 00                    call            memset
00F6  83 C4 0C                          add             esp,0x0000000c
00F9  EB 31                             jmp             L$5
00FB                            L$4:
00FB  50                                push            eax
00FC  55                                push            ebp
00FD  E8 00 00 00 00                    call            realloc
0102  83 C4 08                          add             esp,0x00000008
0105  89 C5                             mov             ebp,eax
0107  85 C0                             test            eax,eax
0109  0F 84 00 FF FF FF                 je              L$1
010F  53                                push            ebx
0110  8B 35 00 00 00 00                 mov             esi,dword ptr __env_mask
0116  56                                push            esi
0117  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
011B  01 C6                             add             esi,eax
011D  56                                push            esi
011E  E8 00 00 00 00                    call            memmove
0123  83 C4 0C                          add             esp,0x0000000c
0126  89 35 00 00 00 00                 mov             dword ptr __env_mask,esi
012C                            L$5:
012C  89 D8                             mov             eax,ebx
012E  C7 44 85 04 00 00 00 00           mov             dword ptr 0x4[ebp+eax*4],0x00000000
0136  A1 00 00 00 00                    mov             eax,dword ptr __env_mask
013B  89 2D 00 00 00 00                 mov             dword ptr environ,ebp
0141  C6 04 03 00                       mov             byte ptr [ebx+eax],0x00
0145  EB 0E                             jmp             L$7
0147                            L$6:
0147  83 7C 24 28 00                    cmp             dword ptr 0x28[esp],0x00000000
014C  0F 84 BC 00 00 00                 je              L$12
0152  8D 58 FF                          lea             ebx,-0x1[eax]
0155                            L$7:
0155  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0159  06                                push            es
015A  8C D8                             mov             eax,ds
015C  8E C0                             mov             es,eax
015E  29 C9                             sub             ecx,ecx
0160  49                                dec             ecx
0161  31 C0                             xor             eax,eax
0163  F2 AE                             repne scasb
0165  F7 D1                             not             ecx
0167  49                                dec             ecx
0168  07                                pop             es
0169  A1 00 00 00 00                    mov             eax,dword ptr __env_mask
016E  8A 34 03                          mov             dh,byte ptr [ebx+eax]
0171  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
0175  84 F6                             test            dh,dh
0177  74 08                             je              L$8
0179  89 DA                             mov             edx,ebx
017B  8B 54 95 00                       mov             edx,dword ptr [ebp+edx*4]
017F  EB 02                             jmp             L$9
0181                            L$8:
0181  31 D2                             xor             edx,edx
0183                            L$9:
0183  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0187  06                                push            es
0188  8C D8                             mov             eax,ds
018A  8E C0                             mov             es,eax
018C  29 C9                             sub             ecx,ecx
018E  49                                dec             ecx
018F  31 C0                             xor             eax,eax
0191  F2 AE                             repne scasb
0193  F7 D1                             not             ecx
0195  49                                dec             ecx
0196  07                                pop             es
0197  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
019B  01 C8                             add             eax,ecx
019D  83 C0 02                          add             eax,0x00000002
01A0  50                                push            eax
01A1  52                                push            edx
01A2  E8 00 00 00 00                    call            realloc
01A7  89 C2                             mov             edx,eax
01A9  83 C4 08                          add             esp,0x00000008
01AC  85 C0                             test            eax,eax
01AE  0F 84 5B FE FF FF                 je              L$1
01B4  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
01B8  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
01BC  89 C7                             mov             edi,eax
01BE  06                                push            es
01BF  8C D8                             mov             eax,ds
01C1  8E C0                             mov             es,eax
01C3  57                                push            edi
01C4  89 C8                             mov             eax,ecx
01C6  C1 E9 02                          shr             ecx,0x02
01C9  F2 A5                             repne movsd
01CB  8A C8                             mov             cl,al
01CD  80 E1 03                          and             cl,0x03
01D0  F2 A4                             repne movsb
01D2  5F                                pop             edi
01D3  07                                pop             es
01D4  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
01D8  8D 78 01                          lea             edi,0x1[eax]
01DB  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
01DF  01 D7                             add             edi,edx
01E1  C6 04 02 3D                       mov             byte ptr [edx+eax],0x3d
01E5  57                                push            edi
01E6                            L$10:
01E6  8A 06                             mov             al,byte ptr [esi]
01E8  88 07                             mov             byte ptr [edi],al
01EA  3C 00                             cmp             al,0x00
01EC  74 10                             je              L$11
01EE  8A 46 01                          mov             al,byte ptr 0x1[esi]
01F1  83 C6 02                          add             esi,0x00000002
01F4  88 47 01                          mov             byte ptr 0x1[edi],al
01F7  83 C7 02                          add             edi,0x00000002
01FA  3C 00                             cmp             al,0x00
01FC  75 E8                             jne             L$10
01FE                            L$11:
01FE  5F                                pop             edi
01FF  89 D8                             mov             eax,ebx
0201  89 54 85 00                       mov             dword ptr [ebp+eax*4],edx
0205  A1 00 00 00 00                    mov             eax,dword ptr __env_mask
020A  C6 04 03 01                       mov             byte ptr [ebx+eax],0x01
020E                            L$12:
020E  31 C0                             xor             eax,eax
0210                            L$13:
0210  83 C4 0C                          add             esp,0x0000000c
0213  5D                                pop             ebp
0214  5F                                pop             edi
0215  5E                                pop             esi
0216  5B                                pop             ebx
0217  C3                                ret
0218                            findenv:
0218  53                                push            ebx
0219  56                                push            esi
021A  57                                push            edi
021B  55                                push            ebp
021C  83 EC 08                          sub             esp,0x00000008
021F  A1 00 00 00 00                    mov             eax,dword ptr environ
0224  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0228  E9 E0 00 00 00                    jmp             L$24
022D                            L$14:
022D  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
0231                            L$15:
0231  8B 1C 24                          mov             ebx,dword ptr [esp]
0234  31 C0                             xor             eax,eax
0236  8A 03                             mov             al,byte ptr [ebx]
0238  83 F8 3D                          cmp             eax,0x0000003d
023B  0F 85 90 00 00 00                 jne             L$22
0241  80 7D 00 00                       cmp             byte ptr [ebp],0x00
0245  0F 85 86 00 00 00                 jne             L$22
024B  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
024F  2B 35 00 00 00 00                 sub             esi,dword ptr environ
0255  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0259  C1 FE 02                          sar             esi,0x02
025C  85 FF                             test            edi,edi
025E  0F 85 68 00 00 00                 jne             L$21
0264  8B 7C 24 04                       mov             edi,dword ptr 0x4[esp]
0268  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
026C  8B 3F                             mov             edi,dword ptr [edi]
026E  EB 08                             jmp             L$17
0270                            L$16:
0270  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
0273  89 03                             mov             dword ptr [ebx],eax
0275  83 C3 04                          add             ebx,0x00000004
0278                            L$17:
0278  83 3B 00                          cmp             dword ptr [ebx],0x00000000
027B  75 F3                             jne             L$16
027D  8B 15 00 00 00 00                 mov             edx,dword ptr __env_mask
0283  85 D2                             test            edx,edx
0285  74 4A                             je              L$22
0287  89 D0                             mov             eax,edx
0289  80 3C 06 00                       cmp             byte ptr [esi+eax],0x00
028D  74 09                             je              L$18
028F  57                                push            edi
0290  E8 00 00 00 00                    call            free
0295  83 C4 04                          add             esp,0x00000004
0298                            L$18:
0298  8B 0D 00 00 00 00                 mov             ecx,dword ptr environ
029E  89 DF                             mov             edi,ebx
02A0  29 CF                             sub             edi,ecx
02A2  C1 FF 02                          sar             edi,0x02
02A5  57                                push            edi
02A6  A1 00 00 00 00                    mov             eax,dword ptr __env_mask
02AB  50                                push            eax
02AC  53                                push            ebx
02AD  E8 00 00 00 00                    call            memmove
02B2  83 C4 0C                          add             esp,0x0000000c
02B5  89 1D 00 00 00 00                 mov             dword ptr __env_mask,ebx
02BB  01 F3                             add             ebx,esi
02BD  EB 07                             jmp             L$20
02BF                            L$19:
02BF  8A 43 01                          mov             al,byte ptr 0x1[ebx]
02C2  46                                inc             esi
02C3  88 03                             mov             byte ptr [ebx],al
02C5  43                                inc             ebx
02C6                            L$20:
02C6  39 FE                             cmp             esi,edi
02C8  7D 07                             jge             L$22
02CA  EB F3                             jmp             L$19
02CC                            L$21:
02CC  8D 46 01                          lea             eax,0x1[esi]
02CF  EB 5B                             jmp             L$25
02D1                            L$22:
02D1  8B 1C 24                          mov             ebx,dword ptr [esp]
02D4  31 C0                             xor             eax,eax
02D6  8A 03                             mov             al,byte ptr [ebx]
02D8  50                                push            eax
02D9  E8 00 00 00 00                    call            toupper
02DE  89 C3                             mov             ebx,eax
02E0  31 C0                             xor             eax,eax
02E2  83 C4 04                          add             esp,0x00000004
02E5  8A 45 00                          mov             al,byte ptr [ebp]
02E8  50                                push            eax
02E9  E8 00 00 00 00                    call            toupper
02EE  83 C4 04                          add             esp,0x00000004
02F1  39 C3                             cmp             ebx,eax
02F3  75 13                             jne             L$23
02F5  80 7D 00 00                       cmp             byte ptr [ebp],0x00
02F9  74 0D                             je              L$23
02FB  8B 14 24                          mov             edx,dword ptr [esp]
02FE  42                                inc             edx
02FF  45                                inc             ebp
0300  89 14 24                          mov             dword ptr [esp],edx
0303  E9 29 FF FF FF                    jmp             L$15
0308                            L$23:
0308  83 44 24 04 04                    add             dword ptr 0x4[esp],0x00000004
030D                            L$24:
030D  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0311  8B 00                             mov             eax,dword ptr [eax]
0313  89 04 24                          mov             dword ptr [esp],eax
0316  85 C0                             test            eax,eax
0318  0F 85 0F FF FF FF                 jne             L$14
031E  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
0322  A1 00 00 00 00                    mov             eax,dword ptr environ
0327  29 D8                             sub             eax,ebx
0329  C1 F8 02                          sar             eax,0x02
032C                            L$25:
032C  83 C4 08                          add             esp,0x00000008
032F  5D                                pop             ebp
0330  5F                                pop             edi
0331  5E                                pop             esi
0332  5B                                pop             ebx
0333  C3                                ret

Routine Size: 820 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

