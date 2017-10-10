Module: strtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000204 bytes
0000                            _stol:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
000B  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
000F  85 D2                             test            edx,edx
0011  74 06                             je              L$1
0013  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0017  89 02                             mov             dword ptr [edx],eax
0019                            L$1:
0019  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
001D                            L$2:
001D  8A 03                             mov             al,byte ptr [ebx]
001F  FE C0                             inc             al
0021  25 FF 00 00 00                    and             eax,0x000000ff
0026  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
002C  24 02                             and             al,0x02
002E  25 FF 00 00 00                    and             eax,0x000000ff
0033  74 03                             je              L$3
0035  43                                inc             ebx
0036  EB E5                             jmp             L$2
0038                            L$3:
0038  8A 03                             mov             al,byte ptr [ebx]
003A  88 44 24 04                       mov             byte ptr 0x4[esp],al
003E  31 C0                             xor             eax,eax
0040  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0044  83 F8 2B                          cmp             eax,0x0000002b
0047  74 05                             je              L$4
0049  83 F8 2D                          cmp             eax,0x0000002d
004C  75 01                             jne             L$5
004E                            L$4:
004E  43                                inc             ebx
004F                            L$5:
004F  85 FF                             test            edi,edi
0051  75 34                             jne             L$9
0053  31 C0                             xor             eax,eax
0055  8A 03                             mov             al,byte ptr [ebx]
0057  83 F8 30                          cmp             eax,0x00000030
005A  75 16                             jne             L$7
005C  31 C0                             xor             eax,eax
005E  8A 43 01                          mov             al,byte ptr 0x1[ebx]
0061  83 F8 78                          cmp             eax,0x00000078
0064  74 05                             je              L$6
0066  83 F8 58                          cmp             eax,0x00000058
0069  75 07                             jne             L$7
006B                            L$6:
006B  BF 10 00 00 00                    mov             edi,0x00000010
0070  EB 15                             jmp             L$9
0072                            L$7:
0072  31 C0                             xor             eax,eax
0074  8A 03                             mov             al,byte ptr [ebx]
0076  83 F8 30                          cmp             eax,0x00000030
0079  75 07                             jne             L$8
007B  BF 08 00 00 00                    mov             edi,0x00000008
0080  EB 05                             jmp             L$9
0082                            L$8:
0082  BF 0A 00 00 00                    mov             edi,0x0000000a
0087                            L$9:
0087  83 FF 02                          cmp             edi,0x00000002
008A  7C 05                             jl              L$10
008C  83 FF 24                          cmp             edi,0x00000024
008F  7E 11                             jle             L$11
0091                            L$10:
0091  6A 0D                             push            0x0000000d
0093  E8 00 00 00 00                    call            __set_errno
0098  83 C4 04                          add             esp,0x00000004
009B  31 C0                             xor             eax,eax
009D  E9 DF 00 00 00                    jmp             L$26
00A2                            L$11:
00A2  83 FF 10                          cmp             edi,0x00000010
00A5  75 1B                             jne             L$13
00A7  31 C0                             xor             eax,eax
00A9  8A 03                             mov             al,byte ptr [ebx]
00AB  83 F8 30                          cmp             eax,0x00000030
00AE  75 12                             jne             L$13
00B0  31 C0                             xor             eax,eax
00B2  8A 43 01                          mov             al,byte ptr 0x1[ebx]
00B5  83 F8 78                          cmp             eax,0x00000078
00B8  74 05                             je              L$12
00BA  83 F8 58                          cmp             eax,0x00000058
00BD  75 03                             jne             L$13
00BF                            L$12:
00BF  83 C3 02                          add             ebx,0x00000002
00C2                            L$13:
00C2  89 1C 24                          mov             dword ptr [esp],ebx
00C5  89 FD                             mov             ebp,edi
00C7  30 E4                             xor             ah,ah
00C9  31 F6                             xor             esi,esi
00CB  88 64 24 08                       mov             byte ptr 0x8[esp],ah
00CF  C1 E5 02                          shl             ebp,0x02
00D2                            L$14:
00D2  31 C0                             xor             eax,eax
00D4  8A 03                             mov             al,byte ptr [ebx]
00D6  50                                push            eax
00D7  E8 00 00 00 00                    call            radix_value
00DC  83 C4 04                          add             esp,0x00000004
00DF  89 C2                             mov             edx,eax
00E1  39 F8                             cmp             eax,edi
00E3  7D 20                             jge             L$17
00E5  3B B5 F8 FF FF FF                 cmp             esi,dword ptr nearly_overflowing-0x8[ebp]
00EB  76 05                             jbe             L$15
00ED  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
00F2                            L$15:
00F2  89 F0                             mov             eax,esi
00F4  0F AF F7                          imul            esi,edi
00F7  01 D6                             add             esi,edx
00F9  39 C6                             cmp             esi,eax
00FB  73 05                             jae             L$16
00FD  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
0102                            L$16:
0102  43                                inc             ebx
0103  EB CD                             jmp             L$14
0105                            L$17:
0105  3B 1C 24                          cmp             ebx,dword ptr [esp]
0108  75 04                             jne             L$18
010A  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
010E                            L$18:
010E  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
0112  85 ED                             test            ebp,ebp
0114  74 03                             je              L$19
0116  89 5D 00                          mov             dword ptr [ebp],ebx
0119                            L$19:
0119  83 7C 24 2C 01                    cmp             dword ptr 0x2c[esp],0x00000001
011E  75 1A                             jne             L$21
0120  81 FE 00 00 00 80                 cmp             esi,0x80000000
0126  72 12                             jb              L$21
0128  75 0B                             jne             L$20
012A  31 C0                             xor             eax,eax
012C  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0130  83 F8 2D                          cmp             eax,0x0000002d
0133  74 05                             je              L$21
0135                            L$20:
0135  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
013A                            L$21:
013A  80 7C 24 08 00                    cmp             byte ptr 0x8[esp],0x00
013F  74 31                             je              L$24
0141  6A 0E                             push            0x0000000e
0143  E8 00 00 00 00                    call            __set_errno
0148  83 C4 04                          add             esp,0x00000004
014B  83 7C 24 2C 00                    cmp             dword ptr 0x2c[esp],0x00000000
0150  75 07                             jne             L$22
0152  B8 FF FF FF FF                    mov             eax,0xffffffff
0157  EB 28                             jmp             L$26
0159                            L$22:
0159  31 C0                             xor             eax,eax
015B  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
015F  83 F8 2D                          cmp             eax,0x0000002d
0162  75 07                             jne             L$23
0164  B8 00 00 00 80                    mov             eax,0x80000000
0169  EB 16                             jmp             L$26
016B                            L$23:
016B  B8 FF FF FF 7F                    mov             eax,0x7fffffff
0170  EB 0F                             jmp             L$26
0172                            L$24:
0172  31 C0                             xor             eax,eax
0174  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0178  83 F8 2D                          cmp             eax,0x0000002d
017B  75 02                             jne             L$25
017D  F7 DE                             neg             esi
017F                            L$25:
017F  89 F0                             mov             eax,esi
0181                            L$26:
0181  83 C4 0C                          add             esp,0x0000000c
0184  5D                                pop             ebp
0185  5F                                pop             edi
0186  5E                                pop             esi
0187  5B                                pop             ebx
0188  C3                                ret

Routine Size: 393 bytes,    Routine Base: _TEXT + 0000

0189                            strtoul:
0189  53                                push            ebx
018A  6A 00                             push            0x00000000
018C                            L$27:
018C  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0190  52                                push            edx
0191  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0195  53                                push            ebx
0196  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
019A  51                                push            ecx
019B  E8 00 00 00 00                    call            _stol
01A0  83 C4 10                          add             esp,0x00000010
01A3  5B                                pop             ebx
01A4  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 0189

01A5                            strtol:
01A5  53                                push            ebx
01A6  6A 01                             push            0x00000001
01A8  EB E2                             jmp             L$27
01AA                            radix_value:
01AA  8A 54 24 04                       mov             dl,byte ptr 0x4[esp]
01AE  31 C0                             xor             eax,eax
01B0  88 D0                             mov             al,dl
01B2  83 F8 30                          cmp             eax,0x00000030
01B5  7C 09                             jl              L$28
01B7  83 F8 39                          cmp             eax,0x00000039
01BA  7F 04                             jg              L$28
01BC  83 E8 30                          sub             eax,0x00000030
01BF  C3                                ret
01C0                            L$28:
01C0  31 C0                             xor             eax,eax
01C2  88 D0                             mov             al,dl
01C4  50                                push            eax
01C5  E8 00 00 00 00                    call            tolower
01CA  83 C4 04                          add             esp,0x00000004
01CD  88 C2                             mov             dl,al
01CF  25 FF 00 00 00                    and             eax,0x000000ff
01D4  83 F8 61                          cmp             eax,0x00000061
01D7  7C 09                             jl              L$30
01D9  83 F8 69                          cmp             eax,0x00000069
01DC  7F 04                             jg              L$30
01DE                            L$29:
01DE  83 E8 57                          sub             eax,0x00000057
01E1  C3                                ret
01E2                            L$30:
01E2  31 C0                             xor             eax,eax
01E4  88 D0                             mov             al,dl
01E6  83 F8 6A                          cmp             eax,0x0000006a
01E9  7C 05                             jl              L$31
01EB  83 F8 72                          cmp             eax,0x00000072
01EE  7E EE                             jle             L$29
01F0                            L$31:
01F0  31 C0                             xor             eax,eax
01F2  88 D0                             mov             al,dl
01F4  83 F8 73                          cmp             eax,0x00000073
01F7  7C 05                             jl              L$32
01F9  83 F8 7A                          cmp             eax,0x0000007a
01FC  7E E0                             jle             L$29
01FE                            L$32:
01FE  B8 25 00 00 00                    mov             eax,0x00000025
0203  C3                                ret

Routine Size: 95 bytes,    Routine Base: _TEXT + 01A5

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000008C bytes
0000                            nearly_overflowing:
0000  FF FF FF 7F 55 55 55 55 FF FF FF 3F 33 33 33 33 ....UUUU...?3333
0010  AA AA AA 2A 24 49 92 24 FF FF FF 1F 1C C7 71 1C ...*$I.$......q.
0020  99 99 99 19 74 D1 45 17 55 55 55 15 13 3B B1 13 ....t.E.UUU..;..
0030  92 24 49 12 11 11 11 11 FF FF FF 0F 0F 0F 0F 0F .$I.............
0040  8E E3 38 0E 5E 43 79 0D CC CC CC 0C 0C C3 30 0C ..8.^Cy.......0.
0050  BA E8 A2 0B 2C 64 21 0B AA AA AA 0A A3 70 3D 0A ....,d!......p=.
0060  89 9D D8 09 5E 42 7B 09 49 92 24 09 B0 DC D3 08 ....^B{.I.$.....
0070  88 88 88 08 84 10 42 08 FF FF FF 07 7C F0 C1 07 ......B.....|...
0080  87 87 87 07 07 75 50 07 C7 71 1C 07             .....uP..q..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

