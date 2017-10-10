Module: sbrk386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000                            sbrk_:
0000  51                                push            ecx
0001  52                                push            edx
0002  85 C0                             test            eax,eax
0004  7E 22                             jle             L$1
0006  05 FF 0F 00 00                    add             eax,0x00000fff
000B  66 25 00 F0                       and             ax,0xf000
000F  50                                push            eax
0010  6A 00                             push            0x00000000
0012  E8 00 00 00 00                    call            _LocalAlloc
0017  85 C0                             test            eax,eax
0019  75 1D                             jne             L$3
001B  E8 00 00 00 00                    call            __get_errno_ptr_
0020  C7 00 05 00 00 00                 mov             dword ptr [eax],0x00000005
0026  EB 0B                             jmp             L$2
0028                            L$1:
0028  E8 00 00 00 00                    call            __get_errno_ptr_
002D  C7 00 09 00 00 00                 mov             dword ptr [eax],0x00000009
0033                            L$2:
0033  B8 FF FF FF FF                    mov             eax,0xffffffff
0038                            L$3:
0038  5A                                pop             edx
0039  59                                pop             ecx
003A  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

