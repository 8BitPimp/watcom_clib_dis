Module: chkctype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000                            chkctype:
0000  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
0004  84 C0                             test            al,al
0006  74 21                             je              L$1
0008  83 7C 24 08 01                    cmp             dword ptr 0x8[esp],0x00000001
000D  75 20                             jne             L$2
000F  25 FF 00 00 00                    and             eax,0x000000ff
0014  8A 80 01 00 00 00                 mov             al,byte ptr _IsKTable+0x1[eax]
001A  24 08                             and             al,0x08
001C  25 FF 00 00 00                    and             eax,0x000000ff
0021  74 06                             je              L$1
0023  B8 02 00 00 00                    mov             eax,0x00000002
0028  C3                                ret
0029                            L$1:
0029  B8 FF FF FF FF                    mov             eax,0xffffffff
002E  C3                                ret
002F                            L$2:
002F  25 FF 00 00 00                    and             eax,0x000000ff
0034  8A 80 01 00 00 00                 mov             al,byte ptr _IsKTable+0x1[eax]
003A  24 04                             and             al,0x04
003C  25 FF 00 00 00                    and             eax,0x000000ff
0041  0F 95 C0                          setne           al
0044  25 FF 00 00 00                    and             eax,0x000000ff
0049  C3                                ret

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

