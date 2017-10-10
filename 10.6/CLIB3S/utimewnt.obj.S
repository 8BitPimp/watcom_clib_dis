Module: utimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000150 bytes
0000                            utime:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 48                          sub             esp,0x00000048
0005  6A 00                             push            0x00000000
0007  6A 00                             push            0x00000000
0009  6A 03                             push            0x00000003
000B  6A 00                             push            0x00000000
000D  6A 00                             push            0x00000000
000F  68 00 00 00 C0                    push            0xc0000000
0014  8B 54 24 6C                       mov             edx,dword ptr 0x6c[esp]
0018  52                                push            edx
0019  E8 00 00 00 00                    call            _CreateFileA
001E  89 C3                             mov             ebx,eax
0020  89 C6                             mov             esi,eax
0022  83 F8 FF                          cmp             eax,0xffffffff
0025  74 1F                             je              L$2
0027  8D 44 24 20                       lea             eax,0x20[esp]
002B  50                                push            eax
002C  8D 44 24 44                       lea             eax,0x44[esp]
0030  50                                push            eax
0031  8D 44 24 38                       lea             eax,0x38[esp]
0035  50                                push            eax
0036  53                                push            ebx
0037  E8 00 00 00 00                    call            _GetFileTime
003C  85 C0                             test            eax,eax
003E  75 10                             jne             L$3
0040  53                                push            ebx
0041                            L$1:
0041  E8 00 00 00 00                    call            _CloseHandle
0046                            L$2:
0046  E8 00 00 00 00                    call            __set_errno_nt
004B  E9 FA 00 00 00                    jmp             L$6
0050                            L$3:
0050  8B 5C 24 58                       mov             ebx,dword ptr 0x58[esp]
0054  85 DB                             test            ebx,ebx
0056  75 19                             jne             L$4
0058  53                                push            ebx
0059  E8 00 00 00 00                    call            time
005E  83 C4 04                          add             esp,0x00000004
0061  89 44 24 3C                       mov             dword ptr 0x3c[esp],eax
0065  89 44 24 38                       mov             dword ptr 0x38[esp],eax
0069  8D 44 24 38                       lea             eax,0x38[esp]
006D  89 44 24 58                       mov             dword ptr 0x58[esp],eax
0071                            L$4:
0071  8B 44 24 58                       mov             eax,dword ptr 0x58[esp]
0075  83 C0 04                          add             eax,0x00000004
0078  50                                push            eax
0079  E8 00 00 00 00                    call            localtime
007E  89 C2                             mov             edx,eax
0080  66 8B 40 14                       mov             ax,word ptr 0x14[eax]
0084  83 C4 04                          add             esp,0x00000004
0087  05 6C 07 00 00                    add             eax,0x0000076c
008C  66 89 44 24 10                    mov             word ptr 0x10[esp],ax
0091  66 89 04 24                       mov             word ptr [esp],ax
0095  66 8B 42 10                       mov             ax,word ptr 0x10[edx]
0099  40                                inc             eax
009A  66 89 44 24 12                    mov             word ptr 0x12[esp],ax
009F  66 89 44 24 02                    mov             word ptr 0x2[esp],ax
00A4  66 8B 42 0C                       mov             ax,word ptr 0xc[edx]
00A8  66 89 44 24 16                    mov             word ptr 0x16[esp],ax
00AD  66 89 44 24 06                    mov             word ptr 0x6[esp],ax
00B2  66 8B 42 08                       mov             ax,word ptr 0x8[edx]
00B6  66 89 44 24 18                    mov             word ptr 0x18[esp],ax
00BB  66 89 44 24 08                    mov             word ptr 0x8[esp],ax
00C0  66 8B 42 04                       mov             ax,word ptr 0x4[edx]
00C4  66 89 44 24 1A                    mov             word ptr 0x1a[esp],ax
00C9  66 89 44 24 0A                    mov             word ptr 0xa[esp],ax
00CE  66 8B 02                          mov             ax,word ptr [edx]
00D1  66 89 44 24 1C                    mov             word ptr 0x1c[esp],ax
00D6  66 89 44 24 0C                    mov             word ptr 0xc[esp],ax
00DB  8D 44 24 28                       lea             eax,0x28[esp]
00DF  50                                push            eax
00E0  8D 44 24 04                       lea             eax,0x4[esp]
00E4  31 D2                             xor             edx,edx
00E6  50                                push            eax
00E7  66 89 54 24 26                    mov             word ptr 0x26[esp],dx
00EC  66 89 54 24 16                    mov             word ptr 0x16[esp],dx
00F1  E8 00 00 00 00                    call            _SystemTimeToFileTime
00F6  8D 44 24 20                       lea             eax,0x20[esp]
00FA  50                                push            eax
00FB  8D 44 24 2C                       lea             eax,0x2c[esp]
00FF  50                                push            eax
0100  E8 00 00 00 00                    call            _LocalFileTimeToFileTime
0105  8D 44 24 28                       lea             eax,0x28[esp]
0109  50                                push            eax
010A  8D 44 24 14                       lea             eax,0x14[esp]
010E  50                                push            eax
010F  E8 00 00 00 00                    call            _SystemTimeToFileTime
0114  8D 44 24 40                       lea             eax,0x40[esp]
0118  50                                push            eax
0119  8D 44 24 2C                       lea             eax,0x2c[esp]
011D  50                                push            eax
011E  E8 00 00 00 00                    call            _LocalFileTimeToFileTime
0123  8D 44 24 20                       lea             eax,0x20[esp]
0127  50                                push            eax
0128  8D 44 24 44                       lea             eax,0x44[esp]
012C  50                                push            eax
012D  8D 44 24 38                       lea             eax,0x38[esp]
0131  50                                push            eax
0132  56                                push            esi
0133  E8 00 00 00 00                    call            _SetFileTime
0138  85 C0                             test            eax,eax
013A  75 06                             jne             L$5
013C  56                                push            esi
013D  E9 FF FE FF FF                    jmp             L$1
0142                            L$5:
0142  56                                push            esi
0143  E8 00 00 00 00                    call            _CloseHandle
0148  31 C0                             xor             eax,eax
014A                            L$6:
014A  83 C4 48                          add             esp,0x00000048
014D  5E                                pop             esi
014E  5B                                pop             ebx
014F  C3                                ret

Routine Size: 336 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

