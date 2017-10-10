Module: ftell
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000                            ftell_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  89 C2                             mov             edx,eax
0006  8B 40 10                          mov             eax,dword ptr 0x10[eax]
0009  E8 00 00 00 00                    call            tell_
000E  89 C3                             mov             ebx,eax
0010  89 C1                             mov             ecx,eax
0012  83 F8 FF                          cmp             eax,0xffffffff
0015  74 26                             je              L$3
0017  8B 42 10                          mov             eax,dword ptr 0x10[edx]
001A  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0020  8B 72 04                          mov             esi,dword ptr 0x4[edx]
0023  85 F6                             test            esi,esi
0025  74 0D                             je              L$2
0027  F6 42 0D 10                       test            byte ptr 0xd[edx],0x10
002B  74 05                             je              L$1
002D  8D 0C 1E                          lea             ecx,[esi+ebx]
0030  EB 02                             jmp             L$2
0032                            L$1:
0032  29 F1                             sub             ecx,esi
0034                            L$2:
0034  8B 42 10                          mov             eax,dword ptr 0x10[edx]
0037  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
003D                            L$3:
003D  89 C8                             mov             eax,ecx
003F  5E                                pop             esi
0040  5A                                pop             edx
0041  59                                pop             ecx
0042  5B                                pop             ebx
0043  C3                                ret

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

