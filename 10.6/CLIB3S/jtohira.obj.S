Module: jtohira
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000                            jtohira:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0006  31 DB                             xor             ebx,ebx
0008  66 89 F3                          mov             bx,si
000B  53                                push            ebx
000C  E8 00 00 00 00                    call            jiskana
0011  83 C4 04                          add             esp,0x00000004
0014  85 C0                             test            eax,eax
0016  74 24                             je              L$1
0018  81 FB 93 83 00 00                 cmp             ebx,0x00008393
001E  7F 1C                             jg              L$1
0020  81 FB 7F 83 00 00                 cmp             ebx,0x0000837f
0026  0F 9D C0                          setge           al
0029  31 DB                             xor             ebx,ebx
002B  88 C3                             mov             bl,al
002D  31 C0                             xor             eax,eax
002F  81 C3 A1 00 00 00                 add             ebx,0x000000a1
0035  66 89 F0                          mov             ax,si
0038  29 D8                             sub             eax,ebx
003A  89 C6                             mov             esi,eax
003C                            L$1:
003C  89 F0                             mov             eax,esi
003E  5E                                pop             esi
003F  5B                                pop             ebx
0040  C3                                ret

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

