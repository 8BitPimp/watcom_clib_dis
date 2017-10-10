Module: fjstrski
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008B bytes
0000                            _fjstrskip:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  EB 49                             jmp             L$4
0008                            L$1:
0008  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
000C  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0010                            L$2:
0010  89 E1                             mov             ecx,esp
0012  8C D8                             mov             eax,ds
0014  25 FF FF 00 00                    and             eax,0x0000ffff
0019  50                                push            eax
001A  31 C0                             xor             eax,eax
001C  51                                push            ecx
001D  66 89 D0                          mov             ax,dx
0020  50                                push            eax
0021  53                                push            ebx
0022  9A 00 00 00 00 00 00              call            _fjgetmoji
0029  83 C4 10                          add             esp,0x00000010
002C  89 C3                             mov             ebx,eax
002E  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0032  8B 0C 24                          mov             ecx,dword ptr [esp]
0035  66 39 C8                          cmp             ax,cx
0038  74 0F                             je              L$3
003A  66 85 C9                          test            cx,cx
003D  75 D1                             jne             L$2
003F  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0043  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0047  EB 3B                             jmp             L$5
0049                            L$3:
0049  89 7C 24 20                       mov             dword ptr 0x20[esp],edi
004D  89 74 24 1C                       mov             dword ptr 0x1c[esp],esi
0051                            L$4:
0051  8D 5C 24 04                       lea             ebx,0x4[esp]
0055  8C D8                             mov             eax,ds
0057  25 FF FF 00 00                    and             eax,0x0000ffff
005C  50                                push            eax
005D  31 C0                             xor             eax,eax
005F  53                                push            ebx
0060  66 8B 44 24 28                    mov             ax,word ptr 0x28[esp]
0065  50                                push            eax
0066  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
006A  52                                push            edx
006B  9A 00 00 00 00 00 00              call            _fjgetmoji
0072  83 C4 10                          add             esp,0x00000010
0075  89 D7                             mov             edi,edx
0077  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
007B  89 C6                             mov             esi,eax
007D  66 85 D2                          test            dx,dx
0080  75 86                             jne             L$1
0082  31 C0                             xor             eax,eax
0084                            L$5:
0084  83 C4 08                          add             esp,0x00000008
0087  5F                                pop             edi
0088  5E                                pop             esi
0089  5B                                pop             ebx
008A  CB                                retf

Routine Size: 139 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

