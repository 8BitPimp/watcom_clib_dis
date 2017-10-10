Module: cprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000061 bytes
0000                            con_putc:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  31 C0                             xor             eax,eax
0007  8A 44 24 0C                       mov             al,byte ptr 0xc[esp]
000B  50                                push            eax
000C  E8 00 00 00 00                    call            putch
0011  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0014  42                                inc             edx
0015  83 C4 04                          add             esp,0x00000004
0018  89 53 10                          mov             dword ptr 0x10[ebx],edx
001B  5B                                pop             ebx
001C  C3                                ret

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

001D                            vcprintf:
001D  53                                push            ebx
001E  68 00 00 00 00                    push            offset con_putc
0023  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0027  52                                push            edx
0028  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
002C  53                                push            ebx
002D  6A 00                             push            0x00000000
002F  E8 00 00 00 00                    call            __prtf
0034  83 C4 10                          add             esp,0x00000010
0037  5B                                pop             ebx
0038  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 001D

0039                            cprintf:
0039  83 EC 04                          sub             esp,0x00000004
003C  8D 44 24 0C                       lea             eax,0xc[esp]
0040  68 00 00 00 00                    push            offset con_putc
0045  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0049  8D 44 24 04                       lea             eax,0x4[esp]
004D  50                                push            eax
004E  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0052  52                                push            edx
0053  6A 00                             push            0x00000000
0055  E8 00 00 00 00                    call            __prtf
005A  83 C4 10                          add             esp,0x00000010
005D  83 C4 04                          add             esp,0x00000004
0060  C3                                ret

Routine Size: 40 bytes,    Routine Base: _TEXT + 0039

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

