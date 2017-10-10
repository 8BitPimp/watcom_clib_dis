Module: fjstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000050 bytes
0000                            _fjstrchr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 04                          sub             esp,0x00000004
0006  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
000A  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000E  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0012                            L$1:
0012  89 E2                             mov             edx,esp
0014  8C D8                             mov             eax,ds
0016  25 FF FF 00 00                    and             eax,0x0000ffff
001B  50                                push            eax
001C  31 C0                             xor             eax,eax
001E  52                                push            edx
001F  66 89 D8                          mov             ax,bx
0022  50                                push            eax
0023  56                                push            esi
0024  9A 00 00 00 00 00 00              call            _fjgetmoji
002B  83 C4 10                          add             esp,0x00000010
002E  8B 0C 24                          mov             ecx,dword ptr [esp]
0031  66 39 CF                          cmp             di,cx
0034  75 06                             jne             L$2
0036  89 DA                             mov             edx,ebx
0038  89 F0                             mov             eax,esi
003A  EB 0D                             jmp             L$3
003C                            L$2:
003C  89 D3                             mov             ebx,edx
003E  89 C6                             mov             esi,eax
0040  66 85 C9                          test            cx,cx
0043  75 CD                             jne             L$1
0045  31 D2                             xor             edx,edx
0047  31 C0                             xor             eax,eax
0049                            L$3:
0049  83 C4 04                          add             esp,0x00000004
004C  5F                                pop             edi
004D  5E                                pop             esi
004E  5B                                pop             ebx
004F  CB                                retf

Routine Size: 80 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

