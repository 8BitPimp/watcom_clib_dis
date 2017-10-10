Module: sbrk386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000                            sbrk:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  85 C0                             test            eax,eax
0006  7E 22                             jle             L$1
0008  05 FF 0F 00 00                    add             eax,0x00000fff
000D  66 25 00 F0                       and             ax,0xf000
0011  50                                push            eax
0012  6A 00                             push            0x00000000
0014  E8 00 00 00 00                    call            _LocalAlloc
0019  85 C0                             test            eax,eax
001B  75 1D                             jne             L$3
001D  E8 00 00 00 00                    call            __get_errno_ptr
0022  C7 00 05 00 00 00                 mov             dword ptr [eax],0x00000005
0028  EB 0B                             jmp             L$2
002A                            L$1:
002A  E8 00 00 00 00                    call            __get_errno_ptr
002F  C7 00 09 00 00 00                 mov             dword ptr [eax],0x00000009
0035                            L$2:
0035  B8 FF FF FF FF                    mov             eax,0xffffffff
003A                            L$3:
003A  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

