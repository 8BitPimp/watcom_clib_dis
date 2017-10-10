Module: stack386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000                            stackavail:
0000  53                                push            ebx
0001  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0007  89 C3                             mov             ebx,eax
0009  89 E0                             mov             eax,esp
000B  2B 03                             sub             eax,dword ptr [ebx]
000D  5B                                pop             ebx
000E  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

