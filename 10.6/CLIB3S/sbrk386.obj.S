Module: sbrk386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
0000                            sbrk:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  85 C0                             test            eax,eax
0006  7E 2A                             jle             L$2
0008  6A 40                             push            0x00000040
000A  05 FF 0F 00 00                    add             eax,0x00000fff
000F  68 00 10 00 00                    push            0x00001000
0014  66 25 00 F0                       and             ax,0xf000
0018  50                                push            eax
0019  6A 00                             push            0x00000000
001B  E8 00 00 00 00                    call            _VirtualAlloc
0020  85 C0                             test            eax,eax
0022  74 01                             je              L$1
0024  C3                                ret
0025                            L$1:
0025  E8 00 00 00 00                    call            __get_errno_ptr
002A  C7 00 05 00 00 00                 mov             dword ptr [eax],0x00000005
0030  EB 0B                             jmp             L$3
0032                            L$2:
0032  E8 00 00 00 00                    call            __get_errno_ptr
0037  C7 00 09 00 00 00                 mov             dword ptr [eax],0x00000009
003D                            L$3:
003D  B8 FF FF FF FF                    mov             eax,0xffffffff
0042  C3                                ret

Routine Size: 67 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

