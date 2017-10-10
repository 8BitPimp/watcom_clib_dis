Module: flushall
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004E bytes
0000                            flushall:
0000  6A FF                             push            0xffffffff
0002  E8 00 00 00 00                    call            __flushall
0007  83 C4 04                          add             esp,0x00000004
000A  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

000B                            __flushall:
000B  53                                push            ebx
000C  56                                push            esi
000D  57                                push            edi
000E  8B 7C 24 10                       mov             edi,dword ptr 0x10[esp]
0012  FF 15 00 00 00 00                 call            dword ptr _AccessIOB
0018  8B 1D 00 00 00 00                 mov             ebx,dword ptr __OpenStreams
001E  31 F6                             xor             esi,esi
0020  EB 1C                             jmp             L$3
0022                            L$1:
0022  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
0025  85 78 0C                          test            dword ptr 0xc[eax],edi
0028  74 12                             je              L$2
002A  8A 50 0D                          mov             dl,byte ptr 0xd[eax]
002D  46                                inc             esi
002E  F6 C2 10                          test            dl,0x10
0031  74 09                             je              L$2
0033  50                                push            eax
0034  E8 00 00 00 00                    call            __flush
0039  83 C4 04                          add             esp,0x00000004
003C                            L$2:
003C  8B 1B                             mov             ebx,dword ptr [ebx]
003E                            L$3:
003E  85 DB                             test            ebx,ebx
0040  75 E0                             jne             L$1
0042  FF 15 00 00 00 00                 call            dword ptr _ReleaseIOB
0048  89 F0                             mov             eax,esi
004A  5F                                pop             edi
004B  5E                                pop             esi
004C  5B                                pop             ebx
004D  C3                                ret

Routine Size: 67 bytes,    Routine Base: _TEXT + 000B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

