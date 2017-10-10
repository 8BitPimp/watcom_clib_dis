Module: readwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000                            _dos_read_:
0000  56                                push            esi
0001  57                                push            edi
0002  89 C6                             mov             esi,eax
0004  89 C7                             mov             edi,eax
0006  A1 00 00 00 00                    mov             eax,dword ptr ___FileHandleIDs
000B  8B 3C B8                          mov             edi,dword ptr [eax+edi*4]
000E  89 F0                             mov             eax,esi
0010  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0016  6A 00                             push            0x00000000
0018  51                                push            ecx
0019  53                                push            ebx
001A  52                                push            edx
001B  57                                push            edi
001C  E8 00 00 00 00                    call            _ReadFile
0021  85 C0                             test            eax,eax
0023  75 10                             jne             L$1
0025  89 F0                             mov             eax,esi
0027  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
002D  E8 00 00 00 00                    call            __set_errno_nt_
0032  5F                                pop             edi
0033  5E                                pop             esi
0034  C3                                ret
0035                            L$1:
0035  89 F0                             mov             eax,esi
0037  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
003D  31 C0                             xor             eax,eax
003F  5F                                pop             edi
0040  5E                                pop             esi
0041  C3                                ret

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

