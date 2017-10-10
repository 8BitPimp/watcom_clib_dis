Module: fmemccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
0000                            _fmemccpy:
0000  53                                push            ebx
0001  56                                push            esi
0002  06                                push            es
0003  0F A0                             push            fs
0005  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0009  C4 44 24 1C                       les             eax,fword ptr 0x1c[esp]
000D  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0011  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
0015  8E 64 24 18                       mov             fs,dword ptr 0x18[esp]
0019                            L$1:
0019  85 DB                             test            ebx,ebx
001B  74 1A                             je              L$3
001D  26 8A 08                          mov             cl,byte ptr es:[eax]
0020  64 88 0A                          mov             byte ptr fs:[edx],cl
0023  31 C9                             xor             ecx,ecx
0025  26 8A 08                          mov             cl,byte ptr es:[eax]
0028  42                                inc             edx
0029  39 F1                             cmp             ecx,esi
002B  75 06                             jne             L$2
002D  8C E3                             mov             ebx,fs
002F  89 D0                             mov             eax,edx
0031  EB 08                             jmp             L$4
0033                            L$2:
0033  40                                inc             eax
0034  4B                                dec             ebx
0035  EB E2                             jmp             L$1
0037                            L$3:
0037  31 DB                             xor             ebx,ebx
0039  31 C0                             xor             eax,eax
003B                            L$4:
003B  89 DA                             mov             edx,ebx
003D  0F A1                             pop             fs
003F  07                                pop             es
0040  5E                                pop             esi
0041  5B                                pop             ebx
0042  C3                                ret

Routine Size: 67 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

