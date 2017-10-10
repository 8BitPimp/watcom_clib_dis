Module: write
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002F9 bytes
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
0018  89 45 F8                          mov             dword ptr -0x8[ebp],eax
001B  E8 00 00 00 00                    call            __IOMode
0020  89 C3                             mov             ebx,eax
0022  83 C4 04                          add             esp,0x00000004
0025  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0028  85 C0                             test            eax,eax
002A  75 11                             jne             L$2
002C  6A 04                             push            0x00000004
002E                            L$1:
002E  E8 00 00 00 00                    call            __set_errno
0033  B8 FF FF FF FF                    mov             eax,0xffffffff
0038  E9 B2 02 00 00                    jmp             L$23
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
005A  8B 55 F8                          mov             edx,dword ptr -0x8[ebp]
005D  52                                push            edx
005E  E8 00 00 00 00                    call            _SetFilePointer
0063  83 F8 FF                          cmp             eax,0xffffffff
0066  75 14                             jne             L$5
0068                            L$4:
0068  57                                push            edi
0069  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
006F  83 C4 04                          add             esp,0x00000004
0072  E8 00 00 00 00                    call            __set_errno_nt
0077  E9 76 02 00 00                    jmp             L$24
007C                            L$5:
007C  F6 45 FC 40                       test            byte ptr -0x4[ebp],0x40
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
00AB  89 45 F4                          mov             dword ptr -0xc[ebp],eax
00AE  EB 1B                             jmp             L$7
00B0                            L$6:
00B0  6A 00                             push            0x00000000
00B2  8D 45 F4                          lea             eax,-0xc[ebp]
00B5  50                                push            eax
00B6  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
00B9  50                                push            eax
00BA  8B 55 18                          mov             edx,dword ptr 0x18[ebp]
00BD  52                                push            edx
00BE  8B 5D F8                          mov             ebx,dword ptr -0x8[ebp]
00C1  53                                push            ebx
00C2  E8 00 00 00 00                    call            _WriteFile
00C7  85 C0                             test            eax,eax
00C9  74 9D                             je              L$4
00CB                            L$7:
00CB  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
00CE  3B 45 1C                          cmp             eax,dword ptr 0x1c[ebp]
00D1  0F 84 0E 02 00 00                 je              L$22
00D7  6A 0C                             push            0x0000000c
00D9  E8 00 00 00 00                    call            __set_errno
00DE  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
00E1  83 C4 04                          add             esp,0x00000004
00E4  89 45 1C                          mov             dword ptr 0x1c[ebp],eax
00E7  E9 F9 01 00 00                    jmp             L$22
00EC                            L$8:
00EC  E8 00 00 00 00                    call            stackavail
00F1  89 45 F0                          mov             dword ptr -0x10[ebp],eax
00F4  3D B0 00 00 00                    cmp             eax,0x000000b0
00F9  73 05                             jae             L$9
00FB  E8 00 00 00 00                    call            __STKOVERFLOW
0100                            L$9:
0100  8B 4D F0                          mov             ecx,dword ptr -0x10[ebp]
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
0120  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0123  89 45 EC                          mov             dword ptr -0x14[ebp],eax
0126  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0129                            L$11:
0129  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
012C  3B 45 1C                          cmp             eax,dword ptr 0x1c[ebp]
012F  0F 83 39 01 00 00                 jae             L$19
0135  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
0138  03 45 F0                          add             eax,dword ptr -0x10[ebp]
013B  8A 00                             mov             al,byte ptr [eax]
013D  25 FF 00 00 00                    and             eax,0x000000ff
0142  83 F8 0A                          cmp             eax,0x0000000a
0145  0F 85 88 00 00 00                 jne             L$15
014B  8B 45 EC                          mov             eax,dword ptr -0x14[ebp]
014E  C6 04 06 0D                       mov             byte ptr [esi+eax],0x0d
0152  8B 4D EC                          mov             ecx,dword ptr -0x14[ebp]
0155  41                                inc             ecx
0156  89 4D EC                          mov             dword ptr -0x14[ebp],ecx
0159  39 CB                             cmp             ebx,ecx
015B  0F 85 72 00 00 00                 jne             L$15
0161  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
0168  74 1F                             je              L$12
016A  57                                push            edi
016B  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0171  83 C4 04                          add             esp,0x00000004
0174  85 C0                             test            eax,eax
0176  74 11                             je              L$12
0178  53                                push            ebx
0179  56                                push            esi
017A  50                                push            eax
017B  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
0181  83 C4 0C                          add             esp,0x0000000c
0184  89 45 EC                          mov             dword ptr -0x14[ebp],eax
0187  EB 19                             jmp             L$13
0189                            L$12:
0189  6A 00                             push            0x00000000
018B  8D 45 EC                          lea             eax,-0x14[ebp]
018E  50                                push            eax
018F  53                                push            ebx
0190  56                                push            esi
0191  8B 4D F8                          mov             ecx,dword ptr -0x8[ebp]
0194  51                                push            ecx
0195  E8 00 00 00 00                    call            _WriteFile
019A  85 C0                             test            eax,eax
019C  0F 84 C6 FE FF FF                 je              L$4
01A2                            L$13:
01A2  3B 5D EC                          cmp             ebx,dword ptr -0x14[ebp]
01A5  74 21                             je              L$14
01A7  6A 0C                             push            0x0000000c
01A9  E8 00 00 00 00                    call            __set_errno
01AE  83 C4 04                          add             esp,0x00000004
01B1  57                                push            edi
01B2  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
01B8  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
01BB  8B 5D EC                          mov             ebx,dword ptr -0x14[ebp]
01BE  83 C4 04                          add             esp,0x00000004
01C1  01 D8                             add             eax,ebx
01C3  E9 2A 01 00 00                    jmp             L$24
01C8                            L$14:
01C8  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
01CB  31 D2                             xor             edx,edx
01CD  89 45 F4                          mov             dword ptr -0xc[ebp],eax
01D0  89 55 EC                          mov             dword ptr -0x14[ebp],edx
01D3                            L$15:
01D3  8B 45 18                          mov             eax,dword ptr 0x18[ebp]
01D6  03 45 F0                          add             eax,dword ptr -0x10[ebp]
01D9  8B 55 EC                          mov             edx,dword ptr -0x14[ebp]
01DC  8A 00                             mov             al,byte ptr [eax]
01DE  88 04 32                          mov             byte ptr [edx+esi],al
01E1  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
01E4  8B 55 EC                          mov             edx,dword ptr -0x14[ebp]
01E7  40                                inc             eax
01E8  42                                inc             edx
01E9  89 45 F0                          mov             dword ptr -0x10[ebp],eax
01EC  89 55 EC                          mov             dword ptr -0x14[ebp],edx
01EF  39 D3                             cmp             ebx,edx
01F1  0F 85 32 FF FF FF                 jne             L$11
01F7  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
01FE  74 1F                             je              L$16
0200  57                                push            edi
0201  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0207  83 C4 04                          add             esp,0x00000004
020A  85 C0                             test            eax,eax
020C  74 11                             je              L$16
020E  53                                push            ebx
020F  56                                push            esi
0210  50                                push            eax
0211  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
0217  83 C4 0C                          add             esp,0x0000000c
021A  89 45 EC                          mov             dword ptr -0x14[ebp],eax
021D  EB 19                             jmp             L$17
021F                            L$16:
021F  6A 00                             push            0x00000000
0221  8D 45 EC                          lea             eax,-0x14[ebp]
0224  50                                push            eax
0225  53                                push            ebx
0226  56                                push            esi
0227  8B 55 F8                          mov             edx,dword ptr -0x8[ebp]
022A  52                                push            edx
022B  E8 00 00 00 00                    call            _WriteFile
0230  85 C0                             test            eax,eax
0232  0F 84 30 FE FF FF                 je              L$4
0238                            L$17:
0238  3B 5D EC                          cmp             ebx,dword ptr -0x14[ebp]
023B  74 21                             je              L$18
023D  6A 0C                             push            0x0000000c
023F  E8 00 00 00 00                    call            __set_errno
0244  83 C4 04                          add             esp,0x00000004
0247  57                                push            edi
0248  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
024E  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
0251  8B 55 EC                          mov             edx,dword ptr -0x14[ebp]
0254  83 C4 04                          add             esp,0x00000004
0257  01 D0                             add             eax,edx
0259  E9 94 00 00 00                    jmp             L$24
025E                            L$18:
025E  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
0261  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0264  31 C0                             xor             eax,eax
0266  89 45 EC                          mov             dword ptr -0x14[ebp],eax
0269  E9 BB FE FF FF                    jmp             L$11
026E                            L$19:
026E  83 7D EC 00                       cmp             dword ptr -0x14[ebp],0x00000000
0272  0F 84 6D 00 00 00                 je              L$22
0278  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsStdout,0x00000000
027F  74 22                             je              L$20
0281  57                                push            edi
0282  FF 15 00 00 00 00                 call            dword ptr _WindowsIsWindowedHandle
0288  83 C4 04                          add             esp,0x00000004
028B  85 C0                             test            eax,eax
028D  74 14                             je              L$20
028F  8B 55 EC                          mov             edx,dword ptr -0x14[ebp]
0292  52                                push            edx
0293  56                                push            esi
0294  50                                push            eax
0295  FF 15 00 00 00 00                 call            dword ptr _WindowsStdout
029B  83 C4 0C                          add             esp,0x0000000c
029E  89 45 F0                          mov             dword ptr -0x10[ebp],eax
02A1  EB 1C                             jmp             L$21
02A3                            L$20:
02A3  6A 00                             push            0x00000000
02A5  8D 45 F0                          lea             eax,-0x10[ebp]
02A8  50                                push            eax
02A9  8B 5D EC                          mov             ebx,dword ptr -0x14[ebp]
02AC  53                                push            ebx
02AD  56                                push            esi
02AE  8B 4D F8                          mov             ecx,dword ptr -0x8[ebp]
02B1  51                                push            ecx
02B2  E8 00 00 00 00                    call            _WriteFile
02B7  85 C0                             test            eax,eax
02B9  0F 84 A9 FD FF FF                 je              L$4
02BF                            L$21:
02BF  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
02C2  3B 45 EC                          cmp             eax,dword ptr -0x14[ebp]
02C5  74 1E                             je              L$22
02C7  6A 0C                             push            0x0000000c
02C9  E8 00 00 00 00                    call            __set_errno
02CE  83 C4 04                          add             esp,0x00000004
02D1  57                                push            edi
02D2  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
02D8  8B 45 F4                          mov             eax,dword ptr -0xc[ebp]
02DB  8B 4D F0                          mov             ecx,dword ptr -0x10[ebp]
02DE  83 C4 04                          add             esp,0x00000004
02E1  01 C8                             add             eax,ecx
02E3  EB 0D                             jmp             L$24
02E5                            L$22:
02E5  57                                push            edi
02E6  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
02EC  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
02EF                            L$23:
02EF  83 C4 04                          add             esp,0x00000004
02F2                            L$24:
02F2  89 EC                             mov             esp,ebp
02F4  5D                                pop             ebp
02F5  5F                                pop             edi
02F6  5E                                pop             esi
02F7  5B                                pop             ebx
02F8  C3                                ret

Routine Size: 761 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

