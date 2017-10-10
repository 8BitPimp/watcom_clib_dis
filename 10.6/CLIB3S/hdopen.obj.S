Module: hdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000                            check_mode:
0000  31 C0                             xor             eax,eax
0002  C3                                ret

Routine Size: 3 bytes,    Routine Base: _TEXT + 0000

0003                            _hdopen:
0003  53                                push            ebx
0004  56                                push            esi
0005  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0009  83 FE FF                          cmp             esi,0xffffffff
000C  0F 84 68 00 00 00                 je              L$7
0012  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0016  52                                push            edx
0017  56                                push            esi
0018  E8 00 00 00 00                    call            check_mode
001D  83 C4 08                          add             esp,0x00000008
0020  85 C0                             test            eax,eax
0022  74 08                             je              L$1
0024  B8 FF FF FF FF                    mov             eax,0xffffffff
0029  5E                                pop             esi
002A  5B                                pop             ebx
002B  C3                                ret
002C                            L$1:
002C  56                                push            esi
002D  FF 15 00 00 00 00                 call            dword ptr _InitAccessH
0033  83 C4 04                          add             esp,0x00000004
0036  50                                push            eax
0037  89 C6                             mov             esi,eax
0039  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
003D  E8 00 00 00 00                    call            __IOMode
0042  83 E3 03                          and             ebx,0x00000003
0045  83 C4 04                          add             esp,0x00000004
0048  24 3C                             and             al,0x3c
004A  83 FB 02                          cmp             ebx,0x00000002
004D  75 02                             jne             L$2
004F  0C 03                             or              al,0x03
0051                            L$2:
0051  85 DB                             test            ebx,ebx
0053  75 02                             jne             L$3
0055  0C 01                             or              al,0x01
0057                            L$3:
0057  83 FB 01                          cmp             ebx,0x00000001
005A  75 02                             jne             L$4
005C  0C 02                             or              al,0x02
005E                            L$4:
005E  F6 44 24 10 10                    test            byte ptr 0x10[esp],0x10
0063  74 02                             je              L$5
0065  0C 80                             or              al,0x80
0067                            L$5:
0067  F6 44 24 11 02                    test            byte ptr 0x11[esp],0x02
006C  74 02                             je              L$6
006E  0C 40                             or              al,0x40
0070                            L$6:
0070  50                                push            eax
0071  56                                push            esi
0072  E8 00 00 00 00                    call            __SetIOMode
0077  83 C4 08                          add             esp,0x00000008
007A                            L$7:
007A  89 F0                             mov             eax,esi
007C  5E                                pop             esi
007D  5B                                pop             ebx
007E  C3                                ret

Routine Size: 124 bytes,    Routine Base: _TEXT + 0003

007F                            _dopen:
007F  53                                push            ebx
0080  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0084  52                                push            edx
0085  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0089  53                                push            ebx
008A  E8 00 00 00 00                    call            _hdopen
008F  83 C4 08                          add             esp,0x00000008
0092  5B                                pop             ebx
0093  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 007F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

