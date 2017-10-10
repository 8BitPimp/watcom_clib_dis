Module: allocwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000                            _dos_allocmem:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  C1 E0 04                          shl             eax,0x04
0007  50                                push            eax
0008  6A 00                             push            0x00000000
000A  E8 00 00 00 00                    call            _GlobalAlloc
000F  85 C0                             test            eax,eax
0011  0F 84 00 00 00 00                 je              __set_errno_nt
0017  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
001B  89 02                             mov             dword ptr [edx],eax
001D  31 C0                             xor             eax,eax
001F  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020                            _dos_freemem:
0020  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0024  52                                push            edx
0025  E8 00 00 00 00                    call            _GlobalFree
002A  85 C0                             test            eax,eax
002C  0F 85 00 00 00 00                 jne             __set_errno_nt
0032  C3                                ret

Routine Size: 19 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

