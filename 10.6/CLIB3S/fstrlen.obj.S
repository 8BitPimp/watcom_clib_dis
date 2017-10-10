Module: fstrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000                            _fstrlen:
0000  57                                push            edi
0001  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
0005  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
0009  06                                push            es
000A  8E C1                             mov             es,ecx
000C  31 C0                             xor             eax,eax
000E  89 C1                             mov             ecx,eax
0010  49                                dec             ecx
0011  F2 AE                             repne scasb
0013  F7 D1                             not             ecx
0015  49                                dec             ecx
0016  07                                pop             es
0017  89 C8                             mov             eax,ecx
0019  5F                                pop             edi
001A  C3                                ret

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

