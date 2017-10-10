Module: jislower
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000                            jislower:
0000  31 C0                             xor             eax,eax
0002  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0007  3D 81 82 00 00                    cmp             eax,0x00008281
000C  7C 0D                             jl              L$1
000E  3D 9A 82 00 00                    cmp             eax,0x0000829a
0013  7F 06                             jg              L$1
0015  B8 01 00 00 00                    mov             eax,0x00000001
001A  C3                                ret
001B                            L$1:
001B  31 C0                             xor             eax,eax
001D  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

