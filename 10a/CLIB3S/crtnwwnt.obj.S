Module: crtnwwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009B bytes
0000                            _dos_creatnew:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 08                          sub             esp,0x00000008
0005  E8 00 00 00 00                    call            __NTAtMaxFiles
000A  85 C0                             test            eax,eax
000C  74 14                             je              L$1
000E  6A 0B                             push            0x0000000b
0010  E8 00 00 00 00                    call            __set_errno_dos
0015  B8 FF FF FF FF                    mov             eax,0xffffffff
001A  83 C4 04                          add             esp,0x00000004
001D  E9 73 00 00 00                    jmp             L$4
0022                            L$1:
0022  89 E0                             mov             eax,esp
0024  50                                push            eax
0025  8D 44 24 08                       lea             eax,0x8[esp]
0029  50                                push            eax
002A  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
002E  52                                push            edx
002F  E8 00 00 00 00                    call            __GetNTCreateAttr
0034  83 C4 0C                          add             esp,0x0000000c
0037  6A 00                             push            0x00000000
0039  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
003D  53                                push            ebx
003E  6A 01                             push            0x00000001
0040  6A 00                             push            0x00000000
0042  6A 00                             push            0x00000000
0044  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0048  51                                push            ecx
0049  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
004D  56                                push            esi
004E  E8 00 00 00 00                    call            _CreateFileA
0053  83 F8 FF                          cmp             eax,0xffffffff
0056  75 0C                             jne             L$2
0058  E8 00 00 00 00                    call            __set_errno_nt
005D  E8 00 00 00 00                    call            _GetLastError
0062  EB 31                             jmp             L$4
0064                            L$2:
0064  50                                push            eax
0065  FF 15 00 00 00 00                 call            dword ptr _InitAccessH
006B  83 C4 04                          add             esp,0x00000004
006E  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
0072  89 C2                             mov             edx,eax
0074  89 03                             mov             dword ptr [ebx],eax
0076  8A 5C 24 18                       mov             bl,byte ptr 0x18[esp]
007A  B8 01 00 00 00                    mov             eax,0x00000001
007F  F6 C3 01                          test            bl,0x01
0082  75 05                             jne             L$3
0084  B8 03 00 00 00                    mov             eax,0x00000003
0089                            L$3:
0089  50                                push            eax
008A  52                                push            edx
008B  E8 00 00 00 00                    call            __SetIOMode
0090  83 C4 08                          add             esp,0x00000008
0093  31 C0                             xor             eax,eax
0095                            L$4:
0095  83 C4 08                          add             esp,0x00000008
0098  5E                                pop             esi
0099  5B                                pop             ebx
009A  C3                                ret

Routine Size: 155 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

