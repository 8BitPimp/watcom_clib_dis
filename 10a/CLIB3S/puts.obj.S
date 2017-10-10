Module: puts
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000                            puts:
0000  53                                push            ebx
0001  68 1A 00 00 00                    push            offset __iob+0x1a
0006  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
000A  52                                push            edx
000B  E8 00 00 00 00                    call            fputs
0010  89 C3                             mov             ebx,eax
0012  83 C4 08                          add             esp,0x00000008
0015  83 F8 FF                          cmp             eax,0xffffffff
0018  74 17                             je              L$1
001A  68 1A 00 00 00                    push            offset __iob+0x1a
001F  6A 0A                             push            0x0000000a
0021  E8 00 00 00 00                    call            fputc
0026  83 C4 08                          add             esp,0x00000008
0029  83 F8 0A                          cmp             eax,0x0000000a
002C  75 03                             jne             L$1
002E  8D 43 01                          lea             eax,0x1[ebx]
0031                            L$1:
0031  5B                                pop             ebx
0032  C3                                ret

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

