Module: cgetswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000013C bytes
0000                            cgets:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 1C                          sub             esp,0x0000001c
0007  8B 7C 24 30                       mov             edi,dword ptr 0x30[esp]
000B  8B 15 00 00 00 00                 mov             edx,dword ptr _WindowsStdin
0011  83 C7 02                          add             edi,0x00000002
0014  85 D2                             test            edx,edx
0016  74 41                             je              L$3
0018  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
001C  31 C0                             xor             eax,eax
001E  8A 03                             mov             al,byte ptr [ebx]
0020  48                                dec             eax
0021  50                                push            eax
0022  57                                push            edi
0023  6A 00                             push            0x00000000
0025  E8 00 00 00 00                    call            __qread
002A  83 C4 0C                          add             esp,0x0000000c
002D  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0031  89 FB                             mov             ebx,edi
0033  8A 00                             mov             al,byte ptr [eax]
0035                            L$1:
0035  3C 01                             cmp             al,0x01
0037  76 10                             jbe             L$2
0039  8A 23                             mov             ah,byte ptr [ebx]
003B  80 FC 0D                          cmp             ah,0x0d
003E  74 09                             je              L$2
0040  84 E4                             test            ah,ah
0042  74 05                             je              L$2
0044  43                                inc             ebx
0045  FE C8                             dec             al
0047  EB EC                             jmp             L$1
0049                            L$2:
0049  8A 74 24 30                       mov             dh,byte ptr 0x30[esp]
004D  88 D8                             mov             al,bl
004F  C6 03 00                          mov             byte ptr [ebx],0x00
0052  28 F0                             sub             al,dh
0054  E9 CF 00 00 00                    jmp             L$10
0059                            L$3:
0059  52                                push            edx
005A  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0060  83 C4 04                          add             esp,0x00000004
0063  E8 00 00 00 00                    call            __NTConsoleInput
0068  89 C6                             mov             esi,eax
006A  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
006E  BD 20 00 00 00                    mov             ebp,0x00000020
0073  8A 00                             mov             al,byte ptr [eax]
0075  89 FB                             mov             ebx,edi
0077  88 44 24 18                       mov             byte ptr 0x18[esp],al
007B                            L$4:
007B  8D 44 24 14                       lea             eax,0x14[esp]
007F  50                                push            eax
0080  6A 01                             push            0x00000001
0082  8D 44 24 08                       lea             eax,0x8[esp]
0086  50                                push            eax
0087  56                                push            esi
0088  E8 00 00 00 00                    call            _ReadConsoleInputA
008D  89 E0                             mov             eax,esp
008F  50                                push            eax
0090  E8 00 00 00 00                    call            __NTRealKey
0095  83 C4 04                          add             esp,0x00000004
0098  85 C0                             test            eax,eax
009A  74 DF                             je              L$4
009C  80 7C 24 0E 0D                    cmp             byte ptr 0xe[esp],0x0d
00A1  0F 84 6D 00 00 00                 je              L$9
00A7  EB 5E                             jmp             L$8
00A9                            L$5:
00A9  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
00AD  3C 08                             cmp             al,0x08
00AF  75 2E                             jne             L$6
00B1  39 FB                             cmp             ebx,edi
00B3  76 4D                             jbe             L$7
00B5  6A 08                             push            0x00000008
00B7  E8 00 00 00 00                    call            putch
00BC  83 C4 04                          add             esp,0x00000004
00BF  55                                push            ebp
00C0  E8 00 00 00 00                    call            putch
00C5  83 C4 04                          add             esp,0x00000004
00C8  6A 08                             push            0x00000008
00CA  E8 00 00 00 00                    call            putch
00CF  83 C4 04                          add             esp,0x00000004
00D2  8A 74 24 18                       mov             dh,byte ptr 0x18[esp]
00D6  FE C6                             inc             dh
00D8  4B                                dec             ebx
00D9  88 74 24 18                       mov             byte ptr 0x18[esp],dh
00DD  EB 23                             jmp             L$7
00DF                            L$6:
00DF  80 7C 24 18 01                    cmp             byte ptr 0x18[esp],0x01
00E4  76 1C                             jbe             L$7
00E6  88 03                             mov             byte ptr [ebx],al
00E8  31 C0                             xor             eax,eax
00EA  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
00EE  50                                push            eax
00EF  E8 00 00 00 00                    call            putch
00F4  83 C4 04                          add             esp,0x00000004
00F7  8A 54 24 18                       mov             dl,byte ptr 0x18[esp]
00FB  FE CA                             dec             dl
00FD  43                                inc             ebx
00FE  88 54 24 18                       mov             byte ptr 0x18[esp],dl
0102                            L$7:
0102  66 FF 4C 24 08                    dec             word ptr 0x8[esp]
0107                            L$8:
0107  66 83 7C 24 08 00                 cmp             word ptr 0x8[esp],0x0000
010D  77 9A                             ja              L$5
010F  E9 67 FF FF FF                    jmp             L$4
0114                            L$9:
0114  6A 00                             push            0x00000000
0116  C6 03 00                          mov             byte ptr [ebx],0x00
0119  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
011F  83 C4 04                          add             esp,0x00000004
0122  88 D8                             mov             al,bl
0124  2A 44 24 30                       sub             al,byte ptr 0x30[esp]
0128                            L$10:
0128  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
012C  2C 02                             sub             al,0x02
012E  88 43 01                          mov             byte ptr 0x1[ebx],al
0131  8D 43 02                          lea             eax,0x2[ebx]
0134  83 C4 1C                          add             esp,0x0000001c
0137  5D                                pop             ebp
0138  5F                                pop             edi
0139  5E                                pop             esi
013A  5B                                pop             ebx
013B  C3                                ret

Routine Size: 316 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

