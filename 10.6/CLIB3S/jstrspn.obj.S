Module: jstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000                            jstrspn:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
000A  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000E  EB 2B                             jmp             L$4
0010                            L$1:
0010  89 FA                             mov             edx,edi
0012                            L$2:
0012  8D 44 24 04                       lea             eax,0x4[esp]
0016  50                                push            eax
0017  52                                push            edx
0018  E8 00 00 00 00                    call            jgetmoji
001D  83 C4 08                          add             esp,0x00000008
0020  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0024  89 C2                             mov             edx,eax
0026  66 85 C9                          test            cx,cx
0029  74 06                             je              L$3
002B  66 3B 0C 24                       cmp             cx,word ptr [esp]
002F  75 E1                             jne             L$2
0031                            L$3:
0031  66 83 7C 24 04 00                 cmp             word ptr 0x4[esp],0x0000
0037  74 18                             je              L$5
0039  89 F3                             mov             ebx,esi
003B                            L$4:
003B  89 E0                             mov             eax,esp
003D  50                                push            eax
003E  53                                push            ebx
003F  E8 00 00 00 00                    call            jgetmoji
0044  83 C4 08                          add             esp,0x00000008
0047  8B 14 24                          mov             edx,dword ptr [esp]
004A  89 C6                             mov             esi,eax
004C  66 85 D2                          test            dx,dx
004F  75 BF                             jne             L$1
0051                            L$5:
0051  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0055  89 D8                             mov             eax,ebx
0057  29 D0                             sub             eax,edx
0059  83 C4 08                          add             esp,0x00000008
005C  5F                                pop             edi
005D  5E                                pop             esi
005E  5B                                pop             ebx
005F  C3                                ret

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

