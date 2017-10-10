Module: swab
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000                            swab:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0009  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000D  D1 FB                             sar             ebx,0x01
000F  EB 11                             jmp             L$2
0011                            L$1:
0011  4B                                dec             ebx
0012  8A 48 01                          mov             cl,byte ptr 0x1[eax]
0015  8A 28                             mov             ch,byte ptr [eax]
0017  88 0A                             mov             byte ptr [edx],cl
0019  83 C0 02                          add             eax,0x00000002
001C  88 6A 01                          mov             byte ptr 0x1[edx],ch
001F  83 C2 02                          add             edx,0x00000002
0022                            L$2:
0022  85 DB                             test            ebx,ebx
0024  75 EB                             jne             L$1
0026  5B                                pop             ebx
0027  C3                                ret

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

