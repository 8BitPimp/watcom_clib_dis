Module: wctomb
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            wctomb:
0000  53                                push            ebx
0001  83 EC 04                          sub             esp,0x00000004
0004  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0008  85 DB                             test            ebx,ebx
000A  75 07                             jne             L$1
000C  31 C0                             xor             eax,eax
000E  83 C4 04                          add             esp,0x00000004
0011  5B                                pop             ebx
0012  C3                                ret
0013                            L$1:
0013  8A 44 24 10                       mov             al,byte ptr 0x10[esp]
0017  88 04 24                          mov             byte ptr [esp],al
001A  31 C0                             xor             eax,eax
001C  66 8B 44 24 10                    mov             ax,word ptr 0x10[esp]
0021  C1 F8 08                          sar             eax,0x08
0024  25 FF 00 00 00                    and             eax,0x000000ff
0029  6A 02                             push            0x00000002
002B  88 44 24 05                       mov             byte ptr 0x5[esp],al
002F  8D 44 24 04                       lea             eax,0x4[esp]
0033  50                                push            eax
0034  6A 00                             push            0x00000000
0036  E8 00 00 00 00                    call            mbtowc
003B  83 C4 0C                          add             esp,0x0000000c
003E  89 C2                             mov             edx,eax
0040  85 C0                             test            eax,eax
0042  75 05                             jne             L$2
0044  BA 01 00 00 00                    mov             edx,0x00000001
0049                            L$2:
0049  83 FA 01                          cmp             edx,0x00000001
004C  72 13                             jb              L$4
004E  76 0C                             jbe             L$3
0050  83 FA 02                          cmp             edx,0x00000002
0053  75 0C                             jne             L$4
0055  8A 44 24 01                       mov             al,byte ptr 0x1[esp]
0059  88 43 01                          mov             byte ptr 0x1[ebx],al
005C                            L$3:
005C  8A 04 24                          mov             al,byte ptr [esp]
005F  88 03                             mov             byte ptr [ebx],al
0061                            L$4:
0061  89 D0                             mov             eax,edx
0063  83 C4 04                          add             esp,0x00000004
0066  5B                                pop             ebx
0067  C3                                ret

Routine Size: 104 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

