Module: fstrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000                            _fstrpbrk:
0000  53                                push            ebx
0001  06                                push            es
0002  83 EC 20                          sub             esp,0x00000020
0005  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0009  31 C0                             xor             eax,eax
000B  66 8B 44 24 38                    mov             ax,word ptr 0x38[esp]
0010  50                                push            eax
0011  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
0015  52                                push            edx
0016  8C D8                             mov             eax,ds
0018  8D 54 24 08                       lea             edx,0x8[esp]
001C  25 FF FF 00 00                    and             eax,0x0000ffff
0021  50                                push            eax
0022  52                                push            edx
0023  E8 00 00 00 00                    call            __fsetbits
0028  83 C4 10                          add             esp,0x00000010
002B  8E 44 24 30                       mov             es,dword ptr 0x30[esp]
002F  EB 2B                             jmp             L$3
0031                            L$1:
0031  31 C0                             xor             eax,eax
0033  88 C8                             mov             al,cl
0035  C1 F8 03                          sar             eax,0x03
0038  31 D2                             xor             edx,edx
003A  8A 14 04                          mov             dl,byte ptr [esp+eax]
003D  88 C8                             mov             al,cl
003F  24 07                             and             al,0x07
0041  25 FF 00 00 00                    and             eax,0x000000ff
0046  8A 80 00 00 00 00                 mov             al,byte ptr _Bits[eax]
004C  25 FF 00 00 00                    and             eax,0x000000ff
0051  85 C2                             test            edx,eax
0053  74 06                             je              L$2
0055  8C C2                             mov             edx,es
0057  89 D8                             mov             eax,ebx
0059  EB 0C                             jmp             L$4
005B                            L$2:
005B  43                                inc             ebx
005C                            L$3:
005C  26 8A 0B                          mov             cl,byte ptr es:[ebx]
005F  84 C9                             test            cl,cl
0061  75 CE                             jne             L$1
0063  31 D2                             xor             edx,edx
0065  31 C0                             xor             eax,eax
0067                            L$4:
0067  83 C4 20                          add             esp,0x00000020
006A  07                                pop             es
006B  5B                                pop             ebx
006C  C3                                ret

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

