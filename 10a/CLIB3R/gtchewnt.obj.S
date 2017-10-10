Module: gtchewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000026 bytes
0000                            getche_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  8B 0D 00 00 00 00                 mov             ecx,dword ptr __cbyte
0009  E8 00 00 00 00                    call            getch_
000E  89 C2                             mov             edx,eax
0010  89 C3                             mov             ebx,eax
0012  83 F8 FF                          cmp             eax,0xffffffff
0015  74 09                             je              L$1
0017  85 C9                             test            ecx,ecx
0019  75 05                             jne             L$1
001B  E8 00 00 00 00                    call            putch_
0020                            L$1:
0020  89 D8                             mov             eax,ebx
0022  5A                                pop             edx
0023  59                                pop             ecx
0024  5B                                pop             ebx
0025  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

