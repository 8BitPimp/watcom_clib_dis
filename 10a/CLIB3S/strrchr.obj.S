Module: strrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000                            strrchr:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8A 4C 24 0C                       mov             cl,byte ptr 0xc[esp]
0009  31 DB                             xor             ebx,ebx
000B                            L$1:
000B  3A 08                             cmp             cl,byte ptr [eax]
000D  75 02                             jne             L$2
000F  89 C3                             mov             ebx,eax
0011                            L$2:
0011  89 C2                             mov             edx,eax
0013  8A 2A                             mov             ch,byte ptr [edx]
0015  40                                inc             eax
0016  84 ED                             test            ch,ch
0018  75 F1                             jne             L$1
001A  89 D8                             mov             eax,ebx
001C  5B                                pop             ebx
001D  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

