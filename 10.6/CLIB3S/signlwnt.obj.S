Module: signlwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006FC bytes
0000                            _CtrlSignalHandler:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  85 C0                             test            eax,eax
0007  76 07                             jbe             L$1
0009  83 F8 01                          cmp             eax,0x00000001
000C  74 21                             je              L$5
000E  EB 0D                             jmp             L$2
0010                            L$1:
0010  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0016  8B 58 78                          mov             ebx,dword ptr 0x78[eax]
0019  85 DB                             test            ebx,ebx
001B  75 06                             jne             L$3
001D                            L$2:
001D  31 C0                             xor             eax,eax
001F  5B                                pop             ebx
0020  C2 04 00                          ret             0x0004
0023                            L$3:
0023  6A 04                             push            0x00000004
0025                            L$4:
0025  E8 00 00 00 00                    call            raise
002A  83 C4 04                          add             esp,0x00000004
002D  EB 14                             jmp             L$6
002F                            L$5:
002F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0035  8B 98 90 00 00 00                 mov             ebx,dword ptr 0x90[eax]
003B  85 DB                             test            ebx,ebx
003D  74 DE                             je              L$2
003F  6A 07                             push            0x00000007
0041  EB E2                             jmp             L$4
0043                            L$6:
0043  83 FB 02                          cmp             ebx,0x00000002
0046  74 D5                             je              L$2
0048  83 FB 03                          cmp             ebx,0x00000003
004B  74 D0                             je              L$2
004D  B8 01 00 00 00                    mov             eax,0x00000001
0052  5B                                pop             ebx
0053  C2 04 00                          ret             0x0004
0056                            CtrlHandlerIsNeeded:
0056  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
005C  83 78 78 02                       cmp             dword ptr 0x78[eax],0x00000002
0060  74 0C                             je              L$7
0062  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0068  83 78 78 03                       cmp             dword ptr 0x78[eax],0x00000003
006C  75 1E                             jne             L$8
006E                            L$7:
006E  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0074  83 B8 90 00 00 00 02              cmp             dword ptr 0x90[eax],0x00000002
007B  74 15                             je              L$9
007D  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0083  83 B8 90 00 00 00 03              cmp             dword ptr 0x90[eax],0x00000003
008A  74 06                             je              L$9
008C                            L$8:
008C  B8 01 00 00 00                    mov             eax,0x00000001
0091  C3                                ret
0092                            L$9:
0092  31 C0                             xor             eax,eax
0094  C3                                ret
0095                            StartCtrlHandler:
0095  80 3D 00 00 00 00 00              cmp             byte ptr CtrlHandlerRunning,0x00
009C  75 17                             jne             L$10
009E  6A 01                             push            0x00000001
00A0  68 00 00 00 00                    push            offset _CtrlSignalHandler
00A5  E8 00 00 00 00                    call            _SetConsoleCtrlHandler
00AA  85 C0                             test            eax,eax
00AC  74 07                             je              L$10
00AE  C6 05 00 00 00 00 01              mov             byte ptr CtrlHandlerRunning,0x01
00B5                            L$10:
00B5  31 C0                             xor             eax,eax
00B7  A0 00 00 00 00                    mov             al,byte ptr CtrlHandlerRunning
00BC  C3                                ret
00BD                            KillCtrlHandler:
00BD  80 3D 00 00 00 00 00              cmp             byte ptr CtrlHandlerRunning,0x00
00C4  74 18                             je              L$11
00C6  6A 00                             push            0x00000000
00C8  68 00 00 00 00                    push            offset _CtrlSignalHandler
00CD  E8 00 00 00 00                    call            _SetConsoleCtrlHandler
00D2  85 C0                             test            eax,eax
00D4  74 08                             je              L$11
00D6  30 D2                             xor             dl,dl
00D8  88 15 00 00 00 00                 mov             byte ptr CtrlHandlerRunning,dl
00DE                            L$11:
00DE  31 C0                             xor             eax,eax
00E0  A0 00 00 00 00                    mov             al,byte ptr CtrlHandlerRunning
00E5  85 C0                             test            eax,eax
00E7  0F 94 C0                          sete            al
00EA  25 FF 00 00 00                    and             eax,0x000000ff
00EF  C3                                ret

Routine Size: 240 bytes,    Routine Base: _TEXT + 0000

00F0                            __sigabort:
00F0  6A 01                             push            0x00000001
00F2  E8 00 00 00 00                    call            raise
00F7  83 C4 04                          add             esp,0x00000004
00FA  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 00F0

00FB                            __sigfpe_handler:
00FB  56                                push            esi
00FC  83 EC 04                          sub             esp,0x00000004
00FF  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0105  8B 40 68                          mov             eax,dword ptr 0x68[eax]
0108  89 04 24                          mov             dword ptr [esp],eax
010B  83 F8 01                          cmp             eax,0x00000001
010E  74 2C                             je              L$12
0110  83 F8 02                          cmp             eax,0x00000002
0113  74 27                             je              L$12
0115  83 F8 03                          cmp             eax,0x00000003
0118  74 22                             je              L$12
011A  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
011E  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0124  56                                push            esi
0125  6A 02                             push            0x00000002
0127  C7 40 68 02 00 00 00              mov             dword ptr 0x68[eax],0x00000002
012E  FF 54 24 08                       call            dword ptr 0x8[esp]
0132  83 C4 08                          add             esp,0x00000008
0135  31 C0                             xor             eax,eax
0137  83 C4 04                          add             esp,0x00000004
013A  5E                                pop             esi
013B  C3                                ret
013C                            L$12:
013C  B8 FF FF FF FF                    mov             eax,0xffffffff
0141  83 C4 04                          add             esp,0x00000004
0144  5E                                pop             esi
0145  C3                                ret

Routine Size: 75 bytes,    Routine Base: _TEXT + 00FB

0146                            signal:
0146  53                                push            ebx
0147  56                                push            esi
0148  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
014C  83 FB 01                          cmp             ebx,0x00000001
014F  7C 05                             jl              L$13
0151  83 FB 0C                          cmp             ebx,0x0000000c
0154  7E 12                             jle             L$14
0156                            L$13:
0156  6A 09                             push            0x00000009
0158  E8 00 00 00 00                    call            __set_errno
015D  B8 03 00 00 00                    mov             eax,0x00000003
0162  83 C4 04                          add             esp,0x00000004
0165  5E                                pop             esi
0166  5B                                pop             ebx
0167  C3                                ret
0168                            L$14:
0168  BA 00 00 00 00                    mov             edx,offset __sigabort
016D  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0171  89 15 00 00 00 00                 mov             dword ptr __abort,edx
0177  83 F9 02                          cmp             ecx,0x00000002
017A  74 28                             je              L$15
017C  83 F9 03                          cmp             ecx,0x00000003
017F  74 23                             je              L$15
0181  89 DE                             mov             esi,ebx
0183  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0189  83 7C F0 5C 00                    cmp             dword ptr 0x5c[eax+esi*8],0x00000000
018E  74 14                             je              L$15
0190  83 FB 02                          cmp             ebx,0x00000002
0193  75 0F                             jne             L$15
0195  68 9F 00 00 00                    push            0x0000009f
019A  6A 00                             push            0x00000000
019C  E8 00 00 00 00                    call            _control87
01A1  83 C4 08                          add             esp,0x00000008
01A4                            L$15:
01A4  C1 E3 03                          shl             ebx,0x03
01A7  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
01AD  8B 74 03 58                       mov             esi,dword ptr 0x58[ebx+eax]
01B1  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
01B7  01 D8                             add             eax,ebx
01B9  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
01BD  89 58 58                          mov             dword ptr 0x58[eax],ebx
01C0  E8 00 00 00 00                    call            CtrlHandlerIsNeeded
01C5  85 C0                             test            eax,eax
01C7  74 0A                             je              L$16
01C9  E8 00 00 00 00                    call            StartCtrlHandler
01CE  89 F0                             mov             eax,esi
01D0  5E                                pop             esi
01D1  5B                                pop             ebx
01D2  C3                                ret
01D3                            L$16:
01D3  E8 00 00 00 00                    call            KillCtrlHandler
01D8  89 F0                             mov             eax,esi
01DA  5E                                pop             esi
01DB  5B                                pop             ebx
01DC  C3                                ret

Routine Size: 151 bytes,    Routine Base: _TEXT + 0146

01DD                            raise:
01DD  53                                push            ebx
01DE  83 EC 04                          sub             esp,0x00000004
01E1  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
01E5  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
01EB  89 DA                             mov             edx,ebx
01ED  8B 44 D0 58                       mov             eax,dword ptr 0x58[eax+edx*8]
01F1  89 04 24                          mov             dword ptr [esp],eax
01F4  83 FB 02                          cmp             ebx,0x00000002
01F7  72 09                             jb              L$17
01F9  76 0E                             jbe             L$18
01FB  83 FB 0C                          cmp             ebx,0x0000000c
01FE  76 22                             jbe             L$20
0200  EB 5A                             jmp             L$22
0202                            L$17:
0202  83 FB 01                          cmp             ebx,0x00000001
0205  74 11                             je              L$19
0207  EB 53                             jmp             L$22
0209                            L$18:
0209  68 8C 00 00 00                    push            0x0000008c
020E  E8 00 00 00 00                    call            __sigfpe_handler
0213  83 C4 04                          add             esp,0x00000004
0216  EB 4E                             jmp             L$23
0218                            L$19:
0218  83 F8 02                          cmp             eax,0x00000002
021B  75 05                             jne             L$20
021D  E8 00 00 00 00                    call            __terminate
0222                            L$20:
0222  8B 0C 24                          mov             ecx,dword ptr [esp]
0225  83 F9 01                          cmp             ecx,0x00000001
0228  74 22                             je              L$21
022A  83 F9 02                          cmp             ecx,0x00000002
022D  74 1D                             je              L$21
022F  83 F9 03                          cmp             ecx,0x00000003
0232  74 18                             je              L$21
0234  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
023A  89 DA                             mov             edx,ebx
023C  53                                push            ebx
023D  C7 44 D0 58 02 00 00 00           mov             dword ptr 0x58[eax+edx*8],0x00000002
0245  FF 54 24 04                       call            dword ptr 0x4[esp]
0249  83 C4 04                          add             esp,0x00000004
024C                            L$21:
024C  E8 00 00 00 00                    call            CtrlHandlerIsNeeded
0251  85 C0                             test            eax,eax
0253  75 11                             jne             L$23
0255  E8 00 00 00 00                    call            KillCtrlHandler
025A  EB 0A                             jmp             L$23
025C                            L$22:
025C  B8 FF FF FF FF                    mov             eax,0xffffffff
0261  83 C4 04                          add             esp,0x00000004
0264  5B                                pop             ebx
0265  C3                                ret
0266                            L$23:
0266  31 C0                             xor             eax,eax
0268  83 C4 04                          add             esp,0x00000004
026B  5B                                pop             ebx
026C  C3                                ret

Routine Size: 144 bytes,    Routine Base: _TEXT + 01DD

026D                            __SigInit:
026D  53                                push            ebx
026E  56                                push            esi
026F  57                                push            edi
0270  06                                push            es
0271  BB 08 00 00 00                    mov             ebx,0x00000008
0276                            L$24:
0276  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
027C  8D 34 18                          lea             esi,[eax+ebx]
027F  8C D8                             mov             eax,ds
0281  8E C0                             mov             es,eax
0283  8D 7E 58                          lea             edi,0x58[esi]
0286  8D B3 00 00 00 00                 lea             esi,SignalTable[ebx]
028C  83 C3 08                          add             ebx,0x00000008
028F  A5                                movsd
0290  A5                                movsd
0291  83 FB 68                          cmp             ebx,0x00000068
0294  75 E0                             jne             L$24
0296  07                                pop             es
0297  5F                                pop             edi
0298  5E                                pop             esi
0299  5B                                pop             ebx

Routine Size: 45 bytes,    Routine Base: _TEXT + 026D

029A                            __SigFini:
029A  C3                                ret
029B  90                                nop
029C                            L$25:
029C  0C 03 00 00                                     DD        offset L$26
02A0  D0 03 00 00                                     DD        offset L$34
02A4  16 03 00 00                                     DD        offset L$27
02A8  20 03 00 00                                     DD        offset L$28
02AC  D7 03 00 00                                     DD        offset L$35
02B0  DE 03 00 00                                     DD        offset L$36
02B4  F2 03 00 00                                     DD        offset L$38

Routine Size: 30 bytes,    Routine Base: _TEXT + 029A

02B8                            ___ExceptionFilter:
02B8  53                                push            ebx
02B9  56                                push            esi
02BA  57                                push            edi
02BB  06                                push            es
02BC  55                                push            ebp
02BD  81 EC 20 02 00 00                 sub             esp,0x00000220
02C3  8B B4 24 38 02 00 00              mov             esi,dword ptr 0x238[esp]
02CA  8B BC 24 40 02 00 00              mov             edi,dword ptr 0x240[esp]
02D1  83 BC 24 3C 02 00 00 00           cmp             dword ptr 0x23c[esp],0x00000000
02D9  0F 84 7D 03 00 00                 je              L$62
02DF  8A 66 04                          mov             ah,byte ptr 0x4[esi]
02E2  F6 C4 01                          test            ah,0x01
02E5  0F 85 71 03 00 00                 jne             L$62
02EB  F6 C4 06                          test            ah,0x06
02EE  0F 85 68 03 00 00                 jne             L$62
02F4  8B 06                             mov             eax,dword ptr [esi]
02F6  05 73 FF FF 3F                    add             eax,0x3fffff73
02FB  83 F8 06                          cmp             eax,0x00000006
02FE  0F 87 F5 00 00 00                 ja              L$39
0304  2E FF 24 85 9C 02 00 00           jmp             dword ptr cs:L$25[eax*4]
030C                            L$26:
030C  BB 82 00 00 00                    mov             ebx,0x00000082
0311  E9 E8 00 00 00                    jmp             L$40
0316                            L$27:
0316  BB 86 00 00 00                    mov             ebx,0x00000086
031B  E9 DE 00 00 00                    jmp             L$40
0320                            L$28:
0320  8B 47 28                          mov             eax,dword ptr 0x28[edi]
0323  31 D2                             xor             edx,edx
0325  66 8B 10                          mov             dx,word ptr [eax]
0328  BB 81 00 00 00                    mov             ebx,0x00000081
032D  81 FA D9 FA 00 00                 cmp             edx,0x0000fad9
0333  75 0A                             jne             L$29
0335  BB 88 00 00 00                    mov             ebx,0x00000088
033A  E9 BF 00 00 00                    jmp             L$40
033F                            L$29:
033F  81 FA D9 F1 00 00                 cmp             edx,0x0000f1d9
0345  75 0A                             jne             L$30
0347  BB 8E 00 00 00                    mov             ebx,0x0000008e
034C  E9 AD 00 00 00                    jmp             L$40
0351                            L$30:
0351  75 0A                             jne             L$31
0353  BB 8F 00 00 00                    mov             ebx,0x0000008f
0358  E9 A1 00 00 00                    jmp             L$40
035D                            L$31:
035D  31 D2                             xor             edx,edx
035F  8A 10                             mov             dl,byte ptr [eax]
0361  81 FA DB 00 00 00                 cmp             edx,0x000000db
0367  74 08                             je              L$32
0369  81 FA DF 00 00 00                 cmp             edx,0x000000df
036F  75 16                             jne             L$33
0371                            L$32:
0371  8A 50 01                          mov             dl,byte ptr 0x1[eax]
0374  80 E2 30                          and             dl,0x30
0377  81 E2 FF 00 00 00                 and             edx,0x000000ff
037D  83 FA 10                          cmp             edx,0x00000010
0380  75 05                             jne             L$33
0382  BB 8D 00 00 00                    mov             ebx,0x0000008d
0387                            L$33:
0387  8A 10                             mov             dl,byte ptr [eax]
0389  80 E2 01                          and             dl,0x01
038C  81 E2 FF 00 00 00                 and             edx,0x000000ff
0392  0F 85 66 00 00 00                 jne             L$40
0398  8A 40 01                          mov             al,byte ptr 0x1[eax]
039B  24 30                             and             al,0x30
039D  25 FF 00 00 00                    and             eax,0x000000ff
03A2  83 F8 30                          cmp             eax,0x00000030
03A5  75 57                             jne             L$40
03A7  8B 57 20                          mov             edx,dword ptr 0x20[edi]
03AA  81 E2 FF FF 00 00                 and             edx,0x0000ffff
03B0  C1 E2 02                          shl             edx,0x02
03B3  31 C9                             xor             ecx,ecx
03B5  66 C1 EA 0D                       shr             dx,0x0d
03B9  8B 47 24                          mov             eax,dword ptr 0x24[edi]
03BC  66 89 D1                          mov             cx,dx
03BF  25 FF FF 00 00                    and             eax,0x0000ffff
03C4  01 C9                             add             ecx,ecx
03C6  D3 E8                             shr             eax,cl
03C8  83 E0 01                          and             eax,0x00000001
03CB  83 F8 01                          cmp             eax,0x00000001
03CE  75 2E                             jne             L$40
03D0                            L$34:
03D0  BB 83 00 00 00                    mov             ebx,0x00000083
03D5  EB 27                             jmp             L$40
03D7                            L$35:
03D7  BB 84 00 00 00                    mov             ebx,0x00000084
03DC  EB 20                             jmp             L$40
03DE                            L$36:
03DE  F6 47 21 02                       test            byte ptr 0x21[edi],0x02
03E2  74 07                             je              L$37
03E4  BB 8A 00 00 00                    mov             ebx,0x0000008a
03E9  EB 13                             jmp             L$40
03EB                            L$37:
03EB  BB 8B 00 00 00                    mov             ebx,0x0000008b
03F0  EB 0C                             jmp             L$40
03F2                            L$38:
03F2  BB 85 00 00 00                    mov             ebx,0x00000085
03F7  EB 05                             jmp             L$40
03F9                            L$39:
03F9  BB FF FF FF FF                    mov             ebx,0xffffffff
03FE                            L$40:
03FE  83 FB FF                          cmp             ebx,0xffffffff
0401  74 41                             je              L$42
0403  B1 01                             mov             cl,0x01
0405  53                                push            ebx
0406  88 0D 00 00 00 00                 mov             byte ptr __ExceptionHandled,cl
040C  E8 00 00 00 00                    call            __sigfpe_handler
0411  83 C4 04                          add             esp,0x00000004
0414  85 C0                             test            eax,eax
0416  75 22                             jne             L$41
0418  80 3D 00 00 00 00 00              cmp             byte ptr __ExceptionHandled,0x00
041F  74 19                             je              L$41
0421  E8 00 00 00 00                    call            _fpreset
0426  66 8B 57 20                       mov             dx,word ptr 0x20[edi]
042A  30 D2                             xor             dl,dl
042C  80 E6 7F                          and             dh,0x7f
042F  31 C0                             xor             eax,eax
0431  66 89 57 20                       mov             word ptr 0x20[edi],dx
0435  E9 27 02 00 00                    jmp             L$63
043A                            L$41:
043A  E8 00 00 00 00                    call            _fpreset
043F  E9 18 02 00 00                    jmp             L$62
0444                            L$42:
0444  BF 01 00 00 00                    mov             edi,0x00000001
0449  BB 08 00 00 00                    mov             ebx,0x00000008
044E                            L$43:
044E  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0454  8B 16                             mov             edx,dword ptr [esi]
0456  3B 54 03 5C                       cmp             edx,dword ptr 0x5c[ebx+eax]
045A  75 4C                             jne             L$44
045C  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0462  83 7C 03 58 01                    cmp             dword ptr 0x58[ebx+eax],0x00000001
0467  74 48                             je              L$45
0469  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
046F  83 7C 03 58 02                    cmp             dword ptr 0x58[ebx+eax],0x00000002
0474  74 3B                             je              L$45
0476  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
047C  83 7C 03 58 03                    cmp             dword ptr 0x58[ebx+eax],0x00000003
0481  74 2E                             je              L$45
0483  B0 01                             mov             al,0x01
0485  57                                push            edi
0486  A2 00 00 00 00                    mov             byte ptr __ExceptionHandled,al
048B  E8 00 00 00 00                    call            raise
0490  8A 25 00 00 00 00                 mov             ah,byte ptr __ExceptionHandled
0496  83 C4 04                          add             esp,0x00000004
0499  84 E4                             test            ah,ah
049B  0F 84 BB 01 00 00                 je              L$62
04A1  31 C0                             xor             eax,eax
04A3  E9 B9 01 00 00                    jmp             L$63
04A8                            L$44:
04A8  83 C3 08                          add             ebx,0x00000008
04AB  47                                inc             edi
04AC  83 FB 60                          cmp             ebx,0x00000060
04AF  7E 9D                             jle             L$43
04B1                            L$45:
04B1  8B 06                             mov             eax,dword ptr [esi]
04B3  3D 94 00 00 C0                    cmp             eax,0xc0000094
04B8  72 23                             jb              L$46
04BA  0F 86 7B 00 00 00                 jbe             L$52
04C0  3D 96 00 00 C0                    cmp             eax,0xc0000096
04C5  0F 82 86 00 00 00                 jb              L$54
04CB  76 58                             jbe             L$50
04CD  3D FD 00 00 C0                    cmp             eax,0xc00000fd
04D2  0F 84 6E 00 00 00                 je              L$53
04D8  E9 74 00 00 00                    jmp             L$54
04DD                            L$46:
04DD  3D 05 00 00 C0                    cmp             eax,0xc0000005
04E2  0F 82 69 00 00 00                 jb              L$54
04E8  76 09                             jbe             L$47
04EA  3D 1D 00 00 C0                    cmp             eax,0xc000001d
04EF  74 3F                             je              L$51
04F1  EB 5E                             jmp             L$54
04F3                            L$47:
04F3  83 7E 14 00                       cmp             dword ptr 0x14[esi],0x00000000
04F7  75 07                             jne             L$48
04F9  B8 00 00 00 00                    mov             eax,offset DGROUP:L$66
04FE  EB 05                             jmp             L$49
0500                            L$48:
0500  B8 0A 00 00 00                    mov             eax,offset DGROUP:L$67
0505                            L$49:
0505  50                                push            eax
0506  8B 4E 18                          mov             ecx,dword ptr 0x18[esi]
0509  51                                push            ecx
050A  8B 7E 0C                          mov             edi,dword ptr 0xc[esi]
050D  57                                push            edi
050E  68 12 00 00 00                    push            offset DGROUP:L$68
0513  8D 84 24 28 01 00 00              lea             eax,0x128[esp]
051A  50                                push            eax
051B  E8 00 00 00 00                    call            _wsprintfA
0520  83 C4 14                          add             esp,0x00000014
0523  EB 45                             jmp             L$56
0525                            L$50:
0525  8B 6E 0C                          mov             ebp,dword ptr 0xc[esi]
0528  55                                push            ebp
0529  68 61 00 00 00                    push            offset DGROUP:L$69
052E  EB 2A                             jmp             L$55
0530                            L$51:
0530  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
0533  52                                push            edx
0534  68 99 00 00 00                    push            offset DGROUP:L$70
0539  EB 1F                             jmp             L$55
053B                            L$52:
053B  8B 46 0C                          mov             eax,dword ptr 0xc[esi]
053E  50                                push            eax
053F  68 CE 00 00 00                    push            offset DGROUP:L$71
0544  EB 14                             jmp             L$55
0546                            L$53:
0546  8B 7E 0C                          mov             edi,dword ptr 0xc[esi]
0549  57                                push            edi
054A  68 09 01 00 00                    push            offset DGROUP:L$72
054F  EB 09                             jmp             L$55
0551                            L$54:
0551  8B 6E 0C                          mov             ebp,dword ptr 0xc[esi]
0554  55                                push            ebp
0555  68 3B 01 00 00                    push            offset DGROUP:L$73
055A                            L$55:
055A  8D 84 24 20 01 00 00              lea             eax,0x120[esp]
0561  50                                push            eax
0562  E8 00 00 00 00                    call            _wsprintfA
0567  83 C4 0C                          add             esp,0x0000000c
056A                            L$56:
056A  E8 00 00 00 00                    call            _GetActiveWindow
056F  31 DB                             xor             ebx,ebx
0571  85 C0                             test            eax,eax
0573  75 0E                             jne             L$57
0575  E8 00 00 00 00                    call            __NTConsoleOutput
057A  83 F8 FF                          cmp             eax,0xffffffff
057D  0F 85 9E 00 00 00                 jne             L$61
0583                            L$57:
0583  68 82 01 00 00                    push            offset DGROUP:L$74
0588  E8 00 00 00 00                    call            _LoadLibraryA
058D  89 C3                             mov             ebx,eax
058F  85 C0                             test            eax,eax
0591  0F 84 8A 00 00 00                 je              L$61
0597  68 8D 01 00 00                    push            offset DGROUP:L$75
059C  50                                push            eax
059D  E8 00 00 00 00                    call            _GetProcAddress
05A2  89 84 24 18 02 00 00              mov             dword ptr 0x218[esp],eax
05A9  85 C0                             test            eax,eax
05AB  74 72                             je              L$60
05AD  89 E7                             mov             edi,esp
05AF  8C D8                             mov             eax,ds
05B1  68 04 01 00 00                    push            0x00000104
05B6  8E C0                             mov             es,eax
05B8  8D 44 24 17                       lea             eax,0x17[esp]
05BC  BE 9B 01 00 00                    mov             esi,offset DGROUP:L$76
05C1  50                                push            eax
05C2  A5                                movsd
05C3  A5                                movsd
05C4  A5                                movsd
05C5  A5                                movsd
05C6  A5                                movsd
05C7  6A 00                             push            0x00000000
05C9  BE AF 01 00 00                    mov             esi,offset DGROUP:L$77
05CE  8D BC 24 24 01 00 00              lea             edi,0x124[esp]
05D5  E8 00 00 00 00                    call            _GetModuleFileNameA
05DA  06                                push            es
05DB  1E                                push            ds
05DC  07                                pop             es
05DD  57                                push            edi
05DE  2B C9                             sub             ecx,ecx
05E0  49                                dec             ecx
05E1  B0 00                             mov             al,0x00
05E3  F2 AE                             repne scasb
05E5  4F                                dec             edi
05E6                            L$58:
05E6  8A 06                             mov             al,byte ptr [esi]
05E8  88 07                             mov             byte ptr [edi],al
05EA  3C 00                             cmp             al,0x00
05EC  74 10                             je              L$59
05EE  8A 46 01                          mov             al,byte ptr 0x1[esi]
05F1  83 C6 02                          add             esi,0x00000002
05F4  88 47 01                          mov             byte ptr 0x1[edi],al
05F7  83 C7 02                          add             edi,0x00000002
05FA  3C 00                             cmp             al,0x00
05FC  75 E8                             jne             L$58
05FE                            L$59:
05FE  5F                                pop             edi
05FF  07                                pop             es
0600  6A 00                             push            0x00000000
0602  68 10 20 00 00                    push            0x00002010
0607  8D 44 24 08                       lea             eax,0x8[esp]
060B  50                                push            eax
060C  8D 84 24 24 01 00 00              lea             eax,0x124[esp]
0613  50                                push            eax
0614  6A 00                             push            0x00000000
0616  FF 94 24 2C 02 00 00              call            dword ptr 0x22c[esp]
061D  EB 02                             jmp             L$61
061F                            L$60:
061F  31 DB                             xor             ebx,ebx
0621                            L$61:
0621  85 DB                             test            ebx,ebx
0623  75 37                             jne             L$62
0625  53                                push            ebx
0626  8D 84 24 20 02 00 00              lea             eax,0x220[esp]
062D  50                                push            eax
062E  8D BC 24 20 01 00 00              lea             edi,0x120[esp]
0635  06                                push            es
0636  8C D8                             mov             eax,ds
0638  8E C0                             mov             es,eax
063A  29 C9                             sub             ecx,ecx
063C  49                                dec             ecx
063D  31 C0                             xor             eax,eax
063F  F2 AE                             repne scasb
0641  F7 D1                             not             ecx
0643  49                                dec             ecx
0644  07                                pop             es
0645  51                                push            ecx
0646  8D 84 24 24 01 00 00              lea             eax,0x124[esp]
064D  50                                push            eax
064E  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
0653  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0656  52                                push            edx
0657  E8 00 00 00 00                    call            _WriteFile
065C                            L$62:
065C  B8 01 00 00 00                    mov             eax,0x00000001
0661                            L$63:
0661  81 C4 20 02 00 00                 add             esp,0x00000220
0667  5D                                pop             ebp
0668  07                                pop             es
0669  5F                                pop             edi
066A  5E                                pop             esi
066B  5B                                pop             ebx
066C  C2 10 00                          ret             0x0010

Routine Size: 951 bytes,    Routine Base: _TEXT + 02B8

066F                            __NewExceptionHandler:
066F  53                                push            ebx
0670  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0674  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
067A  89 58 54                          mov             dword ptr 0x54[eax],ebx
067D  31 C0                             xor             eax,eax
067F  64 8B 00                          mov             eax,dword ptr fs:[eax]
0682  89 C3                             mov             ebx,eax
0684  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
068A  8B 40 54                          mov             eax,dword ptr 0x54[eax]
068D  89 18                             mov             dword ptr [eax],ebx
068F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0695  8B 40 54                          mov             eax,dword ptr 0x54[eax]
0698  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],offset ___ExceptionFilter
069F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
06A5  8B 40 54                          mov             eax,dword ptr 0x54[eax]
06A8  31 D2                             xor             edx,edx
06AA  64 89 02                          mov             dword ptr fs:[edx],eax
06AD  5B                                pop             ebx
06AE  C3                                ret

Routine Size: 64 bytes,    Routine Base: _TEXT + 066F

06AF                            __DoneExceptionHandler:
06AF  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
06B5  8B 40 54                          mov             eax,dword ptr 0x54[eax]
06B8  85 C0                             test            eax,eax
06BA  74 07                             je              L$64
06BC  8B 00                             mov             eax,dword ptr [eax]
06BE  31 D2                             xor             edx,edx
06C0  64 89 02                          mov             dword ptr fs:[edx],eax
06C3                            L$64:
06C3  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
06C9  C7 40 54 00 00 00 00              mov             dword ptr 0x54[eax],0x00000000
06D0  E8 00 00 00 00                    call            CtrlHandlerIsNeeded
06D5  85 C0                             test            eax,eax
06D7  74 22                             je              L$65
06D9  E8 00 00 00 00                    call            KillCtrlHandler
06DE  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
06E4  C7 40 78 02 00 00 00              mov             dword ptr 0x78[eax],0x00000002
06EB  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
06F1  C7 80 90 00 00 00 02 00 00 00
                                        mov             dword ptr 0x90[eax],0x00000002
06FB                            L$65:
06FB  C3                                ret

Routine Size: 77 bytes,    Routine Base: _TEXT + 06AF

No disassembly errors

Segment: CONST DWORD USE32 000001DA bytes
0000                            L$66:
0000  72 65 61 64 20 66 72 6F 6D 00                   read from.
000A                            L$67:
000A  77 72 69 74 74 65 6E 00                         written.
0012                            L$68:
0012  54 68 65 20 69 6E 73 74 72 75 63 74 69 6F 6E 20 The instruction
0022  61 74 20 25 30 38 6C 78 20 72 65 66 65 72 65 6E at %08lx referen
0032  63 65 64 20 6D 65 6D 6F 72 79 20 61 74 20 25 30 ced memory at %0
0042  38 6C 78 0A 54 68 65 20 6D 65 6D 6F 72 79 20 63 8lx.The memory c
0052  6F 75 6C 64 20 6E 6F 74 20 62 65 20 25 73 00    ould not be %s.
0061                            L$69:
0061  41 6E 20 70 72 69 76 69 6C 65 67 65 64 20 69 6E An privileged in
0071  73 74 72 75 63 74 69 6F 6E 20 77 61 73 20 65 78 struction was ex
0081  65 63 75 74 65 64 20 61 74 20 61 64 64 72 65 73 ecuted at addres
0091  73 20 25 30 38 6C 78 00                         s %08lx.
0099                            L$70:
0099  41 6E 20 69 6C 6C 65 67 61 6C 20 69 6E 73 74 72 An illegal instr
00A9  75 63 74 69 6F 6E 20 77 61 73 20 65 78 65 63 75 uction was execu
00B9  74 65 64 20 61 74 20 61 64 64 72 65 73 73 20 25 ted at address %
00C9  30 38 6C 78 00                                  08lx.
00CE                            L$71:
00CE  41 6E 20 69 6E 74 65 67 65 72 20 64 69 76 69 64 An integer divid
00DE  65 20 62 79 20 7A 65 72 6F 20 77 61 73 20 65 6E e by zero was en
00EE  63 6F 75 6E 74 65 72 65 64 20 61 74 20 61 64 64 countered at add
00FE  72 65 73 73 20 25 30 38 6C 78 00                ress %08lx.
0109                            L$72:
0109  41 20 73 74 61 63 6B 20 6F 76 65 72 66 6C 6F 77 A stack overflow
0119  20 77 61 73 20 65 6E 63 6F 75 6E 74 65 72 65 64  was encountered
0129  20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 6C  at address %08l
0139  78 00                                           x.
013B                            L$73:
013B  54 68 65 20 70 72 6F 67 72 61 6D 20 65 6E 63 6F The program enco
014B  75 6E 74 65 72 65 64 20 61 20 70 72 6F 62 6C 65 untered a proble
015B  6D 20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 m at address %08
016B  6C 78 20 61 6E 64 20 63 61 6E 6E 6F 74 20 63 6F lx and cannot co
017B  6E 74 69 6E 75 65 00                            ntinue.
0182                            L$74:
0182  75 73 65 72 33 32 2E 64 6C 6C 00                user32.dll.
018D                            L$75:
018D  4D 65 73 73 61 67 65 42 6F 78 45 78 41 00       MessageBoxExA.
019B                            L$76:
019B  41 70 70 6C 69 63 61 74 69 6F 6E 20 45 72 72 6F Application Erro
01AB  72 3A 20 00                                     r: .
01AF                            L$77:
01AF  0A 0A 43 6C 69 63 6B 20 6F 6E 20 4F 4B 20 74 6F ..Click on OK to
01BF  20 74 65 72 6D 69 6E 61 74 65 20 74 68 65 20 61  terminate the a
01CF  70 70 6C 69 63 61 74 69 6F 6E 00                pplication.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000069 bytes
0000                            SignalTable:
0000  01 00 00 00 FF FF FF FF 02 00 00 00 FF FF FF FF ................
0010  01 00 00 00 FF FF FF FF 02 00 00 00 1D 00 00 C0 ................
0020  02 00 00 00 3A 01 00 C0 02 00 00 00 05 00 00 C0 ....:...........
0030  02 00 00 00 3A 01 00 C0 02 00 00 00 3A 01 00 C0 ....:.......:...
0040  01 00 00 00 FF FF FF FF 01 00 00 00 FF FF FF FF ................
0050  01 00 00 00 FF FF FF FF 02 00 00 00 94 00 00 C0 ................
0060  02 00 00 00 95 00 00 C0                         ........
0068                            CtrlHandlerRunning:
0068  00                                              .

Segment: _BSS DWORD USE32 00000001 bytes
0000                            __ExceptionHandled:

BSS Size: 1 bytes

