Module: fmemcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000                            _fmemcmp:
0000  56                                push            esi
0001  57                                push            edi
0002  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0006  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
000A  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
000E  8B 7C 24 14                       mov             edi,dword ptr 0x14[esp]
0012  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0016  1E                                push            ds
0017  06                                push            es
0018  91                                xchg            eax,ecx
0019  8E DA                             mov             ds,edx
001B  8E C0                             mov             es,eax
001D  09 C9                             or              ecx,ecx
001F  F3 A6                             repe cmpsb
0021  74 05                             je              L$1
0023  19 C9                             sbb             ecx,ecx
0025  83 D9 FF                          sbb             ecx,0xffffffff
0028                            L$1:
0028  07                                pop             es
0029  1F                                pop             ds
002A  89 C8                             mov             eax,ecx
002C  5F                                pop             edi
002D  5E                                pop             esi
002E  C3                                ret

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

