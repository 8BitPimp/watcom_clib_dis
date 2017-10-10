Module: winpaint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000182 bytes
0000                            _RepaintWindow_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 18                          sub             esp,0x00000018
0007  89 C6                             mov             esi,eax
0009  89 D5                             mov             ebp,edx
000B  89 DF                             mov             edi,ebx
000D  8B 52 04                          mov             edx,dword ptr 0x4[edx]
0010  8B 5E 2C                          mov             ebx,dword ptr 0x2c[esi]
0013  89 D0                             mov             eax,edx
0015  C1 FA 1F                          sar             edx,0x1f
0018  F7 FB                             idiv            ebx
001A  89 C3                             mov             ebx,eax
001C  66 85 C0                          test            ax,ax
001F  74 12                             je              L$1
0021  8B 55 04                          mov             edx,dword ptr 0x4[ebp]
0024  8B 4E 2C                          mov             ecx,dword ptr 0x2c[esi]
0027  89 D0                             mov             eax,edx
0029  C1 FA 1F                          sar             edx,0x1f
002C  F7 F9                             idiv            ecx
002E  85 D2                             test            edx,edx
0030  74 01                             je              L$1
0032  4B                                dec             ebx
0033                            L$1:
0033  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0036  8B 4E 2C                          mov             ecx,dword ptr 0x2c[esi]
0039  89 D0                             mov             eax,edx
003B  C1 FA 1F                          sar             edx,0x1f
003E  F7 F9                             idiv            ecx
0040  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0044  66 85 C0                          test            ax,ax
0047  0F 84 2D 01 00 00                 je              L$8
004D  31 C0                             xor             eax,eax
004F  8B 56 24                          mov             edx,dword ptr 0x24[esi]
0052  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
0057  39 D0                             cmp             eax,edx
0059  7C 09                             jl              L$2
005B  66 8B 46 24                       mov             ax,word ptr 0x24[esi]
005F  48                                dec             eax
0060  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0064                            L$2:
0064  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0067  8B 4E 2C                          mov             ecx,dword ptr 0x2c[esi]
006A  89 D0                             mov             eax,edx
006C  C1 FA 1F                          sar             edx,0x1f
006F  F7 F9                             idiv            ecx
0071  85 D2                             test            edx,edx
0073  75 04                             jne             L$3
0075  FF 4C 24 0C                       dec             dword ptr 0xc[esp]
0079                            L$3:
0079  8B 55 00                          mov             edx,dword ptr [ebp]
007C  8B 4E 28                          mov             ecx,dword ptr 0x28[esi]
007F  89 D0                             mov             eax,edx
0081  C1 FA 1F                          sar             edx,0x1f
0084  F7 F9                             idiv            ecx
0086  89 44 24 08                       mov             dword ptr 0x8[esp],eax
008A  66 85 C0                          test            ax,ax
008D  74 12                             je              L$4
008F  8B 55 00                          mov             edx,dword ptr [ebp]
0092  89 D0                             mov             eax,edx
0094  C1 FA 1F                          sar             edx,0x1f
0097  F7 F9                             idiv            ecx
0099  85 D2                             test            edx,edx
009B  74 04                             je              L$4
009D  FF 4C 24 08                       dec             dword ptr 0x8[esp]
00A1                            L$4:
00A1  8B 55 08                          mov             edx,dword ptr 0x8[ebp]
00A4  8B 4E 28                          mov             ecx,dword ptr 0x28[esi]
00A7  89 D0                             mov             eax,edx
00A9  C1 FA 1F                          sar             edx,0x1f
00AC  F7 F9                             idiv            ecx
00AE  89 C1                             mov             ecx,eax
00B0  66 85 C0                          test            ax,ax
00B3  0F 84 C1 00 00 00                 je              L$8
00B9  8B 55 08                          mov             edx,dword ptr 0x8[ebp]
00BC  89 D0                             mov             eax,edx
00BE  8B 6E 28                          mov             ebp,dword ptr 0x28[esi]
00C1  C1 FA 1F                          sar             edx,0x1f
00C4  F7 FD                             idiv            ebp
00C6  85 D2                             test            edx,edx
00C8  75 01                             jne             L$5
00CA  49                                dec             ecx
00CB                            L$5:
00CB  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00CF  66 8B 56 28                       mov             dx,word ptr 0x28[esi]
00D3  29 C1                             sub             ecx,eax
00D5  0F AF C2                          imul            eax,edx
00D8  89 44 24 10                       mov             dword ptr 0x10[esp],eax
00DC  66 8B 46 2C                       mov             ax,word ptr 0x2c[esi]
00E0  0F AF C3                          imul            eax,ebx
00E3  89 44 24 04                       mov             dword ptr 0x4[esp],eax
00E7  A1 00 00 00 00                    mov             eax,dword ptr __FixedFont
00EC  50                                push            eax
00ED  41                                inc             ecx
00EE  57                                push            edi
00EF  89 4C 24 1C                       mov             dword ptr 0x1c[esp],ecx
00F3  E8 00 00 00 00                    call            _SelectObject
00F8  89 04 24                          mov             dword ptr [esp],eax
00FB  81 E3 FF FF 00 00                 and             ebx,0x0000ffff
0101  EB 62                             jmp             L$7
0103                            L$6:
0103  8B 6E 20                          mov             ebp,dword ptr 0x20[esi]
0106  0F AF EB                          imul            ebp,ebx
0109  8B 46 32                          mov             eax,dword ptr 0x32[esi]
010C  01 C5                             add             ebp,eax
010E  8B 46 0C                          mov             eax,dword ptr 0xc[esi]
0111  8B 0C 85 00 00 00 00              mov             ecx,dword ptr __ColorMap[eax*4]
0118  51                                push            ecx
0119  57                                push            edi
011A  E8 00 00 00 00                    call            _SetBkColor
011F  8B 46 08                          mov             eax,dword ptr 0x8[esi]
0122  8B 14 85 00 00 00 00              mov             edx,dword ptr __ColorMap[eax*4]
0129  52                                push            edx
012A  57                                push            edi
012B  E8 00 00 00 00                    call            _SetTextColor
0130  31 C0                             xor             eax,eax
0132  66 8B 44 24 14                    mov             ax,word ptr 0x14[esp]
0137  50                                push            eax
0138  31 C0                             xor             eax,eax
013A  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
013F  01 E8                             add             eax,ebp
0141  50                                push            eax
0142  31 C0                             xor             eax,eax
0144  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
0149  50                                push            eax
014A  31 C0                             xor             eax,eax
014C  66 8B 44 24 1C                    mov             ax,word ptr 0x1c[esp]
0151  50                                push            eax
0152  57                                push            edi
0153  E8 00 00 00 00                    call            _TextOutA
0158  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
015C  66 03 4E 2C                       add             cx,word ptr 0x2c[esi]
0160  43                                inc             ebx
0161  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
0165                            L$7:
0165  31 C0                             xor             eax,eax
0167  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
016C  39 C3                             cmp             ebx,eax
016E  7E 93                             jle             L$6
0170  8B 14 24                          mov             edx,dword ptr [esp]
0173  52                                push            edx
0174  57                                push            edi
0175  E8 00 00 00 00                    call            _SelectObject
017A                            L$8:
017A  83 C4 18                          add             esp,0x00000018
017D  5D                                pop             ebp
017E  5F                                pop             edi
017F  5E                                pop             esi
0180  59                                pop             ecx
0181  C3                                ret

Routine Size: 386 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

