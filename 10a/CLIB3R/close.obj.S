Module: close
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000                            close_:
0000  53                                push            ebx
0001  52                                push            edx
0002  89 C2                             mov             edx,eax
0004  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
000A  89 D0                             mov             eax,edx
000C  E8 00 00 00 00                    call            __close_
0011  89 C3                             mov             ebx,eax
0013  89 D0                             mov             eax,edx
0015  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
001B  89 D0                             mov             eax,edx
001D  FF 15 00 00 00 00                 call            dword ptr __FiniAccessH
0023  89 D8                             mov             eax,ebx
0025  5A                                pop             edx
0026  5B                                pop             ebx
0027  C3                                ret

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

