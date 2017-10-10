Module: statwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002E6 bytes
0000                            at2mode:
0000  53                                push            ebx
0001  56                                push            esi
0002  55                                push            ebp
0003  89 E5                             mov             ebp,esp
0005  31 DB                             xor             ebx,ebx
0007  F6 45 10 20                       test            byte ptr 0x10[ebp],0x20
000B  74 52                             je              L$5
000D  68 00 00 00 00                    push            offset DGROUP:L$23
0012  FF 75 14                          push            dword ptr 0x14[ebp]
0015  E8 00 00 00 00                    call            stricmp
001A  83 C4 08                          add             esp,0x00000008
001D  85 C0                             test            eax,eax
001F  75 07                             jne             L$1
0021  B8 04 00 00 00                    mov             eax,offset DGROUP:L$24
0026  EB 03                             jmp             L$2
0028                            L$1:
0028  8B 45 14                          mov             eax,dword ptr 0x14[ebp]
002B                            L$2:
002B  6A 00                             push            0x00000000
002D  6A 00                             push            0x00000000
002F  6A 03                             push            0x00000003
0031  6A 00                             push            0x00000000
0033  6A 00                             push            0x00000000
0035  6A 00                             push            0x00000000
0037  50                                push            eax
0038  E8 00 00 00 00                    call            _CreateFileA
003D  89 C6                             mov             esi,eax
003F  83 F8 FF                          cmp             eax,0xffffffff
0042  74 1B                             je              L$5
0044  50                                push            eax
0045  E8 00 00 00 00                    call            _GetFileType
004A  83 F8 02                          cmp             eax,0x00000002
004D  74 05                             je              L$3
004F  83 F8 03                          cmp             eax,0x00000003
0052  75 05                             jne             L$4
0054                            L$3:
0054  BB 00 20 00 00                    mov             ebx,0x00002000
0059                            L$4:
0059  56                                push            esi
005A  E8 00 00 00 00                    call            _CloseHandle
005F                            L$5:
005F  F6 45 10 10                       test            byte ptr 0x10[ebp],0x10
0063  74 07                             je              L$6
0065  66 81 CB 49 40                    or              bx,0x4049
006A  EB 2F                             jmp             L$7
006C                            L$6:
006C  F6 C7 20                          test            bh,0x20
006F  75 2A                             jne             L$7
0071  6A 2E                             push            0x0000002e
0073  FF 75 14                          push            dword ptr 0x14[ebp]
0076  80 CF 80                          or              bh,0x80
0079  E8 00 00 00 00                    call            strchr
007E  83 C4 08                          add             esp,0x00000008
0081  85 C0                             test            eax,eax
0083  74 16                             je              L$7
0085  68 0B 00 00 00                    push            offset DGROUP:L$25
008A  40                                inc             eax
008B  50                                push            eax
008C  E8 00 00 00 00                    call            strcmp
0091  83 C4 08                          add             esp,0x00000008
0094  85 C0                             test            eax,eax
0096  75 03                             jne             L$7
0098  80 CB 49                          or              bl,0x49
009B                            L$7:
009B  66 81 CB 24 01                    or              bx,0x0124
00A0  F6 45 10 01                       test            byte ptr 0x10[ebp],0x01
00A4  75 03                             jne             L$8
00A6  80 CB 92                          or              bl,0x92
00A9                            L$8:
00A9  89 D8                             mov             eax,ebx
00AB  5D                                pop             ebp
00AC  5E                                pop             esi
00AD  5B                                pop             ebx
00AE  C3                                ret

Routine Size: 175 bytes,    Routine Base: _TEXT + 0000

00AF                            _stat:
00AF  55                                push            ebp
00B0  89 E5                             mov             ebp,esp
00B2  FF 75 0C                          push            dword ptr 0xc[ebp]
00B5  FF 75 08                          push            dword ptr 0x8[ebp]
00B8  E8 00 00 00 00                    call            stat
00BD  83 C4 08                          add             esp,0x00000008
00C0  5D                                pop             ebp
00C1  C3                                ret

Routine Size: 19 bytes,    Routine Base: _TEXT + 00AF

00C2                            stat:
00C2  53                                push            ebx
00C3  56                                push            esi
00C4  C8 54 02 00                       enter           0x0254,0x00
00C8  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
00CB  8B 5D 14                          mov             ebx,dword ptr 0x14[ebp]
00CE  80 3E 00                          cmp             byte ptr [esi],0x00
00D1  74 12                             je              L$9
00D3  68 0F 00 00 00                    push            offset DGROUP:L$26
00D8  56                                push            esi
00D9  E8 00 00 00 00                    call            strpbrk
00DE  83 C4 08                          add             esp,0x00000008
00E1  85 C0                             test            eax,eax
00E3  74 13                             je              L$10
00E5                            L$9:
00E5  6A 01                             push            0x00000001
00E7  E8 00 00 00 00                    call            __set_errno
00EC  B8 FF FF FF FF                    mov             eax,0xffffffff
00F1  83 C4 04                          add             esp,0x00000004
00F4  C9                                leave
00F5  5E                                pop             esi
00F6  5B                                pop             ebx
00F7  C3                                ret
00F8                            L$10:
00F8  68 04 01 00 00                    push            0x00000104
00FD  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
0103  50                                push            eax
0104  E8 00 00 00 00                    call            getcwd
0109  83 C4 08                          add             esp,0x00000008
010C  0F B6 56 01                       movzx           edx,byte ptr 0x1[esi]
0110  89 F0                             mov             eax,esi
0112  83 FA 3A                          cmp             edx,0x0000003a
0115  75 03                             jne             L$11
0117  8D 46 02                          lea             eax,0x2[esi]
011A                            L$11:
011A  0F B6 10                          movzx           edx,byte ptr [eax]
011D  83 FA 5C                          cmp             edx,0x0000005c
0120  74 05                             je              L$12
0122  83 FA 2F                          cmp             edx,0x0000002f
0125  75 4D                             jne             L$14
0127                            L$12:
0127  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
012B  75 47                             jne             L$14
012D  56                                push            esi
012E  E8 00 00 00 00                    call            chdir
0133  83 C4 04                          add             esp,0x00000004
0136  85 C0                             test            eax,eax
0138  74 09                             je              L$13
013A  B8 FF FF FF FF                    mov             eax,0xffffffff
013F  C9                                leave
0140  5E                                pop             esi
0141  5B                                pop             ebx
0142  C3                                ret
0143                            L$13:
0143  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
0149  50                                push            eax
014A  E8 00 00 00 00                    call            chdir
014F  83 C4 04                          add             esp,0x00000004
0152  68 3E 01 00 00                    push            0x0000013e
0157  6A 00                             push            0x00000000
0159  8D 85 AC FD FF FF                 lea             eax,-0x254[ebp]
015F  50                                push            eax
0160  E8 00 00 00 00                    call            memset
0165  C7 85 AC FD FF FF 10 00 00 00
                                        mov             dword ptr -0x254[ebp],0x00000010
016F  83 C4 0C                          add             esp,0x0000000c
0172  EB 21                             jmp             L$16
0174                            L$14:
0174  8D 85 AC FD FF FF                 lea             eax,-0x254[ebp]
017A  50                                push            eax
017B  56                                push            esi
017C  E8 00 00 00 00                    call            _FindFirstFileA
0181  83 F8 FF                          cmp             eax,0xffffffff
0184  75 09                             jne             L$15
0186  E8 00 00 00 00                    call            __set_errno_nt
018B  C9                                leave
018C  5E                                pop             esi
018D  5B                                pop             ebx
018E  C3                                ret
018F                            L$15:
018F  50                                push            eax
0190  E8 00 00 00 00                    call            _FindClose
0195                            L$16:
0195  0F B6 46 01                       movzx           eax,byte ptr 0x1[esi]
0199  83 F8 3A                          cmp             eax,0x0000003a
019C  75 05                             jne             L$17
019E  0F B6 06                          movzx           eax,byte ptr [esi]
01A1  EB 07                             jmp             L$18
01A3                            L$17:
01A3  0F B6 85 EC FE FF FF              movzx           eax,byte ptr -0x114[ebp]
01AA                            L$18:
01AA  50                                push            eax
01AB  E8 00 00 00 00                    call            tolower
01B0  83 E8 61                          sub             eax,0x00000061
01B3  83 C4 04                          add             esp,0x00000004
01B6  89 03                             mov             dword ptr [ebx],eax
01B8  FF 0B                             dec             dword ptr [ebx]
01BA  8B 03                             mov             eax,dword ptr [ebx]
01BC  89 43 12                          mov             dword ptr 0x12[ebx],eax
01BF  8B 85 CC FD FF FF                 mov             eax,dword ptr -0x234[ebp]
01C5  89 43 16                          mov             dword ptr 0x16[ebx],eax
01C8  8D 85 D8 FD FF FF                 lea             eax,-0x228[ebp]
01CE  50                                push            eax
01CF  FF B5 AC FD FF FF                 push            dword ptr -0x254[ebp]
01D5  E8 00 00 00 00                    call            at2mode
01DA  83 C4 08                          add             esp,0x00000008
01DD  66 89 43 08                       mov             word ptr 0x8[ebx],ax
01E1  8D 45 F8                          lea             eax,-0x8[ebp]
01E4  50                                push            eax
01E5  8D 45 F0                          lea             eax,-0x10[ebp]
01E8  50                                push            eax
01E9  8D 85 C0 FD FF FF                 lea             eax,-0x240[ebp]
01EF  50                                push            eax
01F0  E8 00 00 00 00                    call            __MakeDOSDT
01F5  83 C4 0C                          add             esp,0x0000000c
01F8  0F B7 45 F8                       movzx           eax,word ptr -0x8[ebp]
01FC  50                                push            eax
01FD  0F B7 45 F0                       movzx           eax,word ptr -0x10[ebp]
0201  50                                push            eax
0202  E8 00 00 00 00                    call            _d2ttime
0207  83 C4 08                          add             esp,0x00000008
020A  89 43 1E                          mov             dword ptr 0x1e[ebx],eax
020D  8D 45 FC                          lea             eax,-0x4[ebp]
0210  50                                push            eax
0211  8D 45 F4                          lea             eax,-0xc[ebp]
0214  50                                push            eax
0215  8D 85 B0 FD FF FF                 lea             eax,-0x250[ebp]
021B  50                                push            eax
021C  E8 00 00 00 00                    call            __MakeDOSDT
0221  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0224  83 C4 0C                          add             esp,0x0000000c
0227  66 3B 45 F0                       cmp             ax,word ptr -0x10[ebp]
022B  75 0E                             jne             L$19
022D  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0230  66 3B 45 F8                       cmp             ax,word ptr -0x8[ebp]
0234  75 05                             jne             L$19
0236  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
0239  EB 12                             jmp             L$20
023B                            L$19:
023B  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
023F  50                                push            eax
0240  0F B7 45 F4                       movzx           eax,word ptr -0xc[ebp]
0244  50                                push            eax
0245  E8 00 00 00 00                    call            _d2ttime
024A  83 C4 08                          add             esp,0x00000008
024D                            L$20:
024D  89 43 22                          mov             dword ptr 0x22[ebx],eax
0250  8D 45 FC                          lea             eax,-0x4[ebp]
0253  50                                push            eax
0254  8D 45 F4                          lea             eax,-0xc[ebp]
0257  50                                push            eax
0258  8D 85 B8 FD FF FF                 lea             eax,-0x248[ebp]
025E  50                                push            eax
025F  E8 00 00 00 00                    call            __MakeDOSDT
0264  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0267  83 C4 0C                          add             esp,0x0000000c
026A  66 3B 45 F0                       cmp             ax,word ptr -0x10[ebp]
026E  75 0E                             jne             L$21
0270  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
0273  66 3B 45 F8                       cmp             ax,word ptr -0x8[ebp]
0277  75 05                             jne             L$21
0279  8B 43 1E                          mov             eax,dword ptr 0x1e[ebx]
027C  EB 12                             jmp             L$22
027E                            L$21:
027E  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
0282  50                                push            eax
0283  0F B7 45 F4                       movzx           eax,word ptr -0xc[ebp]
0287  50                                push            eax
0288  E8 00 00 00 00                    call            _d2ttime
028D  83 C4 08                          add             esp,0x00000008
0290                            L$22:
0290  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
0293  66 C7 43 10 00 00                 mov             word ptr 0x10[ebx],0x0000
0299  66 8B 43 10                       mov             ax,word ptr 0x10[ebx]
029D  66 C7 43 0A 01 00                 mov             word ptr 0xa[ebx],0x0001
02A3  98                                cwde
02A4  89 43 0C                          mov             dword ptr 0xc[ebx],eax
02A7  89 43 04                          mov             dword ptr 0x4[ebx],eax
02AA  83 C3 39                          add             ebx,0x00000039
02AD  8B 85 AC FD FF FF                 mov             eax,dword ptr -0x254[ebp]
02B3  C7 43 F5 00 00 00 00              mov             dword ptr -0xb[ebx],0x00000000
02BA  6A 0D                             push            0x0000000d
02BC  89 43 F1                          mov             dword ptr -0xf[ebx],eax
02BF  8D 85 D8 FD FF FF                 lea             eax,-0x228[ebp]
02C5  C7 43 F9 00 00 00 00              mov             dword ptr -0x7[ebx],0x00000000
02CC  50                                push            eax
02CD  66 C7 43 FD 00 00                 mov             word ptr -0x3[ebx],0x0000
02D3  53                                push            ebx
02D4  C6 43 FF 00                       mov             byte ptr -0x1[ebx],0x00
02D8  E8 00 00 00 00                    call            strncpy
02DD  83 C4 0C                          add             esp,0x0000000c
02E0  31 C0                             xor             eax,eax
02E2  C9                                leave
02E3  5E                                pop             esi
02E4  5B                                pop             ebx
02E5  C3                                ret

Routine Size: 548 bytes,    Routine Base: _TEXT + 00C2

No disassembly errors

Segment: CONST DWORD USE32 00000012 bytes
0000                            L$23:
0000  63 6F 6E 00                                     con.
0004                            L$24:
0004  63 6F 6E 69 6E 24 00                            conin$.
000B                            L$25:
000B  45 58 45 00                                     EXE.
000F                            L$26:
000F  2A 3F 00                                        *?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

