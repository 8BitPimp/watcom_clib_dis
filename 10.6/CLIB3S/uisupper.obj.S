Module: uisupper
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000                            _uisupper:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006  F6 C4 FF                          test            ah,0xff
0009  75 0D                             jne             L$1
000B  8A 80 01 00 00 00                 mov             al,byte ptr _IsTable+0x1[eax]
0011  24 40                             and             al,0x40
0013  0F B6 C0                          movzx           eax,al
0016  5D                                pop             ebp
0017  C3                                ret
0018                            L$1:
0018  31 C0                             xor             eax,eax
001A  5D                                pop             ebp
001B  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

