Module: close
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004E bytes
0000                            close:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  85 DB                             test            ebx,ebx
0008  7C 08                             jl              L$1
000A  3B 1D 00 00 00 00                 cmp             ebx,dword ptr __NFiles
0010  76 0E                             jbe             L$2
0012                            L$1:
0012  6A 04                             push            0x00000004
0014  BE FF FF FF FF                    mov             esi,0xffffffff
0019  E8 00 00 00 00                    call            __set_errno
001E  EB 26                             jmp             L$3
0020                            L$2:
0020  53                                push            ebx
0021  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0027  83 C4 04                          add             esp,0x00000004
002A  53                                push            ebx
002B  E8 00 00 00 00                    call            __close
0030  83 C4 04                          add             esp,0x00000004
0033  53                                push            ebx
0034  89 C6                             mov             esi,eax
0036  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
003C  83 C4 04                          add             esp,0x00000004
003F  53                                push            ebx
0040  FF 15 00 00 00 00                 call            dword ptr _FiniAccessH
0046                            L$3:
0046  83 C4 04                          add             esp,0x00000004
0049  89 F0                             mov             eax,esi
004B  5E                                pop             esi
004C  5B                                pop             ebx
004D  C3                                ret

Routine Size: 78 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

