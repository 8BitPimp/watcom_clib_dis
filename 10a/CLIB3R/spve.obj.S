Module: spve
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000032F bytes
0000                            __Slash_C_:
0000  C6 00 2F                          mov             byte ptr [eax],0x2f
0003  C6 40 01 63                       mov             byte ptr 0x1[eax],0x63
0007  C6 40 02 00                       mov             byte ptr 0x2[eax],0x00
000B  C3                                ret
000C                            file_exists_:
000C  52                                push            edx
000D  31 D2                             xor             edx,edx
000F  E8 00 00 00 00                    call            access_
0014  85 C0                             test            eax,eax
0016  0F 94 C0                          sete            al
0019  0F B6 C0                          movzx           eax,al
001C  5A                                pop             edx
001D  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E                            spawnve_:
001E  68 E0 00 00 00                    push            0x000000e0
0023  E8 00 00 00 00                    call            __CHK
0028  56                                push            esi
0029  57                                push            edi
002A  06                                push            es
002B  C8 AC 00 00                       enter           0x00ac,0x00
002F  50                                push            eax
0030  81 ED 82 00 00 00                 sub             ebp,0x00000082
0036  89 D6                             mov             esi,edx
0038  89 5D 72                          mov             dword ptr 0x72[ebp],ebx
003B  89 CA                             mov             edx,ecx
003D  C6 45 7E 00                       mov             byte ptr 0x7e[ebp],0x00
0041  83 F8 02                          cmp             eax,0x00000002
0044  72 14                             jb              L$2
0046  B8 09 00 00 00                    mov             eax,0x00000009
004B  E8 00 00 00 00                    call            __set_errno_
0050                            L$1:
0050  B8 FF FF FF FF                    mov             eax,0xffffffff
0055  E9 CA 02 00 00                    jmp             L$20
005A                            L$2:
005A  6A 00                             push            0x00000000
005C  8D 45 56                          lea             eax,0x56[ebp]
005F  50                                push            eax
0060  8D 45 5A                          lea             eax,0x5a[ebp]
0063  8D 4D 5E                          lea             ecx,0x5e[ebp]
0066  50                                push            eax
0067  89 D8                             mov             eax,ebx
0069  8D 5D 62                          lea             ebx,0x62[ebp]
006C  E8 00 00 00 00                    call            __cenvarg_
0071  89 45 7A                          mov             dword ptr 0x7a[ebp],eax
0074  83 F8 FF                          cmp             eax,0xffffffff
0077  0F 84 A7 02 00 00                 je              L$20
007D  89 F0                             mov             eax,esi
007F  E8 00 00 00 00                    call            strlen_
0084  8D 90 0E 01 00 00                 lea             edx,0x10e[eax]
008A  89 D0                             mov             eax,edx
008C  E8 00 00 00 00                    call            _nmalloc_
0091  89 C3                             mov             ebx,eax
0093  89 45 66                          mov             dword ptr 0x66[ebp],eax
0096  85 C0                             test            eax,eax
0098  75 2A                             jne             L$5
009A  8D 5A 03                          lea             ebx,0x3[edx]
009D  80 E3 FC                          and             bl,0xfc
00A0  E8 00 00 00 00                    call            stackavail_
00A5  39 C3                             cmp             ebx,eax
00A7  73 08                             jae             L$3
00A9  89 D8                             mov             eax,ebx
00AB  29 C4                             sub             esp,eax
00AD  89 E0                             mov             eax,esp
00AF  EB 02                             jmp             L$4
00B1                            L$3:
00B1  31 C0                             xor             eax,eax
00B3                            L$4:
00B3  89 45 6E                          mov             dword ptr 0x6e[ebp],eax
00B6  85 C0                             test            eax,eax
00B8  75 0D                             jne             L$6
00BA  8B 45 62                          mov             eax,dword ptr 0x62[ebp]
00BD  E8 00 00 00 00                    call            free_
00C2  EB 8C                             jmp             L$1
00C4                            L$5:
00C4  89 45 6E                          mov             dword ptr 0x6e[ebp],eax
00C7                            L$6:
00C7  8D 45 46                          lea             eax,0x46[ebp]
00CA  8D 5D 4A                          lea             ebx,0x4a[ebp]
00CD  8D 4D 4E                          lea             ecx,0x4e[ebp]
00D0  50                                push            eax
00D1  8D 45 42                          lea             eax,0x42[ebp]
00D4  81 EA 07 01 00 00                 sub             edx,0x00000107
00DA  50                                push            eax
00DB  03 55 6E                          add             edx,dword ptr 0x6e[ebp]
00DE  89 F0                             mov             eax,esi
00E0  E8 00 00 00 00                    call            _splitpath2_
00E5  8D 45 D6                          lea             eax,-0x2a[ebp]
00E8  FF 15 00 00 00 00                 call            dword ptr ___Save8087
00EE  8B 45 56                          mov             eax,dword ptr 0x56[ebp]
00F1  E8 00 00 00 00                    call            _nmalloc_
00F6  89 C2                             mov             edx,eax
00F8  89 45 6A                          mov             dword ptr 0x6a[ebp],eax
00FB  85 C0                             test            eax,eax
00FD  75 4A                             jne             L$9
00FF  8B 45 56                          mov             eax,dword ptr 0x56[ebp]
0102  83 C0 03                          add             eax,0x00000003
0105  24 FC                             and             al,0xfc
0107  89 C2                             mov             edx,eax
0109  E8 00 00 00 00                    call            stackavail_
010E  39 C2                             cmp             edx,eax
0110  73 0E                             jae             L$7
0112  8B 45 56                          mov             eax,dword ptr 0x56[ebp]
0115  83 C0 03                          add             eax,0x00000003
0118  24 FC                             and             al,0xfc
011A  29 C4                             sub             esp,eax
011C  89 E0                             mov             eax,esp
011E  EB 02                             jmp             L$8
0120                            L$7:
0120  31 C0                             xor             eax,eax
0122                            L$8:
0122  89 45 76                          mov             dword ptr 0x76[ebp],eax
0125  85 C0                             test            eax,eax
0127  75 23                             jne             L$10
0129  B8 02 00 00 00                    mov             eax,0x00000002
012E  E8 00 00 00 00                    call            __set_errno_
0133  B8 0A 00 00 00                    mov             eax,0x0000000a
0138  C7 45 7A FF FF FF FF              mov             dword ptr 0x7a[ebp],0xffffffff
013F  E8 00 00 00 00                    call            __set_doserrno_
0144  E9 B7 01 00 00                    jmp             L$19
0149                            L$9:
0149  89 45 76                          mov             dword ptr 0x76[ebp],eax
014C                            L$10:
014C  80 3D 00 00 00 00 03              cmp             byte ptr __osmajor,0x03
0153  72 17                             jb              L$11
0155  8B 45 4A                          mov             eax,dword ptr 0x4a[ebp]
0158  80 38 00                          cmp             byte ptr [eax],0x00
015B  75 0F                             jne             L$11
015D  8B 45 4E                          mov             eax,dword ptr 0x4e[ebp]
0160  80 38 00                          cmp             byte ptr [eax],0x00
0163  75 07                             jne             L$11
0165  C7 45 4E 00 00 00 00              mov             dword ptr 0x4e[ebp],offset DGROUP:L$21
016C                            L$11:
016C  FF 75 46                          push            dword ptr 0x46[ebp]
016F  8B 45 6E                          mov             eax,dword ptr 0x6e[ebp]
0172  8B 55 4A                          mov             edx,dword ptr 0x4a[ebp]
0175  8B 5D 4E                          mov             ebx,dword ptr 0x4e[ebp]
0178  8B 4D 42                          mov             ecx,dword ptr 0x42[ebp]
017B  E8 00 00 00 00                    call            _makepath_
0180  B8 01 00 00 00                    mov             eax,0x00000001
0185  E8 00 00 00 00                    call            __set_errno_
018A  8B 45 46                          mov             eax,dword ptr 0x46[ebp]
018D  80 38 00                          cmp             byte ptr [eax],0x00
0190  74 48                             je              L$13
0192  BA 03 00 00 00                    mov             edx,offset DGROUP:L$22
0197  E8 00 00 00 00                    call            stricmp_
019C  85 C0                             test            eax,eax
019E  75 19                             jne             L$12
01A0  8B 45 6E                          mov             eax,dword ptr 0x6e[ebp]
01A3  C7 45 7A FF FF FF FF              mov             dword ptr 0x7a[ebp],0xffffffff
01AA  E8 00 00 00 00                    call            file_exists_
01AF  85 C0                             test            eax,eax
01B1  0F 85 E6 00 00 00                 jne             L$16
01B7  EB 21                             jmp             L$13
01B9                            L$12:
01B9  31 C0                             xor             eax,eax
01BB  E8 00 00 00 00                    call            __set_errno_
01C0  FF 75 72                          push            dword ptr 0x72[ebp]
01C3  FF 75 62                          push            dword ptr 0x62[ebp]
01C6  FF 75 76                          push            dword ptr 0x76[ebp]
01C9  FF 75 6E                          push            dword ptr 0x6e[ebp]
01CC  FF 75 D2                          push            dword ptr -0x2e[ebp]
01CF  E8 00 00 00 00                    call            __dospawn
01D4  83 C4 14                          add             esp,0x00000014
01D7  89 45 7A                          mov             dword ptr 0x7a[ebp],eax
01DA                            L$13:
01DA  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
01E0  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
01E4  0F 85 16 01 00 00                 jne             L$19
01EA  8B 45 6E                          mov             eax,dword ptr 0x6e[ebp]
01ED  8B 55 6E                          mov             edx,dword ptr 0x6e[ebp]
01F0  E8 00 00 00 00                    call            strlen_
01F5  01 C2                             add             edx,eax
01F7  80 7D 7E 00                       cmp             byte ptr 0x7e[ebp],0x00
01FB  74 0C                             je              L$14
01FD  B8 01 00 00 00                    mov             eax,0x00000001
0202  E8 00 00 00 00                    call            __set_errno_
0207  EB 2C                             jmp             L$15
0209                            L$14:
0209  1E                                push            ds
020A  07                                pop             es
020B  89 D7                             mov             edi,edx
020D  BE 08 00 00 00                    mov             esi,offset DGROUP:L$23
0212  31 C0                             xor             eax,eax
0214  A5                                movsd
0215  A4                                movsb
0216  E8 00 00 00 00                    call            __set_errno_
021B  FF 75 72                          push            dword ptr 0x72[ebp]
021E  FF 75 62                          push            dword ptr 0x62[ebp]
0221  FF 75 76                          push            dword ptr 0x76[ebp]
0224  FF 75 6E                          push            dword ptr 0x6e[ebp]
0227  FF 75 D2                          push            dword ptr -0x2e[ebp]
022A  E8 00 00 00 00                    call            __dospawn
022F  83 C4 14                          add             esp,0x00000014
0232  89 45 7A                          mov             dword ptr 0x7a[ebp],eax
0235                            L$15:
0235  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
023B  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
023F  0F 85 BB 00 00 00                 jne             L$19
0245  31 C0                             xor             eax,eax
0247  E8 00 00 00 00                    call            __set_errno_
024C  89 D7                             mov             edi,edx
024E  1E                                push            ds
024F  07                                pop             es
0250  BE 0D 00 00 00                    mov             esi,offset DGROUP:L$24
0255  FF 75 72                          push            dword ptr 0x72[ebp]
0258  A5                                movsd
0259  A4                                movsb
025A  FF 75 62                          push            dword ptr 0x62[ebp]
025D  FF 75 76                          push            dword ptr 0x76[ebp]
0260  FF 75 6E                          push            dword ptr 0x6e[ebp]
0263  FF 75 D2                          push            dword ptr -0x2e[ebp]
0266  E8 00 00 00 00                    call            __dospawn
026B  83 C4 14                          add             esp,0x00000014
026E  89 45 7A                          mov             dword ptr 0x7a[ebp],eax
0271  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0277  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
027B  0F 85 7F 00 00 00                 jne             L$19
0281  BE 03 00 00 00                    mov             esi,offset DGROUP:L$22
0286  31 C0                             xor             eax,eax
0288  89 D7                             mov             edi,edx
028A  E8 00 00 00 00                    call            __set_errno_
028F  8B 45 6E                          mov             eax,dword ptr 0x6e[ebp]
0292  A5                                movsd
0293  A4                                movsb
0294  E8 00 00 00 00                    call            file_exists_
0299  85 C0                             test            eax,eax
029B  74 63                             je              L$19
029D                            L$16:
029D  8B 45 62                          mov             eax,dword ptr 0x62[ebp]
02A0  8B 55 72                          mov             edx,dword ptr 0x72[ebp]
02A3  8B 5D 76                          mov             ebx,dword ptr 0x76[ebp]
02A6  B9 01 00 00 00                    mov             ecx,0x00000001
02AB  E8 00 00 00 00                    call            free_
02B0  8B 45 6E                          mov             eax,dword ptr 0x6e[ebp]
02B3  C7 45 62 00 00 00 00              mov             dword ptr 0x62[ebp],0x00000000
02BA  E8 00 00 00 00                    call            __ccmdline_
02BF  6A 00                             push            0x00000000
02C1  FF 75 76                          push            dword ptr 0x76[ebp]
02C4  0F B6 55 7E                       movzx           edx,byte ptr 0x7e[ebp]
02C8  FF 75 6E                          push            dword ptr 0x6e[ebp]
02CB  8D 45 52                          lea             eax,0x52[ebp]
02CE  E8 00 00 00 00                    call            __Slash_C_
02D3  50                                push            eax
02D4  80 7D 7E 00                       cmp             byte ptr 0x7e[ebp],0x00
02D8  74 07                             je              L$17
02DA  B8 1A 00 00 00                    mov             eax,offset DGROUP:L$26
02DF  EB 05                             jmp             L$18
02E1                            L$17:
02E1  B8 1E 00 00 00                    mov             eax,offset DGROUP:L$27
02E6                            L$18:
02E6  50                                push            eax
02E7  B8 12 00 00 00                    mov             eax,offset DGROUP:L$25
02EC  E8 00 00 00 00                    call            getenv_
02F1  50                                push            eax
02F2  FF 75 D2                          push            dword ptr -0x2e[ebp]
02F5  E8 00 00 00 00                    call            spawnl_
02FA  83 C4 1C                          add             esp,0x0000001c
02FD  89 45 7A                          mov             dword ptr 0x7a[ebp],eax
0300                            L$19:
0300  8B 45 6A                          mov             eax,dword ptr 0x6a[ebp]
0303  E8 00 00 00 00                    call            _nfree_
0308  8B 45 66                          mov             eax,dword ptr 0x66[ebp]
030B  E8 00 00 00 00                    call            _nfree_
0310  8B 45 62                          mov             eax,dword ptr 0x62[ebp]
0313  E8 00 00 00 00                    call            free_
0318  8D 45 D6                          lea             eax,-0x2a[ebp]
031B  FF 15 00 00 00 00                 call            dword ptr ___Rest8087
0321  8B 45 7A                          mov             eax,dword ptr 0x7a[ebp]
0324                            L$20:
0324  8D A5 82 00 00 00                 lea             esp,0x82[ebp]
032A  5D                                pop             ebp
032B  07                                pop             es
032C  5F                                pop             edi
032D  5E                                pop             esi
032E  C3                                ret

Routine Size: 785 bytes,    Routine Base: _TEXT + 001E

No disassembly errors

Segment: CONST DWORD USE32 00000026 bytes
0000                            L$21:
0000  2E 5C 00                                        .\.
0003                            L$22:
0003  2E 62 61 74 00                                  .bat.
0008                            L$23:
0008  2E 63 6F 6D 00                                  .com.
000D                            L$24:
000D  2E 65 78 65 00                                  .exe.
0012                            L$25:
0012  43 4F 4D 53 50 45 43 00                         COMSPEC.
001A                            L$26:
001A  43 4D 44 00                                     CMD.
001E                            L$27:
001E  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

