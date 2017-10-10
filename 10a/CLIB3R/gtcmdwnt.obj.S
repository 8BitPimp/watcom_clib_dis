Module: gtcmdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000098 bytes
0000                            _bgetcmd_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  89 C6                             mov             esi,eax
0005  89 D3                             mov             ebx,edx
0007  E8 00 00 00 00                    call            _GetCommandLineA
000C  85 C0                             test            eax,eax
000E  75 12                             jne             L$2
0010  85 F6                             test            esi,esi
0012  74 07                             je              L$1
0014  85 DB                             test            ebx,ebx
0016  74 03                             je              L$1
0018  C6 06 00                          mov             byte ptr [esi],0x00
001B                            L$1:
001B  31 D2                             xor             edx,edx
001D  E9 5D 00 00 00                    jmp             L$11
0022                            L$2:
0022  8A 10                             mov             dl,byte ptr [eax]
0024  FE C2                             inc             dl
0026  81 E2 FF 00 00 00                 and             edx,0x000000ff
002C  F6 82 00 00 00 00 02              test            byte ptr __IsTable[edx],0x02
0033  75 08                             jne             L$3
0035  80 38 00                          cmp             byte ptr [eax],0x00
0038  74 03                             je              L$3
003A  40                                inc             eax
003B  EB E5                             jmp             L$2
003D                            L$3:
003D  8A 10                             mov             dl,byte ptr [eax]
003F  FE C2                             inc             dl
0041  81 E2 FF 00 00 00                 and             edx,0x000000ff
0047  F6 82 00 00 00 00 02              test            byte ptr __IsTable[edx],0x02
004E  74 03                             je              L$4
0050  40                                inc             eax
0051  EB EA                             jmp             L$3
0053                            L$4:
0053  85 F6                             test            esi,esi
0055  75 0E                             jne             L$7
0057  89 C2                             mov             edx,eax
0059  EB 01                             jmp             L$6
005B                            L$5:
005B  42                                inc             edx
005C                            L$6:
005C  80 3A 00                          cmp             byte ptr [edx],0x00
005F  75 FA                             jne             L$5
0061  29 C2                             sub             edx,eax
0063  EB 1A                             jmp             L$11
0065                            L$7:
0065  85 DB                             test            ebx,ebx
0067  74 B2                             je              L$1
0069  89 F2                             mov             edx,esi
006B  EB 0A                             jmp             L$9
006D                            L$8:
006D  8A 28                             mov             ch,byte ptr [eax]
006F  84 ED                             test            ch,ch
0071  74 07                             je              L$10
0073  40                                inc             eax
0074  88 2A                             mov             byte ptr [edx],ch
0076  42                                inc             edx
0077                            L$9:
0077  4B                                dec             ebx
0078  75 F3                             jne             L$8
007A                            L$10:
007A  C6 02 00                          mov             byte ptr [edx],0x00
007D  29 F2                             sub             edx,esi
007F                            L$11:
007F  89 D0                             mov             eax,edx
0081  5E                                pop             esi
0082  59                                pop             ecx
0083  5B                                pop             ebx
0084  C3                                ret

Routine Size: 133 bytes,    Routine Base: _TEXT + 0000

0085                            getcmd_:
0085  53                                push            ebx
0086  52                                push            edx
0087  89 C3                             mov             ebx,eax
0089  BA FF FF FF 7F                    mov             edx,0x7fffffff
008E  E8 00 00 00 00                    call            _bgetcmd_
0093  89 D8                             mov             eax,ebx
0095  5A                                pop             edx
0096  5B                                pop             ebx
0097  C3                                ret

Routine Size: 19 bytes,    Routine Base: _TEXT + 0085

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

