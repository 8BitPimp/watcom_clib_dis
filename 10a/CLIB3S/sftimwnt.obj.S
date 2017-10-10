Module: sftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000081 bytes
0000                            _dos_setftime:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 18                          sub             esp,0x00000018
0005  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0009  56                                push            esi
000A  89 F3                             mov             ebx,esi
000C  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0012  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0017  83 C4 04                          add             esp,0x00000004
001A  8B 1C 98                          mov             ebx,dword ptr [eax+ebx*4]
001D  8D 44 24 10                       lea             eax,0x10[esp]
0021  50                                push            eax
0022  8D 44 24 04                       lea             eax,0x4[esp]
0026  50                                push            eax
0027  8D 44 24 10                       lea             eax,0x10[esp]
002B  50                                push            eax
002C  53                                push            ebx
002D  E8 00 00 00 00                    call            _GetFileTime
0032  85 C0                             test            eax,eax
0034  75 11                             jne             L$2
0036                            L$1:
0036  56                                push            esi
0037  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
003D  83 C4 04                          add             esp,0x00000004
0040  E8 00 00 00 00                    call            __set_errno_nt
0045  EB 34                             jmp             L$3
0047                            L$2:
0047  8D 44 24 10                       lea             eax,0x10[esp]
004B  50                                push            eax
004C  31 C0                             xor             eax,eax
004E  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
0053  50                                push            eax
0054  31 C0                             xor             eax,eax
0056  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
005B  50                                push            eax
005C  E8 00 00 00 00                    call            __FromDOSDT
0061  83 C4 0C                          add             esp,0x0000000c
0064  8D 44 24 10                       lea             eax,0x10[esp]
0068  50                                push            eax
0069  50                                push            eax
006A  8D 44 24 10                       lea             eax,0x10[esp]
006E  50                                push            eax
006F  53                                push            ebx
0070  E8 00 00 00 00                    call            _SetFileTime
0075  85 C0                             test            eax,eax
0077  74 BD                             je              L$1
0079  31 C0                             xor             eax,eax
007B                            L$3:
007B  83 C4 18                          add             esp,0x00000018
007E  5E                                pop             esi
007F  5B                                pop             ebx
0080  C3                                ret

Routine Size: 129 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

