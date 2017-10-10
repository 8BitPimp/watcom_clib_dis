Module: ungetch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000                            ungetch:
0000  83 3D 00 00 00 00 00              cmp             dword ptr _cbyte,0x00000000
0007  74 06                             je              L$1
0009  B8 FF FF FF FF                    mov             eax,0xffffffff
000E  C3                                ret
000F                            L$1:
000F  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0013  A3 00 00 00 00                    mov             dword ptr _cbyte,eax
0018  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

