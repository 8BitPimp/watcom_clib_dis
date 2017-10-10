Module: putw
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000                            _putw:
0000  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0004  52                                push            edx
0005  6A 01                             push            0x00000001
0007  6A 04                             push            0x00000004
0009  8D 44 24 10                       lea             eax,0x10[esp]
000D  50                                push            eax
000E  E8 00 00 00 00                    call            fwrite
0013  83 C4 10                          add             esp,0x00000010
0016  85 C0                             test            eax,eax
0018  76 05                             jbe             L$1
001A  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
001E  C3                                ret
001F                            L$1:
001F  B8 FF FF FF FF                    mov             eax,0xffffffff
0024  C3                                ret

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

