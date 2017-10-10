Module: fmtob
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000                            _fmtob:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
0009  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
000D  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0011                            L$1:
0011  4B                                dec             ebx
0012  83 FB FF                          cmp             ebx,0xffffffff
0015  74 28                             je              L$2
0017  89 E6                             mov             esi,esp
0019  8C D8                             mov             eax,ds
001B  25 FF FF 00 00                    and             eax,0x0000ffff
0020  50                                push            eax
0021  31 C0                             xor             eax,eax
0023  56                                push            esi
0024  66 89 C8                          mov             ax,cx
0027  50                                push            eax
0028  52                                push            edx
0029  9A 00 00 00 00 00 00              call            _fjgetmoji
0030  83 C4 10                          add             esp,0x00000010
0033  89 D1                             mov             ecx,edx
0035  8B 34 24                          mov             esi,dword ptr [esp]
0038  89 C2                             mov             edx,eax
003A  66 85 F6                          test            si,si
003D  75 D2                             jne             L$1
003F                            L$2:
003F  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0043  89 D0                             mov             eax,edx
0045  29 D8                             sub             eax,ebx
0047  83 C4 04                          add             esp,0x00000004
004A  5E                                pop             esi
004B  5B                                pop             ebx
004C  CB                                retf

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

