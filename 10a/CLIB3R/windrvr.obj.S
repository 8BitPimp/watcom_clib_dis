Module: windrvr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006E0 bytes
0000                            _SetAboutDlg_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  89 C6                             mov             esi,eax
0006  85 C0                             test            eax,eax
0008  74 5C                             je              L$4
000A  8B 1D 00 00 00 00                 mov             ebx,dword ptr _AboutTitle
0010  81 FB 00 00 00 00                 cmp             ebx,offset _DefaultAboutTitle
0016  74 07                             je              L$1
0018  89 D8                             mov             eax,ebx
001A  E8 00 00 00 00                    call            _MemFree_
001F                            L$1:
001F  89 F7                             mov             edi,esi
0021  06                                push            es
0022  8C D8                             mov             eax,ds
0024  8E C0                             mov             es,eax
0026  29 C9                             sub             ecx,ecx
0028  49                                dec             ecx
0029  31 C0                             xor             eax,eax
002B  F2 AE                             repne scasb
002D  F7 D1                             not             ecx
002F  49                                dec             ecx
0030  07                                pop             es
0031  8D 41 01                          lea             eax,0x1[ecx]
0034  E8 00 00 00 00                    call            _MemAlloc_
0039  89 C7                             mov             edi,eax
003B  A3 00 00 00 00                    mov             dword ptr _AboutTitle,eax
0040  85 C0                             test            eax,eax
0042  0F 84 81 00 00 00                 je              L$9
0048  57                                push            edi
0049                            L$2:
0049  8A 06                             mov             al,byte ptr [esi]
004B  88 07                             mov             byte ptr [edi],al
004D  3C 00                             cmp             al,0x00
004F  0F 84 10 00 00 00                 je              L$3
0055  8A 46 01                          mov             al,byte ptr 0x1[esi]
0058  83 C6 02                          add             esi,0x00000002
005B  88 47 01                          mov             byte ptr 0x1[edi],al
005E  83 C7 02                          add             edi,0x00000002
0061  3C 00                             cmp             al,0x00
0063  75 E4                             jne             L$2
0065                            L$3:
0065  5F                                pop             edi
0066                            L$4:
0066  85 D2                             test            edx,edx
0068  74 5A                             je              L$8
006A  8B 0D 00 00 00 00                 mov             ecx,dword ptr _AboutMsg
0070  81 F9 00 00 00 00                 cmp             ecx,offset _DefaultAboutMsg
0076  74 07                             je              L$5
0078  89 C8                             mov             eax,ecx
007A  E8 00 00 00 00                    call            _MemFree_
007F                            L$5:
007F  89 D7                             mov             edi,edx
0081  06                                push            es
0082  8C D8                             mov             eax,ds
0084  8E C0                             mov             es,eax
0086  29 C9                             sub             ecx,ecx
0088  49                                dec             ecx
0089  31 C0                             xor             eax,eax
008B  F2 AE                             repne scasb
008D  F7 D1                             not             ecx
008F  49                                dec             ecx
0090  07                                pop             es
0091  8D 41 01                          lea             eax,0x1[ecx]
0094  E8 00 00 00 00                    call            _MemAlloc_
0099  89 C7                             mov             edi,eax
009B  A3 00 00 00 00                    mov             dword ptr _AboutMsg,eax
00A0  85 C0                             test            eax,eax
00A2  74 25                             je              L$9
00A4  89 D6                             mov             esi,edx
00A6  57                                push            edi
00A7                            L$6:
00A7  8A 06                             mov             al,byte ptr [esi]
00A9  88 07                             mov             byte ptr [edi],al
00AB  3C 00                             cmp             al,0x00
00AD  0F 84 10 00 00 00                 je              L$7
00B3  8A 46 01                          mov             al,byte ptr 0x1[esi]
00B6  83 C6 02                          add             esi,0x00000002
00B9  88 47 01                          mov             byte ptr 0x1[edi],al
00BC  83 C7 02                          add             edi,0x00000002
00BF  3C 00                             cmp             al,0x00
00C1  75 E4                             jne             L$6
00C3                            L$7:
00C3  5F                                pop             edi
00C4                            L$8:
00C4  B8 01 00 00 00                    mov             eax,0x00000001
00C9                            L$9:
00C9  5F                                pop             edi
00CA  5E                                pop             esi
00CB  59                                pop             ecx
00CC  5B                                pop             ebx
00CD  C3                                ret
00CE  8B C0                             mov             eax,eax
00D0                            L$10:
00D0  61 02 00 00                                     DD        offset L$27
00D4  69 02 00 00                                     DD        offset L$28
00D8  95 02 00 00                                     DD        offset L$29
00DC  4B 02 00 00                                     DD        offset L$26
00E0  13 02 00 00                                     DD        offset L$25
00E4  F1 01 00 00                                     DD        offset L$21
00E8                            L$11:
00E8  A3 03 00 00                                     DD        offset L$41
00EC  AC 03 00 00                                     DD        offset L$42
00F0  C5 03 00 00                                     DD        offset L$45
00F4  B5 03 00 00                                     DD        offset L$43
00F8  D7 03 00 00                                     DD        offset L$46
00FC  9A 03 00 00                                     DD        offset L$40
0100  D7 03 00 00                                     DD        offset L$46
0104  91 03 00 00                                     DD        offset L$39
0108                            MainWindowProc_:
0108  56                                push            esi
0109  57                                push            edi
010A  55                                push            ebp
010B  81 EC 84 00 00 00                 sub             esp,0x00000084
0111  89 C5                             mov             ebp,eax
0113  89 D7                             mov             edi,edx
0115  89 DE                             mov             esi,ebx
0117  89 8C 24 80 00 00 00              mov             dword ptr 0x80[esp],ecx
011E  83 FA 08                          cmp             edx,0x00000008
0121  72 32                             jb              L$13
0123  76 49                             jbe             L$14
0125  81 FA 01 01 00 00                 cmp             edx,0x00000101
012B  72 17                             jb              L$12
012D  0F 86 CE 02 00 00                 jbe             L$48
0133  81 FA 11 01 00 00                 cmp             edx,0x00000111
0139  0F 84 70 00 00 00                 je              L$19
013F  E9 EC 02 00 00                    jmp             L$50
0144                            L$12:
0144  81 FA 00 01 00 00                 cmp             edx,0x00000100
014A  0F 84 81 01 00 00                 je              L$32
0150  E9 DB 02 00 00                    jmp             L$50
0155                            L$13:
0155  83 FA 02                          cmp             edx,0x00000002
0158  0F 82 D2 02 00 00                 jb              L$50
015E  0F 86 55 01 00 00                 jbe             L$31
0164  83 FA 07                          cmp             edx,0x00000007
0167  74 2C                             je              L$17
0169  E9 C2 02 00 00                    jmp             L$50
016E                            L$14:
016E  E8 00 00 00 00                    call            _GetActiveWindowData_
0173  85 C0                             test            eax,eax
0175  74 09                             je              L$15
0177  89 C2                             mov             edx,eax
0179  31 C0                             xor             eax,eax
017B  E8 00 00 00 00                    call            _ShowWindowActive_
0180                            L$15:
0180  8B 9C 24 80 00 00 00              mov             ebx,dword ptr 0x80[esp]
0187  53                                push            ebx
0188                            L$16:
0188  56                                push            esi
0189  57                                push            edi
018A  55                                push            ebp
018B  E8 00 00 00 00                    call            _DefWindowProcA
0190  E9 74 00 00 00                    jmp             L$24
0195                            L$17:
0195  E8 00 00 00 00                    call            _GetActiveWindowData_
019A  85 C0                             test            eax,eax
019C  74 07                             je              L$18
019E  31 D2                             xor             edx,edx
01A0  E8 00 00 00 00                    call            _ShowWindowActive_
01A5                            L$18:
01A5  8B 8C 24 80 00 00 00              mov             ecx,dword ptr 0x80[esp]
01AC  51                                push            ecx
01AD  EB D9                             jmp             L$16
01AF                            L$19:
01AF  66 81 FB C8 00                    cmp             bx,0x00c8
01B4  72 21                             jb              L$20
01B6  31 C0                             xor             eax,eax
01B8  66 89 D8                          mov             ax,bx
01BB  2D C8 00 00 00                    sub             eax,0x000000c8
01C0  E8 00 00 00 00                    call            _IsWindowedHandle_
01C5  85 C0                             test            eax,eax
01C7  0F 84 3A 00 00 00                 je              L$23
01CD  E8 00 00 00 00                    call            _MakeWindowActive_
01D2  E9 30 00 00 00                    jmp             L$23
01D7                            L$20:
01D7  89 D8                             mov             eax,ebx
01D9  48                                dec             eax
01DA  66 3D 05 00                       cmp             ax,0x0005
01DE  0F 87 C8 00 00 00                 ja              L$30
01E4  25 FF FF 00 00                    and             eax,0x0000ffff
01E9  2E FF 24 85 D0 00 00 00           jmp             dword ptr cs:L$10[eax*4]
01F1                            L$21:
01F1  6A 40                             push            0x00000040
01F3  8B 1D 00 00 00 00                 mov             ebx,dword ptr _AboutTitle
01F9  53                                push            ebx
01FA  8B 0D 00 00 00 00                 mov             ecx,dword ptr _AboutMsg
0200  51                                push            ecx
0201  55                                push            ebp
0202                            L$22:
0202  E8 00 00 00 00                    call            _MessageBoxA
0207                            L$23:
0207  31 C0                             xor             eax,eax
0209                            L$24:
0209  81 C4 84 00 00 00                 add             esp,0x00000084
020F  5D                                pop             ebp
0210  5F                                pop             edi
0211  5E                                pop             esi
0212  C3                                ret
0213                            L$25:
0213  8B 15 00 00 00 00                 mov             edx,dword ptr __AutoClearLines
0219  E8 00 00 00 00                    call            _GetClearInterval_
021E  8B 35 00 00 00 00                 mov             esi,dword ptr __AutoClearLines
0224  39 F2                             cmp             edx,esi
0226  74 DF                             je              L$23
0228  56                                push            esi
0229  68 00 00 00 00                    push            offset DGROUP:L$78
022E  8D 44 24 08                       lea             eax,0x8[esp]
0232  50                                push            eax
0233  E8 00 00 00 00                    call            sprintf_
0238  83 C4 0C                          add             esp,0x0000000c
023B  6A 00                             push            0x00000000
023D  68 28 00 00 00                    push            offset DGROUP:L$79
0242  8D 44 24 08                       lea             eax,0x8[esp]
0246  50                                push            eax
0247  6A 00                             push            0x00000000
0249  EB B7                             jmp             L$22
024B                            L$26:
024B  E8 00 00 00 00                    call            _GetActiveWindowData_
0250  85 C0                             test            eax,eax
0252  74 B3                             je              L$23
0254  F6 40 52 08                       test            byte ptr 0x52[eax],0x08
0258  75 AD                             jne             L$23
025A  E8 00 00 00 00                    call            _CopyAllLines_
025F  EB A6                             jmp             L$23
0261                            L$27:
0261  55                                push            ebp
0262  E8 00 00 00 00                    call            _DestroyWindow
0267  EB 9E                             jmp             L$23
0269                            L$28:
0269  E8 00 00 00 00                    call            _GetActiveWindowData_
026E  89 C3                             mov             ebx,eax
0270  85 C0                             test            eax,eax
0272  74 93                             je              L$23
0274  83 78 6B 00                       cmp             dword ptr 0x6b[eax],0x00000000
0278  75 8D                             jne             L$23
027A  85 C0                             test            eax,eax
027C  74 89                             je              L$23
027E  F6 40 52 08                       test            byte ptr 0x52[eax],0x08
0282  75 83                             jne             L$23
0284  E8 00 00 00 00                    call            _FreeAllLines_
0289  89 D8                             mov             eax,ebx
028B  E8 00 00 00 00                    call            _ClearWindow_
0290  E9 72 FF FF FF                    jmp             L$23
0295                            L$29:
0295  E8 00 00 00 00                    call            _GetActiveWindowData_
029A  85 C0                             test            eax,eax
029C  0F 84 65 FF FF FF                 je              L$23
02A2  E8 00 00 00 00                    call            _SaveAllLines_
02A7  E9 5B FF FF FF                    jmp             L$23
02AC                            L$30:
02AC  8B 94 24 80 00 00 00              mov             edx,dword ptr 0x80[esp]
02B3  52                                push            edx
02B4  E9 CF FE FF FF                    jmp             L$16
02B9                            L$31:
02B9  8B 35 00 00 00 00                 mov             esi,dword ptr __FixedFont
02BF  56                                push            esi
02C0  E8 00 00 00 00                    call            _DeleteObject
02C5  6A 00                             push            0x00000000
02C7  E8 00 00 00 00                    call            _PostQuitMessage
02CC  E9 36 FF FF FF                    jmp             L$23
02D1                            L$32:
02D1  E8 00 00 00 00                    call            _GetActiveWindowData_
02D6  89 C3                             mov             ebx,eax
02D8  83 FE 11                          cmp             esi,0x00000011
02DB  75 09                             jne             L$33
02DD  80 0D 00 00 00 00 08              or              byte ptr _shiftState,0x08
02E4  EB 67                             jmp             L$36
02E6                            L$33:
02E6  83 FE 03                          cmp             esi,0x00000003
02E9  75 2A                             jne             L$35
02EB  6A 40                             push            0x00000040
02ED  B8 33 00 00 00                    mov             eax,offset DGROUP:L$80
02F2  50                                push            eax
02F3  B8 3C 00 00 00                    mov             eax,offset DGROUP:L$81
02F8  50                                push            eax
02F9  55                                push            ebp
02FA  E8 00 00 00 00                    call            _MessageBoxA
02FF  80 25 00 00 00 00 F7              and             byte ptr _shiftState,0xf7
0306  B8 07 00 00 00                    mov             eax,0x00000007
030B                            L$34:
030B  E8 00 00 00 00                    call            raise_
0310  E9 F2 FE FF FF                    jmp             L$23
0315                            L$35:
0315  F6 05 00 00 00 00 08              test            byte ptr _shiftState,0x08
031C  74 2F                             je              L$36
031E  83 FE 43                          cmp             esi,0x00000043
0321  75 2A                             jne             L$36
0323  6A 40                             push            0x00000040
0325  B8 3D 00 00 00                    mov             eax,offset DGROUP:L$82
032A  50                                push            eax
032B  B8 3C 00 00 00                    mov             eax,offset DGROUP:L$81
0330  50                                push            eax
0331  55                                push            ebp
0332  E8 00 00 00 00                    call            _MessageBoxA
0337  8A 2D 00 00 00 00                 mov             ch,byte ptr _shiftState
033D  80 E5 F7                          and             ch,0xf7
0340  B8 04 00 00 00                    mov             eax,0x00000004
0345  88 2D 00 00 00 00                 mov             byte ptr _shiftState,ch
034B  EB BE                             jmp             L$34
034D                            L$36:
034D  8B 84 24 80 00 00 00              mov             eax,dword ptr 0x80[esp]
0354  C1 E8 10                          shr             eax,0x10
0357  25 FF FF 00 00                    and             eax,0x0000ffff
035C  85 DB                             test            ebx,ebx
035E  75 14                             jne             L$38
0360                            L$37:
0360  31 D2                             xor             edx,edx
0362  66 89 C2                          mov             dx,ax
0365  31 C0                             xor             eax,eax
0367  66 89 F0                          mov             ax,si
036A  E8 00 00 00 00                    call            _WindowsKeyPush_
036F  E9 93 FE FF FF                    jmp             L$23
0374                            L$38:
0374  8B 53 6B                          mov             edx,dword ptr 0x6b[ebx]
0377  85 D2                             test            edx,edx
0379  75 E5                             jne             L$37
037B  52                                push            edx
037C  E8 00 00 00 00                    call            _ShowCursor
0381  8D 46 DF                          lea             eax,-0x21[esi]
0384  83 F8 07                          cmp             eax,0x00000007
0387  77 4E                             ja              L$46
0389  2E FF 24 85 E8 00 00 00           jmp             dword ptr cs:L$11[eax*4]
0391                            L$39:
0391  89 D8                             mov             eax,ebx
0393  E8 00 00 00 00                    call            _MoveLineDown_
0398  EB 5B                             jmp             L$47
039A                            L$40:
039A  89 D8                             mov             eax,ebx
039C  E8 00 00 00 00                    call            _MoveLineUp_
03A1  EB 52                             jmp             L$47
03A3                            L$41:
03A3  89 D8                             mov             eax,ebx
03A5  E8 00 00 00 00                    call            _MovePageUp_
03AA  EB 49                             jmp             L$47
03AC                            L$42:
03AC  89 D8                             mov             eax,ebx
03AE  E8 00 00 00 00                    call            _MovePageDown_
03B3  EB 40                             jmp             L$47
03B5                            L$43:
03B5  BA 01 00 00 00                    mov             edx,0x00000001
03BA  89 D8                             mov             eax,ebx
03BC  89 D3                             mov             ebx,edx
03BE                            L$44:
03BE  E8 00 00 00 00                    call            _MoveToLine_
03C3  EB 30                             jmp             L$47
03C5                            L$45:
03C5  89 D8                             mov             eax,ebx
03C7  E8 00 00 00 00                    call            _GetLastLineNumber_
03CC  89 C2                             mov             edx,eax
03CE  89 D8                             mov             eax,ebx
03D0  BB 01 00 00 00                    mov             ebx,0x00000001
03D5  EB E7                             jmp             L$44
03D7                            L$46:
03D7  8B 84 24 80 00 00 00              mov             eax,dword ptr 0x80[esp]
03DE  C1 E8 10                          shr             eax,0x10
03E1  31 D2                             xor             edx,edx
03E3  25 FF FF 00 00                    and             eax,0x0000ffff
03E8  66 89 C2                          mov             dx,ax
03EB  31 C0                             xor             eax,eax
03ED  66 89 F0                          mov             ax,si
03F0  E8 00 00 00 00                    call            _WindowsKeyPush_
03F5                            L$47:
03F5  6A 01                             push            0x00000001
03F7  E8 00 00 00 00                    call            _ShowCursor
03FC  E9 06 FE FF FF                    jmp             L$23
0401                            L$48:
0401  83 FB 11                          cmp             ebx,0x00000011
0404  75 07                             jne             L$49
0406  80 25 00 00 00 00 F7              and             byte ptr _shiftState,0xf7
040D                            L$49:
040D  8B 84 24 80 00 00 00              mov             eax,dword ptr 0x80[esp]
0414  C1 E8 10                          shr             eax,0x10
0417  31 D2                             xor             edx,edx
0419  25 FF FF 00 00                    and             eax,0x0000ffff
041E  66 89 C2                          mov             dx,ax
0421  31 C0                             xor             eax,eax
0423  66 89 F0                          mov             ax,si
0426  E8 00 00 00 00                    call            _WindowsKeyUp_
042B  E9 D7 FD FF FF                    jmp             L$23
0430                            L$50:
0430  8B 84 24 80 00 00 00              mov             eax,dword ptr 0x80[esp]
0437  50                                push            eax
0438  E9 4B FD FF FF                    jmp             L$16
043D  8D 40 00                          lea             eax,[eax]
0440                            L$51:
0440  C3 06 00 00                                     DD        offset L$75
0444  BA 06 00 00                                     DD        offset L$74
0448  B1 06 00 00                                     DD        offset L$73
044C  A8 06 00 00                                     DD        offset L$72
0450  80 06 00 00                                     DD        offset L$71

Routine Size: 1108 bytes,    Routine Base: _TEXT + 0000

0454                            __MainDriver:
0454  53                                push            ebx
0455  56                                push            esi
0456  57                                push            edi
0457  55                                push            ebp
0458  83 EC 54                          sub             esp,0x00000054
045B  8B 6C 24 68                       mov             ebp,dword ptr 0x68[esp]
045F  8B 7C 24 6C                       mov             edi,dword ptr 0x6c[esp]
0463  3B 2D 00 00 00 00                 cmp             ebp,dword ptr __MainWindow
0469  75 16                             jne             L$52
046B  8B 4C 24 74                       mov             ecx,dword ptr 0x74[esp]
046F  8B 5C 24 70                       mov             ebx,dword ptr 0x70[esp]
0473  89 FA                             mov             edx,edi
0475  89 E8                             mov             eax,ebp
0477  E8 00 00 00 00                    call            MainWindowProc_
047C  E9 05 01 00 00                    jmp             L$65
0481                            L$52:
0481  89 E8                             mov             eax,ebp
0483  E8 00 00 00 00                    call            _GetWindowData_
0488  89 C6                             mov             esi,eax
048A  89 C3                             mov             ebx,eax
048C  85 C0                             test            eax,eax
048E  75 16                             jne             L$55
0490  8B 5C 24 74                       mov             ebx,dword ptr 0x74[esp]
0494                            L$53:
0494  53                                push            ebx
0495  8B 4C 24 74                       mov             ecx,dword ptr 0x74[esp]
0499  51                                push            ecx
049A                            L$54:
049A  57                                push            edi
049B  55                                push            ebp
049C  E8 00 00 00 00                    call            _DefWindowProcA
04A1  E9 E0 00 00 00                    jmp             L$65
04A6                            L$55:
04A6  83 FF 0F                          cmp             edi,0x0000000f
04A9  72 3A                             jb              L$57
04AB  0F 86 E6 00 00 00                 jbe             L$67
04B1  83 FF 41                          cmp             edi,0x00000041
04B4  72 25                             jb              L$56
04B6  0F 86 9B 00 00 00                 jbe             L$63
04BC  81 FF 12 01 00 00                 cmp             edi,0x00000112
04C2  0F 82 09 02 00 00                 jb              L$77
04C8  76 55                             jbe             L$60
04CA  81 FF 15 01 00 00                 cmp             edi,0x00000115
04D0  0F 84 8C 01 00 00                 je              L$70
04D6  E9 F6 01 00 00                    jmp             L$77
04DB                            L$56:
04DB  83 FF 21                          cmp             edi,0x00000021
04DE  74 3F                             je              L$60
04E0  E9 EC 01 00 00                    jmp             L$77
04E5                            L$57:
04E5  83 FF 05                          cmp             edi,0x00000005
04E8  72 1B                             jb              L$58
04EA  0F 86 C8 00 00 00                 jbe             L$68
04F0  83 FF 07                          cmp             edi,0x00000007
04F3  0F 82 D8 01 00 00                 jb              L$77
04F9  76 18                             jbe             L$59
04FB  83 FF 08                          cmp             edi,0x00000008
04FE  74 2F                             je              L$61
0500  E9 CC 01 00 00                    jmp             L$77
0505                            L$58:
0505  83 FF 02                          cmp             edi,0x00000002
0508  0F 84 82 00 00 00                 je              L$66
050E  E9 BE 01 00 00                    jmp             L$77
0513                            L$59:
0513  8B 15 00 00 00 00                 mov             edx,dword ptr __MainWindow
0519  52                                push            edx
051A  E8 00 00 00 00                    call            _SetFocus
051F                            L$60:
051F  89 D8                             mov             eax,ebx
0521  8B 5C 24 74                       mov             ebx,dword ptr 0x74[esp]
0525  E8 00 00 00 00                    call            _MakeWindowActive_
052A  E9 65 FF FF FF                    jmp             L$53
052F                            L$61:
052F  8B 5C 24 70                       mov             ebx,dword ptr 0x70[esp]
0533  85 DB                             test            ebx,ebx
0535  74 11                             je              L$62
0537  3B 1D 00 00 00 00                 cmp             ebx,dword ptr __MainWindow
053D  74 09                             je              L$62
053F  89 F2                             mov             edx,esi
0541  31 C0                             xor             eax,eax
0543  E8 00 00 00 00                    call            _ShowWindowActive_
0548                            L$62:
0548  8B 74 24 74                       mov             esi,dword ptr 0x74[esp]
054C  56                                push            esi
054D  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
0551  50                                push            eax
0552  E9 43 FF FF FF                    jmp             L$54
0557                            L$63:
0557  68 31 20 00 00                    push            0x00002031
055C  68 44 00 00 00                    push            offset DGROUP:L$83
0561  68 53 00 00 00                    push            offset DGROUP:L$84
0566  6A 00                             push            0x00000000
0568  E8 00 00 00 00                    call            _MessageBoxA
056D  83 F8 01                          cmp             eax,0x00000001
0570  0F 85 0E 00 00 00                 jne             L$64
0576  89 F0                             mov             eax,esi
0578  E8 00 00 00 00                    call            _FreeAllLines_
057D  89 F0                             mov             eax,esi
057F  E8 00 00 00 00                    call            _ClearWindow_
0584                            L$64:
0584  31 C0                             xor             eax,eax
0586                            L$65:
0586  83 C4 54                          add             esp,0x00000054
0589  5D                                pop             ebp
058A  5F                                pop             edi
058B  5E                                pop             esi
058C  5B                                pop             ebx
058D  C2 10 00                          ret             0x0010
0590                            L$66:
0590  E8 00 00 00 00                    call            _DestroyAWindow_
0595  EB ED                             jmp             L$64
0597                            L$67:
0597  89 E0                             mov             eax,esp
0599  50                                push            eax
059A  55                                push            ebp
059B  E8 00 00 00 00                    call            _BeginPaint
05A0  8D 54 24 08                       lea             edx,0x8[esp]
05A4  89 C3                             mov             ebx,eax
05A6  89 F0                             mov             eax,esi
05A8  E8 00 00 00 00                    call            _RepaintWindow_
05AD  89 E0                             mov             eax,esp
05AF  50                                push            eax
05B0  55                                push            ebp
05B1  E8 00 00 00 00                    call            _EndPaint
05B6  EB CC                             jmp             L$64
05B8                            L$68:
05B8  F6 40 52 01                       test            byte ptr 0x52[eax],0x01
05BC  74 18                             je              L$69
05BE  8A 56 52                          mov             dl,byte ptr 0x52[esi]
05C1  8B 4C 24 74                       mov             ecx,dword ptr 0x74[esp]
05C5  80 E2 FE                          and             dl,0xfe
05C8  51                                push            ecx
05C9  88 56 52                          mov             byte ptr 0x52[esi],dl
05CC  8B 74 24 74                       mov             esi,dword ptr 0x74[esp]
05D0  56                                push            esi
05D1  E9 C4 FE FF FF                    jmp             L$54
05D6                            L$69:
05D6  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
05DA  C1 E8 10                          shr             eax,0x10
05DD  25 FF FF 00 00                    and             eax,0x0000ffff
05E2  55                                push            ebp
05E3  89 44 24 54                       mov             dword ptr 0x54[esp],eax
05E7  E8 00 00 00 00                    call            _GetDC
05EC  8B 7E 36                          mov             edi,dword ptr 0x36[esi]
05EF  57                                push            edi
05F0  50                                push            eax
05F1  89 C3                             mov             ebx,eax
05F3  E8 00 00 00 00                    call            _SelectObject
05F8  6A 00                             push            0x00000000
05FA  6A 00                             push            0x00000000
05FC  6A 00                             push            0x00000000
05FE  53                                push            ebx
05FF  89 C7                             mov             edi,eax
0601  E8 00 00 00 00                    call            _SetBrushOrgEx
0606  8D 44 24 40                       lea             eax,0x40[esp]
060A  50                                push            eax
060B  55                                push            ebp
060C  E8 00 00 00 00                    call            _GetClientRect
0611  8B 46 36                          mov             eax,dword ptr 0x36[esi]
0614  50                                push            eax
0615  8D 44 24 44                       lea             eax,0x44[esp]
0619  50                                push            eax
061A  53                                push            ebx
061B  E8 00 00 00 00                    call            _FillRect
0620  57                                push            edi
0621  53                                push            ebx
0622  E8 00 00 00 00                    call            _SelectObject
0627  53                                push            ebx
0628  55                                push            ebp
0629  E8 00 00 00 00                    call            _ReleaseDC
062E  8B 54 24 44                       mov             edx,dword ptr 0x44[esp]
0632  8B 5C 24 40                       mov             ebx,dword ptr 0x40[esp]
0636  31 C0                             xor             eax,eax
0638  31 C9                             xor             ecx,ecx
063A  66 8B 44 24 50                    mov             ax,word ptr 0x50[esp]
063F  66 8B 4C 24 74                    mov             cx,word ptr 0x74[esp]
0644  01 D0                             add             eax,edx
0646  01 D9                             add             ecx,ebx
0648  50                                push            eax
0649  89 DA                             mov             edx,ebx
064B  8B 5C 24 48                       mov             ebx,dword ptr 0x48[esp]
064F  89 F0                             mov             eax,esi
0651  E8 00 00 00 00                    call            _ResizeWin_
0656  89 F0                             mov             eax,esi
0658  E8 00 00 00 00                    call            _DisplayAllLines_
065D  E9 22 FF FF FF                    jmp             L$64
0662                            L$70:
0662  6A 00                             push            0x00000000
0664  E8 00 00 00 00                    call            _ShowCursor
0669  8B 54 24 70                       mov             edx,dword ptr 0x70[esp]
066D  66 83 FA 04                       cmp             dx,0x0004
0671  77 57                             ja              L$76
0673  31 C0                             xor             eax,eax
0675  66 89 D0                          mov             ax,dx
0678  2E FF 24 85 40 04 00 00           jmp             dword ptr cs:L$51[eax*4]
0680                            L$71:
0680  8B 44 24 70                       mov             eax,dword ptr 0x70[esp]
0684  C1 E8 10                          shr             eax,0x10
0687  31 D2                             xor             edx,edx
0689  25 FF FF 00 00                    and             eax,0x0000ffff
068E  66 89 C2                          mov             dx,ax
0691  89 F0                             mov             eax,esi
0693  BB 01 00 00 00                    mov             ebx,0x00000001
0698  E8 00 00 00 00                    call            _GetLineFromThumbPosition_
069D  89 C2                             mov             edx,eax
069F  89 F0                             mov             eax,esi
06A1  E8 00 00 00 00                    call            _MoveToLine_
06A6  EB 22                             jmp             L$76
06A8                            L$72:
06A8  89 F0                             mov             eax,esi
06AA  E8 00 00 00 00                    call            _MovePageDown_
06AF  EB 19                             jmp             L$76
06B1                            L$73:
06B1  89 F0                             mov             eax,esi
06B3  E8 00 00 00 00                    call            _MovePageUp_
06B8  EB 10                             jmp             L$76
06BA                            L$74:
06BA  89 F0                             mov             eax,esi
06BC  E8 00 00 00 00                    call            _MoveLineDown_
06C1  EB 07                             jmp             L$76
06C3                            L$75:
06C3  89 F0                             mov             eax,esi
06C5  E8 00 00 00 00                    call            _MoveLineUp_
06CA                            L$76:
06CA  6A 01                             push            0x00000001
06CC  E8 00 00 00 00                    call            _ShowCursor
06D1                            L$77:
06D1  8B 44 24 74                       mov             eax,dword ptr 0x74[esp]
06D5  50                                push            eax
06D6  8B 54 24 74                       mov             edx,dword ptr 0x74[esp]
06DA  52                                push            edx
06DB  E9 BA FD FF FF                    jmp             L$54

Routine Size: 652 bytes,    Routine Base: _TEXT + 0454

No disassembly errors

Segment: CONST DWORD USE32 00000081 bytes
0000                            L$78:
0000  42 75 66 66 65 72 73 20 77 69 6C 6C 20 62 65 20 Buffers will be
0010  63 6C 65 61 72 65 64 20 61 66 74 65 72 20 25 6C cleared after %l
0020  64 20 6C 69 6E 65 73 00                         d lines.
0028                            L$79:
0028  41 6D 6F 75 6E 74 20 53 65 74 00                Amount Set.
0033                            L$80:
0033  53 49 47 42 52 45 41 4B 00                      SIGBREAK.
003C                            L$81:
003C  00                                              .
003D                            L$82:
003D  53 49 47 49 4E 54 00                            SIGINT.
0044                            L$83:
0044  53 79 73 74 65 6D 20 52 65 71 75 65 73 74 00    System Request.
0053                            L$84:
0053  53 79 73 74 65 6D 20 68 61 73 20 69 6E 64 69 63 System has indic
0063  61 74 65 64 20 6C 6F 77 20 6D 65 6D 6F 72 79 2C ated low memory,
0073  20 43 6C 65 61 72 20 4C 69 6E 65 73 3F 00        Clear Lines?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000093 bytes
0000                            _DefaultAboutMsg:
0000  20 20 20 57 41 54 43 4F 4D 20 44 65 66 61 75 6C    WATCOM Defaul
0010  74 20 57 69 6E 64 6F 77 20 53 79 73 74 65 6D 0A t Window System.
0020  0A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 .
0030  20 56 65 72 73 69 6F 6E 20 31 30 2E 30 0A 0A 20  Version 10.0..
0040  A9 20 31 39 39 31 2D 31 39 39 34 20 57 41 54 43 . 1991-1994 WATC
0050  4F 4D 20 53 79 73 74 65 6D 73 2C 20 49 6E 63 2E OM Systems, Inc.
0060  00                                              .
0061                            _AboutMsg:
0061  00 00 00 00                                     DD        offset _DefaultAboutMsg
0065                            _DefaultAboutTitle:
0065  41 62 6F 75 74 20 57 41 54 43 4F 4D 20 44 65 66 About WATCOM Def
0075  61 75 6C 74 20 57 69 6E 64 6F 77 69 6E 67 20 53 ault Windowing S
0085  79 73 74 65 6D 00                               ystem.
008B                            _AboutTitle:
008B  00 00 00 00                                     DD        offset _DefaultAboutTitle
008F                            _shiftState:
008F  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

