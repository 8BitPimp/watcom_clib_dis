Module: ioexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000                            __full_io_exit:
0000  6A 00                             push            0x00000000
0002  E8 00 00 00 00                    call            docloseall
0007  83 C4 04                          add             esp,0x00000004
000A  E9 00 00 00 00                    jmp             __purgefp

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

000F                            fcloseall:
000F  6A 05                             push            0x00000005
0011  E8 00 00 00 00                    call            docloseall
0016  83 C4 04                          add             esp,0x00000004
0019  C3                                ret
001A                            docloseall:
001A  53                                push            ebx
001B  56                                push            esi
001C  57                                push            edi
001D  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0021  89 D0                             mov             eax,edx
0023  C1 E0 02                          shl             eax,0x02
0026  29 D0                             sub             eax,edx
0028  C1 E0 02                          shl             eax,0x02
002B  01 D0                             add             eax,edx
002D  BF 00 00 00 00                    mov             edi,offset __iob
0032  01 C0                             add             eax,eax
0034  31 DB                             xor             ebx,ebx
0036  01 C7                             add             edi,eax
0038  A1 00 00 00 00                    mov             eax,dword ptr __OpenStreams
003D  EB 2C                             jmp             L$4
003F                            L$1:
003F  8B 30                             mov             esi,dword ptr [eax]
0041  8B 40 04                          mov             eax,dword ptr 0x4[eax]
0044  8A 48 0D                          mov             cl,byte ptr 0xd[eax]
0047  BA 01 00 00 00                    mov             edx,0x00000001
004C  F6 C1 40                          test            cl,0x40
004F  75 0D                             jne             L$2
0051  39 F8                             cmp             eax,edi
0053  72 14                             jb              L$3
0055  3D 82 00 00 00                    cmp             eax,offset __iob+0x82
005A  73 02                             jae             L$2
005C  31 D2                             xor             edx,edx
005E                            L$2:
005E  52                                push            edx
005F  50                                push            eax
0060  43                                inc             ebx
0061  E8 00 00 00 00                    call            __shutdown_stream
0066  83 C4 08                          add             esp,0x00000008
0069                            L$3:
0069  89 F0                             mov             eax,esi
006B                            L$4:
006B  85 C0                             test            eax,eax
006D  75 D0                             jne             L$1
006F  89 D8                             mov             eax,ebx
0071  5F                                pop             edi
0072  5E                                pop             esi
0073  5B                                pop             ebx
0074  C3                                ret

Routine Size: 102 bytes,    Routine Base: _TEXT + 000F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

