Module: jstrmatc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000                            jstrmatch:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000A  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
000E  EB 1A                             jmp             L$3
0010                            L$1:
0010  89 FA                             mov             edx,edi
0012                            L$2:
0012  89 E0                             mov             eax,esp
0014  50                                push            eax
0015  52                                push            edx
0016  E8 00 00 00 00                    call            jgetmoji
001B  83 C4 08                          add             esp,0x00000008
001E  8B 0C 24                          mov             ecx,dword ptr [esp]
0021  89 C2                             mov             edx,eax
0023  66 85 C9                          test            cx,cx
0026  75 24                             jne             L$5
0028  89 DE                             mov             esi,ebx
002A                            L$3:
002A  8D 44 24 04                       lea             eax,0x4[esp]
002E  50                                push            eax
002F  56                                push            esi
0030  E8 00 00 00 00                    call            jgetmoji
0035  83 C4 08                          add             esp,0x00000008
0038  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
003C  89 C3                             mov             ebx,eax
003E  66 85 D2                          test            dx,dx
0041  75 CD                             jne             L$1
0043  31 C0                             xor             eax,eax
0045                            L$4:
0045  83 C4 08                          add             esp,0x00000008
0048  5F                                pop             edi
0049  5E                                pop             esi
004A  5B                                pop             ebx
004B  C3                                ret
004C                            L$5:
004C  66 3B 4C 24 04                    cmp             cx,word ptr 0x4[esp]
0051  75 BF                             jne             L$2
0053  89 F0                             mov             eax,esi
0055  EB EE                             jmp             L$4

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

