Module: nthdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E2 bytes
0000                            __NTAtMaxFiles:
0000  53                                push            ebx
0001  8B 0D 00 00 00 00                 mov             ecx,dword ptr __FileHandleIDs
0007  A1 00 00 00 00                    mov             eax,dword ptr topFileID
000C  3B 05 00 00 00 00                 cmp             eax,dword ptr __NFiles
0012  73 04                             jae             L$2
0014                            L$1:
0014  31 C0                             xor             eax,eax
0016  EB 21                             jmp             L$5
0018                            L$2:
0018  8B 1D 00 00 00 00                 mov             ebx,dword ptr topFileID
001E  31 C0                             xor             eax,eax
0020  C1 E3 02                          shl             ebx,0x02
0023  EB 0B                             jmp             L$4
0025                            L$3:
0025  89 CA                             mov             edx,ecx
0027  83 3C 02 00                       cmp             dword ptr [edx+eax],0x00000000
002B  74 E7                             je              L$1
002D  83 C0 04                          add             eax,0x00000004
0030                            L$4:
0030  39 D8                             cmp             eax,ebx
0032  7C F1                             jl              L$3
0034  B8 01 00 00 00                    mov             eax,0x00000001
0039                            L$5:
0039  89 0D 00 00 00 00                 mov             dword ptr __FileHandleIDs,ecx
003F  5B                                pop             ebx
0040  C3                                ret

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

0041                            __NTAddFileHandle:
0041  53                                push            ebx
0042  FF 15 00 00 00 00                 call            dword ptr _AccessFList
0048  8B 0D 00 00 00 00                 mov             ecx,dword ptr topFileID
004E  31 DB                             xor             ebx,ebx
0050  31 C0                             xor             eax,eax
0052  C1 E1 02                          shl             ecx,0x02
0055  EB 21                             jmp             L$8
0057                            L$6:
0057  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
005D  01 C2                             add             edx,eax
005F  83 3A 00                          cmp             dword ptr [edx],0x00000000
0062  75 10                             jne             L$7
0064  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0068  89 02                             mov             dword ptr [edx],eax
006A  FF 15 00 00 00 00                 call            dword ptr _ReleaseFList
0070  89 D8                             mov             eax,ebx
0072  5B                                pop             ebx
0073  C3                                ret
0074                            L$7:
0074  83 C0 04                          add             eax,0x00000004
0077  43                                inc             ebx
0078                            L$8:
0078  39 C8                             cmp             eax,ecx
007A  7C DB                             jl              L$6
007C  A1 00 00 00 00                    mov             eax,dword ptr topFileID
0081  40                                inc             eax
0082  C1 E0 02                          shl             eax,0x02
0085  50                                push            eax
0086  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
008C  52                                push            edx
008D  E8 00 00 00 00                    call            realloc
0092  8B 15 00 00 00 00                 mov             edx,dword ptr topFileID
0098  8B 1D 00 00 00 00                 mov             ebx,dword ptr topFileID
009E  83 C4 08                          add             esp,0x00000008
00A1  A3 00 00 00 00                    mov             dword ptr __FileHandleIDs,eax
00A6  C1 E2 02                          shl             edx,0x02
00A9  43                                inc             ebx
00AA  01 D0                             add             eax,edx
00AC  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00B0  89 1D 00 00 00 00                 mov             dword ptr topFileID,ebx
00B6  89 10                             mov             dword ptr [eax],edx
00B8  FF 15 00 00 00 00                 call            dword ptr _ReleaseFList
00BE  A1 00 00 00 00                    mov             eax,dword ptr topFileID
00C3  48                                dec             eax
00C4  5B                                pop             ebx
00C5  C3                                ret

Routine Size: 133 bytes,    Routine Base: _TEXT + 0041

00C6                            __NTAddSpecificFileHandle:
00C6  53                                push            ebx
00C7  56                                push            esi
00C8  57                                push            edi
00C9  55                                push            ebp
00CA  8B 6C 24 14                       mov             ebp,dword ptr 0x14[esp]
00CE  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
00D2  FF 15 00 00 00 00                 call            dword ptr _AccessFList
00D8  83 FE 01                          cmp             esi,0x00000001
00DB  72 09                             jb              L$9
00DD  76 10                             jbe             L$10
00DF  83 FE 02                          cmp             esi,0x00000002
00E2  74 10                             je              L$11
00E4  EB 16                             jmp             L$13
00E6                            L$9:
00E6  85 F6                             test            esi,esi
00E8  75 12                             jne             L$13
00EA  55                                push            ebp
00EB  6A F6                             push            0xfffffff6
00ED  EB 08                             jmp             L$12
00EF                            L$10:
00EF  55                                push            ebp
00F0  6A F5                             push            0xfffffff5
00F2  EB 03                             jmp             L$12
00F4                            L$11:
00F4  55                                push            ebp
00F5  6A F4                             push            0xfffffff4
00F7                            L$12:
00F7  E8 00 00 00 00                    call            _SetStdHandle
00FC                            L$13:
00FC  89 F7                             mov             edi,esi
00FE  8B 15 00 00 00 00                 mov             edx,dword ptr topFileID
0104  C1 E7 02                          shl             edi,0x02
0107  39 D6                             cmp             esi,edx
0109  7D 0A                             jge             L$14
010B  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0110  89 2C 07                          mov             dword ptr [edi+eax],ebp
0113  EB 4D                             jmp             L$17
0115                            L$14:
0115  8D 47 04                          lea             eax,0x4[edi]
0118  50                                push            eax
0119  8B 1D 00 00 00 00                 mov             ebx,dword ptr __FileHandleIDs
011F  53                                push            ebx
0120  E8 00 00 00 00                    call            realloc
0125  8B 1D 00 00 00 00                 mov             ebx,dword ptr topFileID
012B  83 C4 08                          add             esp,0x00000008
012E  A3 00 00 00 00                    mov             dword ptr __FileHandleIDs,eax
0133  89 D8                             mov             eax,ebx
0135  89 F9                             mov             ecx,edi
0137  C1 E0 02                          shl             eax,0x02
013A  EB 11                             jmp             L$16
013C                            L$15:
013C  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
0142  43                                inc             ebx
0143  C7 04 02 00 00 00 00              mov             dword ptr [edx+eax],0x00000000
014A  83 C0 04                          add             eax,0x00000004
014D                            L$16:
014D  39 C8                             cmp             eax,ecx
014F  7C EB                             jl              L$15
0151  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0156  89 F2                             mov             edx,esi
0158  46                                inc             esi
0159  89 2C 90                          mov             dword ptr [eax+edx*4],ebp
015C  89 35 00 00 00 00                 mov             dword ptr topFileID,esi
0162                            L$17:
0162  FF 15 00 00 00 00                 call            dword ptr _ReleaseFList
0168  5D                                pop             ebp
0169  5F                                pop             edi
016A  5E                                pop             esi
016B  5B                                pop             ebx
016C  C3                                ret

Routine Size: 167 bytes,    Routine Base: _TEXT + 00C6

016D                            __NTRemoveFileHandle:
016D  FF 15 00 00 00 00                 call            dword ptr _AccessFList
0173  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0177  3B 05 00 00 00 00                 cmp             eax,dword ptr topFileID
017D  7D 0D                             jge             L$18
017F  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
0185  C7 04 82 00 00 00 00              mov             dword ptr [edx+eax*4],0x00000000
018C                            L$18:
018C  FF 15 00 00 00 00                 call            dword ptr _ReleaseFList
0192  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 016D

0193                            __NTInitFileHandles:
0193  31 D2                             xor             edx,edx
0195  6A F6                             push            0xfffffff6
0197  89 15 00 00 00 00                 mov             dword ptr topFileID,edx
019D  89 15 00 00 00 00                 mov             dword ptr __FileHandleIDs,edx
01A3  E8 00 00 00 00                    call            _GetStdHandle
01A8  50                                push            eax
01A9  E8 00 00 00 00                    call            __NTAddFileHandle
01AE  83 C4 04                          add             esp,0x00000004
01B1  6A F5                             push            0xfffffff5
01B3  E8 00 00 00 00                    call            _GetStdHandle
01B8  50                                push            eax
01B9  E8 00 00 00 00                    call            __NTAddFileHandle
01BE  83 C4 04                          add             esp,0x00000004
01C1  6A F4                             push            0xfffffff4
01C3  E8 00 00 00 00                    call            _GetStdHandle
01C8  50                                push            eax
01C9  E8 00 00 00 00                    call            __NTAddFileHandle
01CE  83 C4 04                          add             esp,0x00000004
01D1  C3                                ret

Routine Size: 63 bytes,    Routine Base: _TEXT + 0193

01D2                            __NTGetFakeHandle:
01D2  8B 15 00 00 00 00                 mov             edx,dword ptr fakeHandle
01D8  42                                inc             edx
01D9  89 15 00 00 00 00                 mov             dword ptr fakeHandle,edx
01DF  89 D0                             mov             eax,edx
01E1  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 01D2

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000                            fakeHandle:
0000  00 00 00 80                                     ....

Segment: _BSS DWORD USE32 00000008 bytes
0000                            __FileHandleIDs:
0004                            topFileID:

BSS Size: 8 bytes

