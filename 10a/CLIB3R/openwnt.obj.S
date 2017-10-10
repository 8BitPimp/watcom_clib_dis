Module: openwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A9 bytes
0000                            open_:
0000  53                                push            ebx
0001  52                                push            edx
0002  8D 44 24 14                       lea             eax,0x14[esp]
0006  83 C0 04                          add             eax,0x00000004
0009  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
000C  50                                push            eax
000D  6A 00                             push            0x00000000
000F  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0013  52                                push            edx
0014  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0018  53                                push            ebx
0019  E8 00 00 00 00                    call            sopen_
001E  83 C4 10                          add             esp,0x00000010
0021  5A                                pop             edx
0022  5B                                pop             ebx
0023  C3                                ret

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024                            sopen_:
0024  53                                push            ebx
0025  51                                push            ecx
0026  52                                push            edx
0027  56                                push            esi
0028  57                                push            edi
0029  83 EC 0C                          sub             esp,0x0000000c
002C  E8 00 00 00 00                    call            __NTAtMaxFiles_
0031  85 C0                             test            eax,eax
0033  74 14                             je              L$1
0035  B8 0B 00 00 00                    mov             eax,0x0000000b
003A  E8 00 00 00 00                    call            __set_errno_
003F  B8 FF FF FF FF                    mov             eax,0xffffffff
0044  E9 57 01 00 00                    jmp             L$18
0049                            L$1:
0049  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
004D  8D 54 24 04                       lea             edx,0x4[esp]
0051  83 E6 07                          and             esi,0x00000007
0054  8D 5C 24 08                       lea             ebx,0x8[esp]
0058  89 F0                             mov             eax,esi
005A  E8 00 00 00 00                    call            __GetNTAccessAttr_
005F  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
0063  89 E2                             mov             edx,esp
0065  E8 00 00 00 00                    call            __GetNTShareAttr_
006A  8A 64 24 28                       mov             ah,byte ptr 0x28[esp]
006E  B9 80 00 00 00                    mov             ecx,0x00000080
0073  F6 C4 20                          test            ah,0x20
0076  74 49                             je              L$5
0078  F6 C4 20                          test            ah,0x20
007B  74 21                             je              L$2
007D  8D 44 24 30                       lea             eax,0x30[esp]
0081  83 C0 04                          add             eax,0x00000004
0084  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
0087  89 44 24 08                       mov             dword ptr 0x8[esp],eax
008B  F6 44 24 09 01                    test            byte ptr 0x9[esp],0x01
0090  74 0C                             je              L$2
0092  F6 44 24 08 80                    test            byte ptr 0x8[esp],0x80
0097  75 05                             jne             L$2
0099  B9 01 00 00 00                    mov             ecx,0x00000001
009E                            L$2:
009E  F6 44 24 29 04                    test            byte ptr 0x29[esp],0x04
00A3  74 07                             je              L$3
00A5  BB 01 00 00 00                    mov             ebx,0x00000001
00AA  EB 26                             jmp             L$7
00AC                            L$3:
00AC  F6 44 24 28 40                    test            byte ptr 0x28[esp],0x40
00B1  74 07                             je              L$4
00B3  BB 02 00 00 00                    mov             ebx,0x00000002
00B8  EB 18                             jmp             L$7
00BA                            L$4:
00BA  BB 04 00 00 00                    mov             ebx,0x00000004
00BF  EB 11                             jmp             L$7
00C1                            L$5:
00C1  F6 C4 40                          test            ah,0x40
00C4  74 07                             je              L$6
00C6  BB 05 00 00 00                    mov             ebx,0x00000005
00CB  EB 05                             jmp             L$7
00CD                            L$6:
00CD  BB 03 00 00 00                    mov             ebx,0x00000003
00D2                            L$7:
00D2  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsNewWindow,0x00000000
00D9  74 34                             je              L$8
00DB  8B 44 24 24                       mov             eax,dword ptr 0x24[esp]
00DF  BA 00 00 00 00                    mov             edx,offset DGROUP:L$19
00E4  E8 00 00 00 00                    call            stricmp_
00E9  85 C0                             test            eax,eax
00EB  75 22                             jne             L$8
00ED  E8 00 00 00 00                    call            __NTGetFakeHandle_
00F2  FF 15 00 00 00 00                 call            dword ptr __InitAccessH
00F8  6A FF                             push            0xffffffff
00FA  50                                push            eax
00FB  6A 00                             push            0x00000000
00FD  BA 00 20 00 00                    mov             edx,0x00002000
0102  89 C3                             mov             ebx,eax
0104  FF 15 00 00 00 00                 call            dword ptr __WindowsNewWindow
010A  83 C4 0C                          add             esp,0x0000000c
010D  EB 41                             jmp             L$10
010F                            L$8:
010F  6A 00                             push            0x00000000
0111  51                                push            ecx
0112  53                                push            ebx
0113  6A 00                             push            0x00000000
0115  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0119  53                                push            ebx
011A  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
011E  51                                push            ecx
011F  8B 7C 24 3C                       mov             edi,dword ptr 0x3c[esp]
0123  57                                push            edi
0124  E8 00 00 00 00                    call            _CreateFileA
0129  83 F8 FF                          cmp             eax,0xffffffff
012C  75 0A                             jne             L$9
012E  E8 00 00 00 00                    call            __set_errno_nt_
0133  E9 68 00 00 00                    jmp             L$18
0138                            L$9:
0138  FF 15 00 00 00 00                 call            dword ptr __InitAccessH
013E  89 C3                             mov             ebx,eax
0140  E8 00 00 00 00                    call            isatty_
0145  31 D2                             xor             edx,edx
0147  85 C0                             test            eax,eax
0149  74 05                             je              L$10
014B  BA 00 20 00 00                    mov             edx,0x00002000
0150                            L$10:
0150  83 FE 02                          cmp             esi,0x00000002
0153  75 05                             jne             L$11
0155  80 CA 03                          or              dl,0x03
0158  EB 11                             jmp             L$13
015A                            L$11:
015A  85 F6                             test            esi,esi
015C  75 05                             jne             L$12
015E  80 CA 01                          or              dl,0x01
0161  EB 08                             jmp             L$13
0163                            L$12:
0163  83 FE 01                          cmp             esi,0x00000001
0166  75 03                             jne             L$13
0168  80 CA 02                          or              dl,0x02
016B                            L$13:
016B  F6 44 24 28 10                    test            byte ptr 0x28[esp],0x10
0170  74 03                             je              L$14
0172  80 CA 80                          or              dl,0x80
0175                            L$14:
0175  89 D0                             mov             eax,edx
0177  8A 6C 24 29                       mov             ch,byte ptr 0x29[esp]
017B  0C 40                             or              al,0x40
017D  F6 C5 03                          test            ch,0x03
0180  74 07                             je              L$15
0182  F6 C5 02                          test            ch,0x02
0185  74 10                             je              L$17
0187  EB 0C                             jmp             L$16
0189                            L$15:
0189  81 3D 00 00 00 00 00 02 00 00
                                        cmp             dword ptr __fmode,0x00000200
0193  75 02                             jne             L$17
0195                            L$16:
0195  89 C2                             mov             edx,eax
0197                            L$17:
0197  89 D8                             mov             eax,ebx
0199  E8 00 00 00 00                    call            __SetIOMode_
019E  89 D8                             mov             eax,ebx
01A0                            L$18:
01A0  83 C4 0C                          add             esp,0x0000000c
01A3  5F                                pop             edi
01A4  5E                                pop             esi
01A5  5A                                pop             edx
01A6  59                                pop             ecx
01A7  5B                                pop             ebx
01A8  C3                                ret

Routine Size: 389 bytes,    Routine Base: _TEXT + 0024

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$19:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

