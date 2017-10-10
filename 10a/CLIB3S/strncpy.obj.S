Module: strncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000                            strncpy:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0006  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
000A  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
000E  89 C6                             mov             esi,eax
0010  EB 0B                             jmp             L$2
0012                            L$1:
0012  8A 0A                             mov             cl,byte ptr [edx]
0014  84 C9                             test            cl,cl
0016  74 09                             je              L$3
0018  42                                inc             edx
0019  4B                                dec             ebx
001A  88 08                             mov             byte ptr [eax],cl
001C  40                                inc             eax
001D                            L$2:
001D  85 DB                             test            ebx,ebx
001F  75 F1                             jne             L$1
0021                            L$3:
0021  85 DB                             test            ebx,ebx
0023  74 07                             je              L$4
0025  4B                                dec             ebx
0026  C6 00 00                          mov             byte ptr [eax],0x00
0029  40                                inc             eax
002A  EB F5                             jmp             L$3
002C                            L$4:
002C  89 F0                             mov             eax,esi
002E  5E                                pop             esi
002F  5B                                pop             ebx
0030  C3                                ret

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

