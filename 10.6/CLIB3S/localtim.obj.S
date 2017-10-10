Module: localtim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006E bytes
0000                            _localtime:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0006  E8 00 00 00 00                    call            tzset
000B  53                                push            ebx
000C  8B 15 00 00 00 00                 mov             edx,dword ptr timezone
0012  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0016  52                                push            edx
0017  8B 36                             mov             esi,dword ptr [esi]
0019  56                                push            esi
001A  68 DF 63 00 00                    push            0x000063df
001F  E8 00 00 00 00                    call            __brktime
0024  83 C4 10                          add             esp,0x00000010
0027  53                                push            ebx
0028  E8 00 00 00 00                    call            __isindst
002D  83 C4 04                          add             esp,0x00000004
0030  85 C0                             test            eax,eax
0032  74 1D                             je              L$1
0034  A1 00 00 00 00                    mov             eax,dword ptr timezone
0039  8B 0D 00 00 00 00                 mov             ecx,dword ptr __dst_adjust
003F  53                                push            ebx
0040  29 C8                             sub             eax,ecx
0042  50                                push            eax
0043  56                                push            esi
0044  68 DF 63 00 00                    push            0x000063df
0049  E8 00 00 00 00                    call            __brktime
004E  83 C4 10                          add             esp,0x00000010
0051                            L$1:
0051  89 D8                             mov             eax,ebx
0053  5E                                pop             esi
0054  5B                                pop             ebx
0055  C3                                ret

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

0056                            localtime:
0056  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
005C  83 C0 14                          add             eax,0x00000014
005F  50                                push            eax
0060  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0064  52                                push            edx
0065  E8 00 00 00 00                    call            _localtime
006A  83 C4 08                          add             esp,0x00000008
006D  C3                                ret

Routine Size: 24 bytes,    Routine Base: _TEXT + 0056

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

