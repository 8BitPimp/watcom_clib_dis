Module: splitpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E3 bytes
0000                            copypart:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
000B  85 DB                             test            ebx,ebx
000D  74 2C                             je              L$2
000F  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
0013  39 CA                             cmp             edx,ecx
0015  7E 02                             jle             L$1
0017  89 CA                             mov             edx,ecx
0019                            L$1:
0019  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
001D  89 DF                             mov             edi,ebx
001F  89 D1                             mov             ecx,edx
0021  06                                push            es
0022  8C D8                             mov             eax,ds
0024  8E C0                             mov             es,eax
0026  57                                push            edi
0027  89 C8                             mov             eax,ecx
0029  C1 E9 02                          shr             ecx,0x02
002C  F2 A5                             repne movsd
002E  8A C8                             mov             cl,al
0030  80 E1 03                          and             cl,0x03
0033  F2 A4                             repne movsb
0035  5F                                pop             edi
0036  07                                pop             es
0037  C6 04 1A 00                       mov             byte ptr [edx+ebx],0x00
003B                            L$2:
003B  5F                                pop             edi
003C  5E                                pop             esi
003D  5B                                pop             ebx
003E  C3                                ret

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F                            _splitpath:
003F  53                                push            ebx
0040  56                                push            esi
0041  57                                push            edi
0042  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0046  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
004A  8A 23                             mov             ah,byte ptr [ebx]
004C  84 E4                             test            ah,ah
004E  74 1A                             je              L$4
0050  8A 53 01                          mov             dl,byte ptr 0x1[ebx]
0053  80 FA 3A                          cmp             dl,0x3a
0056  75 12                             jne             L$4
0058  85 F6                             test            esi,esi
005A  74 09                             je              L$3
005C  C6 46 02 00                       mov             byte ptr 0x2[esi],0x00
0060  88 26                             mov             byte ptr [esi],ah
0062  88 56 01                          mov             byte ptr 0x1[esi],dl
0065                            L$3:
0065  83 C3 02                          add             ebx,0x00000002
0068  EB 07                             jmp             L$5
006A                            L$4:
006A  85 F6                             test            esi,esi
006C  74 03                             je              L$5
006E  C6 06 00                          mov             byte ptr [esi],0x00
0071                            L$5:
0071  89 DF                             mov             edi,ebx
0073  89 DA                             mov             edx,ebx
0075                            L$6:
0075  31 F6                             xor             esi,esi
0077                            L$7:
0077  8A 03                             mov             al,byte ptr [ebx]
0079  84 C0                             test            al,al
007B  74 16                             je              L$10
007D  3C 2E                             cmp             al,0x2e
007F  75 05                             jne             L$8
0081  89 DE                             mov             esi,ebx
0083  43                                inc             ebx
0084  EB F1                             jmp             L$7
0086                            L$8:
0086  43                                inc             ebx
0087  3C 5C                             cmp             al,0x5c
0089  74 04                             je              L$9
008B  3C 2F                             cmp             al,0x2f
008D  75 E8                             jne             L$7
008F                            L$9:
008F  89 DF                             mov             edi,ebx
0091  EB E2                             jmp             L$6
0093                            L$10:
0093  89 F8                             mov             eax,edi
0095  68 FF 00 00 00                    push            0x000000ff
009A  29 D0                             sub             eax,edx
009C  50                                push            eax
009D  52                                push            edx
009E  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
00A2  52                                push            edx
00A3  E8 00 00 00 00                    call            copypart
00A8  83 C4 10                          add             esp,0x00000010
00AB  85 F6                             test            esi,esi
00AD  75 02                             jne             L$11
00AF  89 DE                             mov             esi,ebx
00B1                            L$11:
00B1  89 F2                             mov             edx,esi
00B3  68 FF 00 00 00                    push            0x000000ff
00B8  29 FA                             sub             edx,edi
00BA  52                                push            edx
00BB  57                                push            edi
00BC  8B 4C 24 28                       mov             ecx,dword ptr 0x28[esp]
00C0  51                                push            ecx
00C1  E8 00 00 00 00                    call            copypart
00C6  83 C4 10                          add             esp,0x00000010
00C9  68 FF 00 00 00                    push            0x000000ff
00CE  29 F3                             sub             ebx,esi
00D0  53                                push            ebx
00D1  56                                push            esi
00D2  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
00D6  56                                push            esi
00D7  E8 00 00 00 00                    call            copypart
00DC  83 C4 10                          add             esp,0x00000010
00DF  5F                                pop             edi
00E0  5E                                pop             esi
00E1  5B                                pop             ebx
00E2  C3                                ret

Routine Size: 164 bytes,    Routine Base: _TEXT + 003F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

