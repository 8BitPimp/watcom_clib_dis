Module: strpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000                            strpbrk:
0000  53                                push            ebx
0001  83 EC 20                          sub             esp,0x00000020
0004  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
0008  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
000C  52                                push            edx
000D  8D 44 24 04                       lea             eax,0x4[esp]
0011  50                                push            eax
0012  E8 00 00 00 00                    call            __setbits
0017  83 C4 08                          add             esp,0x00000008
001A  EB 2E                             jmp             L$3
001C                            L$1:
001C  31 D2                             xor             edx,edx
001E  88 C2                             mov             dl,al
0020  C1 FA 03                          sar             edx,0x03
0023  8A 14 14                          mov             dl,byte ptr [esp+edx]
0026  81 E2 FF 00 00 00                 and             edx,0x000000ff
002C  24 07                             and             al,0x07
002E  25 FF 00 00 00                    and             eax,0x000000ff
0033  8A 80 00 00 00 00                 mov             al,byte ptr _Bits[eax]
0039  25 FF 00 00 00                    and             eax,0x000000ff
003E  85 C2                             test            edx,eax
0040  74 07                             je              L$2
0042  89 D8                             mov             eax,ebx
0044  83 C4 20                          add             esp,0x00000020
0047  5B                                pop             ebx
0048  C3                                ret
0049                            L$2:
0049  43                                inc             ebx
004A                            L$3:
004A  8A 03                             mov             al,byte ptr [ebx]
004C  84 C0                             test            al,al
004E  75 CC                             jne             L$1
0050  31 C0                             xor             eax,eax
0052  83 C4 20                          add             esp,0x00000020
0055  5B                                pop             ebx
0056  C3                                ret

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

