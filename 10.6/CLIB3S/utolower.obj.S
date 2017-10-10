Module: utolower
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000                            _utolower:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006  83 F8 41                          cmp             eax,0x00000041
0009  7C 08                             jl              L$1
000B  83 F8 5A                          cmp             eax,0x0000005a
000E  7F 03                             jg              L$1
0010  83 C0 20                          add             eax,0x00000020
0013                            L$1:
0013  5D                                pop             ebp
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

