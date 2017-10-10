Module: winnew
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001DD bytes
0000                            _NewWindow:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  81 EC A0 00 00 00                 sub             esp,0x000000a0
000A  8D 84 24 8C 00 00 00              lea             eax,0x8c[esp]
0011  50                                push            eax
0012  8D 84 24 9C 00 00 00              lea             eax,0x9c[esp]
0019  50                                push            eax
001A  8D 84 24 98 00 00 00              lea             eax,0x98[esp]
0021  50                                push            eax
0022  8D 84 24 A0 00 00 00              lea             eax,0xa0[esp]
0029  50                                push            eax
002A  8D 44 24 10                       lea             eax,0x10[esp]
002E  50                                push            eax
002F  8B 94 24 C8 00 00 00              mov             edx,dword ptr 0xc8[esp]
0036  52                                push            edx
0037  E8 00 00 00 00                    call            _GetWindowNameAndCoords
003C  83 C4 18                          add             esp,0x00000018
003F  A1 00 00 00 00                    mov             eax,dword ptr _MainWindowData
0044  6A 00                             push            0x00000000
0046  8B 18                             mov             ebx,dword ptr [eax]
0048  53                                push            ebx
0049  6A 00                             push            0x00000000
004B  8B 0D 00 00 00 00                 mov             ecx,dword ptr _MainWindow
0051  51                                push            ecx
0052  6A 00                             push            0x00000000
0054  6A 00                             push            0x00000000
0056  6A 00                             push            0x00000000
0058  6A 00                             push            0x00000000
005A  68 00 00 EF 44                    push            0x44ef0000
005F  8D 44 24 24                       lea             eax,0x24[esp]
0063  50                                push            eax
0064  8B 35 00 00 00 00                 mov             esi,dword ptr _ClassName
006A  56                                push            esi
006B  6A 00                             push            0x00000000
006D  E8 00 00 00 00                    call            _CreateWindowExA
0072  89 C6                             mov             esi,eax
0074  85 C0                             test            eax,eax
0076  0F 84 22 01 00 00                 je              L$1
007C  8D 84 24 B8 00 00 00              lea             eax,0xb8[esp]
0083  89 84 24 88 00 00 00              mov             dword ptr 0x88[esp],eax
008A  8D 84 24 88 00 00 00              lea             eax,0x88[esp]
0091  50                                push            eax
0092  56                                push            esi
0093  E8 00 00 00 00                    call            _AnotherWindowData
0098  83 C4 08                          add             esp,0x00000008
009B  56                                push            esi
009C  89 C3                             mov             ebx,eax
009E  E8 00 00 00 00                    call            _GetDC
00A3  8B 2D 3C 00 00 00                 mov             ebp,dword ptr _ColorMap+0x3c
00A9  C7 43 08 00 00 00 00              mov             dword ptr 0x8[ebx],0x00000000
00B0  55                                push            ebp
00B1  89 C7                             mov             edi,eax
00B3  C7 43 0C 0F 00 00 00              mov             dword ptr 0xc[ebx],0x0000000f
00BA  E8 00 00 00 00                    call            _CreateSolidBrush
00BF  6A 00                             push            0x00000000
00C1  6A 00                             push            0x00000000
00C3  57                                push            edi
00C4  89 43 36                          mov             dword ptr 0x36[ebx],eax
00C7  E8 00 00 00 00                    call            _SetMyDC
00CC  83 C4 0C                          add             esp,0x0000000c
00CF  8D 44 24 50                       lea             eax,0x50[esp]
00D3  50                                push            eax
00D4  57                                push            edi
00D5  E8 00 00 00 00                    call            _GetTextMetricsA
00DA  57                                push            edi
00DB  56                                push            esi
00DC  E8 00 00 00 00                    call            _ReleaseDC
00E1  8B 44 24 68                       mov             eax,dword ptr 0x68[esp]
00E5  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
00EC  31 C0                             xor             eax,eax
00EE  66 8B 44 24 68                    mov             ax,word ptr 0x68[esp]
00F3  8B 7C 24 50                       mov             edi,dword ptr 0x50[esp]
00F7  89 43 28                          mov             dword ptr 0x28[ebx],eax
00FA  81 E7 FF FF 00 00                 and             edi,0x0000ffff
0100  8D 47 02                          lea             eax,0x2[edi]
0103  89 43 2C                          mov             dword ptr 0x2c[ebx],eax
0106  A1 00 00 00 00                    mov             eax,dword ptr _MainWindowData
010B  8B 00                             mov             eax,dword ptr [eax]
010D  53                                push            ebx
010E  89 43 5F                          mov             dword ptr 0x5f[ebx],eax
0111  E8 00 00 00 00                    call            _PositionScrollThumb
0116  83 C4 04                          add             esp,0x00000004
0119  89 E0                             mov             eax,esp
011B  50                                push            eax
011C  8B 03                             mov             eax,dword ptr [ebx]
011E  8B 00                             mov             eax,dword ptr [eax]
0120  05 C8 00 00 00                    add             eax,0x000000c8
0125  50                                push            eax
0126  6A 00                             push            0x00000000
0128  A1 00 00 00 00                    mov             eax,dword ptr _SubMenuWindows
012D  50                                push            eax
012E  E8 00 00 00 00                    call            _AppendMenuA
0133  8B 84 24 8C 00 00 00              mov             eax,dword ptr 0x8c[esp]
013A  0F AF C7                          imul            eax,edi
013D  6A 01                             push            0x00000001
013F  50                                push            eax
0140  31 C0                             xor             eax,eax
0142  8B 94 24 98 00 00 00              mov             edx,dword ptr 0x98[esp]
0149  66 8B 84 24 A4 00 00 00           mov             ax,word ptr 0xa4[esp]
0151  0F AF D0                          imul            edx,eax
0154  0F AF 84 24 9C 00 00 00           imul            eax,dword ptr 0x9c[esp]
015C  52                                push            edx
015D  0F AF BC 24 A4 00 00 00           imul            edi,dword ptr 0xa4[esp]
0165  57                                push            edi
0166  50                                push            eax
0167  56                                push            esi
0168  E8 00 00 00 00                    call            _MoveWindow
016D  6A 00                             push            0x00000000
016F  68 60 F0 00 00                    push            0x0000f060
0174  6A 00                             push            0x00000000
0176  56                                push            esi
0177  E8 00 00 00 00                    call            _GetSystemMenu
017C  50                                push            eax
017D  E8 00 00 00 00                    call            _DeleteMenu
0182  6A 01                             push            0x00000001
0184  56                                push            esi
0185  E8 00 00 00 00                    call            _ShowWindow
018A  56                                push            esi
018B  E8 00 00 00 00                    call            _UpdateWindow
0190  53                                push            ebx
0191  E8 00 00 00 00                    call            _MakeWindowActive
0196  B8 01 00 00 00                    mov             eax,0x00000001
019B  83 C4 04                          add             esp,0x00000004
019E                            L$1:
019E  81 C4 A0 00 00 00                 add             esp,0x000000a0
01A4  5D                                pop             ebp
01A5  5F                                pop             edi
01A6  5E                                pop             esi
01A7  5B                                pop             ebx
01A8  C3                                ret

Routine Size: 425 bytes,    Routine Base: _TEXT + 0000

01A9                            _ReleaseWindowResources:
01A9  53                                push            ebx
01AA  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
01AE  8B 53 36                          mov             edx,dword ptr 0x36[ebx]
01B1  52                                push            edx
01B2  E8 00 00 00 00                    call            _DeleteObject
01B7  F6 43 52 04                       test            byte ptr 0x52[ebx],0x04
01BB  74 05                             je              L$2
01BD  E8 00 00 00 00                    call            _DestroyCaret
01C2                            L$2:
01C2  8B 1B                             mov             ebx,dword ptr [ebx]
01C4  8B 1B                             mov             ebx,dword ptr [ebx]
01C6  6A 00                             push            0x00000000
01C8  81 C3 C8 00 00 00                 add             ebx,0x000000c8
01CE  53                                push            ebx
01CF  8B 1D 00 00 00 00                 mov             ebx,dword ptr _SubMenuWindows
01D5  53                                push            ebx
01D6  E8 00 00 00 00                    call            _DeleteMenu
01DB  5B                                pop             ebx
01DC  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 01A9

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

