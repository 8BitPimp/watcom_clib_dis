Module: dmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000173 bytes
0000                            L$1:
0000  1C 01 00 00                                     DD        offset L$8
0004  54 00 00 00                                     DD        offset L$3
0008  33 00 00 00                                     DD        offset L$2
000C  06 01 00 00                                     DD        offset L$7

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

0010                            __LibMain:
0010  53                                push            ebx
0011  56                                push            esi
0012  57                                push            edi
0013  55                                push            ebp
0014  8B 7C 24 14                       mov             edi,dword ptr 0x14[esp]
0018  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
001C  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
0020  83 FE 03                          cmp             esi,0x00000003
0023  0F 87 41 01 00 00                 ja              L$10
0029  89 F0                             mov             eax,esi
002B  2E FF 24 85 00 00 00 00           jmp             dword ptr cs:L$1[eax*4]
0033                            L$2:
0033  6A 00                             push            0x00000000
0035  E8 00 00 00 00                    call            __NTAddThread
003A  83 C4 04                          add             esp,0x00000004
003D  85 C0                             test            eax,eax
003F  0F 84 27 01 00 00                 je              L$11
0045  55                                push            ebp
0046  56                                push            esi
0047  57                                push            edi
0048  E8 00 00 00 00                    call            _LibMain
004D  89 C3                             mov             ebx,eax
004F  E9 16 01 00 00                    jmp             L$10
0054                            L$3:
0054  8B 15 00 00 00 00                 mov             edx,dword ptr DGROUP:L$12
005A  42                                inc             edx
005B  89 15 00 00 00 00                 mov             dword ptr DGROUP:L$12,edx
0061  83 FA 01                          cmp             edx,0x00000001
0064  7E 14                             jle             L$5
0066  57                                push            edi
0067  E8 00 00 00 00                    call            __disallow_single_dgroup
006C  83 C4 04                          add             esp,0x00000004
006F  85 C0                             test            eax,eax
0071  74 07                             je              L$5
0073                            L$4:
0073  31 DB                             xor             ebx,ebx
0075  E9 F0 00 00 00                    jmp             L$10
007A                            L$5:
007A  B8 01 00 00 00                    mov             eax,0x00000001
007F  E8 00 00 00 00                    call            __InitRtns
0084  57                                push            edi
0085  6A 00                             push            0x00000000
0087  6A 01                             push            0x00000001
0089  E8 00 00 00 00                    call            __NTInit
008E  83 C4 0C                          add             esp,0x0000000c
0091  85 C0                             test            eax,eax
0093  74 DE                             je              L$4
0095  E8 00 00 00 00                    call            __NTThreadInit
009A  85 C0                             test            eax,eax
009C  74 D5                             je              L$4
009E  6A 00                             push            0x00000000
00A0  E8 00 00 00 00                    call            __NTAddThread
00A5  83 C4 04                          add             esp,0x00000004
00A8  85 C0                             test            eax,eax
00AA  74 C7                             je              L$4
00AC  B8 0F 00 00 00                    mov             eax,0x0000000f
00B1  E8 00 00 00 00                    call            __InitRtns
00B6  E8 00 00 00 00                    call            __InitMultipleThread
00BB  83 3D 00 00 00 00 00              cmp             dword ptr _pRawDllMain,0x00000000
00C2  74 19                             je              L$6
00C4  55                                push            ebp
00C5  56                                push            esi
00C6  57                                push            edi
00C7  FF 15 00 00 00 00                 call            dword ptr _pRawDllMain
00CD  85 C0                             test            eax,eax
00CF  75 0C                             jne             L$6
00D1  BA 0F 00 00 00                    mov             edx,0x0000000f
00D6  E8 00 00 00 00                    call            __FiniRtns
00DB  EB 96                             jmp             L$4
00DD                            L$6:
00DD  B8 FF 00 00 00                    mov             eax,0x000000ff
00E2  E8 00 00 00 00                    call            __InitRtns
00E7  E8 00 00 00 00                    call            __CommonInit
00EC  55                                push            ebp
00ED  56                                push            esi
00EE  57                                push            edi
00EF  E8 00 00 00 00                    call            _LibMain
00F4  89 C3                             mov             ebx,eax
00F6  85 C0                             test            eax,eax
00F8  75 70                             jne             L$10
00FA  BA FF 00 00 00                    mov             edx,0x000000ff
00FF  E8 00 00 00 00                    call            __FiniRtns
0104  EB 64                             jmp             L$10
0106                            L$7:
0106  55                                push            ebp
0107  56                                push            esi
0108  57                                push            edi
0109  E8 00 00 00 00                    call            _LibMain
010E  6A 00                             push            0x00000000
0110  89 C3                             mov             ebx,eax
0112  E8 00 00 00 00                    call            __NTRemoveThread
0117  83 C4 04                          add             esp,0x00000004
011A  EB 4E                             jmp             L$10
011C                            L$8:
011C  55                                push            ebp
011D  56                                push            esi
011E  57                                push            edi
011F  E8 00 00 00 00                    call            _LibMain
0124  BA FF 00 00 00                    mov             edx,0x000000ff
0129  89 C3                             mov             ebx,eax
012B  B8 10 00 00 00                    mov             eax,0x00000010
0130  E8 00 00 00 00                    call            __FiniRtns
0135  83 3D 00 00 00 00 00              cmp             dword ptr _pRawDllMain,0x00000000
013C  74 09                             je              L$9
013E  55                                push            ebp
013F  56                                push            esi
0140  57                                push            edi
0141  FF 15 00 00 00 00                 call            dword ptr _pRawDllMain
0147                            L$9:
0147  BA 0F 00 00 00                    mov             edx,0x0000000f
014C  31 C0                             xor             eax,eax
014E  E8 00 00 00 00                    call            __FiniRtns
0153  6A 00                             push            0x00000000
0155  E8 00 00 00 00                    call            __NTRemoveThread
015A  8B 15 00 00 00 00                 mov             edx,dword ptr DGROUP:L$12
0160  4A                                dec             edx
0161  83 C4 04                          add             esp,0x00000004
0164  89 15 00 00 00 00                 mov             dword ptr DGROUP:L$12,edx
016A                            L$10:
016A  89 D8                             mov             eax,ebx
016C                            L$11:
016C  5D                                pop             ebp
016D  5F                                pop             edi
016E  5E                                pop             esi
016F  5B                                pop             ebx
0170  C2 0C 00                          ret             0x000c

Routine Size: 355 bytes,    Routine Base: _TEXT + 0010

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000                            L$12:

BSS Size: 4 bytes

