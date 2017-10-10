Module: tmpfl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F3 bytes
0000                            tmpfile:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 20                          sub             esp,0x00000020
0007  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
000D  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
0010  31 FF                             xor             edi,edi
0012                            L$1:
0012  57                                push            edi
0013  8D 44 24 04                       lea             eax,0x4[esp]
0017  50                                push            eax
0018  E8 00 00 00 00                    call            __MkTmpFile
001D  83 C4 08                          add             esp,0x00000008
0020  6A 02                             push            0x00000002
0022  8D 44 24 04                       lea             eax,0x4[esp]
0026  50                                push            eax
0027  47                                inc             edi
0028  E8 00 00 00 00                    call            access
002D  83 C4 08                          add             esp,0x00000008
0030  85 C0                             test            eax,eax
0032  74 DE                             je              L$1
0034  68 00 00 00 00                    push            offset DGROUP:L$8
0039  8D 44 24 04                       lea             eax,0x4[esp]
003D  50                                push            eax
003E  E8 00 00 00 00                    call            fopen
0043  83 C4 08                          add             esp,0x00000008
0046  85 C0                             test            eax,eax
0048  75 11                             jne             L$3
004A  E8 00 00 00 00                    call            __get_errno_ptr
004F  83 38 0B                          cmp             dword ptr [eax],0x0000000b
0052  75 BE                             jne             L$1
0054                            L$2:
0054  31 C0                             xor             eax,eax
0056  E9 90 00 00 00                    jmp             L$7
005B                            L$3:
005B  50                                push            eax
005C  31 DB                             xor             ebx,ebx
005E  E8 00 00 00 00                    call            fclose
0063  8A 1D 00 00 00 00                 mov             bl,byte ptr __tmpfnext
0069  83 C4 04                          add             esp,0x00000004
006C                            L$4:
006C  53                                push            ebx
006D  8D 44 24 14                       lea             eax,0x14[esp]
0071  50                                push            eax
0072  E8 00 00 00 00                    call            __MkTmpFile
0077  83 C4 08                          add             esp,0x00000008
007A  8D 44 24 10                       lea             eax,0x10[esp]
007E  50                                push            eax
007F  8D 44 24 04                       lea             eax,0x4[esp]
0083  50                                push            eax
0084  E8 00 00 00 00                    call            rename
0089  83 C4 08                          add             esp,0x00000008
008C  85 C0                             test            eax,eax
008E  75 41                             jne             L$6
0090  68 00 00 00 00                    push            offset DGROUP:L$8
0095  8D 44 24 14                       lea             eax,0x14[esp]
0099  50                                push            eax
009A  E8 00 00 00 00                    call            fopen
009F  89 C6                             mov             esi,eax
00A1  83 C4 08                          add             esp,0x00000008
00A4  85 C0                             test            eax,eax
00A6  74 1F                             je              L$5
00A8  8A 60 0D                          mov             ah,byte ptr 0xd[eax]
00AB  55                                push            ebp
00AC  80 CC 08                          or              ah,0x08
00AF  88 5E 19                          mov             byte ptr 0x19[esi],bl
00B2  88 1D 00 00 00 00                 mov             byte ptr __tmpfnext,bl
00B8  88 66 0D                          mov             byte ptr 0xd[esi],ah
00BB  E8 00 00 00 00                    call            __set_errno
00C0  83 C4 04                          add             esp,0x00000004
00C3  89 F0                             mov             eax,esi
00C5  EB 24                             jmp             L$7
00C7                            L$5:
00C7  E8 00 00 00 00                    call            __get_errno_ptr
00CC  83 38 0B                          cmp             dword ptr [eax],0x0000000b
00CF  74 83                             je              L$2
00D1                            L$6:
00D1  6A 02                             push            0x00000002
00D3  8D 44 24 04                       lea             eax,0x4[esp]
00D7  50                                push            eax
00D8  43                                inc             ebx
00D9  E8 00 00 00 00                    call            access
00DE  83 C4 08                          add             esp,0x00000008
00E1  85 C0                             test            eax,eax
00E3  0F 85 29 FF FF FF                 jne             L$1
00E9  EB 81                             jmp             L$4
00EB                            L$7:
00EB  83 C4 20                          add             esp,0x00000020
00EE  5D                                pop             ebp
00EF  5F                                pop             edi
00F0  5E                                pop             esi
00F1  5B                                pop             ebx
00F2  C3                                ret

Routine Size: 243 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$8:
0000  77 62 2B 00                                     wb+.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

