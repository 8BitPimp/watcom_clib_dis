Module: strstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C2 bytes
0000                            strstr_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  55                                push            ebp
0005  83 EC 04                          sub             esp,0x00000004
0008  89 C6                             mov             esi,eax
000A  89 D3                             mov             ebx,edx
000C  80 3A 00                          cmp             byte ptr [edx],0x00
000F  75 07                             jne             L$2
0011                            L$1:
0011  89 F0                             mov             eax,esi
0013  E9 A1 00 00 00                    jmp             L$13
0018                            L$2:
0018  80 7A 01 00                       cmp             byte ptr 0x1[edx],0x00
001C  75 20                             jne             L$6
001E  8A 13                             mov             dl,byte ptr [ebx]
0020                            L$3:
0020  8A 06                             mov             al,byte ptr [esi]
0022  3A C2                             cmp             al,dl
0024  74 16                             je              L$5
0026  3C 00                             cmp             al,0x00
0028  0F 84 0C 00 00 00                 je              L$4
002E  46                                inc             esi
002F  8A 06                             mov             al,byte ptr [esi]
0031  3A C2                             cmp             al,dl
0033  74 07                             je              L$5
0035  46                                inc             esi
0036  3C 00                             cmp             al,0x00
0038  75 E6                             jne             L$3
003A                            L$4:
003A  2B F6                             sub             esi,esi
003C                            L$5:
003C  EB D3                             jmp             L$1
003E                            L$6:
003E  B9 FF FF FF FF                    mov             ecx,0xffffffff
0043  89 F7                             mov             edi,esi
0045  30 C0                             xor             al,al
0047  06                                push            es
0048  E3 0B                             jecxz           L$7
004A  8C DA                             mov             edx,ds
004C  8E C2                             mov             es,edx
004E  F2 AE                             repne scasb
0050  75 03                             jne             L$7
0052  4F                                dec             edi
0053  66 A9                                           f.
0055                            L$7:
0055  89 CF                             mov             edi,ecx
0057  07                                pop             es
0058  89 3C 24                          mov             dword ptr [esp],edi
005B  89 DF                             mov             edi,ebx
005D  06                                push            es
005E  8C D8                             mov             eax,ds
0060  8E C0                             mov             es,eax
0062  29 C9                             sub             ecx,ecx
0064  49                                dec             ecx
0065  31 C0                             xor             eax,eax
0067  F2 AE                             repne scasb
0069  F7 D1                             not             ecx
006B  49                                dec             ecx
006C  07                                pop             es
006D  89 CD                             mov             ebp,ecx
006F                            L$8:
006F  8B 0C 24                          mov             ecx,dword ptr [esp]
0072  29 F1                             sub             ecx,esi
0074  39 E9                             cmp             ecx,ebp
0076  7C 3F                             jl              L$12
0078  89 F7                             mov             edi,esi
007A  8A 03                             mov             al,byte ptr [ebx]
007C  06                                push            es
007D  E3 0B                             jecxz           L$9
007F  8C DA                             mov             edx,ds
0081  8E C2                             mov             es,edx
0083  F2 AE                             repne scasb
0085  75 03                             jne             L$9
0087  4F                                dec             edi
0088  66 A9                                           f.
008A                            L$9:
008A  89 CF                             mov             edi,ecx
008C  07                                pop             es
008D  89 FA                             mov             edx,edi
008F  85 FF                             test            edi,edi
0091  74 24                             je              L$12
0093  89 FE                             mov             esi,edi
0095  89 E9                             mov             ecx,ebp
0097  89 DF                             mov             edi,ebx
0099  06                                push            es
009A  8C D8                             mov             eax,ds
009C  8E C0                             mov             es,eax
009E  31 C0                             xor             eax,eax
00A0  F3 A6                             repe cmpsb
00A2  74 05                             je              L$10
00A4  19 C0                             sbb             eax,eax
00A6  83 D8 FF                          sbb             eax,0xffffffff
00A9                            L$10:
00A9  07                                pop             es
00AA  85 C0                             test            eax,eax
00AC  75 04                             jne             L$11
00AE  89 D0                             mov             eax,edx
00B0  EB 07                             jmp             L$13
00B2                            L$11:
00B2  8D 72 01                          lea             esi,0x1[edx]
00B5  EB B8                             jmp             L$8
00B7                            L$12:
00B7  31 C0                             xor             eax,eax
00B9                            L$13:
00B9  83 C4 04                          add             esp,0x00000004
00BC  5D                                pop             ebp
00BD  5F                                pop             edi
00BE  5E                                pop             esi
00BF  59                                pop             ecx
00C0  5B                                pop             ebx
00C1  C3                                ret

Routine Size: 194 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

