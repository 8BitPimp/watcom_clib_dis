Module: _clsewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000                            __close:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
000B  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0010  89 EE                             mov             esi,ebp
0012  8B 15 00 00 00 00                 mov             edx,dword ptr _WindowsCloseWindow
0018  31 FF                             xor             edi,edi
001A  8B 04 B0                          mov             eax,dword ptr [eax+esi*4]
001D  31 DB                             xor             ebx,ebx
001F  89 04 24                          mov             dword ptr [esp],eax
0022  85 D2                             test            edx,edx
0024  74 29                             je              L$1
0026  55                                push            ebp
0027  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
002D  89 C6                             mov             esi,eax
002F  83 C4 04                          add             esp,0x00000004
0032  85 C0                             test            eax,eax
0034  74 19                             je              L$1
0036  55                                push            ebp
0037  FF 15 00 00 00 00                 call            dword ptr _WindowsRemoveWindowedHandle
003D  83 C4 04                          add             esp,0x00000004
0040  56                                push            esi
0041  BF 01 00 00 00                    mov             edi,0x00000001
0046  FF 15 00 00 00 00                 call            dword ptr _WindowsCloseWindow
004C  83 C4 04                          add             esp,0x00000004
004F                            L$1:
004F  85 FF                             test            edi,edi
0051  75 1E                             jne             L$2
0053  8B 0C 24                          mov             ecx,dword ptr [esp]
0056  51                                push            ecx
0057  E8 00 00 00 00                    call            _CloseHandle
005C  85 C0                             test            eax,eax
005E  75 11                             jne             L$2
0060  6A 04                             push            0x00000004
0062  BB FF FF FF FF                    mov             ebx,0xffffffff
0067  E8 00 00 00 00                    call            __set_errno
006C  83 C4 04                          add             esp,0x00000004
006F  EB 0B                             jmp             L$3
0071                            L$2:
0071  6A 00                             push            0x00000000
0073  55                                push            ebp
0074  E8 00 00 00 00                    call            __SetIOMode
0079  83 C4 08                          add             esp,0x00000008
007C                            L$3:
007C  89 D8                             mov             eax,ebx
007E  83 C4 04                          add             esp,0x00000004
0081  5D                                pop             ebp
0082  5F                                pop             edi
0083  5E                                pop             esi
0084  5B                                pop             ebx
0085  C3                                ret

Routine Size: 134 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

