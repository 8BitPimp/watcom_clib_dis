Module: strpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000055 bytes
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
001A  EB 2C                             jmp             L$3
001C                            L$1:
001C  31 C0                             xor             eax,eax
001E  88 C8                             mov             al,cl
0020  C1 F8 03                          sar             eax,0x03
0023  31 D2                             xor             edx,edx
0025  8A 14 04                          mov             dl,byte ptr [esp+eax]
0028  88 C8                             mov             al,cl
002A  24 07                             and             al,0x07
002C  25 FF 00 00 00                    and             eax,0x000000ff
0031  8A 80 00 00 00 00                 mov             al,byte ptr _Bits[eax]
0037  25 FF 00 00 00                    and             eax,0x000000ff
003C  85 C2                             test            edx,eax
003E  74 07                             je              L$2
0040  89 D8                             mov             eax,ebx
0042  83 C4 20                          add             esp,0x00000020
0045  5B                                pop             ebx
0046  C3                                ret
0047                            L$2:
0047  43                                inc             ebx
0048                            L$3:
0048  8A 0B                             mov             cl,byte ptr [ebx]
004A  84 C9                             test            cl,cl
004C  75 CE                             jne             L$1
004E  31 C0                             xor             eax,eax
0050  83 C4 20                          add             esp,0x00000020
0053  5B                                pop             ebx
0054  C3                                ret

Routine Size: 85 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

