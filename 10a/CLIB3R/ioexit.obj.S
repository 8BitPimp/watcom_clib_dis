Module: ioexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000                            __full_io_exit_:
0000  31 C0                             xor             eax,eax
0002  E8 00 00 00 00                    call            docloseall_
0007  E9 00 00 00 00                    jmp             __purgefp_

Routine Size: 12 bytes,    Routine Base: _TEXT + 0000

000C                            fcloseall_:
000C  B8 05 00 00 00                    mov             eax,0x00000005
0011                            docloseall_:
0011  53                                push            ebx
0012  51                                push            ecx
0013  52                                push            edx
0014  56                                push            esi
0015  89 C2                             mov             edx,eax
0017  C1 E0 02                          shl             eax,0x02
001A  29 D0                             sub             eax,edx
001C  C1 E0 02                          shl             eax,0x02
001F  01 D0                             add             eax,edx
0021  BE 00 00 00 00                    mov             esi,offset ___iob
0026  01 C0                             add             eax,eax
0028  31 DB                             xor             ebx,ebx
002A  01 C6                             add             esi,eax
002C  A1 00 00 00 00                    mov             eax,dword ptr ___OpenStreams
0031  EB 25                             jmp             L$4
0033                            L$1:
0033  8B 08                             mov             ecx,dword ptr [eax]
0035  8B 40 04                          mov             eax,dword ptr 0x4[eax]
0038  BA 01 00 00 00                    mov             edx,0x00000001
003D  F6 40 0D 40                       test            byte ptr 0xd[eax],0x40
0041  75 0D                             jne             L$2
0043  39 F0                             cmp             eax,esi
0045  72 0F                             jb              L$3
0047  3D 82 00 00 00                    cmp             eax,offset ___iob+0x82
004C  73 02                             jae             L$2
004E  31 D2                             xor             edx,edx
0050                            L$2:
0050  E8 00 00 00 00                    call            __shutdown_stream_
0055  43                                inc             ebx
0056                            L$3:
0056  89 C8                             mov             eax,ecx
0058                            L$4:
0058  85 C0                             test            eax,eax
005A  75 D7                             jne             L$1
005C  89 D8                             mov             eax,ebx
005E  5E                                pop             esi
005F  5A                                pop             edx
0060  59                                pop             ecx
0061  5B                                pop             ebx
0062  C3                                ret

Routine Size: 87 bytes,    Routine Base: _TEXT + 000C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

