Module: memccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000                            memccpy:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0006  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
000A  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
000E  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0012                            L$1:
0012  85 DB                             test            ebx,ebx
0014  74 16                             je              L$3
0016  8A 08                             mov             cl,byte ptr [eax]
0018  88 0A                             mov             byte ptr [edx],cl
001A  31 C9                             xor             ecx,ecx
001C  8A 08                             mov             cl,byte ptr [eax]
001E  42                                inc             edx
001F  39 F1                             cmp             ecx,esi
0021  75 05                             jne             L$2
0023  89 D0                             mov             eax,edx
0025  5E                                pop             esi
0026  5B                                pop             ebx
0027  C3                                ret
0028                            L$2:
0028  40                                inc             eax
0029  4B                                dec             ebx
002A  EB E6                             jmp             L$1
002C                            L$3:
002C  31 C0                             xor             eax,eax
002E  5E                                pop             esi
002F  5B                                pop             ebx
0030  C3                                ret

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

