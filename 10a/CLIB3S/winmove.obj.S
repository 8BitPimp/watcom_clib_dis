Module: winmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001FD bytes
0000                            _MovePageUp:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
0009  8B 53 4A                          mov             edx,dword ptr 0x4a[ebx]
000C  48                                dec             eax
000D  29 C2                             sub             edx,eax
000F  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
0012  8B 4B 4E                          mov             ecx,dword ptr 0x4e[ebx]
0015  48                                dec             eax
0016  89 53 4A                          mov             dword ptr 0x4a[ebx],edx
0019  29 C1                             sub             ecx,eax
001B  8B 73 4A                          mov             esi,dword ptr 0x4a[ebx]
001E  89 4B 4E                          mov             dword ptr 0x4e[ebx],ecx
0021  83 FE 01                          cmp             esi,0x00000001
0024  7D 07                             jge             L$1
0026  C7 43 4A 01 00 00 00              mov             dword ptr 0x4a[ebx],0x00000001
002D                            L$1:
002D  83 7B 4E 01                       cmp             dword ptr 0x4e[ebx],0x00000001
0031  7D 07                             jge             L$2
0033  C7 43 4E 01 00 00 00              mov             dword ptr 0x4e[ebx],0x00000001
003A                            L$2:
003A  53                                push            ebx
003B  E8 00 00 00 00                    call            _PositionScrollThumb
0040  83 C4 04                          add             esp,0x00000004
0043  53                                push            ebx
0044  E8 00 00 00 00                    call            _DisplayAllLines
0049  83 C4 04                          add             esp,0x00000004
004C  5E                                pop             esi
004D  5B                                pop             ebx
004E  C3                                ret

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

004F                            _MovePageDown:
004F  53                                push            ebx
0050  56                                push            esi
0051  57                                push            edi
0052  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0056  53                                push            ebx
0057  E8 00 00 00 00                    call            _GetLastLineNumber
005C  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
005F  8B 4B 4A                          mov             ecx,dword ptr 0x4a[ebx]
0062  4A                                dec             edx
0063  83 C4 04                          add             esp,0x00000004
0066  01 D1                             add             ecx,edx
0068  8B 53 24                          mov             edx,dword ptr 0x24[ebx]
006B  8B 73 4E                          mov             esi,dword ptr 0x4e[ebx]
006E  4A                                dec             edx
006F  89 4B 4A                          mov             dword ptr 0x4a[ebx],ecx
0072  01 D6                             add             esi,edx
0074  8B 7B 4A                          mov             edi,dword ptr 0x4a[ebx]
0077  89 73 4E                          mov             dword ptr 0x4e[ebx],esi
007A  39 F8                             cmp             eax,edi
007C  73 25                             jae             L$3
007E  89 43 4A                          mov             dword ptr 0x4a[ebx],eax
0081  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
0084  89 C2                             mov             edx,eax
0086  C1 FA 1F                          sar             edx,0x1f
0089  2B C2                             sub             eax,edx
008B  D1 F8                             sar             eax,0x01
008D  89 C2                             mov             edx,eax
008F  8B 43 4A                          mov             eax,dword ptr 0x4a[ebx]
0092  29 D0                             sub             eax,edx
0094  89 43 4E                          mov             dword ptr 0x4e[ebx],eax
0097  83 F8 01                          cmp             eax,0x00000001
009A  7D 07                             jge             L$3
009C  C7 43 4E 01 00 00 00              mov             dword ptr 0x4e[ebx],0x00000001
00A3                            L$3:
00A3  53                                push            ebx
00A4  E8 00 00 00 00                    call            _PositionScrollThumb
00A9  83 C4 04                          add             esp,0x00000004
00AC  53                                push            ebx
00AD  E8 00 00 00 00                    call            _DisplayAllLines
00B2  83 C4 04                          add             esp,0x00000004
00B5  5F                                pop             edi
00B6  5E                                pop             esi
00B7  5B                                pop             ebx
00B8  C3                                ret

Routine Size: 106 bytes,    Routine Base: _TEXT + 004F

00B9                            _MoveLineUp:
00B9  53                                push            ebx
00BA  56                                push            esi
00BB  57                                push            edi
00BC  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
00C0  83 7B 4E 01                       cmp             dword ptr 0x4e[ebx],0x00000001
00C4  74 3E                             je              L$4
00C6  6A FF                             push            0xffffffff
00C8  8B 4B 4A                          mov             ecx,dword ptr 0x4a[ebx]
00CB  8B 73 4E                          mov             esi,dword ptr 0x4e[ebx]
00CE  49                                dec             ecx
00CF  4E                                dec             esi
00D0  89 4B 4A                          mov             dword ptr 0x4a[ebx],ecx
00D3  53                                push            ebx
00D4  89 73 4E                          mov             dword ptr 0x4e[ebx],esi
00D7  E8 00 00 00 00                    call            _ShiftWindow
00DC  83 C4 08                          add             esp,0x00000008
00DF  8B 7B 4E                          mov             edi,dword ptr 0x4e[ebx]
00E2  57                                push            edi
00E3  53                                push            ebx
00E4  E8 00 00 00 00                    call            _GetLineDataPointer
00E9  83 C4 08                          add             esp,0x00000008
00EC  83 C0 09                          add             eax,0x00000009
00EF  50                                push            eax
00F0  6A 01                             push            0x00000001
00F2  53                                push            ebx
00F3  E8 00 00 00 00                    call            _DisplayLineInWindow
00F8  83 C4 0C                          add             esp,0x0000000c
00FB  53                                push            ebx
00FC  E8 00 00 00 00                    call            _PositionScrollThumb
0101  83 C4 04                          add             esp,0x00000004
0104                            L$4:
0104  5F                                pop             edi
0105  5E                                pop             esi
0106  5B                                pop             ebx
0107  C3                                ret

Routine Size: 79 bytes,    Routine Base: _TEXT + 00B9

0108                            _MoveLineDown:
0108  53                                push            ebx
0109  56                                push            esi
010A  57                                push            edi
010B  55                                push            ebp
010C  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0110  53                                push            ebx
0111  E8 00 00 00 00                    call            _GetLastLineNumber
0116  89 C2                             mov             edx,eax
0118  8B 4B 4A                          mov             ecx,dword ptr 0x4a[ebx]
011B  83 C4 04                          add             esp,0x00000004
011E  39 C8                             cmp             eax,ecx
0120  74 4F                             je              L$6
0122  8B 43 4E                          mov             eax,dword ptr 0x4e[ebx]
0125  03 43 24                          add             eax,dword ptr 0x24[ebx]
0128  8D 70 FF                          lea             esi,-0x1[eax]
012B  39 D6                             cmp             esi,edx
012D  73 42                             jae             L$6
012F  6A 01                             push            0x00000001
0131  53                                push            ebx
0132  E8 00 00 00 00                    call            _ShiftWindow
0137  83 C4 08                          add             esp,0x00000008
013A  56                                push            esi
013B  53                                push            ebx
013C  E8 00 00 00 00                    call            _GetLineDataPointer
0141  83 C4 08                          add             esp,0x00000008
0144  85 C0                             test            eax,eax
0146  74 12                             je              L$5
0148  83 C0 09                          add             eax,0x00000009
014B  50                                push            eax
014C  8B 43 24                          mov             eax,dword ptr 0x24[ebx]
014F  48                                dec             eax
0150  50                                push            eax
0151  53                                push            ebx
0152  E8 00 00 00 00                    call            _DisplayLineInWindow
0157  83 C4 0C                          add             esp,0x0000000c
015A                            L$5:
015A  8B 7B 4A                          mov             edi,dword ptr 0x4a[ebx]
015D  8B 6B 4E                          mov             ebp,dword ptr 0x4e[ebx]
0160  47                                inc             edi
0161  45                                inc             ebp
0162  89 7B 4A                          mov             dword ptr 0x4a[ebx],edi
0165  53                                push            ebx
0166  89 6B 4E                          mov             dword ptr 0x4e[ebx],ebp
0169  E8 00 00 00 00                    call            _PositionScrollThumb
016E  83 C4 04                          add             esp,0x00000004
0171                            L$6:
0171  5D                                pop             ebp
0172  5F                                pop             edi
0173  5E                                pop             esi
0174  5B                                pop             ebx
0175  C3                                ret

Routine Size: 110 bytes,    Routine Base: _TEXT + 0108

0176                            _MoveToLine:
0176  53                                push            ebx
0177  56                                push            esi
0178  57                                push            edi
0179  55                                push            ebp
017A  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
017E  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
0182  53                                push            ebx
0183  8B 73 24                          mov             esi,dword ptr 0x24[ebx]
0186  8B 7B 4E                          mov             edi,dword ptr 0x4e[ebx]
0189  E8 00 00 00 00                    call            _GetLastLineNumber
018E  83 EE 02                          sub             esi,0x00000002
0191  83 C4 04                          add             esp,0x00000004
0194  8B 53 4E                          mov             edx,dword ptr 0x4e[ebx]
0197  01 F7                             add             edi,esi
0199  39 D5                             cmp             ebp,edx
019B  72 0B                             jb              L$7
019D  39 FD                             cmp             ebp,edi
019F  77 07                             ja              L$7
01A1  83 7C 24 1C 00                    cmp             dword ptr 0x1c[esp],0x00000000
01A6  74 50                             je              L$13
01A8                            L$7:
01A8  83 7C 24 1C 00                    cmp             dword ptr 0x1c[esp],0x00000000
01AD  75 04                             jne             L$8
01AF  39 C7                             cmp             edi,eax
01B1  73 14                             jae             L$9
01B3                            L$8:
01B3  89 F2                             mov             edx,esi
01B5  89 F0                             mov             eax,esi
01B7  C1 FA 1F                          sar             edx,0x1f
01BA  2B C2                             sub             eax,edx
01BC  D1 F8                             sar             eax,0x01
01BE  89 EE                             mov             esi,ebp
01C0  29 C6                             sub             esi,eax
01C2  89 73 4E                          mov             dword ptr 0x4e[ebx],esi
01C5  EB 0F                             jmp             L$11
01C7                            L$9:
01C7  76 02                             jbe             L$10
01C9  89 C7                             mov             edi,eax
01CB                            L$10:
01CB  39 EF                             cmp             edi,ebp
01CD  76 07                             jbe             L$11
01CF  89 E8                             mov             eax,ebp
01D1  29 F0                             sub             eax,esi
01D3  89 43 4E                          mov             dword ptr 0x4e[ebx],eax
01D6                            L$11:
01D6  83 7B 4E 01                       cmp             dword ptr 0x4e[ebx],0x00000001
01DA  7D 07                             jge             L$12
01DC  C7 43 4E 01 00 00 00              mov             dword ptr 0x4e[ebx],0x00000001
01E3                            L$12:
01E3  53                                push            ebx
01E4  89 6B 4A                          mov             dword ptr 0x4a[ebx],ebp
01E7  E8 00 00 00 00                    call            _PositionScrollThumb
01EC  83 C4 04                          add             esp,0x00000004
01EF  53                                push            ebx
01F0  E8 00 00 00 00                    call            _DisplayAllLines
01F5  83 C4 04                          add             esp,0x00000004
01F8                            L$13:
01F8  5D                                pop             ebp
01F9  5F                                pop             edi
01FA  5E                                pop             esi
01FB  5B                                pop             ebx
01FC  C3                                ret

Routine Size: 135 bytes,    Routine Base: _TEXT + 0176

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

