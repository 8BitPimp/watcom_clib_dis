Module: asctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000184 bytes
0000                            convDec:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 08                          sub             esp,0x00000008
0005  B9 0A 00 00 00                    mov             ecx,0x0000000a
000A  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
000E  89 E6                             mov             esi,esp
0010  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0014  99                                cdq
0015  F7 F9                             idiv            ecx
0017  89 06                             mov             dword ptr [esi],eax
0019  89 56 04                          mov             dword ptr 0x4[esi],edx
001C  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0020  8A 14 24                          mov             dl,byte ptr [esp]
0023  01 D8                             add             eax,ebx
0025  80 C2 30                          add             dl,0x30
0028  88 10                             mov             byte ptr [eax],dl
002A  8A 54 24 04                       mov             dl,byte ptr 0x4[esp]
002E  80 C2 30                          add             dl,0x30
0031  88 50 01                          mov             byte ptr 0x1[eax],dl
0034  83 C4 08                          add             esp,0x00000008
0037  5E                                pop             esi
0038  5B                                pop             ebx
0039  C3                                ret

Routine Size: 58 bytes,    Routine Base: _TEXT + 0000

003A                            _asctime:
003A  53                                push            ebx
003B  56                                push            esi
003C  57                                push            edi
003D  55                                push            ebp
003E  83 EC 08                          sub             esp,0x00000008
0041  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0045  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0049  8B 46 18                          mov             eax,dword ptr 0x18[esi]
004C  8A 90 24 00 00 00                 mov             dl,byte ptr DGROUP:L$5[eax]
0052  88 13                             mov             byte ptr [ebx],dl
0054  8A 90 2B 00 00 00                 mov             dl,byte ptr DGROUP:L$6[eax]
005A  88 53 01                          mov             byte ptr 0x1[ebx],dl
005D  8A 80 32 00 00 00                 mov             al,byte ptr DGROUP:L$7[eax]
0063  C6 43 03 20                       mov             byte ptr 0x3[ebx],0x20
0067  88 43 02                          mov             byte ptr 0x2[ebx],al
006A  8B 46 10                          mov             eax,dword ptr 0x10[esi]
006D  8A 90 00 00 00 00                 mov             dl,byte ptr DGROUP:L$2[eax]
0073  88 53 04                          mov             byte ptr 0x4[ebx],dl
0076  8A 90 0C 00 00 00                 mov             dl,byte ptr DGROUP:L$3[eax]
007C  88 53 05                          mov             byte ptr 0x5[ebx],dl
007F  8A 80 18 00 00 00                 mov             al,byte ptr DGROUP:L$4[eax]
0085  C6 43 07 20                       mov             byte ptr 0x7[ebx],0x20
0089  53                                push            ebx
008A  88 43 06                          mov             byte ptr 0x6[ebx],al
008D  6A 08                             push            0x00000008
008F  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
0092  52                                push            edx
0093  E8 00 00 00 00                    call            convDec
0098  31 C0                             xor             eax,eax
009A  8A 43 08                          mov             al,byte ptr 0x8[ebx]
009D  83 C4 0C                          add             esp,0x0000000c
00A0  83 F8 30                          cmp             eax,0x00000030
00A3  75 04                             jne             L$1
00A5  C6 43 08 20                       mov             byte ptr 0x8[ebx],0x20
00A9                            L$1:
00A9  53                                push            ebx
00AA  C6 43 0A 20                       mov             byte ptr 0xa[ebx],0x20
00AE  6A 0B                             push            0x0000000b
00B0  8B 4E 08                          mov             ecx,dword ptr 0x8[esi]
00B3  51                                push            ecx
00B4  E8 00 00 00 00                    call            convDec
00B9  83 C4 0C                          add             esp,0x0000000c
00BC  53                                push            ebx
00BD  C6 43 0D 3A                       mov             byte ptr 0xd[ebx],0x3a
00C1  6A 0E                             push            0x0000000e
00C3  8B 7E 04                          mov             edi,dword ptr 0x4[esi]
00C6  57                                push            edi
00C7  E8 00 00 00 00                    call            convDec
00CC  83 C4 0C                          add             esp,0x0000000c
00CF  53                                push            ebx
00D0  C6 43 10 3A                       mov             byte ptr 0x10[ebx],0x3a
00D4  6A 11                             push            0x00000011
00D6  8B 2E                             mov             ebp,dword ptr [esi]
00D8  55                                push            ebp
00D9  E8 00 00 00 00                    call            convDec
00DE  B9 64 00 00 00                    mov             ecx,0x00000064
00E3  C6 43 13 20                       mov             byte ptr 0x13[ebx],0x20
00E7  83 C4 0C                          add             esp,0x0000000c
00EA  8B 46 14                          mov             eax,dword ptr 0x14[esi]
00ED  89 E6                             mov             esi,esp
00EF  99                                cdq
00F0  F7 F9                             idiv            ecx
00F2  89 06                             mov             dword ptr [esi],eax
00F4  89 56 04                          mov             dword ptr 0x4[esi],edx
00F7  53                                push            ebx
00F8  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00FC  6A 14                             push            0x00000014
00FE  83 C0 13                          add             eax,0x00000013
0101  50                                push            eax
0102  E8 00 00 00 00                    call            convDec
0107  83 C4 0C                          add             esp,0x0000000c
010A  53                                push            ebx
010B  6A 16                             push            0x00000016
010D  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0111  50                                push            eax
0112  E8 00 00 00 00                    call            convDec
0117  83 C4 0C                          add             esp,0x0000000c
011A  C6 43 18 0A                       mov             byte ptr 0x18[ebx],0x0a
011E  89 D8                             mov             eax,ebx
0120  C6 43 19 00                       mov             byte ptr 0x19[ebx],0x00
0124  83 C4 08                          add             esp,0x00000008
0127  5D                                pop             ebp
0128  5F                                pop             edi
0129  5E                                pop             esi
012A  5B                                pop             ebx
012B  C3                                ret

Routine Size: 242 bytes,    Routine Base: _TEXT + 003A

012C                            asctime:
012C  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0132  83 C0 38                          add             eax,0x00000038
0135  50                                push            eax
0136  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
013A  52                                push            edx
013B  E8 00 00 00 00                    call            _asctime
0140  83 C4 08                          add             esp,0x00000008
0143  C3                                ret

Routine Size: 24 bytes,    Routine Base: _TEXT + 012C

0144                            _ctime:
0144  53                                push            ebx
0145  83 EC 24                          sub             esp,0x00000024
0148  8B 54 24 30                       mov             edx,dword ptr 0x30[esp]
014C  52                                push            edx
014D  8D 44 24 04                       lea             eax,0x4[esp]
0151  50                                push            eax
0152  8B 5C 24 34                       mov             ebx,dword ptr 0x34[esp]
0156  53                                push            ebx
0157  E8 00 00 00 00                    call            _localtime
015C  83 C4 08                          add             esp,0x00000008
015F  50                                push            eax
0160  E8 00 00 00 00                    call            _asctime
0165  83 C4 08                          add             esp,0x00000008
0168  83 C4 24                          add             esp,0x00000024
016B  5B                                pop             ebx
016C  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 0144

016D                            ctime:
016D  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0171  52                                push            edx
0172  E8 00 00 00 00                    call            localtime
0177  83 C4 04                          add             esp,0x00000004
017A  50                                push            eax
017B  E8 00 00 00 00                    call            asctime
0180  83 C4 04                          add             esp,0x00000004
0183  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 016D

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

