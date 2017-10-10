Module: asctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000153 bytes
0000                            convDec_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  89 D7                             mov             edi,edx
0008  B9 0A 00 00 00                    mov             ecx,0x0000000a
000D  89 E6                             mov             esi,esp
000F  99                                cdq
0010  F7 F9                             idiv            ecx
0012  89 06                             mov             dword ptr [esi],eax
0014  89 56 04                          mov             dword ptr 0x4[esi],edx
0017  8A 14 24                          mov             dl,byte ptr [esp]
001A  8D 04 3B                          lea             eax,[ebx+edi]
001D  80 C2 30                          add             dl,0x30
0020  88 10                             mov             byte ptr [eax],dl
0022  8A 5C 24 04                       mov             bl,byte ptr 0x4[esp]
0026  80 C3 30                          add             bl,0x30
0029  88 58 01                          mov             byte ptr 0x1[eax],bl
002C  83 C4 08                          add             esp,0x00000008
002F  5F                                pop             edi
0030  5E                                pop             esi
0031  59                                pop             ecx
0032  C3                                ret

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

0033                            _asctime_:
0033  53                                push            ebx
0034  51                                push            ecx
0035  56                                push            esi
0036  57                                push            edi
0037  83 EC 08                          sub             esp,0x00000008
003A  89 C1                             mov             ecx,eax
003C  89 D7                             mov             edi,edx
003E  8B 40 18                          mov             eax,dword ptr 0x18[eax]
0041  8A 90 24 00 00 00                 mov             dl,byte ptr DGROUP:L$5[eax]
0047  88 17                             mov             byte ptr [edi],dl
0049  8A 90 2B 00 00 00                 mov             dl,byte ptr DGROUP:L$6[eax]
004F  88 57 01                          mov             byte ptr 0x1[edi],dl
0052  8A 80 32 00 00 00                 mov             al,byte ptr DGROUP:L$7[eax]
0058  C6 47 03 20                       mov             byte ptr 0x3[edi],0x20
005C  88 47 02                          mov             byte ptr 0x2[edi],al
005F  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
0062  8A 90 00 00 00 00                 mov             dl,byte ptr DGROUP:L$2[eax]
0068  88 57 04                          mov             byte ptr 0x4[edi],dl
006B  8A 90 0C 00 00 00                 mov             dl,byte ptr DGROUP:L$3[eax]
0071  88 57 05                          mov             byte ptr 0x5[edi],dl
0074  8A 80 18 00 00 00                 mov             al,byte ptr DGROUP:L$4[eax]
007A  C6 47 07 20                       mov             byte ptr 0x7[edi],0x20
007E  89 FB                             mov             ebx,edi
0080  88 47 06                          mov             byte ptr 0x6[edi],al
0083  BA 08 00 00 00                    mov             edx,0x00000008
0088  8B 41 0C                          mov             eax,dword ptr 0xc[ecx]
008B  E8 00 00 00 00                    call            convDec_
0090  80 7F 08 30                       cmp             byte ptr 0x8[edi],0x30
0094  75 04                             jne             L$1
0096  C6 47 08 20                       mov             byte ptr 0x8[edi],0x20
009A                            L$1:
009A  BA 0B 00 00 00                    mov             edx,0x0000000b
009F  C6 47 0A 20                       mov             byte ptr 0xa[edi],0x20
00A3  89 FB                             mov             ebx,edi
00A5  8B 41 08                          mov             eax,dword ptr 0x8[ecx]
00A8  E8 00 00 00 00                    call            convDec_
00AD  BA 0E 00 00 00                    mov             edx,0x0000000e
00B2  C6 47 0D 3A                       mov             byte ptr 0xd[edi],0x3a
00B6  89 FB                             mov             ebx,edi
00B8  8B 41 04                          mov             eax,dword ptr 0x4[ecx]
00BB  E8 00 00 00 00                    call            convDec_
00C0  BA 11 00 00 00                    mov             edx,0x00000011
00C5  C6 47 10 3A                       mov             byte ptr 0x10[edi],0x3a
00C9  89 FB                             mov             ebx,edi
00CB  8B 01                             mov             eax,dword ptr [ecx]
00CD  E8 00 00 00 00                    call            convDec_
00D2  C6 47 13 20                       mov             byte ptr 0x13[edi],0x20
00D6  89 E6                             mov             esi,esp
00D8  8B 41 14                          mov             eax,dword ptr 0x14[ecx]
00DB  B9 64 00 00 00                    mov             ecx,0x00000064
00E0  89 FB                             mov             ebx,edi
00E2  99                                cdq
00E3  F7 F9                             idiv            ecx
00E5  89 06                             mov             dword ptr [esi],eax
00E7  89 56 04                          mov             dword ptr 0x4[esi],edx
00EA  8B 04 24                          mov             eax,dword ptr [esp]
00ED  BA 14 00 00 00                    mov             edx,0x00000014
00F2  83 C0 13                          add             eax,0x00000013
00F5  E8 00 00 00 00                    call            convDec_
00FA  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00FE  BA 16 00 00 00                    mov             edx,0x00000016
0103  89 FB                             mov             ebx,edi
0105  E8 00 00 00 00                    call            convDec_
010A  C6 47 18 0A                       mov             byte ptr 0x18[edi],0x0a
010E  89 F8                             mov             eax,edi
0110  C6 47 19 00                       mov             byte ptr 0x19[edi],0x00
0114  83 C4 08                          add             esp,0x00000008
0117  5F                                pop             edi
0118  5E                                pop             esi
0119  59                                pop             ecx
011A  5B                                pop             ebx
011B  C3                                ret

Routine Size: 233 bytes,    Routine Base: _TEXT + 0033

011C                            _ctime_:
011C  53                                push            ebx
011D  83 EC 24                          sub             esp,0x00000024
0120  89 D3                             mov             ebx,edx
0122  89 E2                             mov             edx,esp
0124  E8 00 00 00 00                    call            _localtime_
0129  89 DA                             mov             edx,ebx
012B  E8 00 00 00 00                    call            _asctime_
0130  83 C4 24                          add             esp,0x00000024
0133  5B                                pop             ebx
0134  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 011C

0135                            ctime_:
0135  E8 00 00 00 00                    call            localtime_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0135

013A                            asctime_:
013A  53                                push            ebx
013B  52                                push            edx
013C  89 C2                             mov             edx,eax
013E  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0144  8D 58 38                          lea             ebx,0x38[eax]
0147  89 D0                             mov             eax,edx
0149  89 DA                             mov             edx,ebx
014B  E8 00 00 00 00                    call            _asctime_
0150  5A                                pop             edx
0151  5B                                pop             ebx
0152  C3                                ret

Routine Size: 25 bytes,    Routine Base: _TEXT + 013A

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

