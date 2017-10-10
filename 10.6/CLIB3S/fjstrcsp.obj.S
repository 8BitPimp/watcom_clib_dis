Module: fjstrcsp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000080 bytes
0000                            _fjstrcspn:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
000A  31 F6                             xor             esi,esi
000C  EB 38                             jmp             L$4
000E                            L$1:
000E  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
0012  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0016  EB 07                             jmp             L$3
0018                            L$2:
0018  66 3B 4C 24 04                    cmp             cx,word ptr 0x4[esp]
001D  74 58                             je              L$5
001F                            L$3:
001F  89 E1                             mov             ecx,esp
0021  8C D8                             mov             eax,ds
0023  25 FF FF 00 00                    and             eax,0x0000ffff
0028  50                                push            eax
0029  31 C0                             xor             eax,eax
002B  51                                push            ecx
002C  66 89 D0                          mov             ax,dx
002F  50                                push            eax
0030  53                                push            ebx
0031  9A 00 00 00 00 00 00              call            _fjgetmoji
0038  83 C4 10                          add             esp,0x00000010
003B  8B 0C 24                          mov             ecx,dword ptr [esp]
003E  89 C3                             mov             ebx,eax
0040  66 85 C9                          test            cx,cx
0043  75 D3                             jne             L$2
0045  46                                inc             esi
0046                            L$4:
0046  8D 5C 24 04                       lea             ebx,0x4[esp]
004A  8C D8                             mov             eax,ds
004C  25 FF FF 00 00                    and             eax,0x0000ffff
0051  50                                push            eax
0052  31 C0                             xor             eax,eax
0054  53                                push            ebx
0055  66 89 F8                          mov             ax,di
0058  50                                push            eax
0059  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
005D  52                                push            edx
005E  9A 00 00 00 00 00 00              call            _fjgetmoji
0065  83 C4 10                          add             esp,0x00000010
0068  89 D7                             mov             edi,edx
006A  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
006E  89 44 24 1C                       mov             dword ptr 0x1c[esp],eax
0072  66 85 D2                          test            dx,dx
0075  75 97                             jne             L$1
0077                            L$5:
0077  89 F0                             mov             eax,esi
0079  83 C4 08                          add             esp,0x00000008
007C  5F                                pop             edi
007D  5E                                pop             esi
007E  5B                                pop             ebx
007F  CB                                retf

Routine Size: 128 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

