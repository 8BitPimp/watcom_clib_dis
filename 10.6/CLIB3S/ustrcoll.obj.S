Module: ustrcoll
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000                            _ustrcoll:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0009  EB 10                             jmp             L$3
000B                            L$1:
000B  66 83 38 00                       cmp             word ptr [eax],0x0000
000F  75 04                             jne             L$2
0011  31 C0                             xor             eax,eax
0013  5B                                pop             ebx
0014  C3                                ret
0015                            L$2:
0015  83 C0 02                          add             eax,0x00000002
0018  83 C2 02                          add             edx,0x00000002
001B                            L$3:
001B  66 8B 18                          mov             bx,word ptr [eax]
001E  66 8B 0A                          mov             cx,word ptr [edx]
0021  66 39 CB                          cmp             bx,cx
0024  74 E5                             je              L$1
0026  31 DB                             xor             ebx,ebx
0028  66 8B 18                          mov             bx,word ptr [eax]
002B  31 C0                             xor             eax,eax
002D  66 89 C8                          mov             ax,cx
0030  29 C3                             sub             ebx,eax
0032  89 D8                             mov             eax,ebx
0034  5B                                pop             ebx
0035  C3                                ret

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

