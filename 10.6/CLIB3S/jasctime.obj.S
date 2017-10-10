Module: jasctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000                            jasctime:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0007  8B 10                             mov             edx,dword ptr [eax]
0009  52                                push            edx
000A  8B 58 04                          mov             ebx,dword ptr 0x4[eax]
000D  53                                push            ebx
000E  8B 48 08                          mov             ecx,dword ptr 0x8[eax]
0011  8B 50 18                          mov             edx,dword ptr 0x18[eax]
0014  51                                push            ecx
0015  8B 34 95 00 00 00 00              mov             esi,dword ptr dtbl[edx*4]
001C  56                                push            esi
001D  8B 78 0C                          mov             edi,dword ptr 0xc[eax]
0020  8B 50 10                          mov             edx,dword ptr 0x10[eax]
0023  57                                push            edi
0024  42                                inc             edx
0025  8B 40 14                          mov             eax,dword ptr 0x14[eax]
0028  52                                push            edx
0029  05 6C 07 00 00                    add             eax,0x0000076c
002E  50                                push            eax
002F  68 15 00 00 00                    push            offset DGROUP:L$8
0034  68 00 00 00 00                    push            offset s
0039  E8 00 00 00 00                    call            sprintf
003E  B8 00 00 00 00                    mov             eax,offset s
0043  83 C4 24                          add             esp,0x00000024
0046  5F                                pop             edi
0047  5E                                pop             esi
0048  5B                                pop             ebx
0049  C3                                ret

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000042 bytes
0000                            L$1:
0000  93 FA 00                                        ...
0003                            L$2:
0003  8C 8E 00                                        ...
0006                            L$3:
0006  89 CE 00                                        ...
0009                            L$4:
0009  90 85 00                                        ...
000C                            L$5:
000C  96 D8 00                                        ...
000F                            L$6:
000F  8B E0 00                                        ...
0012                            L$7:
0012  93 79 00                                        .y.
0015                            L$8:
0015  25 30 34 64 20 94 4E 20 25 32 64 20 8C 8E 20 25 %04d .N %2d .. %
0025  32 64 20 93 FA 20 81 69 25 73 81 6A 20 25 30 32 2d .. .i%s.j %02
0035  64 3A 25 30 32 64 3A 25 30 32 64 0A 00          d:%02d:%02d..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000001C bytes
0000                            dtbl:
0000  00 00 00 00                                     DD        offset DGROUP:L$1
0004  03 00 00 00                                     DD        offset DGROUP:L$2
0008  06 00 00 00                                     DD        offset DGROUP:L$3
000C  09 00 00 00                                     DD        offset DGROUP:L$4
0010  0C 00 00 00                                     DD        offset DGROUP:L$5
0014  0F 00 00 00                                     DD        offset DGROUP:L$6
0018  12 00 00 00                                     DD        offset DGROUP:L$7

Segment: _BSS DWORD USE32 00000025 bytes
0000                            s:

BSS Size: 37 bytes

