Module: accsswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000                            _access:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
000A  53                                push            ebx
000B  E8 05 00 00 00                    call            access
0010  83 C4 08                          add             esp,0x00000008
0013  5B                                pop             ebx
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015                            access:
0015  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0019  52                                push            edx
001A  E8 00 00 00 00                    call            _GetFileAttributesA
001F  83 F8 FF                          cmp             eax,0xffffffff
0022  0F 84 00 00 00 00                 je              __set_errno_nt
0028  F6 44 24 08 02                    test            byte ptr 0x8[esp],0x02
002D  74 0F                             je              L$1
002F  A8 01                             test            al,0x01
0031  74 0B                             je              L$1
0033  6A 05                             push            0x00000005
0035  E8 00 00 00 00                    call            __set_errno_dos
003A  83 C4 04                          add             esp,0x00000004
003D  C3                                ret
003E                            L$1:
003E  31 C0                             xor             eax,eax
0040  C3                                ret

Routine Size: 44 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

