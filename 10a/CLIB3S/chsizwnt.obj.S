Module: chsizwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000                            chsize:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
000B  89 DE                             mov             esi,ebx
000D  53                                push            ebx
000E  8B 34 B0                          mov             esi,dword ptr [eax+esi*4]
0011  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0017  83 C4 04                          add             esp,0x00000004
001A  6A 00                             push            0x00000000
001C  6A 00                             push            0x00000000
001E  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0022  52                                push            edx
0023  56                                push            esi
0024  E8 00 00 00 00                    call            _SetFilePointer
0029  83 F8 FF                          cmp             eax,0xffffffff
002C  75 12                             jne             L$2
002E                            L$1:
002E  53                                push            ebx
002F  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0035  83 C4 04                          add             esp,0x00000004
0038  E8 00 00 00 00                    call            __set_errno_nt
003D  5E                                pop             esi
003E  5B                                pop             ebx
003F  C3                                ret
0040                            L$2:
0040  56                                push            esi
0041  E8 00 00 00 00                    call            _SetEndOfFile
0046  85 C0                             test            eax,eax
0048  74 E4                             je              L$1
004A  53                                push            ebx
004B  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0051  83 C4 04                          add             esp,0x00000004
0054  31 C0                             xor             eax,eax
0056  5E                                pop             esi
0057  5B                                pop             ebx
0058  C3                                ret

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

