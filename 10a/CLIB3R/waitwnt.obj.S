Module: waitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000                            wait_:
0000  53                                push            ebx
0001  52                                push            edx
0002  31 D2                             xor             edx,edx
0004  31 DB                             xor             ebx,ebx
0006  E8 00 00 00 00                    call            cwait_
000B  5A                                pop             edx
000C  5B                                pop             ebx
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

