Module: uisascii
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000                            _uisascii:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  83 7D 08 7F                       cmp             dword ptr 0x8[ebp],0x0000007f
0007  0F 96 C0                          setbe           al
000A  0F B6 C0                          movzx           eax,al
000D  5D                                pop             ebp
000E  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

