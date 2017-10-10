Module: creatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000093 bytes
0000                            _dos_creat:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 08                          sub             esp,0x00000008
0005  E8 00 00 00 00                    call            __NTAtMaxFiles
000A  85 C0                             test            eax,eax
000C  74 11                             je              L$1
000E  6A 0B                             push            0x0000000b
0010  E8 00 00 00 00                    call            __set_errno
0015  B8 FF FF FF FF                    mov             eax,0xffffffff
001A  83 C4 04                          add             esp,0x00000004
001D  EB 6E                             jmp             L$4
001F                            L$1:
001F  89 E0                             mov             eax,esp
0021  50                                push            eax
0022  8D 44 24 08                       lea             eax,0x8[esp]
0026  50                                push            eax
0027  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
002B  52                                push            edx
002C  E8 00 00 00 00                    call            __GetNTCreateAttr
0031  83 C4 0C                          add             esp,0x0000000c
0034  6A 00                             push            0x00000000
0036  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
003A  53                                push            ebx
003B  6A 02                             push            0x00000002
003D  6A 00                             push            0x00000000
003F  6A 00                             push            0x00000000
0041  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0045  51                                push            ecx
0046  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
004A  56                                push            esi
004B  E8 00 00 00 00                    call            _CreateFileA
0050  83 F8 FF                          cmp             eax,0xffffffff
0053  75 07                             jne             L$2
0055  E8 00 00 00 00                    call            __set_errno_nt
005A  EB 31                             jmp             L$4
005C                            L$2:
005C  50                                push            eax
005D  FF 15 00 00 00 00                 call            dword ptr _InitAccessH
0063  83 C4 04                          add             esp,0x00000004
0066  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
006A  89 C2                             mov             edx,eax
006C  89 03                             mov             dword ptr [ebx],eax
006E  8A 5C 24 18                       mov             bl,byte ptr 0x18[esp]
0072  B8 01 00 00 00                    mov             eax,0x00000001
0077  F6 C3 01                          test            bl,0x01
007A  75 05                             jne             L$3
007C  B8 03 00 00 00                    mov             eax,0x00000003
0081                            L$3:
0081  50                                push            eax
0082  52                                push            edx
0083  E8 00 00 00 00                    call            __SetIOMode
0088  83 C4 08                          add             esp,0x00000008
008B  31 C0                             xor             eax,eax
008D                            L$4:
008D  83 C4 08                          add             esp,0x00000008
0090  5E                                pop             esi
0091  5B                                pop             ebx
0092  C3                                ret

Routine Size: 147 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

