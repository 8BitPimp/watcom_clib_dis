Module: fseek
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001CD bytes
0000                            __update_buffer:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
000B  80 60 0C EF                       and             byte ptr 0xc[eax],0xef
000F  3B 58 04                          cmp             ebx,dword ptr 0x4[eax]
0012  7F 1E                             jg              L$1
0014  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0017  8B 08                             mov             ecx,dword ptr [eax]
0019  29 CA                             sub             edx,ecx
001B  39 D3                             cmp             ebx,edx
001D  7C 13                             jl              L$1
001F  8B 78 04                          mov             edi,dword ptr 0x4[eax]
0022  8D 34 19                          lea             esi,[ecx+ebx]
0025  29 DF                             sub             edi,ebx
0027  89 30                             mov             dword ptr [eax],esi
0029  89 78 04                          mov             dword ptr 0x4[eax],edi
002C  31 C0                             xor             eax,eax
002E  5F                                pop             edi
002F  5E                                pop             esi
0030  5B                                pop             ebx
0031  C3                                ret
0032                            L$1:
0032  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0035  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],0x00000000
003C  89 10                             mov             dword ptr [eax],edx
003E  B8 01 00 00 00                    mov             eax,0x00000001
0043  5F                                pop             edi
0044  5E                                pop             esi
0045  5B                                pop             ebx
0046  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0000

0047                            fseek:
0047  53                                push            ebx
0048  56                                push            esi
0049  57                                push            edi
004A  55                                push            ebp
004B  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
004F  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0053  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
0057  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
005A  52                                push            edx
005B  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0061  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
0064  83 C4 04                          add             esp,0x00000004
0067  F6 C4 06                          test            ah,0x06
006A  0F 84 76 00 00 00                 je              L$7
0070  F6 43 0D 10                       test            byte ptr 0xd[ebx],0x10
0074  74 36                             je              L$4
0076  53                                push            ebx
0077  E8 00 00 00 00                    call            __flush
007C  83 C4 04                          add             esp,0x00000004
007F  85 C0                             test            eax,eax
0081  74 3D                             je              L$6
0083  85 FF                             test            edi,edi
0085  75 0E                             jne             L$2
0087  85 F6                             test            esi,esi
0089  7D 0A                             jge             L$2
008B  6A 09                             push            0x00000009
008D  E8 00 00 00 00                    call            __set_errno
0092  83 C4 04                          add             esp,0x00000004
0095                            L$2:
0095  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
0098  56                                push            esi
0099                            L$3:
0099  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
009F  B8 FF FF FF FF                    mov             eax,0xffffffff
00A4  83 C4 04                          add             esp,0x00000004
00A7  5D                                pop             ebp
00A8  5F                                pop             edi
00A9  5E                                pop             esi
00AA  5B                                pop             ebx
00AB  C3                                ret
00AC                            L$4:
00AC  83 FF 01                          cmp             edi,0x00000001
00AF  75 03                             jne             L$5
00B1  2B 73 04                          sub             esi,dword ptr 0x4[ebx]
00B4                            L$5:
00B4  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
00B7  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
00BE  89 03                             mov             dword ptr [ebx],eax
00C0                            L$6:
00C0  57                                push            edi
00C1  8A 4B 0C                          mov             cl,byte ptr 0xc[ebx]
00C4  56                                push            esi
00C5  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
00C8  80 E1 EB                          and             cl,0xeb
00CB  50                                push            eax
00CC  88 4B 0C                          mov             byte ptr 0xc[ebx],cl
00CF  E8 00 00 00 00                    call            lseek
00D4  83 C4 0C                          add             esp,0x0000000c
00D7  83 F8 FF                          cmp             eax,0xffffffff
00DA  0F 85 D9 00 00 00                 jne             L$13
00E0  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
00E3  51                                push            ecx
00E4  EB B3                             jmp             L$3
00E6                            L$7:
00E6  83 FF 01                          cmp             edi,0x00000001
00E9  72 10                             jb              L$8
00EB  76 17                             jbe             L$9
00ED  83 FF 02                          cmp             edi,0x00000002
00F0  0F 84 84 00 00 00                 je              L$11
00F6  E9 AB 00 00 00                    jmp             L$12
00FB                            L$8:
00FB  85 FF                             test            edi,edi
00FD  74 3C                             je              L$10
00FF  E9 A2 00 00 00                    jmp             L$12
0104                            L$9:
0104  53                                push            ebx
0105  56                                push            esi
0106  8B 6B 04                          mov             ebp,dword ptr 0x4[ebx]
0109  E8 00 00 00 00                    call            __update_buffer
010E  83 C4 08                          add             esp,0x00000008
0111  85 C0                             test            eax,eax
0113  0F 84 A0 00 00 00                 je              L$13
0119  57                                push            edi
011A  29 EE                             sub             esi,ebp
011C  56                                push            esi
011D  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
0120  57                                push            edi
0121  E8 00 00 00 00                    call            lseek
0126  83 C4 0C                          add             esp,0x0000000c
0129  83 F8 FF                          cmp             eax,0xffffffff
012C  0F 85 87 00 00 00                 jne             L$13
0132  8B 6B 10                          mov             ebp,dword ptr 0x10[ebx]
0135  55                                push            ebp
0136  E9 5E FF FF FF                    jmp             L$3
013B                            L$10:
013B  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
013E  52                                push            edx
013F  E8 00 00 00 00                    call            tell
0144  83 C4 04                          add             esp,0x00000004
0147  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
014A  89 F5                             mov             ebp,esi
014C  29 C8                             sub             eax,ecx
014E  53                                push            ebx
014F  29 C5                             sub             ebp,eax
0151  55                                push            ebp
0152  E8 00 00 00 00                    call            __update_buffer
0157  83 C4 08                          add             esp,0x00000008
015A  85 C0                             test            eax,eax
015C  74 5B                             je              L$13
015E  57                                push            edi
015F  56                                push            esi
0160  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
0163  56                                push            esi
0164  E8 00 00 00 00                    call            lseek
0169  83 C4 0C                          add             esp,0x0000000c
016C  83 F8 FF                          cmp             eax,0xffffffff
016F  75 48                             jne             L$13
0171  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
0174  57                                push            edi
0175  E9 1F FF FF FF                    jmp             L$3
017A                            L$11:
017A  88 E2                             mov             dl,ah
017C  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
0183  57                                push            edi
0184  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
0187  80 E2 EF                          and             dl,0xef
018A  56                                push            esi
018B  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
018E  88 53 0C                          mov             byte ptr 0xc[ebx],dl
0191  51                                push            ecx
0192  89 03                             mov             dword ptr [ebx],eax
0194  E8 00 00 00 00                    call            lseek
0199  83 C4 0C                          add             esp,0x0000000c
019C  83 F8 FF                          cmp             eax,0xffffffff
019F  75 18                             jne             L$13
01A1  E9 EF FE FF FF                    jmp             L$2
01A6                            L$12:
01A6  6A 09                             push            0x00000009
01A8  E8 00 00 00 00                    call            __set_errno
01AD  83 C4 04                          add             esp,0x00000004
01B0  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
01B3  50                                push            eax
01B4  E9 E0 FE FF FF                    jmp             L$3
01B9                            L$13:
01B9  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
01BC  52                                push            edx
01BD  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
01C3  83 C4 04                          add             esp,0x00000004
01C6  31 C0                             xor             eax,eax
01C8  5D                                pop             ebp
01C9  5F                                pop             edi
01CA  5E                                pop             esi
01CB  5B                                pop             ebx
01CC  C3                                ret

Routine Size: 390 bytes,    Routine Base: _TEXT + 0047

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

