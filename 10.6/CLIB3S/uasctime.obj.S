Module: uasctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A8 bytes
0000                            convDec:
0000  56                                push            esi
0001  57                                push            edi
0002  06                                push            es
0003  C8 10 00 00                       enter           0x0010,0x00
0007  6A 0A                             push            0x0000000a
0009  8D 75 F8                          lea             esi,-0x8[ebp]
000C  FF 75 14                          push            dword ptr 0x14[ebp]
000F  8D 7D F0                          lea             edi,-0x10[ebp]
0012  E8 00 00 00 00                    call            div
0017  8D 75 F8                          lea             esi,-0x8[ebp]
001A  1E                                push            ds
001B  07                                pop             es
001C  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
001F  A5                                movsd
0020  A5                                movsd
0021  01 C0                             add             eax,eax
0023  8B 75 F0                          mov             esi,dword ptr -0x10[ebp]
0026  03 45 1C                          add             eax,dword ptr 0x1c[ebp]
0029  83 C6 30                          add             esi,0x00000030
002C  66 89 30                          mov             word ptr [eax],si
002F  8B 75 F4                          mov             esi,dword ptr -0xc[ebp]
0032  83 C6 30                          add             esi,0x00000030
0035  83 C4 08                          add             esp,0x00000008
0038  66 89 70 02                       mov             word ptr 0x2[eax],si
003C  C9                                leave
003D  07                                pop             es
003E  5F                                pop             edi
003F  5E                                pop             esi
0040  C3                                ret

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

0041                            _u_asctime:
0041  53                                push            ebx
0042  56                                push            esi
0043  57                                push            edi
0044  06                                push            es
0045  C8 10 00 00                       enter           0x0010,0x00
0049  8B 75 18                          mov             esi,dword ptr 0x18[ebp]
004C  8B 5D 1C                          mov             ebx,dword ptr 0x1c[ebp]
004F  8B 46 18                          mov             eax,dword ptr 0x18[esi]
0052  66 0F B6 90 24 00 00 00           movzx           dx,byte ptr DGROUP:L$5[eax]
005A  66 89 13                          mov             word ptr [ebx],dx
005D  66 0F B6 90 2B 00 00 00           movzx           dx,byte ptr DGROUP:L$6[eax]
0065  66 89 53 02                       mov             word ptr 0x2[ebx],dx
0069  66 0F B6 80 32 00 00 00           movzx           ax,byte ptr DGROUP:L$7[eax]
0071  66 C7 43 06 20 00                 mov             word ptr 0x6[ebx],0x0020
0077  66 89 43 04                       mov             word ptr 0x4[ebx],ax
007B  8B 46 10                          mov             eax,dword ptr 0x10[esi]
007E  66 0F B6 90 00 00 00 00           movzx           dx,byte ptr DGROUP:L$2[eax]
0086  66 89 53 08                       mov             word ptr 0x8[ebx],dx
008A  66 0F B6 90 0C 00 00 00           movzx           dx,byte ptr DGROUP:L$3[eax]
0092  66 89 53 0A                       mov             word ptr 0xa[ebx],dx
0096  53                                push            ebx
0097  66 0F B6 80 18 00 00 00           movzx           ax,byte ptr DGROUP:L$4[eax]
009F  66 C7 43 0E 20 00                 mov             word ptr 0xe[ebx],0x0020
00A5  6A 08                             push            0x00000008
00A7  66 89 43 0C                       mov             word ptr 0xc[ebx],ax
00AB  FF 76 0C                          push            dword ptr 0xc[esi]
00AE  E8 00 00 00 00                    call            convDec
00B3  0F B7 43 10                       movzx           eax,word ptr 0x10[ebx]
00B7  83 C4 0C                          add             esp,0x0000000c
00BA  83 F8 30                          cmp             eax,0x00000030
00BD  75 06                             jne             L$1
00BF  66 C7 43 10 20 00                 mov             word ptr 0x10[ebx],0x0020
00C5                            L$1:
00C5  53                                push            ebx
00C6  6A 0B                             push            0x0000000b
00C8  66 C7 43 14 20 00                 mov             word ptr 0x14[ebx],0x0020
00CE  FF 76 08                          push            dword ptr 0x8[esi]
00D1  E8 00 00 00 00                    call            convDec
00D6  83 C4 0C                          add             esp,0x0000000c
00D9  53                                push            ebx
00DA  6A 0E                             push            0x0000000e
00DC  66 C7 43 1A 3A 00                 mov             word ptr 0x1a[ebx],0x003a
00E2  FF 76 04                          push            dword ptr 0x4[esi]
00E5  E8 00 00 00 00                    call            convDec
00EA  83 C4 0C                          add             esp,0x0000000c
00ED  53                                push            ebx
00EE  6A 11                             push            0x00000011
00F0  66 C7 43 20 3A 00                 mov             word ptr 0x20[ebx],0x003a
00F6  FF 36                             push            dword ptr [esi]
00F8  E8 00 00 00 00                    call            convDec
00FD  83 C4 0C                          add             esp,0x0000000c
0100  6A 64                             push            0x00000064
0102  66 C7 43 26 20 00                 mov             word ptr 0x26[ebx],0x0020
0108  FF 76 14                          push            dword ptr 0x14[esi]
010B  8D 75 F8                          lea             esi,-0x8[ebp]
010E  8D 7D F0                          lea             edi,-0x10[ebp]
0111  E8 00 00 00 00                    call            div
0116  8D 75 F8                          lea             esi,-0x8[ebp]
0119  1E                                push            ds
011A  07                                pop             es
011B  83 C4 08                          add             esp,0x00000008
011E  A5                                movsd
011F  A5                                movsd
0120  53                                push            ebx
0121  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
0124  6A 14                             push            0x00000014
0126  83 C0 13                          add             eax,0x00000013
0129  50                                push            eax
012A  E8 00 00 00 00                    call            convDec
012F  83 C4 0C                          add             esp,0x0000000c
0132  53                                push            ebx
0133  6A 16                             push            0x00000016
0135  FF 75 F4                          push            dword ptr -0xc[ebp]
0138  E8 00 00 00 00                    call            convDec
013D  83 C4 0C                          add             esp,0x0000000c
0140  66 C7 43 30 0A 00                 mov             word ptr 0x30[ebx],0x000a
0146  89 D8                             mov             eax,ebx
0148  66 C7 43 32 00 00                 mov             word ptr 0x32[ebx],0x0000
014E  C9                                leave
014F  07                                pop             es
0150  5F                                pop             edi
0151  5E                                pop             esi
0152  5B                                pop             ebx
0153  C3                                ret

Routine Size: 275 bytes,    Routine Base: _TEXT + 0041

0154                            _uasctime:
0154  55                                push            ebp
0155  89 E5                             mov             ebp,esp
0157  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
015D  83 C0 38                          add             eax,0x00000038
0160  50                                push            eax
0161  FF 75 08                          push            dword ptr 0x8[ebp]
0164  E8 00 00 00 00                    call            _u_asctime
0169  83 C4 08                          add             esp,0x00000008
016C  5D                                pop             ebp
016D  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0154

016E                            _u_ctime:
016E  C8 24 00 00                       enter           0x0024,0x00
0172  FF 75 0C                          push            dword ptr 0xc[ebp]
0175  8D 45 DC                          lea             eax,-0x24[ebp]
0178  50                                push            eax
0179  FF 75 08                          push            dword ptr 0x8[ebp]
017C  E8 00 00 00 00                    call            _localtime
0181  83 C4 08                          add             esp,0x00000008
0184  50                                push            eax
0185  E8 00 00 00 00                    call            _u_asctime
018A  83 C4 08                          add             esp,0x00000008
018D  C9                                leave
018E  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 016E

018F                            _uctime:
018F  55                                push            ebp
0190  89 E5                             mov             ebp,esp
0192  FF 75 08                          push            dword ptr 0x8[ebp]
0195  E8 00 00 00 00                    call            localtime
019A  83 C4 04                          add             esp,0x00000004
019D  50                                push            eax
019E  E8 00 00 00 00                    call            _uasctime
01A3  83 C4 04                          add             esp,0x00000004
01A6  5D                                pop             ebp
01A7  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 018F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000039 bytes
0000                            L$2:
0000  4A 46 4D 41 4D 4A 4A 41 53 4F 4E 44             JFMAMJJASOND
000C                            L$3:
000C  61 65 61 70 61 75 75 75 65 63 6F 65             aeapauuuecoe
0018                            L$4:
0018  6E 62 72 72 79 6E 6C 67 70 74 76 63             nbrrynlgptvc
0024                            L$5:
0024  53 4D 54 57 54 46 53                            SMTWTFS
002B                            L$6:
002B  75 6F 75 65 68 72 61                            uouehra
0032                            L$7:
0032  6E 6E 65 64 75 69 74                            nneduit

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

