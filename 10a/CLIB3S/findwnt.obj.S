Module: findwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D3 bytes
0000                            _dos_findfirst:
0000  53                                push            ebx
0001  56                                push            esi
0002  81 EC 40 01 00 00                 sub             esp,0x00000140
0008  8B B4 24 54 01 00 00              mov             esi,dword ptr 0x154[esp]
000F  89 E0                             mov             eax,esp
0011  50                                push            eax
0012  8B 94 24 50 01 00 00              mov             edx,dword ptr 0x150[esp]
0019  52                                push            edx
001A  E8 00 00 00 00                    call            _FindFirstFileA
001F  89 C3                             mov             ebx,eax
0021  83 F8 FF                          cmp             eax,0xffffffff
0024  75 09                             jne             L$1
0026  89 06                             mov             dword ptr [esi],eax
0028  E8 00 00 00 00                    call            __set_errno_nt
002D  EB 3E                             jmp             L$4
002F                            L$1:
002F  89 E0                             mov             eax,esp
0031  50                                push            eax
0032  8B 8C 24 54 01 00 00              mov             ecx,dword ptr 0x154[esp]
0039  51                                push            ecx
003A  53                                push            ebx
003B  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
0040  83 C4 0C                          add             esp,0x0000000c
0043  85 C0                             test            eax,eax
0045  75 0C                             jne             L$2
0047  6A 02                             push            0x00000002
0049  E8 00 00 00 00                    call            __set_errno_dos
004E  83 C4 04                          add             esp,0x00000004
0051  EB 1A                             jmp             L$4
0053                            L$2:
0053  8B 84 24 50 01 00 00              mov             eax,dword ptr 0x150[esp]
005A  89 46 04                          mov             dword ptr 0x4[esi],eax
005D  89 E0                             mov             eax,esp
005F  50                                push            eax
0060  56                                push            esi
0061  89 1E                             mov             dword ptr [esi],ebx
0063                            L$3:
0063  E8 00 00 00 00                    call            __GetNTDirInfo
0068  83 C4 08                          add             esp,0x00000008
006B  31 C0                             xor             eax,eax
006D                            L$4:
006D  81 C4 40 01 00 00                 add             esp,0x00000140
0073  5E                                pop             esi
0074  5B                                pop             ebx
0075  C3                                ret

Routine Size: 118 bytes,    Routine Base: _TEXT + 0000

0076                            _dos_findnext:
0076  53                                push            ebx
0077  56                                push            esi
0078  81 EC 40 01 00 00                 sub             esp,0x00000140
007E  8B 9C 24 4C 01 00 00              mov             ebx,dword ptr 0x14c[esp]
0085  89 E0                             mov             eax,esp
0087  50                                push            eax
0088  8B 13                             mov             edx,dword ptr [ebx]
008A  52                                push            edx
008B  E8 00 00 00 00                    call            _FindNextFileA
0090  85 C0                             test            eax,eax
0092  75 07                             jne             L$6
0094                            L$5:
0094  E8 00 00 00 00                    call            __set_errno_nt
0099  EB D2                             jmp             L$4
009B                            L$6:
009B  89 E0                             mov             eax,esp
009D  50                                push            eax
009E  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
00A1  51                                push            ecx
00A2  8B 33                             mov             esi,dword ptr [ebx]
00A4  56                                push            esi
00A5  E8 00 00 00 00                    call            __NTFindNextFileWithAttr
00AA  83 C4 0C                          add             esp,0x0000000c
00AD  85 C0                             test            eax,eax
00AF  74 E3                             je              L$5
00B1  89 E0                             mov             eax,esp
00B3  50                                push            eax
00B4  53                                push            ebx
00B5  EB AC                             jmp             L$3

Routine Size: 65 bytes,    Routine Base: _TEXT + 0076

00B7                            _dos_findclose:
00B7  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00BB  8B 10                             mov             edx,dword ptr [eax]
00BD  83 FA FF                          cmp             edx,0xffffffff
00C0  74 0E                             je              L$7
00C2  52                                push            edx
00C3  E8 00 00 00 00                    call            _FindClose
00C8  85 C0                             test            eax,eax
00CA  0F 84 00 00 00 00                 je              __set_errno_nt
00D0                            L$7:
00D0  31 C0                             xor             eax,eax
00D2  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 00B7

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

