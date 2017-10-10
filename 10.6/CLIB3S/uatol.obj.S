Module: uatol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000067 bytes
0000                            _uatol:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007                            L$1:
0007  31 C0                             xor             eax,eax
0009  66 8B 03                          mov             ax,word ptr [ebx]
000C  50                                push            eax
000D  E8 00 00 00 00                    call            _uisspace
0012  83 C4 04                          add             esp,0x00000004
0015  85 C0                             test            eax,eax
0017  74 05                             je              L$2
0019  83 C3 02                          add             ebx,0x00000002
001C  EB E9                             jmp             L$1
001E                            L$2:
001E  66 8B 3B                          mov             di,word ptr [ebx]
0021  66 89 F8                          mov             ax,di
0024  83 F8 2B                          cmp             eax,0x0000002b
0027  74 05                             je              L$3
0029  83 F8 2D                          cmp             eax,0x0000002d
002C  75 03                             jne             L$4
002E                            L$3:
002E  83 C3 02                          add             ebx,0x00000002
0031                            L$4:
0031  31 F6                             xor             esi,esi
0033                            L$5:
0033  31 C0                             xor             eax,eax
0035  66 8B 03                          mov             ax,word ptr [ebx]
0038  50                                push            eax
0039  E8 00 00 00 00                    call            _uisdigit
003E  83 C4 04                          add             esp,0x00000004
0041  85 C0                             test            eax,eax
0043  74 12                             je              L$6
0045  6B F6 0A                          imul            esi,0x0000000a
0048  31 C0                             xor             eax,eax
004A  66 8B 03                          mov             ax,word ptr [ebx]
004D  01 C6                             add             esi,eax
004F  83 C3 02                          add             ebx,0x00000002
0052  83 EE 30                          sub             esi,0x00000030
0055  EB DC                             jmp             L$5
0057                            L$6:
0057  66 89 F8                          mov             ax,di
005A  83 F8 2D                          cmp             eax,0x0000002d
005D  75 02                             jne             L$7
005F  F7 DE                             neg             esi
0061                            L$7:
0061  89 F0                             mov             eax,esi
0063  5F                                pop             edi
0064  5E                                pop             esi
0065  5B                                pop             ebx
0066  C3                                ret

Routine Size: 103 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

