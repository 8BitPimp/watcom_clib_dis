Module: strchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            strchr:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8A 5C 24 0C                       mov             bl,byte ptr 0xc[esp]
0009                            L$1:
0009  3A 18                             cmp             bl,byte ptr [eax]
000B  74 0B                             je              L$2
000D  89 C2                             mov             edx,eax
000F  8A 3A                             mov             bh,byte ptr [edx]
0011  40                                inc             eax
0012  84 FF                             test            bh,bh
0014  75 F3                             jne             L$1
0016  31 C0                             xor             eax,eax
0018                            L$2:
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

