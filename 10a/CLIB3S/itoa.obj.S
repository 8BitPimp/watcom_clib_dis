Module: itoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C6 bytes
0000                            Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025                            utoa:
0025  53                                push            ebx
0026  56                                push            esi
0027  57                                push            edi
0028  83 EC 28                          sub             esp,0x00000028
002B  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
002F  8B 7C 24 40                       mov             edi,dword ptr 0x40[esp]
0033  8B 74 24 3C                       mov             esi,dword ptr 0x3c[esp]
0037  30 E4                             xor             ah,ah
0039  8D 4C 24 01                       lea             ecx,0x1[esp]
003D  88 24 24                          mov             byte ptr [esp],ah
0040                            L$1:
0040  8D 5C 24 24                       lea             ebx,0x24[esp]
0044  89 D0                             mov             eax,edx
0046  89 7C 24 24                       mov             dword ptr 0x24[esp],edi
004A  31 D2                             xor             edx,edx
004C  F7 33                             div             dword ptr [ebx]
004E  89 03                             mov             dword ptr [ebx],eax
0050  2E 8A 92 00 00 00 00              mov             dl,byte ptr cs:Alphabet[edx]
0057  88 11                             mov             byte ptr [ecx],dl
0059  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
005D  41                                inc             ecx
005E  85 D2                             test            edx,edx
0060  75 DE                             jne             L$1
0062                            L$2:
0062  49                                dec             ecx
0063  8A 11                             mov             dl,byte ptr [ecx]
0065  88 16                             mov             byte ptr [esi],dl
0067  46                                inc             esi
0068  84 D2                             test            dl,dl
006A  75 F6                             jne             L$2
006C  8B 44 24 3C                       mov             eax,dword ptr 0x3c[esp]
0070  83 C4 28                          add             esp,0x00000028
0073  5F                                pop             edi
0074  5E                                pop             esi
0075  5B                                pop             ebx
0076  C3                                ret

Routine Size: 82 bytes,    Routine Base: _TEXT + 0025

0077                            itoa:
0077  53                                push            ebx
0078  56                                push            esi
0079  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
007D  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0081  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0085  89 D8                             mov             eax,ebx
0087  83 F9 0A                          cmp             ecx,0x0000000a
008A  75 0C                             jne             L$3
008C  85 D2                             test            edx,edx
008E  7D 08                             jge             L$3
0090  F7 DA                             neg             edx
0092  8D 43 01                          lea             eax,0x1[ebx]
0095  C6 03 2D                          mov             byte ptr [ebx],0x2d
0098                            L$3:
0098  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
009C  56                                push            esi
009D  50                                push            eax
009E  52                                push            edx
009F  E8 00 00 00 00                    call            utoa
00A4  83 C4 0C                          add             esp,0x0000000c
00A7  89 D8                             mov             eax,ebx
00A9  5E                                pop             esi
00AA  5B                                pop             ebx
00AB  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0077

00AC                            _itoa:
00AC  53                                push            ebx
00AD  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
00B1  52                                push            edx
00B2  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
00B6  53                                push            ebx
00B7  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
00BB  51                                push            ecx
00BC  E8 00 00 00 00                    call            itoa
00C1  83 C4 0C                          add             esp,0x0000000c
00C4  5B                                pop             ebx
00C5  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 00AC

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

