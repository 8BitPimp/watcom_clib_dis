Module: mbstowcs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000                            mbstowcs:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
0008  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000C  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
0010  31 ED                             xor             ebp,ebp
0012  EB 1C                             jmp             L$2
0014                            L$1:
0014  6A 02                             push            0x00000002
0016  53                                push            ebx
0017  56                                push            esi
0018  E8 00 00 00 00                    call            mbtowc
001D  83 C4 0C                          add             esp,0x0000000c
0020  83 F8 FF                          cmp             eax,0xffffffff
0023  74 11                             je              L$4
0025  85 C0                             test            eax,eax
0027  74 0B                             je              L$3
0029  83 C6 02                          add             esi,0x00000002
002C  45                                inc             ebp
002D  4F                                dec             edi
002E  01 C3                             add             ebx,eax
0030                            L$2:
0030  85 FF                             test            edi,edi
0032  75 E0                             jne             L$1
0034                            L$3:
0034  89 E8                             mov             eax,ebp
0036                            L$4:
0036  5D                                pop             ebp
0037  5F                                pop             edi
0038  5E                                pop             esi
0039  5B                                pop             ebx
003A  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

