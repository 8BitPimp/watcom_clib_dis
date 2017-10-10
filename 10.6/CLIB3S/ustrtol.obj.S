Module: ustrtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000213 bytes
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
001D  31 C0                             xor             eax,eax
001F  66 8B 03                          mov             ax,word ptr [ebx]
0022  50                                push            eax
0023  E8 00 00 00 00                    call            _uisspace
0028  83 C4 04                          add             esp,0x00000004
002B  85 C0                             test            eax,eax
002D  74 05                             je              L$3
002F  83 C3 02                          add             ebx,0x00000002
0032  EB E9                             jmp             L$2
0034                            L$3:
0034  66 8B 03                          mov             ax,word ptr [ebx]
0037  89 44 24 04                       mov             dword ptr 0x4[esp],eax
003B  31 C0                             xor             eax,eax
003D  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0042  83 F8 2B                          cmp             eax,0x0000002b
0045  74 05                             je              L$4
0047  83 F8 2D                          cmp             eax,0x0000002d
004A  75 03                             jne             L$5
004C                            L$4:
004C  83 C3 02                          add             ebx,0x00000002
004F                            L$5:
004F  85 FF                             test            edi,edi
0051  75 37                             jne             L$9
0053  31 C0                             xor             eax,eax
0055  66 8B 03                          mov             ax,word ptr [ebx]
0058  83 F8 30                          cmp             eax,0x00000030
005B  75 17                             jne             L$7
005D  31 C0                             xor             eax,eax
005F  66 8B 43 02                       mov             ax,word ptr 0x2[ebx]
0063  83 F8 78                          cmp             eax,0x00000078
0066  74 05                             je              L$6
0068  83 F8 58                          cmp             eax,0x00000058
006B  75 07                             jne             L$7
006D                            L$6:
006D  BF 10 00 00 00                    mov             edi,0x00000010
0072  EB 16                             jmp             L$9
0074                            L$7:
0074  31 C0                             xor             eax,eax
0076  66 8B 03                          mov             ax,word ptr [ebx]
0079  83 F8 30                          cmp             eax,0x00000030
007C  75 07                             jne             L$8
007E  BF 08 00 00 00                    mov             edi,0x00000008
0083  EB 05                             jmp             L$9
0085                            L$8:
0085  BF 0A 00 00 00                    mov             edi,0x0000000a
008A                            L$9:
008A  83 FF 02                          cmp             edi,0x00000002
008D  7C 05                             jl              L$10
008F  83 FF 24                          cmp             edi,0x00000024
0092  7E 11                             jle             L$11
0094                            L$10:
0094  6A 0D                             push            0x0000000d
0096  E8 00 00 00 00                    call            __set_errno
009B  83 C4 04                          add             esp,0x00000004
009E  31 C0                             xor             eax,eax
00A0  E9 E7 00 00 00                    jmp             L$26
00A5                            L$11:
00A5  83 FF 10                          cmp             edi,0x00000010
00A8  75 1D                             jne             L$13
00AA  31 C0                             xor             eax,eax
00AC  66 8B 03                          mov             ax,word ptr [ebx]
00AF  83 F8 30                          cmp             eax,0x00000030
00B2  75 13                             jne             L$13
00B4  31 C0                             xor             eax,eax
00B6  66 8B 43 02                       mov             ax,word ptr 0x2[ebx]
00BA  83 F8 78                          cmp             eax,0x00000078
00BD  74 05                             je              L$12
00BF  83 F8 58                          cmp             eax,0x00000058
00C2  75 03                             jne             L$13
00C4                            L$12:
00C4  83 C3 04                          add             ebx,0x00000004
00C7                            L$13:
00C7  89 1C 24                          mov             dword ptr [esp],ebx
00CA  89 FD                             mov             ebp,edi
00CC  30 E4                             xor             ah,ah
00CE  31 F6                             xor             esi,esi
00D0  88 64 24 08                       mov             byte ptr 0x8[esp],ah
00D4  C1 E5 02                          shl             ebp,0x02
00D7                            L$14:
00D7  31 C0                             xor             eax,eax
00D9  66 8B 03                          mov             ax,word ptr [ebx]
00DC  50                                push            eax
00DD  E8 00 00 00 00                    call            radix_value
00E2  83 C4 04                          add             esp,0x00000004
00E5  89 C2                             mov             edx,eax
00E7  39 F8                             cmp             eax,edi
00E9  7D 22                             jge             L$17
00EB  3B B5 F8 FF FF FF                 cmp             esi,dword ptr nearly_overflowing-0x8[ebp]
00F1  76 05                             jbe             L$15
00F3  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
00F8                            L$15:
00F8  89 F0                             mov             eax,esi
00FA  0F AF F7                          imul            esi,edi
00FD  01 D6                             add             esi,edx
00FF  39 C6                             cmp             esi,eax
0101  73 05                             jae             L$16
0103  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
0108                            L$16:
0108  83 C3 02                          add             ebx,0x00000002
010B  EB CA                             jmp             L$14
010D                            L$17:
010D  3B 1C 24                          cmp             ebx,dword ptr [esp]
0110  75 04                             jne             L$18
0112  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0116                            L$18:
0116  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
011A  85 ED                             test            ebp,ebp
011C  74 03                             je              L$19
011E  89 5D 00                          mov             dword ptr [ebp],ebx
0121                            L$19:
0121  83 7C 24 2C 01                    cmp             dword ptr 0x2c[esp],0x00000001
0126  75 1B                             jne             L$21
0128  81 FE 00 00 00 80                 cmp             esi,0x80000000
012E  72 13                             jb              L$21
0130  75 0C                             jne             L$20
0132  31 C0                             xor             eax,eax
0134  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0139  83 F8 2D                          cmp             eax,0x0000002d
013C  74 05                             je              L$21
013E                            L$20:
013E  C6 44 24 08 01                    mov             byte ptr 0x8[esp],0x01
0143                            L$21:
0143  80 7C 24 08 00                    cmp             byte ptr 0x8[esp],0x00
0148  74 32                             je              L$24
014A  6A 0E                             push            0x0000000e
014C  E8 00 00 00 00                    call            __set_errno
0151  83 C4 04                          add             esp,0x00000004
0154  83 7C 24 2C 00                    cmp             dword ptr 0x2c[esp],0x00000000
0159  75 07                             jne             L$22
015B  B8 FF FF FF FF                    mov             eax,0xffffffff
0160  EB 2A                             jmp             L$26
0162                            L$22:
0162  31 C0                             xor             eax,eax
0164  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0169  83 F8 2D                          cmp             eax,0x0000002d
016C  75 07                             jne             L$23
016E  B8 00 00 00 80                    mov             eax,0x80000000
0173  EB 17                             jmp             L$26
0175                            L$23:
0175  B8 FF FF FF 7F                    mov             eax,0x7fffffff
017A  EB 10                             jmp             L$26
017C                            L$24:
017C  31 C0                             xor             eax,eax
017E  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0183  83 F8 2D                          cmp             eax,0x0000002d
0186  75 02                             jne             L$25
0188  F7 DE                             neg             esi
018A                            L$25:
018A  89 F0                             mov             eax,esi
018C                            L$26:
018C  83 C4 0C                          add             esp,0x0000000c
018F  5D                                pop             ebp
0190  5F                                pop             edi
0191  5E                                pop             esi
0192  5B                                pop             ebx
0193  C3                                ret

Routine Size: 404 bytes,    Routine Base: _TEXT + 0000

0194                            _ustrtoul:
0194  53                                push            ebx
0195  6A 00                             push            0x00000000
0197                            L$27:
0197  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
019B  52                                push            edx
019C  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
01A0  53                                push            ebx
01A1  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
01A5  51                                push            ecx
01A6  E8 00 00 00 00                    call            _stol
01AB  83 C4 10                          add             esp,0x00000010
01AE  5B                                pop             ebx
01AF  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 0194

01B0                            _ustrtol:
01B0  53                                push            ebx
01B1  6A 01                             push            0x00000001
01B3  EB E2                             jmp             L$27
01B5                            radix_value:
01B5  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
01B9  31 C0                             xor             eax,eax
01BB  66 89 D0                          mov             ax,dx
01BE  83 F8 30                          cmp             eax,0x00000030
01C1  7C 09                             jl              L$28
01C3  83 F8 39                          cmp             eax,0x00000039
01C6  7F 04                             jg              L$28
01C8  83 E8 30                          sub             eax,0x00000030
01CB  C3                                ret
01CC                            L$28:
01CC  31 C0                             xor             eax,eax
01CE  66 89 D0                          mov             ax,dx
01D1  50                                push            eax
01D2  E8 00 00 00 00                    call            _utolower
01D7  83 C4 04                          add             esp,0x00000004
01DA  89 C2                             mov             edx,eax
01DC  25 FF FF 00 00                    and             eax,0x0000ffff
01E1  83 F8 61                          cmp             eax,0x00000061
01E4  7C 09                             jl              L$30
01E6  83 F8 69                          cmp             eax,0x00000069
01E9  7F 04                             jg              L$30
01EB                            L$29:
01EB  83 E8 57                          sub             eax,0x00000057
01EE  C3                                ret
01EF                            L$30:
01EF  31 C0                             xor             eax,eax
01F1  66 89 D0                          mov             ax,dx
01F4  83 F8 6A                          cmp             eax,0x0000006a
01F7  7C 05                             jl              L$31
01F9  83 F8 72                          cmp             eax,0x00000072
01FC  7E ED                             jle             L$29
01FE                            L$31:
01FE  31 C0                             xor             eax,eax
0200  66 89 D0                          mov             ax,dx
0203  83 F8 73                          cmp             eax,0x00000073
0206  7C 05                             jl              L$32
0208  83 F8 7A                          cmp             eax,0x0000007a
020B  7E DE                             jle             L$29
020D                            L$32:
020D  B8 25 00 00 00                    mov             eax,0x00000025
0212  C3                                ret

Routine Size: 99 bytes,    Routine Base: _TEXT + 01B0

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

