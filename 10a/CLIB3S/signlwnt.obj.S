Module: signlwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000548 bytes
0000                            __sigabort:
0000  6A 01                             push            0x00000001
0002  E8 00 00 00 00                    call            raise
0007  83 C4 04                          add             esp,0x00000004
000A  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

000B                            __sigfpe_handler:
000B  56                                push            esi
000C  83 EC 04                          sub             esp,0x00000004
000F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0015  8B 40 68                          mov             eax,dword ptr 0x68[eax]
0018  89 04 24                          mov             dword ptr [esp],eax
001B  83 F8 01                          cmp             eax,0x00000001
001E  74 2C                             je              L$1
0020  83 F8 02                          cmp             eax,0x00000002
0023  74 27                             je              L$1
0025  83 F8 03                          cmp             eax,0x00000003
0028  74 22                             je              L$1
002A  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
002E  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0034  56                                push            esi
0035  6A 02                             push            0x00000002
0037  C7 40 68 02 00 00 00              mov             dword ptr 0x68[eax],0x00000002
003E  FF 54 24 08                       call            dword ptr 0x8[esp]
0042  83 C4 08                          add             esp,0x00000008
0045  31 C0                             xor             eax,eax
0047  83 C4 04                          add             esp,0x00000004
004A  5E                                pop             esi
004B  C3                                ret
004C                            L$1:
004C  B8 FF FF FF FF                    mov             eax,0xffffffff
0051  83 C4 04                          add             esp,0x00000004
0054  5E                                pop             esi
0055  C3                                ret

Routine Size: 75 bytes,    Routine Base: _TEXT + 000B

0056                            signal:
0056  53                                push            ebx
0057  56                                push            esi
0058  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
005C  83 FB 01                          cmp             ebx,0x00000001
005F  7C 05                             jl              L$2
0061  83 FB 0C                          cmp             ebx,0x0000000c
0064  7E 12                             jle             L$3
0066                            L$2:
0066  6A 09                             push            0x00000009
0068  E8 00 00 00 00                    call            __set_errno
006D  B8 03 00 00 00                    mov             eax,0x00000003
0072  83 C4 04                          add             esp,0x00000004
0075  5E                                pop             esi
0076  5B                                pop             ebx
0077  C3                                ret
0078                            L$3:
0078  BA 00 00 00 00                    mov             edx,offset __sigabort
007D  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0081  89 15 00 00 00 00                 mov             dword ptr __abort,edx
0087  83 F9 02                          cmp             ecx,0x00000002
008A  74 28                             je              L$4
008C  83 F9 03                          cmp             ecx,0x00000003
008F  74 23                             je              L$4
0091  89 DE                             mov             esi,ebx
0093  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0099  83 7C F0 5C 00                    cmp             dword ptr 0x5c[eax+esi*8],0x00000000
009E  74 14                             je              L$4
00A0  83 FB 02                          cmp             ebx,0x00000002
00A3  75 0F                             jne             L$4
00A5  68 9F 00 00 00                    push            0x0000009f
00AA  6A 00                             push            0x00000000
00AC  E8 00 00 00 00                    call            _control87
00B1  83 C4 08                          add             esp,0x00000008
00B4                            L$4:
00B4  C1 E3 03                          shl             ebx,0x03
00B7  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
00BD  8B 74 03 58                       mov             esi,dword ptr 0x58[ebx+eax]
00C1  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
00C7  01 D8                             add             eax,ebx
00C9  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
00CD  89 58 58                          mov             dword ptr 0x58[eax],ebx
00D0  89 F0                             mov             eax,esi
00D2  5E                                pop             esi
00D3  5B                                pop             ebx
00D4  C3                                ret

Routine Size: 127 bytes,    Routine Base: _TEXT + 0056

00D5                            raise:
00D5  53                                push            ebx
00D6  83 EC 04                          sub             esp,0x00000004
00D9  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
00DD  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
00E3  89 DA                             mov             edx,ebx
00E5  8B 44 D0 58                       mov             eax,dword ptr 0x58[eax+edx*8]
00E9  89 04 24                          mov             dword ptr [esp],eax
00EC  83 FB 02                          cmp             ebx,0x00000002
00EF  72 09                             jb              L$5
00F1  76 0E                             jbe             L$6
00F3  83 FB 0C                          cmp             ebx,0x0000000c
00F6  76 22                             jbe             L$9
00F8  EB 49                             jmp             L$10
00FA                            L$5:
00FA  83 FB 01                          cmp             ebx,0x00000001
00FD  74 11                             je              L$8
00FF  EB 42                             jmp             L$10
0101                            L$6:
0101  68 8C 00 00 00                    push            0x0000008c
0106  E8 00 00 00 00                    call            __sigfpe_handler
010B                            L$7:
010B  83 C4 04                          add             esp,0x00000004
010E  EB 3D                             jmp             L$11
0110                            L$8:
0110  83 F8 02                          cmp             eax,0x00000002
0113  75 05                             jne             L$9
0115  E8 00 00 00 00                    call            __terminate
011A                            L$9:
011A  8B 0C 24                          mov             ecx,dword ptr [esp]
011D  83 F9 01                          cmp             ecx,0x00000001
0120  74 2B                             je              L$11
0122  83 F9 02                          cmp             ecx,0x00000002
0125  74 26                             je              L$11
0127  83 F9 03                          cmp             ecx,0x00000003
012A  74 21                             je              L$11
012C  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0132  89 DA                             mov             edx,ebx
0134  53                                push            ebx
0135  C7 44 D0 58 02 00 00 00           mov             dword ptr 0x58[eax+edx*8],0x00000002
013D  FF 54 24 04                       call            dword ptr 0x4[esp]
0141  EB C8                             jmp             L$7
0143                            L$10:
0143  B8 FF FF FF FF                    mov             eax,0xffffffff
0148  83 C4 04                          add             esp,0x00000004
014B  5B                                pop             ebx
014C  C3                                ret
014D                            L$11:
014D  31 C0                             xor             eax,eax
014F  83 C4 04                          add             esp,0x00000004
0152  5B                                pop             ebx
0153  C3                                ret

Routine Size: 127 bytes,    Routine Base: _TEXT + 00D5

0154                            __SigInit:
0154  53                                push            ebx
0155  56                                push            esi
0156  57                                push            edi
0157  06                                push            es
0158  BB 08 00 00 00                    mov             ebx,0x00000008
015D                            L$12:
015D  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0163  8D 34 18                          lea             esi,[eax+ebx]
0166  8C D8                             mov             eax,ds
0168  8E C0                             mov             es,eax
016A  8D 7E 58                          lea             edi,0x58[esi]
016D  8D B3 00 00 00 00                 lea             esi,SignalTable[ebx]
0173  83 C3 08                          add             ebx,0x00000008
0176  A5                                movsd
0177  A5                                movsd
0178  83 FB 68                          cmp             ebx,0x00000068
017B  75 E0                             jne             L$12
017D  07                                pop             es
017E  5F                                pop             edi
017F  5E                                pop             esi
0180  5B                                pop             ebx

Routine Size: 45 bytes,    Routine Base: _TEXT + 0154

0181                            __SigFini:
0181  C3                                ret
0182  8B C0                             mov             eax,eax
0184                            L$13:
0184  E6 01 00 00                                     DD        offset L$14
0188  88 02 00 00                                     DD        offset L$22
018C  F0 01 00 00                                     DD        offset L$15
0190  FA 01 00 00                                     DD        offset L$16
0194  8F 02 00 00                                     DD        offset L$23
0198  96 02 00 00                                     DD        offset L$24
019C  AA 02 00 00                                     DD        offset L$26

Routine Size: 31 bytes,    Routine Base: _TEXT + 0181

01A0                            ___ExceptionFilter:
01A0  53                                push            ebx
01A1  56                                push            esi
01A2  57                                push            edi
01A3  06                                push            es
01A4  55                                push            ebp
01A5  81 EC 1C 02 00 00                 sub             esp,0x0000021c
01AB  8B B4 24 34 02 00 00              mov             esi,dword ptr 0x234[esp]
01B2  8B BC 24 3C 02 00 00              mov             edi,dword ptr 0x23c[esp]
01B9  8A 66 04                          mov             ah,byte ptr 0x4[esi]
01BC  F6 C4 01                          test            ah,0x01
01BF  0F 85 12 03 00 00                 jne             L$48
01C5  F6 C4 06                          test            ah,0x06
01C8  0F 85 09 03 00 00                 jne             L$48
01CE  8B 06                             mov             eax,dword ptr [esi]
01D0  05 73 FF FF 3F                    add             eax,0x3fffff73
01D5  83 F8 06                          cmp             eax,0x00000006
01D8  0F 87 D3 00 00 00                 ja              L$27
01DE  2E FF 24 85 84 01 00 00           jmp             dword ptr cs:L$13[eax*4]
01E6                            L$14:
01E6  BB 82 00 00 00                    mov             ebx,0x00000082
01EB  E9 C6 00 00 00                    jmp             L$28
01F0                            L$15:
01F0  BB 86 00 00 00                    mov             ebx,0x00000086
01F5  E9 BC 00 00 00                    jmp             L$28
01FA                            L$16:
01FA  8B 47 28                          mov             eax,dword ptr 0x28[edi]
01FD  66 8B 10                          mov             dx,word ptr [eax]
0200  BB 81 00 00 00                    mov             ebx,0x00000081
0205  66 81 FA D9 FA                    cmp             dx,0xfad9
020A  75 0A                             jne             L$17
020C  BB 88 00 00 00                    mov             ebx,0x00000088
0211  E9 A0 00 00 00                    jmp             L$28
0216                            L$17:
0216  66 81 FA D9 F1                    cmp             dx,0xf1d9
021B  75 0A                             jne             L$18
021D  BB 8E 00 00 00                    mov             ebx,0x0000008e
0222  E9 8F 00 00 00                    jmp             L$28
0227                            L$18:
0227  75 0A                             jne             L$19
0229  BB 8F 00 00 00                    mov             ebx,0x0000008f
022E  E9 83 00 00 00                    jmp             L$28
0233                            L$19:
0233  8A 08                             mov             cl,byte ptr [eax]
0235  80 F9 DB                          cmp             cl,0xdb
0238  74 05                             je              L$20
023A  80 F9 DF                          cmp             cl,0xdf
023D  75 10                             jne             L$21
023F                            L$20:
023F  8A 50 01                          mov             dl,byte ptr 0x1[eax]
0242  80 E2 30                          and             dl,0x30
0245  80 FA 10                          cmp             dl,0x10
0248  75 05                             jne             L$21
024A  BB 8D 00 00 00                    mov             ebx,0x0000008d
024F                            L$21:
024F  F6 00 01                          test            byte ptr [eax],0x01
0252  75 62                             jne             L$28
0254  8A 40 01                          mov             al,byte ptr 0x1[eax]
0257  24 30                             and             al,0x30
0259  3C 30                             cmp             al,0x30
025B  75 59                             jne             L$28
025D  8B 47 20                          mov             eax,dword ptr 0x20[edi]
0260  25 FF FF 00 00                    and             eax,0x0000ffff
0265  8B 57 24                          mov             edx,dword ptr 0x24[edi]
0268  C1 E0 02                          shl             eax,0x02
026B  31 C9                             xor             ecx,ecx
026D  66 C1 E8 0D                       shr             ax,0x0d
0271  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0277  66 89 C1                          mov             cx,ax
027A  89 D0                             mov             eax,edx
027C  01 C9                             add             ecx,ecx
027E  D3 E8                             shr             eax,cl
0280  83 E0 01                          and             eax,0x00000001
0283  83 F8 01                          cmp             eax,0x00000001
0286  75 2E                             jne             L$28
0288                            L$22:
0288  BB 83 00 00 00                    mov             ebx,0x00000083
028D  EB 27                             jmp             L$28
028F                            L$23:
028F  BB 84 00 00 00                    mov             ebx,0x00000084
0294  EB 20                             jmp             L$28
0296                            L$24:
0296  F6 47 21 02                       test            byte ptr 0x21[edi],0x02
029A  74 07                             je              L$25
029C  BB 8A 00 00 00                    mov             ebx,0x0000008a
02A1  EB 13                             jmp             L$28
02A3                            L$25:
02A3  BB 8B 00 00 00                    mov             ebx,0x0000008b
02A8  EB 0C                             jmp             L$28
02AA                            L$26:
02AA  BB 85 00 00 00                    mov             ebx,0x00000085
02AF  EB 05                             jmp             L$28
02B1                            L$27:
02B1  BB FF FF FF FF                    mov             ebx,0xffffffff
02B6                            L$28:
02B6  83 FB FF                          cmp             ebx,0xffffffff
02B9  74 3D                             je              L$29
02BB  E8 00 00 00 00                    call            _fpreset
02C0  B6 01                             mov             dh,0x01
02C2  53                                push            ebx
02C3  88 35 00 00 00 00                 mov             byte ptr __ExceptionHandled,dh
02C9  E8 00 00 00 00                    call            __sigfpe_handler
02CE  83 C4 04                          add             esp,0x00000004
02D1  85 C0                             test            eax,eax
02D3  0F 85 FE 01 00 00                 jne             L$48
02D9  80 3D 00 00 00 00 00              cmp             byte ptr __ExceptionHandled,0x00
02E0  0F 84 F1 01 00 00                 je              L$48
02E6  66 8B 5F 20                       mov             bx,word ptr 0x20[edi]
02EA  80 E7 7F                          and             bh,0x7f
02ED  30 DB                             xor             bl,bl
02EF  66 89 5F 20                       mov             word ptr 0x20[edi],bx
02F3  E9 E4 01 00 00                    jmp             L$49
02F8                            L$29:
02F8  BF 01 00 00 00                    mov             edi,0x00000001
02FD  BB 08 00 00 00                    mov             ebx,0x00000008
0302                            L$30:
0302  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0308  8B 16                             mov             edx,dword ptr [esi]
030A  3B 54 03 5C                       cmp             edx,dword ptr 0x5c[ebx+eax]
030E  75 4D                             jne             L$31
0310  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0316  83 7C 03 58 01                    cmp             dword ptr 0x58[ebx+eax],0x00000001
031B  74 49                             je              L$32
031D  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0323  83 7C 03 58 02                    cmp             dword ptr 0x58[ebx+eax],0x00000002
0328  74 3C                             je              L$32
032A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0330  83 7C 03 58 03                    cmp             dword ptr 0x58[ebx+eax],0x00000003
0335  74 2F                             je              L$32
0337  B7 01                             mov             bh,0x01
0339  57                                push            edi
033A  88 3D 00 00 00 00                 mov             byte ptr __ExceptionHandled,bh
0340  E8 00 00 00 00                    call            raise
0345  8A 0D 00 00 00 00                 mov             cl,byte ptr __ExceptionHandled
034B  83 C4 04                          add             esp,0x00000004
034E  84 C9                             test            cl,cl
0350  0F 84 81 01 00 00                 je              L$48
0356  31 C0                             xor             eax,eax
0358  E9 7F 01 00 00                    jmp             L$49
035D                            L$31:
035D  83 C3 08                          add             ebx,0x00000008
0360  47                                inc             edi
0361  83 FB 60                          cmp             ebx,0x00000060
0364  7E 9C                             jle             L$30
0366                            L$32:
0366  8B 06                             mov             eax,dword ptr [esi]
0368  3D 94 00 00 C0                    cmp             eax,0xc0000094
036D  72 23                             jb              L$33
036F  0F 86 7B 00 00 00                 jbe             L$39
0375  3D 96 00 00 C0                    cmp             eax,0xc0000096
037A  0F 82 86 00 00 00                 jb              L$41
0380  76 58                             jbe             L$37
0382  3D FD 00 00 C0                    cmp             eax,0xc00000fd
0387  0F 84 6E 00 00 00                 je              L$40
038D  E9 74 00 00 00                    jmp             L$41
0392                            L$33:
0392  3D 05 00 00 C0                    cmp             eax,0xc0000005
0397  0F 82 69 00 00 00                 jb              L$41
039D  76 09                             jbe             L$34
039F  3D 1D 00 00 C0                    cmp             eax,0xc000001d
03A4  74 3F                             je              L$38
03A6  EB 5E                             jmp             L$41
03A8                            L$34:
03A8  83 7E 14 00                       cmp             dword ptr 0x14[esi],0x00000000
03AC  75 07                             jne             L$35
03AE  B8 00 00 00 00                    mov             eax,offset DGROUP:L$50
03B3  EB 05                             jmp             L$36
03B5                            L$35:
03B5  B8 0A 00 00 00                    mov             eax,offset DGROUP:L$51
03BA                            L$36:
03BA  50                                push            eax
03BB  8B 4E 18                          mov             ecx,dword ptr 0x18[esi]
03BE  51                                push            ecx
03BF  8B 7E 0C                          mov             edi,dword ptr 0xc[esi]
03C2  57                                push            edi
03C3  68 12 00 00 00                    push            offset DGROUP:L$52
03C8  8D 84 24 28 01 00 00              lea             eax,0x128[esp]
03CF  50                                push            eax
03D0  E8 00 00 00 00                    call            sprintf
03D5  83 C4 14                          add             esp,0x00000014
03D8  EB 45                             jmp             L$43
03DA                            L$37:
03DA  8B 6E 0C                          mov             ebp,dword ptr 0xc[esi]
03DD  55                                push            ebp
03DE  68 61 00 00 00                    push            offset DGROUP:L$53
03E3  EB 2A                             jmp             L$42
03E5                            L$38:
03E5  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
03E8  52                                push            edx
03E9  68 99 00 00 00                    push            offset DGROUP:L$54
03EE  EB 1F                             jmp             L$42
03F0                            L$39:
03F0  8B 46 0C                          mov             eax,dword ptr 0xc[esi]
03F3  50                                push            eax
03F4  68 CE 00 00 00                    push            offset DGROUP:L$55
03F9  EB 14                             jmp             L$42
03FB                            L$40:
03FB  8B 7E 0C                          mov             edi,dword ptr 0xc[esi]
03FE  57                                push            edi
03FF  68 09 01 00 00                    push            offset DGROUP:L$56
0404  EB 09                             jmp             L$42
0406                            L$41:
0406  8B 6E 0C                          mov             ebp,dword ptr 0xc[esi]
0409  55                                push            ebp
040A  68 3B 01 00 00                    push            offset DGROUP:L$57
040F                            L$42:
040F  8D 84 24 20 01 00 00              lea             eax,0x120[esp]
0416  50                                push            eax
0417  E8 00 00 00 00                    call            sprintf
041C  83 C4 0C                          add             esp,0x0000000c
041F                            L$43:
041F  68 82 01 00 00                    push            offset DGROUP:L$58
0424  E8 00 00 00 00                    call            _LoadLibraryA
0429  89 C2                             mov             edx,eax
042B  89 C3                             mov             ebx,eax
042D  85 C0                             test            eax,eax
042F  0F 84 8E 00 00 00                 je              L$47
0435  68 8D 01 00 00                    push            offset DGROUP:L$59
043A  50                                push            eax
043B  E8 00 00 00 00                    call            _GetProcAddress
0440  89 84 24 18 02 00 00              mov             dword ptr 0x218[esp],eax
0447  85 C0                             test            eax,eax
0449  74 76                             je              L$46
044B  89 E7                             mov             edi,esp
044D  8C D8                             mov             eax,ds
044F  68 04 01 00 00                    push            0x00000104
0454  8E C0                             mov             es,eax
0456  8D 44 24 17                       lea             eax,0x17[esp]
045A  BE 9B 01 00 00                    mov             esi,offset DGROUP:L$60
045F  50                                push            eax
0460  A5                                movsd
0461  A5                                movsd
0462  A5                                movsd
0463  A5                                movsd
0464  A5                                movsd
0465  6A 00                             push            0x00000000
0467  8D BC 24 24 01 00 00              lea             edi,0x124[esp]
046E  BE AF 01 00 00                    mov             esi,offset DGROUP:L$61
0473  E8 00 00 00 00                    call            _GetModuleFileNameA
0478  06                                push            es
0479  1E                                push            ds
047A  07                                pop             es
047B  57                                push            edi
047C  2B C9                             sub             ecx,ecx
047E  49                                dec             ecx
047F  B0 00                             mov             al,0x00
0481  F2 AE                             repne scasb
0483  4F                                dec             edi
0484                            L$44:
0484  8A 06                             mov             al,byte ptr [esi]
0486  88 07                             mov             byte ptr [edi],al
0488  3C 00                             cmp             al,0x00
048A  0F 84 10 00 00 00                 je              L$45
0490  8A 46 01                          mov             al,byte ptr 0x1[esi]
0493  83 C6 02                          add             esi,0x00000002
0496  88 47 01                          mov             byte ptr 0x1[edi],al
0499  83 C7 02                          add             edi,0x00000002
049C  3C 00                             cmp             al,0x00
049E  75 E4                             jne             L$44
04A0                            L$45:
04A0  5F                                pop             edi
04A1  07                                pop             es
04A2  6A 00                             push            0x00000000
04A4  68 10 20 00 00                    push            0x00002010
04A9  8D 44 24 08                       lea             eax,0x8[esp]
04AD  50                                push            eax
04AE  8D 84 24 24 01 00 00              lea             eax,0x124[esp]
04B5  50                                push            eax
04B6  6A 00                             push            0x00000000
04B8  FF 94 24 2C 02 00 00              call            dword ptr 0x22c[esp]
04BF  EB 02                             jmp             L$47
04C1                            L$46:
04C1  31 DB                             xor             ebx,ebx
04C3                            L$47:
04C3  85 DB                             test            ebx,ebx
04C5  75 10                             jne             L$48
04C7  8D 84 24 18 01 00 00              lea             eax,0x118[esp]
04CE  50                                push            eax
04CF  E8 00 00 00 00                    call            puts
04D4  83 C4 04                          add             esp,0x00000004
04D7                            L$48:
04D7  B8 01 00 00 00                    mov             eax,0x00000001
04DC                            L$49:
04DC  81 C4 1C 02 00 00                 add             esp,0x0000021c
04E2  5D                                pop             ebp
04E3  07                                pop             es
04E4  5F                                pop             edi
04E5  5E                                pop             esi
04E6  5B                                pop             ebx
04E7  C2 10 00                          ret             0x0010

Routine Size: 842 bytes,    Routine Base: _TEXT + 01A0

04EA                            __NewExceptionHandler:
04EA  53                                push            ebx
04EB  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
04EF  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
04F5  89 58 54                          mov             dword ptr 0x54[eax],ebx
04F8  31 C0                             xor             eax,eax
04FA  64 8B 00                          mov             eax,dword ptr fs:[eax]
04FD  89 C3                             mov             ebx,eax
04FF  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0505  8B 40 54                          mov             eax,dword ptr 0x54[eax]
0508  89 18                             mov             dword ptr [eax],ebx
050A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0510  8B 40 54                          mov             eax,dword ptr 0x54[eax]
0513  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],offset ___ExceptionFilter
051A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0520  8B 40 54                          mov             eax,dword ptr 0x54[eax]
0523  31 D2                             xor             edx,edx
0525  64 89 02                          mov             dword ptr fs:[edx],eax
0528  5B                                pop             ebx
0529  C3                                ret

Routine Size: 64 bytes,    Routine Base: _TEXT + 04EA

052A                            __DoneExceptionHandler:
052A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0530  8B 40 54                          mov             eax,dword ptr 0x54[eax]
0533  31 D2                             xor             edx,edx
0535  8B 00                             mov             eax,dword ptr [eax]
0537  64 89 02                          mov             dword ptr fs:[edx],eax
053A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0540  C7 40 54 00 00 00 00              mov             dword ptr 0x54[eax],0x00000000
0547  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 052A

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
0000                            SignalTable:
0000  01 00 00 00 FF FF FF FF 02 00 00 00 FF FF FF FF ................
0010  01 00 00 00 FF FF FF FF 01 00 00 00 1D 00 00 C0 ................
0020  01 00 00 00 3A 01 00 C0 01 00 00 00 05 00 00 C0 ....:...........
0030  01 00 00 00 3A 01 00 C0 01 00 00 00 3A 01 00 C0 ....:.......:...
0040  01 00 00 00 FF FF FF FF 01 00 00 00 FF FF FF FF ................
0050  01 00 00 00 FF FF FF FF 01 00 00 00 94 00 00 C0 ................
0060  01 00 00 00 95 00 00 C0                         ........

Segment: _BSS DWORD USE32 00000001 bytes
0000                            __ExceptionHandled:

BSS Size: 1 bytes

