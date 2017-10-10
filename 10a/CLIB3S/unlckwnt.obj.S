Module: unlckwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000                            unlock:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0006  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
000B  89 F3                             mov             ebx,esi
000D  56                                push            esi
000E  8B 1C 98                          mov             ebx,dword ptr [eax+ebx*4]
0011  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0017  83 C4 04                          add             esp,0x00000004
001A  6A 00                             push            0x00000000
001C  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0020  52                                push            edx
0021  6A 00                             push            0x00000000
0023  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
0027  51                                push            ecx
0028  53                                push            ebx
0029  E8 00 00 00 00                    call            _UnlockFile
002E  85 C0                             test            eax,eax
0030  75 12                             jne             L$1
0032  56                                push            esi
0033  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0039  83 C4 04                          add             esp,0x00000004
003C  E8 00 00 00 00                    call            __set_errno_nt
0041  5E                                pop             esi
0042  5B                                pop             ebx
0043  C3                                ret
0044                            L$1:
0044  56                                push            esi
0045  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
004B  83 C4 04                          add             esp,0x00000004
004E  31 C0                             xor             eax,eax
0050  5E                                pop             esi
0051  5B                                pop             ebx
0052  C3                                ret

Routine Size: 83 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

