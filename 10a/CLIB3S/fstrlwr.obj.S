Module: fstrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000027 bytes
0000                            _fstrlwr:
0000  06                                push            es
0001  C4 44 24 08                       les             eax,fword ptr 0x8[esp]
0005                            L$1:
0005  26 8A 10                          mov             dl,byte ptr es:[eax]
0008  84 D2                             test            dl,dl
000A  74 11                             je              L$3
000C  80 EA 41                          sub             dl,0x41
000F  80 FA 19                          cmp             dl,0x19
0012  77 06                             ja              L$2
0014  80 C2 61                          add             dl,0x61
0017  26 88 10                          mov             byte ptr es:[eax],dl
001A                            L$2:
001A  40                                inc             eax
001B  EB E8                             jmp             L$1
001D                            L$3:
001D  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0021  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0025  07                                pop             es
0026  C3                                ret

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

