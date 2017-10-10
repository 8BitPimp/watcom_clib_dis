Module: btom
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000                            btom:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0009  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
000D  31 DB                             xor             ebx,ebx
000F  01 D6                             add             esi,edx
0011                            L$1:
0011  89 E0                             mov             eax,esp
0013  50                                push            eax
0014  52                                push            edx
0015  E8 00 00 00 00                    call            jgetmoji
001A  83 C4 08                          add             esp,0x00000008
001D  8B 0C 24                          mov             ecx,dword ptr [esp]
0020  89 C2                             mov             edx,eax
0022  66 85 C9                          test            cx,cx
0025  74 07                             je              L$2
0027  39 F0                             cmp             eax,esi
0029  77 03                             ja              L$2
002B  43                                inc             ebx
002C  EB E3                             jmp             L$1
002E                            L$2:
002E  89 D8                             mov             eax,ebx
0030  83 C4 04                          add             esp,0x00000004
0033  5E                                pop             esi
0034  5B                                pop             ebx
0035  C3                                ret

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

