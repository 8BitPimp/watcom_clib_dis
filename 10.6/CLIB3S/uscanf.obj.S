Module: uscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000                            cget_stdin:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0007  68 00 00 00 00                    push            offset __iob
000C  E8 00 00 00 00                    call            _ugetc
0011  83 C4 04                          add             esp,0x00000004
0014  89 C2                             mov             edx,eax
0016  83 F8 FF                          cmp             eax,0xffffffff
0019  75 04                             jne             L$1
001B  80 4B 10 02                       or              byte ptr 0x10[ebx],0x02
001F                            L$1:
001F  89 D0                             mov             eax,edx
0021  5D                                pop             ebp
0022  5B                                pop             ebx
0023  C3                                ret
0024                            uncget_stdin:
0024  55                                push            ebp
0025  89 E5                             mov             ebp,esp
0027  68 00 00 00 00                    push            offset __iob
002C  FF 75 08                          push            dword ptr 0x8[ebp]
002F  E8 00 00 00 00                    call            _uungetc
0034  83 C4 08                          add             esp,0x00000008
0037  5D                                pop             ebp
0038  C3                                ret

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

0039                            _uvscanf:
0039  C8 14 00 00                       enter           0x0014,0x00
003D  FF 75 0C                          push            dword ptr 0xc[ebp]
0040  FF 75 08                          push            dword ptr 0x8[ebp]
0043  8D 45 EC                          lea             eax,-0x14[ebp]
0046  50                                push            eax
0047  C7 45 EC 00 00 00 00              mov             dword ptr -0x14[ebp],offset cget_stdin
004E  C7 45 F0 00 00 00 00              mov             dword ptr -0x10[ebp],offset uncget_stdin
0055  E8 00 00 00 00                    call            __uscnf
005A  83 C4 0C                          add             esp,0x0000000c
005D  C9                                leave
005E  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0039

005F                            _uscanf:
005F  C8 04 00 00                       enter           0x0004,0x00
0063  8D 45 0C                          lea             eax,0xc[ebp]
0066  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0069  8D 45 FC                          lea             eax,-0x4[ebp]
006C  50                                push            eax
006D  FF 75 08                          push            dword ptr 0x8[ebp]
0070  E8 00 00 00 00                    call            _uvscanf
0075  83 C4 08                          add             esp,0x00000008
0078  C9                                leave
0079  C3                                ret

Routine Size: 27 bytes,    Routine Base: _TEXT + 005F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

