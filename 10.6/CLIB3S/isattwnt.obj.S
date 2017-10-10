Module: isattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000047 bytes
0000                            isatty:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0006  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
000C  89 F0                             mov             eax,esi
000E  56                                push            esi
000F  8B 1C 82                          mov             ebx,dword ptr [edx+eax*4]
0012  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0018  83 C4 04                          add             esp,0x00000004
001B  53                                push            ebx
001C  E8 00 00 00 00                    call            _GetFileType
0021  83 F8 02                          cmp             eax,0x00000002
0024  75 12                             jne             L$1
0026  56                                push            esi
0027  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
002D  B8 01 00 00 00                    mov             eax,0x00000001
0032  83 C4 04                          add             esp,0x00000004
0035  5E                                pop             esi
0036  5B                                pop             ebx
0037  C3                                ret
0038                            L$1:
0038  56                                push            esi
0039  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
003F  83 C4 04                          add             esp,0x00000004
0042  31 C0                             xor             eax,eax
0044  5E                                pop             esi
0045  5B                                pop             ebx
0046  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

