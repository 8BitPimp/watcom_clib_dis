Module: signlwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000531 bytes
0000                            __sigabort_:
0000  B8 01 00 00 00                    mov             eax,0x00000001

Routine Size: 5 bytes,    Routine Base: _TEXT + 0000

0005                            raise_:
0005  53                                push            ebx
0006  51                                push            ecx
0007  52                                push            edx
0008  83 EC 04                          sub             esp,0x00000004
000B  89 C2                             mov             edx,eax
000D  89 D3                             mov             ebx,edx
000F  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0015  8B 44 D8 58                       mov             eax,dword ptr 0x58[eax+ebx*8]
0019  89 04 24                          mov             dword ptr [esp],eax
001C  83 FA 02                          cmp             edx,0x00000002
001F  0F 82 CF 00 00 00                 jb              L$6
0025  0F 86 D3 00 00 00                 jbe             L$7
002B  83 FA 0C                          cmp             edx,0x0000000c
002E  0F 86 E0 00 00 00                 jbe             L$9
0034                            L$1:
0034  B8 FF FF FF FF                    mov             eax,0xffffffff
0039  E9 FF 00 00 00                    jmp             L$11

Routine Size: 57 bytes,    Routine Base: _TEXT + 0005

003E                            __sigfpe_handler_:
003E  52                                push            edx
003F  83 EC 04                          sub             esp,0x00000004
0042  89 C2                             mov             edx,eax
0044  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
004A  8B 40 68                          mov             eax,dword ptr 0x68[eax]
004D  89 04 24                          mov             dword ptr [esp],eax
0050  83 F8 01                          cmp             eax,0x00000001
0053  74 26                             je              L$2
0055  83 F8 02                          cmp             eax,0x00000002
0058  74 21                             je              L$2
005A  83 F8 03                          cmp             eax,0x00000003
005D  74 1C                             je              L$2
005F  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0065  C7 40 68 02 00 00 00              mov             dword ptr 0x68[eax],0x00000002
006C  B8 02 00 00 00                    mov             eax,0x00000002
0071  FF 14 24                          call            dword ptr [esp]
0074  31 C0                             xor             eax,eax
0076  83 C4 04                          add             esp,0x00000004
0079  5A                                pop             edx
007A  C3                                ret
007B                            L$2:
007B  B8 FF FF FF FF                    mov             eax,0xffffffff
0080  83 C4 04                          add             esp,0x00000004
0083  5A                                pop             edx
0084  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 003E

0085                            signal_:
0085  53                                push            ebx
0086  51                                push            ecx
0087  89 C3                             mov             ebx,eax
0089  89 D1                             mov             ecx,edx
008B  83 F8 01                          cmp             eax,0x00000001
008E  7C 05                             jl              L$3
0090  83 F8 0C                          cmp             eax,0x0000000c
0093  7E 12                             jle             L$4
0095                            L$3:
0095  B8 09 00 00 00                    mov             eax,0x00000009
009A  E8 00 00 00 00                    call            __set_errno_
009F  B8 03 00 00 00                    mov             eax,0x00000003
00A4  59                                pop             ecx
00A5  5B                                pop             ebx
00A6  C3                                ret
00A7                            L$4:
00A7  C7 05 00 00 00 00 00 00 00 00
                                        mov             dword ptr ___abort,offset __sigabort_
00B1  83 F9 02                          cmp             ecx,0x00000002
00B4  74 25                             je              L$5
00B6  83 F9 03                          cmp             ecx,0x00000003
00B9  74 20                             je              L$5
00BB  89 DA                             mov             edx,ebx
00BD  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
00C3  83 7C D0 5C 00                    cmp             dword ptr 0x5c[eax+edx*8],0x00000000
00C8  74 11                             je              L$5
00CA  83 FB 02                          cmp             ebx,0x00000002
00CD  75 0C                             jne             L$5
00CF  BA 9F 00 00 00                    mov             edx,0x0000009f
00D4  31 C0                             xor             eax,eax
00D6  E8 00 00 00 00                    call            _control87_
00DB                            L$5:
00DB  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
00E1  8B 54 D8 58                       mov             edx,dword ptr 0x58[eax+ebx*8]
00E5  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
00EB  89 4C D8 58                       mov             dword ptr 0x58[eax+ebx*8],ecx
00EF  89 D0                             mov             eax,edx
00F1  59                                pop             ecx
00F2  5B                                pop             ebx
00F3  C3                                ret
00F4                            L$6:
00F4  83 FA 01                          cmp             edx,0x00000001
00F7  74 11                             je              L$8
00F9  E9 36 FF FF FF                    jmp             L$1
00FE                            L$7:
00FE  B8 8C 00 00 00                    mov             eax,0x0000008c
0103  E8 00 00 00 00                    call            __sigfpe_handler_
0108  EB 31                             jmp             L$10
010A                            L$8:
010A  83 F8 02                          cmp             eax,0x00000002
010D  75 05                             jne             L$9
010F  E8 00 00 00 00                    call            __terminate_
0114                            L$9:
0114  8B 0C 24                          mov             ecx,dword ptr [esp]
0117  83 F9 01                          cmp             ecx,0x00000001
011A  74 1F                             je              L$10
011C  83 F9 02                          cmp             ecx,0x00000002
011F  74 1A                             je              L$10
0121  83 F9 03                          cmp             ecx,0x00000003
0124  74 15                             je              L$10
0126  89 D3                             mov             ebx,edx
0128  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
012E  C7 44 D8 58 02 00 00 00           mov             dword ptr 0x58[eax+ebx*8],0x00000002
0136  89 D0                             mov             eax,edx
0138  FF 14 24                          call            dword ptr [esp]
013B                            L$10:
013B  31 C0                             xor             eax,eax
013D                            L$11:
013D  83 C4 04                          add             esp,0x00000004
0140  5A                                pop             edx
0141  59                                pop             ecx
0142  5B                                pop             ebx
0143  C3                                ret

Routine Size: 191 bytes,    Routine Base: _TEXT + 0085

0144                            __SigInit_:
0144  52                                push            edx
0145  56                                push            esi
0146  57                                push            edi
0147  06                                push            es
0148  BA 08 00 00 00                    mov             edx,0x00000008
014D                            L$12:
014D  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0153  8D 34 10                          lea             esi,[eax+edx]
0156  8C D8                             mov             eax,ds
0158  8E C0                             mov             es,eax
015A  8D 7E 58                          lea             edi,0x58[esi]
015D  8D B2 00 00 00 00                 lea             esi,_SignalTable[edx]
0163  83 C2 08                          add             edx,0x00000008
0166  A5                                movsd
0167  A5                                movsd
0168  83 FA 68                          cmp             edx,0x00000068
016B  75 E0                             jne             L$12
016D  07                                pop             es
016E  5F                                pop             edi
016F  5E                                pop             esi
0170  5A                                pop             edx

Routine Size: 45 bytes,    Routine Base: _TEXT + 0144

0171                            __SigFini_:
0171  C3                                ret
0172  8B C0                             mov             eax,eax
0174                            L$13:
0174  D6 01 00 00                                     DD        offset L$14
0178  78 02 00 00                                     DD        offset L$22
017C  E0 01 00 00                                     DD        offset L$15
0180  EA 01 00 00                                     DD        offset L$16
0184  7F 02 00 00                                     DD        offset L$23
0188  86 02 00 00                                     DD        offset L$24
018C  9A 02 00 00                                     DD        offset L$26

Routine Size: 31 bytes,    Routine Base: _TEXT + 0171

0190                            ___ExceptionFilter:
0190  53                                push            ebx
0191  56                                push            esi
0192  57                                push            edi
0193  06                                push            es
0194  55                                push            ebp
0195  81 EC 1C 02 00 00                 sub             esp,0x0000021c
019B  8B 9C 24 34 02 00 00              mov             ebx,dword ptr 0x234[esp]
01A2  8B B4 24 3C 02 00 00              mov             esi,dword ptr 0x23c[esp]
01A9  8A 63 04                          mov             ah,byte ptr 0x4[ebx]
01AC  F6 C4 01                          test            ah,0x01
01AF  0F 85 0B 03 00 00                 jne             L$48
01B5  F6 C4 06                          test            ah,0x06
01B8  0F 85 02 03 00 00                 jne             L$48
01BE  8B 03                             mov             eax,dword ptr [ebx]
01C0  05 73 FF FF 3F                    add             eax,0x3fffff73
01C5  83 F8 06                          cmp             eax,0x00000006
01C8  0F 87 D3 00 00 00                 ja              L$27
01CE  2E FF 24 85 74 01 00 00           jmp             dword ptr cs:L$13[eax*4]
01D6                            L$14:
01D6  BA 82 00 00 00                    mov             edx,0x00000082
01DB  E9 C6 00 00 00                    jmp             L$28
01E0                            L$15:
01E0  BA 86 00 00 00                    mov             edx,0x00000086
01E5  E9 BC 00 00 00                    jmp             L$28
01EA                            L$16:
01EA  8B 46 28                          mov             eax,dword ptr 0x28[esi]
01ED  66 8B 08                          mov             cx,word ptr [eax]
01F0  BA 81 00 00 00                    mov             edx,0x00000081
01F5  66 81 F9 D9 FA                    cmp             cx,0xfad9
01FA  75 0A                             jne             L$17
01FC  BA 88 00 00 00                    mov             edx,0x00000088
0201  E9 A0 00 00 00                    jmp             L$28
0206                            L$17:
0206  66 81 F9 D9 F1                    cmp             cx,0xf1d9
020B  75 0A                             jne             L$18
020D  BA 8E 00 00 00                    mov             edx,0x0000008e
0212  E9 8F 00 00 00                    jmp             L$28
0217                            L$18:
0217  75 0A                             jne             L$19
0219  BA 8F 00 00 00                    mov             edx,0x0000008f
021E  E9 83 00 00 00                    jmp             L$28
0223                            L$19:
0223  8A 08                             mov             cl,byte ptr [eax]
0225  80 F9 DB                          cmp             cl,0xdb
0228  74 05                             je              L$20
022A  80 F9 DF                          cmp             cl,0xdf
022D  75 10                             jne             L$21
022F                            L$20:
022F  8A 48 01                          mov             cl,byte ptr 0x1[eax]
0232  80 E1 30                          and             cl,0x30
0235  80 F9 10                          cmp             cl,0x10
0238  75 05                             jne             L$21
023A  BA 8D 00 00 00                    mov             edx,0x0000008d
023F                            L$21:
023F  F6 00 01                          test            byte ptr [eax],0x01
0242  75 62                             jne             L$28
0244  8A 40 01                          mov             al,byte ptr 0x1[eax]
0247  24 30                             and             al,0x30
0249  3C 30                             cmp             al,0x30
024B  75 59                             jne             L$28
024D  8B 46 20                          mov             eax,dword ptr 0x20[esi]
0250  25 FF FF 00 00                    and             eax,0x0000ffff
0255  8B 7E 24                          mov             edi,dword ptr 0x24[esi]
0258  C1 E0 02                          shl             eax,0x02
025B  31 C9                             xor             ecx,ecx
025D  66 C1 E8 0D                       shr             ax,0x0d
0261  81 E7 FF FF 00 00                 and             edi,0x0000ffff
0267  66 89 C1                          mov             cx,ax
026A  89 F8                             mov             eax,edi
026C  01 C9                             add             ecx,ecx
026E  D3 E8                             shr             eax,cl
0270  83 E0 01                          and             eax,0x00000001
0273  83 F8 01                          cmp             eax,0x00000001
0276  75 2E                             jne             L$28
0278                            L$22:
0278  BA 83 00 00 00                    mov             edx,0x00000083
027D  EB 27                             jmp             L$28
027F                            L$23:
027F  BA 84 00 00 00                    mov             edx,0x00000084
0284  EB 20                             jmp             L$28
0286                            L$24:
0286  F6 46 21 02                       test            byte ptr 0x21[esi],0x02
028A  74 07                             je              L$25
028C  BA 8A 00 00 00                    mov             edx,0x0000008a
0291  EB 13                             jmp             L$28
0293                            L$25:
0293  BA 8B 00 00 00                    mov             edx,0x0000008b
0298  EB 0C                             jmp             L$28
029A                            L$26:
029A  BA 85 00 00 00                    mov             edx,0x00000085
029F  EB 05                             jmp             L$28
02A1                            L$27:
02A1  BA FF FF FF FF                    mov             edx,0xffffffff
02A6                            L$28:
02A6  83 FA FF                          cmp             edx,0xffffffff
02A9  74 3E                             je              L$29
02AB  E8 00 00 00 00                    call            _fpreset_
02B0  B5 01                             mov             ch,0x01
02B2  89 D0                             mov             eax,edx
02B4  88 2D 00 00 00 00                 mov             byte ptr ___ExceptionHandled,ch
02BA  E8 00 00 00 00                    call            __sigfpe_handler_
02BF  85 C0                             test            eax,eax
02C1  0F 85 F9 01 00 00                 jne             L$48
02C7  80 3D 00 00 00 00 00              cmp             byte ptr ___ExceptionHandled,0x00
02CE  0F 84 EC 01 00 00                 je              L$48
02D4  66 8B 7E 20                       mov             di,word ptr 0x20[esi]
02D8  81 E7 00 7F 00 00                 and             edi,0x00007f00
02DE  31 C0                             xor             eax,eax
02E0  66 89 7E 20                       mov             word ptr 0x20[esi],di
02E4  E9 DC 01 00 00                    jmp             L$49
02E9                            L$29:
02E9  B9 01 00 00 00                    mov             ecx,0x00000001
02EE  BA 08 00 00 00                    mov             edx,0x00000008
02F3                            L$30:
02F3  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
02F9  8B 33                             mov             esi,dword ptr [ebx]
02FB  3B 74 02 5C                       cmp             esi,dword ptr 0x5c[edx+eax]
02FF  75 49                             jne             L$31
0301  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0307  83 7C 02 58 01                    cmp             dword ptr 0x58[edx+eax],0x00000001
030C  74 45                             je              L$32
030E  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0314  83 7C 02 58 02                    cmp             dword ptr 0x58[edx+eax],0x00000002
0319  74 38                             je              L$32
031B  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0321  83 7C 02 58 03                    cmp             dword ptr 0x58[edx+eax],0x00000003
0326  74 2B                             je              L$32
0328  C6 05 00 00 00 00 01              mov             byte ptr ___ExceptionHandled,0x01
032F  89 C8                             mov             eax,ecx
0331  E8 00 00 00 00                    call            raise_
0336  80 3D 00 00 00 00 00              cmp             byte ptr ___ExceptionHandled,0x00
033D  0F 84 7D 01 00 00                 je              L$48
0343  31 C0                             xor             eax,eax
0345  E9 7B 01 00 00                    jmp             L$49
034A                            L$31:
034A  83 C2 08                          add             edx,0x00000008
034D  41                                inc             ecx
034E  83 FA 60                          cmp             edx,0x00000060
0351  7E A0                             jle             L$30
0353                            L$32:
0353  8B 03                             mov             eax,dword ptr [ebx]
0355  3D 94 00 00 C0                    cmp             eax,0xc0000094
035A  72 23                             jb              L$33
035C  0F 86 7B 00 00 00                 jbe             L$39
0362  3D 96 00 00 C0                    cmp             eax,0xc0000096
0367  0F 82 86 00 00 00                 jb              L$41
036D  76 58                             jbe             L$37
036F  3D FD 00 00 C0                    cmp             eax,0xc00000fd
0374  0F 84 6E 00 00 00                 je              L$40
037A  E9 74 00 00 00                    jmp             L$41
037F                            L$33:
037F  3D 05 00 00 C0                    cmp             eax,0xc0000005
0384  0F 82 69 00 00 00                 jb              L$41
038A  76 09                             jbe             L$34
038C  3D 1D 00 00 C0                    cmp             eax,0xc000001d
0391  74 3F                             je              L$38
0393  EB 5E                             jmp             L$41
0395                            L$34:
0395  83 7B 14 00                       cmp             dword ptr 0x14[ebx],0x00000000
0399  75 07                             jne             L$35
039B  B8 00 00 00 00                    mov             eax,offset DGROUP:L$50
03A0  EB 05                             jmp             L$36
03A2                            L$35:
03A2  B8 0A 00 00 00                    mov             eax,offset DGROUP:L$51
03A7                            L$36:
03A7  50                                push            eax
03A8  8B 7B 18                          mov             edi,dword ptr 0x18[ebx]
03AB  57                                push            edi
03AC  8B 6B 0C                          mov             ebp,dword ptr 0xc[ebx]
03AF  55                                push            ebp
03B0  68 12 00 00 00                    push            offset DGROUP:L$52
03B5  8D 84 24 28 01 00 00              lea             eax,0x128[esp]
03BC  50                                push            eax
03BD  E8 00 00 00 00                    call            sprintf_
03C2  83 C4 14                          add             esp,0x00000014
03C5  EB 45                             jmp             L$43
03C7                            L$37:
03C7  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
03CA  50                                push            eax
03CB  68 61 00 00 00                    push            offset DGROUP:L$53
03D0  EB 2A                             jmp             L$42
03D2                            L$38:
03D2  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
03D5  51                                push            ecx
03D6  68 99 00 00 00                    push            offset DGROUP:L$54
03DB  EB 1F                             jmp             L$42
03DD                            L$39:
03DD  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
03E0  52                                push            edx
03E1  68 CE 00 00 00                    push            offset DGROUP:L$55
03E6  EB 14                             jmp             L$42
03E8                            L$40:
03E8  8B 6B 0C                          mov             ebp,dword ptr 0xc[ebx]
03EB  55                                push            ebp
03EC  68 09 01 00 00                    push            offset DGROUP:L$56
03F1  EB 09                             jmp             L$42
03F3                            L$41:
03F3  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
03F6  50                                push            eax
03F7  68 3B 01 00 00                    push            offset DGROUP:L$57
03FC                            L$42:
03FC  8D 84 24 20 01 00 00              lea             eax,0x120[esp]
0403  50                                push            eax
0404  E8 00 00 00 00                    call            sprintf_
0409  83 C4 0C                          add             esp,0x0000000c
040C                            L$43:
040C  68 82 01 00 00                    push            offset DGROUP:L$58
0411  E8 00 00 00 00                    call            _LoadLibraryA
0416  89 C2                             mov             edx,eax
0418  89 C3                             mov             ebx,eax
041A  85 C0                             test            eax,eax
041C  0F 84 8E 00 00 00                 je              L$47
0422  68 8D 01 00 00                    push            offset DGROUP:L$59
0427  50                                push            eax
0428  E8 00 00 00 00                    call            _GetProcAddress
042D  89 84 24 18 02 00 00              mov             dword ptr 0x218[esp],eax
0434  85 C0                             test            eax,eax
0436  74 76                             je              L$46
0438  89 E7                             mov             edi,esp
043A  8C D8                             mov             eax,ds
043C  68 04 01 00 00                    push            0x00000104
0441  8E C0                             mov             es,eax
0443  8D 44 24 17                       lea             eax,0x17[esp]
0447  BE 9B 01 00 00                    mov             esi,offset DGROUP:L$60
044C  50                                push            eax
044D  A5                                movsd
044E  A5                                movsd
044F  A5                                movsd
0450  A5                                movsd
0451  A5                                movsd
0452  6A 00                             push            0x00000000
0454  8D BC 24 24 01 00 00              lea             edi,0x124[esp]
045B  BE AF 01 00 00                    mov             esi,offset DGROUP:L$61
0460  E8 00 00 00 00                    call            _GetModuleFileNameA
0465  06                                push            es
0466  1E                                push            ds
0467  07                                pop             es
0468  57                                push            edi
0469  2B C9                             sub             ecx,ecx
046B  49                                dec             ecx
046C  B0 00                             mov             al,0x00
046E  F2 AE                             repne scasb
0470  4F                                dec             edi
0471                            L$44:
0471  8A 06                             mov             al,byte ptr [esi]
0473  88 07                             mov             byte ptr [edi],al
0475  3C 00                             cmp             al,0x00
0477  0F 84 10 00 00 00                 je              L$45
047D  8A 46 01                          mov             al,byte ptr 0x1[esi]
0480  83 C6 02                          add             esi,0x00000002
0483  88 47 01                          mov             byte ptr 0x1[edi],al
0486  83 C7 02                          add             edi,0x00000002
0489  3C 00                             cmp             al,0x00
048B  75 E4                             jne             L$44
048D                            L$45:
048D  5F                                pop             edi
048E  07                                pop             es
048F  6A 00                             push            0x00000000
0491  68 10 20 00 00                    push            0x00002010
0496  8D 44 24 08                       lea             eax,0x8[esp]
049A  50                                push            eax
049B  8D 84 24 24 01 00 00              lea             eax,0x124[esp]
04A2  50                                push            eax
04A3  6A 00                             push            0x00000000
04A5  FF 94 24 2C 02 00 00              call            dword ptr 0x22c[esp]
04AC  EB 02                             jmp             L$47
04AE                            L$46:
04AE  31 DB                             xor             ebx,ebx
04B0                            L$47:
04B0  85 DB                             test            ebx,ebx
04B2  75 0C                             jne             L$48
04B4  8D 84 24 18 01 00 00              lea             eax,0x118[esp]
04BB  E8 00 00 00 00                    call            puts_
04C0                            L$48:
04C0  B8 01 00 00 00                    mov             eax,0x00000001
04C5                            L$49:
04C5  81 C4 1C 02 00 00                 add             esp,0x0000021c
04CB  5D                                pop             ebp
04CC  07                                pop             es
04CD  5F                                pop             edi
04CE  5E                                pop             esi
04CF  5B                                pop             ebx
04D0  C2 10 00                          ret             0x0010

Routine Size: 835 bytes,    Routine Base: _TEXT + 0190

04D3                            __NewExceptionHandler_:
04D3  52                                push            edx
04D4  89 C2                             mov             edx,eax
04D6  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
04DC  89 50 54                          mov             dword ptr 0x54[eax],edx
04DF  31 C0                             xor             eax,eax
04E1  64 8B 00                          mov             eax,dword ptr fs:[eax]
04E4  89 C2                             mov             edx,eax
04E6  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
04EC  8B 40 54                          mov             eax,dword ptr 0x54[eax]
04EF  89 10                             mov             dword ptr [eax],edx
04F1  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
04F7  8B 40 54                          mov             eax,dword ptr 0x54[eax]
04FA  31 D2                             xor             edx,edx
04FC  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],offset ___ExceptionFilter
0503  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0509  8B 40 54                          mov             eax,dword ptr 0x54[eax]
050C  64 89 02                          mov             dword ptr fs:[edx],eax
050F  5A                                pop             edx
0510  C3                                ret

Routine Size: 62 bytes,    Routine Base: _TEXT + 04D3

0511                            __DoneExceptionHandler_:
0511  52                                push            edx
0512  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0518  8B 40 54                          mov             eax,dword ptr 0x54[eax]
051B  31 D2                             xor             edx,edx
051D  8B 00                             mov             eax,dword ptr [eax]
051F  64 89 02                          mov             dword ptr fs:[edx],eax
0522  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0528  C7 40 54 00 00 00 00              mov             dword ptr 0x54[eax],0x00000000
052F  5A                                pop             edx
0530  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 0511

No disassembly errors

Segment: CONST DWORD USE32 000001DA bytes
0000                            L$50:
0000  72 65 61 64 20 66 72 6F 6D 00                   read from.
000A                            L$51:
000A  77 72 69 74 74 65 6E 00                         written.
0012                            L$52:
0012  54 68 65 20 69 6E 73 74 72 75 63 74 69 6F 6E 20 The instruction
0022  61 74 20 25 30 38 6C 78 20 72 65 66 65 72 65 6E at %08lx referen
0032  63 65 64 20 6D 65 6D 6F 72 79 20 61 74 20 25 30 ced memory at %0
0042  38 6C 78 0A 54 68 65 20 6D 65 6D 6F 72 79 20 63 8lx.The memory c
0052  6F 75 6C 64 20 6E 6F 74 20 62 65 20 25 73 00    ould not be %s.
0061                            L$53:
0061  41 6E 20 70 72 69 76 69 6C 65 67 65 64 20 69 6E An privileged in
0071  73 74 72 75 63 74 69 6F 6E 20 77 61 73 20 65 78 struction was ex
0081  65 63 75 74 65 64 20 61 74 20 61 64 64 72 65 73 ecuted at addres
0091  73 20 25 30 38 6C 78 00                         s %08lx.
0099                            L$54:
0099  41 6E 20 69 6C 6C 65 67 61 6C 20 69 6E 73 74 72 An illegal instr
00A9  75 63 74 69 6F 6E 20 77 61 73 20 65 78 65 63 75 uction was execu
00B9  74 65 64 20 61 74 20 61 64 64 72 65 73 73 20 25 ted at address %
00C9  30 38 6C 78 00                                  08lx.
00CE                            L$55:
00CE  41 6E 20 69 6E 74 65 67 65 72 20 64 69 76 69 64 An integer divid
00DE  65 20 62 79 20 7A 65 72 6F 20 77 61 73 20 65 6E e by zero was en
00EE  63 6F 75 6E 74 65 72 65 64 20 61 74 20 61 64 64 countered at add
00FE  72 65 73 73 20 25 30 38 6C 78 00                ress %08lx.
0109                            L$56:
0109  41 20 73 74 61 63 6B 20 6F 76 65 72 66 6C 6F 77 A stack overflow
0119  20 77 61 73 20 65 6E 63 6F 75 6E 74 65 72 65 64  was encountered
0129  20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 6C  at address %08l
0139  78 00                                           x.
013B                            L$57:
013B  54 68 65 20 70 72 6F 67 72 61 6D 20 65 6E 63 6F The program enco
014B  75 6E 74 65 72 65 64 20 61 20 70 72 6F 62 6C 65 untered a proble
015B  6D 20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 m at address %08
016B  6C 78 20 61 6E 64 20 63 61 6E 6E 6F 74 20 63 6F lx and cannot co
017B  6E 74 69 6E 75 65 00                            ntinue.
0182                            L$58:
0182  75 73 65 72 33 32 2E 64 6C 6C 00                user32.dll.
018D                            L$59:
018D  4D 65 73 73 61 67 65 42 6F 78 45 78 41 00       MessageBoxExA.
019B                            L$60:
019B  41 70 70 6C 69 63 61 74 69 6F 6E 20 45 72 72 6F Application Erro
01AB  72 3A 20 00                                     r: .
01AF                            L$61:
01AF  0A 0A 43 6C 69 63 6B 20 6F 6E 20 4F 4B 20 74 6F ..Click on OK to
01BF  20 74 65 72 6D 69 6E 61 74 65 20 74 68 65 20 61  terminate the a
01CF  70 70 6C 69 63 61 74 69 6F 6E 00                pplication.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000068 bytes
0000                            _SignalTable:
0000  01 00 00 00 FF FF FF FF 02 00 00 00 FF FF FF FF ................
0010  01 00 00 00 FF FF FF FF 01 00 00 00 1D 00 00 C0 ................
0020  01 00 00 00 3A 01 00 C0 01 00 00 00 05 00 00 C0 ....:...........
0030  01 00 00 00 3A 01 00 C0 01 00 00 00 3A 01 00 C0 ....:.......:...
0040  01 00 00 00 FF FF FF FF 01 00 00 00 FF FF FF FF ................
0050  01 00 00 00 FF FF FF FF 01 00 00 00 94 00 00 C0 ................
0060  01 00 00 00 95 00 00 C0                         ........

Segment: _BSS DWORD USE32 00000001 bytes
0000                            ___ExceptionHandled:

BSS Size: 1 bytes

