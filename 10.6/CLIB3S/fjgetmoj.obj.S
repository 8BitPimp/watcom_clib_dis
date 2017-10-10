Module: fjgetmoj
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005F bytes
0000                            _fjgetmoji:
0000  53                                push            ebx
0001  06                                push            es
0002  0F A0                             push            fs
0004  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0008  C4 54 24 1C                       les             edx,fword ptr 0x1c[esp]
000C  8E 64 24 18                       mov             fs,dword ptr 0x18[esp]
0010  30 FF                             xor             bh,bh
0012  64 8A 18                          mov             bl,byte ptr fs:[eax]
0015  66 26 89 1A                       mov             word ptr es:[edx],bx
0019  66 85 DB                          test            bx,bx
001C  74 38                             je              L$2
001E  31 DB                             xor             ebx,ebx
0020  26 8A 1A                          mov             bl,byte ptr es:[edx]
0023  8A 9B 01 00 00 00                 mov             bl,byte ptr _IsKTable+0x1[ebx]
0029  80 E3 04                          and             bl,0x04
002C  81 E3 FF 00 00 00                 and             ebx,0x000000ff
0032  40                                inc             eax
0033  85 DB                             test            ebx,ebx
0035  74 1F                             je              L$2
0037  64 8A 18                          mov             bl,byte ptr fs:[eax]
003A  84 DB                             test            bl,bl
003C  74 12                             je              L$1
003E  66 26 8B 0A                       mov             cx,word ptr es:[edx]
0042  30 FF                             xor             bh,bh
0044  C1 E1 08                          shl             ecx,0x08
0047  09 D9                             or              ecx,ebx
0049  40                                inc             eax
004A  66 26 89 0A                       mov             word ptr es:[edx],cx
004E  EB 06                             jmp             L$2
0050                            L$1:
0050  66 26 C7 02 00 00                 mov             word ptr es:[edx],0x0000
0056                            L$2:
0056  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
005A  0F A1                             pop             fs
005C  07                                pop             es
005D  5B                                pop             ebx
005E  CB                                retf

Routine Size: 95 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

