Module: fnthctyp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000                            _fnthctype:
0000  53                                push            ebx
0001  56                                push            esi
0002  06                                push            es
0003  C4 5C 24 14                       les             ebx,fword ptr 0x14[esp]
0007  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000B  B8 FF FF FF FF                    mov             eax,0xffffffff
0010                            L$1:
0010  26 8A 13                          mov             dl,byte ptr es:[ebx]
0013  84 D2                             test            dl,dl
0015  75 09                             jne             L$2
0017  B8 FF FF FF FF                    mov             eax,0xffffffff
001C  07                                pop             es
001D  5E                                pop             esi
001E  5B                                pop             ebx
001F  CB                                retf
0020                            L$2:
0020  50                                push            eax
0021  31 C0                             xor             eax,eax
0023  88 D0                             mov             al,dl
0025  50                                push            eax
0026  43                                inc             ebx
0027  4E                                dec             esi
0028  E8 00 00 00 00                    call            chkctype
002D  83 C4 08                          add             esp,0x00000008
0030  83 FE FF                          cmp             esi,0xffffffff
0033  75 DB                             jne             L$1
0035  07                                pop             es
0036  5E                                pop             esi
0037  5B                                pop             ebx
0038  CB                                retf

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

