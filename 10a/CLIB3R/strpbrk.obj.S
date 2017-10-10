Module: strpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000047 bytes
0000                            strpbrk_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  83 EC 20                          sub             esp,0x00000020
0005  89 C3                             mov             ebx,eax
0007  89 E0                             mov             eax,esp
0009  E8 00 00 00 00                    call            __setbits_
000E  EB 29                             jmp             L$3
0010                            L$1:
0010  31 C0                             xor             eax,eax
0012  88 C8                             mov             al,cl
0014  C1 F8 03                          sar             eax,0x03
0017  31 D2                             xor             edx,edx
0019  8A 14 04                          mov             dl,byte ptr [esp+eax]
001C  88 C8                             mov             al,cl
001E  24 07                             and             al,0x07
0020  25 FF 00 00 00                    and             eax,0x000000ff
0025  8A 80 00 00 00 00                 mov             al,byte ptr __Bits[eax]
002B  25 FF 00 00 00                    and             eax,0x000000ff
0030  85 C2                             test            edx,eax
0032  74 04                             je              L$2
0034  89 D8                             mov             eax,ebx
0036  EB 09                             jmp             L$4
0038                            L$2:
0038  43                                inc             ebx
0039                            L$3:
0039  8A 0B                             mov             cl,byte ptr [ebx]
003B  84 C9                             test            cl,cl
003D  75 D1                             jne             L$1
003F  31 C0                             xor             eax,eax
0041                            L$4:
0041  83 C4 20                          add             esp,0x00000020
0044  59                                pop             ecx
0045  5B                                pop             ebx
0046  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

