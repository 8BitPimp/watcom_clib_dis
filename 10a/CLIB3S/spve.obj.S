Module: spve
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000395 bytes
0000                            __Slash_C:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006  C6 00 2F                          mov             byte ptr [eax],0x2f
0009  C6 40 01 63                       mov             byte ptr 0x1[eax],0x63
000D  C6 40 02 00                       mov             byte ptr 0x2[eax],0x00
0011  5D                                pop             ebp
0012  C3                                ret
0013                            file_exists:
0013  55                                push            ebp
0014  89 E5                             mov             ebp,esp
0016  6A 00                             push            0x00000000
0018  FF 75 08                          push            dword ptr 0x8[ebp]
001B  E8 00 00 00 00                    call            access
0020  83 C4 08                          add             esp,0x00000008
0023  85 C0                             test            eax,eax
0025  0F 94 C0                          sete            al
0028  0F B6 C0                          movzx           eax,al
002B  5D                                pop             ebp
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

002D                            spawnve:
002D  68 DC 00 00 00                    push            0x000000dc
0032  E8 00 00 00 00                    call            __CHK
0037  53                                push            ebx
0038  56                                push            esi
0039  57                                push            edi
003A  06                                push            es
003B  C8 A8 00 00                       enter           0x00a8,0x00
003F  83 ED 72                          sub             ebp,0x00000072
0042  C6 45 6E 00                       mov             byte ptr 0x6e[ebp],0x00
0046  83 BD 8A 00 00 00 02              cmp             dword ptr 0x8a[ebp],0x00000002
004D  72 11                             jb              L$2
004F  6A 09                             push            0x00000009
0051  E8 00 00 00 00                    call            __set_errno
0056                            L$1:
0056  B8 FF FF FF FF                    mov             eax,0xffffffff
005B  E9 29 03 00 00                    jmp             L$20
0060                            L$2:
0060  6A 00                             push            0x00000000
0062  8D 45 4A                          lea             eax,0x4a[ebp]
0065  50                                push            eax
0066  8D 45 4E                          lea             eax,0x4e[ebp]
0069  50                                push            eax
006A  8D 45 52                          lea             eax,0x52[ebp]
006D  50                                push            eax
006E  8D 45 56                          lea             eax,0x56[ebp]
0071  50                                push            eax
0072  FF B5 96 00 00 00                 push            dword ptr 0x96[ebp]
0078  FF B5 92 00 00 00                 push            dword ptr 0x92[ebp]
007E  E8 00 00 00 00                    call            __cenvarg
0083  83 C4 1C                          add             esp,0x0000001c
0086  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
0089  83 F8 FF                          cmp             eax,0xffffffff
008C  0F 84 FA 02 00 00                 je              L$21
0092  FF B5 8E 00 00 00                 push            dword ptr 0x8e[ebp]
0098  E8 00 00 00 00                    call            strlen
009D  83 C4 04                          add             esp,0x00000004
00A0  8D B0 0E 01 00 00                 lea             esi,0x10e[eax]
00A6  56                                push            esi
00A7  E8 00 00 00 00                    call            _nmalloc
00AC  83 C4 04                          add             esp,0x00000004
00AF  89 45 5A                          mov             dword ptr 0x5a[ebp],eax
00B2  85 C0                             test            eax,eax
00B4  75 2C                             jne             L$5
00B6  8D 5E 03                          lea             ebx,0x3[esi]
00B9  80 E3 FC                          and             bl,0xfc
00BC  E8 00 00 00 00                    call            stackavail
00C1  39 C3                             cmp             ebx,eax
00C3  73 08                             jae             L$3
00C5  89 D8                             mov             eax,ebx
00C7  29 C4                             sub             esp,eax
00C9  89 E0                             mov             eax,esp
00CB  EB 02                             jmp             L$4
00CD                            L$3:
00CD  31 C0                             xor             eax,eax
00CF                            L$4:
00CF  89 C3                             mov             ebx,eax
00D1  85 C0                             test            eax,eax
00D3  75 0F                             jne             L$6
00D5  FF 75 56                          push            dword ptr 0x56[ebp]
00D8  E8 00 00 00 00                    call            free
00DD  E9 74 FF FF FF                    jmp             L$1
00E2                            L$5:
00E2  89 C3                             mov             ebx,eax
00E4                            L$6:
00E4  8D 45 36                          lea             eax,0x36[ebp]
00E7  50                                push            eax
00E8  8D 45 3A                          lea             eax,0x3a[ebp]
00EB  50                                push            eax
00EC  8D 45 3E                          lea             eax,0x3e[ebp]
00EF  50                                push            eax
00F0  8D 45 42                          lea             eax,0x42[ebp]
00F3  81 EE 07 01 00 00                 sub             esi,0x00000107
00F9  50                                push            eax
00FA  01 DE                             add             esi,ebx
00FC  56                                push            esi
00FD  FF B5 8E 00 00 00                 push            dword ptr 0x8e[ebp]
0103  E8 00 00 00 00                    call            _splitpath2
0108  83 C4 18                          add             esp,0x00000018
010B  8D 45 CA                          lea             eax,-0x36[ebp]
010E  50                                push            eax
010F  FF 15 00 00 00 00                 call            dword ptr __Save8087
0115  83 C4 04                          add             esp,0x00000004
0118  FF 75 4A                          push            dword ptr 0x4a[ebp]
011B  E8 00 00 00 00                    call            _nmalloc
0120  83 C4 04                          add             esp,0x00000004
0123  89 45 5E                          mov             dword ptr 0x5e[ebp],eax
0126  85 C0                             test            eax,eax
0128  75 4A                             jne             L$9
012A  8B 75 4A                          mov             esi,dword ptr 0x4a[ebp]
012D  83 C6 03                          add             esi,0x00000003
0130  66 83 E6 FC                       and             si,0xfffc
0134  E8 00 00 00 00                    call            stackavail
0139  39 C6                             cmp             esi,eax
013B  73 0E                             jae             L$7
013D  8B 45 4A                          mov             eax,dword ptr 0x4a[ebp]
0140  83 C0 03                          add             eax,0x00000003
0143  24 FC                             and             al,0xfc
0145  29 C4                             sub             esp,eax
0147  89 E0                             mov             eax,esp
0149  EB 02                             jmp             L$8
014B                            L$7:
014B  31 C0                             xor             eax,eax
014D                            L$8:
014D  89 45 66                          mov             dword ptr 0x66[ebp],eax
0150  85 C0                             test            eax,eax
0152  75 23                             jne             L$10
0154  6A 02                             push            0x00000002
0156  E8 00 00 00 00                    call            __set_errno
015B  83 C4 04                          add             esp,0x00000004
015E  6A 0A                             push            0x0000000a
0160  C7 45 6A FF FF FF FF              mov             dword ptr 0x6a[ebp],0xffffffff
0167  E8 00 00 00 00                    call            __set_doserrno
016C  83 C4 04                          add             esp,0x00000004
016F  E9 E7 01 00 00                    jmp             L$19
0174                            L$9:
0174  89 45 66                          mov             dword ptr 0x66[ebp],eax
0177                            L$10:
0177  80 3D 00 00 00 00 03              cmp             byte ptr _osmajor,0x03
017E  72 17                             jb              L$11
0180  8B 45 42                          mov             eax,dword ptr 0x42[ebp]
0183  80 38 00                          cmp             byte ptr [eax],0x00
0186  75 0F                             jne             L$11
0188  8B 45 3E                          mov             eax,dword ptr 0x3e[ebp]
018B  80 38 00                          cmp             byte ptr [eax],0x00
018E  75 07                             jne             L$11
0190  C7 45 3E 00 00 00 00              mov             dword ptr 0x3e[ebp],offset DGROUP:L$22
0197                            L$11:
0197  FF 75 36                          push            dword ptr 0x36[ebp]
019A  FF 75 3A                          push            dword ptr 0x3a[ebp]
019D  FF 75 3E                          push            dword ptr 0x3e[ebp]
01A0  FF 75 42                          push            dword ptr 0x42[ebp]
01A3  53                                push            ebx
01A4  E8 00 00 00 00                    call            _makepath
01A9  83 C4 14                          add             esp,0x00000014
01AC  6A 01                             push            0x00000001
01AE  E8 00 00 00 00                    call            __set_errno
01B3  8B 45 36                          mov             eax,dword ptr 0x36[ebp]
01B6  83 C4 04                          add             esp,0x00000004
01B9  80 38 00                          cmp             byte ptr [eax],0x00
01BC  74 54                             je              L$13
01BE  68 03 00 00 00                    push            offset DGROUP:L$23
01C3  50                                push            eax
01C4  E8 00 00 00 00                    call            stricmp
01C9  83 C4 08                          add             esp,0x00000008
01CC  85 C0                             test            eax,eax
01CE  75 1A                             jne             L$12
01D0  53                                push            ebx
01D1  C7 45 6A FF FF FF FF              mov             dword ptr 0x6a[ebp],0xffffffff
01D8  E8 00 00 00 00                    call            file_exists
01DD  83 C4 04                          add             esp,0x00000004
01E0  85 C0                             test            eax,eax
01E2  0F 85 03 01 00 00                 jne             L$16
01E8  EB 28                             jmp             L$13
01EA                            L$12:
01EA  6A 00                             push            0x00000000
01EC  E8 00 00 00 00                    call            __set_errno
01F1  83 C4 04                          add             esp,0x00000004
01F4  FF B5 92 00 00 00                 push            dword ptr 0x92[ebp]
01FA  FF 75 56                          push            dword ptr 0x56[ebp]
01FD  FF 75 66                          push            dword ptr 0x66[ebp]
0200  53                                push            ebx
0201  FF B5 8A 00 00 00                 push            dword ptr 0x8a[ebp]
0207  E8 00 00 00 00                    call            __dospawn
020C  83 C4 14                          add             esp,0x00000014
020F  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
0212                            L$13:
0212  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0218  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
021C  0F 85 39 01 00 00                 jne             L$19
0222  53                                push            ebx
0223  E8 00 00 00 00                    call            strlen
0228  8D 34 03                          lea             esi,[ebx+eax]
022B  83 C4 04                          add             esp,0x00000004
022E  89 75 62                          mov             dword ptr 0x62[ebp],esi
0231  80 7D 6E 00                       cmp             byte ptr 0x6e[ebp],0x00
0235  74 0C                             je              L$14
0237  6A 01                             push            0x00000001
0239  E8 00 00 00 00                    call            __set_errno
023E  83 C4 04                          add             esp,0x00000004
0241  EB 33                             jmp             L$15
0243                            L$14:
0243  1E                                push            ds
0244  07                                pop             es
0245  89 F7                             mov             edi,esi
0247  BE 08 00 00 00                    mov             esi,offset DGROUP:L$24
024C  6A 00                             push            0x00000000
024E  A5                                movsd
024F  A4                                movsb
0250  E8 00 00 00 00                    call            __set_errno
0255  83 C4 04                          add             esp,0x00000004
0258  FF B5 92 00 00 00                 push            dword ptr 0x92[ebp]
025E  FF 75 56                          push            dword ptr 0x56[ebp]
0261  FF 75 66                          push            dword ptr 0x66[ebp]
0264  53                                push            ebx
0265  FF B5 8A 00 00 00                 push            dword ptr 0x8a[ebp]
026B  E8 00 00 00 00                    call            __dospawn
0270  83 C4 14                          add             esp,0x00000014
0273  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
0276                            L$15:
0276  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
027C  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
0280  0F 85 D5 00 00 00                 jne             L$19
0286  6A 00                             push            0x00000000
0288  8B 7D 62                          mov             edi,dword ptr 0x62[ebp]
028B  E8 00 00 00 00                    call            __set_errno
0290  83 C4 04                          add             esp,0x00000004
0293  1E                                push            ds
0294  07                                pop             es
0295  BE 0D 00 00 00                    mov             esi,offset DGROUP:L$25
029A  FF B5 92 00 00 00                 push            dword ptr 0x92[ebp]
02A0  A5                                movsd
02A1  A4                                movsb
02A2  FF 75 56                          push            dword ptr 0x56[ebp]
02A5  FF 75 66                          push            dword ptr 0x66[ebp]
02A8  53                                push            ebx
02A9  FF B5 8A 00 00 00                 push            dword ptr 0x8a[ebp]
02AF  E8 00 00 00 00                    call            __dospawn
02B4  83 C4 14                          add             esp,0x00000014
02B7  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
02BA  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
02C0  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
02C4  0F 85 91 00 00 00                 jne             L$19
02CA  6A 00                             push            0x00000000
02CC  E8 00 00 00 00                    call            __set_errno
02D1  83 C4 04                          add             esp,0x00000004
02D4  8B 7D 62                          mov             edi,dword ptr 0x62[ebp]
02D7  BE 03 00 00 00                    mov             esi,offset DGROUP:L$23
02DC  53                                push            ebx
02DD  A5                                movsd
02DE  A4                                movsb
02DF  E8 00 00 00 00                    call            file_exists
02E4  83 C4 04                          add             esp,0x00000004
02E7  85 C0                             test            eax,eax
02E9  74 70                             je              L$19
02EB                            L$16:
02EB  FF 75 56                          push            dword ptr 0x56[ebp]
02EE  E8 00 00 00 00                    call            free
02F3  83 C4 04                          add             esp,0x00000004
02F6  6A 01                             push            0x00000001
02F8  FF 75 66                          push            dword ptr 0x66[ebp]
02FB  FF B5 92 00 00 00                 push            dword ptr 0x92[ebp]
0301  53                                push            ebx
0302  C7 45 56 00 00 00 00              mov             dword ptr 0x56[ebp],0x00000000
0309  E8 00 00 00 00                    call            __ccmdline
030E  83 C4 10                          add             esp,0x00000010
0311  6A 00                             push            0x00000000
0313  FF 75 66                          push            dword ptr 0x66[ebp]
0316  53                                push            ebx
0317  0F B6 45 6E                       movzx           eax,byte ptr 0x6e[ebp]
031B  50                                push            eax
031C  8D 45 46                          lea             eax,0x46[ebp]
031F  50                                push            eax
0320  E8 00 00 00 00                    call            __Slash_C
0325  83 C4 08                          add             esp,0x00000008
0328  50                                push            eax
0329  80 7D 6E 00                       cmp             byte ptr 0x6e[ebp],0x00
032D  74 07                             je              L$17
032F  B8 1A 00 00 00                    mov             eax,offset DGROUP:L$27
0334  EB 05                             jmp             L$18
0336                            L$17:
0336  B8 1E 00 00 00                    mov             eax,offset DGROUP:L$28
033B                            L$18:
033B  50                                push            eax
033C  68 12 00 00 00                    push            offset DGROUP:L$26
0341  E8 00 00 00 00                    call            getenv
0346  83 C4 04                          add             esp,0x00000004
0349  50                                push            eax
034A  FF B5 8A 00 00 00                 push            dword ptr 0x8a[ebp]
0350  E8 00 00 00 00                    call            spawnl
0355  83 C4 1C                          add             esp,0x0000001c
0358  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
035B                            L$19:
035B  FF 75 5E                          push            dword ptr 0x5e[ebp]
035E  E8 00 00 00 00                    call            _nfree
0363  83 C4 04                          add             esp,0x00000004
0366  FF 75 5A                          push            dword ptr 0x5a[ebp]
0369  E8 00 00 00 00                    call            _nfree
036E  83 C4 04                          add             esp,0x00000004
0371  FF 75 56                          push            dword ptr 0x56[ebp]
0374  E8 00 00 00 00                    call            free
0379  83 C4 04                          add             esp,0x00000004
037C  8D 45 CA                          lea             eax,-0x36[ebp]
037F  50                                push            eax
0380  FF 15 00 00 00 00                 call            dword ptr __Rest8087
0386  8B 45 6A                          mov             eax,dword ptr 0x6a[ebp]
0389                            L$20:
0389  83 C4 04                          add             esp,0x00000004
038C                            L$21:
038C  8D 65 72                          lea             esp,0x72[ebp]
038F  5D                                pop             ebp
0390  07                                pop             es
0391  5F                                pop             edi
0392  5E                                pop             esi
0393  5B                                pop             ebx
0394  C3                                ret

Routine Size: 872 bytes,    Routine Base: _TEXT + 002D

No disassembly errors

Segment: CONST DWORD USE32 00000026 bytes
0000                            L$22:
0000  2E 5C 00                                        .\.
0003                            L$23:
0003  2E 62 61 74 00                                  .bat.
0008                            L$24:
0008  2E 63 6F 6D 00                                  .com.
000D                            L$25:
000D  2E 65 78 65 00                                  .exe.
0012                            L$26:
0012  43 4F 4D 53 50 45 43 00                         COMSPEC.
001A                            L$27:
001A  43 4D 44 00                                     CMD.
001E                            L$28:
001E  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

