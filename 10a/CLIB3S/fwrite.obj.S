Module: fwrite
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000220 bytes
0000                            fwrite:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
000B  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
000F  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0012  52                                push            edx
0013  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0019  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
001C  83 C4 04                          add             esp,0x00000004
001F  F6 C4 02                          test            ah,0x02
0022  75 27                             jne             L$1
0024  6A 04                             push            0x00000004
0026  E8 00 00 00 00                    call            __set_errno
002B  83 C4 04                          add             esp,0x00000004
002E  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
0031  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0034  80 CC 20                          or              ah,0x20
0037  52                                push            edx
0038  88 63 0C                          mov             byte ptr 0xc[ebx],ah
003B  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0041  83 C4 04                          add             esp,0x00000004
0044  31 C0                             xor             eax,eax
0046  E9 CD 01 00 00                    jmp             L$16
004B                            L$1:
004B  0F AF 7C 24 24                    imul            edi,dword ptr 0x24[esp]
0050  85 FF                             test            edi,edi
0052  75 14                             jne             L$2
0054  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0057  50                                push            eax
0058  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
005E  83 C4 04                          add             esp,0x00000004
0061  89 F8                             mov             eax,edi
0063  E9 B0 01 00 00                    jmp             L$16
0068                            L$2:
0068  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
006C  75 09                             jne             L$3
006E  53                                push            ebx
006F  E8 00 00 00 00                    call            __ioalloc
0074  83 C4 04                          add             esp,0x00000004
0077                            L$3:
0077  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
007A  8A 53 0C                          mov             dl,byte ptr 0xc[ebx]
007D  31 ED                             xor             ebp,ebp
007F  83 E0 30                          and             eax,0x00000030
0082  80 E2 CF                          and             dl,0xcf
0085  89 6C 24 04                       mov             dword ptr 0x4[esp],ebp
0089  89 04 24                          mov             dword ptr [esp],eax
008C  88 53 0C                          mov             byte ptr 0xc[ebx],dl
008F  F6 C2 40                          test            dl,0x40
0092  0F 84 EA 00 00 00                 je              L$11
0098  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
009C                            L$4:
009C  83 7B 04 00                       cmp             dword ptr 0x4[ebx],0x00000000
00A0  75 52                             jne             L$7
00A2  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00A6  3B 43 14                          cmp             eax,dword ptr 0x14[ebx]
00A9  72 49                             jb              L$7
00AB  89 C5                             mov             ebp,eax
00AD  81 E5 00 FE FF FF                 and             ebp,0xfffffe00
00B3  75 02                             jne             L$5
00B5  89 C5                             mov             ebp,eax
00B7                            L$5:
00B7  55                                push            ebp
00B8  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
00BC  56                                push            esi
00BD  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
00C0  57                                push            edi
00C1  E8 00 00 00 00                    call            write
00C6  83 C4 0C                          add             esp,0x0000000c
00C9  83 F8 FF                          cmp             eax,0xffffffff
00CC  75 09                             jne             L$6
00CE  80 4B 0C 20                       or              byte ptr 0xc[ebx],0x20
00D2  E9 7B 00 00 00                    jmp             L$10
00D7                            L$6:
00D7  39 E8                             cmp             eax,ebp
00D9  0F 84 73 00 00 00                 je              L$10
00DF  6A 0C                             push            0x0000000c
00E1  E8 00 00 00 00                    call            __set_errno
00E6  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
00E9  80 CC 20                          or              ah,0x20
00EC  83 C4 04                          add             esp,0x00000004
00EF  88 63 0C                          mov             byte ptr 0xc[ebx],ah
00F2  EB 5E                             jmp             L$10
00F4                            L$7:
00F4  8B 6B 14                          mov             ebp,dword ptr 0x14[ebx]
00F7  8B 73 04                          mov             esi,dword ptr 0x4[ebx]
00FA  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
00FE  29 F5                             sub             ebp,esi
0100  39 FD                             cmp             ebp,edi
0102  76 02                             jbe             L$8
0104  89 FD                             mov             ebp,edi
0106                            L$8:
0106  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
010A  89 E9                             mov             ecx,ebp
010C  8B 3B                             mov             edi,dword ptr [ebx]
010E  06                                push            es
010F  8C D8                             mov             eax,ds
0111  8E C0                             mov             es,eax
0113  57                                push            edi
0114  89 C8                             mov             eax,ecx
0116  C1 E9 02                          shr             ecx,0x02
0119  F2 A5                             repne movsd
011B  8A C8                             mov             cl,al
011D  80 E1 03                          and             cl,0x03
0120  F2 A4                             repne movsb
0122  5F                                pop             edi
0123  07                                pop             es
0124  8B 03                             mov             eax,dword ptr [ebx]
0126  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
0129  8A 6B 0D                          mov             ch,byte ptr 0xd[ebx]
012C  01 E8                             add             eax,ebp
012E  01 EA                             add             edx,ebp
0130  89 03                             mov             dword ptr [ebx],eax
0132  80 CD 10                          or              ch,0x10
0135  89 53 04                          mov             dword ptr 0x4[ebx],edx
0138  88 6B 0D                          mov             byte ptr 0xd[ebx],ch
013B  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
013E  3B 43 14                          cmp             eax,dword ptr 0x14[ebx]
0141  74 06                             je              L$9
0143  F6 43 0D 04                       test            byte ptr 0xd[ebx],0x04
0147  74 09                             je              L$10
0149                            L$9:
0149  53                                push            ebx
014A  E8 00 00 00 00                    call            __flush
014F  83 C4 04                          add             esp,0x00000004
0152                            L$10:
0152  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0156  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
015A  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
015E  01 E8                             add             eax,ebp
0160  01 EA                             add             edx,ebp
0162  89 44 24 20                       mov             dword ptr 0x20[esp],eax
0166  89 54 24 04                       mov             dword ptr 0x4[esp],edx
016A  29 E9                             sub             ecx,ebp
016C  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
0170  0F 84 74 00 00 00                 je              L$14
0176  F6 43 0C 20                       test            byte ptr 0xc[ebx],0x20
017A  0F 84 1C FF FF FF                 je              L$4
0180  EB 68                             jmp             L$14
0182                            L$11:
0182  8A 4B 0D                          mov             cl,byte ptr 0xd[ebx]
0185  F6 C1 04                          test            cl,0x04
0188  74 14                             je              L$12
018A  88 CD                             mov             ch,cl
018C  80 E5 FA                          and             ch,0xfa
018F  88 E8                             mov             al,ch
0191  88 6B 0D                          mov             byte ptr 0xd[ebx],ch
0194  0C 01                             or              al,0x01
0196  BD 01 00 00 00                    mov             ebp,0x00000001
019B  88 43 0D                          mov             byte ptr 0xd[ebx],al
019E                            L$12:
019E  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
01A2  31 C0                             xor             eax,eax
01A4  53                                push            ebx
01A5  8A 02                             mov             al,byte ptr [edx]
01A7  8D 4A 01                          lea             ecx,0x1[edx]
01AA  50                                push            eax
01AB  89 4C 24 28                       mov             dword ptr 0x28[esp],ecx
01AF  E8 00 00 00 00                    call            fputc
01B4  8A 53 0C                          mov             dl,byte ptr 0xc[ebx]
01B7  83 C4 08                          add             esp,0x00000008
01BA  F6 C2 30                          test            dl,0x30
01BD  75 0D                             jne             L$13
01BF  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
01C3  46                                inc             esi
01C4  89 74 24 04                       mov             dword ptr 0x4[esp],esi
01C8  39 F7                             cmp             edi,esi
01CA  75 D2                             jne             L$12
01CC                            L$13:
01CC  85 ED                             test            ebp,ebp
01CE  74 1A                             je              L$14
01D0  8A 73 0D                          mov             dh,byte ptr 0xd[ebx]
01D3  80 E6 FA                          and             dh,0xfa
01D6  88 F1                             mov             cl,dh
01D8  88 73 0D                          mov             byte ptr 0xd[ebx],dh
01DB  80 C9 04                          or              cl,0x04
01DE  53                                push            ebx
01DF  88 4B 0D                          mov             byte ptr 0xd[ebx],cl
01E2  E8 00 00 00 00                    call            __flush
01E7  83 C4 04                          add             esp,0x00000004
01EA                            L$14:
01EA  F6 43 0C 20                       test            byte ptr 0xc[ebx],0x20
01EE  74 06                             je              L$15
01F0  31 FF                             xor             edi,edi
01F2  89 7C 24 04                       mov             dword ptr 0x4[esp],edi
01F6                            L$15:
01F6  8B 04 24                          mov             eax,dword ptr [esp]
01F9  8B 6B 0C                          mov             ebp,dword ptr 0xc[ebx]
01FC  09 C5                             or              ebp,eax
01FE  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0201  50                                push            eax
0202  89 6B 0C                          mov             dword ptr 0xc[ebx],ebp
0205  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
020B  83 C4 04                          add             esp,0x00000004
020E  31 D2                             xor             edx,edx
0210  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0214  F7 74 24 24                       div             dword ptr 0x24[esp]
0218                            L$16:
0218  83 C4 0C                          add             esp,0x0000000c
021B  5D                                pop             ebp
021C  5F                                pop             edi
021D  5E                                pop             esi
021E  5B                                pop             ebx
021F  C3                                ret

Routine Size: 544 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

