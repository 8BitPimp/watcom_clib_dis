Module: mbsnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001F7 bytes
0000                            _mbsnset:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
000B  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
000F  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0015  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
0019  85 D2                             test            edx,edx
001B  0F 84 B5 00 00 00                 je              L$9
0021  85 FF                             test            edi,edi
0023  75 07                             jne             L$1
0025  89 F0                             mov             eax,esi
0027  E9 B5 00 00 00                    jmp             L$11
002C                            L$1:
002C  55                                push            ebp
002D  E8 00 00 00 00                    call            _ismbclegal
0032  83 C4 04                          add             esp,0x00000004
0035  89 C3                             mov             ebx,eax
0037  85 C0                             test            eax,eax
0039  0F 95 C0                          setne           al
003C  25 FF 00 00 00                    and             eax,0x000000ff
0041  40                                inc             eax
0042  0F AF F8                          imul            edi,eax
0045  89 7C 24 08                       mov             dword ptr 0x8[esp],edi
0049  89 F7                             mov             edi,esi
004B  06                                push            es
004C  8C D8                             mov             eax,ds
004E  8E C0                             mov             es,eax
0050  29 C9                             sub             ecx,ecx
0052  49                                dec             ecx
0053  31 C0                             xor             eax,eax
0055  F2 AE                             repne scasb
0057  F7 D1                             not             ecx
0059  49                                dec             ecx
005A  07                                pop             es
005B  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
005F  89 CF                             mov             edi,ecx
0061  39 C1                             cmp             ecx,eax
0063  76 0A                             jbe             L$2
0065  31 C9                             xor             ecx,ecx
0067  89 C7                             mov             edi,eax
0069  89 4C 24 04                       mov             dword ptr 0x4[esp],ecx
006D  EB 08                             jmp             L$3
006F                            L$2:
006F  C7 44 24 04 01 00 00 00           mov             dword ptr 0x4[esp],0x00000001
0077                            L$3:
0077  85 DB                             test            ebx,ebx
0079  74 4A                             je              L$7
007B  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
007F  50                                push            eax
0080  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
0084  52                                push            edx
0085  E8 00 00 00 00                    call            _mbsbtype
008A  83 C4 08                          add             esp,0x00000008
008D  89 04 24                          mov             dword ptr [esp],eax
0090  89 F8                             mov             eax,edi
0092  31 DB                             xor             ebx,ebx
0094  83 E0 01                          and             eax,0x00000001
0097  D1 EF                             shr             edi,0x01
0099  89 44 24 08                       mov             dword ptr 0x8[esp],eax
009D  EB 0D                             jmp             L$5
009F                            L$4:
009F  55                                push            ebp
00A0  56                                push            esi
00A1  43                                inc             ebx
00A2  E8 00 00 00 00                    call            _mbputchar
00A7  83 C4 08                          add             esp,0x00000008
00AA  89 C6                             mov             esi,eax
00AC                            L$5:
00AC  39 FB                             cmp             ebx,edi
00AE  72 EF                             jb              L$4
00B0  83 3C 24 01                       cmp             dword ptr [esp],0x00000001
00B4  74 0A                             je              L$6
00B6  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00BA  85 44 24 08                       test            dword ptr 0x8[esp],eax
00BE  74 10                             je              L$8
00C0                            L$6:
00C0  C6 06 20                          mov             byte ptr [esi],0x20
00C3  EB 0B                             jmp             L$8
00C5                            L$7:
00C5  57                                push            edi
00C6  55                                push            ebp
00C7  56                                push            esi
00C8  E8 00 00 00 00                    call            memset
00CD  83 C4 0C                          add             esp,0x0000000c
00D0                            L$8:
00D0  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
00D4  EB 0B                             jmp             L$11
00D6                            L$9:
00D6  57                                push            edi
00D7                            L$10:
00D7  55                                push            ebp
00D8  56                                push            esi
00D9  E8 00 00 00 00                    call            strnset
00DE  83 C4 0C                          add             esp,0x0000000c
00E1                            L$11:
00E1  83 C4 0C                          add             esp,0x0000000c
00E4  5D                                pop             ebp
00E5  5F                                pop             edi
00E6  5E                                pop             esi
00E7  5B                                pop             ebx
00E8  C3                                ret

Routine Size: 233 bytes,    Routine Base: _TEXT + 0000

00E9                            _mbsnbset:
00E9  53                                push            ebx
00EA  56                                push            esi
00EB  57                                push            edi
00EC  55                                push            ebp
00ED  83 EC 0C                          sub             esp,0x0000000c
00F0  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
00F4  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
00F8  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
00FE  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
0102  85 D2                             test            edx,edx
0104  0F 84 A3 00 00 00                 je              L$20
010A  85 DB                             test            ebx,ebx
010C  75 04                             jne             L$12
010E  89 F0                             mov             eax,esi
0110  EB CF                             jmp             L$11
0112                            L$12:
0112  55                                push            ebp
0113  E8 00 00 00 00                    call            _ismbclegal
0118  83 C4 04                          add             esp,0x00000004
011B  89 F7                             mov             edi,esi
011D  89 C2                             mov             edx,eax
011F  06                                push            es
0120  8C D8                             mov             eax,ds
0122  8E C0                             mov             es,eax
0124  29 C9                             sub             ecx,ecx
0126  49                                dec             ecx
0127  31 C0                             xor             eax,eax
0129  F2 AE                             repne scasb
012B  F7 D1                             not             ecx
012D  49                                dec             ecx
012E  07                                pop             es
012F  89 5C 24 08                       mov             dword ptr 0x8[esp],ebx
0133  89 CF                             mov             edi,ecx
0135  39 D9                             cmp             ecx,ebx
0137  76 0A                             jbe             L$13
0139  31 C0                             xor             eax,eax
013B  89 DF                             mov             edi,ebx
013D  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0141  EB 08                             jmp             L$14
0143                            L$13:
0143  C7 44 24 04 01 00 00 00           mov             dword ptr 0x4[esp],0x00000001
014B                            L$14:
014B  85 D2                             test            edx,edx
014D  74 4A                             je              L$18
014F  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0153  52                                push            edx
0154  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0158  53                                push            ebx
0159  E8 00 00 00 00                    call            _mbsbtype
015E  83 C4 08                          add             esp,0x00000008
0161  89 04 24                          mov             dword ptr [esp],eax
0164  89 F8                             mov             eax,edi
0166  31 DB                             xor             ebx,ebx
0168  83 E0 01                          and             eax,0x00000001
016B  D1 EF                             shr             edi,0x01
016D  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0171  EB 0D                             jmp             L$16
0173                            L$15:
0173  55                                push            ebp
0174  56                                push            esi
0175  43                                inc             ebx
0176  E8 00 00 00 00                    call            _mbputchar
017B  83 C4 08                          add             esp,0x00000008
017E  89 C6                             mov             esi,eax
0180                            L$16:
0180  39 FB                             cmp             ebx,edi
0182  72 EF                             jb              L$15
0184  83 3C 24 01                       cmp             dword ptr [esp],0x00000001
0188  74 0A                             je              L$17
018A  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
018E  85 44 24 08                       test            dword ptr 0x8[esp],eax
0192  74 10                             je              L$19
0194                            L$17:
0194  C6 06 20                          mov             byte ptr [esi],0x20
0197  EB 0B                             jmp             L$19
0199                            L$18:
0199  57                                push            edi
019A  55                                push            ebp
019B  56                                push            esi
019C  E8 00 00 00 00                    call            memset
01A1  83 C4 0C                          add             esp,0x0000000c
01A4                            L$19:
01A4  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
01A8  E9 34 FF FF FF                    jmp             L$11
01AD                            L$20:
01AD  53                                push            ebx
01AE  E9 24 FF FF FF                    jmp             L$10

Routine Size: 202 bytes,    Routine Base: _TEXT + 00E9

01B3                            _mbsset:
01B3  56                                push            esi
01B4  57                                push            edi
01B5  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
01B9  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
01C0  74 24                             je              L$21
01C2  89 D7                             mov             edi,edx
01C4  06                                push            es
01C5  8C D8                             mov             eax,ds
01C7  8E C0                             mov             es,eax
01C9  29 C9                             sub             ecx,ecx
01CB  49                                dec             ecx
01CC  31 C0                             xor             eax,eax
01CE  F2 AE                             repne scasb
01D0  F7 D1                             not             ecx
01D2  49                                dec             ecx
01D3  07                                pop             es
01D4  51                                push            ecx
01D5  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
01D9  56                                push            esi
01DA  52                                push            edx
01DB  E8 00 00 00 00                    call            _mbsnset
01E0  83 C4 0C                          add             esp,0x0000000c
01E3  5F                                pop             edi
01E4  5E                                pop             esi
01E5  C3                                ret
01E6                            L$21:
01E6  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
01EA  51                                push            ecx
01EB  52                                push            edx
01EC  E8 00 00 00 00                    call            strset
01F1  83 C4 08                          add             esp,0x00000008
01F4  5F                                pop             edi
01F5  5E                                pop             esi
01F6  C3                                ret

Routine Size: 68 bytes,    Routine Base: _TEXT + 01B3

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

