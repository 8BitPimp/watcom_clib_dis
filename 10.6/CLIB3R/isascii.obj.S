Module: isascii
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000C bytes
0000                            __isascii_:
0000                            isascii_:
0000  83 F8 7F                          cmp             eax,0x0000007f
0003  0F 96 C0                          setbe           al
0006  25 FF 00 00 00                    and             eax,0x000000ff
000B  C3                                ret

Routine Size: 12 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

