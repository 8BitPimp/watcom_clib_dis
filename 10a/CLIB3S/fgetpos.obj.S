Module: fgetpos
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000021 bytes
0000                            fgetpos:
0000  53                                push            ebx
0001  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0005  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0009  52                                push            edx
000A  E8 00 00 00 00                    call            ftell
000F  83 C4 04                          add             esp,0x00000004
0012  89 03                             mov             dword ptr [ebx],eax
0014  83 F8 FF                          cmp             eax,0xffffffff
0017  0F 94 C0                          sete            al
001A  25 FF 00 00 00                    and             eax,0x000000ff
001F  5B                                pop             ebx
0020  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

