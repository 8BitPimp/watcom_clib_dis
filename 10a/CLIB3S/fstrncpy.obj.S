Module: fstrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000                            _fstrncpy:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
000A  C4 54 24 20                       les             edx,fword ptr 0x20[esp]
000E  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
0012  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
0016  8E 64 24 1C                       mov             fs,dword ptr 0x1c[esp]
001A  89 C6                             mov             esi,eax
001C  EB 0D                             jmp             L$2
001E                            L$1:
001E  26 8A 0A                          mov             cl,byte ptr es:[edx]
0021  84 C9                             test            cl,cl
0023  74 0A                             je              L$3
0025  42                                inc             edx
0026  4B                                dec             ebx
0027  64 88 08                          mov             byte ptr fs:[eax],cl
002A  40                                inc             eax
002B                            L$2:
002B  85 DB                             test            ebx,ebx
002D  75 EF                             jne             L$1
002F                            L$3:
002F  8E 44 24 1C                       mov             es,dword ptr 0x1c[esp]
0033                            L$4:
0033  85 DB                             test            ebx,ebx
0035  74 08                             je              L$5
0037  4B                                dec             ebx
0038  26 C6 00 00                       mov             byte ptr es:[eax],0x00
003C  40                                inc             eax
003D  EB F4                             jmp             L$4
003F                            L$5:
003F  89 FA                             mov             edx,edi
0041  89 F0                             mov             eax,esi
0043  0F A1                             pop             fs
0045  07                                pop             es
0046  5F                                pop             edi
0047  5E                                pop             esi
0048  5B                                pop             ebx
0049  C3                                ret

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

