Module: windlg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000019D bytes
0000                            __GetIntervalBox:
0000  53                                push            ebx
0001  81 EC 80 00 00 00                 sub             esp,0x00000080
0007  8B 9C 24 88 00 00 00              mov             ebx,dword ptr 0x88[esp]
000E  8B 84 24 8C 00 00 00              mov             eax,dword ptr 0x8c[esp]
0015  3D 10 01 00 00                    cmp             eax,0x00000110
001A  72 0E                             jb              L$1
001C  76 1A                             jbe             L$2
001E  3D 11 01 00 00                    cmp             eax,0x00000111
0023  74 3D                             je              L$3
0025  E9 83 00 00 00                    jmp             L$8
002A                            L$1:
002A  83 F8 10                          cmp             eax,0x00000010
002D  0F 84 75 00 00 00                 je              L$7
0033  E9 75 00 00 00                    jmp             L$8
0038                            L$2:
0038  6A 0A                             push            0x0000000a
003A  8D 44 24 04                       lea             eax,0x4[esp]
003E  50                                push            eax
003F  8B 0D 00 00 00 00                 mov             ecx,dword ptr _AutoClearLines
0045  51                                push            ecx
0046  E8 00 00 00 00                    call            ultoa
004B  83 C4 0C                          add             esp,0x0000000c
004E  89 E0                             mov             eax,esp
0050  50                                push            eax
0051  6A 00                             push            0x00000000
0053  68 C2 00 00 00                    push            0x000000c2
0058  6A 0A                             push            0x0000000a
005A  53                                push            ebx
005B  E8 00 00 00 00                    call            _SendDlgItemMessageA
0060  EB 35                             jmp             L$5
0062                            L$3:
0062  66 83 BC 24 90 00 00 00 01        cmp             word ptr 0x90[esp],0x0001
006B  75 31                             jne             L$6
006D  68 80 00 00 00                    push            0x00000080
0072  8D 44 24 04                       lea             eax,0x4[esp]
0076  50                                push            eax
0077  6A 0A                             push            0x0000000a
0079  53                                push            ebx
007A  E8 00 00 00 00                    call            _GetDlgItemTextA
007F  89 E0                             mov             eax,esp
0081  50                                push            eax
0082  E8 00 00 00 00                    call            atol
0087  83 C4 04                          add             esp,0x00000004
008A  6A 01                             push            0x00000001
008C  53                                push            ebx
008D  A3 00 00 00 00                    mov             dword ptr _AutoClearLines,eax
0092                            L$4:
0092  E8 00 00 00 00                    call            _EndDialog
0097                            L$5:
0097  B8 01 00 00 00                    mov             eax,0x00000001
009C  EB 11                             jmp             L$9
009E                            L$6:
009E  83 BC 24 90 00 00 00 02           cmp             dword ptr 0x90[esp],0x00000002
00A6  75 05                             jne             L$8
00A8                            L$7:
00A8  6A 01                             push            0x00000001
00AA  53                                push            ebx
00AB  EB E5                             jmp             L$4
00AD                            L$8:
00AD  31 C0                             xor             eax,eax
00AF                            L$9:
00AF  81 C4 80 00 00 00                 add             esp,0x00000080
00B5  5B                                pop             ebx
00B6  C2 10 00                          ret             0x0010

Routine Size: 185 bytes,    Routine Base: _TEXT + 0000

00B9                            _GetClearInterval:
00B9  53                                push            ebx
00BA  56                                push            esi
00BB  57                                push            edi
00BC  55                                push            ebp
00BD  68 24 00 00 00                    push            offset DGROUP:L$17
00C2  6A 00                             push            0x00000000
00C4  68 38 00 00 00                    push            offset DGROUP:L$21
00C9  68 24 00 00 00                    push            offset DGROUP:L$17
00CE  68 24 00 00 00                    push            offset DGROUP:L$17
00D3  6A 3C                             push            0x0000003c
00D5  68 96 00 00 00                    push            0x00000096
00DA  6A 19                             push            0x00000019
00DC  6A 16                             push            0x00000016
00DE  68 A0 00 C8 00                    push            0x00c800a0
00E3  E8 00 00 00 00                    call            _DialogTemplate
00E8  83 C4 28                          add             esp,0x00000028
00EB  89 C7                             mov             edi,eax
00ED  85 C0                             test            eax,eax
00EF  0F 84 A3 00 00 00                 je              L$13
00F5  BE 21 00 00 00                    mov             esi,0x00000021
00FA  31 DB                             xor             ebx,ebx
00FC  81 C6 00 00 00 00                 add             esi,offset _getint
0102  EB 69                             jmp             L$12
0104                            L$10:
0104  6B C3 22                          imul            eax,ebx,0x00000022
0107  31 D2                             xor             edx,edx
0109  56                                push            esi
010A  8A 90 20 00 00 00                 mov             dl,byte ptr _getint+0x20[eax]
0110  52                                push            edx
0111  8B 88 1C 00 00 00                 mov             ecx,dword ptr _getint+0x1c[eax]
0117  51                                push            ecx
0118  8B A8 18 00 00 00                 mov             ebp,dword ptr _getint+0x18[eax]
011E  8B 90 14 00 00 00                 mov             edx,dword ptr _getint+0x14[eax]
0124  55                                push            ebp
0125  81 CA 00 00 00 10                 or              edx,0x10000000
012B  52                                push            edx
012C  8B 90 10 00 00 00                 mov             edx,dword ptr _getint+0x10[eax]
0132  52                                push            edx
0133  8B 88 0C 00 00 00                 mov             ecx,dword ptr _getint+0xc[eax]
0139  51                                push            ecx
013A  8B A8 08 00 00 00                 mov             ebp,dword ptr _getint+0x8[eax]
0140  55                                push            ebp
0141  8B 90 04 00 00 00                 mov             edx,dword ptr _getint+0x4[eax]
0147  52                                push            edx
0148  8B 88 00 00 00 00                 mov             ecx,dword ptr _getint[eax]
014E  51                                push            ecx
014F  57                                push            edi
0150  E8 00 00 00 00                    call            _AddControl
0155  83 C4 2C                          add             esp,0x0000002c
0158  85 C0                             test            eax,eax
015A  75 0B                             jne             L$11
015C  57                                push            edi
015D  E8 00 00 00 00                    call            _GlobalFree
0162  5D                                pop             ebp
0163  5F                                pop             edi
0164  5E                                pop             esi
0165  5B                                pop             ebx
0166  C3                                ret
0167                            L$11:
0167  89 C7                             mov             edi,eax
0169  83 C6 22                          add             esi,0x00000022
016C  43                                inc             ebx
016D                            L$12:
016D  83 FB 04                          cmp             ebx,0x00000004
0170  72 92                             jb              L$10
0172  57                                push            edi
0173  E8 00 00 00 00                    call            _DoneAddingControls
0178  83 C4 04                          add             esp,0x00000004
017B  57                                push            edi
017C  8B 15 00 00 00 00                 mov             edx,dword ptr _MainWindow
0182  A1 00 00 00 00                    mov             eax,dword ptr _MainWindowData
0187  52                                push            edx
0188  8B 18                             mov             ebx,dword ptr [eax]
018A  53                                push            ebx
018B  68 00 00 00 00                    push            offset __GetIntervalBox
0190  E8 00 00 00 00                    call            _DynamicDialogBox
0195  83 C4 10                          add             esp,0x00000010
0198                            L$13:
0198  5D                                pop             ebp
0199  5F                                pop             edi
019A  5E                                pop             esi
019B  5B                                pop             ebx
019C  C3                                ret

Routine Size: 228 bytes,    Routine Base: _TEXT + 00B9

No disassembly errors

Segment: CONST DWORD USE32 00000060 bytes
0000                            L$14:
0000  53 54 41 54 49 43 00                            STATIC.
0007                            L$15:
0007  26 45 6E 74 65 72 20 4E 75 6D 62 65 72 20 6F 66 &Enter Number of
0017  20 4C 69 6E 65 73 3A 00                          Lines:.
001F                            L$16:
001F  45 44 49 54 00                                  EDIT.
0024                            L$17:
0024  00                                              .
0025                            L$18:
0025  42 55 54 54 4F 4E 00                            BUTTON.
002C                            L$19:
002C  26 4F 4B 00                                     &OK.
0030                            L$20:
0030  26 43 61 6E 63 65 6C 00                         &Cancel.
0038                            L$21:
0038  53 65 74 20 4E 75 6D 62 65 72 20 6F 66 20 4C 69 Set Number of Li
0048  6E 65 73 20 42 65 74 77 65 65 6E 20 41 75 74 6F nes Between Auto
0058  2D 43 6C 65 61 72 73 00                         -Clears.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000088 bytes
0000                            _getint:
0000  04 00 00 00 0A 00 00 00 32 00 00 00 18 00 00 00 ........2.......
0010  FF FF FF FF 00 00 00 00                         ........
0018  00 00 00 00                                     DD        offset DGROUP:L$14
001C  07 00 00 00                                     DD        offset DGROUP:L$15
0020  00 00 37 00 00 00 0E 00 00 00 44 00 00 00 0C 00 ..7.......D.....
0030  00 00 0A 00 00 00 00 00 83 00                   ..........
003A  1F 00 00 00                                     DD        offset DGROUP:L$16
003E  24 00 00 00                                     DD        offset DGROUP:L$17
0042  00 00 1E 00 00 00 26 00 00 00 24 00 00 00 0C 00 ......&...$.....
0052  00 00 01 00 00 00 01 00 03 00                   ..........
005C  25 00 00 00                                     DD        offset DGROUP:L$18
0060  2C 00 00 00                                     DD        offset DGROUP:L$19
0064  00 00 54 00 00 00 26 00 00 00 24 00 00 00 0C 00 ..T...&...$.....
0074  00 00 02 00 00 00 00 00 03 00                   ..........
007E  25 00 00 00                                     DD        offset DGROUP:L$18
0082  30 00 00 00                                     DD        offset DGROUP:L$20
0086  00 00                                           ..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

