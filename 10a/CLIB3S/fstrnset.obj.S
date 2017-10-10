Module: fstrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000                            _fstrnset:
0000  53                                push            ebx
0001  06                                push            es
0002  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0006  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
000A  C4 44 24 0C                       les             eax,fword ptr 0xc[esp]
000E  EB 0B                             jmp             L$2
0010                            L$1:
0010  26 80 38 00                       cmp             byte ptr es:[eax],0x00
0014  74 09                             je              L$3
0016  4A                                dec             edx
0017  26 88 18                          mov             byte ptr es:[eax],bl
001A  40                                inc             eax
001B                            L$2:
001B  85 D2                             test            edx,edx
001D  75 F1                             jne             L$1
001F                            L$3:
001F  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0023  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0027  07                                pop             es
0028  5B                                pop             ebx
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

