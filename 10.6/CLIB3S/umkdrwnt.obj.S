Module: umkdrwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000                            _umkdir:
0000  6A 00                             push            0x00000000
0002  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0006  52                                push            edx
0007  E8 00 00 00 00                    call            _CreateDirectoryW
000C  85 C0                             test            eax,eax
000E  0F 84 00 00 00 00                 je              __set_errno_nt
0014  31 C0                             xor             eax,eax
0016  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

