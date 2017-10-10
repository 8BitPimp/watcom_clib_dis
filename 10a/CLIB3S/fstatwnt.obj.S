Module: fstatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001AF bytes
0000                            _fstat:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
000A  53                                push            ebx
000B  E8 00 00 00 00                    call            fstat
0010  83 C4 08                          add             esp,0x00000008
0013  5B                                pop             ebx
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015                            fstat:
0015  53                                push            ebx
0016  56                                push            esi
0017  57                                push            edi
0018  83 EC 24                          sub             esp,0x00000024
001B  8B 74 24 34                       mov             esi,dword ptr 0x34[esp]
001F  8B 5C 24 38                       mov             ebx,dword ptr 0x38[esp]
0023  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0028  89 F7                             mov             edi,esi
002A  56                                push            esi
002B  8B 3C B8                          mov             edi,dword ptr [eax+edi*4]
002E  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0034  83 C4 04                          add             esp,0x00000004
0037  56                                push            esi
0038  66 C7 43 08 00 00                 mov             word ptr 0x8[ebx],0x0000
003E  E8 00 00 00 00                    call            __IOMode
0043  83 C4 04                          add             esp,0x00000004
0046  89 44 24 18                       mov             dword ptr 0x18[esp],eax
004A  A8 01                             test            al,0x01
004C  74 06                             je              L$1
004E  66 81 4B 08 24 01                 or              word ptr 0x8[ebx],0x0124
0054                            L$1:
0054  F6 44 24 18 02                    test            byte ptr 0x18[esp],0x02
0059  74 04                             je              L$2
005B  80 4B 08 92                       or              byte ptr 0x8[ebx],0x92
005F                            L$2:
005F  57                                push            edi
0060  E8 00 00 00 00                    call            _GetFileType
0065  F6 44 24 19 20                    test            byte ptr 0x19[esp],0x20
006A  75 0E                             jne             L$3
006C  83 F8 02                          cmp             eax,0x00000002
006F  74 09                             je              L$3
0071  83 F8 03                          cmp             eax,0x00000003
0074  74 04                             je              L$3
0076  85 C0                             test            eax,eax
0078  75 2C                             jne             L$4
007A                            L$3:
007A  C7 43 16 00 00 00 00              mov             dword ptr 0x16[ebx],0x00000000
0081  C7 43 1E 00 00 00 00              mov             dword ptr 0x1e[ebx],0x00000000
0088  66 C7 43 08 24 21                 mov             word ptr 0x8[ebx],0x2124
008E  C7 43 12 01 00 00 00              mov             dword ptr 0x12[ebx],0x00000001
0095  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0098  89 43 22                          mov             dword ptr 0x22[ebx],eax
009B  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
009E  8B 43 12                          mov             eax,dword ptr 0x12[ebx]
00A1  E9 DD 00 00 00                    jmp             L$7
00A6                            L$4:
00A6  6A 00                             push            0x00000000
00A8  57                                push            edi
00A9  E8 00 00 00 00                    call            _GetFileSize
00AE  83 F8 FF                          cmp             eax,0xffffffff
00B1  75 14                             jne             L$6
00B3                            L$5:
00B3  56                                push            esi
00B4  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00BA  83 C4 04                          add             esp,0x00000004
00BD  E8 00 00 00 00                    call            __set_errno_nt
00C2  E9 E1 00 00 00                    jmp             L$8
00C7                            L$6:
00C7  89 43 16                          mov             dword ptr 0x16[ebx],eax
00CA  8D 44 24 10                       lea             eax,0x10[esp]
00CE  50                                push            eax
00CF  8D 44 24 0C                       lea             eax,0xc[esp]
00D3  50                                push            eax
00D4  8D 44 24 08                       lea             eax,0x8[esp]
00D8  50                                push            eax
00D9  57                                push            edi
00DA  E8 00 00 00 00                    call            _GetFileTime
00DF  85 C0                             test            eax,eax
00E1  74 D0                             je              L$5
00E3  8D 44 24 20                       lea             eax,0x20[esp]
00E7  50                                push            eax
00E8  8D 44 24 20                       lea             eax,0x20[esp]
00EC  50                                push            eax
00ED  8D 44 24 08                       lea             eax,0x8[esp]
00F1  50                                push            eax
00F2  E8 00 00 00 00                    call            __MakeDOSDT
00F7  83 C4 0C                          add             esp,0x0000000c
00FA  31 C0                             xor             eax,eax
00FC  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0101  50                                push            eax
0102  31 C0                             xor             eax,eax
0104  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0109  50                                push            eax
010A  E8 00 00 00 00                    call            _d2ttime
010F  83 C4 08                          add             esp,0x00000008
0112  89 43 22                          mov             dword ptr 0x22[ebx],eax
0115  8D 44 24 20                       lea             eax,0x20[esp]
0119  50                                push            eax
011A  8D 44 24 20                       lea             eax,0x20[esp]
011E  50                                push            eax
011F  8D 44 24 10                       lea             eax,0x10[esp]
0123  50                                push            eax
0124  E8 00 00 00 00                    call            __MakeDOSDT
0129  83 C4 0C                          add             esp,0x0000000c
012C  31 C0                             xor             eax,eax
012E  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0133  50                                push            eax
0134  31 C0                             xor             eax,eax
0136  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
013B  50                                push            eax
013C  E8 00 00 00 00                    call            _d2ttime
0141  83 C4 08                          add             esp,0x00000008
0144  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
0147  8D 44 24 20                       lea             eax,0x20[esp]
014B  50                                push            eax
014C  8D 44 24 20                       lea             eax,0x20[esp]
0150  50                                push            eax
0151  8D 44 24 18                       lea             eax,0x18[esp]
0155  50                                push            eax
0156  E8 00 00 00 00                    call            __MakeDOSDT
015B  83 C4 0C                          add             esp,0x0000000c
015E  31 C0                             xor             eax,eax
0160  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0165  50                                push            eax
0166  31 C0                             xor             eax,eax
0168  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
016D  50                                push            eax
016E  E8 00 00 00 00                    call            _d2ttime
0173  C7 43 12 00 00 00 00              mov             dword ptr 0x12[ebx],0x00000000
017A  89 43 1E                          mov             dword ptr 0x1e[ebx],eax
017D  8B 43 12                          mov             eax,dword ptr 0x12[ebx]
0180  83 C4 08                          add             esp,0x00000008
0183                            L$7:
0183  89 03                             mov             dword ptr [ebx],eax
0185  56                                push            esi
0186  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
018C  66 C7 43 0A 01 00                 mov             word ptr 0xa[ebx],0x0001
0192  66 C7 43 10 00 00                 mov             word ptr 0x10[ebx],0x0000
0198  66 8B 43 10                       mov             ax,word ptr 0x10[ebx]
019C  89 73 04                          mov             dword ptr 0x4[ebx],esi
019F  98                                cwde
01A0  83 C4 04                          add             esp,0x00000004
01A3  89 43 0C                          mov             dword ptr 0xc[ebx],eax
01A6  31 C0                             xor             eax,eax
01A8                            L$8:
01A8  83 C4 24                          add             esp,0x00000024
01AB  5F                                pop             edi
01AC  5E                                pop             esi
01AD  5B                                pop             ebx
01AE  C3                                ret

Routine Size: 410 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

