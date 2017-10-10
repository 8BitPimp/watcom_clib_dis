Module: strlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000                            _strlwr:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            strlwr
000A  83 C4 04                          add             esp,0x00000004
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E                            strlwr:
000E  53                                push            ebx
000F  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0013  89 CA                             mov             edx,ecx
0015                            L$1:
0015  8A 02                             mov             al,byte ptr [edx]
0017  84 C0                             test            al,al
0019  74 12                             je              L$3
001B  2C 41                             sub             al,0x41
001D  31 DB                             xor             ebx,ebx
001F  88 C3                             mov             bl,al
0021  83 FB 19                          cmp             ebx,0x00000019
0024  7F 04                             jg              L$2
0026  04 61                             add             al,0x61
0028  88 02                             mov             byte ptr [edx],al
002A                            L$2:
002A  42                                inc             edx
002B  EB E8                             jmp             L$1
002D                            L$3:
002D  89 C8                             mov             eax,ecx
002F  5B                                pop             ebx
0030  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

