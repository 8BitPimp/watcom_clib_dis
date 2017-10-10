Module: ustrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000                            _ustrrev:
0000  53                                push            ebx
0001  56                                push            esi
0002  55                                push            ebp
0003  89 E5                             mov             ebp,esp
0005  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
0008  56                                push            esi
0009  E8 00 00 00 00                    call            _ustrlen
000E  01 C0                             add             eax,eax
0010  89 F3                             mov             ebx,esi
0012  01 F0                             add             eax,esi
0014  83 C4 04                          add             esp,0x00000004
0017                            L$1:
0017  48                                dec             eax
0018  48                                dec             eax
0019  39 C3                             cmp             ebx,eax
001B  73 10                             jae             L$2
001D  66 8B 10                          mov             dx,word ptr [eax]
0020  66 8B 0B                          mov             cx,word ptr [ebx]
0023  66 89 13                          mov             word ptr [ebx],dx
0026  43                                inc             ebx
0027  43                                inc             ebx
0028  66 89 08                          mov             word ptr [eax],cx
002B  EB EA                             jmp             L$1
002D                            L$2:
002D  89 F0                             mov             eax,esi
002F  5D                                pop             ebp
0030  5E                                pop             esi
0031  5B                                pop             ebx
0032  C3                                ret

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

