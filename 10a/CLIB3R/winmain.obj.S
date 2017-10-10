Module: winmain
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004DE bytes
0000                            __InitDefaultWin_:
0000  51                                push            ecx
0001  52                                push            edx
0002  E8 00 00 00 00                    call            _GetCommandLineA
0007  E8 00 00 00 00                    call            strdup_
000C                            L$1:
000C  8A 10                             mov             dl,byte ptr [eax]
000E  FE C2                             inc             dl
0010  81 E2 FF 00 00 00                 and             edx,0x000000ff
0016  F6 82 00 00 00 00 02              test            byte ptr __IsTable[edx],0x02
001D  75 08                             jne             L$2
001F  80 38 00                          cmp             byte ptr [eax],0x00
0022  74 03                             je              L$2
0024  40                                inc             eax
0025  EB E5                             jmp             L$1
0027                            L$2:
0027  8A 10                             mov             dl,byte ptr [eax]
0029  FE C2                             inc             dl
002B  81 E2 FF 00 00 00                 and             edx,0x000000ff
0031  F6 82 00 00 00 00 02              test            byte ptr __IsTable[edx],0x02
0038  74 03                             je              L$3
003A  40                                inc             eax
003B  EB EA                             jmp             L$2
003D                            L$3:
003D  6A 00                             push            0x00000000
003F  E8 00 00 00 00                    call            _GetModuleHandleA
0044  89 C2                             mov             edx,eax
0046  E8 00 00 00 00                    call            firstInstance_
004B  85 C0                             test            eax,eax
004D  74 1A                             je              L$4
004F  89 D0                             mov             eax,edx
0051  BA 0A 00 00 00                    mov             edx,0x0000000a
0056  E8 00 00 00 00                    call            windowsInit_
005B  85 C0                             test            eax,eax
005D  74 0A                             je              L$4
005F  E8 00 00 00 00                    call            _InitFunctionPointers_
0064  B8 01 00 00 00                    mov             eax,0x00000001
0069                            L$4:
0069  5A                                pop             edx
006A  59                                pop             ecx

Routine Size: 107 bytes,    Routine Base: _TEXT + 0000

006B                            __FiniDefaultWin_:
006B  C3                                ret

Routine Size: 1 bytes,    Routine Base: _TEXT + 006B

006C                            DEFAULTWINMAIN:
006C  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0070  89 D0                             mov             eax,edx
0072  E8 00 00 00 00                    call            firstInstance_
0077  85 C0                             test            eax,eax
0079  74 2D                             je              L$5
007B  89 D0                             mov             eax,edx
007D  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0081  E8 00 00 00 00                    call            windowsInit_
0086  85 C0                             test            eax,eax
0088  74 1E                             je              L$5
008A  E8 00 00 00 00                    call            _InitFunctionPointers_
008F  8B 15 00 00 00 00                 mov             edx,dword ptr ____Argv
0095  A1 00 00 00 00                    mov             eax,dword ptr ____Argc
009A  E8 00 00 00 00                    call            main_
009F  89 C2                             mov             edx,eax
00A1  E8 00 00 00 00                    call            _WindowsExit_
00A6  89 D0                             mov             eax,edx
00A8                            L$5:
00A8  C2 10 00                          ret             0x0010
00AB                            firstInstance_:
00AB  53                                push            ebx
00AC  51                                push            ecx
00AD  52                                push            edx
00AE  56                                push            esi
00AF  57                                push            edi
00B0  55                                push            ebp
00B1  81 EC A8 00 00 00                 sub             esp,0x000000a8
00B7  89 C5                             mov             ebp,eax
00B9  50                                push            eax
00BA  68 00 00 00 00                    push            offset DGROUP:L$12
00BF  8D 44 24 08                       lea             eax,0x8[esp]
00C3  50                                push            eax
00C4  E8 00 00 00 00                    call            sprintf_
00C9  83 C4 0C                          add             esp,0x0000000c
00CC  89 E7                             mov             edi,esp
00CE  06                                push            es
00CF  8C D8                             mov             eax,ds
00D1  8E C0                             mov             es,eax
00D3  29 C9                             sub             ecx,ecx
00D5  49                                dec             ecx
00D6  31 C0                             xor             eax,eax
00D8  F2 AE                             repne scasb
00DA  F7 D1                             not             ecx
00DC  49                                dec             ecx
00DD  07                                pop             es
00DE  8D 41 01                          lea             eax,0x1[ecx]
00E1  E8 00 00 00 00                    call            malloc_
00E6  89 C7                             mov             edi,eax
00E8  A3 00 00 00 00                    mov             dword ptr _mainClass,eax
00ED  85 C0                             test            eax,eax
00EF  0F 84 A2 02 00 00                 je              L$10
00F5  89 E6                             mov             esi,esp
00F7  57                                push            edi
00F8                            L$6:
00F8  8A 06                             mov             al,byte ptr [esi]
00FA  88 07                             mov             byte ptr [edi],al
00FC  3C 00                             cmp             al,0x00
00FE  0F 84 10 00 00 00                 je              L$7
0104  8A 46 01                          mov             al,byte ptr 0x1[esi]
0107  83 C6 02                          add             esi,0x00000002
010A  88 47 01                          mov             byte ptr 0x1[edi],al
010D  83 C7 02                          add             edi,0x00000002
0110  3C 00                             cmp             al,0x00
0112  75 E4                             jne             L$6
0114                            L$7:
0114  5F                                pop             edi
0115  55                                push            ebp
0116  68 0B 00 00 00                    push            offset DGROUP:L$13
011B  8D 44 24 08                       lea             eax,0x8[esp]
011F  50                                push            eax
0120  E8 00 00 00 00                    call            sprintf_
0125  83 C4 0C                          add             esp,0x0000000c
0128  89 E7                             mov             edi,esp
012A  06                                push            es
012B  8C D8                             mov             eax,ds
012D  8E C0                             mov             es,eax
012F  29 C9                             sub             ecx,ecx
0131  49                                dec             ecx
0132  31 C0                             xor             eax,eax
0134  F2 AE                             repne scasb
0136  F7 D1                             not             ecx
0138  49                                dec             ecx
0139  07                                pop             es
013A  8D 41 01                          lea             eax,0x1[ecx]
013D  E8 00 00 00 00                    call            malloc_
0142  89 C7                             mov             edi,eax
0144  A3 00 00 00 00                    mov             dword ptr __ClassName,eax
0149  85 C0                             test            eax,eax
014B  0F 84 46 02 00 00                 je              L$10
0151  89 E6                             mov             esi,esp
0153  57                                push            edi
0154                            L$8:
0154  8A 06                             mov             al,byte ptr [esi]
0156  88 07                             mov             byte ptr [edi],al
0158  3C 00                             cmp             al,0x00
015A  0F 84 10 00 00 00                 je              L$9
0160  8A 46 01                          mov             al,byte ptr 0x1[esi]
0163  83 C6 02                          add             esi,0x00000002
0166  88 47 01                          mov             byte ptr 0x1[edi],al
0169  83 C7 02                          add             edi,0x00000002
016C  3C 00                             cmp             al,0x00
016E  75 E4                             jne             L$8
0170                            L$9:
0170  5F                                pop             edi
0171  E8 00 00 00 00                    call            _CreateMenu
0176  89 C3                             mov             ebx,eax
0178  85 C0                             test            eax,eax
017A  0F 84 17 02 00 00                 je              L$10
0180  68 19 00 00 00                    push            offset DGROUP:L$14
0185  6A 03                             push            0x00000003
0187  6A 00                             push            0x00000000
0189  50                                push            eax
018A  E8 00 00 00 00                    call            _AppendMenuA
018F  68 26 00 00 00                    push            offset DGROUP:L$15
0194  6A 05                             push            0x00000005
0196  6A 00                             push            0x00000000
0198  53                                push            ebx
0199  E8 00 00 00 00                    call            _AppendMenuA
019E  6A 00                             push            0x00000000
01A0  6A 00                             push            0x00000000
01A2  68 00 08 00 00                    push            0x00000800
01A7  53                                push            ebx
01A8  E8 00 00 00 00                    call            _AppendMenuA
01AD  68 49 00 00 00                    push            offset DGROUP:L$16
01B2  6A 01                             push            0x00000001
01B4  6A 00                             push            0x00000000
01B6  53                                push            ebx
01B7  E8 00 00 00 00                    call            _AppendMenuA
01BC  E8 00 00 00 00                    call            _CreateMenu
01C1  89 C7                             mov             edi,eax
01C3  85 C0                             test            eax,eax
01C5  0F 84 CC 01 00 00                 je              L$10
01CB  68 4F 00 00 00                    push            offset DGROUP:L$17
01D0  6A 06                             push            0x00000006
01D2  6A 00                             push            0x00000000
01D4  50                                push            eax
01D5  E8 00 00 00 00                    call            _AppendMenuA
01DA  E8 00 00 00 00                    call            _CreateMenu
01DF  89 C2                             mov             edx,eax
01E1  A3 00 00 00 00                    mov             dword ptr __SubMenuEdit,eax
01E6  85 C0                             test            eax,eax
01E8  0F 84 A9 01 00 00                 je              L$10
01EE  68 59 00 00 00                    push            offset DGROUP:L$18
01F3  6A 02                             push            0x00000002
01F5  6A 00                             push            0x00000000
01F7  50                                push            eax
01F8  E8 00 00 00 00                    call            _AppendMenuA
01FD  68 60 00 00 00                    push            offset DGROUP:L$19
0202  6A 04                             push            0x00000004
0204  6A 00                             push            0x00000000
0206  8B 15 00 00 00 00                 mov             edx,dword ptr __SubMenuEdit
020C  52                                push            edx
020D  E8 00 00 00 00                    call            _AppendMenuA
0212  E8 00 00 00 00                    call            _CreateMenu
0217  A3 00 00 00 00                    mov             dword ptr __SubMenuWindows,eax
021C  E8 00 00 00 00                    call            _CreateMenu
0221  89 C2                             mov             edx,eax
0223  A3 00 00 00 00                    mov             dword ptr __MainMenu,eax
0228  85 C0                             test            eax,eax
022A  0F 84 67 01 00 00                 je              L$10
0230  68 66 00 00 00                    push            offset DGROUP:L$20
0235  53                                push            ebx
0236  6A 10                             push            0x00000010
0238  50                                push            eax
0239  E8 00 00 00 00                    call            _AppendMenuA
023E  68 6C 00 00 00                    push            offset DGROUP:L$21
0243  8B 1D 00 00 00 00                 mov             ebx,dword ptr __SubMenuEdit
0249  53                                push            ebx
024A  6A 10                             push            0x00000010
024C  8B 0D 00 00 00 00                 mov             ecx,dword ptr __MainMenu
0252  51                                push            ecx
0253  E8 00 00 00 00                    call            _AppendMenuA
0258  68 72 00 00 00                    push            offset DGROUP:L$22
025D  8B 35 00 00 00 00                 mov             esi,dword ptr __SubMenuWindows
0263  56                                push            esi
0264  6A 10                             push            0x00000010
0266  A1 00 00 00 00                    mov             eax,dword ptr __MainMenu
026B  50                                push            eax
026C  E8 00 00 00 00                    call            _AppendMenuA
0271  68 7B 00 00 00                    push            offset DGROUP:L$23
0276  57                                push            edi
0277  6A 10                             push            0x00000010
0279  8B 15 00 00 00 00                 mov             edx,dword ptr __MainMenu
027F  52                                push            edx
0280  31 DB                             xor             ebx,ebx
0282  E8 00 00 00 00                    call            _AppendMenuA
0287  B9 00 00 00 00                    mov             ecx,offset __MainDriver
028C  68 00 7F 00 00                    push            0x00007f00
0291  89 9C 24 84 00 00 00              mov             dword ptr 0x84[esp],ebx
0298  89 9C 24 8C 00 00 00              mov             dword ptr 0x8c[esp],ebx
029F  89 9C 24 90 00 00 00              mov             dword ptr 0x90[esp],ebx
02A6  53                                push            ebx
02A7  89 AC 24 98 00 00 00              mov             dword ptr 0x98[esp],ebp
02AE  89 8C 24 8C 00 00 00              mov             dword ptr 0x8c[esp],ecx
02B5  E8 00 00 00 00                    call            _LoadIconA
02BA  68 00 7F 00 00                    push            0x00007f00
02BF  53                                push            ebx
02C0  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
02C7  E8 00 00 00 00                    call            _LoadCursorA
02CC  6A 02                             push            0x00000002
02CE  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
02D5  E8 00 00 00 00                    call            _GetStockObject
02DA  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
02E1  A1 00 00 00 00                    mov             eax,dword ptr _mainClass
02E6  89 84 24 A4 00 00 00              mov             dword ptr 0xa4[esp],eax
02ED  8D 84 24 80 00 00 00              lea             eax,0x80[esp]
02F4  50                                push            eax
02F5  89 9C 24 A4 00 00 00              mov             dword ptr 0xa4[esp],ebx
02FC  E8 00 00 00 00                    call            _RegisterClassA
0301  25 FF FF 00 00                    and             eax,0x0000ffff
0306  0F 84 8B 00 00 00                 je              L$10
030C  68 00 7F 00 00                    push            0x00007f00
0311  89 9C 24 84 00 00 00              mov             dword ptr 0x84[esp],ebx
0318  89 AC 24 94 00 00 00              mov             dword ptr 0x94[esp],ebp
031F  31 C9                             xor             ecx,ecx
0321  BB 00 00 00 00                    mov             ebx,offset __MainDriver
0326  89 8C 24 8C 00 00 00              mov             dword ptr 0x8c[esp],ecx
032D  51                                push            ecx
032E  89 8C 24 94 00 00 00              mov             dword ptr 0x94[esp],ecx
0335  89 9C 24 8C 00 00 00              mov             dword ptr 0x8c[esp],ebx
033C  E8 00 00 00 00                    call            _LoadIconA
0341  68 00 7F 00 00                    push            0x00007f00
0346  31 F6                             xor             esi,esi
0348  56                                push            esi
0349  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
0350  E8 00 00 00 00                    call            _LoadCursorA
0355  56                                push            esi
0356  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
035D  E8 00 00 00 00                    call            _GetStockObject
0362  89 84 24 9C 00 00 00              mov             dword ptr 0x9c[esp],eax
0369  A1 00 00 00 00                    mov             eax,dword ptr __ClassName
036E  89 84 24 A4 00 00 00              mov             dword ptr 0xa4[esp],eax
0375  8D 84 24 80 00 00 00              lea             eax,0x80[esp]
037C  31 FF                             xor             edi,edi
037E  50                                push            eax
037F  89 BC 24 A4 00 00 00              mov             dword ptr 0xa4[esp],edi
0386  E8 00 00 00 00                    call            _RegisterClassA
038B  25 FF FF 00 00                    and             eax,0x0000ffff
0390  74 05                             je              L$10
0392  B8 01 00 00 00                    mov             eax,0x00000001
0397                            L$10:
0397  81 C4 A8 00 00 00                 add             esp,0x000000a8
039D  5D                                pop             ebp
039E  5F                                pop             edi
039F  5E                                pop             esi
03A0  5A                                pop             edx
03A1  59                                pop             ecx
03A2  5B                                pop             ebx
03A3  C3                                ret
03A4                            windowsInit_:
03A4  53                                push            ebx
03A5  51                                push            ecx
03A6  56                                push            esi
03A7  57                                push            edi
03A8  55                                push            ebp
03A9  83 EC 3C                          sub             esp,0x0000003c
03AC  89 C3                             mov             ebx,eax
03AE  89 D7                             mov             edi,edx
03B0  6A 0B                             push            0x0000000b
03B2  E8 00 00 00 00                    call            _GetStockObject
03B7  89 C2                             mov             edx,eax
03B9  A3 00 00 00 00                    mov             dword ptr __FixedFont,eax
03BE  89 E0                             mov             eax,esp
03C0  50                                push            eax
03C1  6A 3C                             push            0x0000003c
03C3  52                                push            edx
03C4  E8 00 00 00 00                    call            _GetObjectA
03C9  89 E0                             mov             eax,esp
03CB  50                                push            eax
03CC  E8 00 00 00 00                    call            _CreateFontIndirectA
03D1  6A 00                             push            0x00000000
03D3  A3 00 00 00 00                    mov             dword ptr __FixedFont,eax
03D8  E8 00 00 00 00                    call            _GetSystemMetrics
03DD  6A 01                             push            0x00000001
03DF  89 C6                             mov             esi,eax
03E1  E8 00 00 00 00                    call            _GetSystemMetrics
03E6  89 C2                             mov             edx,eax
03E8  89 D8                             mov             eax,ebx
03EA  E8 00 00 00 00                    call            _InitMainWindowData_
03EF  6A 00                             push            0x00000000
03F1  53                                push            ebx
03F2  8B 1D 00 00 00 00                 mov             ebx,dword ptr __MainMenu
03F8  53                                push            ebx
03F9  31 C0                             xor             eax,eax
03FB  6A 00                             push            0x00000000
03FD  66 89 D0                          mov             ax,dx
0400  50                                push            eax
0401  31 C0                             xor             eax,eax
0403  66 89 F0                          mov             ax,si
0406  50                                push            eax
0407  6A 00                             push            0x00000000
0409  6A 00                             push            0x00000000
040B  68 00 00 CF 02                    push            0x02cf0000
0410  68 00 00 00 00                    push            offset ___WinTitleBar
0415  8B 0D 00 00 00 00                 mov             ecx,dword ptr _mainClass
041B  51                                push            ecx
041C  6A 00                             push            0x00000000
041E  E8 00 00 00 00                    call            _CreateWindowExA
0423  89 C3                             mov             ebx,eax
0425  A3 00 00 00 00                    mov             dword ptr __MainWindow,eax
042A  85 C0                             test            eax,eax
042C  0F 84 A3 00 00 00                 je              L$11
0432  57                                push            edi
0433  50                                push            eax
0434  E8 00 00 00 00                    call            _ShowWindow
0439  8B 35 00 00 00 00                 mov             esi,dword ptr __MainWindow
043F  56                                push            esi
0440  E8 00 00 00 00                    call            _UpdateWindow
0445  E8 00 00 00 00                    call            __NTInitFileHandles_
044A  E8 00 00 00 00                    call            __NTGetFakeHandle_
044F  E8 00 00 00 00                    call            __NTAddFileHandle_
0454  E8 00 00 00 00                    call            __NTGetFakeHandle_
0459  E8 00 00 00 00                    call            __NTAddFileHandle_
045E  E8 00 00 00 00                    call            __NTGetFakeHandle_
0463  E8 00 00 00 00                    call            __NTAddFileHandle_
0468  31 C0                             xor             eax,eax
046A  E8 00 00 00 00                    call            __IOMode_
046F  80 CC 20                          or              ah,0x20
0472  89 C2                             mov             edx,eax
0474  31 C0                             xor             eax,eax
0476  E8 00 00 00 00                    call            __SetIOMode_
047B  B8 01 00 00 00                    mov             eax,0x00000001
0480  E8 00 00 00 00                    call            __IOMode_
0485  80 CC 20                          or              ah,0x20
0488  89 C2                             mov             edx,eax
048A  B8 01 00 00 00                    mov             eax,0x00000001
048F  E8 00 00 00 00                    call            __SetIOMode_
0494  B8 02 00 00 00                    mov             eax,0x00000002
0499  E8 00 00 00 00                    call            __IOMode_
049E  80 CC 20                          or              ah,0x20
04A1  89 C2                             mov             edx,eax
04A3  B8 02 00 00 00                    mov             eax,0x00000002
04A8  E8 00 00 00 00                    call            __SetIOMode_
04AD  6A FF                             push            0xffffffff
04AF  8B 3D 44 00 00 00                 mov             edi,dword ptr ___iob+0x44
04B5  57                                push            edi
04B6  8B 2D 2A 00 00 00                 mov             ebp,dword ptr ___iob+0x2a
04BC  55                                push            ebp
04BD  A1 10 00 00 00                    mov             eax,dword ptr ___iob+0x10
04C2  50                                push            eax
04C3  68 81 00 00 00                    push            offset DGROUP:L$24
04C8  E8 00 00 00 00                    call            _NewWindow_
04CD  B8 01 00 00 00                    mov             eax,0x00000001
04D2  83 C4 14                          add             esp,0x00000014
04D5                            L$11:
04D5  83 C4 3C                          add             esp,0x0000003c
04D8  5D                                pop             ebp
04D9  5F                                pop             edi
04DA  5E                                pop             esi
04DB  59                                pop             ecx
04DC  5B                                pop             ebx
04DD  C3                                ret

Routine Size: 1138 bytes,    Routine Base: _TEXT + 006C

No disassembly errors

Segment: CONST DWORD USE32 0000008D bytes
0000                            L$12:
0000  57 41 54 43 4C 41 53 53 25 64 00                WATCLASS%d.
000B                            L$13:
000B  57 41 54 53 55 42 43 4C 41 53 53 25 64 00       WATSUBCLASS%d.
0019                            L$14:
0019  26 53 61 76 65 20 41 73 20 2E 2E 2E 00          &Save As ....
0026                            L$15:
0026  53 65 74 20 26 4C 69 6E 65 73 20 42 65 74 77 65 Set &Lines Betwe
0036  65 6E 20 41 75 74 6F 2D 43 6C 65 61 72 73 20 2E en Auto-Clears .
0046  2E 2E 00                                        ...
0049                            L$16:
0049  45 26 78 69 74 00                               E&xit.
004F                            L$17:
004F  26 41 62 6F 75 74 2E 2E 2E 00                   &About....
0059                            L$18:
0059  26 43 6C 65 61 72 00                            &Clear.
0060                            L$19:
0060  26 43 6F 70 79 00                               &Copy.
0066                            L$20:
0066  26 46 69 6C 65 00                               &File.
006C                            L$21:
006C  26 45 64 69 74 00                               &Edit.
0072                            L$22:
0072  26 57 69 6E 64 6F 77 73 00                      &Windows.
007B                            L$23:
007B  26 48 65 6C 70 00                               &Help.
0081                            L$24:
0081  53 74 61 6E 64 61 72 64 20 49 4F 00             Standard IO.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000                            _mainClass:

BSS Size: 4 bytes

