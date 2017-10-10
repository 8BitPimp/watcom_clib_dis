Module: mbccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000                            _mbccpy:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0009  8B 1D 00 00 00 00                 mov             ebx,dword ptr __IsDBCS
000F  85 DB                             test            ebx,ebx
0011  74 13                             je              L$1
0013  31 DB                             xor             ebx,ebx
0015  8A 18                             mov             bl,byte ptr [eax]
0017  8A 9B 01 00 00 00                 mov             bl,byte ptr __MBCSIsTable+0x1[ebx]
001D  80 E3 01                          and             bl,0x01
0020  81 E3 FF 00 00 00                 and             ebx,0x000000ff
0026                            L$1:
0026  85 DB                             test            ebx,ebx
0028  74 0C                             je              L$2
002A  8A 18                             mov             bl,byte ptr [eax]
002C  88 1A                             mov             byte ptr [edx],bl
002E  8A 40 01                          mov             al,byte ptr 0x1[eax]
0031  88 42 01                          mov             byte ptr 0x1[edx],al
0034  5B                                pop             ebx
0035  C3                                ret
0036                            L$2:
0036  8A 00                             mov             al,byte ptr [eax]
0038  88 02                             mov             byte ptr [edx],al
003A  5B                                pop             ebx
003B  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

