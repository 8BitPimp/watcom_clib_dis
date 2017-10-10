Module: scanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            cget_stdin_:
0000  52                                push            edx
0001  89 C2                             mov             edx,eax
0003  B8 00 00 00 00                    mov             eax,offset ___iob
0008  E8 00 00 00 00                    call            fgetc_
000D  83 F8 FF                          cmp             eax,0xffffffff
0010  75 04                             jne             L$1
0012  80 4A 10 02                       or              byte ptr 0x10[edx],0x02
0016                            L$1:
0016  5A                                pop             edx
0017  C3                                ret
0018                            uncget_stdin_:
0018  BA 00 00 00 00                    mov             edx,offset ___iob
001D  E9 00 00 00 00                    jmp             ungetc_

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022                            vscanf_:
0022  53                                push            ebx
0023  51                                push            ecx
0024  56                                push            esi
0025  83 EC 14                          sub             esp,0x00000014
0028  89 C1                             mov             ecx,eax
002A  89 D3                             mov             ebx,edx
002C  BA 00 00 00 00                    mov             edx,offset cget_stdin_
0031  BE 00 00 00 00                    mov             esi,offset uncget_stdin_
0036  89 E0                             mov             eax,esp
0038  89 14 24                          mov             dword ptr [esp],edx
003B  89 CA                             mov             edx,ecx
003D  89 74 24 04                       mov             dword ptr 0x4[esp],esi
0041  E8 00 00 00 00                    call            __scnf_
0046  83 C4 14                          add             esp,0x00000014
0049  5E                                pop             esi
004A  59                                pop             ecx
004B  5B                                pop             ebx
004C  C3                                ret

Routine Size: 43 bytes,    Routine Base: _TEXT + 0022

004D                            scanf_:
004D  52                                push            edx
004E  83 EC 04                          sub             esp,0x00000004
0051  8D 54 24 10                       lea             edx,0x10[esp]
0055  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0059  89 14 24                          mov             dword ptr [esp],edx
005C  89 E2                             mov             edx,esp
005E  E8 00 00 00 00                    call            vscanf_
0063  83 C4 04                          add             esp,0x00000004
0066  5A                                pop             edx
0067  C3                                ret

Routine Size: 27 bytes,    Routine Base: _TEXT + 004D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

