Module: statwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000021C bytes
0000                            at2mode:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  F6 45 0C 10                       test            byte ptr 0xc[ebp],0x10
0008  74 07                             je              L$1
000A  BB 49 40 00 00                    mov             ebx,0x00004049
000F  EB 2E                             jmp             L$2
0011                            L$1:
0011  6A 2E                             push            0x0000002e
0013  FF 75 10                          push            dword ptr 0x10[ebp]
0016  BB 00 80 00 00                    mov             ebx,0x00008000
001B  E8 00 00 00 00                    call            strchr
0020  83 C4 08                          add             esp,0x00000008
0023  85 C0                             test            eax,eax
0025  74 18                             je              L$2
0027  68 00 00 00 00                    push            offset DGROUP:L$14
002C  40                                inc             eax
002D  50                                push            eax
002E  E8 00 00 00 00                    call            strcmp
0033  83 C4 08                          add             esp,0x00000008
0036  85 C0                             test            eax,eax
0038  75 05                             jne             L$2
003A  BB 49 80 00 00                    mov             ebx,0x00008049
003F                            L$2:
003F  66 81 CB 24 01                    or              bx,0x0124
0044  F6 45 0C 01                       test            byte ptr 0xc[ebp],0x01
0048  75 03                             jne             L$3
004A  80 CB 92                          or              bl,0x92
004D                            L$3:
004D  89 D8                             mov             eax,ebx
004F  5D                                pop             ebp
0050  5B                                pop             ebx
0051  C3                                ret

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

0052                            _stat:
0052  55                                push            ebp
0053  89 E5                             mov             ebp,esp
0055  FF 75 0C                          push            dword ptr 0xc[ebp]
0058  FF 75 08                          push            dword ptr 0x8[ebp]
005B  E8 00 00 00 00                    call            stat
0060  83 C4 08                          add             esp,0x00000008
0063  5D                                pop             ebp
0064  C3                                ret

Routine Size: 19 bytes,    Routine Base: _TEXT + 0052

0065                            stat:
0065  53                                push            ebx
0066  56                                push            esi
0067  C8 4C 02 00                       enter           0x024c,0x00
006B  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
006E  8B 5D 14                          mov             ebx,dword ptr 0x14[ebp]
0071  80 3E 00                          cmp             byte ptr [esi],0x00
0074  74 12                             je              L$4
0076  68 04 00 00 00                    push            offset DGROUP:L$15
007B  56                                push            esi
007C  E8 00 00 00 00                    call            strpbrk
0081  83 C4 08                          add             esp,0x00000008
0084  85 C0                             test            eax,eax
0086  74 13                             je              L$5
0088                            L$4:
0088  6A 01                             push            0x00000001
008A  E8 00 00 00 00                    call            __set_errno
008F  B8 FF FF FF FF                    mov             eax,0xffffffff
0094  83 C4 04                          add             esp,0x00000004
0097  C9                                leave
0098  5E                                pop             esi
0099  5B                                pop             ebx
009A  C3                                ret
009B                            L$5:
009B  68 04 01 00 00                    push            0x00000104
00A0  8D 85 F4 FE FF FF                 lea             eax,-0x10c[ebp]
00A6  50                                push            eax
00A7  E8 00 00 00 00                    call            getcwd
00AC  83 C4 08                          add             esp,0x00000008
00AF  89 F0                             mov             eax,esi
00B1  80 7E 01 3A                       cmp             byte ptr 0x1[esi],0x3a
00B5  75 03                             jne             L$6
00B7  8D 46 02                          lea             eax,0x2[esi]
00BA                            L$6:
00BA  80 38 5C                          cmp             byte ptr [eax],0x5c
00BD  74 05                             je              L$7
00BF  80 38 2F                          cmp             byte ptr [eax],0x2f
00C2  75 4D                             jne             L$9
00C4                            L$7:
00C4  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
00C8  75 47                             jne             L$9
00CA  56                                push            esi
00CB  E8 00 00 00 00                    call            chdir
00D0  83 C4 04                          add             esp,0x00000004
00D3  85 C0                             test            eax,eax
00D5  74 09                             je              L$8
00D7  B8 FF FF FF FF                    mov             eax,0xffffffff
00DC  C9                                leave
00DD  5E                                pop             esi
00DE  5B                                pop             ebx
00DF  C3                                ret
00E0                            L$8:
00E0  8D 85 F4 FE FF FF                 lea             eax,-0x10c[ebp]
00E6  50                                push            eax
00E7  E8 00 00 00 00                    call            chdir
00EC  83 C4 04                          add             esp,0x00000004
00EF  68 3E 01 00 00                    push            0x0000013e
00F4  6A 00                             push            0x00000000
00F6  8D 85 B4 FD FF FF                 lea             eax,-0x24c[ebp]
00FC  50                                push            eax
00FD  E8 00 00 00 00                    call            memset
0102  C7 85 B4 FD FF FF 10 00 00 00
                                        mov             dword ptr -0x24c[ebp],0x00000010
010C  83 C4 0C                          add             esp,0x0000000c
010F  EB 21                             jmp             L$11
0111                            L$9:
0111  8D 85 B4 FD FF FF                 lea             eax,-0x24c[ebp]
0117  50                                push            eax
0118  56                                push            esi
0119  E8 00 00 00 00                    call            _FindFirstFileA
011E  83 F8 FF                          cmp             eax,0xffffffff
0121  75 09                             jne             L$10
0123  E8 00 00 00 00                    call            __set_errno_nt
0128  C9                                leave
0129  5E                                pop             esi
012A  5B                                pop             ebx
012B  C3                                ret
012C                            L$10:
012C  50                                push            eax
012D  E8 00 00 00 00                    call            _FindClose
0132                            L$11:
0132  80 7E 01 3A                       cmp             byte ptr 0x1[esi],0x3a
0136  75 05                             jne             L$12
0138  0F B6 06                          movzx           eax,byte ptr [esi]
013B  EB 07                             jmp             L$13
013D                            L$12:
013D  0F B6 85 F4 FE FF FF              movzx           eax,byte ptr -0x10c[ebp]
0144                            L$13:
0144  50                                push            eax
0145  E8 00 00 00 00                    call            tolower
014A  83 E8 61                          sub             eax,0x00000061
014D  83 C4 04                          add             esp,0x00000004
0150  89 03                             mov             dword ptr [ebx],eax
0152  FF 0B                             dec             dword ptr [ebx]
0154  8B 03                             mov             eax,dword ptr [ebx]
0156  89 43 12                          mov             dword ptr 0x12[ebx],eax
0159  8B 85 D4 FD FF FF                 mov             eax,dword ptr -0x22c[ebp]
015F  89 43 16                          mov             dword ptr 0x16[ebx],eax
0162  8D 85 E0 FD FF FF                 lea             eax,-0x220[ebp]
0168  50                                push            eax
0169  FF B5 B4 FD FF FF                 push            dword ptr -0x24c[ebp]
016F  E8 00 00 00 00                    call            at2mode
0174  83 C4 08                          add             esp,0x00000008
0177  66 89 43 08                       mov             word ptr 0x8[ebx],ax
017B  8D 45 FC                          lea             eax,-0x4[ebp]
017E  50                                push            eax
017F  8D 45 F8                          lea             eax,-0x8[ebp]
0182  50                                push            eax
0183  8D 85 B8 FD FF FF                 lea             eax,-0x248[ebp]
0189  50                                push            eax
018A  E8 00 00 00 00                    call            __MakeDOSDT
018F  83 C4 0C                          add             esp,0x0000000c
0192  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
0196  50                                push            eax
0197  0F B7 45 F8                       movzx           eax,word ptr -0x8[ebp]
019B  50                                push            eax
019C  E8 00 00 00 00                    call            _d2ttime
01A1  83 C4 08                          add             esp,0x00000008
01A4  89 43 22                          mov             dword ptr 0x22[ebx],eax
01A7  8D 45 FC                          lea             eax,-0x4[ebp]
01AA  50                                push            eax
01AB  8D 45 F8                          lea             eax,-0x8[ebp]
01AE  50                                push            eax
01AF  8D 85 C0 FD FF FF                 lea             eax,-0x240[ebp]
01B5  50                                push            eax
01B6  E8 00 00 00 00                    call            __MakeDOSDT
01BB  83 C4 0C                          add             esp,0x0000000c
01BE  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
01C2  50                                push            eax
01C3  0F B7 45 F8                       movzx           eax,word ptr -0x8[ebp]
01C7  50                                push            eax
01C8  E8 00 00 00 00                    call            _d2ttime
01CD  83 C4 08                          add             esp,0x00000008
01D0  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
01D3  8D 45 FC                          lea             eax,-0x4[ebp]
01D6  50                                push            eax
01D7  8D 45 F8                          lea             eax,-0x8[ebp]
01DA  50                                push            eax
01DB  8D 85 C8 FD FF FF                 lea             eax,-0x238[ebp]
01E1  50                                push            eax
01E2  E8 00 00 00 00                    call            __MakeDOSDT
01E7  83 C4 0C                          add             esp,0x0000000c
01EA  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
01EE  50                                push            eax
01EF  0F B7 45 F8                       movzx           eax,word ptr -0x8[ebp]
01F3  50                                push            eax
01F4  E8 00 00 00 00                    call            _d2ttime
01F9  66 C7 43 10 00 00                 mov             word ptr 0x10[ebx],0x0000
01FF  89 43 1E                          mov             dword ptr 0x1e[ebx],eax
0202  66 8B 43 10                       mov             ax,word ptr 0x10[ebx]
0206  66 C7 43 0A 01 00                 mov             word ptr 0xa[ebx],0x0001
020C  98                                cwde
020D  89 43 0C                          mov             dword ptr 0xc[ebx],eax
0210  83 C4 08                          add             esp,0x00000008
0213  89 43 04                          mov             dword ptr 0x4[ebx],eax
0216  31 C0                             xor             eax,eax
0218  C9                                leave
0219  5E                                pop             esi
021A  5B                                pop             ebx
021B  C3                                ret

Routine Size: 439 bytes,    Routine Base: _TEXT + 0065

No disassembly errors

Segment: CONST DWORD USE32 00000007 bytes
0000                            L$14:
0000  45 58 45 00                                     EXE.
0004                            L$15:
0004  2A 3F 00                                        *?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

