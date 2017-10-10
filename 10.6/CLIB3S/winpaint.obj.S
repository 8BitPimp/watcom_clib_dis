Module: winpaint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001EF bytes
0000                            _RepaintWindow:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 1C                          sub             esp,0x0000001c
0007  8B 5C 24 34                       mov             ebx,dword ptr 0x34[esp]
000B  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
000E  8B 4C 24 30                       mov             ecx,dword ptr 0x30[esp]
0012  89 D0                             mov             eax,edx
0014  8B 71 2C                          mov             esi,dword ptr 0x2c[ecx]
0017  C1 FA 1F                          sar             edx,0x1f
001A  F7 FE                             idiv            esi
001C  89 C6                             mov             esi,eax
001E  66 85 C0                          test            ax,ax
0021  74 12                             je              L$1
0023  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
0026  8B 79 2C                          mov             edi,dword ptr 0x2c[ecx]
0029  89 D0                             mov             eax,edx
002B  C1 FA 1F                          sar             edx,0x1f
002E  F7 FF                             idiv            edi
0030  85 D2                             test            edx,edx
0032  74 01                             je              L$1
0034  4E                                dec             esi
0035                            L$1:
0035  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
0038  8B 4C 24 30                       mov             ecx,dword ptr 0x30[esp]
003C  89 D0                             mov             eax,edx
003E  8B 69 2C                          mov             ebp,dword ptr 0x2c[ecx]
0041  C1 FA 1F                          sar             edx,0x1f
0044  F7 FD                             idiv            ebp
0046  89 44 24 18                       mov             dword ptr 0x18[esp],eax
004A  66 85 C0                          test            ax,ax
004D  0F 84 94 01 00 00                 je              L$10
0053  31 C0                             xor             eax,eax
0055  8B 49 24                          mov             ecx,dword ptr 0x24[ecx]
0058  66 8B 44 24 18                    mov             ax,word ptr 0x18[esp]
005D  39 C8                             cmp             eax,ecx
005F  7C 0D                             jl              L$2
0061  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0065  66 8B 40 24                       mov             ax,word ptr 0x24[eax]
0069  48                                dec             eax
006A  89 44 24 18                       mov             dword ptr 0x18[esp],eax
006E                            L$2:
006E  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
0071  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
0075  89 D0                             mov             eax,edx
0077  C1 FA 1F                          sar             edx,0x1f
007A  F7 7B 2C                          idiv            dword ptr 0x2c[ebx]
007D  85 D2                             test            edx,edx
007F  75 04                             jne             L$3
0081  FF 4C 24 18                       dec             dword ptr 0x18[esp]
0085                            L$3:
0085  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0089  66 8B 40 20                       mov             ax,word ptr 0x20[eax]
008D  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0091  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0095  66 8B 48 28                       mov             cx,word ptr 0x28[eax]
0099  6B C1 00                          imul            eax,ecx,0x00000000
009C  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00A0  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
00A4  66 8B 40 2C                       mov             ax,word ptr 0x2c[eax]
00A8  0F AF C6                          imul            eax,esi
00AB  8B 2D 00 00 00 00                 mov             ebp,dword ptr _FixedFont
00B1  55                                push            ebp
00B2  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00B6  8B 44 24 3C                       mov             eax,dword ptr 0x3c[esp]
00BA  50                                push            eax
00BB  E8 00 00 00 00                    call            _SelectObject
00C0  89 04 24                          mov             dword ptr [esp],eax
00C3  31 C0                             xor             eax,eax
00C5  66 89 F0                          mov             ax,si
00C8  E9 F5 00 00 00                    jmp             L$9
00CD                            L$4:
00CD  89 D0                             mov             eax,edx
00CF  8B 54 24 30                       mov             edx,dword ptr 0x30[esp]
00D3  0F AF 42 20                       imul            eax,dword ptr 0x20[edx]
00D7  8B 5A 32                          mov             ebx,dword ptr 0x32[edx]
00DA  C1 E0 02                          shl             eax,0x02
00DD  01 C3                             add             ebx,eax
00DF  8B 42 0C                          mov             eax,dword ptr 0xc[edx]
00E2  8B 3C 85 00 00 00 00              mov             edi,dword ptr _ColorMap[eax*4]
00E9  57                                push            edi
00EA  8B 6C 24 3C                       mov             ebp,dword ptr 0x3c[esp]
00EE  55                                push            ebp
00EF  E8 00 00 00 00                    call            _SetBkColor
00F4  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
00F8  8B 40 08                          mov             eax,dword ptr 0x8[eax]
00FB  8B 14 85 00 00 00 00              mov             edx,dword ptr _ColorMap[eax*4]
0102  52                                push            edx
0103  55                                push            ebp
0104  E8 00 00 00 00                    call            _SetTextColor
0109  31 C0                             xor             eax,eax
010B  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
0110  C1 E0 02                          shl             eax,0x02
0113  83 C0 04                          add             eax,0x00000004
0116  50                                push            eax
0117  E8 00 00 00 00                    call            _MemAlloc
011C  83 C4 04                          add             esp,0x00000004
011F  31 ED                             xor             ebp,ebp
0121  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0125  C6 00 00                          mov             byte ptr [eax],0x00
0128  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
012C  EB 37                             jmp             L$8
012E                            L$5:
012E  8B 13                             mov             edx,dword ptr [ebx]
0130  52                                push            edx
0131  45                                inc             ebp
0132  E8 00 00 00 00                    call            __mbvtop
0137  83 C4 04                          add             esp,0x00000004
013A  89 C6                             mov             esi,eax
013C  83 C3 04                          add             ebx,0x00000004
013F  06                                push            es
0140  1E                                push            ds
0141  07                                pop             es
0142  57                                push            edi
0143  2B C9                             sub             ecx,ecx
0145  49                                dec             ecx
0146  B0 00                             mov             al,0x00
0148  F2 AE                             repne scasb
014A  4F                                dec             edi
014B                            L$6:
014B  8A 06                             mov             al,byte ptr [esi]
014D  88 07                             mov             byte ptr [edi],al
014F  3C 00                             cmp             al,0x00
0151  74 10                             je              L$7
0153  8A 46 01                          mov             al,byte ptr 0x1[esi]
0156  83 C6 02                          add             esi,0x00000002
0159  88 47 01                          mov             byte ptr 0x1[edi],al
015C  83 C7 02                          add             edi,0x00000002
015F  3C 00                             cmp             al,0x00
0161  75 E8                             jne             L$6
0163                            L$7:
0163  5F                                pop             edi
0164  07                                pop             es
0165                            L$8:
0165  31 C0                             xor             eax,eax
0167  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
016C  39 C5                             cmp             ebp,eax
016E  7C BE                             jl              L$5
0170  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
0174  06                                push            es
0175  8C D8                             mov             eax,ds
0177  8E C0                             mov             es,eax
0179  29 C9                             sub             ecx,ecx
017B  49                                dec             ecx
017C  31 C0                             xor             eax,eax
017E  F2 AE                             repne scasb
0180  F7 D1                             not             ecx
0182  49                                dec             ecx
0183  07                                pop             es
0184  51                                push            ecx
0185  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0189  31 C0                             xor             eax,eax
018B  56                                push            esi
018C  66 8B 44 24 18                    mov             ax,word ptr 0x18[esp]
0191  50                                push            eax
0192  31 C0                             xor             eax,eax
0194  66 8B 44 24 20                    mov             ax,word ptr 0x20[esp]
0199  50                                push            eax
019A  8B 7C 24 48                       mov             edi,dword ptr 0x48[esp]
019E  57                                push            edi
019F  E8 00 00 00 00                    call            _TextOutA
01A4  56                                push            esi
01A5  E8 00 00 00 00                    call            _MemFree
01AA  83 C4 04                          add             esp,0x00000004
01AD  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
01B1  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
01B5  66 03 70 2C                       add             si,word ptr 0x2c[eax]
01B9  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
01BD  40                                inc             eax
01BE  89 74 24 10                       mov             dword ptr 0x10[esp],esi
01C2                            L$9:
01C2  89 44 24 04                       mov             dword ptr 0x4[esp],eax
01C6  31 C0                             xor             eax,eax
01C8  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
01CC  66 8B 44 24 18                    mov             ax,word ptr 0x18[esp]
01D1  39 D0                             cmp             eax,edx
01D3  0F 8D F4 FE FF FF                 jge             L$4
01D9  8B 1C 24                          mov             ebx,dword ptr [esp]
01DC  53                                push            ebx
01DD  8B 4C 24 3C                       mov             ecx,dword ptr 0x3c[esp]
01E1  51                                push            ecx
01E2  E8 00 00 00 00                    call            _SelectObject
01E7                            L$10:
01E7  83 C4 1C                          add             esp,0x0000001c
01EA  5D                                pop             ebp
01EB  5F                                pop             edi
01EC  5E                                pop             esi
01ED  5B                                pop             ebx
01EE  C3                                ret

Routine Size: 495 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

