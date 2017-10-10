Module: winmisc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000327 bytes
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
009F                            L$4:
009F  83 C4 1C                          add             esp,0x0000001c
00A2  5E                                pop             esi
00A3  5B                                pop             ebx
00A4  C3                                ret

Routine Size: 121 bytes,    Routine Base: _TEXT + 002C

00A5                            _BlockingMessageLoop:
00A5  53                                push            ebx
00A6  56                                push            esi
00A7  83 EC 1C                          sub             esp,0x0000001c
00AA  6A 00                             push            0x00000000
00AC  6A 00                             push            0x00000000
00AE  6A 00                             push            0x00000000
00B0  8D 44 24 0C                       lea             eax,0xc[esp]
00B4  50                                push            eax
00B5  E8 00 00 00 00                    call            _GetMessageA
00BA  66 85 C0                          test            ax,ax
00BD  75 1E                             jne             L$5
00BF  83 7C 24 28 00                    cmp             dword ptr 0x28[esp],0x00000000
00C4  74 27                             je              L$6
00C6  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
00CA  31 DB                             xor             ebx,ebx
00CC  51                                push            ecx
00CD  89 1D 00 00 00 00                 mov             dword ptr _WindowExitRtn,ebx
00D3  E8 00 00 00 00                    call            exit
00D8  83 C4 04                          add             esp,0x00000004
00DB  EB 10                             jmp             L$6
00DD                            L$5:
00DD  89 E0                             mov             eax,esp
00DF  50                                push            eax
00E0  E8 00 00 00 00                    call            _TranslateMessage
00E5  89 E0                             mov             eax,esp
00E7  50                                push            eax
00E8  E8 00 00 00 00                    call            _DispatchMessageA
00ED                            L$6:
00ED  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
00F1  56                                push            esi
00F2  E8 00 00 00 00                    call            _MessageLoop
00F7  83 C4 04                          add             esp,0x00000004
00FA  EB A3                             jmp             L$4

Routine Size: 87 bytes,    Routine Base: _TEXT + 00A5

00FC                            _OutOfMemory:
00FC  6A 00                             push            0x00000000
00FE  68 00 00 00 00                    push            offset DGROUP:L$16
0103  68 0D 00 00 00                    push            offset DGROUP:L$17
0108  6A 00                             push            0x00000000
010A  E8 00 00 00 00                    call            _MessageBoxA
010F  C3                                ret

Routine Size: 20 bytes,    Routine Base: _TEXT + 00FC

0110                            _ExecutionComplete:
0110  E9 00 00 00 00                    jmp             flushall

Routine Size: 5 bytes,    Routine Base: _TEXT + 0110

0115                            _SetConTitle:
0115  53                                push            ebx
0116  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
011A  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
011E  52                                push            edx
011F  8B 58 3A                          mov             ebx,dword ptr 0x3a[eax]
0122                            L$7:
0122  53                                push            ebx
0123  E8 00 00 00 00                    call            _SetWindowTextA
0128  B8 01 00 00 00                    mov             eax,0x00000001
012D  5B                                pop             ebx
012E  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0115

012F                            _SetAppTitle:
012F  53                                push            ebx
0130  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0134  52                                push            edx
0135  8B 1D 00 00 00 00                 mov             ebx,dword ptr _MainWindow
013B  EB E5                             jmp             L$7

Routine Size: 14 bytes,    Routine Base: _TEXT + 012F

013D                            _ShutDown:
013D  53                                push            ebx
013E  E8 00 00 00 00                    call            flushall
0143  8B 15 00 00 00 00                 mov             edx,dword ptr _MainWindow
0149  52                                push            edx
014A  BB 01 00 00 00                    mov             ebx,0x00000001
014F  E8 00 00 00 00                    call            _DestroyWindow
0154  89 1D 00 00 00 00                 mov             dword ptr _MainWindowDestroyed,ebx
015A  31 C0                             xor             eax,eax
015C  5B                                pop             ebx
015D  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 013D

015E                            _CloseWindow:
015E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0162  F6 40 52 20                       test            byte ptr 0x52[eax],0x20
0166  74 09                             je              L$8
0168  8B 50 3A                          mov             edx,dword ptr 0x3a[eax]
016B  52                                push            edx
016C  E8 00 00 00 00                    call            _DestroyWindow
0171                            L$8:
0171  31 C0                             xor             eax,eax
0173  C3                                ret

Routine Size: 22 bytes,    Routine Base: _TEXT + 015E

0174                            _NewCursor:
0174  53                                push            ebx
0175  56                                push            esi
0176  57                                push            edi
0177  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
017B  F6 43 52 04                       test            byte ptr 0x52[ebx],0x04
017F  74 09                             je              L$9
0181  E8 00 00 00 00                    call            _DestroyCaret
0186  80 63 52 FB                       and             byte ptr 0x52[ebx],0xfb
018A                            L$9:
018A  8A 74 24 14                       mov             dh,byte ptr 0x14[esp]
018E  80 FE 03                          cmp             dh,0x03
0191  74 35                             je              L$13
0193  88 73 6F                          mov             byte ptr 0x6f[ebx],dh
0196  80 FE 01                          cmp             dh,0x01
0199  72 06                             jb              L$10
019B  76 16                             jbe             L$11
019D  5F                                pop             edi
019E  5E                                pop             esi
019F  5B                                pop             ebx
01A0  C3                                ret
01A1                            L$10:
01A1  84 F6                             test            dh,dh
01A3  75 23                             jne             L$13
01A5  8B 73 2C                          mov             esi,dword ptr 0x2c[ebx]
01A8  56                                push            esi
01A9  6A 00                             push            0x00000000
01AB  6A 00                             push            0x00000000
01AD  8B 7B 3A                          mov             edi,dword ptr 0x3a[ebx]
01B0  57                                push            edi
01B1  EB 0C                             jmp             L$12
01B3                            L$11:
01B3  8B 53 2C                          mov             edx,dword ptr 0x2c[ebx]
01B6  52                                push            edx
01B7  6A 04                             push            0x00000004
01B9  6A 00                             push            0x00000000
01BB  8B 4B 3A                          mov             ecx,dword ptr 0x3a[ebx]
01BE  51                                push            ecx
01BF                            L$12:
01BF  E8 00 00 00 00                    call            _CreateCaret
01C4  80 4B 52 04                       or              byte ptr 0x52[ebx],0x04
01C8                            L$13:
01C8  5F                                pop             edi
01C9  5E                                pop             esi
01CA  5B                                pop             ebx
01CB  C3                                ret

Routine Size: 88 bytes,    Routine Base: _TEXT + 0174

01CC                            _DisplayCursor:
01CC  53                                push            ebx
01CD  56                                push            esi
01CE  57                                push            edi
01CF  55                                push            ebp
01D0  83 EC 08                          sub             esp,0x00000008
01D3  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
01D7  8B 53 3A                          mov             edx,dword ptr 0x3a[ebx]
01DA  52                                push            edx
01DB  E8 00 00 00 00                    call            _GetDC
01E0  8B 0D 00 00 00 00                 mov             ecx,dword ptr _FixedFont
01E6  51                                push            ecx
01E7  50                                push            eax
01E8  89 C6                             mov             esi,eax
01EA  E8 00 00 00 00                    call            _SelectObject
01EF  89 E0                             mov             eax,esp
01F1  8B 7B 5B                          mov             edi,dword ptr 0x5b[ebx]
01F4  50                                push            eax
01F5  8B 43 57                          mov             eax,dword ptr 0x57[ebx]
01F8  01 F8                             add             eax,edi
01FA  50                                push            eax
01FB  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
01FE  83 C0 09                          add             eax,0x00000009
0201  50                                push            eax
0202  E8 00 00 00 00                    call            _mbsnbcnt
0207  83 C4 08                          add             esp,0x00000008
020A  50                                push            eax
020B  8B 43 53                          mov             eax,dword ptr 0x53[ebx]
020E  83 C0 09                          add             eax,0x00000009
0211  50                                push            eax
0212  56                                push            esi
0213  E8 00 00 00 00                    call            _GetTextExtentPoint32A
0218  8B 43 46                          mov             eax,dword ptr 0x46[ebx]
021B  8B 6B 4E                          mov             ebp,dword ptr 0x4e[ebx]
021E  8B 53 2C                          mov             edx,dword ptr 0x2c[ebx]
0221  29 E8                             sub             eax,ebp
0223  0F AF C2                          imul            eax,edx
0226  50                                push            eax
0227  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
022B  40                                inc             eax
022C  50                                push            eax
022D  E8 00 00 00 00                    call            _SetCaretPos
0232  56                                push            esi
0233  8B 4B 3A                          mov             ecx,dword ptr 0x3a[ebx]
0236  51                                push            ecx
0237  E8 00 00 00 00                    call            _ReleaseDC
023C  8B 73 3A                          mov             esi,dword ptr 0x3a[ebx]
023F  56                                push            esi
0240  E8 00 00 00 00                    call            _ShowCaret
0245  83 C4 08                          add             esp,0x00000008
0248  5D                                pop             ebp
0249  5F                                pop             edi
024A  5E                                pop             esi
024B  5B                                pop             ebx
024C  C3                                ret

Routine Size: 129 bytes,    Routine Base: _TEXT + 01CC

024D                            _SetInputMode:
024D  53                                push            ebx
024E  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0252  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0256  89 50 6B                          mov             dword ptr 0x6b[eax],edx
0259  85 D2                             test            edx,edx
025B  0F 95 C0                          setne           al
025E  30 E4                             xor             ah,ah
0260  25 FF FF 00 00                    and             eax,0x0000ffff
0265  50                                push            eax
0266  6A 02                             push            0x00000002
0268  8B 1D 00 00 00 00                 mov             ebx,dword ptr _SubMenuEdit
026E  53                                push            ebx
026F  E8 00 00 00 00                    call            _EnableMenuItem
0274  5B                                pop             ebx
0275  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 024D

0276                            _ShowWindowActive:
0276  53                                push            ebx
0277  56                                push            esi
0278  57                                push            edi
0279  55                                push            ebp
027A  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
027E  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0282  85 F6                             test            esi,esi
0284  74 3B                             je              L$14
0286  8B 06                             mov             eax,dword ptr [esi]
0288  8B 00                             mov             eax,dword ptr [eax]
028A  6A 00                             push            0x00000000
028C  05 C8 00 00 00                    add             eax,0x000000c8
0291  50                                push            eax
0292  8B 15 00 00 00 00                 mov             edx,dword ptr _SubMenuWindows
0298  52                                push            edx
0299  E8 00 00 00 00                    call            _CheckMenuItem
029E  6A 00                             push            0x00000000
02A0  6A 00                             push            0x00000000
02A2  68 86 00 00 00                    push            0x00000086
02A7  8B 4E 3A                          mov             ecx,dword ptr 0x3a[esi]
02AA  51                                push            ecx
02AB  E8 00 00 00 00                    call            _SendMessageA
02B0  80 7E 6F 02                       cmp             byte ptr 0x6f[esi],0x02
02B4  74 0B                             je              L$14
02B6  6A 03                             push            0x00000003
02B8  56                                push            esi
02B9  E8 00 00 00 00                    call            _NewCursor
02BE  83 C4 08                          add             esp,0x00000008
02C1                            L$14:
02C1  85 DB                             test            ebx,ebx
02C3  74 5D                             je              L$15
02C5  8B 33                             mov             esi,dword ptr [ebx]
02C7  8B 06                             mov             eax,dword ptr [esi]
02C9  6A 08                             push            0x00000008
02CB  05 C8 00 00 00                    add             eax,0x000000c8
02D0  50                                push            eax
02D1  8B 35 00 00 00 00                 mov             esi,dword ptr _SubMenuWindows
02D7  56                                push            esi
02D8  E8 00 00 00 00                    call            _CheckMenuItem
02DD  6A 05                             push            0x00000005
02DF  8B 7B 3A                          mov             edi,dword ptr 0x3a[ebx]
02E2  57                                push            edi
02E3  E8 00 00 00 00                    call            _ShowWindow
02E8  6A 00                             push            0x00000000
02EA  6A 01                             push            0x00000001
02EC  68 86 00 00 00                    push            0x00000086
02F1  8B 6B 3A                          mov             ebp,dword ptr 0x3a[ebx]
02F4  55                                push            ebp
02F5  E8 00 00 00 00                    call            _SendMessageA
02FA  8B 43 3A                          mov             eax,dword ptr 0x3a[ebx]
02FD  50                                push            eax
02FE  E8 00 00 00 00                    call            _BringWindowToTop
0303  8A 53 6F                          mov             dl,byte ptr 0x6f[ebx]
0306  80 FA 02                          cmp             dl,0x02
0309  74 17                             je              L$15
030B  31 C0                             xor             eax,eax
030D  88 D0                             mov             al,dl
030F  50                                push            eax
0310  53                                push            ebx
0311  E8 00 00 00 00                    call            _NewCursor
0316  83 C4 08                          add             esp,0x00000008
0319  53                                push            ebx
031A  E8 00 00 00 00                    call            _DisplayCursor
031F  83 C4 04                          add             esp,0x00000004
0322                            L$15:
0322  5D                                pop             ebp
0323  5F                                pop             edi
0324  5E                                pop             esi
0325  5B                                pop             ebx
0326  C3                                ret

Routine Size: 177 bytes,    Routine Base: _TEXT + 0276

No disassembly errors

Segment: CONST DWORD USE32 0000001C bytes
0000                            L$16:
0000  53 59 53 54 45 4D 20 45 52 52 4F 52 00          SYSTEM ERROR.
000D                            L$17:
000D  4F 75 74 20 4F 66 20 4D 65 6D 6F 72 79 21 00    Out Of Memory!.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

