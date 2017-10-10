Module: splitpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D0 bytes
0000                            copypart_:
0000  56                                push            esi
0001  57                                push            edi
0002  55                                push            ebp
0003  89 C5                             mov             ebp,eax
0005  85 C0                             test            eax,eax
0007  74 26                             je              L$2
0009  39 CB                             cmp             ebx,ecx
000B  7E 02                             jle             L$1
000D  89 CB                             mov             ebx,ecx
000F                            L$1:
000F  89 EF                             mov             edi,ebp
0011  89 D6                             mov             esi,edx
0013  89 D9                             mov             ecx,ebx
0015  06                                push            es
0016  8C D8                             mov             eax,ds
0018  8E C0                             mov             es,eax
001A  57                                push            edi
001B  89 C8                             mov             eax,ecx
001D  C1 E9 02                          shr             ecx,0x02
0020  F2 A5                             repne movsd
0022  8A C8                             mov             cl,al
0024  80 E1 03                          and             cl,0x03
0027  F2 A4                             repne movsb
0029  5F                                pop             edi
002A  07                                pop             es
002B  C6 04 2B 00                       mov             byte ptr [ebx+ebp],0x00
002F                            L$2:
002F  5D                                pop             ebp
0030  5F                                pop             edi
0031  5E                                pop             esi
0032  C3                                ret

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

0033                            _splitpath_:
0033  56                                push            esi
0034  57                                push            edi
0035  55                                push            ebp
0036  83 EC 04                          sub             esp,0x00000004
0039  89 C6                             mov             esi,eax
003B  89 0C 24                          mov             dword ptr [esp],ecx
003E  80 38 00                          cmp             byte ptr [eax],0x00
0041  74 1C                             je              L$4
0043  8A 4E 01                          mov             cl,byte ptr 0x1[esi]
0046  80 F9 3A                          cmp             cl,0x3a
0049  75 14                             jne             L$4
004B  85 D2                             test            edx,edx
004D  74 0B                             je              L$3
004F  8A 06                             mov             al,byte ptr [esi]
0051  C6 42 02 00                       mov             byte ptr 0x2[edx],0x00
0055  88 02                             mov             byte ptr [edx],al
0057  88 4A 01                          mov             byte ptr 0x1[edx],cl
005A                            L$3:
005A  83 C6 02                          add             esi,0x00000002
005D  EB 07                             jmp             L$5
005F                            L$4:
005F  85 D2                             test            edx,edx
0061  74 03                             je              L$5
0063  C6 02 00                          mov             byte ptr [edx],0x00
0066                            L$5:
0066  89 F5                             mov             ebp,esi
0068  89 F2                             mov             edx,esi
006A                            L$6:
006A  31 FF                             xor             edi,edi
006C                            L$7:
006C  8A 06                             mov             al,byte ptr [esi]
006E  84 C0                             test            al,al
0070  74 16                             je              L$10
0072  3C 2E                             cmp             al,0x2e
0074  75 05                             jne             L$8
0076  89 F7                             mov             edi,esi
0078  46                                inc             esi
0079  EB F1                             jmp             L$7
007B                            L$8:
007B  46                                inc             esi
007C  3C 5C                             cmp             al,0x5c
007E  74 04                             je              L$9
0080  3C 2F                             cmp             al,0x2f
0082  75 E8                             jne             L$7
0084                            L$9:
0084  89 F5                             mov             ebp,esi
0086  EB E2                             jmp             L$6
0088                            L$10:
0088  89 E9                             mov             ecx,ebp
008A  29 D1                             sub             ecx,edx
008C  89 D8                             mov             eax,ebx
008E  89 CB                             mov             ebx,ecx
0090  B9 FF 00 00 00                    mov             ecx,0x000000ff
0095  E8 00 00 00 00                    call            copypart_
009A  85 FF                             test            edi,edi
009C  75 02                             jne             L$11
009E  89 F7                             mov             edi,esi
00A0                            L$11:
00A0  8B 04 24                          mov             eax,dword ptr [esp]
00A3  B9 FF 00 00 00                    mov             ecx,0x000000ff
00A8  89 FB                             mov             ebx,edi
00AA  89 EA                             mov             edx,ebp
00AC  29 EB                             sub             ebx,ebp
00AE  E8 00 00 00 00                    call            copypart_
00B3  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
00B7  B9 FF 00 00 00                    mov             ecx,0x000000ff
00BC  89 F3                             mov             ebx,esi
00BE  89 FA                             mov             edx,edi
00C0  29 FB                             sub             ebx,edi
00C2  E8 00 00 00 00                    call            copypart_
00C7  83 C4 04                          add             esp,0x00000004
00CA  5D                                pop             ebp
00CB  5F                                pop             edi
00CC  5E                                pop             esi
00CD  C2 04 00                          ret             0x0004

Routine Size: 157 bytes,    Routine Base: _TEXT + 0033

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

