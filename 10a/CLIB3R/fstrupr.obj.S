Module: fstrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000                            _fstrupr_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  06                                push            es
0003  89 D1                             mov             ecx,edx
0005  89 C3                             mov             ebx,eax
0007  8E C2                             mov             es,edx
0009                            L$1:
0009  26 8A 10                          mov             dl,byte ptr es:[eax]
000C  84 D2                             test            dl,dl
000E  74 11                             je              L$3
0010  80 EA 61                          sub             dl,0x61
0013  80 FA 19                          cmp             dl,0x19
0016  77 06                             ja              L$2
0018  80 C2 41                          add             dl,0x41
001B  26 88 10                          mov             byte ptr es:[eax],dl
001E                            L$2:
001E  40                                inc             eax
001F  EB E8                             jmp             L$1
0021                            L$3:
0021  89 CA                             mov             edx,ecx
0023  89 D8                             mov             eax,ebx
0025  07                                pop             es
0026  59                                pop             ecx
0027  5B                                pop             ebx
0028  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

