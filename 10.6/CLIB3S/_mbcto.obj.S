Module: _mbcto
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E8 bytes
0000                            _mbctolower:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
000C  74 16                             je              L$2
000E  53                                push            ebx
000F  E8 00 00 00 00                    call            _ismbdlower
0014  83 C4 04                          add             esp,0x00000004
0017  85 C0                             test            eax,eax
0019  74 05                             je              L$1
001B  8D 43 21                          lea             eax,0x21[ebx]
001E  5B                                pop             ebx
001F  C3                                ret
0020                            L$1:
0020  89 D8                             mov             eax,ebx
0022  5B                                pop             ebx
0023  C3                                ret
0024                            L$2:
0024  F6 C7 FF                          test            bh,0xff
0027  74 04                             je              L$3
0029  31 C0                             xor             eax,eax
002B  5B                                pop             ebx
002C  C3                                ret
002D                            L$3:
002D  31 C0                             xor             eax,eax
002F  88 D8                             mov             al,bl
0031  50                                push            eax
0032  E8 00 00 00 00                    call            tolower
0037  83 C4 04                          add             esp,0x00000004
003A  5B                                pop             ebx
003B  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

003C                            _mbctoupper:
003C  53                                push            ebx
003D  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0041  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0048  74 16                             je              L$5
004A  53                                push            ebx
004B  E8 00 00 00 00                    call            _ismbdlower
0050  83 C4 04                          add             esp,0x00000004
0053  85 C0                             test            eax,eax
0055  74 05                             je              L$4
0057  8D 43 DF                          lea             eax,-0x21[ebx]
005A  5B                                pop             ebx
005B  C3                                ret
005C                            L$4:
005C  89 D8                             mov             eax,ebx
005E  5B                                pop             ebx
005F  C3                                ret
0060                            L$5:
0060  F6 C7 FF                          test            bh,0xff
0063  74 04                             je              L$6
0065  31 C0                             xor             eax,eax
0067  5B                                pop             ebx
0068  C3                                ret
0069                            L$6:
0069  31 C0                             xor             eax,eax
006B  88 D8                             mov             al,bl
006D  50                                push            eax
006E  E8 00 00 00 00                    call            toupper
0073  83 C4 04                          add             esp,0x00000004
0076  5B                                pop             ebx
0077  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 003C

0078                            _mbctohira:
0078  53                                push            ebx
0079  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
007D  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
0084  74 2A                             je              L$7
0086  53                                push            ebx
0087  E8 00 00 00 00                    call            _ismbckata
008C  83 C4 04                          add             esp,0x00000004
008F  85 C0                             test            eax,eax
0091  74 1D                             je              L$7
0093  81 FB 93 83 00 00                 cmp             ebx,0x00008393
0099  77 15                             ja              L$7
009B  81 FB 7F 83 00 00                 cmp             ebx,0x0000837f
00A1  0F 93 C0                          setae           al
00A4  25 FF 00 00 00                    and             eax,0x000000ff
00A9  05 A1 00 00 00                    add             eax,0x000000a1
00AE  29 C3                             sub             ebx,eax
00B0                            L$7:
00B0  89 D8                             mov             eax,ebx
00B2  5B                                pop             ebx
00B3  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0078

00B4                            _mbctokata:
00B4  53                                push            ebx
00B5  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
00B9  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
00C0  74 22                             je              L$8
00C2  53                                push            ebx
00C3  E8 00 00 00 00                    call            _ismbchira
00C8  83 C4 04                          add             esp,0x00000004
00CB  85 C0                             test            eax,eax
00CD  74 15                             je              L$8
00CF  81 FB DE 82 00 00                 cmp             ebx,0x000082de
00D5  0F 93 C0                          setae           al
00D8  25 FF 00 00 00                    and             eax,0x000000ff
00DD  05 A1 00 00 00                    add             eax,0x000000a1
00E2  01 C3                             add             ebx,eax
00E4                            L$8:
00E4  89 D8                             mov             eax,ebx
00E6  5B                                pop             ebx
00E7  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 00B4

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

