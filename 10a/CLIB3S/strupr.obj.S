Module: strupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            _strupr:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 04 00 00 00                    call            strupr
000A  83 C4 04                          add             esp,0x00000004
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E                            strupr:
000E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0012                            L$1:
0012  8A 10                             mov             dl,byte ptr [eax]
0014  84 D2                             test            dl,dl
0016  74 10                             je              L$3
0018  80 EA 61                          sub             dl,0x61
001B  80 FA 19                          cmp             dl,0x19
001E  77 05                             ja              L$2
0020  80 C2 41                          add             dl,0x41
0023  88 10                             mov             byte ptr [eax],dl
0025                            L$2:
0025  40                                inc             eax
0026  EB EA                             jmp             L$1
0028                            L$3:
0028  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
002C  C3                                ret

Routine Size: 31 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

