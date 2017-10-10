Module: stack386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000                            stackavail_:
0000  52                                push            edx
0001  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0007  89 C2                             mov             edx,eax
0009  89 E0                             mov             eax,esp
000B  2B 02                             sub             eax,dword ptr [edx]
000D  5A                                pop             edx
000E  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

