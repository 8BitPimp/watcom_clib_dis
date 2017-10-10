Module: ustrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            _ustrcmp:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0007  8B 55 10                          mov             edx,dword ptr 0x10[ebp]
000A  EB 0E                             jmp             L$3
000C                            L$1:
000C  66 85 DB                          test            bx,bx
000F  75 05                             jne             L$2
0011  31 C0                             xor             eax,eax
0013  5D                                pop             ebp
0014  5B                                pop             ebx
0015  C3                                ret
0016                            L$2:
0016  40                                inc             eax
0017  40                                inc             eax
0018  42                                inc             edx
0019  42                                inc             edx
001A                            L$3:
001A  66 8B 18                          mov             bx,word ptr [eax]
001D  66 3B 1A                          cmp             bx,word ptr [edx]
0020  74 EA                             je              L$1
0022  0F B7 C3                          movzx           eax,bx
0025  0F B7 12                          movzx           edx,word ptr [edx]
0028  29 D0                             sub             eax,edx
002A  5D                                pop             ebp
002B  5B                                pop             ebx
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

