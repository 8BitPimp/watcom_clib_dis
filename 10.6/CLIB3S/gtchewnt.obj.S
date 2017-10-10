Module: gtchewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000026 bytes
0000                            getche:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 35 00 00 00 00                 mov             esi,dword ptr _cbyte
0008  E8 00 00 00 00                    call            getch
000D  89 C3                             mov             ebx,eax
000F  83 F8 FF                          cmp             eax,0xffffffff
0012  74 0D                             je              L$1
0014  85 F6                             test            esi,esi
0016  75 09                             jne             L$1
0018  50                                push            eax
0019  E8 00 00 00 00                    call            putch
001E  83 C4 04                          add             esp,0x00000004
0021                            L$1:
0021  89 D8                             mov             eax,ebx
0023  5E                                pop             esi
0024  5B                                pop             ebx
0025  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

