Module: memcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000                            memcpy:
0000  56                                push            esi
0001  57                                push            edi
0002  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0006  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
000A  8B 7C 24 0C                       mov             edi,dword ptr 0xc[esp]
000E  06                                push            es
000F  8C D8                             mov             eax,ds
0011  8E C0                             mov             es,eax
0013  57                                push            edi
0014  89 C8                             mov             eax,ecx
0016  C1 E9 02                          shr             ecx,0x02
0019  F2 A5                             repne movsd
001B  8A C8                             mov             cl,al
001D  80 E1 03                          and             cl,0x03
0020  F2 A4                             repne movsb
0022  5F                                pop             edi
0023  07                                pop             es
0024  89 F8                             mov             eax,edi
0026  5F                                pop             edi
0027  5E                                pop             esi
0028  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

