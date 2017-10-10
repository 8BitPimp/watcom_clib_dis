Module: strlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000                            strlen:
0000  57                                push            edi
0001  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
0005  06                                push            es
0006  8C D8                             mov             eax,ds
0008  8E C0                             mov             es,eax
000A  29 C9                             sub             ecx,ecx
000C  49                                dec             ecx
000D  31 C0                             xor             eax,eax
000F  F2 AE                             repne scasb
0011  F7 D1                             not             ecx
0013  49                                dec             ecx
0014  07                                pop             es
0015  89 C8                             mov             eax,ecx
0017  5F                                pop             edi
0018  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

