Module: jperror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005D bytes
0000                            jperror:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  85 C0                             test            eax,eax
0006  74 25                             je              L$1
0008  80 38 00                          cmp             byte ptr [eax],0x00
000B  74 20                             je              L$1
000D  68 34 00 00 00                    push            offset __iob+0x34
0012  50                                push            eax
0013  E8 00 00 00 00                    call            fputs
0018  83 C4 08                          add             esp,0x00000008
001B  68 34 00 00 00                    push            offset __iob+0x34
0020  68 00 00 00 00                    push            offset DGROUP:L$2
0025  E8 00 00 00 00                    call            fputs
002A  83 C4 08                          add             esp,0x00000008
002D                            L$1:
002D  68 34 00 00 00                    push            offset __iob+0x34
0032  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0038  8B 50 04                          mov             edx,dword ptr 0x4[eax]
003B  52                                push            edx
003C  E8 00 00 00 00                    call            jstrerror
0041  83 C4 04                          add             esp,0x00000004
0044  50                                push            eax
0045  E8 00 00 00 00                    call            fputs
004A  83 C4 08                          add             esp,0x00000008
004D  68 34 00 00 00                    push            offset __iob+0x34
0052  6A 0A                             push            0x0000000a
0054  E8 00 00 00 00                    call            fputc
0059  83 C4 08                          add             esp,0x00000008
005C  C3                                ret

Routine Size: 93 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000                            L$2:
0000  3A 20 00                                        : .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

