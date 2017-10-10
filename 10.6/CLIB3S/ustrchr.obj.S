Module: ustrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000                            _ustrchr:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0007  8B 5D 10                          mov             ebx,dword ptr 0x10[ebp]
000A                            L$1:
000A  66 3B 1A                          cmp             bx,word ptr [edx]
000D  75 05                             jne             L$2
000F  89 D0                             mov             eax,edx
0011  5D                                pop             ebp
0012  5B                                pop             ebx
0013  C3                                ret
0014                            L$2:
0014  89 D0                             mov             eax,edx
0016  42                                inc             edx
0017  42                                inc             edx
0018  66 83 38 00                       cmp             word ptr [eax],0x0000
001C  75 EC                             jne             L$1
001E  31 C0                             xor             eax,eax
0020  5D                                pop             ebp
0021  5B                                pop             ebx
0022  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

