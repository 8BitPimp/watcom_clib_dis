Module: nfree
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000078 bytes
0000                            free:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            _nfree
000A  83 C4 04                          add             esp,0x00000004
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E                            _nfree:
000E  53                                push            ebx
000F  56                                push            esi
0010  55                                push            ebp
0011  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0015  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
001B  8B 35 00 00 00 00                 mov             esi,dword ptr __nheapbeg
0021  EB 0B                             jmp             L$3
0023                            L$1:
0023  39 DE                             cmp             esi,ebx
0025  77 04                             ja              L$2
0027  39 D3                             cmp             ebx,edx
0029  72 0A                             jb              L$4
002B                            L$2:
002B  8B 76 08                          mov             esi,dword ptr 0x8[esi]
002E                            L$3:
002E  8B 56 08                          mov             edx,dword ptr 0x8[esi]
0031  85 D2                             test            edx,edx
0033  75 EE                             jne             L$1
0035                            L$4:
0035  B8 00 00 00 00                    mov             eax,offset __nheapbeg
003A  8C DA                             mov             edx,ds
003C  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0042  89 D8                             mov             eax,ebx
0044  89 F3                             mov             ebx,esi
0046  E8 00 00 00 00                    call            __MemFree
004B  3B 35 00 00 00 00                 cmp             esi,dword ptr __MiniHeapRover
0051  74 13                             je              L$5
0053  8B 2D 00 00 00 00                 mov             ebp,dword ptr __LargestSizeB4MiniHeapRover
0059  8B 56 14                          mov             edx,dword ptr 0x14[esi]
005C  39 EA                             cmp             edx,ebp
005E  76 06                             jbe             L$5
0060  89 15 00 00 00 00                 mov             dword ptr __LargestSizeB4MiniHeapRover,edx
0066                            L$5:
0066  30 E4                             xor             ah,ah
0068  88 25 00 00 00 00                 mov             byte ptr __nheap_clean,ah
006E  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
0074  5D                                pop             ebp
0075  5E                                pop             esi
0076  5B                                pop             ebx
0077  C3                                ret

Routine Size: 106 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

