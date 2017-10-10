Module: time
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000                            time:
0000  53                                push            ebx
0001  83 EC 24                          sub             esp,0x00000024
0004  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0008  89 E0                             mov             eax,esp
000A  50                                push            eax
000B  E8 00 00 00 00                    call            __getctime
0010  83 C4 04                          add             esp,0x00000004
0013  3D F4 01 00 00                    cmp             eax,0x000001f4
0018  7C 03                             jl              L$1
001A  FF 04 24                          inc             dword ptr [esp]
001D                            L$1:
001D  89 E0                             mov             eax,esp
001F  50                                push            eax
0020  E8 00 00 00 00                    call            mktime
0025  83 C4 04                          add             esp,0x00000004
0028  89 C2                             mov             edx,eax
002A  85 DB                             test            ebx,ebx
002C  74 02                             je              L$2
002E  89 03                             mov             dword ptr [ebx],eax
0030                            L$2:
0030  89 D0                             mov             eax,edx
0032  83 C4 24                          add             esp,0x00000024
0035  5B                                pop             ebx
0036  C3                                ret

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

