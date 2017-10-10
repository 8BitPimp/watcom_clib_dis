Module: setbuf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            setbuf:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  B8 00 01 00 00                    mov             eax,0x00000100
000A  85 D2                             test            edx,edx
000C  75 05                             jne             L$1
000E  B8 00 04 00 00                    mov             eax,0x00000400
0013                            L$1:
0013  68 00 10 00 00                    push            0x00001000
0018  50                                push            eax
0019  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
001D  53                                push            ebx
001E  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0022  51                                push            ecx
0023  E8 00 00 00 00                    call            setvbuf
0028  83 C4 10                          add             esp,0x00000010
002B  5B                                pop             ebx
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

