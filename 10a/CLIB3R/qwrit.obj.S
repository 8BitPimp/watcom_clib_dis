Module: qwrit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009A bytes
0000                            __qwrite_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  89 C6                             mov             esi,eax
0009  89 D7                             mov             edi,edx
000B  8B 2D 00 00 00 00                 mov             ebp,dword ptr ___FileHandleIDs
0011  8B 6C 85 00                       mov             ebp,dword ptr [ebp+eax*4]
0015  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
001B  89 F0                             mov             eax,esi
001D  E8 00 00 00 00                    call            __IOMode_
0022  A8 80                             test            al,0x80
0024  74 20                             je              L$2
0026  6A 02                             push            0x00000002
0028  6A 00                             push            0x00000000
002A  6A 00                             push            0x00000000
002C  55                                push            ebp
002D  E8 00 00 00 00                    call            _SetFilePointer
0032  83 F8 FF                          cmp             eax,0xffffffff
0035  75 0F                             jne             L$2
0037                            L$1:
0037  89 F0                             mov             eax,esi
0039  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
003F  E8 00 00 00 00                    call            __set_errno_nt_
0044  EB 4C                             jmp             L$5
0046                            L$2:
0046  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsStdout,0x00000000
004D  74 16                             je              L$3
004F  89 F0                             mov             eax,esi
0051  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
0057  85 C0                             test            eax,eax
0059  74 0A                             je              L$3
005B  89 FA                             mov             edx,edi
005D  FF 15 00 00 00 00                 call            dword ptr __WindowsStdout
0063  EB 2D                             jmp             L$5
0065                            L$3:
0065  6A 00                             push            0x00000000
0067  8D 44 24 04                       lea             eax,0x4[esp]
006B  50                                push            eax
006C  53                                push            ebx
006D  57                                push            edi
006E  55                                push            ebp
006F  E8 00 00 00 00                    call            _WriteFile
0074  85 C0                             test            eax,eax
0076  74 BF                             je              L$1
0078  3B 1C 24                          cmp             ebx,dword ptr [esp]
007B  74 0A                             je              L$4
007D  B8 0C 00 00 00                    mov             eax,0x0000000c
0082  E8 00 00 00 00                    call            __set_errno_
0087                            L$4:
0087  89 F0                             mov             eax,esi
0089  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
008F  8B 04 24                          mov             eax,dword ptr [esp]
0092                            L$5:
0092  83 C4 04                          add             esp,0x00000004
0095  5D                                pop             ebp
0096  5F                                pop             edi
0097  5E                                pop             esi
0098  59                                pop             ecx
0099  C3                                ret

Routine Size: 154 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

