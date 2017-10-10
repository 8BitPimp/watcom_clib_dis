Module: jtokata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000038 bytes
0000                            jtokata:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  31 F6                             xor             esi,esi
0008  66 89 DE                          mov             si,bx
000B  56                                push            esi
000C  E8 00 00 00 00                    call            jishira
0011  83 C4 04                          add             esp,0x00000004
0014  85 C0                             test            eax,eax
0016  74 1B                             je              L$1
0018  81 FE DE 82 00 00                 cmp             esi,0x000082de
001E  0F 9D C0                          setge           al
0021  0F B6 F0                          movzx           esi,al
0024  31 C0                             xor             eax,eax
0026  81 C6 A1 00 00 00                 add             esi,0x000000a1
002C  66 89 D8                          mov             ax,bx
002F  01 F0                             add             eax,esi
0031  89 C3                             mov             ebx,eax
0033                            L$1:
0033  89 D8                             mov             eax,ebx
0035  5E                                pop             esi
0036  5B                                pop             ebx
0037  C3                                ret

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

