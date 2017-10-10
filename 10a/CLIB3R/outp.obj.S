Module: outp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000                            outp_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  89 C3                             mov             ebx,eax
0004  89 D1                             mov             ecx,edx
0006  89 C2                             mov             edx,eax
0008  88 C8                             mov             al,cl
000A  EE                                out             dx,al
000B  59                                pop             ecx
000C  5B                                pop             ebx
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

