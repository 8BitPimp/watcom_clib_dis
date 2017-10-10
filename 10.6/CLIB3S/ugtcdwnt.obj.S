Module: ugtcdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000                            _ugetcwd:
0000  53                                push            ebx
0001  56                                push            esi
0002  81 EC 08 02 00 00                 sub             esp,0x00000208
0008  8B B4 24 14 02 00 00              mov             esi,dword ptr 0x214[esp]
000F  89 E0                             mov             eax,esp
0011  50                                push            eax
0012  68 04 01 00 00                    push            0x00000104
0017  E8 00 00 00 00                    call            _GetCurrentDirectoryW
001C  89 C3                             mov             ebx,eax
001E  85 C0                             test            eax,eax
0020  75 07                             jne             L$1
0022  E8 00 00 00 00                    call            __set_errno_nt
0027  EB 22                             jmp             L$3
0029                            L$1:
0029  85 F6                             test            esi,esi
002B  75 22                             jne             L$4
002D  01 C0                             add             eax,eax
002F  83 C0 02                          add             eax,0x00000002
0032  50                                push            eax
0033  E8 00 00 00 00                    call            malloc
0038  83 C4 04                          add             esp,0x00000004
003B  89 C6                             mov             esi,eax
003D  85 C0                             test            eax,eax
003F  75 1B                             jne             L$5
0041  6A 05                             push            0x00000005
0043                            L$2:
0043  E8 00 00 00 00                    call            __set_errno
0048  83 C4 04                          add             esp,0x00000004
004B                            L$3:
004B  31 C0                             xor             eax,eax
004D  EB 22                             jmp             L$6
004F                            L$4:
004F  3B 84 24 18 02 00 00              cmp             eax,dword ptr 0x218[esp]
0056  76 04                             jbe             L$5
0058  6A 0E                             push            0x0000000e
005A  EB E7                             jmp             L$2
005C                            L$5:
005C  8D 44 1B 02                       lea             eax,0x2[ebx+ebx]
0060  50                                push            eax
0061  8D 44 24 04                       lea             eax,0x4[esp]
0065  50                                push            eax
0066  56                                push            esi
0067  E8 00 00 00 00                    call            memcpy
006C  83 C4 0C                          add             esp,0x0000000c
006F  89 F0                             mov             eax,esi
0071                            L$6:
0071  81 C4 08 02 00 00                 add             esp,0x00000208
0077  5E                                pop             esi
0078  5B                                pop             ebx
0079  C3                                ret

Routine Size: 122 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

