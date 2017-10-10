Module: ustrcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000                            _ustrcpy:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 55 10                          mov             edx,dword ptr 0x10[ebp]
0007  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
000A                            L$1:
000A  66 8B 1A                          mov             bx,word ptr [edx]
000D  42                                inc             edx
000E  42                                inc             edx
000F  66 89 18                          mov             word ptr [eax],bx
0012  40                                inc             eax
0013  40                                inc             eax
0014  66 85 DB                          test            bx,bx
0017  75 F1                             jne             L$1
0019  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
001C  5D                                pop             ebp
001D  5B                                pop             ebx
001E  C3                                ret

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

