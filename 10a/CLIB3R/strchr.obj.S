Module: strchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000                            strchr_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  89 D3                             mov             ebx,edx
0004                            L$1:
0004  31 D2                             xor             edx,edx
0006  8A 10                             mov             dl,byte ptr [eax]
0008  39 DA                             cmp             edx,ebx
000A  74 0B                             je              L$2
000C  89 C2                             mov             edx,eax
000E  8A 0A                             mov             cl,byte ptr [edx]
0010  40                                inc             eax
0011  84 C9                             test            cl,cl
0013  75 EF                             jne             L$1
0015  31 C0                             xor             eax,eax
0017                            L$2:
0017  59                                pop             ecx
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

