Module: chdirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000                            chdir:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            _SetCurrentDirectoryA
000A  85 C0                             test            eax,eax
000C  0F 84 00 00 00 00                 je              __set_errno_nt
0012  31 C0                             xor             eax,eax
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

