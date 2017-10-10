Module: atol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000                            atol:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005                            L$1:
0005  8A 10                             mov             dl,byte ptr [eax]
0007  FE C2                             inc             dl
0009  81 E2 FF 00 00 00                 and             edx,0x000000ff
000F  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
0015  80 E2 02                          and             dl,0x02
0018  81 E2 FF 00 00 00                 and             edx,0x000000ff
001E  74 03                             je              L$2
0020  40                                inc             eax
0021  EB E2                             jmp             L$1
0023                            L$2:
0023  8A 08                             mov             cl,byte ptr [eax]
0025  88 CA                             mov             dl,cl
0027  83 FA 2B                          cmp             edx,0x0000002b
002A  74 05                             je              L$3
002C  83 FA 2D                          cmp             edx,0x0000002d
002F  75 01                             jne             L$4
0031                            L$3:
0031  40                                inc             eax
0032                            L$4:
0032  31 DB                             xor             ebx,ebx
0034                            L$5:
0034  8A 10                             mov             dl,byte ptr [eax]
0036  FE C2                             inc             dl
0038  81 E2 FF 00 00 00                 and             edx,0x000000ff
003E  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
0044  80 E2 20                          and             dl,0x20
0047  81 E2 FF 00 00 00                 and             edx,0x000000ff
004D  74 0F                             je              L$6
004F  6B DB 0A                          imul            ebx,0x0000000a
0052  31 D2                             xor             edx,edx
0054  8A 10                             mov             dl,byte ptr [eax]
0056  01 D3                             add             ebx,edx
0058  40                                inc             eax
0059  83 EB 30                          sub             ebx,0x00000030
005C  EB D6                             jmp             L$5
005E                            L$6:
005E  31 C0                             xor             eax,eax
0060  88 C8                             mov             al,cl
0062  83 F8 2D                          cmp             eax,0x0000002d
0065  75 02                             jne             L$7
0067  F7 DB                             neg             ebx
0069                            L$7:
0069  89 D8                             mov             eax,ebx
006B  5B                                pop             ebx
006C  C3                                ret

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

