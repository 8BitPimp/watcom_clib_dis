Module: setenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000325 bytes
0000                            setenv_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  50                                push            eax
0008  52                                push            edx
0009  85 C0                             test            eax,eax
000B  75 0A                             jne             L$2
000D                            L$1:
000D  B8 FF FF FF FF                    mov             eax,0xffffffff
0012  E9 F1 01 00 00                    jmp             L$13
0017                            L$2:
0017  80 38 00                          cmp             byte ptr [eax],0x00
001A  74 F1                             je              L$1
001C  8B 2D 00 00 00 00                 mov             ebp,dword ptr _environ
0022  85 ED                             test            ebp,ebp
0024  75 42                             jne             L$3
0026  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
002A  0F 84 D6 01 00 00                 je              L$12
0030  B8 09 00 00 00                    mov             eax,0x00000009
0035  E8 00 00 00 00                    call            malloc_
003A  89 C2                             mov             edx,eax
003C  89 C5                             mov             ebp,eax
003E  85 C0                             test            eax,eax
0040  74 CB                             je              L$1
0042  A3 00 00 00 00                    mov             dword ptr _environ,eax
0047  C7 00 00 00 00 00                 mov             dword ptr [eax],0x00000000
004D  8D 50 08                          lea             edx,0x8[eax]
0050  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],0x00000000
0057  31 C9                             xor             ecx,ecx
0059  89 15 00 00 00 00                 mov             dword ptr ___env_mask,edx
005F  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
0063  E9 E5 00 00 00                    jmp             L$7
0068                            L$3:
0068  8B 14 24                          mov             edx,dword ptr [esp]
006B  8B 0C 24                          mov             ecx,dword ptr [esp]
006E  E8 00 00 00 00                    call            findenv_
0073  85 C9                             test            ecx,ecx
0075  0F 84 8B 01 00 00                 je              L$12
007B  85 C0                             test            eax,eax
007D  0F 8F BD 00 00 00                 jg              L$6
0083  89 C6                             mov             esi,eax
0085  8B 3D 00 00 00 00                 mov             edi,dword ptr ___env_mask
008B  F7 DE                             neg             esi
008D  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0091  89 F1                             mov             ecx,esi
0093  89 74 24 0C                       mov             dword ptr 0xc[esp],esi
0097  C1 E1 02                          shl             ecx,0x02
009A  8D 46 01                          lea             eax,0x1[esi]
009D  8D 59 08                          lea             ebx,0x8[ecx]
00A0  89 44 24 08                       mov             dword ptr 0x8[esp],eax
00A4  8D 14 18                          lea             edx,[eax+ebx]
00A7  85 FF                             test            edi,edi
00A9  75 48                             jne             L$4
00AB  89 D0                             mov             eax,edx
00AD  E8 00 00 00 00                    call            malloc_
00B2  89 C2                             mov             edx,eax
00B4  89 C5                             mov             ebp,eax
00B6  85 C0                             test            eax,eax
00B8  0F 84 4F FF FF FF                 je              L$1
00BE  8B 35 00 00 00 00                 mov             esi,dword ptr _environ
00C4  89 C7                             mov             edi,eax
00C6  06                                push            es
00C7  8C D8                             mov             eax,ds
00C9  8E C0                             mov             es,eax
00CB  57                                push            edi
00CC  89 C8                             mov             eax,ecx
00CE  C1 E9 02                          shr             ecx,0x02
00D1  F2 A5                             repne movsd
00D3  8A C8                             mov             cl,al
00D5  80 E1 03                          and             cl,0x03
00D8  F2 A4                             repne movsb
00DA  5F                                pop             edi
00DB  07                                pop             es
00DC  01 DA                             add             edx,ebx
00DE  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
00E2  89 15 00 00 00 00                 mov             dword ptr ___env_mask,edx
00E8  89 D0                             mov             eax,edx
00EA  31 D2                             xor             edx,edx
00EC  E8 00 00 00 00                    call            memset_
00F1  EB 2B                             jmp             L$5
00F3                            L$4:
00F3  89 E8                             mov             eax,ebp
00F5  E8 00 00 00 00                    call            realloc_
00FA  89 C1                             mov             ecx,eax
00FC  89 C5                             mov             ebp,eax
00FE  85 C0                             test            eax,eax
0100  0F 84 07 FF FF FF                 je              L$1
0106  8D 0C 18                          lea             ecx,[eax+ebx]
0109  8B 15 00 00 00 00                 mov             edx,dword ptr ___env_mask
010F  89 C8                             mov             eax,ecx
0111  89 F3                             mov             ebx,esi
0113  E8 00 00 00 00                    call            memmove_
0118  89 0D 00 00 00 00                 mov             dword ptr ___env_mask,ecx
011E                            L$5:
011E  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0122  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0126  C7 44 85 04 00 00 00 00           mov             dword ptr 0x4[ebp+eax*4],0x00000000
012E  A1 00 00 00 00                    mov             eax,dword ptr ___env_mask
0133  01 D0                             add             eax,edx
0135  89 2D 00 00 00 00                 mov             dword ptr _environ,ebp
013B  C6 00 00                          mov             byte ptr [eax],0x00
013E  EB 0D                             jmp             L$7
0140                            L$6:
0140  85 DB                             test            ebx,ebx
0142  0F 84 BE 00 00 00                 je              L$12
0148  48                                dec             eax
0149  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
014D                            L$7:
014D  8B 7C 24 04                       mov             edi,dword ptr 0x4[esp]
0151  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0155  06                                push            es
0156  8C D8                             mov             eax,ds
0158  8E C0                             mov             es,eax
015A  29 C9                             sub             ecx,ecx
015C  49                                dec             ecx
015D  31 C0                             xor             eax,eax
015F  F2 AE                             repne scasb
0161  F7 D1                             not             ecx
0163  49                                dec             ecx
0164  07                                pop             es
0165  A1 00 00 00 00                    mov             eax,dword ptr ___env_mask
016A  01 F0                             add             eax,esi
016C  8A 30                             mov             dh,byte ptr [eax]
016E  89 CB                             mov             ebx,ecx
0170  84 F6                             test            dh,dh
0172  74 08                             je              L$8
0174  89 F2                             mov             edx,esi
0176  8B 54 95 00                       mov             edx,dword ptr [ebp+edx*4]
017A  EB 02                             jmp             L$9
017C                            L$8:
017C  31 D2                             xor             edx,edx
017E                            L$9:
017E  8B 3C 24                          mov             edi,dword ptr [esp]
0181  06                                push            es
0182  8C D8                             mov             eax,ds
0184  8E C0                             mov             es,eax
0186  29 C9                             sub             ecx,ecx
0188  49                                dec             ecx
0189  31 C0                             xor             eax,eax
018B  F2 AE                             repne scasb
018D  F7 D1                             not             ecx
018F  49                                dec             ecx
0190  07                                pop             es
0191  01 D9                             add             ecx,ebx
0193  83 C1 02                          add             ecx,0x00000002
0196  89 D0                             mov             eax,edx
0198  89 CA                             mov             edx,ecx
019A  E8 00 00 00 00                    call            realloc_
019F  89 C2                             mov             edx,eax
01A1  85 C0                             test            eax,eax
01A3  0F 84 64 FE FF FF                 je              L$1
01A9  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
01AD  89 C7                             mov             edi,eax
01AF  89 D9                             mov             ecx,ebx
01B1  06                                push            es
01B2  8C D8                             mov             eax,ds
01B4  8E C0                             mov             es,eax
01B6  57                                push            edi
01B7  89 C8                             mov             eax,ecx
01B9  C1 E9 02                          shr             ecx,0x02
01BC  F2 A5                             repne movsd
01BE  8A C8                             mov             cl,al
01C0  80 E1 03                          and             cl,0x03
01C3  F2 A4                             repne movsb
01C5  5F                                pop             edi
01C6  07                                pop             es
01C7  C6 04 1A 3D                       mov             byte ptr [edx+ebx],0x3d
01CB  43                                inc             ebx
01CC  8B 34 24                          mov             esi,dword ptr [esp]
01CF  8D 3C 1A                          lea             edi,[edx+ebx]
01D2  57                                push            edi
01D3                            L$10:
01D3  8A 06                             mov             al,byte ptr [esi]
01D5  88 07                             mov             byte ptr [edi],al
01D7  3C 00                             cmp             al,0x00
01D9  0F 84 10 00 00 00                 je              L$11
01DF  8A 46 01                          mov             al,byte ptr 0x1[esi]
01E2  83 C6 02                          add             esi,0x00000002
01E5  88 47 01                          mov             byte ptr 0x1[edi],al
01E8  83 C7 02                          add             edi,0x00000002
01EB  3C 00                             cmp             al,0x00
01ED  75 E4                             jne             L$10
01EF                            L$11:
01EF  5F                                pop             edi
01F0  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
01F4  8B 7C 24 0C                       mov             edi,dword ptr 0xc[esp]
01F8  89 54 85 00                       mov             dword ptr [ebp+eax*4],edx
01FC  A1 00 00 00 00                    mov             eax,dword ptr ___env_mask
0201  01 F8                             add             eax,edi
0203  C6 00 01                          mov             byte ptr [eax],0x01
0206                            L$12:
0206  31 C0                             xor             eax,eax
0208                            L$13:
0208  83 C4 10                          add             esp,0x00000010
020B  5D                                pop             ebp
020C  5F                                pop             edi
020D  5E                                pop             esi
020E  59                                pop             ecx
020F  C3                                ret
0210                            findenv_:
0210  53                                push            ebx
0211  51                                push            ecx
0212  56                                push            esi
0213  57                                push            edi
0214  55                                push            ebp
0215  83 EC 08                          sub             esp,0x00000008
0218  50                                push            eax
0219  52                                push            edx
021A  A1 00 00 00 00                    mov             eax,dword ptr _environ
021F  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0223  E9 D4 00 00 00                    jmp             L$24
0228                            L$14:
0228  8B 6C 24 04                       mov             ebp,dword ptr 0x4[esp]
022C                            L$15:
022C  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0230  80 38 3D                          cmp             byte ptr [eax],0x3d
0233  0F 85 8C 00 00 00                 jne             L$22
0239  80 7D 00 00                       cmp             byte ptr [ebp],0x00
023D  0F 85 82 00 00 00                 jne             L$22
0243  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
0247  2B 35 00 00 00 00                 sub             esi,dword ptr _environ
024D  8B 3C 24                          mov             edi,dword ptr [esp]
0250  C1 FE 02                          sar             esi,0x02
0253  85 FF                             test            edi,edi
0255  0F 85 65 00 00 00                 jne             L$21
025B  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
025F  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0263  8B 3F                             mov             edi,dword ptr [edi]
0265  EB 08                             jmp             L$17
0267                            L$16:
0267  8B 41 04                          mov             eax,dword ptr 0x4[ecx]
026A  89 01                             mov             dword ptr [ecx],eax
026C  83 C1 04                          add             ecx,0x00000004
026F                            L$17:
026F  83 39 00                          cmp             dword ptr [ecx],0x00000000
0272  75 F3                             jne             L$16
0274  8B 15 00 00 00 00                 mov             edx,dword ptr ___env_mask
027A  85 D2                             test            edx,edx
027C  74 47                             je              L$22
027E  89 D0                             mov             eax,edx
0280  80 3C 06 00                       cmp             byte ptr [esi+eax],0x00
0284  74 07                             je              L$18
0286  89 F8                             mov             eax,edi
0288  E8 00 00 00 00                    call            free_
028D                            L$18:
028D  8B 1D 00 00 00 00                 mov             ebx,dword ptr _environ
0293  89 CF                             mov             edi,ecx
0295  29 DF                             sub             edi,ebx
0297  8B 15 00 00 00 00                 mov             edx,dword ptr ___env_mask
029D  C1 FF 02                          sar             edi,0x02
02A0  89 C8                             mov             eax,ecx
02A2  89 FB                             mov             ebx,edi
02A4  E8 00 00 00 00                    call            memmove_
02A9  89 0D 00 00 00 00                 mov             dword ptr ___env_mask,ecx
02AF  01 F1                             add             ecx,esi
02B1  EB 07                             jmp             L$20
02B3                            L$19:
02B3  8A 41 01                          mov             al,byte ptr 0x1[ecx]
02B6  46                                inc             esi
02B7  88 01                             mov             byte ptr [ecx],al
02B9  41                                inc             ecx
02BA                            L$20:
02BA  39 FE                             cmp             esi,edi
02BC  7D 07                             jge             L$22
02BE  EB F3                             jmp             L$19
02C0                            L$21:
02C0  8D 46 01                          lea             eax,0x1[esi]
02C3  EB 57                             jmp             L$25
02C5                            L$22:
02C5  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
02C9  31 C0                             xor             eax,eax
02CB  8A 02                             mov             al,byte ptr [edx]
02CD  E8 00 00 00 00                    call            toupper_
02D2  89 C2                             mov             edx,eax
02D4  31 C0                             xor             eax,eax
02D6  8A 45 00                          mov             al,byte ptr [ebp]
02D9  E8 00 00 00 00                    call            toupper_
02DE  39 C2                             cmp             edx,eax
02E0  75 15                             jne             L$23
02E2  80 7D 00 00                       cmp             byte ptr [ebp],0x00
02E6  74 0F                             je              L$23
02E8  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
02EC  41                                inc             ecx
02ED  45                                inc             ebp
02EE  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
02F2  E9 35 FF FF FF                    jmp             L$15
02F7                            L$23:
02F7  83 44 24 08 04                    add             dword ptr 0x8[esp],0x00000004
02FC                            L$24:
02FC  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0300  8B 00                             mov             eax,dword ptr [eax]
0302  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0306  85 C0                             test            eax,eax
0308  0F 85 1A FF FF FF                 jne             L$14
030E  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0312  A1 00 00 00 00                    mov             eax,dword ptr _environ
0317  29 D8                             sub             eax,ebx
0319  C1 F8 02                          sar             eax,0x02
031C                            L$25:
031C  83 C4 10                          add             esp,0x00000010
031F  5D                                pop             ebp
0320  5F                                pop             edi
0321  5E                                pop             esi
0322  59                                pop             ecx
0323  5B                                pop             ebx
0324  C3                                ret

Routine Size: 805 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

