Module: winmisc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000027C bytes
0000                            _SetMyDC:
0000  53                                push            ebx
0001  57                                push            edi
0002  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0006  52                                push            edx
0007  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000B  53                                push            ebx
000C  E8 00 00 00 00                    call            _SetBkColor
0011  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0015  51                                push            ecx
0016  53                                push            ebx
0017  E8 00 00 00 00                    call            _SetTextColor
001C  8B 3D 00 00 00 00                 mov             edi,dword ptr _FixedFont
0022  57                                push            edi
0023  53                                push            ebx
0024  E8 00 00 00 00                    call            _SelectObject
0029  5F                                pop             edi
002A  5B                                pop             ebx
002B  C3                                ret

Routine Size: 44 bytes,    Routine Base: _TEXT + 0000

002C                            _MessageLoop:
002C  53                                push            ebx
002D  56                                push            esi
002E  83 EC 1C                          sub             esp,0x0000001c
0031  BB 01 00 00 00                    mov             ebx,0x00000001
0036                            L$1:
0036  6A 02                             push            0x00000002
0038  6A 00                             push            0x00000000
003A  6A 00                             push            0x00000000
003C  6A 00                             push            0x00000000
003E  8D 44 24 10                       lea             eax,0x10[esp]
0042  50                                push            eax
0043  E8 00 00 00 00                    call            _PeekMessageA
0048  85 C0                             test            eax,eax
004A  74 47                             je              L$3
004C  6A 00                             push            0x00000000
004E  6A 00                             push            0x00000000
0050  6A 00                             push            0x00000000
0052  8D 44 24 0C                       lea             eax,0xc[esp]
0056  50                                push            eax
0057  E8 00 00 00 00                    call            _GetMessageA
005C  89 C3                             mov             ebx,eax
005E  66 85 C0                          test            ax,ax
0061  75 1E                             jne             L$2
0063  83 7C 24 28 00                    cmp             dword ptr 0x28[esp],0x00000000
0068  74 29                             je              L$3
006A  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
006E  31 C9                             xor             ecx,ecx
0070  56                                push            esi
0071  89 0D 00 00 00 00                 mov             dword ptr _WindowExitRtn,ecx
0077  E8 00 00 00 00                    call            exit
007C  83 C4 04                          add             esp,0x00000004
007F  EB 12                             jmp             L$3
0081                            L$2:
0081  89 E0                             mov             eax,esp
0083  50                                push            eax
0084  E8 00 00 00 00                    call            _TranslateMessage
0089  89 E0                             mov             eax,esp
008B  50                                push            eax
008C  E8 00 00 00 00                    call            _DispatchMessageA
0091  EB A3                             jmp             L$1
0093                            L$3:
0093  6A 00                             push            0x00000000
0095  E8 00 00 00 00                    call            _Sleep
009A  31 C0                             xor             eax,eax
009C  66 89 D8                          mov             ax,bx
009F  83 C4 1C                          add             esp,0x0000001c
00A2  5E                                pop             esi
00A3  5B                                pop             ebx
00A4  C3                                ret

Routine Size: 121 bytes,    Routine Base: _TEXT + 002C

00A5                            _OutOfMemory:
00A5  6A 00                             push            0x00000000
00A7  68 00 00 00 00                    push            offset DGROUP:L$13
00AC  68 0D 00 00 00                    push            offset DGROUP:L$14
00B1  6A 00                             push            0x00000000
00B3  E8 00 00 00 00                    call            _MessageBoxA
00B8  C3                                ret

Routine Size: 20 bytes,    Routine Base: _TEXT + 00A5

00B9                            _ExecutionComplete:
00B9  E9 00 00 00 00                    jmp             flushall

Routine Size: 5 bytes,    Routine Base: _TEXT + 00B9

00BE                            _SetConTitle:
00BE  53                                push            ebx
00BF  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
00C3  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00C7  52                                push            edx
00C8  8B 58 3A                          mov             ebx,dword ptr 0x3a[eax]
00CB                            L$4:
00CB  53                                push            ebx
00CC  E8 00 00 00 00                    call            _SetWindowTextA
00D1  B8 01 00 00 00                    mov             eax,0x00000001
00D6  5B                                pop             ebx
00D7  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 00BE

00D8                            _SetAppTitle:
00D8  53                                push            ebx
00D9  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00DD  52                                push            edx
00DE  8B 1D 00 00 00 00                 mov             ebx,dword ptr _MainWindow
00E4  EB E5                             jmp             L$4

Routine Size: 14 bytes,    Routine Base: _TEXT + 00D8

00E6                            _ShutDown:
00E6  8B 15 00 00 00 00                 mov             edx,dword ptr _MainWindow
00EC  52                                push            edx
00ED  E8 00 00 00 00                    call            _DestroyWindow
00F2  31 C0                             xor             eax,eax
00F4  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 00E6

00F5                            _CloseWindow:
00F5  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00F9  F6 40 52 20                       test            byte ptr 0x52[eax],0x20
00FD  74 09                             je              L$5
00FF  8B 50 3A                          mov             edx,dword ptr 0x3a[eax]
0102  52                                push            edx
0103  E8 00 00 00 00                    call            _DestroyWindow
0108                            L$5:
0108  31 C0                             xor             eax,eax
010A  C3                                ret

Routine Size: 22 bytes,    Routine Base: _TEXT + 00F5

010B                            _NewCursor:
010B  53                                push            ebx
010C  56                                push            esi
010D  57                                push            edi
010E  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0112  F6 43 52 04                       test            byte ptr 0x52[ebx],0x04
0116  74 09                             je              L$6
0118  E8 00 00 00 00                    call            _DestroyCaret
011D  80 63 52 FB                       and             byte ptr 0x52[ebx],0xfb
0121                            L$6:
0121  8A 74 24 14                       mov             dh,byte ptr 0x14[esp]
0125  80 FE 03                          cmp             dh,0x03
0128  74 35                             je              L$10
012A  88 73 6F                          mov             byte ptr 0x6f[ebx],dh
012D  80 FE 01                          cmp             dh,0x01
0130  72 06                             jb              L$7
0132  76 16                             jbe             L$8
0134  5F                                pop             edi
0135  5E                                pop             esi
0136  5B                                pop             ebx
0137  C3                                ret
0138                            L$7:
0138  84 F6                             test            dh,dh
013A  75 23                             jne             L$10
013C  8B 73 2C                          mov             esi,dword ptr 0x2c[ebx]
013F  56                                push            esi
0140  6A 00                             push            0x00000000
0142  6A 00                             push            0x00000000
0144  8B 7B 3A                          mov             edi,dword ptr 0x3a[ebx]
0147  57                                push            edi
0148  EB 0C                             jmp             L$9
014A                            L$8:
014A  8B 53 2C                          mov             edx,dword ptr 0x2c[ebx]
014D  52                                push            edx
014E  6A 04                             push            0x00000004
0150  6A 00                             push            0x00000000
0152  8B 4B 3A                          mov             ecx,dword ptr 0x3a[ebx]
0155  51                                push            ecx
0156                            L$9:
0156  E8 00 00 00 00                    call            _CreateCaret
015B  80 4B 52 04                       or              byte ptr 0x52[ebx],0x04
015F                            L$10:
015F  5F                                pop             edi
0160  5E                                pop             esi
0161  5B                                pop             ebx
0162  C3                                ret

Routine Size: 88 bytes,    Routine Base: _TEXT + 010B

0163                            _DisplayCursor:
0163  53                                push            ebx
0164  56                                push            esi
0165  57                                push            edi
0166  55                                push            ebp
0167  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
016B  8B 43 46                          mov             eax,dword ptr 0x46[ebx]
016E  8B 53 4E                          mov             edx,dword ptr 0x4e[ebx]
0171  8B 4B 2C                          mov             ecx,dword ptr 0x2c[ebx]
0174  29 D0                             sub             eax,edx
0176  0F AF C1                          imul            eax,ecx
0179  8B 73 5B                          mov             esi,dword ptr 0x5b[ebx]
017C  50                                push            eax
017D  8B 43 57                          mov             eax,dword ptr 0x57[ebx]
0180  8B 7B 28                          mov             edi,dword ptr 0x28[ebx]
0183  01 F0                             add             eax,esi
0185  0F AF C7                          imul            eax,edi
0188  40                                inc             eax
0189  50                                push            eax
018A  E8 00 00 00 00                    call            _SetCaretPos
018F  8B 6B 3A                          mov             ebp,dword ptr 0x3a[ebx]
0192  55                                push            ebp
0193  E8 00 00 00 00                    call            _ShowCaret
0198  5D                                pop             ebp
0199  5F                                pop             edi
019A  5E                                pop             esi
019B  5B                                pop             ebx
019C  C3                                ret

Routine Size: 58 bytes,    Routine Base: _TEXT + 0163

019D                            _SetInputMode:
019D  53                                push            ebx
019E  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
01A2  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
01A6  89 50 6B                          mov             dword ptr 0x6b[eax],edx
01A9  85 D2                             test            edx,edx
01AB  0F 95 C0                          setne           al
01AE  30 E4                             xor             ah,ah
01B0  25 FF FF 00 00                    and             eax,0x0000ffff
01B5  50                                push            eax
01B6  6A 02                             push            0x00000002
01B8  8B 1D 00 00 00 00                 mov             ebx,dword ptr _SubMenuEdit
01BE  53                                push            ebx
01BF  E8 00 00 00 00                    call            _EnableMenuItem
01C4  5B                                pop             ebx
01C5  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 019D

01C6                            _ShowWindowActive:
01C6  53                                push            ebx
01C7  56                                push            esi
01C8  57                                push            edi
01C9  55                                push            ebp
01CA  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
01CE  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
01D2  85 F6                             test            esi,esi
01D4  74 3E                             je              L$11
01D6  8B 06                             mov             eax,dword ptr [esi]
01D8  BA C8 00 00 00                    mov             edx,0x000000c8
01DD  8B 08                             mov             ecx,dword ptr [eax]
01DF  6A 00                             push            0x00000000
01E1  8D 04 0A                          lea             eax,[edx+ecx]
01E4  50                                push            eax
01E5  8B 3D 00 00 00 00                 mov             edi,dword ptr _SubMenuWindows
01EB  57                                push            edi
01EC  E8 00 00 00 00                    call            _CheckMenuItem
01F1  6A 00                             push            0x00000000
01F3  6A 00                             push            0x00000000
01F5  68 86 00 00 00                    push            0x00000086
01FA  8B 6E 3A                          mov             ebp,dword ptr 0x3a[esi]
01FD  55                                push            ebp
01FE  E8 00 00 00 00                    call            _SendMessageA
0203  80 7E 6F 02                       cmp             byte ptr 0x6f[esi],0x02
0207  74 0B                             je              L$11
0209  6A 03                             push            0x00000003
020B  56                                push            esi
020C  E8 00 00 00 00                    call            _NewCursor
0211  83 C4 08                          add             esp,0x00000008
0214                            L$11:
0214  85 DB                             test            ebx,ebx
0216  74 5F                             je              L$12
0218  8B 33                             mov             esi,dword ptr [ebx]
021A  B8 C8 00 00 00                    mov             eax,0x000000c8
021F  8B 16                             mov             edx,dword ptr [esi]
0221  6A 08                             push            0x00000008
0223  01 D0                             add             eax,edx
0225  50                                push            eax
0226  8B 0D 00 00 00 00                 mov             ecx,dword ptr _SubMenuWindows
022C  51                                push            ecx
022D  E8 00 00 00 00                    call            _CheckMenuItem
0232  6A 05                             push            0x00000005
0234  8B 73 3A                          mov             esi,dword ptr 0x3a[ebx]
0237  56                                push            esi
0238  E8 00 00 00 00                    call            _ShowWindow
023D  6A 00                             push            0x00000000
023F  6A 01                             push            0x00000001
0241  68 86 00 00 00                    push            0x00000086
0246  8B 7B 3A                          mov             edi,dword ptr 0x3a[ebx]
0249  57                                push            edi
024A  E8 00 00 00 00                    call            _SendMessageA
024F  8B 6B 3A                          mov             ebp,dword ptr 0x3a[ebx]
0252  55                                push            ebp
0253  E8 00 00 00 00                    call            _BringWindowToTop
0258  8A 53 6F                          mov             dl,byte ptr 0x6f[ebx]
025B  80 FA 02                          cmp             dl,0x02
025E  74 17                             je              L$12
0260  31 C0                             xor             eax,eax
0262  88 D0                             mov             al,dl
0264  50                                push            eax
0265  53                                push            ebx
0266  E8 00 00 00 00                    call            _NewCursor
026B  83 C4 08                          add             esp,0x00000008
026E  53                                push            ebx
026F  E8 00 00 00 00                    call            _DisplayCursor
0274  83 C4 04                          add             esp,0x00000004
0277                            L$12:
0277  5D                                pop             ebp
0278  5F                                pop             edi
0279  5E                                pop             esi
027A  5B                                pop             ebx
027B  C3                                ret

Routine Size: 182 bytes,    Routine Base: _TEXT + 01C6

No disassembly errors

Segment: CONST DWORD USE32 0000001C bytes
0000                            L$13:
0000  53 59 53 54 45 4D 20 45 52 52 4F 52 00          SYSTEM ERROR.
000D                            L$14:
000D  4F 75 74 20 4F 66 20 4D 65 6D 6F 72 79 21 00    Out Of Memory!.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

