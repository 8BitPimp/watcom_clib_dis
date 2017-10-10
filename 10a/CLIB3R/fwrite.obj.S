Module: fwrite
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000020B bytes
0000                            fwrite_:
0000  56                                push            esi
0001  57                                push            edi
0002  55                                push            ebp
0003  83 EC 10                          sub             esp,0x00000010
0006  50                                push            eax
0007  52                                push            edx
0008  89 CD                             mov             ebp,ecx
000A  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
000D  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0013  F6 41 0C 02                       test            byte ptr 0xc[ecx],0x02
0017  75 1E                             jne             L$1
0019  B8 04 00 00 00                    mov             eax,0x00000004
001E  E8 00 00 00 00                    call            __set_errno_
0023  80 49 0C 20                       or              byte ptr 0xc[ecx],0x20
0027  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
002A  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0030  31 C0                             xor             eax,eax
0032  E9 CD 01 00 00                    jmp             L$17
0037                            L$1:
0037  0F AF DA                          imul            ebx,edx
003A  85 DB                             test            ebx,ebx
003C  75 10                             jne             L$2
003E  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
0041  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0047  89 D8                             mov             eax,ebx
0049  E9 B6 01 00 00                    jmp             L$17
004E                            L$2:
004E  83 79 08 00                       cmp             dword ptr 0x8[ecx],0x00000000
0052  75 07                             jne             L$3
0054  89 E8                             mov             eax,ebp
0056  E8 00 00 00 00                    call            __ioalloc_
005B                            L$3:
005B  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
005E  8A 55 0C                          mov             dl,byte ptr 0xc[ebp]
0061  31 F6                             xor             esi,esi
0063  83 E0 30                          and             eax,0x00000030
0066  80 E2 CF                          and             dl,0xcf
0069  89 74 24 0C                       mov             dword ptr 0xc[esp],esi
006D  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0071  88 55 0C                          mov             byte ptr 0xc[ebp],dl
0074  F6 C2 40                          test            dl,0x40
0077  0F 84 FA 00 00 00                 je              L$12
007D  89 5C 24 10                       mov             dword ptr 0x10[esp],ebx
0081                            L$4:
0081  83 7D 04 00                       cmp             dword ptr 0x4[ebp],0x00000000
0085  75 52                             jne             L$8
0087  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
008B  3B 45 14                          cmp             eax,dword ptr 0x14[ebp]
008E  72 49                             jb              L$8
0090  80 E4 FE                          and             ah,0xfe
0093  30 C0                             xor             al,al
0095  89 44 24 14                       mov             dword ptr 0x14[esp],eax
0099  85 C0                             test            eax,eax
009B  75 08                             jne             L$5
009D  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
00A1  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00A5                            L$5:
00A5  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00A9  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
00AD  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
00B0  E8 00 00 00 00                    call            write_
00B5  83 F8 FF                          cmp             eax,0xffffffff
00B8  75 09                             jne             L$7
00BA                            L$6:
00BA  80 4D 0C 20                       or              byte ptr 0xc[ebp],0x20
00BE  E9 80 00 00 00                    jmp             L$11
00C3                            L$7:
00C3  3B 44 24 14                       cmp             eax,dword ptr 0x14[esp]
00C7  0F 84 76 00 00 00                 je              L$11
00CD  B8 0C 00 00 00                    mov             eax,0x0000000c
00D2  E8 00 00 00 00                    call            __set_errno_
00D7  EB E1                             jmp             L$6
00D9                            L$8:
00D9  8B 45 14                          mov             eax,dword ptr 0x14[ebp]
00DC  2B 45 04                          sub             eax,dword ptr 0x4[ebp]
00DF  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
00E3  89 44 24 14                       mov             dword ptr 0x14[esp],eax
00E7  39 C8                             cmp             eax,ecx
00E9  76 04                             jbe             L$9
00EB  89 4C 24 14                       mov             dword ptr 0x14[esp],ecx
00EF                            L$9:
00EF  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
00F3  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
00F7  8B 7D 00                          mov             edi,dword ptr [ebp]
00FA  06                                push            es
00FB  8C D8                             mov             eax,ds
00FD  8E C0                             mov             es,eax
00FF  57                                push            edi
0100  89 C8                             mov             eax,ecx
0102  C1 E9 02                          shr             ecx,0x02
0105  F2 A5                             repne movsd
0107  8A C8                             mov             cl,al
0109  80 E1 03                          and             cl,0x03
010C  F2 A4                             repne movsb
010E  5F                                pop             edi
010F  07                                pop             es
0110  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0114  8B 75 00                          mov             esi,dword ptr [ebp]
0117  8B 7D 04                          mov             edi,dword ptr 0x4[ebp]
011A  01 C6                             add             esi,eax
011C  8A 7D 0D                          mov             bh,byte ptr 0xd[ebp]
011F  89 75 00                          mov             dword ptr [ebp],esi
0122  01 C7                             add             edi,eax
0124  8B 55 14                          mov             edx,dword ptr 0x14[ebp]
0127  89 7D 04                          mov             dword ptr 0x4[ebp],edi
012A  80 CF 10                          or              bh,0x10
012D  8B 45 04                          mov             eax,dword ptr 0x4[ebp]
0130  88 7D 0D                          mov             byte ptr 0xd[ebp],bh
0133  39 D0                             cmp             eax,edx
0135  74 05                             je              L$10
0137  F6 C7 04                          test            bh,0x04
013A  74 07                             je              L$11
013C                            L$10:
013C  89 E8                             mov             eax,ebp
013E  E8 00 00 00 00                    call            __flush_
0143                            L$11:
0143  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0147  8B 74 24 04                       mov             esi,dword ptr 0x4[esp]
014B  8B 7C 24 0C                       mov             edi,dword ptr 0xc[esp]
014F  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0153  01 C6                             add             esi,eax
0155  01 C7                             add             edi,eax
0157  89 74 24 04                       mov             dword ptr 0x4[esp],esi
015B  89 7C 24 0C                       mov             dword ptr 0xc[esp],edi
015F  29 C2                             sub             edx,eax
0161  89 54 24 10                       mov             dword ptr 0x10[esp],edx
0165  0F 84 6D 00 00 00                 je              L$15
016B  F6 45 0C 20                       test            byte ptr 0xc[ebp],0x20
016F  0F 84 0C FF FF FF                 je              L$4
0175  EB 61                             jmp             L$15
0177                            L$12:
0177  8A 4D 0D                          mov             cl,byte ptr 0xd[ebp]
017A  31 FF                             xor             edi,edi
017C  F6 C1 04                          test            cl,0x04
017F  74 14                             je              L$13
0181  88 CD                             mov             ch,cl
0183  80 E5 FA                          and             ch,0xfa
0186  88 E8                             mov             al,ch
0188  88 6D 0D                          mov             byte ptr 0xd[ebp],ch
018B  0C 01                             or              al,0x01
018D  BF 01 00 00 00                    mov             edi,0x00000001
0192  88 45 0D                          mov             byte ptr 0xd[ebp],al
0195                            L$13:
0195  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0199  31 C0                             xor             eax,eax
019B  8A 02                             mov             al,byte ptr [edx]
019D  42                                inc             edx
019E  89 54 24 04                       mov             dword ptr 0x4[esp],edx
01A2  89 EA                             mov             edx,ebp
01A4  E8 00 00 00 00                    call            fputc_
01A9  F6 45 0C 30                       test            byte ptr 0xc[ebp],0x30
01AD  75 0D                             jne             L$14
01AF  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
01B3  41                                inc             ecx
01B4  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
01B8  39 CB                             cmp             ebx,ecx
01BA  75 D9                             jne             L$13
01BC                            L$14:
01BC  85 FF                             test            edi,edi
01BE  74 18                             je              L$15
01C0  8A 75 0D                          mov             dh,byte ptr 0xd[ebp]
01C3  80 E6 FA                          and             dh,0xfa
01C6  88 F3                             mov             bl,dh
01C8  88 75 0D                          mov             byte ptr 0xd[ebp],dh
01CB  80 CB 04                          or              bl,0x04
01CE  89 E8                             mov             eax,ebp
01D0  88 5D 0D                          mov             byte ptr 0xd[ebp],bl
01D3  E8 00 00 00 00                    call            __flush_
01D8                            L$15:
01D8  F6 45 0C 20                       test            byte ptr 0xc[ebp],0x20
01DC  74 06                             je              L$16
01DE  31 C9                             xor             ecx,ecx
01E0  89 4C 24 0C                       mov             dword ptr 0xc[esp],ecx
01E4                            L$16:
01E4  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
01E8  8B 3C 24                          mov             edi,dword ptr [esp]
01EB  8B 75 0C                          mov             esi,dword ptr 0xc[ebp]
01EE  31 D2                             xor             edx,edx
01F0  09 C6                             or              esi,eax
01F2  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
01F5  89 75 0C                          mov             dword ptr 0xc[ebp],esi
01F8  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
01FE  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0202  F7 F7                             div             edi
0204                            L$17:
0204  83 C4 18                          add             esp,0x00000018
0207  5D                                pop             ebp
0208  5F                                pop             edi
0209  5E                                pop             esi
020A  C3                                ret

Routine Size: 523 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

