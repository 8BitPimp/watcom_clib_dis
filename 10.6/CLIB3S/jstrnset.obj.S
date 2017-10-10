Module: jstrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000013F bytes
0000                            jstrnset:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 10                          sub             esp,0x00000010
0007  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
000B  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
000F  89 5C 24 04                       mov             dword ptr 0x4[esp],ebx
0013  85 D2                             test            edx,edx
0015  0F 84 1A 01 00 00                 je              L$13
001B  31 F6                             xor             esi,esi
001D  66 8B 74 24 28                    mov             si,word ptr 0x28[esp]
0022  56                                push            esi
0023  E8 00 00 00 00                    call            jiszen
0028  83 C4 04                          add             esp,0x00000004
002B  85 C0                             test            eax,eax
002D  0F 95 C0                          setne           al
0030  25 FF 00 00 00                    and             eax,0x000000ff
0035  8B 7C 24 2C                       mov             edi,dword ptr 0x2c[esp]
0039  40                                inc             eax
003A  0F AF F8                          imul            edi,eax
003D  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
0041  89 DF                             mov             edi,ebx
0043  06                                push            es
0044  8C D8                             mov             eax,ds
0046  8E C0                             mov             es,eax
0048  29 C9                             sub             ecx,ecx
004A  49                                dec             ecx
004B  31 C0                             xor             eax,eax
004D  F2 AE                             repne scasb
004F  F7 D1                             not             ecx
0051  49                                dec             ecx
0052  07                                pop             es
0053  89 CD                             mov             ebp,ecx
0055  89 0C 24                          mov             dword ptr [esp],ecx
0058  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
005C  39 CD                             cmp             ebp,ecx
005E  77 43                             ja              L$4
0060  56                                push            esi
0061  E8 00 00 00 00                    call            jiszen
0066  83 C4 04                          add             esp,0x00000004
0069  85 C0                             test            eax,eax
006B  74 30                             je              L$3
006D  D1 ED                             shr             ebp,0x01
006F  31 F6                             xor             esi,esi
0071  EB 14                             jmp             L$2
0073                            L$1:
0073  31 FF                             xor             edi,edi
0075  66 8B 7C 24 28                    mov             di,word ptr 0x28[esp]
007A  57                                push            edi
007B  53                                push            ebx
007C  46                                inc             esi
007D  E8 00 00 00 00                    call            jputmoji
0082  89 C3                             mov             ebx,eax
0084  83 C4 08                          add             esp,0x00000008
0087                            L$2:
0087  39 EE                             cmp             esi,ebp
0089  72 E8                             jb              L$1
008B  F6 04 24 01                       test            byte ptr [esp],0x01
008F  0F 84 9C 00 00 00                 je              L$12
0095  C6 03 20                          mov             byte ptr [ebx],0x20
0098  E9 94 00 00 00                    jmp             L$12
009D                            L$3:
009D  55                                push            ebp
009E  E9 84 00 00 00                    jmp             L$11
00A3                            L$4:
00A3  89 DE                             mov             esi,ebx
00A5  8D 69 FF                          lea             ebp,-0x1[ecx]
00A8  EB 10                             jmp             L$6
00AA                            L$5:
00AA  8D 7C 24 0C                       lea             edi,0xc[esp]
00AE  57                                push            edi
00AF  56                                push            esi
00B0  E8 00 00 00 00                    call            jgetmoji
00B5  89 C6                             mov             esi,eax
00B7  83 C4 08                          add             esp,0x00000008
00BA                            L$6:
00BA  89 F7                             mov             edi,esi
00BC  29 DF                             sub             edi,ebx
00BE  39 EF                             cmp             edi,ebp
00C0  72 E8                             jb              L$5
00C2  8D 44 24 0C                       lea             eax,0xc[esp]
00C6  50                                push            eax
00C7  56                                push            esi
00C8  E8 00 00 00 00                    call            jgetmoji
00CD  83 C4 08                          add             esp,0x00000008
00D0  3B 7C 24 08                       cmp             edi,dword ptr 0x8[esp]
00D4  74 18                             je              L$7
00D6  31 C0                             xor             eax,eax
00D8  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
00DD  50                                push            eax
00DE  E8 00 00 00 00                    call            jiszen
00E3  83 C4 04                          add             esp,0x00000004
00E6  85 C0                             test            eax,eax
00E8  74 04                             je              L$7
00EA  C6 46 01 20                       mov             byte ptr 0x1[esi],0x20
00EE                            L$7:
00EE  31 F6                             xor             esi,esi
00F0  66 8B 74 24 28                    mov             si,word ptr 0x28[esp]
00F5  56                                push            esi
00F6  E8 00 00 00 00                    call            jiszen
00FB  83 C4 04                          add             esp,0x00000004
00FE  85 C0                             test            eax,eax
0100  74 20                             je              L$10
0102  31 F6                             xor             esi,esi
0104  EB 14                             jmp             L$9
0106                            L$8:
0106  31 FF                             xor             edi,edi
0108  66 8B 7C 24 28                    mov             di,word ptr 0x28[esp]
010D  57                                push            edi
010E  53                                push            ebx
010F  46                                inc             esi
0110  E8 00 00 00 00                    call            jputmoji
0115  89 C3                             mov             ebx,eax
0117  83 C4 08                          add             esp,0x00000008
011A                            L$9:
011A  3B 74 24 2C                       cmp             esi,dword ptr 0x2c[esp]
011E  73 11                             jae             L$12
0120  EB E4                             jmp             L$8
0122                            L$10:
0122  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
0126  50                                push            eax
0127                            L$11:
0127  56                                push            esi
0128  53                                push            ebx
0129  E8 00 00 00 00                    call            memset
012E  83 C4 0C                          add             esp,0x0000000c
0131                            L$12:
0131  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
0135                            L$13:
0135  89 D8                             mov             eax,ebx
0137  83 C4 10                          add             esp,0x00000010
013A  5D                                pop             ebp
013B  5F                                pop             edi
013C  5E                                pop             esi
013D  5B                                pop             ebx
013E  C3                                ret

Routine Size: 319 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

