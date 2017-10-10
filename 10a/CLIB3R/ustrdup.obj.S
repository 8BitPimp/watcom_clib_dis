Module: ustrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            _ustrdup_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  89 C2                             mov             edx,eax
0006  E8 00 00 00 00                    call            _ustrlen_
000B  8D 48 01                          lea             ecx,0x1[eax]
000E  01 C9                             add             ecx,ecx
0010  89 C8                             mov             eax,ecx
0012  E8 00 00 00 00                    call            malloc_
0017  89 C3                             mov             ebx,eax
0019  89 C6                             mov             esi,eax
001B  85 C0                             test            eax,eax
001D  74 07                             je              L$1
001F  89 CB                             mov             ebx,ecx
0021  E8 00 00 00 00                    call            memcpy_
0026                            L$1:
0026  89 F0                             mov             eax,esi
0028  5E                                pop             esi
0029  5A                                pop             edx
002A  59                                pop             ecx
002B  5B                                pop             ebx
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

