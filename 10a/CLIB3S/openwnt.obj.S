Module: openwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001C1 bytes
0000                            open:
0000  53                                push            ebx
0001  8D 44 24 10                       lea             eax,0x10[esp]
0005  83 C0 04                          add             eax,0x00000004
0008  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
000B  50                                push            eax
000C  6A 00                             push            0x00000000
000E  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0012  52                                push            edx
0013  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0017  53                                push            ebx
0018  E8 00 00 00 00                    call            sopen
001D  83 C4 10                          add             esp,0x00000010
0020  5B                                pop             ebx
0021  C3                                ret

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022                            sopen:
0022  53                                push            ebx
0023  56                                push            esi
0024  57                                push            edi
0025  55                                push            ebp
0026  83 EC 0C                          sub             esp,0x0000000c
0029  E8 00 00 00 00                    call            __NTAtMaxFiles
002E  85 C0                             test            eax,eax
0030  74 14                             je              L$1
0032  6A 0B                             push            0x0000000b
0034  E8 00 00 00 00                    call            __set_errno
0039  B8 FF FF FF FF                    mov             eax,0xffffffff
003E  83 C4 04                          add             esp,0x00000004
0041  E9 73 01 00 00                    jmp             L$18
0046                            L$1:
0046  8D 44 24 08                       lea             eax,0x8[esp]
004A  50                                push            eax
004B  8D 44 24 08                       lea             eax,0x8[esp]
004F  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
0053  50                                push            eax
0054  83 E6 07                          and             esi,0x00000007
0057  56                                push            esi
0058  E8 00 00 00 00                    call            __GetNTAccessAttr
005D  83 C4 0C                          add             esp,0x0000000c
0060  89 E0                             mov             eax,esp
0062  50                                push            eax
0063  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
0067  52                                push            edx
0068  E8 00 00 00 00                    call            __GetNTShareAttr
006D  83 C4 08                          add             esp,0x00000008
0070  8A 64 24 24                       mov             ah,byte ptr 0x24[esp]
0074  BF 80 00 00 00                    mov             edi,0x00000080
0079  F6 C4 20                          test            ah,0x20
007C  74 49                             je              L$5
007E  F6 C4 20                          test            ah,0x20
0081  74 21                             je              L$2
0083  8D 44 24 2C                       lea             eax,0x2c[esp]
0087  83 C0 04                          add             eax,0x00000004
008A  8B 40 FC                          mov             eax,dword ptr -0x4[eax]
008D  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0091  F6 44 24 09 01                    test            byte ptr 0x9[esp],0x01
0096  74 0C                             je              L$2
0098  F6 44 24 08 80                    test            byte ptr 0x8[esp],0x80
009D  75 05                             jne             L$2
009F  BF 01 00 00 00                    mov             edi,0x00000001
00A4                            L$2:
00A4  F6 44 24 25 04                    test            byte ptr 0x25[esp],0x04
00A9  74 07                             je              L$3
00AB  BB 01 00 00 00                    mov             ebx,0x00000001
00B0  EB 26                             jmp             L$7
00B2                            L$3:
00B2  F6 44 24 24 40                    test            byte ptr 0x24[esp],0x40
00B7  74 07                             je              L$4
00B9  BB 02 00 00 00                    mov             ebx,0x00000002
00BE  EB 18                             jmp             L$7
00C0                            L$4:
00C0  BB 04 00 00 00                    mov             ebx,0x00000004
00C5  EB 11                             jmp             L$7
00C7                            L$5:
00C7  F6 C4 40                          test            ah,0x40
00CA  74 07                             je              L$6
00CC  BB 05 00 00 00                    mov             ebx,0x00000005
00D1  EB 05                             jmp             L$7
00D3                            L$6:
00D3  BB 03 00 00 00                    mov             ebx,0x00000003
00D8                            L$7:
00D8  83 3D 00 00 00 00 00              cmp             dword ptr _WindowsNewWindow,0x00000000
00DF  74 3C                             je              L$8
00E1  68 00 00 00 00                    push            offset DGROUP:L$19
00E6  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
00EA  55                                push            ebp
00EB  E8 00 00 00 00                    call            stricmp
00F0  83 C4 08                          add             esp,0x00000008
00F3  85 C0                             test            eax,eax
00F5  75 26                             jne             L$8
00F7  E8 00 00 00 00                    call            __NTGetFakeHandle
00FC  50                                push            eax
00FD  FF 15 00 00 00 00                 call            dword ptr _InitAccessH
0103  83 C4 04                          add             esp,0x00000004
0106  6A FF                             push            0xffffffff
0108  50                                push            eax
0109  6A 00                             push            0x00000000
010B  BB 00 20 00 00                    mov             ebx,0x00002000
0110  89 C7                             mov             edi,eax
0112  FF 15 00 00 00 00                 call            dword ptr _WindowsNewWindow
0118  83 C4 0C                          add             esp,0x0000000c
011B  EB 49                             jmp             L$10
011D                            L$8:
011D  6A 00                             push            0x00000000
011F  57                                push            edi
0120  53                                push            ebx
0121  6A 00                             push            0x00000000
0123  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0127  50                                push            eax
0128  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
012C  52                                push            edx
012D  8B 5C 24 38                       mov             ebx,dword ptr 0x38[esp]
0131  53                                push            ebx
0132  E8 00 00 00 00                    call            _CreateFileA
0137  83 F8 FF                          cmp             eax,0xffffffff
013A  75 0A                             jne             L$9
013C  E8 00 00 00 00                    call            __set_errno_nt
0141  E9 73 00 00 00                    jmp             L$18
0146                            L$9:
0146  50                                push            eax
0147  FF 15 00 00 00 00                 call            dword ptr _InitAccessH
014D  83 C4 04                          add             esp,0x00000004
0150  50                                push            eax
0151  31 DB                             xor             ebx,ebx
0153  89 C7                             mov             edi,eax
0155  E8 00 00 00 00                    call            isatty
015A  83 C4 04                          add             esp,0x00000004
015D  85 C0                             test            eax,eax
015F  74 05                             je              L$10
0161  BB 00 20 00 00                    mov             ebx,0x00002000
0166                            L$10:
0166  83 FE 02                          cmp             esi,0x00000002
0169  75 05                             jne             L$11
016B  80 CB 03                          or              bl,0x03
016E  EB 11                             jmp             L$13
0170                            L$11:
0170  85 F6                             test            esi,esi
0172  75 05                             jne             L$12
0174  80 CB 01                          or              bl,0x01
0177  EB 08                             jmp             L$13
0179                            L$12:
0179  83 FE 01                          cmp             esi,0x00000001
017C  75 03                             jne             L$13
017E  80 CB 02                          or              bl,0x02
0181                            L$13:
0181  F6 44 24 24 10                    test            byte ptr 0x24[esp],0x10
0186  74 03                             je              L$14
0188  80 CB 80                          or              bl,0x80
018B                            L$14:
018B  89 D8                             mov             eax,ebx
018D  8A 54 24 25                       mov             dl,byte ptr 0x25[esp]
0191  0C 40                             or              al,0x40
0193  F6 C2 03                          test            dl,0x03
0196  74 07                             je              L$15
0198  F6 C2 02                          test            dl,0x02
019B  74 10                             je              L$17
019D  EB 0C                             jmp             L$16
019F                            L$15:
019F  81 3D 00 00 00 00 00 02 00 00
                                        cmp             dword ptr _fmode,0x00000200
01A9  75 02                             jne             L$17
01AB                            L$16:
01AB  89 C3                             mov             ebx,eax
01AD                            L$17:
01AD  53                                push            ebx
01AE  57                                push            edi
01AF  E8 00 00 00 00                    call            __SetIOMode
01B4  83 C4 08                          add             esp,0x00000008
01B7  89 F8                             mov             eax,edi
01B9                            L$18:
01B9  83 C4 0C                          add             esp,0x0000000c
01BC  5D                                pop             ebp
01BD  5F                                pop             edi
01BE  5E                                pop             esi
01BF  5B                                pop             ebx
01C0  C3                                ret

Routine Size: 415 bytes,    Routine Base: _TEXT + 0022

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$19:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

