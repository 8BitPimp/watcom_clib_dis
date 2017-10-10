Module: jstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000056 bytes
0000                            jstrcmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 08                          sub             esp,0x00000008
0005  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0009  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000D                            L$1:
000D  89 E0                             mov             eax,esp
000F  50                                push            eax
0010  53                                push            ebx
0011  E8 00 00 00 00                    call            jgetmoji
0016  83 C4 08                          add             esp,0x00000008
0019  89 C3                             mov             ebx,eax
001B  8D 44 24 04                       lea             eax,0x4[esp]
001F  50                                push            eax
0020  56                                push            esi
0021  E8 00 00 00 00                    call            jgetmoji
0026  83 C4 08                          add             esp,0x00000008
0029  89 C6                             mov             esi,eax
002B  8B 04 24                          mov             eax,dword ptr [esp]
002E  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0032  66 39 D0                          cmp             ax,dx
0035  74 10                             je              L$3
0037  73 07                             jae             L$2
0039  B8 FF FF FF FF                    mov             eax,0xffffffff
003E  EB 10                             jmp             L$4
0040                            L$2:
0040  B8 01 00 00 00                    mov             eax,0x00000001
0045  EB 09                             jmp             L$4
0047                            L$3:
0047  66 83 3C 24 00                    cmp             word ptr [esp],0x0000
004C  75 BF                             jne             L$1
004E  31 C0                             xor             eax,eax
0050                            L$4:
0050  83 C4 08                          add             esp,0x00000008
0053  5E                                pop             esi
0054  5B                                pop             ebx
0055  C3                                ret

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

