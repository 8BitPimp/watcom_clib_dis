Module: getdrive
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000                            _getdrive:
0000  83 EC 04                          sub             esp,0x00000004
0003  89 E0                             mov             eax,esp
0005  50                                push            eax
0006  E8 00 00 00 00                    call            _dos_getdrive
000B  83 C4 04                          add             esp,0x00000004
000E  8B 04 24                          mov             eax,dword ptr [esp]
0011  83 C4 04                          add             esp,0x00000004
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

