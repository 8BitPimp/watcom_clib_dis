Module: strcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000                            strcat_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  89 C7                             mov             edi,eax
0005  89 D6                             mov             esi,edx
0007  06                                push            es
0008  1E                                push            ds
0009  07                                pop             es
000A  57                                push            edi
000B  2B C9                             sub             ecx,ecx
000D  49                                dec             ecx
000E  B0 00                             mov             al,0x00
0010  F2 AE                             repne scasb
0012  4F                                dec             edi
0013                            L$1:
0013  8A 06                             mov             al,byte ptr [esi]
0015  88 07                             mov             byte ptr [edi],al
0017  3C 00                             cmp             al,0x00
0019  0F 84 10 00 00 00                 je              L$2
001F  8A 46 01                          mov             al,byte ptr 0x1[esi]
0022  83 C6 02                          add             esi,0x00000002
0025  88 47 01                          mov             byte ptr 0x1[edi],al
0028  83 C7 02                          add             edi,0x00000002
002B  3C 00                             cmp             al,0x00
002D  75 E4                             jne             L$1
002F                            L$2:
002F  5F                                pop             edi
0030  07                                pop             es
0031  89 F8                             mov             eax,edi
0033  5F                                pop             edi
0034  5E                                pop             esi
0035  59                                pop             ecx
0036  C3                                ret

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

