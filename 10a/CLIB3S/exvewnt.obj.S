Module: exvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003E bytes
0000                            execve:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  FF 75 14                          push            dword ptr 0x14[ebp]
0007  FF 75 10                          push            dword ptr 0x10[ebp]
000A  FF 75 0C                          push            dword ptr 0xc[ebp]
000D  6A 00                             push            0x00000000
000F  E8 00 00 00 00                    call            spawnve
0014  83 C4 10                          add             esp,0x00000010
0017  89 C3                             mov             ebx,eax
0019  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
001F  83 78 04 00                       cmp             dword ptr 0x4[eax],0x00000000
0023  74 08                             je              L$1
0025  B8 FF FF FF FF                    mov             eax,0xffffffff
002A  5D                                pop             ebp
002B  5B                                pop             ebx
002C  C3                                ret
002D                            L$1:
002D  FF 15 00 00 00 00                 call            dword ptr __int23_exit
0033  53                                push            ebx
0034  E8 00 00 00 00                    call            _ExitProcess
0039  31 C0                             xor             eax,eax
003B  5D                                pop             ebp
003C  5B                                pop             ebx
003D  C3                                ret

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

