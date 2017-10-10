Module: bits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000                            __setbits:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  6A 20                             push            0x00000020
000C  6A 00                             push            0x00000000
000E  56                                push            esi
000F  E8 00 00 00 00                    call            memset
0014  83 C4 0C                          add             esp,0x0000000c
0017  EB 1F                             jmp             L$2
0019                            L$1:
0019  31 C0                             xor             eax,eax
001B  88 D0                             mov             al,dl
001D  C1 F8 03                          sar             eax,0x03
0020  80 E2 07                          and             dl,0x07
0023  81 E2 FF 00 00 00                 and             edx,0x000000ff
0029  8A 92 00 00 00 00                 mov             dl,byte ptr _Bits[edx]
002F  8A 34 06                          mov             dh,byte ptr [esi+eax]
0032  08 D6                             or              dh,dl
0034  43                                inc             ebx
0035  88 34 06                          mov             byte ptr [esi+eax],dh
0038                            L$2:
0038  8A 13                             mov             dl,byte ptr [ebx]
003A  84 D2                             test            dl,dl
003C  75 DB                             jne             L$1
003E  5E                                pop             esi
003F  5B                                pop             ebx
0040  C3                                ret

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000                            _Bits:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

