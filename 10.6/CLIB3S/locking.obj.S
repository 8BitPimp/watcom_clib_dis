Module: locking
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A3 bytes
0000                            _locking:
0000  53                                push            ebx
0001  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0005  52                                push            edx
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  53                                push            ebx
000B  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
000F  51                                push            ecx
0010  E8 00 00 00 00                    call            locking
0015  83 C4 0C                          add             esp,0x0000000c
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A                            locking:
001A  53                                push            ebx
001B  56                                push            esi
001C  57                                push            edi
001D  55                                push            ebp
001E  8B 7C 24 18                       mov             edi,dword ptr 0x18[esp]
0022  6A 01                             push            0x00000001
0024  6A 00                             push            0x00000000
0026  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
002A  52                                push            edx
002B  E8 00 00 00 00                    call            lseek
0030  83 C4 0C                          add             esp,0x0000000c
0033  89 C5                             mov             ebp,eax
0035  85 FF                             test            edi,edi
0037  75 18                             jne             L$1
0039  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
003D  53                                push            ebx
003E  50                                push            eax
003F  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
0043  51                                push            ecx
0044  E8 00 00 00 00                    call            unlock
0049  83 C4 0C                          add             esp,0x0000000c
004C  5D                                pop             ebp
004D  5F                                pop             edi
004E  5E                                pop             esi
004F  5B                                pop             ebx
0050  C3                                ret
0051                            L$1:
0051  31 F6                             xor             esi,esi
0053                            L$2:
0053  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0057  50                                push            eax
0058  55                                push            ebp
0059  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
005D  52                                push            edx
005E  E8 00 00 00 00                    call            lock
0063  89 C3                             mov             ebx,eax
0065  83 C4 0C                          add             esp,0x0000000c
0068  85 C0                             test            eax,eax
006A  74 32                             je              L$3
006C  83 FF 02                          cmp             edi,0x00000002
006F  74 2D                             je              L$3
0071  83 FF 04                          cmp             edi,0x00000004
0074  74 28                             je              L$3
0076  6A 01                             push            0x00000001
0078  E8 00 00 00 00                    call            sleep
007D  46                                inc             esi
007E  83 C4 04                          add             esp,0x00000004
0081  83 FE 0A                          cmp             esi,0x0000000a
0084  7C CD                             jl              L$2
0086  53                                push            ebx
0087  E8 00 00 00 00                    call            __set_doserrno
008C  83 C4 04                          add             esp,0x00000004
008F  6A 0F                             push            0x0000000f
0091  E8 00 00 00 00                    call            __set_errno
0096  B8 FF FF FF FF                    mov             eax,0xffffffff
009B  83 C4 04                          add             esp,0x00000004
009E                            L$3:
009E  5D                                pop             ebp
009F  5F                                pop             edi
00A0  5E                                pop             esi
00A1  5B                                pop             ebx
00A2  C3                                ret

Routine Size: 137 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

