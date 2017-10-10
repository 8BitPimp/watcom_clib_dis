Module: sdrvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000                            _dos_setdrive:
0000  83 EC 04                          sub             esp,0x00000004
0003  8A 44 24 08                       mov             al,byte ptr 0x8[esp]
0007  B4 3A                             mov             ah,0x3a
0009  B2 2E                             mov             dl,0x2e
000B  04 60                             add             al,0x60
000D  88 64 24 01                       mov             byte ptr 0x1[esp],ah
0011  88 04 24                          mov             byte ptr [esp],al
0014  89 E0                             mov             eax,esp
0016  30 F6                             xor             dh,dh
0018  50                                push            eax
0019  88 54 24 06                       mov             byte ptr 0x6[esp],dl
001D  88 74 24 07                       mov             byte ptr 0x7[esp],dh
0021  E8 00 00 00 00                    call            _SetCurrentDirectoryA
0026  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
002A  C7 00 FF FF FF FF                 mov             dword ptr [eax],0xffffffff
0030  83 C4 04                          add             esp,0x00000004
0033  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

