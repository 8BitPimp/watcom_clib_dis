Module: utimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000152 bytes
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
001E  89 C6                             mov             esi,eax
0020  89 C3                             mov             ebx,eax
0022  83 F8 FF                          cmp             eax,0xffffffff
0025  74 1F                             je              L$2
0027  8D 44 24 40                       lea             eax,0x40[esp]
002B  50                                push            eax
002C  8D 44 24 34                       lea             eax,0x34[esp]
0030  50                                push            eax
0031  8D 44 24 30                       lea             eax,0x30[esp]
0035  50                                push            eax
0036  56                                push            esi
0037  E8 00 00 00 00                    call            _GetFileTime
003C  85 C0                             test            eax,eax
003E  75 10                             jne             L$3
0040  56                                push            esi
0041                            L$1:
0041  E8 00 00 00 00                    call            _CloseHandle
0046                            L$2:
0046  E8 00 00 00 00                    call            __set_errno_nt
004B  E9 FC 00 00 00                    jmp             L$6
0050                            L$3:
0050  8B 4C 24 58                       mov             ecx,dword ptr 0x58[esp]
0054  85 C9                             test            ecx,ecx
0056  75 19                             jne             L$4
0058  51                                push            ecx
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
0080  B8 6C 07 00 00                    mov             eax,0x0000076c
0085  66 8B 4A 14                       mov             cx,word ptr 0x14[edx]
0089  83 C4 04                          add             esp,0x00000004
008C  01 C8                             add             eax,ecx
008E  66 89 44 24 10                    mov             word ptr 0x10[esp],ax
0093  66 89 04 24                       mov             word ptr [esp],ax
0097  66 8B 42 10                       mov             ax,word ptr 0x10[edx]
009B  40                                inc             eax
009C  66 89 44 24 12                    mov             word ptr 0x12[esp],ax
00A1  66 89 44 24 02                    mov             word ptr 0x2[esp],ax
00A6  66 8B 42 0C                       mov             ax,word ptr 0xc[edx]
00AA  66 89 44 24 16                    mov             word ptr 0x16[esp],ax
00AF  66 89 44 24 06                    mov             word ptr 0x6[esp],ax
00B4  66 8B 42 08                       mov             ax,word ptr 0x8[edx]
00B8  66 89 44 24 18                    mov             word ptr 0x18[esp],ax
00BD  66 89 44 24 08                    mov             word ptr 0x8[esp],ax
00C2  66 8B 42 04                       mov             ax,word ptr 0x4[edx]
00C6  66 89 44 24 1A                    mov             word ptr 0x1a[esp],ax
00CB  66 89 44 24 0A                    mov             word ptr 0xa[esp],ax
00D0  66 8B 02                          mov             ax,word ptr [edx]
00D3  66 89 44 24 1C                    mov             word ptr 0x1c[esp],ax
00D8  66 89 44 24 0C                    mov             word ptr 0xc[esp],ax
00DD  8D 44 24 20                       lea             eax,0x20[esp]
00E1  50                                push            eax
00E2  8D 44 24 04                       lea             eax,0x4[esp]
00E6  31 F6                             xor             esi,esi
00E8  50                                push            eax
00E9  66 89 74 24 26                    mov             word ptr 0x26[esp],si
00EE  66 89 74 24 16                    mov             word ptr 0x16[esp],si
00F3  E8 00 00 00 00                    call            _SystemTimeToFileTime
00F8  8D 44 24 40                       lea             eax,0x40[esp]
00FC  50                                push            eax
00FD  8D 44 24 24                       lea             eax,0x24[esp]
0101  50                                push            eax
0102  E8 00 00 00 00                    call            _LocalFileTimeToFileTime
0107  8D 44 24 20                       lea             eax,0x20[esp]
010B  50                                push            eax
010C  8D 44 24 14                       lea             eax,0x14[esp]
0110  50                                push            eax
0111  E8 00 00 00 00                    call            _SystemTimeToFileTime
0116  8D 44 24 30                       lea             eax,0x30[esp]
011A  50                                push            eax
011B  8D 44 24 24                       lea             eax,0x24[esp]
011F  50                                push            eax
0120  E8 00 00 00 00                    call            _LocalFileTimeToFileTime
0125  8D 44 24 40                       lea             eax,0x40[esp]
0129  50                                push            eax
012A  8D 44 24 34                       lea             eax,0x34[esp]
012E  50                                push            eax
012F  8D 44 24 30                       lea             eax,0x30[esp]
0133  50                                push            eax
0134  53                                push            ebx
0135  E8 00 00 00 00                    call            _SetFileTime
013A  85 C0                             test            eax,eax
013C  75 06                             jne             L$5
013E  53                                push            ebx
013F  E9 FD FE FF FF                    jmp             L$1
0144                            L$5:
0144  53                                push            ebx
0145  E8 00 00 00 00                    call            _CloseHandle
014A  31 C0                             xor             eax,eax
014C                            L$6:
014C  83 C4 48                          add             esp,0x00000048
014F  5E                                pop             esi
0150  5B                                pop             ebx
0151  C3                                ret

Routine Size: 338 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

