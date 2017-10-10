Module: jisl0
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000                            jisl0:
0000  53                                push            ebx
0001  31 DB                             xor             ebx,ebx
0003  66 8B 5C 24 08                    mov             bx,word ptr 0x8[esp]
0008  53                                push            ebx
0009  E8 00 00 00 00                    call            jiszen
000E  83 C4 04                          add             esp,0x00000004
0011  85 C0                             test            eax,eax
0013  74 0F                             je              L$1
0015  81 FB 9E 88 00 00                 cmp             ebx,0x0000889e
001B  7F 07                             jg              L$1
001D  B8 01 00 00 00                    mov             eax,0x00000001
0022  5B                                pop             ebx
0023  C3                                ret
0024                            L$1:
0024  31 C0                             xor             eax,eax
0026  5B                                pop             ebx
0027  C3                                ret

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

