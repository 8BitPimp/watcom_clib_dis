Module: iobaddr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000                            __get_std_stream:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  83 FA 05                          cmp             edx,0x00000005
0007  76 03                             jbe             L$1
0009  31 C0                             xor             eax,eax
000B  C3                                ret
000C                            L$1:
000C  89 D0                             mov             eax,edx
000E  C1 E0 02                          shl             eax,0x02
0011  29 D0                             sub             eax,edx
0013  C1 E0 02                          shl             eax,0x02
0016  01 D0                             add             eax,edx
0018  01 C0                             add             eax,eax
001A  05 00 00 00 00                    add             eax,offset __iob
001F  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

