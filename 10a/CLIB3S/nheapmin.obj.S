Module: nheapmin
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A8 bytes
0000                            _heapshrink:
0000                            _heapmin:
0000                            _nheapmin:
0000                            _nheapshrink:
0000  53                                push            ebx
0001  56                                push            esi
0002  A1 00 00 00 00                    mov             eax,dword ptr __nheapbeg
0007  E9 95 00 00 00                    jmp             L$9
000C                            __ReturnMemToSystem:
000C  53                                push            ebx
000D  56                                push            esi
000E  8B 74 24 0C                       mov             esi,dword ptr 0xc[esp]
0012  56                                push            esi
0013  8B 5E 08                          mov             ebx,dword ptr 0x8[esi]
0016  E8 00 00 00 00                    call            _LocalFree
001B  85 C0                             test            eax,eax
001D  74 08                             je              L$1
001F  B8 FF FF FF FF                    mov             eax,0xffffffff
0024  5E                                pop             esi
0025  5B                                pop             ebx
0026  C3                                ret
0027                            L$1:
0027  3B 35 00 00 00 00                 cmp             esi,dword ptr __MiniHeapRover
002D  75 1F                             jne             L$3
002F  85 DB                             test            ebx,ebx
0031  74 0B                             je              L$2
0033  89 1D 00 00 00 00                 mov             dword ptr __MiniHeapRover,ebx
0039  31 C0                             xor             eax,eax
003B  5E                                pop             esi
003C  5B                                pop             ebx
003D  C3                                ret
003E                            L$2:
003E  A1 00 00 00 00                    mov             eax,dword ptr __nheapbeg
0043  89 1D 00 00 00 00                 mov             dword ptr __LargestSizeB4MiniHeapRover,ebx
0049  A3 00 00 00 00                    mov             dword ptr __MiniHeapRover,eax
004E                            L$3:
004E  31 C0                             xor             eax,eax
0050  5E                                pop             esi
0051  5B                                pop             ebx
0052  C3                                ret
0053                            __ReleaseMiniHeap:
0053  53                                push            ebx
0054  56                                push            esi
0055  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0059  50                                push            eax
005A  8B 70 04                          mov             esi,dword ptr 0x4[eax]
005D  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
0060  E8 00 00 00 00                    call            __ReturnMemToSystem
0065  83 C4 04                          add             esp,0x00000004
0068  85 C0                             test            eax,eax
006A  75 16                             jne             L$6
006C  85 F6                             test            esi,esi
006E  75 08                             jne             L$4
0070  89 1D 00 00 00 00                 mov             dword ptr __nheapbeg,ebx
0076  EB 03                             jmp             L$5
0078                            L$4:
0078  89 5E 08                          mov             dword ptr 0x8[esi],ebx
007B                            L$5:
007B  85 DB                             test            ebx,ebx
007D  74 03                             je              L$6
007F  89 73 04                          mov             dword ptr 0x4[ebx],esi
0082                            L$6:
0082  5E                                pop             esi
0083  5B                                pop             ebx
0084  C3                                ret
0085                            L$7:
0085  8B 08                             mov             ecx,dword ptr [eax]
0087  8B 50 24                          mov             edx,dword ptr 0x24[eax]
008A  83 E9 2C                          sub             ecx,0x0000002c
008D  8B 32                             mov             esi,dword ptr [edx]
008F  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
0092  39 F1                             cmp             ecx,esi
0094  75 09                             jne             L$8
0096  50                                push            eax
0097  E8 00 00 00 00                    call            __ReleaseMiniHeap
009C  83 C4 04                          add             esp,0x00000004
009F                            L$8:
009F  89 D8                             mov             eax,ebx
00A1                            L$9:
00A1  85 C0                             test            eax,eax
00A3  75 E0                             jne             L$7
00A5  5E                                pop             esi
00A6  5B                                pop             ebx
00A7  C3                                ret

Routine Size: 168 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

