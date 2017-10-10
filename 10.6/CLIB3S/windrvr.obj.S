Module: windrvr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006F5 bytes
0000                            _SetAboutDlg:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0007  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
000B  85 F6                             test            esi,esi
000D  74 5C                             je              L$4
000F  8B 15 00 00 00 00                 mov             edx,dword ptr AboutTitle
0015  81 FA 00 00 00 00                 cmp             edx,offset DefaultAboutTitle
001B  74 09                             je              L$1
001D  52                                push            edx
001E  E8 00 00 00 00                    call            _MemFree
0023  83 C4 04                          add             esp,0x00000004
0026                            L$1:
0026  89 F7                             mov             edi,esi
0028  06                                push            es
0029  8C D8                             mov             eax,ds
002B  8E C0                             mov             es,eax
002D  29 C9                             sub             ecx,ecx
002F  49                                dec             ecx
0030  31 C0                             xor             eax,eax
0032  F2 AE                             repne scasb
0034  F7 D1                             not             ecx
0036  49                                dec             ecx
0037  07                                pop             es
0038  41                                inc             ecx
0039  51                                push            ecx
003A  E8 00 00 00 00                    call            _MemAlloc
003F  83 C4 04                          add             esp,0x00000004
0042  A3 00 00 00 00                    mov             dword ptr AboutTitle,eax
0047  85 C0                             test            eax,eax
0049  0F 84 7F 00 00 00                 je              L$9
004F  89 C7                             mov             edi,eax
0051  57                                push            edi
0052                            L$2:
0052  8A 06                             mov             al,byte ptr [esi]
0054  88 07                             mov             byte ptr [edi],al
0056  3C 00                             cmp             al,0x00
0058  74 10                             je              L$3
005A  8A 46 01                          mov             al,byte ptr 0x1[esi]
005D  83 C6 02                          add             esi,0x00000002
0060  88 47 01                          mov             byte ptr 0x1[edi],al
0063  83 C7 02                          add             edi,0x00000002
0066  3C 00                             cmp             al,0x00
0068  75 E8                             jne             L$2
006A                            L$3:
006A  5F                                pop             edi
006B                            L$4:
006B  85 DB                             test            ebx,ebx
006D  74 5A                             je              L$8
006F  8B 35 00 00 00 00                 mov             esi,dword ptr AboutMsg
0075  81 FE 00 00 00 00                 cmp             esi,offset DefaultAboutMsg
007B  74 09                             je              L$5
007D  56                                push            esi
007E  E8 00 00 00 00                    call            _MemFree
0083  83 C4 04                          add             esp,0x00000004
0086                            L$5:
0086  89 DF                             mov             edi,ebx
0088  06                                push            es
0089  8C D8                             mov             eax,ds
008B  8E C0                             mov             es,eax
008D  29 C9                             sub             ecx,ecx
008F  49                                dec             ecx
0090  31 C0                             xor             eax,eax
0092  F2 AE                             repne scasb
0094  F7 D1                             not             ecx
0096  49                                dec             ecx
0097  07                                pop             es
0098  41                                inc             ecx
0099  51                                push            ecx
009A  E8 00 00 00 00                    call            _MemAlloc
009F  83 C4 04                          add             esp,0x00000004
00A2  A3 00 00 00 00                    mov             dword ptr AboutMsg,eax
00A7  85 C0                             test            eax,eax
00A9  74 23                             je              L$9
00AB  89 DE                             mov             esi,ebx
00AD  89 C7                             mov             edi,eax
00AF  57                                push            edi
00B0                            L$6:
00B0  8A 06                             mov             al,byte ptr [esi]
00B2  88 07                             mov             byte ptr [edi],al
00B4  3C 00                             cmp             al,0x00
00B6  74 10                             je              L$7
00B8  8A 46 01                          mov             al,byte ptr 0x1[esi]
00BB  83 C6 02                          add             esi,0x00000002
00BE  88 47 01                          mov             byte ptr 0x1[edi],al
00C1  83 C7 02                          add             edi,0x00000002
00C4  3C 00                             cmp             al,0x00
00C6  75 E8                             jne             L$6
00C8                            L$7:
00C8  5F                                pop             edi
00C9                            L$8:
00C9  B8 01 00 00 00                    mov             eax,0x00000001
00CE                            L$9:
00CE  5F                                pop             edi
00CF  5E                                pop             esi
00D0  5B                                pop             ebx
00D1  C3                                ret
00D2  8B C0                             mov             eax,eax
00D4                            L$10:
00D4  5B 02 00 00                                     DD        offset L$26
00D8  63 02 00 00                                     DD        offset L$27
00DC  8E 02 00 00                                     DD        offset L$28
00E0  41 02 00 00                                     DD        offset L$25
00E4  09 02 00 00                                     DD        offset L$24
00E8  E6 01 00 00                                     DD        offset L$20
00EC                            L$11:
00EC  66 03 00 00                                     DD        offset L$39
00F0  6E 03 00 00                                     DD        offset L$40
00F4  85 03 00 00                                     DD        offset L$43
00F8  76 03 00 00                                     DD        offset L$41
00FC  93 03 00 00                                     DD        offset L$44
0100  5E 03 00 00                                     DD        offset L$38
0104  93 03 00 00                                     DD        offset L$44
0108  50 03 00 00                                     DD        offset L$36
010C                            MainWindowProc:
010C  53                                push            ebx
010D  56                                push            esi
010E  57                                push            edi
010F  55                                push            ebp
0110  81 EC 80 00 00 00                 sub             esp,0x00000080
0116  8B BC 24 94 00 00 00              mov             edi,dword ptr 0x94[esp]
011D  8B B4 24 98 00 00 00              mov             esi,dword ptr 0x98[esp]
0124  8B 9C 24 9C 00 00 00              mov             ebx,dword ptr 0x9c[esp]
012B  8B AC 24 A0 00 00 00              mov             ebp,dword ptr 0xa0[esp]
0132  81 FE 00 01 00 00                 cmp             esi,0x00000100
0138  72 22                             jb              L$12
013A  0F 86 7B 01 00 00                 jbe             L$30
0140  81 FE 02 01 00 00                 cmp             esi,0x00000102
0146  0F 82 CE 02 00 00                 jb              L$49
014C  0F 86 93 02 00 00                 jbe             L$47
0152  81 FE 11 01 00 00                 cmp             esi,0x00000111
0158  74 4B                             je              L$18
015A  EB 2D                             jmp             L$16
015C                            L$12:
015C  83 FE 07                          cmp             esi,0x00000007
015F  72 09                             jb              L$13
0161  76 34                             jbe             L$17
0163  83 FE 08                          cmp             esi,0x00000008
0166  74 0D                             je              L$14
0168  EB 1F                             jmp             L$16
016A                            L$13:
016A  83 FE 02                          cmp             esi,0x00000002
016D  0F 84 30 01 00 00                 je              L$29
0173  EB 14                             jmp             L$16
0175                            L$14:
0175  E8 00 00 00 00                    call            _GetActiveWindowData
017A  85 C0                             test            eax,eax
017C  74 0B                             je              L$16
017E  50                                push            eax
017F  6A 00                             push            0x00000000
0181                            L$15:
0181  E8 00 00 00 00                    call            _ShowWindowActive
0186  83 C4 08                          add             esp,0x00000008
0189                            L$16:
0189  55                                push            ebp
018A  53                                push            ebx
018B  56                                push            esi
018C  57                                push            edi
018D  E8 00 00 00 00                    call            _DefWindowProcA
0192  E9 67 00 00 00                    jmp             L$23
0197                            L$17:
0197  E8 00 00 00 00                    call            _GetActiveWindowData
019C  85 C0                             test            eax,eax
019E  74 E9                             je              L$16
01A0  6A 00                             push            0x00000000
01A2  50                                push            eax
01A3  EB DC                             jmp             L$15
01A5                            L$18:
01A5  31 C0                             xor             eax,eax
01A7  66 89 D8                          mov             ax,bx
01AA  3D C8 00 00 00                    cmp             eax,0x000000c8
01AF  7C 21                             jl              L$19
01B1  2D C8 00 00 00                    sub             eax,0x000000c8
01B6  50                                push            eax
01B7  E8 00 00 00 00                    call            _IsWindowedHandle
01BC  83 C4 04                          add             esp,0x00000004
01BF  85 C0                             test            eax,eax
01C1  0F 84 35 00 00 00                 je              L$22
01C7  50                                push            eax
01C8  E8 00 00 00 00                    call            _MakeWindowActive
01CD  E9 2D 01 00 00                    jmp             L$33
01D2                            L$19:
01D2  48                                dec             eax
01D3  66 3D 05 00                       cmp             ax,0x0005
01D7  77 B0                             ja              L$16
01D9  25 FF FF 00 00                    and             eax,0x0000ffff
01DE  2E FF 24 85 D4 00 00 00           jmp             dword ptr cs:L$10[eax*4]
01E6                            L$20:
01E6  6A 40                             push            0x00000040
01E8  8B 15 00 00 00 00                 mov             edx,dword ptr AboutTitle
01EE  52                                push            edx
01EF  8B 1D 00 00 00 00                 mov             ebx,dword ptr AboutMsg
01F5  53                                push            ebx
01F6  57                                push            edi
01F7                            L$21:
01F7  E8 00 00 00 00                    call            _MessageBoxA
01FC                            L$22:
01FC  31 C0                             xor             eax,eax
01FE                            L$23:
01FE  81 C4 80 00 00 00                 add             esp,0x00000080
0204  5D                                pop             ebp
0205  5F                                pop             edi
0206  5E                                pop             esi
0207  5B                                pop             ebx
0208  C3                                ret
0209                            L$24:
0209  8B 1D 00 00 00 00                 mov             ebx,dword ptr _AutoClearLines
020F  E8 00 00 00 00                    call            _GetClearInterval
0214  8B 0D 00 00 00 00                 mov             ecx,dword ptr _AutoClearLines
021A  39 CB                             cmp             ebx,ecx
021C  74 DE                             je              L$22
021E  51                                push            ecx
021F  68 00 00 00 00                    push            offset DGROUP:L$80
0224  8D 44 24 08                       lea             eax,0x8[esp]
0228  50                                push            eax
0229  E8 00 00 00 00                    call            sprintf
022E  83 C4 0C                          add             esp,0x0000000c
0231  6A 00                             push            0x00000000
0233  68 28 00 00 00                    push            offset DGROUP:L$81
0238  8D 44 24 08                       lea             eax,0x8[esp]
023C  50                                push            eax
023D  6A 00                             push            0x00000000
023F  EB B6                             jmp             L$21
0241                            L$25:
0241  E8 00 00 00 00                    call            _GetActiveWindowData
0246  85 C0                             test            eax,eax
0248  74 B2                             je              L$22
024A  F6 40 52 08                       test            byte ptr 0x52[eax],0x08
024E  75 AC                             jne             L$22
0250  50                                push            eax
0251  E8 00 00 00 00                    call            _CopyAllLines
0256  E9 A4 00 00 00                    jmp             L$33
025B                            L$26:
025B  57                                push            edi
025C  E8 00 00 00 00                    call            _DestroyWindow
0261  EB 99                             jmp             L$22
0263                            L$27:
0263  E8 00 00 00 00                    call            _GetActiveWindowData
0268  89 C3                             mov             ebx,eax
026A  85 C0                             test            eax,eax
026C  74 8E                             je              L$22
026E  83 78 6B 00                       cmp             dword ptr 0x6b[eax],0x00000000
0272  75 88                             jne             L$22
0274  F6 40 52 08                       test            byte ptr 0x52[eax],0x08
0278  75 82                             jne             L$22
027A  50                                push            eax
027B  E8 00 00 00 00                    call            _FreeAllLines
0280  83 C4 04                          add             esp,0x00000004
0283  53                                push            ebx
0284  E8 00 00 00 00                    call            _ClearWindow
0289  E9 71 00 00 00                    jmp             L$33
028E                            L$28:
028E  E8 00 00 00 00                    call            _GetActiveWindowData
0293  85 C0                             test            eax,eax
0295  0F 84 61 FF FF FF                 je              L$22
029B  50                                push            eax
029C  E8 00 00 00 00                    call            _SaveAllLines
02A1  EB 5C                             jmp             L$33
02A3                            L$29:
02A3  8B 2D 00 00 00 00                 mov             ebp,dword ptr _FixedFont
02A9  55                                push            ebp
02AA  E8 00 00 00 00                    call            _DeleteObject
02AF  6A 00                             push            0x00000000
02B1  E8 00 00 00 00                    call            _PostQuitMessage
02B6  E9 41 FF FF FF                    jmp             L$22
02BB                            L$30:
02BB  E8 00 00 00 00                    call            _GetActiveWindowData
02C0  89 C6                             mov             esi,eax
02C2  83 FB 11                          cmp             ebx,0x00000011
02C5  75 09                             jne             L$31
02C7  80 0D 00 00 00 00 08              or              byte ptr shiftState,0x08
02CE  EB 69                             jmp             L$35
02D0                            L$31:
02D0  83 FB 03                          cmp             ebx,0x00000003
02D3  75 32                             jne             L$34
02D5  6A 40                             push            0x00000040
02D7  B8 33 00 00 00                    mov             eax,offset DGROUP:L$82
02DC  50                                push            eax
02DD  B8 3C 00 00 00                    mov             eax,offset DGROUP:L$83
02E2  50                                push            eax
02E3  57                                push            edi
02E4  E8 00 00 00 00                    call            _MessageBoxA
02E9  8A 25 00 00 00 00                 mov             ah,byte ptr shiftState
02EF  80 E4 F7                          and             ah,0xf7
02F2  6A 07                             push            0x00000007
02F4  88 25 00 00 00 00                 mov             byte ptr shiftState,ah
02FA                            L$32:
02FA  E8 00 00 00 00                    call            raise
02FF                            L$33:
02FF  83 C4 04                          add             esp,0x00000004
0302  E9 F5 FE FF FF                    jmp             L$22
0307                            L$34:
0307  F6 05 00 00 00 00 08              test            byte ptr shiftState,0x08
030E  74 29                             je              L$35
0310  83 FB 43                          cmp             ebx,0x00000043
0313  75 24                             jne             L$35
0315  6A 40                             push            0x00000040
0317  B8 3D 00 00 00                    mov             eax,offset DGROUP:L$84
031C  50                                push            eax
031D  B8 3C 00 00 00                    mov             eax,offset DGROUP:L$83
0322  50                                push            eax
0323  57                                push            edi
0324  E8 00 00 00 00                    call            _MessageBoxA
0329  A0 00 00 00 00                    mov             al,byte ptr shiftState
032E  24 F7                             and             al,0xf7
0330  6A 04                             push            0x00000004
0332  A2 00 00 00 00                    mov             byte ptr shiftState,al
0337  EB C1                             jmp             L$32
0339                            L$35:
0339  6A 00                             push            0x00000000
033B  E8 00 00 00 00                    call            _ShowCursor
0340  8D 43 DF                          lea             eax,-0x21[ebx]
0343  83 F8 07                          cmp             eax,0x00000007
0346  77 4B                             ja              L$44
0348  2E FF 24 85 EC 00 00 00           jmp             dword ptr cs:L$11[eax*4]
0350                            L$36:
0350  56                                push            esi
0351  E8 00 00 00 00                    call            _MoveLineDown
0356                            L$37:
0356  83 C4 04                          add             esp,0x00000004
0359  E9 7B 00 00 00                    jmp             L$46
035E                            L$38:
035E  56                                push            esi
035F  E8 00 00 00 00                    call            _MoveLineUp
0364  EB F0                             jmp             L$37
0366                            L$39:
0366  56                                push            esi
0367  E8 00 00 00 00                    call            _MovePageUp
036C  EB E8                             jmp             L$37
036E                            L$40:
036E  56                                push            esi
036F  E8 00 00 00 00                    call            _MovePageDown
0374  EB E0                             jmp             L$37
0376                            L$41:
0376  6A 01                             push            0x00000001
0378  6A 01                             push            0x00000001
037A                            L$42:
037A  56                                push            esi
037B  E8 00 00 00 00                    call            _MoveToLine
0380  83 C4 0C                          add             esp,0x0000000c
0383  EB 54                             jmp             L$46
0385                            L$43:
0385  6A 01                             push            0x00000001
0387  56                                push            esi
0388  E8 00 00 00 00                    call            _GetLastLineNumber
038D  83 C4 04                          add             esp,0x00000004
0390  50                                push            eax
0391  EB E7                             jmp             L$42
0393                            L$44:
0393  83 FB 24                          cmp             ebx,0x00000024
0396  74 23                             je              L$45
0398  83 FB 23                          cmp             ebx,0x00000023
039B  74 1E                             je              L$45
039D  83 FB 0D                          cmp             ebx,0x0000000d
03A0  74 19                             je              L$45
03A2  83 FB 25                          cmp             ebx,0x00000025
03A5  74 14                             je              L$45
03A7  83 FB 27                          cmp             ebx,0x00000027
03AA  74 0F                             je              L$45
03AC  83 FB 2E                          cmp             ebx,0x0000002e
03AF  74 0A                             je              L$45
03B1  83 FB 08                          cmp             ebx,0x00000008
03B4  74 05                             je              L$45
03B6  83 FB 2D                          cmp             ebx,0x0000002d
03B9  75 1E                             jne             L$46
03BB                            L$45:
03BB  89 E8                             mov             eax,ebp
03BD  C1 E8 10                          shr             eax,0x10
03C0  25 FF FF 00 00                    and             eax,0x0000ffff
03C5  25 FF FF 00 00                    and             eax,0x0000ffff
03CA  50                                push            eax
03CB  31 C0                             xor             eax,eax
03CD  66 89 D8                          mov             ax,bx
03D0  50                                push            eax
03D1  E8 00 00 00 00                    call            _WindowsVirtualKeyPush
03D6  83 C4 08                          add             esp,0x00000008
03D9                            L$46:
03D9  6A 01                             push            0x00000001
03DB  E8 00 00 00 00                    call            _ShowCursor
03E0  E9 17 FE FF FF                    jmp             L$22
03E5                            L$47:
03E5  83 FB 0D                          cmp             ebx,0x0000000d
03E8  0F 84 0E FE FF FF                 je              L$22
03EE  83 FB 08                          cmp             ebx,0x00000008
03F1  0F 84 05 FE FF FF                 je              L$22
03F7  89 E8                             mov             eax,ebp
03F9  C1 E8 10                          shr             eax,0x10
03FC  25 FF FF 00 00                    and             eax,0x0000ffff
0401  25 FF FF 00 00                    and             eax,0x0000ffff
0406  50                                push            eax
0407  31 C0                             xor             eax,eax
0409  66 89 D8                          mov             ax,bx
040C  50                                push            eax
040D  E8 00 00 00 00                    call            _WindowsKeyPush
0412                            L$48:
0412  83 C4 08                          add             esp,0x00000008
0415  E9 E2 FD FF FF                    jmp             L$22
041A                            L$49:
041A  83 FB 11                          cmp             ebx,0x00000011
041D  75 07                             jne             L$50
041F  80 25 00 00 00 00 F7              and             byte ptr shiftState,0xf7
0426                            L$50:
0426  89 E8                             mov             eax,ebp
0428  C1 E8 10                          shr             eax,0x10
042B  25 FF FF 00 00                    and             eax,0x0000ffff
0430  25 FF FF 00 00                    and             eax,0x0000ffff
0435  50                                push            eax
0436  31 C0                             xor             eax,eax
0438  66 89 D8                          mov             ax,bx
043B  50                                push            eax
043C  E8 00 00 00 00                    call            _WindowsKeyUp
0441  EB CF                             jmp             L$48
0443  90                                nop
0444                            L$51:
0444  D6 06 00 00                                     DD        offset L$76
0448  CE 06 00 00                                     DD        offset L$75
044C  C6 06 00 00                                     DD        offset L$74
0450  BE 06 00 00                                     DD        offset L$73
0454  95 06 00 00                                     DD        offset L$72

Routine Size: 1112 bytes,    Routine Base: _TEXT + 0000

0458                            __MainDriver:
0458  53                                push            ebx
0459  56                                push            esi
045A  57                                push            edi
045B  55                                push            ebp
045C  83 EC 54                          sub             esp,0x00000054
045F  8B 7C 24 68                       mov             edi,dword ptr 0x68[esp]
0463  8B 74 24 6C                       mov             esi,dword ptr 0x6c[esp]
0467  3B 3D 00 00 00 00                 cmp             edi,dword ptr _MainWindow
046D  75 19                             jne             L$52
046F  8B 54 24 74                       mov             edx,dword ptr 0x74[esp]
0473  52                                push            edx
0474  8B 5C 24 74                       mov             ebx,dword ptr 0x74[esp]
0478  53                                push            ebx
0479  56                                push            esi
047A  57                                push            edi
047B  E8 00 00 00 00                    call            MainWindowProc
0480  83 C4 10                          add             esp,0x00000010
0483  E9 12 01 00 00                    jmp             L$66
0488                            L$52:
0488  57                                push            edi
0489  E8 00 00 00 00                    call            _GetWindowData
048E  89 C3                             mov             ebx,eax
0490  83 C4 04                          add             esp,0x00000004
0493  89 C5                             mov             ebp,eax
0495  85 C0                             test            eax,eax
0497  75 0F                             jne             L$53
0499  8B 6C 24 74                       mov             ebp,dword ptr 0x74[esp]
049D  55                                push            ebp
049E  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
04A2  50                                push            eax
04A3  E9 B3 00 00 00                    jmp             L$62
04A8                            L$53:
04A8  83 FE 0F                          cmp             esi,0x0000000f
04AB  72 3A                             jb              L$55
04AD  0F 86 F9 00 00 00                 jbe             L$68
04B3  83 FE 41                          cmp             esi,0x00000041
04B6  72 25                             jb              L$54
04B8  0F 86 A9 00 00 00                 jbe             L$63
04BE  81 FE 12 01 00 00                 cmp             esi,0x00000112
04C4  0F 82 1C 02 00 00                 jb              L$79
04CA  76 55                             jbe             L$58
04CC  81 FE 15 01 00 00                 cmp             esi,0x00000115
04D2  0F 84 9F 01 00 00                 je              L$71
04D8  E9 09 02 00 00                    jmp             L$79
04DD                            L$54:
04DD  83 FE 21                          cmp             esi,0x00000021
04E0  74 3F                             je              L$58
04E2  E9 FF 01 00 00                    jmp             L$79
04E7                            L$55:
04E7  83 FE 05                          cmp             esi,0x00000005
04EA  72 1B                             jb              L$56
04EC  0F 86 DD 00 00 00                 jbe             L$69
04F2  83 FE 07                          cmp             esi,0x00000007
04F5  0F 82 EB 01 00 00                 jb              L$79
04FB  76 18                             jbe             L$57
04FD  83 FE 08                          cmp             esi,0x00000008
0500  74 34                             je              L$59
0502  E9 DF 01 00 00                    jmp             L$79
0507                            L$56:
0507  83 FE 02                          cmp             esi,0x00000002
050A  0F 84 94 00 00 00                 je              L$67
0510  E9 D1 01 00 00                    jmp             L$79
0515                            L$57:
0515  8B 1D 00 00 00 00                 mov             ebx,dword ptr _MainWindow
051B  53                                push            ebx
051C  E8 00 00 00 00                    call            _SetFocus
0521                            L$58:
0521  55                                push            ebp
0522  E8 00 00 00 00                    call            _MakeWindowActive
0527  83 C4 04                          add             esp,0x00000004
052A  8B 4C 24 74                       mov             ecx,dword ptr 0x74[esp]
052E  51                                push            ecx
052F  8B 6C 24 74                       mov             ebp,dword ptr 0x74[esp]
0533  55                                push            ebp
0534  EB 25                             jmp             L$62
0536                            L$59:
0536  8B 4C 24 70                       mov             ecx,dword ptr 0x70[esp]
053A  85 C9                             test            ecx,ecx
053C  74 13                             je              L$60
053E  3B 0D 00 00 00 00                 cmp             ecx,dword ptr _MainWindow
0544  74 0B                             je              L$60
0546  50                                push            eax
0547  6A 00                             push            0x00000000
0549  E8 00 00 00 00                    call            _ShowWindowActive
054E  83 C4 08                          add             esp,0x00000008
0551                            L$60:
0551  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
0555  50                                push            eax
0556                            L$61:
0556  8B 54 24 74                       mov             edx,dword ptr 0x74[esp]
055A  52                                push            edx
055B                            L$62:
055B  56                                push            esi
055C  57                                push            edi
055D  E8 00 00 00 00                    call            _DefWindowProcA
0562  E9 33 00 00 00                    jmp             L$66
0567                            L$63:
0567  68 31 20 00 00                    push            0x00002031
056C  68 44 00 00 00                    push            offset DGROUP:L$85
0571  68 53 00 00 00                    push            offset DGROUP:L$86
0576  6A 00                             push            0x00000000
0578  E8 00 00 00 00                    call            _MessageBoxA
057D  83 F8 01                          cmp             eax,0x00000001
0580  0F 85 12 00 00 00                 jne             L$65
0586  53                                push            ebx
0587  E8 00 00 00 00                    call            _FreeAllLines
058C  83 C4 04                          add             esp,0x00000004
058F  53                                push            ebx
0590  E8 00 00 00 00                    call            _ClearWindow
0595                            L$64:
0595  83 C4 04                          add             esp,0x00000004
0598                            L$65:
0598  31 C0                             xor             eax,eax
059A                            L$66:
059A  83 C4 54                          add             esp,0x00000054
059D  5D                                pop             ebp
059E  5F                                pop             edi
059F  5E                                pop             esi
05A0  5B                                pop             ebx
05A1  C2 10 00                          ret             0x0010
05A4                            L$67:
05A4  50                                push            eax
05A5  E8 00 00 00 00                    call            _DestroyAWindow
05AA  EB E9                             jmp             L$64
05AC                            L$68:
05AC  89 E0                             mov             eax,esp
05AE  50                                push            eax
05AF  57                                push            edi
05B0  E8 00 00 00 00                    call            _BeginPaint
05B5  50                                push            eax
05B6  8D 44 24 0C                       lea             eax,0xc[esp]
05BA  50                                push            eax
05BB  53                                push            ebx
05BC  E8 00 00 00 00                    call            _RepaintWindow
05C1  83 C4 0C                          add             esp,0x0000000c
05C4  89 E0                             mov             eax,esp
05C6  50                                push            eax
05C7  57                                push            edi
05C8  E8 00 00 00 00                    call            _EndPaint
05CD  EB C9                             jmp             L$65
05CF                            L$69:
05CF  F6 40 52 01                       test            byte ptr 0x52[eax],0x01
05D3  74 13                             je              L$70
05D5  8A 53 52                          mov             dl,byte ptr 0x52[ebx]
05D8  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
05DC  80 E2 FE                          and             dl,0xfe
05DF  50                                push            eax
05E0  88 53 52                          mov             byte ptr 0x52[ebx],dl
05E3  E9 6E FF FF FF                    jmp             L$61
05E8                            L$70:
05E8  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
05EC  C1 E8 10                          shr             eax,0x10
05EF  25 FF FF 00 00                    and             eax,0x0000ffff
05F4  57                                push            edi
05F5  89 44 24 54                       mov             dword ptr 0x54[esp],eax
05F9  E8 00 00 00 00                    call            _GetDC
05FE  89 C6                             mov             esi,eax
0600  8B 43 36                          mov             eax,dword ptr 0x36[ebx]
0603  50                                push            eax
0604  56                                push            esi
0605  E8 00 00 00 00                    call            _SelectObject
060A  6A 00                             push            0x00000000
060C  6A 00                             push            0x00000000
060E  6A 00                             push            0x00000000
0610  56                                push            esi
0611  89 C5                             mov             ebp,eax
0613  E8 00 00 00 00                    call            _SetBrushOrgEx
0618  8D 44 24 40                       lea             eax,0x40[esp]
061C  50                                push            eax
061D  57                                push            edi
061E  E8 00 00 00 00                    call            _GetClientRect
0623  8B 53 36                          mov             edx,dword ptr 0x36[ebx]
0626  52                                push            edx
0627  8D 44 24 44                       lea             eax,0x44[esp]
062B  50                                push            eax
062C  56                                push            esi
062D  E8 00 00 00 00                    call            _FillRect
0632  55                                push            ebp
0633  56                                push            esi
0634  E8 00 00 00 00                    call            _SelectObject
0639  56                                push            esi
063A  57                                push            edi
063B  E8 00 00 00 00                    call            _ReleaseDC
0640  31 C0                             xor             eax,eax
0642  8B 4C 24 44                       mov             ecx,dword ptr 0x44[esp]
0646  66 8B 44 24 50                    mov             ax,word ptr 0x50[esp]
064B  01 C8                             add             eax,ecx
064D  50                                push            eax
064E  31 C0                             xor             eax,eax
0650  8B 74 24 44                       mov             esi,dword ptr 0x44[esp]
0654  66 8B 44 24 78                    mov             ax,word ptr 0x78[esp]
0659  01 F0                             add             eax,esi
065B  50                                push            eax
065C  51                                push            ecx
065D  56                                push            esi
065E  53                                push            ebx
065F  E8 00 00 00 00                    call            _ResizeWin
0664  83 C4 14                          add             esp,0x00000014
0667  6A 00                             push            0x00000000
0669  53                                push            ebx
066A  E8 00 00 00 00                    call            _DisplayAllLines
066F  83 C4 08                          add             esp,0x00000008
0672  E9 21 FF FF FF                    jmp             L$65
0677                            L$71:
0677  6A 00                             push            0x00000000
0679  E8 00 00 00 00                    call            _ShowCursor
067E  8B 54 24 70                       mov             edx,dword ptr 0x70[esp]
0682  66 83 FA 04                       cmp             dx,0x0004
0686  77 57                             ja              L$78
0688  31 C0                             xor             eax,eax
068A  66 89 D0                          mov             ax,dx
068D  2E FF 24 85 44 04 00 00           jmp             dword ptr cs:L$51[eax*4]
0695                            L$72:
0695  8B 44 24 70                       mov             eax,dword ptr 0x70[esp]
0699  C1 E8 10                          shr             eax,0x10
069C  6A 01                             push            0x00000001
069E  25 FF FF 00 00                    and             eax,0x0000ffff
06A3  25 FF FF 00 00                    and             eax,0x0000ffff
06A8  50                                push            eax
06A9  53                                push            ebx
06AA  E8 00 00 00 00                    call            _GetLineFromThumbPosition
06AF  83 C4 08                          add             esp,0x00000008
06B2  50                                push            eax
06B3  53                                push            ebx
06B4  E8 00 00 00 00                    call            _MoveToLine
06B9  83 C4 0C                          add             esp,0x0000000c
06BC  EB 21                             jmp             L$78
06BE                            L$73:
06BE  53                                push            ebx
06BF  E8 00 00 00 00                    call            _MovePageDown
06C4  EB 16                             jmp             L$77
06C6                            L$74:
06C6  53                                push            ebx
06C7  E8 00 00 00 00                    call            _MovePageUp
06CC  EB 0E                             jmp             L$77
06CE                            L$75:
06CE  53                                push            ebx
06CF  E8 00 00 00 00                    call            _MoveLineDown
06D4  EB 06                             jmp             L$77
06D6                            L$76:
06D6  53                                push            ebx
06D7  E8 00 00 00 00                    call            _MoveLineUp
06DC                            L$77:
06DC  83 C4 04                          add             esp,0x00000004
06DF                            L$78:
06DF  6A 01                             push            0x00000001
06E1  E8 00 00 00 00                    call            _ShowCursor
06E6                            L$79:
06E6  8B 5C 24 74                       mov             ebx,dword ptr 0x74[esp]
06EA  53                                push            ebx
06EB  8B 4C 24 74                       mov             ecx,dword ptr 0x74[esp]
06EF  51                                push            ecx
06F0  E9 66 FE FF FF                    jmp             L$62

Routine Size: 669 bytes,    Routine Base: _TEXT + 0458

No disassembly errors

Segment: CONST DWORD USE32 00000081 bytes
0000                            L$80:
0000  42 75 66 66 65 72 73 20 77 69 6C 6C 20 62 65 20 Buffers will be
0010  63 6C 65 61 72 65 64 20 61 66 74 65 72 20 25 6C cleared after %l
0020  64 20 6C 69 6E 65 73 00                         d lines.
0028                            L$81:
0028  41 6D 6F 75 6E 74 20 53 65 74 00                Amount Set.
0033                            L$82:
0033  53 49 47 42 52 45 41 4B 00                      SIGBREAK.
003C                            L$83:
003C  00                                              .
003D                            L$84:
003D  53 49 47 49 4E 54 00                            SIGINT.
0044                            L$85:
0044  53 79 73 74 65 6D 20 52 65 71 75 65 73 74 00    System Request.
0053                            L$86:
0053  53 79 73 74 65 6D 20 68 61 73 20 69 6E 64 69 63 System has indic
0063  61 74 65 64 20 6C 6F 77 20 6D 65 6D 6F 72 79 2C ated low memory,
0073  20 43 6C 65 61 72 20 4C 69 6E 65 73 3F 00        Clear Lines?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000093 bytes
0000                            DefaultAboutMsg:
0000  20 20 20 57 41 54 43 4F 4D 20 44 65 66 61 75 6C    WATCOM Defaul
0010  74 20 57 69 6E 64 6F 77 20 53 79 73 74 65 6D 0A t Window System.
0020  0A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 .
0030  20 56 65 72 73 69 6F 6E 20 31 30 2E 30 0A 0A 20  Version 10.0..
0040  A9 20 31 39 39 31 2D 31 39 39 34 20 57 41 54 43 . 1991-1994 WATC
0050  4F 4D 20 53 79 73 74 65 6D 73 2C 20 49 6E 63 2E OM Systems, Inc.
0060  00                                              .
0061                            AboutMsg:
0061  00 00 00 00                                     DD        offset DefaultAboutMsg
0065                            DefaultAboutTitle:
0065  41 62 6F 75 74 20 57 41 54 43 4F 4D 20 44 65 66 About WATCOM Def
0075  61 75 6C 74 20 57 69 6E 64 6F 77 69 6E 67 20 53 ault Windowing S
0085  79 73 74 65 6D 00                               ystem.
008B                            AboutTitle:
008B  00 00 00 00                                     DD        offset DefaultAboutTitle
008F                            shiftState:
008F  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

