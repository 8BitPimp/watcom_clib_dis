Module: fstatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000232 bytes
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
0018  83 EC 2C                          sub             esp,0x0000002c
001B  8B 74 24 3C                       mov             esi,dword ptr 0x3c[esp]
001F  8B 5C 24 40                       mov             ebx,dword ptr 0x40[esp]
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
0078  75 29                             jne             L$4
007A                            L$3:
007A  C7 43 16 00 00 00 00              mov             dword ptr 0x16[ebx],0x00000000
0081  C7 43 1E 00 00 00 00              mov             dword ptr 0x1e[ebx],0x00000000
0088  66 C7 43 08 24 21                 mov             word ptr 0x8[ebx],0x2124
008E  C7 43 12 01 00 00 00              mov             dword ptr 0x12[ebx],0x00000001
0095  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0098  89 43 22                          mov             dword ptr 0x22[ebx],eax
009B  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
009E  E9 37 01 00 00                    jmp             L$15
00A3                            L$4:
00A3  6A 00                             push            0x00000000
00A5  57                                push            edi
00A6  E8 00 00 00 00                    call            _GetFileSize
00AB  83 F8 FF                          cmp             eax,0xffffffff
00AE  75 14                             jne             L$6
00B0                            L$5:
00B0  56                                push            esi
00B1  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00B7  83 C4 04                          add             esp,0x00000004
00BA  E8 00 00 00 00                    call            __set_errno_nt
00BF  E9 67 01 00 00                    jmp             L$16
00C4                            L$6:
00C4  89 43 16                          mov             dword ptr 0x16[ebx],eax
00C7  8D 44 24 10                       lea             eax,0x10[esp]
00CB  50                                push            eax
00CC  8D 44 24 0C                       lea             eax,0xc[esp]
00D0  50                                push            eax
00D1  8D 44 24 08                       lea             eax,0x8[esp]
00D5  50                                push            eax
00D6  57                                push            edi
00D7  E8 00 00 00 00                    call            _GetFileTime
00DC  85 C0                             test            eax,eax
00DE  74 D0                             je              L$5
00E0  8D 44 24 24                       lea             eax,0x24[esp]
00E4  50                                push            eax
00E5  8D 44 24 24                       lea             eax,0x24[esp]
00E9  50                                push            eax
00EA  8D 44 24 18                       lea             eax,0x18[esp]
00EE  50                                push            eax
00EF  E8 00 00 00 00                    call            __MakeDOSDT
00F4  83 C4 0C                          add             esp,0x0000000c
00F7  31 C0                             xor             eax,eax
00F9  66 8B 44 24 24                    mov             ax,word ptr 0x24[esp]
00FE  50                                push            eax
00FF  31 C0                             xor             eax,eax
0101  66 8B 44 24 24                    mov             ax,word ptr 0x24[esp]
0106  50                                push            eax
0107  E8 00 00 00 00                    call            _d2ttime
010C  83 C4 08                          add             esp,0x00000008
010F  89 43 1E                          mov             dword ptr 0x1e[ebx],eax
0112  8B 04 24                          mov             eax,dword ptr [esp]
0115  3B 44 24 10                       cmp             eax,dword ptr 0x10[esp]
0119  75 0F                             jne             L$8
011B  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
011F  3B 44 24 14                       cmp             eax,dword ptr 0x14[esp]
0123  75 05                             jne             L$8
0125                            L$7:
0125  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0128  EB 45                             jmp             L$10
012A                            L$8:
012A  8D 44 24 28                       lea             eax,0x28[esp]
012E  50                                push            eax
012F  8D 44 24 20                       lea             eax,0x20[esp]
0133  50                                push            eax
0134  8D 44 24 08                       lea             eax,0x8[esp]
0138  50                                push            eax
0139  E8 00 00 00 00                    call            __MakeDOSDT
013E  83 C4 0C                          add             esp,0x0000000c
0141  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0145  66 3B 44 24 20                    cmp             ax,word ptr 0x20[esp]
014A  75 0B                             jne             L$9
014C  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
0150  66 3B 44 24 24                    cmp             ax,word ptr 0x24[esp]
0155  74 CE                             je              L$7
0157                            L$9:
0157  31 C0                             xor             eax,eax
0159  66 8B 44 24 28                    mov             ax,word ptr 0x28[esp]
015E  50                                push            eax
015F  31 C0                             xor             eax,eax
0161  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0166  50                                push            eax
0167  E8 00 00 00 00                    call            _d2ttime
016C  83 C4 08                          add             esp,0x00000008
016F                            L$10:
016F  89 43 22                          mov             dword ptr 0x22[ebx],eax
0172  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0176  3B 44 24 10                       cmp             eax,dword ptr 0x10[esp]
017A  75 0F                             jne             L$12
017C  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0180  3B 44 24 14                       cmp             eax,dword ptr 0x14[esp]
0184  75 05                             jne             L$12
0186                            L$11:
0186  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0189  EB 45                             jmp             L$14
018B                            L$12:
018B  8D 44 24 28                       lea             eax,0x28[esp]
018F  50                                push            eax
0190  8D 44 24 20                       lea             eax,0x20[esp]
0194  50                                push            eax
0195  8D 44 24 10                       lea             eax,0x10[esp]
0199  50                                push            eax
019A  E8 00 00 00 00                    call            __MakeDOSDT
019F  83 C4 0C                          add             esp,0x0000000c
01A2  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
01A6  66 3B 44 24 20                    cmp             ax,word ptr 0x20[esp]
01AB  75 0B                             jne             L$13
01AD  8B 44 24 28                       mov             eax,dword ptr 0x28[esp]
01B1  66 3B 44 24 24                    cmp             ax,word ptr 0x24[esp]
01B6  74 CE                             je              L$11
01B8                            L$13:
01B8  31 C0                             xor             eax,eax
01BA  66 8B 44 24 28                    mov             ax,word ptr 0x28[esp]
01BF  50                                push            eax
01C0  31 C0                             xor             eax,eax
01C2  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
01C7  50                                push            eax
01C8  E8 00 00 00 00                    call            _d2ttime
01CD  83 C4 08                          add             esp,0x00000008
01D0                            L$14:
01D0  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
01D3  C7 43 12 00 00 00 00              mov             dword ptr 0x12[ebx],0x00000000
01DA                            L$15:
01DA  8B 43 12                          mov             eax,dword ptr 0x12[ebx]
01DD  89 03                             mov             dword ptr [ebx],eax
01DF  56                                push            esi
01E0  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
01E6  66 C7 43 0A 01 00                 mov             word ptr 0xa[ebx],0x0001
01EC  66 C7 43 10 00 00                 mov             word ptr 0x10[ebx],0x0000
01F2  C7 43 2A 00 00 00 00              mov             dword ptr 0x2a[ebx],0x00000000
01F9  C7 43 2E 00 00 00 00              mov             dword ptr 0x2e[ebx],0x00000000
0200  C7 43 32 00 00 00 00              mov             dword ptr 0x32[ebx],0x00000000
0207  66 C7 43 36 00 00                 mov             word ptr 0x36[ebx],0x0000
020D  C6 43 38 00                       mov             byte ptr 0x38[ebx],0x00
0211  C6 43 39 00                       mov             byte ptr 0x39[ebx],0x00
0215  66 8B 43 10                       mov             ax,word ptr 0x10[ebx]
0219  89 73 04                          mov             dword ptr 0x4[ebx],esi
021C  98                                cwde
021D  89 43 0C                          mov             dword ptr 0xc[ebx],eax
0220  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0223  83 C4 04                          add             esp,0x00000004
0226  89 43 26                          mov             dword ptr 0x26[ebx],eax
0229  31 C0                             xor             eax,eax
022B                            L$16:
022B  83 C4 2C                          add             esp,0x0000002c
022E  5F                                pop             edi
022F  5E                                pop             esi
0230  5B                                pop             ebx
0231  C3                                ret

Routine Size: 541 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

