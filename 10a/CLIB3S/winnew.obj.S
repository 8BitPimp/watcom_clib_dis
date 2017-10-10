Module: winnew
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E4 bytes
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
0076  0F 84 25 01 00 00                 je              L$1
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
00E5  31 FF                             xor             edi,edi
00E7  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
00EE  31 C0                             xor             eax,eax
00F0  8B 54 24 50                       mov             edx,dword ptr 0x50[esp]
00F4  66 8B 44 24 68                    mov             ax,word ptr 0x68[esp]
00F9  66 89 D7                          mov             di,dx
00FC  89 43 28                          mov             dword ptr 0x28[ebx],eax
00FF  8D 47 02                          lea             eax,0x2[edi]
0102  89 43 2C                          mov             dword ptr 0x2c[ebx],eax
0105  A1 00 00 00 00                    mov             eax,dword ptr _MainWindowData
010A  8B 00                             mov             eax,dword ptr [eax]
010C  53                                push            ebx
010D  89 43 5F                          mov             dword ptr 0x5f[ebx],eax
0110  E8 00 00 00 00                    call            _PositionScrollThumb
0115  83 C4 04                          add             esp,0x00000004
0118  89 E0                             mov             eax,esp
011A  50                                push            eax
011B  8B 03                             mov             eax,dword ptr [ebx]
011D  BA C8 00 00 00                    mov             edx,0x000000c8
0122  8B 08                             mov             ecx,dword ptr [eax]
0124  8D 04 0A                          lea             eax,[edx+ecx]
0127  50                                push            eax
0128  6A 00                             push            0x00000000
012A  8B 2D 00 00 00 00                 mov             ebp,dword ptr _SubMenuWindows
0130  55                                push            ebp
0131  E8 00 00 00 00                    call            _AppendMenuA
0136  8B 84 24 8C 00 00 00              mov             eax,dword ptr 0x8c[esp]
013D  0F AF C7                          imul            eax,edi
0140  6A 01                             push            0x00000001
0142  50                                push            eax
0143  31 C0                             xor             eax,eax
0145  8B 94 24 98 00 00 00              mov             edx,dword ptr 0x98[esp]
014C  66 8B 84 24 A4 00 00 00           mov             ax,word ptr 0xa4[esp]
0154  0F AF D0                          imul            edx,eax
0157  0F AF 84 24 9C 00 00 00           imul            eax,dword ptr 0x9c[esp]
015F  52                                push            edx
0160  0F AF BC 24 A4 00 00 00           imul            edi,dword ptr 0xa4[esp]
0168  57                                push            edi
0169  50                                push            eax
016A  56                                push            esi
016B  E8 00 00 00 00                    call            _MoveWindow
0170  6A 00                             push            0x00000000
0172  68 60 F0 00 00                    push            0x0000f060
0177  6A 00                             push            0x00000000
0179  56                                push            esi
017A  E8 00 00 00 00                    call            _GetSystemMenu
017F  50                                push            eax
0180  E8 00 00 00 00                    call            _DeleteMenu
0185  6A 01                             push            0x00000001
0187  56                                push            esi
0188  E8 00 00 00 00                    call            _ShowWindow
018D  56                                push            esi
018E  E8 00 00 00 00                    call            _UpdateWindow
0193  53                                push            ebx
0194  E8 00 00 00 00                    call            _MakeWindowActive
0199  B8 01 00 00 00                    mov             eax,0x00000001
019E  83 C4 04                          add             esp,0x00000004
01A1                            L$1:
01A1  81 C4 A0 00 00 00                 add             esp,0x000000a0
01A7  5D                                pop             ebp
01A8  5F                                pop             edi
01A9  5E                                pop             esi
01AA  5B                                pop             ebx
01AB  C3                                ret

Routine Size: 428 bytes,    Routine Base: _TEXT + 0000

01AC                            _ReleaseWindowResources:
01AC  53                                push            ebx
01AD  56                                push            esi
01AE  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
01B2  8B 53 36                          mov             edx,dword ptr 0x36[ebx]
01B5  52                                push            edx
01B6  E8 00 00 00 00                    call            _DeleteObject
01BB  F6 43 52 04                       test            byte ptr 0x52[ebx],0x04
01BF  74 05                             je              L$2
01C1  E8 00 00 00 00                    call            _DestroyCaret
01C6                            L$2:
01C6  8B 1B                             mov             ebx,dword ptr [ebx]
01C8  B8 C8 00 00 00                    mov             eax,0x000000c8
01CD  8B 0B                             mov             ecx,dword ptr [ebx]
01CF  6A 00                             push            0x00000000
01D1  8D 1C 08                          lea             ebx,[eax+ecx]
01D4  53                                push            ebx
01D5  8B 35 00 00 00 00                 mov             esi,dword ptr _SubMenuWindows
01DB  56                                push            esi
01DC  E8 00 00 00 00                    call            _DeleteMenu
01E1  5E                                pop             esi
01E2  5B                                pop             ebx
01E3  C3                                ret

Routine Size: 56 bytes,    Routine Base: _TEXT + 01AC

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

