Module: dirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000024E bytes
0000                            root_directory:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  80 38 5C                          cmp             byte ptr [eax],0x5c
0007  75 06                             jne             L$1
0009  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
000D  74 17                             je              L$2
000F                            L$1:
000F  80 38 00                          cmp             byte ptr [eax],0x00
0012  74 18                             je              L$3
0014  80 78 01 3A                       cmp             byte ptr 0x1[eax],0x3a
0018  75 12                             jne             L$3
001A  80 78 02 5C                       cmp             byte ptr 0x2[eax],0x5c
001E  75 0C                             jne             L$3
0020  80 78 03 00                       cmp             byte ptr 0x3[eax],0x00
0024  75 06                             jne             L$3
0026                            L$2:
0026  B8 01 00 00 00                    mov             eax,0x00000001
002B  C3                                ret
002C                            L$3:
002C  31 C0                             xor             eax,eax
002E  C3                                ret

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

002F                            __opendir:
002F  53                                push            ebx
0030  56                                push            esi
0031  81 EC 40 01 00 00                 sub             esp,0x00000140
0037  8B 9C 24 54 01 00 00              mov             ebx,dword ptr 0x154[esp]
003E  89 E0                             mov             eax,esp
0040  50                                push            eax
0041  8B 94 24 50 01 00 00              mov             edx,dword ptr 0x150[esp]
0048  52                                push            edx
0049  E8 00 00 00 00                    call            _FindFirstFileA
004E  89 C6                             mov             esi,eax
0050  83 F8 FF                          cmp             eax,0xffffffff
0053  75 09                             jne             L$5
0055  E8 00 00 00 00                    call            __set_errno_nt
005A                            L$4:
005A  31 C0                             xor             eax,eax
005C  EB 45                             jmp             L$7
005E                            L$5:
005E  89 E0                             mov             eax,esp
0060  50                                push            eax
0061  8B 8C 24 54 01 00 00              mov             ecx,dword ptr 0x154[esp]
0068  51                                push            ecx
0069  56                                push            esi
006A  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
006F  83 C4 0C                          add             esp,0x0000000c
0072  85 C0                             test            eax,eax
0074  75 0C                             jne             L$6
0076  6A 02                             push            0x00000002
0078  E8 00 00 00 00                    call            __set_errno_dos
007D  83 C4 04                          add             esp,0x00000004
0080  EB D8                             jmp             L$4
0082                            L$6:
0082  8B 84 24 50 01 00 00              mov             eax,dword ptr 0x150[esp]
0089  89 43 04                          mov             dword ptr 0x4[ebx],eax
008C  89 E0                             mov             eax,esp
008E  50                                push            eax
008F  53                                push            ebx
0090  89 33                             mov             dword ptr [ebx],esi
0092  E8 00 00 00 00                    call            __GetNTDirInfo
0097  83 C4 08                          add             esp,0x00000008
009A  89 D8                             mov             eax,ebx
009C  C6 83 20 01 00 00 01              mov             byte ptr 0x120[ebx],0x01
00A3                            L$7:
00A3  81 C4 40 01 00 00                 add             esp,0x00000140
00A9  5E                                pop             esi
00AA  5B                                pop             ebx
00AB  C3                                ret

Routine Size: 125 bytes,    Routine Base: _TEXT + 002F

00AC                            _opendir:
00AC  53                                push            ebx
00AD  56                                push            esi
00AE  57                                push            edi
00AF  81 EC 0C 01 00 00                 sub             esp,0x0000010c
00B5  8B 9C 24 1C 01 00 00              mov             ebx,dword ptr 0x11c[esp]
00BC  68 21 01 00 00                    push            0x00000121
00C1  E8 00 00 00 00                    call            malloc
00C6  89 C6                             mov             esi,eax
00C8  83 C4 04                          add             esp,0x00000004
00CB  89 C7                             mov             edi,eax
00CD  85 C0                             test            eax,eax
00CF  75 09                             jne             L$8
00D1  6A 08                             push            0x00000008
00D3  E8 00 00 00 00                    call            __set_errno_dos
00D8  EB 2D                             jmp             L$10
00DA                            L$8:
00DA  53                                push            ebx
00DB  C6 40 15 10                       mov             byte ptr 0x15[eax],0x10
00DF  E8 00 00 00 00                    call            root_directory
00E4  83 C4 04                          add             esp,0x00000004
00E7  85 C0                             test            eax,eax
00E9  75 26                             jne             L$11
00EB  56                                push            esi
00EC  8B 94 24 24 01 00 00              mov             edx,dword ptr 0x124[esp]
00F3  52                                push            edx
00F4  53                                push            ebx
00F5  E8 00 00 00 00                    call            __opendir
00FA  83 C4 0C                          add             esp,0x0000000c
00FD  85 C0                             test            eax,eax
00FF  75 10                             jne             L$11
0101  56                                push            esi
0102                            L$9:
0102  E8 00 00 00 00                    call            free
0107                            L$10:
0107  83 C4 04                          add             esp,0x00000004
010A  31 C0                             xor             eax,eax
010C  E9 5E 00 00 00                    jmp             L$16
0111                            L$11:
0111  F6 47 15 10                       test            byte ptr 0x15[edi],0x10
0115  74 56                             je              L$15
0117  31 C0                             xor             eax,eax
0119                            L$12:
0119  8A 13                             mov             dl,byte ptr [ebx]
011B  88 14 04                          mov             byte ptr [esp+eax],dl
011E  84 D2                             test            dl,dl
0120  75 38                             jne             L$14
0122  85 C0                             test            eax,eax
0124  74 0D                             je              L$13
0126  80 7C 04 FF 5C                    cmp             byte ptr -0x1[esp+eax],0x5c
012B  74 06                             je              L$13
012D  40                                inc             eax
012E  C6 44 04 FF 5C                    mov             byte ptr -0x1[esp+eax],0x5c
0133                            L$13:
0133  8B 1D 00 00 00 00                 mov             ebx,dword ptr DGROUP:L$25
0139  57                                push            edi
013A  89 5C 04 04                       mov             dword ptr 0x4[esp+eax],ebx
013E  8B 9C 24 24 01 00 00              mov             ebx,dword ptr 0x124[esp]
0145  53                                push            ebx
0146  8D 44 24 08                       lea             eax,0x8[esp]
014A  50                                push            eax
014B  E8 00 00 00 00                    call            __opendir
0150  83 C4 0C                          add             esp,0x0000000c
0153  85 C0                             test            eax,eax
0155  75 16                             jne             L$15
0157  57                                push            edi
0158  EB A8                             jmp             L$9
015A                            L$14:
015A  80 FA 2A                          cmp             dl,0x2a
015D  74 0E                             je              L$15
015F  80 FA 3F                          cmp             dl,0x3f
0162  74 09                             je              L$15
0164  40                                inc             eax
0165  43                                inc             ebx
0166  3D 04 01 00 00                    cmp             eax,0x00000104
016B  7C AC                             jl              L$12
016D                            L$15:
016D  89 F8                             mov             eax,edi
016F                            L$16:
016F  81 C4 0C 01 00 00                 add             esp,0x0000010c
0175  5F                                pop             edi
0176  5E                                pop             esi
0177  5B                                pop             ebx
0178  C3                                ret

Routine Size: 205 bytes,    Routine Base: _TEXT + 00AC

0179                            opendir:
0179  6A 37                             push            0x00000037
017B  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
017F  52                                push            edx
0180  E8 00 00 00 00                    call            _opendir
0185  83 C4 08                          add             esp,0x00000008
0188  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 0179

0189                            readdir:
0189  53                                push            ebx
018A  56                                push            esi
018B  81 EC 40 01 00 00                 sub             esp,0x00000140
0191  8B 9C 24 4C 01 00 00              mov             ebx,dword ptr 0x14c[esp]
0198  85 DB                             test            ebx,ebx
019A  74 39                             je              L$19
019C  80 BB 20 01 00 00 00              cmp             byte ptr 0x120[ebx],0x00
01A3  74 0E                             je              L$17
01A5  89 D8                             mov             eax,ebx
01A7  C6 83 20 01 00 00 00              mov             byte ptr 0x120[ebx],0x00
01AE  E9 F0 FE FF FF                    jmp             L$7
01B3                            L$17:
01B3  89 E0                             mov             eax,esp
01B5  50                                push            eax
01B6  8B 13                             mov             edx,dword ptr [ebx]
01B8  52                                push            edx
01B9  E8 00 00 00 00                    call            _FindNextFileA
01BE  85 C0                             test            eax,eax
01C0  75 1A                             jne             L$20
01C2  E8 00 00 00 00                    call            _GetLastError
01C7  83 F8 12                          cmp             eax,0x00000012
01CA  74 09                             je              L$19
01CC  50                                push            eax
01CD                            L$18:
01CD  E8 00 00 00 00                    call            __set_errno_dos
01D2  83 C4 04                          add             esp,0x00000004
01D5                            L$19:
01D5  31 C0                             xor             eax,eax
01D7  E9 C7 FE FF FF                    jmp             L$7
01DC                            L$20:
01DC  89 E0                             mov             eax,esp
01DE  50                                push            eax
01DF  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
01E2  51                                push            ecx
01E3  8B 33                             mov             esi,dword ptr [ebx]
01E5  56                                push            esi
01E6  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
01EB  83 C4 0C                          add             esp,0x0000000c
01EE  85 C0                             test            eax,eax
01F0  75 04                             jne             L$21
01F2  6A 12                             push            0x00000012
01F4  EB D7                             jmp             L$18
01F6                            L$21:
01F6  89 E0                             mov             eax,esp
01F8  50                                push            eax
01F9  53                                push            ebx
01FA  E8 00 00 00 00                    call            __GetNTDirInfo
01FF  83 C4 08                          add             esp,0x00000008
0202  89 D8                             mov             eax,ebx
0204  E9 9A FE FF FF                    jmp             L$7

Routine Size: 128 bytes,    Routine Base: _TEXT + 0189

0209                            closedir:
0209  53                                push            ebx
020A  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
020E  85 DB                             test            ebx,ebx
0210  74 09                             je              L$22
0212  80 BB 20 01 00 00 01              cmp             byte ptr 0x120[ebx],0x01
0219  76 0C                             jbe             L$23
021B                            L$22:
021B  6A 06                             push            0x00000006
021D  E8 00 00 00 00                    call            __set_errno_dos
0222  83 C4 04                          add             esp,0x00000004
0225  5B                                pop             ebx
0226  C3                                ret
0227                            L$23:
0227  8B 13                             mov             edx,dword ptr [ebx]
0229  52                                push            edx
022A  E8 00 00 00 00                    call            _FindClose
022F  85 C0                             test            eax,eax
0231  75 07                             jne             L$24
0233  E8 00 00 00 00                    call            __set_errno_nt
0238  5B                                pop             ebx
0239  C3                                ret
023A                            L$24:
023A  53                                push            ebx
023B  C6 83 20 01 00 00 02              mov             byte ptr 0x120[ebx],0x02
0242  E8 00 00 00 00                    call            free
0247  83 C4 04                          add             esp,0x00000004
024A  31 C0                             xor             eax,eax
024C  5B                                pop             ebx
024D  C3                                ret

Routine Size: 69 bytes,    Routine Base: _TEXT + 0209

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$25:
0000  2A 2E 2A 00                                     *.*.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

