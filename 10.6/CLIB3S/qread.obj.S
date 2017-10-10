Module: qread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009D bytes
0000                            __qread:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000B  53                                push            ebx
000C  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0012  8B 15 00 00 00 00                 mov             edx,dword ptr _WindowsStdin
0018  83 C4 04                          add             esp,0x00000004
001B  85 D2                             test            edx,edx
001D  74 32                             je              L$1
001F  53                                push            ebx
0020  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0026  83 C4 04                          add             esp,0x00000004
0029  85 C0                             test            eax,eax
002B  74 24                             je              L$1
002D  8B 6C 24 20                       mov             ebp,dword ptr 0x20[esp]
0031  55                                push            ebp
0032  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0036  52                                push            edx
0037  50                                push            eax
0038  FF 15 00 00 00 00                 call            dword ptr _WindowsStdin
003E  83 C4 0C                          add             esp,0x0000000c
0041  53                                push            ebx
0042  89 C6                             mov             esi,eax
0044  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
004A  83 C4 04                          add             esp,0x00000004
004D  89 F0                             mov             eax,esi
004F  EB 44                             jmp             L$3
0051                            L$1:
0051  8B 35 00 00 00 00                 mov             esi,dword ptr __FileHandleIDs
0057  89 D8                             mov             eax,ebx
0059  6A 00                             push            0x00000000
005B  8B 34 86                          mov             esi,dword ptr [esi+eax*4]
005E  8D 44 24 04                       lea             eax,0x4[esp]
0062  50                                push            eax
0063  8B 4C 24 28                       mov             ecx,dword ptr 0x28[esp]
0067  51                                push            ecx
0068  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
006C  57                                push            edi
006D  56                                push            esi
006E  E8 00 00 00 00                    call            _ReadFile
0073  85 C0                             test            eax,eax
0075  75 11                             jne             L$2
0077  53                                push            ebx
0078  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
007E  83 C4 04                          add             esp,0x00000004
0081  E8 00 00 00 00                    call            __set_errno_nt
0086  EB 0D                             jmp             L$3
0088                            L$2:
0088  53                                push            ebx
0089  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
008F  83 C4 04                          add             esp,0x00000004
0092  8B 04 24                          mov             eax,dword ptr [esp]
0095                            L$3:
0095  83 C4 04                          add             esp,0x00000004
0098  5D                                pop             ebp
0099  5F                                pop             edi
009A  5E                                pop             esi
009B  5B                                pop             ebx
009C  C3                                ret

Routine Size: 157 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

