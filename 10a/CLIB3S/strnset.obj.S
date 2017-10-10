Module: strnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000                            strnset:
0000  53                                push            ebx
0001  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0005  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0009  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
000D  EB 09                             jmp             L$2
000F                            L$1:
000F  80 38 00                          cmp             byte ptr [eax],0x00
0012  74 08                             je              L$3
0014  4A                                dec             edx
0015  88 18                             mov             byte ptr [eax],bl
0017  40                                inc             eax
0018                            L$2:
0018  85 D2                             test            edx,edx
001A  75 F3                             jne             L$1
001C                            L$3:
001C  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0020  5B                                pop             ebx
0021  C3                                ret

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

