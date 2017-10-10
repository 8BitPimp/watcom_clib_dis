Module: write
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002F2 bytes
0000                            write:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  89 E5                             mov             ebp,esp
0006  83 EC 14                          sub             esp,0x00000014
0009  8B 7D 14                          mov             edi,dword ptr 0x14[ebp]
000C  8B 15 00 00 00 00                 mov             edx,dword ptr __FileHandleIDs
0012  89 F8                             mov             eax,edi
0014  8B 04 82                          mov             eax,dword ptr [edx+eax*4]
0017  57                                push            edi
0018  89 45 FC                          mov             dword ptr -0x4[ebp],eax
001B  E8 00 00 00 00                    call            __IOMode
0020  89 C3                             mov             ebx,eax
0022  83 C4 04                          add             esp,0x00000004
0025  89 45 EC                          mov             dword ptr -0x14[ebp],eax
0028  85 C0                             test            eax,eax
002A  75 11                             jne             L$2
002C  6A 04                             push            0x00000004
002E                            L$1:
002E  E8 00 00 00 00                    call            __set_errno
0033  B8 FF FF FF FF                    mov             eax,0xffffffff
0038  E9 AB 02 00 00                    jmp             L$23
003D                            L$2:
003D  A8 02                             test            al,0x02
003F  75 04                             jne             L$3
0041  6A 06                             push            0x00000006
0043  EB E9                             jmp             L$1
0045                            L$3:
0045  57                                push            edi
0046  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
004C  83 C4 04                          add             esp,0x00000004
004F  F6 C3 80                          test            bl,0x80
0052  74 28                             je              L$5
0054  6A 02                             push            0x00000002
0056  6A 00                             push            0x00000000
0058  6A 00                             push            0x00000000
005A  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
005D  52                                push            edx
005E  E8 00 00 00 00                    call            _SetFilePointer
0063  83 F8 FF                          cmp             eax,0xffffffff
0066  75 14                             jne             L$5
0068                            L$4:
0068  57                                push            edi
0069  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
006F  83 C4 04                          add             esp,0x00000004
0072  E8 00 00 00 00                    call            __set_errno_nt
0077  E9 6F 02 00 00                    jmp             L$24
007C                            L$5:
007C  F6 45 EC 40                       test            byte ptr -0x14[ebp],0x40
0080  74 6A                             je              L$8
0082  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
0089  74 25                             je              L$6
008B  57                                push            edi
008C  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0092  83 C4 04                          add             esp,0x00000004
0095  85 C0                             test            eax,eax
0097  74 17                             je              L$6
0099  8B 4D 1C                          mov             ecx,dword ptr 0x1c[ebp]
009C  51                                push            ecx
009D  8B 75 18                          mov             esi,dword ptr 0x18[ebp]
00A0  56                                push            esi
00A1  50                                push            eax
00A2  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
00A8  83 C4 0C                          add             esp,0x0000000c
00AB  89 45 F8                          mov             dword ptr -0x8[ebp],eax
00AE  EB 1B                             jmp             L$7
00B0                            L$6:
00B0  6A 00                             push            0x00000000
00B2  8D 45 F8                          lea             eax,-0x8[ebp]
00B5  50                                push            eax
00B6  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
00B9  50                                push            eax
00BA  8B 55 18                          mov             edx,dword ptr 0x18[ebp]
00BD  52                                push            edx
00BE  8B 5D FC                          mov             ebx,dword ptr -0x4[ebp]
00C1  53                                push            ebx
00C2  E8 00 00 00 00                    call            _WriteFile
00C7  85 C0                             test            eax,eax
00C9  74 9D                             je              L$4
00CB                            L$7:
00CB  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
00CE  3B 45 1C                          cmp             eax,dword ptr 0x1c[ebp]
00D1  0F 84 07 02 00 00                 je              L$22
00D7  6A 0C                             push            0x0000000c
00D9  E8 00 00 00 00                    call            __set_errno
00DE  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
00E1  83 C4 04                          add             esp,0x00000004
00E4  89 45 1C                          mov             dword ptr 0x1c[ebp],eax
00E7  E9 F2 01 00 00                    jmp             L$22
00EC                            L$8:
00EC  E8 00 00 00 00                    call            stackavail
00F1  89 45 F4                          mov             dword ptr -0xc[ebp],eax
00F4  3D B0 00 00 00                    cmp             eax,0x000000b0
00F9  73 05                             jae             L$9
00FB  E8 00 00 00 00                    call            __STKOVERFLOW
0100                            L$9:
0100  8B 4D F4                          mov             ecx,dword ptr -0xc[ebp]
0103  BB 00 02 00 00                    mov             ebx,0x00000200
0108  81 F9 30 02 00 00                 cmp             ecx,0x00000230
010E  73 05                             jae             L$10
0110  BB 80 00 00 00                    mov             ebx,0x00000080
0115                            L$10:
0115  8D 43 03                          lea             eax,0x3[ebx]
0118  24 FC                             and             al,0xfc
011A  29 C4                             sub             esp,eax
011C  31 C0                             xor             eax,eax
011E  89 E6                             mov             esi,esp
0120  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0123  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0126  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0129                            L$11:
0129  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
012C  3B 45 1C                          cmp             eax,dword ptr 0x1c[ebp]
012F  0F 83 32 01 00 00                 jae             L$19
0135  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
0138  03 45 F4                          add             eax,dword ptr -0xc[ebp]
013B  80 38 0A                          cmp             byte ptr [eax],0x0a
013E  0F 85 88 00 00 00                 jne             L$15
0144  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
0147  C6 04 06 0D                       mov             byte ptr [esi+eax],0x0d
014B  8B 4D F0                          mov             ecx,dword ptr -0x10[ebp]
014E  41                                inc             ecx
014F  89 4D F0                          mov             dword ptr -0x10[ebp],ecx
0152  39 CB                             cmp             ebx,ecx
0154  0F 85 72 00 00 00                 jne             L$15
015A  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
0161  74 1F                             je              L$12
0163  57                                push            edi
0164  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
016A  83 C4 04                          add             esp,0x00000004
016D  85 C0                             test            eax,eax
016F  74 11                             je              L$12
0171  53                                push            ebx
0172  56                                push            esi
0173  50                                push            eax
0174  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
017A  83 C4 0C                          add             esp,0x0000000c
017D  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0180  EB 19                             jmp             L$13
0182                            L$12:
0182  6A 00                             push            0x00000000
0184  8D 45 F0                          lea             eax,-0x10[ebp]
0187  50                                push            eax
0188  53                                push            ebx
0189  56                                push            esi
018A  8B 4D FC                          mov             ecx,dword ptr -0x4[ebp]
018D  51                                push            ecx
018E  E8 00 00 00 00                    call            _WriteFile
0193  85 C0                             test            eax,eax
0195  0F 84 CD FE FF FF                 je              L$4
019B                            L$13:
019B  3B 5D F0                          cmp             ebx,dword ptr -0x10[ebp]
019E  74 21                             je              L$14
01A0  6A 0C                             push            0x0000000c
01A2  E8 00 00 00 00                    call            __set_errno
01A7  83 C4 04                          add             esp,0x00000004
01AA  57                                push            edi
01AB  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
01B1  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
01B4  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
01B7  83 C4 04                          add             esp,0x00000004
01BA  01 D8                             add             eax,ebx
01BC  E9 2A 01 00 00                    jmp             L$24
01C1                            L$14:
01C1  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
01C4  31 D2                             xor             edx,edx
01C6  89 45 F8                          mov             dword ptr -0x8[ebp],eax
01C9  89 55 F0                          mov             dword ptr -0x10[ebp],edx
01CC                            L$15:
01CC  8B 55 18                          mov             edx,dword ptr 0x18[ebp]
01CF  03 55 F4                          add             edx,dword ptr -0xc[ebp]
01D2  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
01D5  8A 12                             mov             dl,byte ptr [edx]
01D7  88 14 06                          mov             byte ptr [esi+eax],dl
01DA  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
01DD  8B 55 F0                          mov             edx,dword ptr -0x10[ebp]
01E0  40                                inc             eax
01E1  42                                inc             edx
01E2  89 45 F4                          mov             dword ptr -0xc[ebp],eax
01E5  89 55 F0                          mov             dword ptr -0x10[ebp],edx
01E8  39 D3                             cmp             ebx,edx
01EA  0F 85 39 FF FF FF                 jne             L$11
01F0  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
01F7  74 1F                             je              L$16
01F9  57                                push            edi
01FA  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0200  83 C4 04                          add             esp,0x00000004
0203  85 C0                             test            eax,eax
0205  74 11                             je              L$16
0207  53                                push            ebx
0208  56                                push            esi
0209  50                                push            eax
020A  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
0210  83 C4 0C                          add             esp,0x0000000c
0213  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0216  EB 19                             jmp             L$17
0218                            L$16:
0218  6A 00                             push            0x00000000
021A  8D 45 F0                          lea             eax,-0x10[ebp]
021D  50                                push            eax
021E  53                                push            ebx
021F  56                                push            esi
0220  8B 55 FC                          mov             edx,dword ptr -0x4[ebp]
0223  52                                push            edx
0224  E8 00 00 00 00                    call            _WriteFile
0229  85 C0                             test            eax,eax
022B  0F 84 37 FE FF FF                 je              L$4
0231                            L$17:
0231  3B 5D F0                          cmp             ebx,dword ptr -0x10[ebp]
0234  74 21                             je              L$18
0236  6A 0C                             push            0x0000000c
0238  E8 00 00 00 00                    call            __set_errno
023D  83 C4 04                          add             esp,0x00000004
0240  57                                push            edi
0241  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0247  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
024A  8B 55 F0                          mov             edx,dword ptr -0x10[ebp]
024D  83 C4 04                          add             esp,0x00000004
0250  01 D0                             add             eax,edx
0252  E9 94 00 00 00                    jmp             L$24
0257                            L$18:
0257  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
025A  89 45 F8                          mov             dword ptr -0x8[ebp],eax
025D  31 C0                             xor             eax,eax
025F  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0262  E9 C2 FE FF FF                    jmp             L$11
0267                            L$19:
0267  83 7D F0 00                       cmp             dword ptr -0x10[ebp],0x00000000
026B  0F 84 6D 00 00 00                 je              L$22
0271  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
0278  74 22                             je              L$20
027A  57                                push            edi
027B  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0281  83 C4 04                          add             esp,0x00000004
0284  85 C0                             test            eax,eax
0286  74 14                             je              L$20
0288  8B 55 F0                          mov             edx,dword ptr -0x10[ebp]
028B  52                                push            edx
028C  56                                push            esi
028D  50                                push            eax
028E  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
0294  83 C4 0C                          add             esp,0x0000000c
0297  89 45 F4                          mov             dword ptr -0xc[ebp],eax
029A  EB 1C                             jmp             L$21
029C                            L$20:
029C  6A 00                             push            0x00000000
029E  8D 45 F4                          lea             eax,-0xc[ebp]
02A1  50                                push            eax
02A2  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
02A5  53                                push            ebx
02A6  56                                push            esi
02A7  8B 4D FC                          mov             ecx,dword ptr -0x4[ebp]
02AA  51                                push            ecx
02AB  E8 00 00 00 00                    call            _WriteFile
02B0  85 C0                             test            eax,eax
02B2  0F 84 B0 FD FF FF                 je              L$4
02B8                            L$21:
02B8  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
02BB  3B 45 F0                          cmp             eax,dword ptr -0x10[ebp]
02BE  74 1E                             je              L$22
02C0  6A 0C                             push            0x0000000c
02C2  E8 00 00 00 00                    call            __set_errno
02C7  83 C4 04                          add             esp,0x00000004
02CA  57                                push            edi
02CB  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
02D1  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
02D4  8B 4D F4                          mov             ecx,dword ptr -0xc[ebp]
02D7  83 C4 04                          add             esp,0x00000004
02DA  01 C8                             add             eax,ecx
02DC  EB 0D                             jmp             L$24
02DE                            L$22:
02DE  57                                push            edi
02DF  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
02E5  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
02E8                            L$23:
02E8  83 C4 04                          add             esp,0x00000004
02EB                            L$24:
02EB  89 EC                             mov             esp,ebp
02ED  5D                                pop             ebp
02EE  5F                                pop             edi
02EF  5E                                pop             esi
02F0  5B                                pop             ebx
02F1  C3                                ret

Routine Size: 754 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

