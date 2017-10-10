Module: windlg2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000388 bytes
0000                            copyString_:
0000  51                                push            ecx
0001  56                                push            esi
0002  89 C1                             mov             ecx,eax
0004  89 D6                             mov             esi,edx
0006  89 DA                             mov             edx,ebx
0008  89 D0                             mov             eax,edx
000A  C1 FA 1F                          sar             edx,0x1f
000D  31 DB                             xor             ebx,ebx
000F  2B C2                             sub             eax,edx
0011  D1 F8                             sar             eax,0x01
0013  EB 0C                             jmp             L$2
0015                            L$1:
0015  31 D2                             xor             edx,edx
0017  43                                inc             ebx
0018  8A 16                             mov             dl,byte ptr [esi]
001A  46                                inc             esi
001B  66 89 11                          mov             word ptr [ecx],dx
001E  83 C1 02                          add             ecx,0x00000002
0021                            L$2:
0021  39 C3                             cmp             ebx,eax
0023  7C F0                             jl              L$1
0025  89 C8                             mov             eax,ecx
0027  5E                                pop             esi
0028  59                                pop             ecx
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

002A                            _DialogTemplate_:
002A  56                                push            esi
002B  57                                push            edi
002C  55                                push            ebp
002D  83 EC 08                          sub             esp,0x00000008
0030  50                                push            eax
0031  52                                push            edx
0032  53                                push            ebx
0033  51                                push            ecx
0034  8B 7C 24 2C                       mov             edi,dword ptr 0x2c[esp]
0038  06                                push            es
0039  8C D8                             mov             eax,ds
003B  8E C0                             mov             es,eax
003D  29 C9                             sub             ecx,ecx
003F  49                                dec             ecx
0040  31 C0                             xor             eax,eax
0042  F2 AE                             repne scasb
0044  F7 D1                             not             ecx
0046  49                                dec             ecx
0047  07                                pop             es
0048  8D 14 09                          lea             edx,[ecx+ecx]
004B  8D 42 02                          lea             eax,0x2[edx]
004E  8B 7C 24 30                       mov             edi,dword ptr 0x30[esp]
0052  89 44 24 10                       mov             dword ptr 0x10[esp],eax
0056  06                                push            es
0057  8C D8                             mov             eax,ds
0059  8E C0                             mov             es,eax
005B  29 C9                             sub             ecx,ecx
005D  49                                dec             ecx
005E  31 C0                             xor             eax,eax
0060  F2 AE                             repne scasb
0062  F7 D1                             not             ecx
0064  49                                dec             ecx
0065  07                                pop             es
0066  83 C2 18                          add             edx,0x00000018
0069  01 C9                             add             ecx,ecx
006B  8B 7C 24 34                       mov             edi,dword ptr 0x34[esp]
006F  8D 69 02                          lea             ebp,0x2[ecx]
0072  06                                push            es
0073  8C D8                             mov             eax,ds
0075  8E C0                             mov             es,eax
0077  29 C9                             sub             ecx,ecx
0079  49                                dec             ecx
007A  31 C0                             xor             eax,eax
007C  F2 AE                             repne scasb
007E  F7 D1                             not             ecx
0080  49                                dec             ecx
0081  07                                pop             es
0082  01 C9                             add             ecx,ecx
0084  01 EA                             add             edx,ebp
0086  8D 71 02                          lea             esi,0x2[ecx]
0089  8D 5C 32 03                       lea             ebx,0x3[edx+esi]
008D  8A 64 24 0C                       mov             ah,byte ptr 0xc[esp]
0091  80 E3 FC                          and             bl,0xfc
0094  F6 C4 40                          test            ah,0x40
0097  74 24                             je              L$3
0099  8B 7C 24 3C                       mov             edi,dword ptr 0x3c[esp]
009D  06                                push            es
009E  8C D8                             mov             eax,ds
00A0  8E C0                             mov             es,eax
00A2  29 C9                             sub             ecx,ecx
00A4  49                                dec             ecx
00A5  31 C0                             xor             eax,eax
00A7  F2 AE                             repne scasb
00A9  F7 D1                             not             ecx
00AB  49                                dec             ecx
00AC  07                                pop             es
00AD  01 C9                             add             ecx,ecx
00AF  8D 41 02                          lea             eax,0x2[ecx]
00B2  83 C1 04                          add             ecx,0x00000004
00B5  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00B9  01 CB                             add             ebx,ecx
00BB  EB 06                             jmp             L$4
00BD                            L$3:
00BD  31 D2                             xor             edx,edx
00BF  89 54 24 14                       mov             dword ptr 0x14[esp],edx
00C3                            L$4:
00C3  53                                push            ebx
00C4  6A 42                             push            0x00000042
00C6  E8 00 00 00 00                    call            _GlobalAlloc
00CB  89 C2                             mov             edx,eax
00CD  89 C7                             mov             edi,eax
00CF  85 C0                             test            eax,eax
00D1  0F 84 82 00 00 00                 je              L$6
00D7  50                                push            eax
00D8  E8 00 00 00 00                    call            _GlobalLock
00DD  89 18                             mov             dword ptr [eax],ebx
00DF  83 C0 04                          add             eax,0x00000004
00E2  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
00E6  89 10                             mov             dword ptr [eax],edx
00E8  83 C0 12                          add             eax,0x00000012
00EB  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00EF  66 89 50 F8                       mov             word ptr -0x8[eax],dx
00F3  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00F7  66 89 50 FA                       mov             word ptr -0x6[eax],dx
00FB  8B 14 24                          mov             edx,dword ptr [esp]
00FE  66 89 50 FC                       mov             word ptr -0x4[eax],dx
0102  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
0106  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
010A  66 89 50 FE                       mov             word ptr -0x2[eax],dx
010E  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
0112  66 C7 40 F6 00 00                 mov             word ptr -0xa[eax],0x0000
0118  E8 00 00 00 00                    call            copyString_
011D  8B 54 24 30                       mov             edx,dword ptr 0x30[esp]
0121  89 EB                             mov             ebx,ebp
0123  E8 00 00 00 00                    call            copyString_
0128  8B 54 24 34                       mov             edx,dword ptr 0x34[esp]
012C  89 F3                             mov             ebx,esi
012E  E8 00 00 00 00                    call            copyString_
0133  F6 44 24 0C 40                    test            byte ptr 0xc[esp],0x40
0138  74 17                             je              L$5
013A  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
013E  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0142  66 89 10                          mov             word ptr [eax],dx
0145  8B 54 24 3C                       mov             edx,dword ptr 0x3c[esp]
0149  83 C0 02                          add             eax,0x00000002
014C  E8 00 00 00 00                    call            copyString_
0151                            L$5:
0151  57                                push            edi
0152  E8 00 00 00 00                    call            _GlobalUnlock
0157  89 F8                             mov             eax,edi
0159                            L$6:
0159  83 C4 18                          add             esp,0x00000018
015C  5D                                pop             ebp
015D  5F                                pop             edi
015E  5E                                pop             esi
015F  C2 18 00                          ret             0x0018

Routine Size: 312 bytes,    Routine Base: _TEXT + 002A

0162                            _AddControl_:
0162  56                                push            esi
0163  57                                push            edi
0164  55                                push            ebp
0165  83 EC 1C                          sub             esp,0x0000001c
0168  8B 6C 24 38                       mov             ebp,dword ptr 0x38[esp]
016C  89 C6                             mov             esi,eax
016E  89 14 24                          mov             dword ptr [esp],edx
0171  89 5C 24 0C                       mov             dword ptr 0xc[esp],ebx
0175  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
0179  8A 64 24 37                       mov             ah,byte ptr 0x37[esp]
017D  80 CC 40                          or              ah,0x40
0180  BA 00 00 00 00                    mov             edx,offset DGROUP:L$12
0185  88 64 24 37                       mov             byte ptr 0x37[esp],ah
0189  89 E8                             mov             eax,ebp
018B  BB 02 00 00 00                    mov             ebx,0x00000002
0190  E8 00 00 00 00                    call            stricmp_
0195  85 C0                             test            eax,eax
0197  75 07                             jne             L$7
0199  C6 44 24 18 83                    mov             byte ptr 0x18[esp],0x83
019E  EB 43                             jmp             L$10
01A0                            L$7:
01A0  BA 08 00 00 00                    mov             edx,offset DGROUP:L$13
01A5  89 E8                             mov             eax,ebp
01A7  E8 00 00 00 00                    call            stricmp_
01AC  85 C0                             test            eax,eax
01AE  75 07                             jne             L$8
01B0  C6 44 24 18 82                    mov             byte ptr 0x18[esp],0x82
01B5  EB 2C                             jmp             L$10
01B7                            L$8:
01B7  BA 0F 00 00 00                    mov             edx,offset DGROUP:L$14
01BC  89 E8                             mov             eax,ebp
01BE  E8 00 00 00 00                    call            stricmp_
01C3  85 C0                             test            eax,eax
01C5  75 07                             jne             L$9
01C7  C6 44 24 18 81                    mov             byte ptr 0x18[esp],0x81
01CC  EB 15                             jmp             L$10
01CE                            L$9:
01CE  BA 14 00 00 00                    mov             edx,offset DGROUP:L$15
01D3  89 E8                             mov             eax,ebp
01D5  E8 00 00 00 00                    call            stricmp_
01DA  85 C0                             test            eax,eax
01DC  75 05                             jne             L$10
01DE  C6 44 24 18 80                    mov             byte ptr 0x18[esp],0x80
01E3                            L$10:
01E3  30 C0                             xor             al,al
01E5  8B 7C 24 3C                       mov             edi,dword ptr 0x3c[esp]
01E9  88 44 24 19                       mov             byte ptr 0x19[esp],al
01ED  06                                push            es
01EE  8C D8                             mov             eax,ds
01F0  8E C0                             mov             es,eax
01F2  29 C9                             sub             ecx,ecx
01F4  49                                dec             ecx
01F5  31 C0                             xor             eax,eax
01F7  F2 AE                             repne scasb
01F9  F7 D1                             not             ecx
01FB  49                                dec             ecx
01FC  07                                pop             es
01FD  01 C9                             add             ecx,ecx
01FF  8D 43 14                          lea             eax,0x14[ebx]
0202  83 C1 02                          add             ecx,0x00000002
0205  56                                push            esi
0206  89 CA                             mov             edx,ecx
0208  89 4C 24 14                       mov             dword ptr 0x14[esp],ecx
020C  31 CA                             xor             edx,ecx
020E  01 C8                             add             eax,ecx
0210  8A 54 24 44                       mov             dl,byte ptr 0x44[esp]
0214  83 C0 02                          add             eax,0x00000002
0217  89 54 24 08                       mov             dword ptr 0x8[esp],edx
021B  8D 2C 02                          lea             ebp,[edx+eax]
021E  E8 00 00 00 00                    call            _GlobalLock
0223  83 C5 07                          add             ebp,0x00000007
0226  8B 08                             mov             ecx,dword ptr [eax]
0228  83 E5 F8                          and             ebp,0xfffffff8
022B  56                                push            esi
022C  01 CD                             add             ebp,ecx
022E  E8 00 00 00 00                    call            _GlobalUnlock
0233  6A 42                             push            0x00000042
0235  55                                push            ebp
0236  56                                push            esi
0237  E8 00 00 00 00                    call            _GlobalReAlloc
023C  89 44 24 14                       mov             dword ptr 0x14[esp],eax
0240  85 C0                             test            eax,eax
0242  0F 84 CE 00 00 00                 je              L$11
0248  50                                push            eax
0249  E8 00 00 00 00                    call            _GlobalLock
024E  89 C5                             mov             ebp,eax
0250  66 8B 50 0C                       mov             dx,word ptr 0xc[eax]
0254  83 C0 04                          add             eax,0x00000004
0257  42                                inc             edx
0258  66 89 50 08                       mov             word ptr 0x8[eax],dx
025C  8B 45 00                          mov             eax,dword ptr [ebp]
025F  01 E8                             add             eax,ebp
0261  8B 54 24 34                       mov             edx,dword ptr 0x34[esp]
0265  89 10                             mov             dword ptr [eax],edx
0267  8B 14 24                          mov             edx,dword ptr [esp]
026A  66 89 50 08                       mov             word ptr 0x8[eax],dx
026E  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0272  66 89 50 0A                       mov             word ptr 0xa[eax],dx
0276  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
027A  66 89 50 0C                       mov             word ptr 0xc[eax],dx
027E  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
0282  66 89 50 0E                       mov             word ptr 0xe[eax],dx
0286  8B 54 24 30                       mov             edx,dword ptr 0x30[esp]
028A  8D 74 24 18                       lea             esi,0x18[esp]
028E  66 89 50 10                       mov             word ptr 0x10[eax],dx
0292  8D 50 14                          lea             edx,0x14[eax]
0295  89 D9                             mov             ecx,ebx
0297  89 D7                             mov             edi,edx
0299  66 C7 40 12 FF FF                 mov             word ptr 0x12[eax],0xffff
029F  06                                push            es
02A0  8C D8                             mov             eax,ds
02A2  8E C0                             mov             es,eax
02A4  57                                push            edi
02A5  89 C8                             mov             eax,ecx
02A7  C1 E9 02                          shr             ecx,0x02
02AA  F2 A5                             repne movsd
02AC  8A C8                             mov             cl,al
02AE  80 E1 03                          and             cl,0x03
02B1  F2 A4                             repne movsb
02B3  5F                                pop             edi
02B4  07                                pop             es
02B5  8D 43 01                          lea             eax,0x1[ebx]
02B8  24 FE                             and             al,0xfe
02BA  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
02BE  01 D0                             add             eax,edx
02C0  8B 54 24 3C                       mov             edx,dword ptr 0x3c[esp]
02C4  E8 00 00 00 00                    call            copyString_
02C9  89 C2                             mov             edx,eax
02CB  8A 44 24 40                       mov             al,byte ptr 0x40[esp]
02CF  30 E4                             xor             ah,ah
02D1  8B 74 24 44                       mov             esi,dword ptr 0x44[esp]
02D5  66 89 02                          mov             word ptr [edx],ax
02D8  83 C2 02                          add             edx,0x00000002
02DB  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
02DF  89 D7                             mov             edi,edx
02E1  06                                push            es
02E2  8C D8                             mov             eax,ds
02E4  8E C0                             mov             es,eax
02E6  57                                push            edi
02E7  89 C8                             mov             eax,ecx
02E9  C1 E9 02                          shr             ecx,0x02
02EC  F2 A5                             repne movsd
02EE  8A C8                             mov             cl,al
02F0  80 E1 03                          and             cl,0x03
02F3  F2 A4                             repne movsb
02F5  5F                                pop             edi
02F6  07                                pop             es
02F7  03 54 24 04                       add             edx,dword ptr 0x4[esp]
02FB  29 EA                             sub             edx,ebp
02FD  8D 42 03                          lea             eax,0x3[edx]
0300  89 55 00                          mov             dword ptr [ebp],edx
0303  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0307  24 FC                             and             al,0xfc
0309  52                                push            edx
030A  89 45 00                          mov             dword ptr [ebp],eax
030D  E8 00 00 00 00                    call            _GlobalUnlock
0312  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0316                            L$11:
0316  83 C4 1C                          add             esp,0x0000001c
0319  5D                                pop             ebp
031A  5F                                pop             edi
031B  5E                                pop             esi
031C  C2 1C 00                          ret             0x001c

Routine Size: 445 bytes,    Routine Base: _TEXT + 0162

031F                            _DoneAddingControls_:
031F  53                                push            ebx
0320  51                                push            ecx
0321  52                                push            edx
0322  56                                push            esi
0323  57                                push            edi
0324  89 C3                             mov             ebx,eax
0326  50                                push            eax
0327  E8 00 00 00 00                    call            _GlobalLock
032C  8D 70 04                          lea             esi,0x4[eax]
032F  8B 08                             mov             ecx,dword ptr [eax]
0331  89 C7                             mov             edi,eax
0333  83 E9 02                          sub             ecx,0x00000002
0336  06                                push            es
0337  8C D8                             mov             eax,ds
0339  8E C0                             mov             es,eax
033B  57                                push            edi
033C  89 C8                             mov             eax,ecx
033E  C1 E9 02                          shr             ecx,0x02
0341  F2 A5                             repne movsd
0343  8A C8                             mov             cl,al
0345  80 E1 03                          and             cl,0x03
0348  F2 A4                             repne movsb
034A  5F                                pop             edi
034B  07                                pop             es
034C  53                                push            ebx
034D  E8 00 00 00 00                    call            _GlobalUnlock
0352  5F                                pop             edi
0353  5E                                pop             esi
0354  5A                                pop             edx
0355  59                                pop             ecx
0356  5B                                pop             ebx
0357  C3                                ret

Routine Size: 57 bytes,    Routine Base: _TEXT + 031F

0358                            _DynamicDialogBox_:
0358  56                                push            esi
0359  57                                push            edi
035A  55                                push            ebp
035B  89 C5                             mov             ebp,eax
035D  89 D7                             mov             edi,edx
035F  89 DE                             mov             esi,ebx
0361  89 CB                             mov             ebx,ecx
0363  51                                push            ecx
0364  E8 00 00 00 00                    call            _GlobalLock
0369  6A 00                             push            0x00000000
036B  55                                push            ebp
036C  56                                push            esi
036D  50                                push            eax
036E  57                                push            edi
036F  E8 00 00 00 00                    call            _DialogBoxIndirectParamA
0374  53                                push            ebx
0375  89 C6                             mov             esi,eax
0377  E8 00 00 00 00                    call            _GlobalUnlock
037C  53                                push            ebx
037D  E8 00 00 00 00                    call            _GlobalFree
0382  89 F0                             mov             eax,esi
0384  5D                                pop             ebp
0385  5F                                pop             edi
0386  5E                                pop             esi
0387  C3                                ret

Routine Size: 48 bytes,    Routine Base: _TEXT + 0358

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

