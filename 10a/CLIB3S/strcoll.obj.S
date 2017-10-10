Module: strcoll
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000                            strcoll:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0009  EB 0B                             jmp             L$3
000B                            L$1:
000B  80 38 00                          cmp             byte ptr [eax],0x00
000E  75 04                             jne             L$2
0010  31 C0                             xor             eax,eax
0012  5B                                pop             ebx
0013  C3                                ret
0014                            L$2:
0014  40                                inc             eax
0015  42                                inc             edx
0016                            L$3:
0016  8A 18                             mov             bl,byte ptr [eax]
0018  3A 1A                             cmp             bl,byte ptr [edx]
001A  74 EF                             je              L$1
001C  31 DB                             xor             ebx,ebx
001E  8A 18                             mov             bl,byte ptr [eax]
0020  31 C0                             xor             eax,eax
0022  8A 02                             mov             al,byte ptr [edx]
0024  29 C3                             sub             ebx,eax
0026  89 D8                             mov             eax,ebx
0028  5B                                pop             ebx
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

