Module: dosret
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005D bytes
0000                            _dosret0_:
0000  85 D2                             test            edx,edx
0002  75 03                             jne             _dosretax_
0004  31 C0                             xor             eax,eax
0006  C3                                ret

Routine Size: 7 bytes,    Routine Base: _TEXT + 0000

0007                            _dosretax_:
0007  85 D2                             test            edx,edx
0009  75 01                             jne             __set_errno_dos_
000B  C3                                ret

Routine Size: 5 bytes,    Routine Base: _TEXT + 0007

000C                            __set_errno_dos_:
000C  52                                push            edx
000D  89 C2                             mov             edx,eax
000F  E8 00 00 00 00                    call            __set_doserrno_
0014  83 FA 7B                          cmp             edx,0x0000007b
0017  75 07                             jne             L$1
0019  B8 01 00 00 00                    mov             eax,0x00000001
001E  EB 22                             jmp             L$4
0020                            L$1:
0020  81 FA B7 00 00 00                 cmp             edx,0x000000b7
0026  75 07                             jne             L$2
0028  B8 07 00 00 00                    mov             eax,0x00000007
002D  EB 13                             jmp             L$4
002F                            L$2:
002F  83 FA 13                          cmp             edx,0x00000013
0032  76 05                             jbe             L$3
0034  BA 13 00 00 00                    mov             edx,0x00000013
0039                            L$3:
0039  8B 82 FD FF FF FF                 mov             eax,dword ptr _xlat-0x3[edx]
003F  C1 F8 18                          sar             eax,0x18
0042                            L$4:
0042  E8 00 00 00 00                    call            __set_errno_
0047  B8 FF FF FF FF                    mov             eax,0xffffffff
004C  5A                                pop             edx
004D  C3                                ret

Routine Size: 66 bytes,    Routine Base: _TEXT + 000C

004E                            __set_errno_nt_:
004E  51                                push            ecx
004F  52                                push            edx
0050  E8 00 00 00 00                    call            _GetLastError
0055  E8 00 00 00 00                    call            __set_errno_dos_
005A  5A                                pop             edx
005B  59                                pop             ecx
005C  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 004E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000                            _xlat:
0000  00 09 01 01 0B 06 04 05 05 05 02 03 FF FF 07 08 ................
0010  06 08 01 FF                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

