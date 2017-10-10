Module: fscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B6 bytes
0000                            cget_file:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  8B 53 08                          mov             edx,dword ptr 0x8[ebx]
0008  52                                push            edx
0009  E8 00 00 00 00                    call            fgetc
000E  83 C4 04                          add             esp,0x00000004
0011  89 C2                             mov             edx,eax
0013  83 F8 FF                          cmp             eax,0xffffffff
0016  75 04                             jne             L$1
0018  80 4B 10 02                       or              byte ptr 0x10[ebx],0x02
001C                            L$1:
001C  89 D0                             mov             eax,edx
001E  5B                                pop             ebx
001F  C3                                ret
0020                            uncget_file:
0020  53                                push            ebx
0021  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0025  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0028  52                                push            edx
0029  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
002D  53                                push            ebx
002E  E8 00 00 00 00                    call            ungetc
0033  83 C4 08                          add             esp,0x00000008
0036  5B                                pop             ebx
0037  C3                                ret

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

0038                            vfscanf:
0038  53                                push            ebx
0039  56                                push            esi
003A  57                                push            edi
003B  55                                push            ebp
003C  83 EC 14                          sub             esp,0x00000014
003F  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
0043  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0046  52                                push            edx
0047  BE 00 00 00 00                    mov             esi,offset uncget_file
004C  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0052  83 C4 04                          add             esp,0x00000004
0055  B9 00 00 00 00                    mov             ecx,offset cget_file
005A  89 5C 24 08                       mov             dword ptr 0x8[esp],ebx
005E  89 0C 24                          mov             dword ptr [esp],ecx
0061  89 74 24 04                       mov             dword ptr 0x4[esp],esi
0065  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
0068  57                                push            edi
0069  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
006F  83 C4 04                          add             esp,0x00000004
0072  8B 6C 24 30                       mov             ebp,dword ptr 0x30[esp]
0076  55                                push            ebp
0077  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
007B  50                                push            eax
007C  8D 44 24 08                       lea             eax,0x8[esp]
0080  50                                push            eax
0081  E8 00 00 00 00                    call            __scnf
0086  83 C4 0C                          add             esp,0x0000000c
0089  83 C4 14                          add             esp,0x00000014
008C  5D                                pop             ebp
008D  5F                                pop             edi
008E  5E                                pop             esi
008F  5B                                pop             ebx
0090  C3                                ret

Routine Size: 89 bytes,    Routine Base: _TEXT + 0038

0091                            fscanf:
0091  53                                push            ebx
0092  83 EC 04                          sub             esp,0x00000004
0095  8D 44 24 14                       lea             eax,0x14[esp]
0099  89 04 24                          mov             dword ptr [esp],eax
009C  89 E0                             mov             eax,esp
009E  50                                push            eax
009F  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
00A3  52                                push            edx
00A4  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
00A8  53                                push            ebx
00A9  E8 00 00 00 00                    call            vfscanf
00AE  83 C4 0C                          add             esp,0x0000000c
00B1  83 C4 04                          add             esp,0x00000004
00B4  5B                                pop             ebx
00B5  C3                                ret

Routine Size: 37 bytes,    Routine Base: _TEXT + 0091

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

