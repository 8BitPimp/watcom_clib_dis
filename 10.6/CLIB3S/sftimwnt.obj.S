Module: sftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
0000                            _dos_setftime:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 18                          sub             esp,0x00000018
0005  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0009  56                                push            esi
000A  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0010  8B 1D 00 00 00 00                 mov             ebx,dword ptr __FileHandleIDs
0016  89 F0                             mov             eax,esi
0018  83 C4 04                          add             esp,0x00000004
001B  8B 1C 83                          mov             ebx,dword ptr [ebx+eax*4]
001E  8D 44 24 10                       lea             eax,0x10[esp]
0022  50                                push            eax
0023  8D 44 24 04                       lea             eax,0x4[esp]
0027  50                                push            eax
0028  8D 44 24 10                       lea             eax,0x10[esp]
002C  50                                push            eax
002D  53                                push            ebx
002E  E8 00 00 00 00                    call            _GetFileTime
0033  85 C0                             test            eax,eax
0035  75 11                             jne             L$2
0037                            L$1:
0037  56                                push            esi
0038  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
003E  83 C4 04                          add             esp,0x00000004
0041  E8 00 00 00 00                    call            __set_errno_nt
0046  EB 34                             jmp             L$3
0048                            L$2:
0048  8D 44 24 10                       lea             eax,0x10[esp]
004C  50                                push            eax
004D  31 C0                             xor             eax,eax
004F  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
0054  50                                push            eax
0055  31 C0                             xor             eax,eax
0057  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
005C  50                                push            eax
005D  E8 00 00 00 00                    call            __FromDOSDT
0062  83 C4 0C                          add             esp,0x0000000c
0065  8D 44 24 10                       lea             eax,0x10[esp]
0069  50                                push            eax
006A  50                                push            eax
006B  8D 44 24 10                       lea             eax,0x10[esp]
006F  50                                push            eax
0070  53                                push            ebx
0071  E8 00 00 00 00                    call            _SetFileTime
0076  85 C0                             test            eax,eax
0078  74 BD                             je              L$1
007A  31 C0                             xor             eax,eax
007C                            L$3:
007C  83 C4 18                          add             esp,0x00000018
007F  5E                                pop             esi
0080  5B                                pop             ebx
0081  C3                                ret

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

