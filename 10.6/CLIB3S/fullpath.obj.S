Module: fullpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000092 bytes
0000                            _fullpath:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000B  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000F  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0013  85 DB                             test            ebx,ebx
0015  75 24                             jne             L$3
0017  BF 04 01 00 00                    mov             edi,0x00000104
001C  57                                push            edi
001D  E8 00 00 00 00                    call            malloc
0022  83 C4 04                          add             esp,0x00000004
0025  89 C5                             mov             ebp,eax
0027  85 C0                             test            eax,eax
0029  75 0E                             jne             L$2
002B  6A 05                             push            0x00000005
002D                            L$1:
002D  E8 00 00 00 00                    call            __set_errno
0032  83 C4 04                          add             esp,0x00000004
0035  31 C0                             xor             eax,eax
0037  EB 51                             jmp             L$9
0039                            L$2:
0039  89 C3                             mov             ebx,eax
003B                            L$3:
003B  85 F6                             test            esi,esi
003D  74 05                             je              L$4
003F  80 3E 00                          cmp             byte ptr [esi],0x00
0042  75 0C                             jne             L$5
0044                            L$4:
0044  57                                push            edi
0045  53                                push            ebx
0046  E8 00 00 00 00                    call            getcwd
004B  83 C4 08                          add             esp,0x00000008
004E  EB 3A                             jmp             L$9
0050                            L$5:
0050  68 00 00 00 00                    push            offset DGROUP:L$10
0055  56                                push            esi
0056  E8 00 00 00 00                    call            stricmp
005B  83 C4 08                          add             esp,0x00000008
005E  85 C0                             test            eax,eax
0060  75 1B                             jne             L$7
0062  83 FF 04                          cmp             edi,0x00000004
0065  73 0D                             jae             L$6
0067  55                                push            ebp
0068  E8 00 00 00 00                    call            free
006D  83 C4 04                          add             esp,0x00000004
0070  6A 0E                             push            0x0000000e
0072  EB B9                             jmp             L$1
0074                            L$6:
0074  A1 00 00 00 00                    mov             eax,dword ptr DGROUP:L$10
0079  89 03                             mov             dword ptr [ebx],eax
007B  EB 0B                             jmp             L$8
007D                            L$7:
007D  89 E0                             mov             eax,esp
007F  50                                push            eax
0080  53                                push            ebx
0081  57                                push            edi
0082  56                                push            esi
0083  E8 00 00 00 00                    call            _GetFullPathNameA
0088                            L$8:
0088  89 D8                             mov             eax,ebx
008A                            L$9:
008A  83 C4 04                          add             esp,0x00000004
008D  5D                                pop             ebp
008E  5F                                pop             edi
008F  5E                                pop             esi
0090  5B                                pop             ebx
0091  C3                                ret

Routine Size: 146 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$10:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

