Module: ustrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000                            _ustrncmp:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0007  8B 55 10                          mov             edx,dword ptr 0x10[ebp]
000A                            L$1:
000A  83 7D 14 00                       cmp             dword ptr 0x14[ebp],0x00000000
000E  75 05                             jne             L$3
0010                            L$2:
0010  31 C0                             xor             eax,eax
0012  5D                                pop             ebp
0013  5B                                pop             ebx
0014  C3                                ret
0015                            L$3:
0015  66 8B 18                          mov             bx,word ptr [eax]
0018  66 3B 1A                          cmp             bx,word ptr [edx]
001B  74 0B                             je              L$4
001D  0F B7 C3                          movzx           eax,bx
0020  0F B7 12                          movzx           edx,word ptr [edx]
0023  29 D0                             sub             eax,edx
0025  5D                                pop             ebp
0026  5B                                pop             ebx
0027  C3                                ret
0028                            L$4:
0028  66 85 DB                          test            bx,bx
002B  74 E3                             je              L$2
002D  FF 4D 14                          dec             dword ptr 0x14[ebp]
0030  40                                inc             eax
0031  40                                inc             eax
0032  42                                inc             edx
0033  42                                inc             edx
0034  EB D4                             jmp             L$1

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

