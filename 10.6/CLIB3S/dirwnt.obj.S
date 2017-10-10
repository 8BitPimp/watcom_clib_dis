Module: dirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000273 bytes
0000                            is_directory:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  80 38 00                          cmp             byte ptr [eax],0x00
0007  74 25                             je              L$4
0009                            L$1:
0009  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
000D  74 03                             je              L$2
000F  40                                inc             eax
0010  EB F7                             jmp             L$1
0012                            L$2:
0012  8A 00                             mov             al,byte ptr [eax]
0014  25 FF 00 00 00                    and             eax,0x000000ff
0019  83 F8 5C                          cmp             eax,0x0000005c
001C  74 0A                             je              L$3
001E  83 F8 2F                          cmp             eax,0x0000002f
0021  74 05                             je              L$3
0023  83 F8 2E                          cmp             eax,0x0000002e
0026  75 06                             jne             L$4
0028                            L$3:
0028  B8 01 00 00 00                    mov             eax,0x00000001
002D  C3                                ret
002E                            L$4:
002E  31 C0                             xor             eax,eax
0030  C3                                ret

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

0031                            __opendir:
0031  53                                push            ebx
0032  56                                push            esi
0033  81 EC 40 01 00 00                 sub             esp,0x00000140
0039  8B 9C 24 54 01 00 00              mov             ebx,dword ptr 0x154[esp]
0040  89 E0                             mov             eax,esp
0042  50                                push            eax
0043  8B 94 24 50 01 00 00              mov             edx,dword ptr 0x150[esp]
004A  52                                push            edx
004B  E8 00 00 00 00                    call            _FindFirstFileA
0050  89 C6                             mov             esi,eax
0052  83 F8 FF                          cmp             eax,0xffffffff
0055  75 09                             jne             L$6
0057  E8 00 00 00 00                    call            __set_errno_nt
005C                            L$5:
005C  31 C0                             xor             eax,eax
005E  EB 45                             jmp             L$8
0060                            L$6:
0060  89 E0                             mov             eax,esp
0062  50                                push            eax
0063  8B 8C 24 54 01 00 00              mov             ecx,dword ptr 0x154[esp]
006A  51                                push            ecx
006B  56                                push            esi
006C  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
0071  83 C4 0C                          add             esp,0x0000000c
0074  85 C0                             test            eax,eax
0076  75 0C                             jne             L$7
0078  6A 02                             push            0x00000002
007A  E8 00 00 00 00                    call            __set_errno_dos
007F  83 C4 04                          add             esp,0x00000004
0082  EB D8                             jmp             L$5
0084                            L$7:
0084  8B 84 24 50 01 00 00              mov             eax,dword ptr 0x150[esp]
008B  89 43 04                          mov             dword ptr 0x4[ebx],eax
008E  89 E0                             mov             eax,esp
0090  50                                push            eax
0091  53                                push            ebx
0092  89 33                             mov             dword ptr [ebx],esi
0094  E8 00 00 00 00                    call            __GetNTDirInfo
0099  83 C4 08                          add             esp,0x00000008
009C  89 D8                             mov             eax,ebx
009E  C6 83 20 01 00 00 01              mov             byte ptr 0x120[ebx],0x01
00A5                            L$8:
00A5  81 C4 40 01 00 00                 add             esp,0x00000140
00AB  5E                                pop             esi
00AC  5B                                pop             ebx
00AD  C3                                ret

Routine Size: 125 bytes,    Routine Base: _TEXT + 0031

00AE                            _opendir:
00AE  53                                push            ebx
00AF  56                                push            esi
00B0  57                                push            edi
00B1  81 EC 0C 01 00 00                 sub             esp,0x0000010c
00B7  8B 9C 24 1C 01 00 00              mov             ebx,dword ptr 0x11c[esp]
00BE  68 21 01 00 00                    push            0x00000121
00C3  E8 00 00 00 00                    call            malloc
00C8  89 C6                             mov             esi,eax
00CA  83 C4 04                          add             esp,0x00000004
00CD  89 C7                             mov             edi,eax
00CF  C7 00 00 00 00 00                 mov             dword ptr [eax],0x00000000
00D5  53                                push            ebx
00D6  C6 40 15 10                       mov             byte ptr 0x15[eax],0x10
00DA  E8 00 00 00 00                    call            is_directory
00DF  83 C4 04                          add             esp,0x00000004
00E2  85 C0                             test            eax,eax
00E4  75 26                             jne             L$10
00E6  56                                push            esi
00E7  8B 94 24 24 01 00 00              mov             edx,dword ptr 0x124[esp]
00EE  52                                push            edx
00EF  53                                push            ebx
00F0  E8 00 00 00 00                    call            __opendir
00F5  83 C4 0C                          add             esp,0x0000000c
00F8  85 C0                             test            eax,eax
00FA  75 14                             jne             L$11
00FC  56                                push            esi
00FD                            L$9:
00FD  E8 00 00 00 00                    call            free
0102  83 C4 04                          add             esp,0x00000004
0105  31 C0                             xor             eax,eax
0107  E9 84 00 00 00                    jmp             L$17
010C                            L$10:
010C  C6 46 15 10                       mov             byte ptr 0x15[esi],0x10
0110                            L$11:
0110  8A 47 15                          mov             al,byte ptr 0x15[edi]
0113  24 10                             and             al,0x10
0115  25 FF 00 00 00                    and             eax,0x000000ff
011A  0F 84 6E 00 00 00                 je              L$16
0120  31 C0                             xor             eax,eax
0122                            L$12:
0122  8A 13                             mov             dl,byte ptr [ebx]
0124  88 14 04                          mov             byte ptr [esp+eax],dl
0127  84 D2                             test            dl,dl
0129  75 4C                             jne             L$15
012B  85 C0                             test            eax,eax
012D  74 16                             je              L$13
012F  31 D2                             xor             edx,edx
0131  8A 54 04 FF                       mov             dl,byte ptr -0x1[esp+eax]
0135  83 FA 5C                          cmp             edx,0x0000005c
0138  74 0B                             je              L$13
013A  83 FA 2F                          cmp             edx,0x0000002f
013D  74 06                             je              L$13
013F  40                                inc             eax
0140  C6 44 04 FF 5C                    mov             byte ptr -0x1[esp+eax],0x5c
0145                            L$13:
0145  8B 15 00 00 00 00                 mov             edx,dword ptr DGROUP:L$26
014B  89 14 04                          mov             dword ptr [esp+eax],edx
014E  8B 1F                             mov             ebx,dword ptr [edi]
0150  85 DB                             test            ebx,ebx
0152  74 06                             je              L$14
0154  53                                push            ebx
0155  E8 00 00 00 00                    call            _FindClose
015A                            L$14:
015A  57                                push            edi
015B  8B B4 24 24 01 00 00              mov             esi,dword ptr 0x124[esp]
0162  56                                push            esi
0163  8D 44 24 08                       lea             eax,0x8[esp]
0167  50                                push            eax
0168  E8 00 00 00 00                    call            __opendir
016D  83 C4 0C                          add             esp,0x0000000c
0170  85 C0                             test            eax,eax
0172  75 1A                             jne             L$16
0174  57                                push            edi
0175  EB 86                             jmp             L$9
0177                            L$15:
0177  31 D2                             xor             edx,edx
0179  8A 13                             mov             dl,byte ptr [ebx]
017B  83 FA 2A                          cmp             edx,0x0000002a
017E  74 0E                             je              L$16
0180  83 FA 3F                          cmp             edx,0x0000003f
0183  74 09                             je              L$16
0185  40                                inc             eax
0186  43                                inc             ebx
0187  3D 04 01 00 00                    cmp             eax,0x00000104
018C  7C 94                             jl              L$12
018E                            L$16:
018E  89 F8                             mov             eax,edi
0190                            L$17:
0190  81 C4 0C 01 00 00                 add             esp,0x0000010c
0196  5F                                pop             edi
0197  5E                                pop             esi
0198  5B                                pop             ebx
0199  C3                                ret

Routine Size: 236 bytes,    Routine Base: _TEXT + 00AE

019A                            opendir:
019A  6A F7                             push            0xfffffff7
019C  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
01A0  52                                push            edx
01A1  E8 00 00 00 00                    call            _opendir
01A6  83 C4 08                          add             esp,0x00000008
01A9  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 019A

01AA                            readdir:
01AA  53                                push            ebx
01AB  56                                push            esi
01AC  81 EC 40 01 00 00                 sub             esp,0x00000140
01B2  8B 9C 24 4C 01 00 00              mov             ebx,dword ptr 0x14c[esp]
01B9  85 DB                             test            ebx,ebx
01BB  74 39                             je              L$20
01BD  80 BB 20 01 00 00 00              cmp             byte ptr 0x120[ebx],0x00
01C4  74 0E                             je              L$18
01C6  89 D8                             mov             eax,ebx
01C8  C6 83 20 01 00 00 00              mov             byte ptr 0x120[ebx],0x00
01CF  E9 D1 FE FF FF                    jmp             L$8
01D4                            L$18:
01D4  89 E0                             mov             eax,esp
01D6  50                                push            eax
01D7  8B 13                             mov             edx,dword ptr [ebx]
01D9  52                                push            edx
01DA  E8 00 00 00 00                    call            _FindNextFileA
01DF  85 C0                             test            eax,eax
01E1  75 1A                             jne             L$21
01E3  E8 00 00 00 00                    call            _GetLastError
01E8  83 F8 12                          cmp             eax,0x00000012
01EB  74 09                             je              L$20
01ED  50                                push            eax
01EE                            L$19:
01EE  E8 00 00 00 00                    call            __set_errno_dos
01F3  83 C4 04                          add             esp,0x00000004
01F6                            L$20:
01F6  31 C0                             xor             eax,eax
01F8  E9 A8 FE FF FF                    jmp             L$8
01FD                            L$21:
01FD  89 E0                             mov             eax,esp
01FF  50                                push            eax
0200  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
0203  51                                push            ecx
0204  8B 33                             mov             esi,dword ptr [ebx]
0206  56                                push            esi
0207  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
020C  83 C4 0C                          add             esp,0x0000000c
020F  85 C0                             test            eax,eax
0211  75 04                             jne             L$22
0213  6A 12                             push            0x00000012
0215  EB D7                             jmp             L$19
0217                            L$22:
0217  89 E0                             mov             eax,esp
0219  50                                push            eax
021A  53                                push            ebx
021B  E8 00 00 00 00                    call            __GetNTDirInfo
0220  83 C4 08                          add             esp,0x00000008
0223  89 D8                             mov             eax,ebx
0225  E9 7B FE FF FF                    jmp             L$8

Routine Size: 128 bytes,    Routine Base: _TEXT + 01AA

022A                            closedir:
022A  53                                push            ebx
022B  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
022F  85 DB                             test            ebx,ebx
0231  74 0D                             je              L$23
0233  31 C0                             xor             eax,eax
0235  8A 83 20 01 00 00                 mov             al,byte ptr 0x120[ebx]
023B  83 F8 01                          cmp             eax,0x00000001
023E  7E 0C                             jle             L$24
0240                            L$23:
0240  6A 06                             push            0x00000006
0242  E8 00 00 00 00                    call            __set_errno_dos
0247  83 C4 04                          add             esp,0x00000004
024A  5B                                pop             ebx
024B  C3                                ret
024C                            L$24:
024C  8B 13                             mov             edx,dword ptr [ebx]
024E  52                                push            edx
024F  E8 00 00 00 00                    call            _FindClose
0254  85 C0                             test            eax,eax
0256  75 07                             jne             L$25
0258  E8 00 00 00 00                    call            __set_errno_nt
025D  5B                                pop             ebx
025E  C3                                ret
025F                            L$25:
025F  53                                push            ebx
0260  C6 83 20 01 00 00 02              mov             byte ptr 0x120[ebx],0x02
0267  E8 00 00 00 00                    call            free
026C  83 C4 04                          add             esp,0x00000004
026F  31 C0                             xor             eax,eax
0271  5B                                pop             ebx
0272  C3                                ret

Routine Size: 73 bytes,    Routine Base: _TEXT + 022A

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$26:
0000  2A 2E 2A 00                                     *.*.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

