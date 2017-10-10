Module: fstrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000                            _fstrdup:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000B  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
000F  89 F7                             mov             edi,esi
0011  06                                push            es
0012  8E C1                             mov             es,ecx
0014  31 C0                             xor             eax,eax
0016  89 C1                             mov             ecx,eax
0018  49                                dec             ecx
0019  F2 AE                             repne scasb
001B  F7 D1                             not             ecx
001D  49                                dec             ecx
001E  07                                pop             es
001F  8D 59 01                          lea             ebx,0x1[ecx]
0022  53                                push            ebx
0023  E8 00 00 00 00                    call            malloc
0028  83 C4 04                          add             esp,0x00000004
002B  8C 1C 24                          mov             dword ptr [esp],ds
002E  89 C5                             mov             ebp,eax
0030  8B 14 24                          mov             edx,dword ptr [esp]
0033  85 C0                             test            eax,eax
0035  75 05                             jne             L$1
0037  66 85 D2                          test            dx,dx
003A  74 24                             je              L$2
003C                            L$1:
003C  8B 14 24                          mov             edx,dword ptr [esp]
003F  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
0043  89 C7                             mov             edi,eax
0045  89 D8                             mov             eax,ebx
0047  1E                                push            ds
0048  06                                push            es
0049  57                                push            edi
004A  91                                xchg            eax,ecx
004B  8E D8                             mov             ds,eax
004D  8E C2                             mov             es,edx
004F  89 C8                             mov             eax,ecx
0051  C1 E9 02                          shr             ecx,0x02
0054  F2 A5                             repne movsd
0056  8A C8                             mov             cl,al
0058  80 E1 03                          and             cl,0x03
005B  F2 A4                             repne movsb
005D  58                                pop             eax
005E  07                                pop             es
005F  1F                                pop             ds
0060                            L$2:
0060  8B 14 24                          mov             edx,dword ptr [esp]
0063  89 E8                             mov             eax,ebp
0065  83 C4 04                          add             esp,0x00000004
0068  5D                                pop             ebp
0069  5F                                pop             edi
006A  5E                                pop             esi
006B  5B                                pop             ebx
006C  C3                                ret

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

