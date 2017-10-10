Module: putchwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000064 bytes
0000                            putch:
0000  53                                push            ebx
0001  83 EC 08                          sub             esp,0x00000008
0004  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0008  8B 15 00 00 00 00                 mov             edx,dword ptr _WindowsPutch
000E  88 5C 24 04                       mov             byte ptr 0x4[esp],bl
0012  85 D2                             test            edx,edx
0014  74 18                             je              L$1
0016  6A 01                             push            0x00000001
0018  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
001E  83 C4 04                          add             esp,0x00000004
0021  53                                push            ebx
0022  50                                push            eax
0023  FF 15 00 00 00 00                 call            dword ptr _WindowsPutch
0029  83 C4 08                          add             esp,0x00000008
002C  EB 2F                             jmp             L$2
002E                            L$1:
002E  6A 01                             push            0x00000001
0030  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0036  83 C4 04                          add             esp,0x00000004
0039  E8 00 00 00 00                    call            __NTConsoleOutput
003E  6A 00                             push            0x00000000
0040  8D 54 24 04                       lea             edx,0x4[esp]
0044  52                                push            edx
0045  6A 01                             push            0x00000001
0047  8D 54 24 10                       lea             edx,0x10[esp]
004B  52                                push            edx
004C  50                                push            eax
004D  E8 00 00 00 00                    call            _WriteConsoleA
0052  6A 01                             push            0x00000001
0054  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
005A  83 C4 04                          add             esp,0x00000004
005D                            L$2:
005D  89 D8                             mov             eax,ebx
005F  83 C4 08                          add             esp,0x00000008
0062  5B                                pop             ebx
0063  C3                                ret

Routine Size: 100 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

