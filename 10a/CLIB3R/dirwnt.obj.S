Module: dirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000207 bytes
0000                            root_directory_:
0000  80 38 5C                          cmp             byte ptr [eax],0x5c
0003  75 06                             jne             L$1
0005  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
0009  74 17                             je              L$2
000B                            L$1:
000B  80 38 00                          cmp             byte ptr [eax],0x00
000E  74 18                             je              L$3
0010  80 78 01 3A                       cmp             byte ptr 0x1[eax],0x3a
0014  75 12                             jne             L$3
0016  80 78 02 5C                       cmp             byte ptr 0x2[eax],0x5c
001A  75 0C                             jne             L$3
001C  80 78 03 00                       cmp             byte ptr 0x3[eax],0x00
0020  75 06                             jne             L$3
0022                            L$2:
0022  B8 01 00 00 00                    mov             eax,0x00000001
0027  C3                                ret
0028                            L$3:
0028  31 C0                             xor             eax,eax
002A  C3                                ret

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

002B                            __opendir_:
002B  51                                push            ecx
002C  56                                push            esi
002D  57                                push            edi
002E  81 EC 40 01 00 00                 sub             esp,0x00000140
0034  89 D7                             mov             edi,edx
0036  89 DE                             mov             esi,ebx
0038  89 E2                             mov             edx,esp
003A  52                                push            edx
003B  50                                push            eax
003C  E8 00 00 00 00                    call            _FindFirstFileA
0041  89 C1                             mov             ecx,eax
0043  83 F8 FF                          cmp             eax,0xffffffff
0046  75 09                             jne             L$5
0048  E8 00 00 00 00                    call            __set_errno_nt_
004D                            L$4:
004D  31 C0                             xor             eax,eax
004F  EB 30                             jmp             L$7
0051                            L$5:
0051  89 E3                             mov             ebx,esp
0053  89 FA                             mov             edx,edi
0055  E8 00 00 00 00                    call            __NTFindNextFileWithAttr_
005A  85 C0                             test            eax,eax
005C  75 0C                             jne             L$6
005E  B8 02 00 00 00                    mov             eax,0x00000002
0063  E8 00 00 00 00                    call            __set_errno_dos_
0068  EB E3                             jmp             L$4
006A                            L$6:
006A  89 E2                             mov             edx,esp
006C  89 0E                             mov             dword ptr [esi],ecx
006E  89 F0                             mov             eax,esi
0070  89 7E 04                          mov             dword ptr 0x4[esi],edi
0073  E8 00 00 00 00                    call            __GetNTDirInfo_
0078  89 F0                             mov             eax,esi
007A  C6 86 20 01 00 00 01              mov             byte ptr 0x120[esi],0x01
0081                            L$7:
0081  81 C4 40 01 00 00                 add             esp,0x00000140
0087  5F                                pop             edi
0088  5E                                pop             esi
0089  59                                pop             ecx
008A  C3                                ret

Routine Size: 96 bytes,    Routine Base: _TEXT + 002B

008B                            _opendir_:
008B  53                                push            ebx
008C  51                                push            ecx
008D  56                                push            esi
008E  57                                push            edi
008F  55                                push            ebp
0090  81 EC 0C 01 00 00                 sub             esp,0x0000010c
0096  89 C1                             mov             ecx,eax
0098  89 D5                             mov             ebp,edx
009A  B8 21 01 00 00                    mov             eax,0x00000121
009F  E8 00 00 00 00                    call            malloc_
00A4  89 C7                             mov             edi,eax
00A6  89 C6                             mov             esi,eax
00A8  85 C0                             test            eax,eax
00AA  75 0C                             jne             L$8
00AC  B8 08 00 00 00                    mov             eax,0x00000008
00B1  E8 00 00 00 00                    call            __set_errno_dos_
00B6  EB 23                             jmp             L$10
00B8                            L$8:
00B8  C6 40 15 10                       mov             byte ptr 0x15[eax],0x10
00BC  89 C8                             mov             eax,ecx
00BE  E8 00 00 00 00                    call            root_directory_
00C3  85 C0                             test            eax,eax
00C5  75 18                             jne             L$11
00C7  89 C8                             mov             eax,ecx
00C9  89 FB                             mov             ebx,edi
00CB  E8 00 00 00 00                    call            __opendir_
00D0  85 C0                             test            eax,eax
00D2  75 0B                             jne             L$11
00D4  89 F8                             mov             eax,edi
00D6                            L$9:
00D6  E8 00 00 00 00                    call            free_
00DB                            L$10:
00DB  31 C0                             xor             eax,eax
00DD  EB 53                             jmp             L$16
00DF                            L$11:
00DF  F6 46 15 10                       test            byte ptr 0x15[esi],0x10
00E3  74 4B                             je              L$15
00E5  31 C0                             xor             eax,eax
00E7                            L$12:
00E7  8A 11                             mov             dl,byte ptr [ecx]
00E9  88 14 04                          mov             byte ptr [esp+eax],dl
00EC  84 D2                             test            dl,dl
00EE  75 2D                             jne             L$14
00F0  85 C0                             test            eax,eax
00F2  74 0D                             je              L$13
00F4  80 7C 04 FF 5C                    cmp             byte ptr -0x1[esp+eax],0x5c
00F9  74 06                             je              L$13
00FB  40                                inc             eax
00FC  C6 44 04 FF 5C                    mov             byte ptr -0x1[esp+eax],0x5c
0101                            L$13:
0101  8B 0D 00 00 00 00                 mov             ecx,dword ptr DGROUP:L$26
0107  89 EA                             mov             edx,ebp
0109  89 F3                             mov             ebx,esi
010B  89 0C 04                          mov             dword ptr [esp+eax],ecx
010E  89 E0                             mov             eax,esp
0110  E8 00 00 00 00                    call            __opendir_
0115  85 C0                             test            eax,eax
0117  75 17                             jne             L$15
0119  89 F0                             mov             eax,esi
011B  EB B9                             jmp             L$9
011D                            L$14:
011D  80 FA 2A                          cmp             dl,0x2a
0120  74 0E                             je              L$15
0122  80 FA 3F                          cmp             dl,0x3f
0125  74 09                             je              L$15
0127  40                                inc             eax
0128  41                                inc             ecx
0129  3D 04 01 00 00                    cmp             eax,0x00000104
012E  7C B7                             jl              L$12
0130                            L$15:
0130  89 F0                             mov             eax,esi
0132                            L$16:
0132  81 C4 0C 01 00 00                 add             esp,0x0000010c
0138  5D                                pop             ebp
0139  5F                                pop             edi
013A  5E                                pop             esi
013B  59                                pop             ecx
013C  5B                                pop             ebx
013D  C3                                ret

Routine Size: 179 bytes,    Routine Base: _TEXT + 008B

013E                            opendir_:
013E  52                                push            edx
013F  BA 37 00 00 00                    mov             edx,0x00000037
0144  E8 00 00 00 00                    call            _opendir_
0149  5A                                pop             edx
014A  C3                                ret

Routine Size: 13 bytes,    Routine Base: _TEXT + 013E

014B                            readdir_:
014B  53                                push            ebx
014C  51                                push            ecx
014D  52                                push            edx
014E  56                                push            esi
014F  81 EC 40 01 00 00                 sub             esp,0x00000140
0155  89 C6                             mov             esi,eax
0157  85 C0                             test            eax,eax
0159  74 58                             je              L$22
015B  80 B8 20 01 00 00 00              cmp             byte ptr 0x120[eax],0x00
0162  74 0B                             je              L$17
0164  89 F0                             mov             eax,esi
0166  C6 86 20 01 00 00 00              mov             byte ptr 0x120[esi],0x00
016D  EB 44                             jmp             L$22
016F                            L$17:
016F  89 E0                             mov             eax,esp
0171  50                                push            eax
0172  8B 16                             mov             edx,dword ptr [esi]
0174  52                                push            edx
0175  E8 00 00 00 00                    call            _FindNextFileA
017A  85 C0                             test            eax,eax
017C  75 13                             jne             L$20
017E  E8 00 00 00 00                    call            _GetLastError
0183  83 F8 12                          cmp             eax,0x00000012
0186  74 05                             je              L$19
0188                            L$18:
0188  E8 00 00 00 00                    call            __set_errno_dos_
018D                            L$19:
018D  31 C0                             xor             eax,eax
018F  EB 22                             jmp             L$22
0191                            L$20:
0191  89 E3                             mov             ebx,esp
0193  8B 56 04                          mov             edx,dword ptr 0x4[esi]
0196  8B 06                             mov             eax,dword ptr [esi]
0198  E8 00 00 00 00                    call            __NTFindNextFileWithAttr_
019D  85 C0                             test            eax,eax
019F  75 07                             jne             L$21
01A1  B8 12 00 00 00                    mov             eax,0x00000012
01A6  EB E0                             jmp             L$18
01A8                            L$21:
01A8  89 E2                             mov             edx,esp
01AA  89 F0                             mov             eax,esi
01AC  E8 00 00 00 00                    call            __GetNTDirInfo_
01B1  89 F0                             mov             eax,esi
01B3                            L$22:
01B3  81 C4 40 01 00 00                 add             esp,0x00000140
01B9  5E                                pop             esi
01BA  5A                                pop             edx
01BB  59                                pop             ecx
01BC  5B                                pop             ebx
01BD  C3                                ret

Routine Size: 115 bytes,    Routine Base: _TEXT + 014B

01BE                            closedir_:
01BE  53                                push            ebx
01BF  51                                push            ecx
01C0  52                                push            edx
01C1  89 C3                             mov             ebx,eax
01C3  85 C0                             test            eax,eax
01C5  74 09                             je              L$23
01C7  80 B8 20 01 00 00 01              cmp             byte ptr 0x120[eax],0x01
01CE  76 0E                             jbe             L$24
01D0                            L$23:
01D0  B8 06 00 00 00                    mov             eax,0x00000006
01D5  E8 00 00 00 00                    call            __set_errno_dos_
01DA  5A                                pop             edx
01DB  59                                pop             ecx
01DC  5B                                pop             ebx
01DD  C3                                ret
01DE                            L$24:
01DE  8B 13                             mov             edx,dword ptr [ebx]
01E0  52                                push            edx
01E1  E8 00 00 00 00                    call            _FindClose
01E6  85 C0                             test            eax,eax
01E8  75 09                             jne             L$25
01EA  E8 00 00 00 00                    call            __set_errno_nt_
01EF  5A                                pop             edx
01F0  59                                pop             ecx
01F1  5B                                pop             ebx
01F2  C3                                ret
01F3                            L$25:
01F3  89 D8                             mov             eax,ebx
01F5  C6 83 20 01 00 00 02              mov             byte ptr 0x120[ebx],0x02
01FC  E8 00 00 00 00                    call            free_
0201  31 C0                             xor             eax,eax
0203  5A                                pop             edx
0204  59                                pop             ecx
0205  5B                                pop             ebx
0206  C3                                ret

Routine Size: 73 bytes,    Routine Base: _TEXT + 01BE

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$26:
0000  2A 2E 2A 00                                     *.*.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

