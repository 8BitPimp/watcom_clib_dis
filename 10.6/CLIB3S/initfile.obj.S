Module: initfile
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000                            __InitFiles:
0000  53                                push            ebx
0001  56                                push            esi
0002  8A 25 41 00 00 00                 mov             ah,byte ptr __iob+0x41
0008  80 E4 F8                          and             ah,0xf8
000B  88 E2                             mov             dl,ah
000D  88 25 41 00 00 00                 mov             byte ptr __iob+0x41,ah
0013  80 CA 04                          or              dl,0x04
0016  BE 00 00 00 00                    mov             esi,offset __iob
001B  88 15 41 00 00 00                 mov             byte ptr __iob+0x41,dl
0021  EB 42                             jmp             L$3
0023                            L$1:
0023  6A 08                             push            0x00000008
0025  E8 00 00 00 00                    call            _nmalloc
002A  89 C3                             mov             ebx,eax
002C  83 C4 04                          add             esp,0x00000004
002F  85 C0                             test            eax,eax
0031  75 1F                             jne             L$2
0033  6A 08                             push            0x00000008
0035  E8 00 00 00 00                    call            malloc
003A  83 C4 04                          add             esp,0x00000004
003D  89 C3                             mov             ebx,eax
003F  85 C0                             test            eax,eax
0041  75 0F                             jne             L$2
0043  6A 01                             push            0x00000001
0045  68 00 00 00 00                    push            offset DGROUP:L$4
004A  E8 00 00 00 00                    call            __fatal_runtime_error
004F  83 C4 08                          add             esp,0x00000008
0052                            L$2:
0052  A1 00 00 00 00                    mov             eax,dword ptr __OpenStreams
0057  89 73 04                          mov             dword ptr 0x4[ebx],esi
005A  89 1D 00 00 00 00                 mov             dword ptr __OpenStreams,ebx
0060  83 C6 1A                          add             esi,0x0000001a
0063  89 03                             mov             dword ptr [ebx],eax
0065                            L$3:
0065  8B 56 0C                          mov             edx,dword ptr 0xc[esi]
0068  85 D2                             test            edx,edx
006A  75 B7                             jne             L$1
006C  89 15 00 00 00 00                 mov             dword ptr __ClosedStreams,edx
0072  5E                                pop             esi
0073  5B                                pop             ebx
0074  C3                                ret

Routine Size: 117 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000030 bytes
0000                            L$4:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 66 69 y to allocate fi
0020  6C 65 20 73 74 72 75 63 74 75 72 65 73 0D 0A 00 le structures...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

