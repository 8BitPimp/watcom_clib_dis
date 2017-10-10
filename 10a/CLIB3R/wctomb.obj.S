Module: wctomb
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005E bytes
0000                            wctomb_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  83 EC 04                          sub             esp,0x00000004
0005  89 C1                             mov             ecx,eax
0007  85 C0                             test            eax,eax
0009  75 04                             jne             L$1
000B  31 D2                             xor             edx,edx
000D  EB 47                             jmp             L$4
000F                            L$1:
000F  88 14 24                          mov             byte ptr [esp],dl
0012  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0018  C1 FA 08                          sar             edx,0x08
001B  BB 02 00 00 00                    mov             ebx,0x00000002
0020  81 E2 FF 00 00 00                 and             edx,0x000000ff
0026  31 C0                             xor             eax,eax
0028  88 54 24 01                       mov             byte ptr 0x1[esp],dl
002C  89 E2                             mov             edx,esp
002E  E8 00 00 00 00                    call            mbtowc_
0033  89 C2                             mov             edx,eax
0035  85 C0                             test            eax,eax
0037  75 05                             jne             L$2
0039  BA 01 00 00 00                    mov             edx,0x00000001
003E                            L$2:
003E  83 FA 01                          cmp             edx,0x00000001
0041  72 13                             jb              L$4
0043  76 0C                             jbe             L$3
0045  83 FA 02                          cmp             edx,0x00000002
0048  75 0C                             jne             L$4
004A  8A 44 24 01                       mov             al,byte ptr 0x1[esp]
004E  88 41 01                          mov             byte ptr 0x1[ecx],al
0051                            L$3:
0051  8A 04 24                          mov             al,byte ptr [esp]
0054  88 01                             mov             byte ptr [ecx],al
0056                            L$4:
0056  89 D0                             mov             eax,edx
0058  83 C4 04                          add             esp,0x00000004
005B  59                                pop             ecx
005C  5B                                pop             ebx
005D  C3                                ret

Routine Size: 94 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

