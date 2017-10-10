Module: windlg2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003AF bytes
0000                            copyString:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
000A  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
000E  89 D0                             mov             eax,edx
0010  C1 FA 1F                          sar             edx,0x1f
0013  31 F6                             xor             esi,esi
0015  2B C2                             sub             eax,edx
0017  D1 F8                             sar             eax,0x01
0019  EB 0C                             jmp             L$2
001B                            L$1:
001B  31 D2                             xor             edx,edx
001D  46                                inc             esi
001E  8A 11                             mov             dl,byte ptr [ecx]
0020  41                                inc             ecx
0021  66 89 13                          mov             word ptr [ebx],dx
0024  83 C3 02                          add             ebx,0x00000002
0027                            L$2:
0027  39 C6                             cmp             esi,eax
0029  7C F0                             jl              L$1
002B  89 D8                             mov             eax,ebx
002D  5E                                pop             esi
002E  5B                                pop             ebx
002F  C3                                ret

Routine Size: 48 bytes,    Routine Base: _TEXT + 0000

0030                            _DialogTemplate:
0030  53                                push            ebx
0031  56                                push            esi
0032  57                                push            edi
0033  55                                push            ebp
0034  83 EC 08                          sub             esp,0x00000008
0037  8B 7C 24 30                       mov             edi,dword ptr 0x30[esp]
003B  06                                push            es
003C  8C D8                             mov             eax,ds
003E  8E C0                             mov             es,eax
0040  29 C9                             sub             ecx,ecx
0042  49                                dec             ecx
0043  31 C0                             xor             eax,eax
0045  F2 AE                             repne scasb
0047  F7 D1                             not             ecx
0049  49                                dec             ecx
004A  07                                pop             es
004B  8D 14 09                          lea             edx,[ecx+ecx]
004E  8D 42 02                          lea             eax,0x2[edx]
0051  8B 7C 24 34                       mov             edi,dword ptr 0x34[esp]
0055  89 04 24                          mov             dword ptr [esp],eax
0058  06                                push            es
0059  8C D8                             mov             eax,ds
005B  8E C0                             mov             es,eax
005D  29 C9                             sub             ecx,ecx
005F  49                                dec             ecx
0060  31 C0                             xor             eax,eax
0062  F2 AE                             repne scasb
0064  F7 D1                             not             ecx
0066  49                                dec             ecx
0067  07                                pop             es
0068  01 C9                             add             ecx,ecx
006A  83 C2 18                          add             edx,0x00000018
006D  83 C1 02                          add             ecx,0x00000002
0070  8B 7C 24 38                       mov             edi,dword ptr 0x38[esp]
0074  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
0078  06                                push            es
0079  8C D8                             mov             eax,ds
007B  8E C0                             mov             es,eax
007D  29 C9                             sub             ecx,ecx
007F  49                                dec             ecx
0080  31 C0                             xor             eax,eax
0082  F2 AE                             repne scasb
0084  F7 D1                             not             ecx
0086  49                                dec             ecx
0087  07                                pop             es
0088  01 C9                             add             ecx,ecx
008A  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
008E  8D 69 02                          lea             ebp,0x2[ecx]
0091  01 DA                             add             edx,ebx
0093  8D 5C 2A 03                       lea             ebx,0x3[edx+ebp]
0097  8A 64 24 1C                       mov             ah,byte ptr 0x1c[esp]
009B  80 E3 FC                          and             bl,0xfc
009E  F6 C4 40                          test            ah,0x40
00A1  74 21                             je              L$3
00A3  8B 7C 24 40                       mov             edi,dword ptr 0x40[esp]
00A7  06                                push            es
00A8  8C D8                             mov             eax,ds
00AA  8E C0                             mov             es,eax
00AC  29 C9                             sub             ecx,ecx
00AE  49                                dec             ecx
00AF  31 C0                             xor             eax,eax
00B1  F2 AE                             repne scasb
00B3  F7 D1                             not             ecx
00B5  49                                dec             ecx
00B6  07                                pop             es
00B7  8D 04 09                          lea             eax,[ecx+ecx]
00BA  8D 78 02                          lea             edi,0x2[eax]
00BD  83 C0 04                          add             eax,0x00000004
00C0  01 C3                             add             ebx,eax
00C2  EB 02                             jmp             L$4
00C4                            L$3:
00C4  31 FF                             xor             edi,edi
00C6                            L$4:
00C6  53                                push            ebx
00C7  6A 42                             push            0x00000042
00C9  E8 00 00 00 00                    call            _GlobalAlloc
00CE  89 C2                             mov             edx,eax
00D0  89 C6                             mov             esi,eax
00D2  85 C0                             test            eax,eax
00D4  0F 84 96 00 00 00                 je              L$6
00DA  50                                push            eax
00DB  E8 00 00 00 00                    call            _GlobalLock
00E0  89 18                             mov             dword ptr [eax],ebx
00E2  83 C0 04                          add             eax,0x00000004
00E5  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
00E9  89 10                             mov             dword ptr [eax],edx
00EB  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
00EF  66 89 50 0A                       mov             word ptr 0xa[eax],dx
00F3  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
00F7  66 89 50 0C                       mov             word ptr 0xc[eax],dx
00FB  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
00FF  8B 0C 24                          mov             ecx,dword ptr [esp]
0102  66 89 50 0E                       mov             word ptr 0xe[eax],dx
0106  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
010A  51                                push            ecx
010B  66 89 50 10                       mov             word ptr 0x10[eax],dx
010F  8B 54 24 34                       mov             edx,dword ptr 0x34[esp]
0113  52                                push            edx
0114  83 C0 12                          add             eax,0x00000012
0117  50                                push            eax
0118  66 C7 40 F6 00 00                 mov             word ptr -0xa[eax],0x0000
011E  E8 00 00 00 00                    call            copyString
0123  83 C4 0C                          add             esp,0x0000000c
0126  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
012A  53                                push            ebx
012B  8B 4C 24 38                       mov             ecx,dword ptr 0x38[esp]
012F  51                                push            ecx
0130  50                                push            eax
0131  E8 00 00 00 00                    call            copyString
0136  83 C4 0C                          add             esp,0x0000000c
0139  55                                push            ebp
013A  8B 6C 24 3C                       mov             ebp,dword ptr 0x3c[esp]
013E  55                                push            ebp
013F  50                                push            eax
0140  E8 00 00 00 00                    call            copyString
0145  83 C4 0C                          add             esp,0x0000000c
0148  F6 44 24 1C 40                    test            byte ptr 0x1c[esp],0x40
014D  74 19                             je              L$5
014F  8B 54 24 3C                       mov             edx,dword ptr 0x3c[esp]
0153  57                                push            edi
0154  66 89 10                          mov             word ptr [eax],dx
0157  8B 54 24 44                       mov             edx,dword ptr 0x44[esp]
015B  52                                push            edx
015C  83 C0 02                          add             eax,0x00000002
015F  50                                push            eax
0160  E8 00 00 00 00                    call            copyString
0165  83 C4 0C                          add             esp,0x0000000c
0168                            L$5:
0168  56                                push            esi
0169  E8 00 00 00 00                    call            _GlobalUnlock
016E  89 F0                             mov             eax,esi
0170                            L$6:
0170  83 C4 08                          add             esp,0x00000008
0173  5D                                pop             ebp
0174  5F                                pop             edi
0175  5E                                pop             esi
0176  5B                                pop             ebx
0177  C3                                ret

Routine Size: 328 bytes,    Routine Base: _TEXT + 0030

0178                            _AddControl:
0178  53                                push            ebx
0179  56                                push            esi
017A  57                                push            edi
017B  55                                push            ebp
017C  83 EC 10                          sub             esp,0x00000010
017F  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0183  8B 5C 24 40                       mov             ebx,dword ptr 0x40[esp]
0187  8A 64 24 3F                       mov             ah,byte ptr 0x3f[esp]
018B  68 00 00 00 00                    push            offset DGROUP:L$12
0190  BA 02 00 00 00                    mov             edx,0x00000002
0195  80 CC 40                          or              ah,0x40
0198  53                                push            ebx
0199  89 54 24 10                       mov             dword ptr 0x10[esp],edx
019D  88 64 24 47                       mov             byte ptr 0x47[esp],ah
01A1  E8 00 00 00 00                    call            stricmp
01A6  83 C4 08                          add             esp,0x00000008
01A9  85 C0                             test            eax,eax
01AB  75 07                             jne             L$7
01AD  C6 44 24 0C 83                    mov             byte ptr 0xc[esp],0x83
01B2  EB 49                             jmp             L$10
01B4                            L$7:
01B4  68 08 00 00 00                    push            offset DGROUP:L$13
01B9  53                                push            ebx
01BA  E8 00 00 00 00                    call            stricmp
01BF  83 C4 08                          add             esp,0x00000008
01C2  85 C0                             test            eax,eax
01C4  75 07                             jne             L$8
01C6  C6 44 24 0C 82                    mov             byte ptr 0xc[esp],0x82
01CB  EB 30                             jmp             L$10
01CD                            L$8:
01CD  68 0F 00 00 00                    push            offset DGROUP:L$14
01D2  53                                push            ebx
01D3  E8 00 00 00 00                    call            stricmp
01D8  83 C4 08                          add             esp,0x00000008
01DB  85 C0                             test            eax,eax
01DD  75 07                             jne             L$9
01DF  C6 44 24 0C 81                    mov             byte ptr 0xc[esp],0x81
01E4  EB 17                             jmp             L$10
01E6                            L$9:
01E6  68 14 00 00 00                    push            offset DGROUP:L$15
01EB  53                                push            ebx
01EC  E8 00 00 00 00                    call            stricmp
01F1  83 C4 08                          add             esp,0x00000008
01F4  85 C0                             test            eax,eax
01F6  75 05                             jne             L$10
01F8  C6 44 24 0C 80                    mov             byte ptr 0xc[esp],0x80
01FD                            L$10:
01FD  8B 7C 24 44                       mov             edi,dword ptr 0x44[esp]
0201  31 D2                             xor             edx,edx
0203  30 C9                             xor             cl,cl
0205  8A 54 24 48                       mov             dl,byte ptr 0x48[esp]
0209  88 4C 24 0D                       mov             byte ptr 0xd[esp],cl
020D  06                                push            es
020E  8C D8                             mov             eax,ds
0210  8E C0                             mov             es,eax
0212  29 C9                             sub             ecx,ecx
0214  49                                dec             ecx
0215  31 C0                             xor             eax,eax
0217  F2 AE                             repne scasb
0219  F7 D1                             not             ecx
021B  49                                dec             ecx
021C  07                                pop             es
021D  01 C9                             add             ecx,ecx
021F  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0223  83 C1 02                          add             ecx,0x00000002
0226  83 C0 14                          add             eax,0x00000014
0229  89 54 24 04                       mov             dword ptr 0x4[esp],edx
022D  01 C8                             add             eax,ecx
022F  56                                push            esi
0230  8D 58 02                          lea             ebx,0x2[eax]
0233  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
0237  01 D3                             add             ebx,edx
0239  E8 00 00 00 00                    call            _GlobalLock
023E  56                                push            esi
023F  83 C3 07                          add             ebx,0x00000007
0242  8B 38                             mov             edi,dword ptr [eax]
0244  E8 00 00 00 00                    call            _GlobalUnlock
0249  80 E3 F8                          and             bl,0xf8
024C  6A 42                             push            0x00000042
024E  01 FB                             add             ebx,edi
0250  53                                push            ebx
0251  56                                push            esi
0252  E8 00 00 00 00                    call            _GlobalReAlloc
0257  89 C5                             mov             ebp,eax
0259  85 C0                             test            eax,eax
025B  0F 84 CF 00 00 00                 je              L$11
0261  50                                push            eax
0262  E8 00 00 00 00                    call            _GlobalLock
0267  89 C3                             mov             ebx,eax
0269  66 8B 50 0C                       mov             dx,word ptr 0xc[eax]
026D  83 C0 04                          add             eax,0x00000004
0270  42                                inc             edx
0271  66 89 50 08                       mov             word ptr 0x8[eax],dx
0275  8B 03                             mov             eax,dword ptr [ebx]
0277  01 D8                             add             eax,ebx
0279  8B 54 24 3C                       mov             edx,dword ptr 0x3c[esp]
027D  89 10                             mov             dword ptr [eax],edx
027F  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
0283  66 89 50 08                       mov             word ptr 0x8[eax],dx
0287  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
028B  66 89 50 0A                       mov             word ptr 0xa[eax],dx
028F  8B 54 24 30                       mov             edx,dword ptr 0x30[esp]
0293  66 89 50 0C                       mov             word ptr 0xc[eax],dx
0297  8B 54 24 34                       mov             edx,dword ptr 0x34[esp]
029B  66 89 50 0E                       mov             word ptr 0xe[eax],dx
029F  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
02A3  8D 74 24 0C                       lea             esi,0xc[esp]
02A7  66 89 50 10                       mov             word ptr 0x10[eax],dx
02AB  8D 50 14                          lea             edx,0x14[eax]
02AE  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
02B2  89 D7                             mov             edi,edx
02B4  66 C7 40 12 FF FF                 mov             word ptr 0x12[eax],0xffff
02BA  06                                push            es
02BB  8C D8                             mov             eax,ds
02BD  8E C0                             mov             es,eax
02BF  57                                push            edi
02C0  89 C8                             mov             eax,ecx
02C2  C1 E9 02                          shr             ecx,0x02
02C5  F2 A5                             repne movsd
02C7  8A C8                             mov             cl,al
02C9  80 E1 03                          and             cl,0x03
02CC  F2 A4                             repne movsb
02CE  5F                                pop             edi
02CF  07                                pop             es
02D0  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
02D4  40                                inc             eax
02D5  24 FE                             and             al,0xfe
02D7  01 C2                             add             edx,eax
02D9  8B 04 24                          mov             eax,dword ptr [esp]
02DC  50                                push            eax
02DD  8B 4C 24 48                       mov             ecx,dword ptr 0x48[esp]
02E1  51                                push            ecx
02E2  52                                push            edx
02E3  E8 00 00 00 00                    call            copyString
02E8  83 C4 0C                          add             esp,0x0000000c
02EB  89 C2                             mov             edx,eax
02ED  8A 44 24 48                       mov             al,byte ptr 0x48[esp]
02F1  30 E4                             xor             ah,ah
02F3  8B 74 24 4C                       mov             esi,dword ptr 0x4c[esp]
02F7  66 89 02                          mov             word ptr [edx],ax
02FA  83 C2 02                          add             edx,0x00000002
02FD  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0301  89 D7                             mov             edi,edx
0303  06                                push            es
0304  8C D8                             mov             eax,ds
0306  8E C0                             mov             es,eax
0308  57                                push            edi
0309  89 C8                             mov             eax,ecx
030B  C1 E9 02                          shr             ecx,0x02
030E  F2 A5                             repne movsd
0310  8A C8                             mov             cl,al
0312  80 E1 03                          and             cl,0x03
0315  F2 A4                             repne movsb
0317  5F                                pop             edi
0318  07                                pop             es
0319  03 54 24 04                       add             edx,dword ptr 0x4[esp]
031D  29 DA                             sub             edx,ebx
031F  8D 42 03                          lea             eax,0x3[edx]
0322  89 13                             mov             dword ptr [ebx],edx
0324  24 FC                             and             al,0xfc
0326  55                                push            ebp
0327  89 03                             mov             dword ptr [ebx],eax
0329  E8 00 00 00 00                    call            _GlobalUnlock
032E  89 E8                             mov             eax,ebp
0330                            L$11:
0330  83 C4 10                          add             esp,0x00000010
0333  5D                                pop             ebp
0334  5F                                pop             edi
0335  5E                                pop             esi
0336  5B                                pop             ebx
0337  C3                                ret

Routine Size: 448 bytes,    Routine Base: _TEXT + 0178

0338                            _DoneAddingControls:
0338  53                                push            ebx
0339  56                                push            esi
033A  57                                push            edi
033B  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
033F  52                                push            edx
0340  E8 00 00 00 00                    call            _GlobalLock
0345  8D 70 04                          lea             esi,0x4[eax]
0348  8B 08                             mov             ecx,dword ptr [eax]
034A  89 C7                             mov             edi,eax
034C  83 E9 02                          sub             ecx,0x00000002
034F  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0353  06                                push            es
0354  8C D8                             mov             eax,ds
0356  8E C0                             mov             es,eax
0358  57                                push            edi
0359  89 C8                             mov             eax,ecx
035B  C1 E9 02                          shr             ecx,0x02
035E  F2 A5                             repne movsd
0360  8A C8                             mov             cl,al
0362  80 E1 03                          and             cl,0x03
0365  F2 A4                             repne movsb
0367  5F                                pop             edi
0368  07                                pop             es
0369  53                                push            ebx
036A  E8 00 00 00 00                    call            _GlobalUnlock
036F  5F                                pop             edi
0370  5E                                pop             esi
0371  5B                                pop             ebx
0372  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 0338

0373                            _DynamicDialogBox:
0373  53                                push            ebx
0374  56                                push            esi
0375  57                                push            edi
0376  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
037A  52                                push            edx
037B  E8 00 00 00 00                    call            _GlobalLock
0380  6A 00                             push            0x00000000
0382  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0386  53                                push            ebx
0387  8B 4C 24 20                       mov             ecx,dword ptr 0x20[esp]
038B  51                                push            ecx
038C  50                                push            eax
038D  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0391  56                                push            esi
0392  8B 7C 24 30                       mov             edi,dword ptr 0x30[esp]
0396  E8 00 00 00 00                    call            _DialogBoxIndirectParamA
039B  57                                push            edi
039C  89 C3                             mov             ebx,eax
039E  E8 00 00 00 00                    call            _GlobalUnlock
03A3  57                                push            edi
03A4  E8 00 00 00 00                    call            _GlobalFree
03A9  89 D8                             mov             eax,ebx
03AB  5F                                pop             edi
03AC  5E                                pop             esi
03AD  5B                                pop             ebx
03AE  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0373

No disassembly errors

Segment: CONST DWORD USE32 0000001B bytes
0000                            L$12:
0000  6C 69 73 74 62 6F 78 00                         listbox.
0008                            L$13:
0008  73 74 61 74 69 63 00                            static.
000F                            L$14:
000F  65 64 69 74 00                                  edit.
0014                            L$15:
0014  62 75 74 74 6F 6E 00                            button.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

