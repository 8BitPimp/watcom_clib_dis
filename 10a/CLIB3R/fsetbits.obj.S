Module: fsetbits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005D bytes
0000                            __fsetbits_:
0000  56                                push            esi
0001  57                                push            edi
0002  06                                push            es
0003  0F A0                             push            fs
0005  0F A8                             push            gs
0007  8E EA                             mov             gs,edx
0009  89 C6                             mov             esi,eax
000B  8E C1                             mov             es,ecx
000D  B9 20 00 00 00                    mov             ecx,0x00000020
0012  89 C7                             mov             edi,eax
0014  30 C0                             xor             al,al
0016  06                                push            es
0017  57                                push            edi
0018  8E C2                             mov             es,edx
001A  88 C4                             mov             ah,al
001C  D1 E9                             shr             ecx,0x01
001E  F2 66 AB                          repne stosw
0021  11 C9                             adc             ecx,ecx
0023  F2 AA                             repne stosb
0025  5F                                pop             edi
0026  07                                pop             es
0027  EB 25                             jmp             L$2
0029                            L$1:
0029  31 C0                             xor             eax,eax
002B  8C E9                             mov             ecx,gs
002D  88 D0                             mov             al,dl
002F  8E E1                             mov             fs,ecx
0031  C1 F8 03                          sar             eax,0x03
0034  80 E2 07                          and             dl,0x07
0037  81 E2 FF 00 00 00                 and             edx,0x000000ff
003D  8A 92 00 00 00 00                 mov             dl,byte ptr __Bits[edx]
0043  64 8A 34 06                       mov             dh,byte ptr fs:[esi+eax]
0047  08 D6                             or              dh,dl
0049  43                                inc             ebx
004A  64 88 34 06                       mov             byte ptr fs:[esi+eax],dh
004E                            L$2:
004E  26 8A 13                          mov             dl,byte ptr es:[ebx]
0051  84 D2                             test            dl,dl
0053  75 D4                             jne             L$1
0055  0F A9                             pop             gs
0057  0F A1                             pop             fs
0059  07                                pop             es
005A  5F                                pop             edi
005B  5E                                pop             esi
005C  C3                                ret

Routine Size: 93 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

