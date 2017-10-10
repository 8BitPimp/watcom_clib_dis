Module: fopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000031F bytes
0000                            __open_flags:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0009  31 C0                             xor             eax,eax
000B  8A 06                             mov             al,byte ptr [esi]
000D  50                                push            eax
000E  E8 00 00 00 00                    call            tolower
0013  83 C4 04                          add             esp,0x00000004
0016  31 DB                             xor             ebx,ebx
0018  88 04 24                          mov             byte ptr [esp],al
001B  25 FF 00 00 00                    and             eax,0x000000ff
0020  83 F8 72                          cmp             eax,0x00000072
0023  74 1B                             je              L$1
0025  83 F8 77                          cmp             eax,0x00000077
0028  74 16                             je              L$1
002A  83 F8 61                          cmp             eax,0x00000061
002D  74 11                             je              L$1
002F  6A 09                             push            0x00000009
0031  E8 00 00 00 00                    call            __set_errno
0036  83 C4 04                          add             esp,0x00000004
0039  31 C0                             xor             eax,eax
003B  E9 89 00 00 00                    jmp             L$12
0040                            L$1:
0040  31 C0                             xor             eax,eax
0042  89 D9                             mov             ecx,ebx
0044  8A 46 01                          mov             al,byte ptr 0x1[esi]
0047  80 C9 03                          or              cl,0x03
004A  83 F8 2B                          cmp             eax,0x0000002b
004D  75 24                             jne             L$4
004F  31 C0                             xor             eax,eax
0051  89 CB                             mov             ebx,ecx
0053  8A 46 02                          mov             al,byte ptr 0x2[esi]
0056  80 C9 40                          or              cl,0x40
0059  83 F8 62                          cmp             eax,0x00000062
005C  74 11                             je              L$3
005E  83 F8 74                          cmp             eax,0x00000074
0061  74 48                             je              L$8
0063  81 3D 00 00 00 00 00 02 00 00
                                        cmp             dword ptr _fmode,0x00000200
006D                            L$2:
006D  75 3C                             jne             L$8
006F                            L$3:
006F  89 CB                             mov             ebx,ecx
0071  EB 38                             jmp             L$8
0073                            L$4:
0073  89 DA                             mov             edx,ebx
0075  80 CA 40                          or              dl,0x40
0078  83 F8 62                          cmp             eax,0x00000062
007B  75 11                             jne             L$5
007D  31 C0                             xor             eax,eax
007F  8A 46 02                          mov             al,byte ptr 0x2[esi]
0082  89 D3                             mov             ebx,edx
0084  83 F8 2B                          cmp             eax,0x0000002b
0087  75 22                             jne             L$8
0089  80 CA 03                          or              dl,0x03
008C  EB 1B                             jmp             L$7
008E                            L$5:
008E  83 F8 74                          cmp             eax,0x00000074
0091  75 0A                             jne             L$6
0093  31 C0                             xor             eax,eax
0095  8A 46 02                          mov             al,byte ptr 0x2[esi]
0098  83 F8 2B                          cmp             eax,0x0000002b
009B  EB D0                             jmp             L$2
009D                            L$6:
009D  81 3D 00 00 00 00 00 02 00 00
                                        cmp             dword ptr _fmode,0x00000200
00A7  75 02                             jne             L$8
00A9                            L$7:
00A9  89 D3                             mov             ebx,edx
00AB                            L$8:
00AB  31 C0                             xor             eax,eax
00AD  8A 04 24                          mov             al,byte ptr [esp]
00B0  83 F8 77                          cmp             eax,0x00000077
00B3  75 05                             jne             L$9
00B5  80 CB 02                          or              bl,0x02
00B8  EB 0D                             jmp             L$11
00BA                            L$9:
00BA  83 F8 61                          cmp             eax,0x00000061
00BD  75 05                             jne             L$10
00BF  80 CB 82                          or              bl,0x82
00C2  EB 03                             jmp             L$11
00C4                            L$10:
00C4  80 CB 01                          or              bl,0x01
00C7                            L$11:
00C7  89 D8                             mov             eax,ebx
00C9                            L$12:
00C9  83 C4 04                          add             esp,0x00000004
00CC  5E                                pop             esi
00CD  5B                                pop             ebx
00CE  C3                                ret
00CF                            __doopen:
00CF  53                                push            ebx
00D0  56                                push            esi
00D1  57                                push            edi
00D2  55                                push            ebp
00D3  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
00D7  80 63 0C FC                       and             byte ptr 0xc[ebx],0xfc
00DB  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
00DF  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
00E2  09 C2                             or              edx,eax
00E4  31 C0                             xor             eax,eax
00E6  8A 44 24 18                       mov             al,byte ptr 0x18[esp]
00EA  50                                push            eax
00EB  89 53 0C                          mov             dword ptr 0xc[ebx],edx
00EE  E8 00 00 00 00                    call            tolower
00F3  83 C4 04                          add             esp,0x00000004
00F6  25 FF 00 00 00                    and             eax,0x000000ff
00FB  83 F8 72                          cmp             eax,0x00000072
00FE  75 2E                             jne             L$16
0100  8A 6C 24 1C                       mov             ch,byte ptr 0x1c[esp]
0104  31 C0                             xor             eax,eax
0106  F6 C5 02                          test            ch,0x02
0109  74 05                             je              L$13
010B  B8 02 00 00 00                    mov             eax,0x00000002
0110                            L$13:
0110  F6 44 24 1C 40                    test            byte ptr 0x1c[esp],0x40
0115  74 05                             je              L$14
0117  80 CC 02                          or              ah,0x02
011A  EB 03                             jmp             L$15
011C                            L$14:
011C  80 CC 01                          or              ah,0x01
011F                            L$15:
011F  6A 00                             push            0x00000000
0121  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0125  57                                push            edi
0126  50                                push            eax
0127  8B 6C 24 20                       mov             ebp,dword ptr 0x20[esp]
012B  55                                push            ebp
012C  EB 3C                             jmp             L$21
012E                            L$16:
012E  8A 54 24 1C                       mov             dl,byte ptr 0x1c[esp]
0132  F6 C2 01                          test            dl,0x01
0135  0F 95 C0                          setne           al
0138  25 FF 00 00 00                    and             eax,0x000000ff
013D  83 C0 21                          add             eax,0x00000021
0140  F6 C2 80                          test            dl,0x80
0143  74 04                             je              L$17
0145  0C 10                             or              al,0x10
0147  EB 02                             jmp             L$18
0149                            L$17:
0149  0C 40                             or              al,0x40
014B                            L$18:
014B  F6 44 24 1C 40                    test            byte ptr 0x1c[esp],0x40
0150  74 05                             je              L$19
0152  80 CC 02                          or              ah,0x02
0155  EB 03                             jmp             L$20
0157                            L$19:
0157  80 CC 01                          or              ah,0x01
015A                            L$20:
015A  68 80 01 00 00                    push            0x00000180
015F  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
0163  51                                push            ecx
0164  50                                push            eax
0165  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
0169  56                                push            esi
016A                            L$21:
016A  E8 00 00 00 00                    call            sopen
016F  83 C4 10                          add             esp,0x00000010
0172  89 43 10                          mov             dword ptr 0x10[ebx],eax
0175  83 7B 10 FF                       cmp             dword ptr 0x10[ebx],0xffffffff
0179  75 10                             jne             L$22
017B  53                                push            ebx
017C  E8 00 00 00 00                    call            __freefp
0181  83 C4 04                          add             esp,0x00000004
0184  31 C0                             xor             eax,eax
0186  5D                                pop             ebp
0187  5F                                pop             edi
0188  5E                                pop             esi
0189  5B                                pop             ebx
018A  C3                                ret
018B                            L$22:
018B  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
0192  C7 43 08 00 00 00 00              mov             dword ptr 0x8[ebx],0x00000000
0199  8A 74 24 1C                       mov             dh,byte ptr 0x1c[esp]
019D  C7 43 14 00 00 00 00              mov             dword ptr 0x14[ebx],0x00000000
01A4  F6 C6 80                          test            dh,0x80
01A7  74 0D                             je              L$23
01A9  6A 02                             push            0x00000002
01AB  6A 00                             push            0x00000000
01AD  53                                push            ebx
01AE  E8 00 00 00 00                    call            fseek
01B3  83 C4 0C                          add             esp,0x0000000c
01B6                            L$23:
01B6  53                                push            ebx
01B7  E8 00 00 00 00                    call            __chktty
01BC  83 C4 04                          add             esp,0x00000004
01BF  89 D8                             mov             eax,ebx
01C1  5D                                pop             ebp
01C2  5F                                pop             edi
01C3  5E                                pop             esi
01C4  5B                                pop             ebx
01C5  C3                                ret

Routine Size: 454 bytes,    Routine Base: _TEXT + 0000

01C6                            _fsopen:
01C6  53                                push            ebx
01C7  56                                push            esi
01C8  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
01CC  52                                push            edx
01CD  E8 00 00 00 00                    call            __open_flags
01D2  89 C3                             mov             ebx,eax
01D4  83 C4 04                          add             esp,0x00000004
01D7  85 C0                             test            eax,eax
01D9  74 31                             je              L$25
01DB  6A 00                             push            0x00000000
01DD  E8 00 00 00 00                    call            __allocfp
01E2  83 C4 04                          add             esp,0x00000004
01E5  89 C2                             mov             edx,eax
01E7  85 C0                             test            eax,eax
01E9  74 1F                             je              L$24
01EB  50                                push            eax
01EC  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
01F0  51                                push            ecx
01F1  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
01F5  31 C0                             xor             eax,eax
01F7  53                                push            ebx
01F8  8A 02                             mov             al,byte ptr [edx]
01FA  50                                push            eax
01FB  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
01FF  56                                push            esi
0200  E8 00 00 00 00                    call            __doopen
0205  83 C4 14                          add             esp,0x00000014
0208  89 C2                             mov             edx,eax
020A                            L$24:
020A  89 D0                             mov             eax,edx
020C                            L$25:
020C  5E                                pop             esi
020D  5B                                pop             ebx
020E  C3                                ret

Routine Size: 73 bytes,    Routine Base: _TEXT + 01C6

020F                            fopen:
020F  53                                push            ebx
0210  6A 00                             push            0x00000000
0212  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0216  52                                push            edx
0217  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
021B  53                                push            ebx
021C  E8 00 00 00 00                    call            _fsopen
0221  83 C4 0C                          add             esp,0x0000000c
0224  5B                                pop             ebx
0225  C3                                ret
0226                            close_file:
0226  53                                push            ebx
0227  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
022B  FF 15 00 00 00 00                 call            dword ptr _AccessIOB
0231  A1 00 00 00 00                    mov             eax,dword ptr __OpenStreams
0236                            L$26:
0236  85 C0                             test            eax,eax
0238  74 26                             je              L$29
023A  8B 50 04                          mov             edx,dword ptr 0x4[eax]
023D  39 D3                             cmp             ebx,edx
023F  75 1B                             jne             L$28
0241  F6 42 0C 03                       test            byte ptr 0xc[edx],0x03
0245  74 0B                             je              L$27
0247  6A 01                             push            0x00000001
0249  52                                push            edx
024A  E8 00 00 00 00                    call            __doclose
024F  83 C4 08                          add             esp,0x00000008
0252                            L$27:
0252  FF 15 00 00 00 00                 call            dword ptr _ReleaseIOB
0258  89 D8                             mov             eax,ebx
025A  5B                                pop             ebx
025B  C3                                ret
025C                            L$28:
025C  8B 00                             mov             eax,dword ptr [eax]
025E  EB D6                             jmp             L$26
0260                            L$29:
0260  BA 00 00 00 00                    mov             edx,offset __ClosedStreams
0265                            L$30:
0265  8B 02                             mov             eax,dword ptr [edx]
0267  85 C0                             test            eax,eax
0269  74 1C                             je              L$32
026B  3B 58 04                          cmp             ebx,dword ptr 0x4[eax]
026E  75 13                             jne             L$31
0270  8B 08                             mov             ecx,dword ptr [eax]
0272  89 0A                             mov             dword ptr [edx],ecx
0274  8B 15 00 00 00 00                 mov             edx,dword ptr __OpenStreams
027A  A3 00 00 00 00                    mov             dword ptr __OpenStreams,eax
027F  89 10                             mov             dword ptr [eax],edx
0281  EB CF                             jmp             L$27
0283                            L$31:
0283  89 C2                             mov             edx,eax
0285  EB DE                             jmp             L$30
0287                            L$32:
0287  6A 04                             push            0x00000004
0289  E8 00 00 00 00                    call            __set_errno
028E  83 C4 04                          add             esp,0x00000004
0291  FF 15 00 00 00 00                 call            dword ptr _ReleaseIOB
0297  31 C0                             xor             eax,eax
0299  5B                                pop             ebx
029A  C3                                ret

Routine Size: 140 bytes,    Routine Base: _TEXT + 020F

029B                            freopen:
029B  53                                push            ebx
029C  56                                push            esi
029D  57                                push            edi
029E  55                                push            ebp
029F  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
02A3  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
02A7  52                                push            edx
02A8  E8 00 00 00 00                    call            __open_flags
02AD  83 C4 04                          add             esp,0x00000004
02B0  89 C7                             mov             edi,eax
02B2  85 C0                             test            eax,eax
02B4  74 64                             je              L$35
02B6  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
02B9  56                                push            esi
02BA  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
02C0  8B 0D 00 00 00 00                 mov             ecx,dword ptr _WindowsRemoveWindowedHandle
02C6  83 C4 04                          add             esp,0x00000004
02C9  85 C9                             test            ecx,ecx
02CB  74 0A                             je              L$33
02CD  56                                push            esi
02CE  FF 15 00 00 00 00                 call            dword ptr _WindowsRemoveWindowedHandle
02D4  83 C4 04                          add             esp,0x00000004
02D7                            L$33:
02D7  53                                push            ebx
02D8  E8 00 00 00 00                    call            close_file
02DD  83 C4 04                          add             esp,0x00000004
02E0  89 C3                             mov             ebx,eax
02E2  85 C0                             test            eax,eax
02E4  74 28                             je              L$34
02E6  50                                push            eax
02E7  8B 68 0C                          mov             ebp,dword ptr 0xc[eax]
02EA  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
02EE  81 E5 00 40 00 00                 and             ebp,0x00004000
02F4  6A 00                             push            0x00000000
02F6  89 68 0C                          mov             dword ptr 0xc[eax],ebp
02F9  31 C0                             xor             eax,eax
02FB  57                                push            edi
02FC  8A 03                             mov             al,byte ptr [ebx]
02FE  50                                push            eax
02FF  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
0303  50                                push            eax
0304  E8 00 00 00 00                    call            __doopen
0309  83 C4 14                          add             esp,0x00000014
030C  89 C3                             mov             ebx,eax
030E                            L$34:
030E  56                                push            esi
030F  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0315  83 C4 04                          add             esp,0x00000004
0318  89 D8                             mov             eax,ebx
031A                            L$35:
031A  5D                                pop             ebp
031B  5F                                pop             edi
031C  5E                                pop             esi
031D  5B                                pop             ebx
031E  C3                                ret

Routine Size: 132 bytes,    Routine Base: _TEXT + 029B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

