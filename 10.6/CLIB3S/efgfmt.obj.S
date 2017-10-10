Module: efgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015C bytes
0000                            _EFG_Format:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
000B  8B 4C 24 20                       mov             ecx,dword ptr 0x20[esp]
000F  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0013  8C D8                             mov             eax,ds
0015  C7 46 0C 00 00 00 00              mov             dword ptr 0xc[esi],0x00000000
001C  89 DF                             mov             edi,ebx
001E  8A 56 15                          mov             dl,byte ptr 0x15[esi]
0021  31 ED                             xor             ebp,ebp
0023  80 FA 47                          cmp             dl,0x47
0026  72 1D                             jb              L$2
0028  76 28                             jbe             L$3
002A  80 FA 66                          cmp             dl,0x66
002D  72 0C                             jb              L$1
002F  76 36                             jbe             L$6
0031  80 FA 67                          cmp             dl,0x67
0034  74 1C                             je              L$3
0036  E9 B0 00 00 00                    jmp             L$11
003B                            L$1:
003B  80 FA 65                          cmp             dl,0x65
003E  74 22                             je              L$5
0040  E9 A6 00 00 00                    jmp             L$11
0045                            L$2:
0045  80 FA 45                          cmp             dl,0x45
0048  0F 82 9D 00 00 00                 jb              L$11
004E  76 12                             jbe             L$5
0050  EB 15                             jmp             L$6
0052                            L$3:
0052  83 7E 08 00                       cmp             dword ptr 0x8[esi],0x00000000
0056  75 07                             jne             L$4
0058  C7 46 08 01 00 00 00              mov             dword ptr 0x8[esi],0x00000001
005F                            L$4:
005F  80 EA 02                          sub             dl,0x02
0062                            L$5:
0062  BD 01 00 00 00                    mov             ebp,0x00000001
0067                            L$6:
0067  8B 01                             mov             eax,dword ptr [ecx]
0069  83 C0 08                          add             eax,0x00000008
006C  89 01                             mov             dword ptr [ecx],eax
006E  89 C1                             mov             ecx,eax
0070  8B 40 F8                          mov             eax,dword ptr -0x8[eax]
0073  89 04 24                          mov             dword ptr [esp],eax
0076  8B 41 FC                          mov             eax,dword ptr -0x4[ecx]
0079  89 44 24 04                       mov             dword ptr 0x4[esp],eax
007D  83 7E 08 FF                       cmp             dword ptr 0x8[esi],0xffffffff
0081  75 07                             jne             L$7
0083  C7 46 08 06 00 00 00              mov             dword ptr 0x8[esi],0x00000006
008A                            L$7:
008A  8A 46 15                          mov             al,byte ptr 0x15[esi]
008D  24 5F                             and             al,0x5f
008F  25 FF 00 00 00                    and             eax,0x000000ff
0094  50                                push            eax
0095  31 C0                             xor             eax,eax
0097  88 D0                             mov             al,dl
0099  50                                push            eax
009A  6A 03                             push            0x00000003
009C  55                                push            ebp
009D  68 FF 00 00 00                    push            0x000000ff
00A2  6A 00                             push            0x00000000
00A4  8B 7E 08                          mov             edi,dword ptr 0x8[esi]
00A7  57                                push            edi
00A8  8D 44 24 1C                       lea             eax,0x1c[esp]
00AC  50                                push            eax
00AD  53                                push            ebx
00AE  E8 00 00 00 00                    call            _FtoS
00B3  31 C0                             xor             eax,eax
00B5  8A 03                             mov             al,byte ptr [ebx]
00B7  83 C4 24                          add             esp,0x00000024
00BA  83 F8 2A                          cmp             eax,0x0000002a
00BD  75 04                             jne             L$8
00BF  C6 46 16 2A                       mov             byte ptr 0x16[esi],0x2a
00C3                            L$8:
00C3  C6 83 FF 00 00 00 00              mov             byte ptr 0xff[ebx],0x00
00CA                            L$9:
00CA  31 C0                             xor             eax,eax
00CC  8A 03                             mov             al,byte ptr [ebx]
00CE  83 F8 20                          cmp             eax,0x00000020
00D1  75 03                             jne             L$10
00D3  43                                inc             ebx
00D4  EB F4                             jmp             L$9
00D6                            L$10:
00D6  56                                push            esi
00D7  53                                push            ebx
00D8  89 DF                             mov             edi,ebx
00DA  E8 00 00 00 00                    call            forcedecpt
00DF  83 C4 08                          add             esp,0x00000008
00E2  8C D8                             mov             eax,ds
00E4  C7 46 08 FF FF FF FF              mov             dword ptr 0x8[esi],0xffffffff
00EB                            L$11:
00EB  89 C2                             mov             edx,eax
00ED  89 F8                             mov             eax,edi
00EF  83 C4 08                          add             esp,0x00000008
00F2  5D                                pop             ebp
00F3  5F                                pop             edi
00F4  5E                                pop             esi
00F5  5B                                pop             ebx
00F6  C3                                ret
00F7                            forcedecpt:
00F7  53                                push            ebx
00F8  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00FC  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0100  8A 53 14                          mov             dl,byte ptr 0x14[ebx]
0103  80 E2 01                          and             dl,0x01
0106  81 E2 FF 00 00 00                 and             edx,0x000000ff
010C  75 4C                             jne             L$17
010E                            L$12:
010E  80 38 00                          cmp             byte ptr [eax],0x00
0111  74 11                             je              L$13
0113  31 D2                             xor             edx,edx
0115  8A 10                             mov             dl,byte ptr [eax]
0117  83 FA 65                          cmp             edx,0x00000065
011A  74 08                             je              L$13
011C  83 FA 45                          cmp             edx,0x00000045
011F  74 03                             je              L$13
0121  40                                inc             eax
0122  EB EA                             jmp             L$12
0124                            L$13:
0124  89 C2                             mov             edx,eax
0126  8A 5B 15                          mov             bl,byte ptr 0x15[ebx]
0129  81 E3 FF 00 00 00                 and             ebx,0x000000ff
012F  48                                dec             eax
0130  83 FB 47                          cmp             ebx,0x00000047
0133  74 05                             je              L$14
0135  83 FB 67                          cmp             ebx,0x00000067
0138  75 0C                             jne             L$15
013A                            L$14:
013A  31 DB                             xor             ebx,ebx
013C  8A 18                             mov             bl,byte ptr [eax]
013E  83 FB 30                          cmp             ebx,0x00000030
0141  75 03                             jne             L$15
0143  48                                dec             eax
0144  EB F4                             jmp             L$14
0146                            L$15:
0146  31 DB                             xor             ebx,ebx
0148  8A 18                             mov             bl,byte ptr [eax]
014A  83 FB 2E                          cmp             ebx,0x0000002e
014D  74 01                             je              L$16
014F  40                                inc             eax
0150                            L$16:
0150  8A 1A                             mov             bl,byte ptr [edx]
0152  42                                inc             edx
0153  88 18                             mov             byte ptr [eax],bl
0155  40                                inc             eax
0156  84 DB                             test            bl,bl
0158  75 F6                             jne             L$16
015A                            L$17:
015A  5B                                pop             ebx
015B  C3                                ret

Routine Size: 348 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

