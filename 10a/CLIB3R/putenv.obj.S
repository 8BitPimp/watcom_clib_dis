Module: putenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000024F bytes
0000                            putenv_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  55                                push            ebp
0006  83 EC 08                          sub             esp,0x00000008
0009  50                                push            eax
000A  85 C0                             test            eax,eax
000C  75 10                             jne             L$3
000E                            L$1:
000E  B8 FF FF FF FF                    mov             eax,0xffffffff
0013  E9 4D 01 00 00                    jmp             L$11
0018                            L$2:
0018  80 FA 3D                          cmp             dl,0x3d
001B  74 07                             je              L$4
001D  40                                inc             eax
001E                            L$3:
001E  8A 10                             mov             dl,byte ptr [eax]
0020  84 D2                             test            dl,dl
0022  75 F4                             jne             L$2
0024                            L$4:
0024  80 38 00                          cmp             byte ptr [eax],0x00
0027  74 E5                             je              L$1
0029  80 78 01 00                       cmp             byte ptr 0x1[eax],0x00
002D  0F 94 C0                          sete            al
0030  31 DB                             xor             ebx,ebx
0032  8B 2D 00 00 00 00                 mov             ebp,dword ptr _environ
0038  88 C3                             mov             bl,al
003A  85 ED                             test            ebp,ebp
003C  75 38                             jne             L$5
003E  85 DB                             test            ebx,ebx
0040  0F 85 1D 01 00 00                 jne             L$10
0046  B8 09 00 00 00                    mov             eax,0x00000009
004B  E8 00 00 00 00                    call            malloc_
0050  89 C2                             mov             edx,eax
0052  89 C5                             mov             ebp,eax
0054  85 C0                             test            eax,eax
0056  74 B6                             je              L$1
0058  A3 00 00 00 00                    mov             dword ptr _environ,eax
005D  8D 50 08                          lea             edx,0x8[eax]
0060  89 18                             mov             dword ptr [eax],ebx
0062  31 FF                             xor             edi,edi
0064  89 58 04                          mov             dword ptr 0x4[eax],ebx
0067  89 15 00 00 00 00                 mov             dword ptr ___env_mask,edx
006D  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
0071  E9 D0 00 00 00                    jmp             L$9
0076                            L$5:
0076  8B 04 24                          mov             eax,dword ptr [esp]
0079  89 DA                             mov             edx,ebx
007B  E8 00 00 00 00                    call            findenv_
0080  85 DB                             test            ebx,ebx
0082  0F 85 DB 00 00 00                 jne             L$10
0088  85 C0                             test            eax,eax
008A  0F 8F B1 00 00 00                 jg              L$8
0090  89 C3                             mov             ebx,eax
0092  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0096  F7 DB                             neg             ebx
0098  89 5C 24 08                       mov             dword ptr 0x8[esp],ebx
009C  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
00A0  C1 E1 02                          shl             ecx,0x02
00A3  8B 35 00 00 00 00                 mov             esi,dword ptr ___env_mask
00A9  8D 41 08                          lea             eax,0x8[ecx]
00AC  43                                inc             ebx
00AD  89 44 24 04                       mov             dword ptr 0x4[esp],eax
00B1  8D 14 18                          lea             edx,[eax+ebx]
00B4  85 F6                             test            esi,esi
00B6  75 45                             jne             L$6
00B8  89 D0                             mov             eax,edx
00BA  E8 00 00 00 00                    call            malloc_
00BF  89 C2                             mov             edx,eax
00C1  89 C5                             mov             ebp,eax
00C3  85 C0                             test            eax,eax
00C5  0F 84 43 FF FF FF                 je              L$1
00CB  8B 35 00 00 00 00                 mov             esi,dword ptr _environ
00D1  89 C7                             mov             edi,eax
00D3  06                                push            es
00D4  8C D8                             mov             eax,ds
00D6  8E C0                             mov             es,eax
00D8  57                                push            edi
00D9  89 C8                             mov             eax,ecx
00DB  C1 E9 02                          shr             ecx,0x02
00DE  F2 A5                             repne movsd
00E0  8A C8                             mov             cl,al
00E2  80 E1 03                          and             cl,0x03
00E5  F2 A4                             repne movsb
00E7  5F                                pop             edi
00E8  07                                pop             es
00E9  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00ED  01 D0                             add             eax,edx
00EF  31 D2                             xor             edx,edx
00F1  A3 00 00 00 00                    mov             dword ptr ___env_mask,eax
00F6  E8 00 00 00 00                    call            memset_
00FB  EB 30                             jmp             L$7
00FD                            L$6:
00FD  89 E8                             mov             eax,ebp
00FF  E8 00 00 00 00                    call            realloc_
0104  89 C2                             mov             edx,eax
0106  89 C5                             mov             ebp,eax
0108  85 C0                             test            eax,eax
010A  0F 84 FE FE FF FF                 je              L$1
0110  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0114  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0118  01 C1                             add             ecx,eax
011A  8B 15 00 00 00 00                 mov             edx,dword ptr ___env_mask
0120  89 C8                             mov             eax,ecx
0122  E8 00 00 00 00                    call            memmove_
0127  89 0D 00 00 00 00                 mov             dword ptr ___env_mask,ecx
012D                            L$7:
012D  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0131  89 2D 00 00 00 00                 mov             dword ptr _environ,ebp
0137  C7 44 85 04 00 00 00 00           mov             dword ptr 0x4[ebp+eax*4],0x00000000
013F  EB 05                             jmp             L$9
0141                            L$8:
0141  48                                dec             eax
0142  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0146                            L$9:
0146  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
014A  C1 E0 02                          shl             eax,0x02
014D  01 C5                             add             ebp,eax
014F  8B 04 24                          mov             eax,dword ptr [esp]
0152  89 45 00                          mov             dword ptr [ebp],eax
0155  8B 6C 24 08                       mov             ebp,dword ptr 0x8[esp]
0159  A1 00 00 00 00                    mov             eax,dword ptr ___env_mask
015E  01 E8                             add             eax,ebp
0160  C6 00 00                          mov             byte ptr [eax],0x00
0163                            L$10:
0163  31 C0                             xor             eax,eax
0165                            L$11:
0165  83 C4 0C                          add             esp,0x0000000c
0168  5D                                pop             ebp
0169  5F                                pop             edi
016A  5E                                pop             esi
016B  5A                                pop             edx
016C  59                                pop             ecx
016D  5B                                pop             ebx
016E  C3                                ret
016F                            findenv_:
016F  53                                push            ebx
0170  51                                push            ecx
0171  56                                push            esi
0172  57                                push            edi
0173  55                                push            ebp
0174  89 C7                             mov             edi,eax
0176  89 D5                             mov             ebp,edx
0178  8B 35 00 00 00 00                 mov             esi,dword ptr _environ
017E  E9 B2 00 00 00                    jmp             L$24
0183                            L$12:
0183  89 FB                             mov             ebx,edi
0185  E9 9F 00 00 00                    jmp             L$22
018A                            L$13:
018A  31 C0                             xor             eax,eax
018C  8A 02                             mov             al,byte ptr [edx]
018E  E8 00 00 00 00                    call            toupper_
0193  89 C1                             mov             ecx,eax
0195  31 C0                             xor             eax,eax
0197  8A 03                             mov             al,byte ptr [ebx]
0199  E8 00 00 00 00                    call            toupper_
019E  39 C1                             cmp             ecx,eax
01A0  0F 85 8C 00 00 00                 jne             L$23
01A6  80 3A 3D                          cmp             byte ptr [edx],0x3d
01A9  0F 85 78 00 00 00                 jne             L$21
01AF  8B 15 00 00 00 00                 mov             edx,dword ptr _environ
01B5  89 F7                             mov             edi,esi
01B7  29 D7                             sub             edi,edx
01B9  C1 FF 02                          sar             edi,0x02
01BC  85 ED                             test            ebp,ebp
01BE  74 62                             je              L$20
01C0  89 F1                             mov             ecx,esi
01C2  8B 16                             mov             edx,dword ptr [esi]
01C4  EB 08                             jmp             L$15
01C6                            L$14:
01C6  8B 41 04                          mov             eax,dword ptr 0x4[ecx]
01C9  89 01                             mov             dword ptr [ecx],eax
01CB  83 C1 04                          add             ecx,0x00000004
01CE                            L$15:
01CE  83 39 00                          cmp             dword ptr [ecx],0x00000000
01D1  75 F3                             jne             L$14
01D3  8B 35 00 00 00 00                 mov             esi,dword ptr ___env_mask
01D9  85 F6                             test            esi,esi
01DB  74 41                             je              L$19
01DD  89 F0                             mov             eax,esi
01DF  80 3C 07 00                       cmp             byte ptr [edi+eax],0x00
01E3  74 07                             je              L$16
01E5  89 D0                             mov             eax,edx
01E7  E8 00 00 00 00                    call            free_
01EC                            L$16:
01EC  8B 2D 00 00 00 00                 mov             ebp,dword ptr _environ
01F2  89 CE                             mov             esi,ecx
01F4  29 EE                             sub             esi,ebp
01F6  8B 15 00 00 00 00                 mov             edx,dword ptr ___env_mask
01FC  C1 FE 02                          sar             esi,0x02
01FF  89 C8                             mov             eax,ecx
0201  89 F3                             mov             ebx,esi
0203  E8 00 00 00 00                    call            memmove_
0208  89 0D 00 00 00 00                 mov             dword ptr ___env_mask,ecx
020E  8D 04 0F                          lea             eax,[edi+ecx]
0211  EB 07                             jmp             L$18
0213                            L$17:
0213  8A 50 01                          mov             dl,byte ptr 0x1[eax]
0216  47                                inc             edi
0217  88 10                             mov             byte ptr [eax],dl
0219  40                                inc             eax
021A                            L$18:
021A  39 F7                             cmp             edi,esi
021C  7C F5                             jl              L$17
021E                            L$19:
021E  31 C0                             xor             eax,eax
0220  EB 27                             jmp             L$25
0222                            L$20:
0222  8D 47 01                          lea             eax,0x1[edi]
0225  EB 22                             jmp             L$25
0227                            L$21:
0227  42                                inc             edx
0228  43                                inc             ebx
0229                            L$22:
0229  80 3B 00                          cmp             byte ptr [ebx],0x00
022C  0F 85 58 FF FF FF                 jne             L$13
0232                            L$23:
0232  83 C6 04                          add             esi,0x00000004
0235                            L$24:
0235  8B 16                             mov             edx,dword ptr [esi]
0237  85 D2                             test            edx,edx
0239  0F 85 44 FF FF FF                 jne             L$12
023F  A1 00 00 00 00                    mov             eax,dword ptr _environ
0244  29 F0                             sub             eax,esi
0246  C1 F8 02                          sar             eax,0x02
0249                            L$25:
0249  5D                                pop             ebp
024A  5F                                pop             edi
024B  5E                                pop             esi
024C  59                                pop             ecx
024D  5B                                pop             ebx
024E  C3                                ret

Routine Size: 591 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

