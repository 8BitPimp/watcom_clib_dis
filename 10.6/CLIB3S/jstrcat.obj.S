Module: jstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000                            jstrncat:
0000  53                                push            ebx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
0009  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000D                            L$1:
000D  89 E0                             mov             eax,esp
000F  50                                push            eax
0010  53                                push            ebx
0011  E8 00 00 00 00                    call            jgetmoji
0016  83 C4 08                          add             esp,0x00000008
0019  8B 14 24                          mov             edx,dword ptr [esp]
001C  89 C3                             mov             ebx,eax
001E  66 85 D2                          test            dx,dx
0021  75 EA                             jne             L$1
0023  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0027  52                                push            edx
0028  56                                push            esi
0029  E8 00 00 00 00                    call            mtob
002E  83 C4 08                          add             esp,0x00000008
0031                            L$2:
0031  48                                dec             eax
0032  83 F8 FF                          cmp             eax,0xffffffff
0035  74 08                             je              L$3
0037  8A 16                             mov             dl,byte ptr [esi]
0039  46                                inc             esi
003A  88 13                             mov             byte ptr [ebx],dl
003C  43                                inc             ebx
003D  EB F2                             jmp             L$2
003F                            L$3:
003F  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0043  C6 03 00                          mov             byte ptr [ebx],0x00
0046  83 C4 04                          add             esp,0x00000004
0049  5E                                pop             esi
004A  5B                                pop             ebx
004B  C3                                ret

Routine Size: 76 bytes,    Routine Base: _TEXT + 0000

004C                            jstrcat:
004C  53                                push            ebx
004D  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0051  52                                push            edx
0052  E8 00 00 00 00                    call            jstrlen
0057  83 C4 04                          add             esp,0x00000004
005A  50                                push            eax
005B  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
005F  53                                push            ebx
0060  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0064  51                                push            ecx
0065  E8 00 00 00 00                    call            jstrncat
006A  83 C4 0C                          add             esp,0x0000000c
006D  5B                                pop             ebx
006E  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 004C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

