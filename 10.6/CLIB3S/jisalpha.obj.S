Module: jisalpha
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000                            jisalpha:
0000  53                                push            ebx
0001  31 DB                             xor             ebx,ebx
0003  66 8B 5C 24 08                    mov             bx,word ptr 0x8[esp]
0008  53                                push            ebx
0009  E8 00 00 00 00                    call            jisupper
000E  83 C4 04                          add             esp,0x00000004
0011  85 C0                             test            eax,eax
0013  75 0D                             jne             L$1
0015  53                                push            ebx
0016  E8 00 00 00 00                    call            jislower
001B  83 C4 04                          add             esp,0x00000004
001E  85 C0                             test            eax,eax
0020  74 05                             je              L$2
0022                            L$1:
0022  B8 01 00 00 00                    mov             eax,0x00000001
0027                            L$2:
0027  5B                                pop             ebx
0028  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

