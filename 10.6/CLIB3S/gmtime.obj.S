Module: gmtime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000017B bytes
0000                            __brktime:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
000B  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
000F  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0013  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0017  81 FB C0 A8 00 00                 cmp             ebx,0x0000a8c0
001D  73 1C                             jae             L$1
001F  85 C0                             test            eax,eax
0021  7E 18                             jle             L$1
0023  81 C3 80 51 01 00                 add             ebx,0x00015180
0029  BE 80 51 01 00                    mov             esi,0x00015180
002E  29 C3                             sub             ebx,eax
0030  31 D2                             xor             edx,edx
0032  89 D8                             mov             eax,ebx
0034  F7 F6                             div             esi
0036  01 C5                             add             ebp,eax
0038  4D                                dec             ebp
0039  EB 0F                             jmp             L$2
003B                            L$1:
003B  BE 80 51 01 00                    mov             esi,0x00015180
0040  29 C3                             sub             ebx,eax
0042  31 D2                             xor             edx,edx
0044  89 D8                             mov             eax,ebx
0046  F7 F6                             div             esi
0048  01 C5                             add             ebp,eax
004A                            L$2:
004A  BE 80 51 01 00                    mov             esi,0x00015180
004F  89 D8                             mov             eax,ebx
0051  31 D2                             xor             edx,edx
0053  F7 F6                             div             esi
0055  89 D3                             mov             ebx,edx
0057  BE 10 0E 00 00                    mov             esi,0x00000e10
005C  89 D8                             mov             eax,ebx
005E  31 D2                             xor             edx,edx
0060  F7 F6                             div             esi
0062  31 D2                             xor             edx,edx
0064  89 47 08                          mov             dword ptr 0x8[edi],eax
0067  89 D8                             mov             eax,ebx
0069  F7 F6                             div             esi
006B  89 D3                             mov             ebx,edx
006D  BE 3C 00 00 00                    mov             esi,0x0000003c
0072  89 D8                             mov             eax,ebx
0074  31 D2                             xor             edx,edx
0076  F7 F6                             div             esi
0078  31 D2                             xor             edx,edx
007A  89 47 04                          mov             dword ptr 0x4[edi],eax
007D  89 D8                             mov             eax,ebx
007F  F7 F6                             div             esi
0081  BB 6E 01 00 00                    mov             ebx,0x0000016e
0086  89 E8                             mov             eax,ebp
0088  89 17                             mov             dword ptr [edi],edx
008A  31 D2                             xor             edx,edx
008C  F7 F3                             div             ebx
008E  89 C6                             mov             esi,eax
0090  C1 E0 03                          shl             eax,0x03
0093  01 F0                             add             eax,esi
0095  C1 E0 03                          shl             eax,0x03
0098  01 F0                             add             eax,esi
009A  89 C3                             mov             ebx,eax
009C  C1 E0 02                          shl             eax,0x02
009F  01 D8                             add             eax,ebx
00A1  89 EB                             mov             ebx,ebp
00A3  29 C3                             sub             ebx,eax
00A5  85 F6                             test            esi,esi
00A7  76 08                             jbe             L$3
00A9  8D 46 FF                          lea             eax,-0x1[esi]
00AC  C1 E8 02                          shr             eax,0x02
00AF  29 C3                             sub             ebx,eax
00B1                            L$3:
00B1  8D 86 6C 07 00 00                 lea             eax,0x76c[esi]
00B7  50                                push            eax
00B8  E8 00 00 00 00                    call            __leapyear
00BD  83 C4 04                          add             esp,0x00000004
00C0  05 6D 01 00 00                    add             eax,0x0000016d
00C5                            L$4:
00C5  39 C3                             cmp             ebx,eax
00C7  72 05                             jb              L$5
00C9  46                                inc             esi
00CA  29 C3                             sub             ebx,eax
00CC  EB F7                             jmp             L$4
00CE                            L$5:
00CE  89 77 14                          mov             dword ptr 0x14[edi],esi
00D1  81 C6 6C 07 00 00                 add             esi,0x0000076c
00D7  BA 00 00 00 00                    mov             edx,offset __diyr
00DC  56                                push            esi
00DD  89 5F 1C                          mov             dword ptr 0x1c[edi],ebx
00E0  89 54 24 04                       mov             dword ptr 0x4[esp],edx
00E4  E8 00 00 00 00                    call            __leapyear
00E9  83 C4 04                          add             esp,0x00000004
00EC  85 C0                             test            eax,eax
00EE  74 07                             je              L$6
00F0  C7 04 24 00 00 00 00              mov             dword ptr [esp],offset __dilyr
00F7                            L$6:
00F7  BE 1F 00 00 00                    mov             esi,0x0000001f
00FC  89 D8                             mov             eax,ebx
00FE  31 D2                             xor             edx,edx
0100  F7 F6                             div             esi
0102  8B 14 24                          mov             edx,dword ptr [esp]
0105  8D 34 00                          lea             esi,[eax+eax]
0108  01 D6                             add             esi,edx
010A  8B 36                             mov             esi,dword ptr [esi]
010C  C1 FE 10                          sar             esi,0x10
010F  39 F3                             cmp             ebx,esi
0111  72 01                             jb              L$7
0113  40                                inc             eax
0114                            L$7:
0114  8B 0C 24                          mov             ecx,dword ptr [esp]
0117  89 47 10                          mov             dword ptr 0x10[edi],eax
011A  01 C0                             add             eax,eax
011C  01 C8                             add             eax,ecx
011E  0F BF 00                          movsx           eax,word ptr [eax]
0121  29 C3                             sub             ebx,eax
0123  31 D2                             xor             edx,edx
0125  43                                inc             ebx
0126  8D 45 01                          lea             eax,0x1[ebp]
0129  89 5F 0C                          mov             dword ptr 0xc[edi],ebx
012C  BB 07 00 00 00                    mov             ebx,0x00000007
0131  F7 F3                             div             ebx
0133  89 F8                             mov             eax,edi
0135  89 57 18                          mov             dword ptr 0x18[edi],edx
0138  83 C4 04                          add             esp,0x00000004
013B  5D                                pop             ebp
013C  5F                                pop             edi
013D  5E                                pop             esi
013E  5B                                pop             ebx
013F  C3                                ret

Routine Size: 320 bytes,    Routine Base: _TEXT + 0000

0140                            _gmtime:
0140  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0144  50                                push            eax
0145  C7 40 20 00 00 00 00              mov             dword ptr 0x20[eax],0x00000000
014C  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0150  6A 00                             push            0x00000000
0152  8B 10                             mov             edx,dword ptr [eax]
0154  52                                push            edx
0155  68 DF 63 00 00                    push            0x000063df
015A  E8 00 00 00 00                    call            __brktime
015F  83 C4 10                          add             esp,0x00000010
0162  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 0140

0163                            gmtime:
0163  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0169  83 C0 14                          add             eax,0x00000014
016C  50                                push            eax
016D  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0171  52                                push            edx
0172  E8 00 00 00 00                    call            _gmtime
0177  83 C4 08                          add             esp,0x00000008
017A  C3                                ret

Routine Size: 24 bytes,    Routine Base: _TEXT + 0163

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

