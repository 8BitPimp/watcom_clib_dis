Module: mbslen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A2 bytes
0000                            _mbslen:
0000  57                                push            edi
0001  83 EC 04                          sub             esp,0x00000004
0004  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0008  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
000E  31 FF                             xor             edi,edi
0010  85 D2                             test            edx,edx
0012  74 1C                             je              L$3
0014                            L$1:
0014  89 E2                             mov             edx,esp
0016  52                                push            edx
0017  50                                push            eax
0018  E8 00 00 00 00                    call            _mbgetcode
001D  83 C4 08                          add             esp,0x00000008
0020  83 3C 24 00                       cmp             dword ptr [esp],0x00000000
0024  74 03                             je              L$2
0026  47                                inc             edi
0027  EB EB                             jmp             L$1
0029                            L$2:
0029  89 F8                             mov             eax,edi
002B  83 C4 04                          add             esp,0x00000004
002E  5F                                pop             edi
002F  C3                                ret
0030                            L$3:
0030  89 C7                             mov             edi,eax
0032  06                                push            es
0033  8C D8                             mov             eax,ds
0035  8E C0                             mov             es,eax
0037  29 C9                             sub             ecx,ecx
0039  49                                dec             ecx
003A  31 C0                             xor             eax,eax
003C  F2 AE                             repne scasb
003E  F7 D1                             not             ecx
0040  49                                dec             ecx
0041  07                                pop             es
0042  89 C8                             mov             eax,ecx
0044  83 C4 04                          add             esp,0x00000004
0047  5F                                pop             edi
0048  C3                                ret

Routine Size: 73 bytes,    Routine Base: _TEXT + 0000

0049                            __mbslen:
0049  53                                push            ebx
004A  57                                push            edi
004B  8B 7C 24 0C                       mov             edi,dword ptr 0xc[esp]
004F  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
0055  31 C9                             xor             ecx,ecx
0057  85 D2                             test            edx,edx
0059  74 32                             je              L$7
005B  8B 1D 00 00 00 00                 mov             ebx,dword ptr __IsDBCS
0061                            L$4:
0061  80 3F 00                          cmp             byte ptr [edi],0x00
0064  74 37                             je              L$8
0066  85 DB                             test            ebx,ebx
0068  74 13                             je              L$5
006A  31 C0                             xor             eax,eax
006C  8A 07                             mov             al,byte ptr [edi]
006E  8A 80 01 00 00 00                 mov             al,byte ptr __MBCSIsTable+0x1[eax]
0074  24 01                             and             al,0x01
0076  25 FF 00 00 00                    and             eax,0x000000ff
007B  EB 02                             jmp             L$6
007D                            L$5:
007D  31 C0                             xor             eax,eax
007F                            L$6:
007F  0F 95 C0                          setne           al
0082  25 FF 00 00 00                    and             eax,0x000000ff
0087  40                                inc             eax
0088  41                                inc             ecx
0089  01 C7                             add             edi,eax
008B  EB D4                             jmp             L$4
008D                            L$7:
008D  06                                push            es
008E  8C D8                             mov             eax,ds
0090  8E C0                             mov             es,eax
0092  29 C9                             sub             ecx,ecx
0094  49                                dec             ecx
0095  31 C0                             xor             eax,eax
0097  F2 AE                             repne scasb
0099  F7 D1                             not             ecx
009B  49                                dec             ecx
009C  07                                pop             es
009D                            L$8:
009D  89 C8                             mov             eax,ecx
009F  5F                                pop             edi
00A0  5B                                pop             ebx
00A1  C3                                ret

Routine Size: 89 bytes,    Routine Base: _TEXT + 0049

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

