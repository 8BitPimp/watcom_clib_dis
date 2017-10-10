Module: nheapmin
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CD bytes
0000                            _heapshrink:
0000                            _heapmin:
0000                            _nheapmin:
0000                            _nheapshrink:
0000  53                                push            ebx
0001  56                                push            esi
0002  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
0008  A1 00 00 00 00                    mov             eax,dword ptr __nheapbeg
000D  E9 AC 00 00 00                    jmp             L$10
0012                            __ReturnMemToSystem:
0012  53                                push            ebx
0013  56                                push            esi
0014  57                                push            edi
0015  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0019  68 00 80 00 00                    push            0x00008000
001E  6A 00                             push            0x00000000
0020  53                                push            ebx
0021  8B 73 08                          mov             esi,dword ptr 0x8[ebx]
0024  E8 00 00 00 00                    call            _VirtualFree
0029  85 C0                             test            eax,eax
002B  75 09                             jne             L$1
002D  B8 FF FF FF FF                    mov             eax,0xffffffff
0032  5F                                pop             edi
0033  5E                                pop             esi
0034  5B                                pop             ebx
0035  C3                                ret
0036                            L$1:
0036  3B 1D 00 00 00 00                 cmp             ebx,dword ptr __MiniHeapRover
003C  75 1C                             jne             L$3
003E  85 F6                             test            esi,esi
0040  74 08                             je              L$2
0042  89 35 00 00 00 00                 mov             dword ptr __MiniHeapRover,esi
0048  EB 10                             jmp             L$3
004A                            L$2:
004A  A1 00 00 00 00                    mov             eax,dword ptr __nheapbeg
004F  89 35 00 00 00 00                 mov             dword ptr __LargestSizeB4MiniHeapRover,esi
0055  A3 00 00 00 00                    mov             dword ptr __MiniHeapRover,eax
005A                            L$3:
005A  3B 1D 00 00 00 00                 cmp             ebx,dword ptr __MiniHeapFreeRover
0060  75 08                             jne             L$4
0062  31 FF                             xor             edi,edi
0064  89 3D 00 00 00 00                 mov             dword ptr __MiniHeapFreeRover,edi
006A                            L$4:
006A  31 C0                             xor             eax,eax
006C  5F                                pop             edi
006D  5E                                pop             esi
006E  5B                                pop             ebx
006F  C3                                ret
0070                            __ReleaseMiniHeap:
0070  53                                push            ebx
0071  56                                push            esi
0072  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0076  50                                push            eax
0077  8B 70 04                          mov             esi,dword ptr 0x4[eax]
007A  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
007D  E8 00 00 00 00                    call            __ReturnMemToSystem
0082  83 C4 04                          add             esp,0x00000004
0085  85 C0                             test            eax,eax
0087  75 16                             jne             L$7
0089  85 F6                             test            esi,esi
008B  75 08                             jne             L$5
008D  89 1D 00 00 00 00                 mov             dword ptr __nheapbeg,ebx
0093  EB 03                             jmp             L$6
0095                            L$5:
0095  89 5E 08                          mov             dword ptr 0x8[esi],ebx
0098                            L$6:
0098  85 DB                             test            ebx,ebx
009A  74 03                             je              L$7
009C  89 73 04                          mov             dword ptr 0x4[ebx],esi
009F                            L$7:
009F  5E                                pop             esi
00A0  5B                                pop             ebx
00A1  C3                                ret
00A2                            L$8:
00A2  8B 08                             mov             ecx,dword ptr [eax]
00A4  8B 50 24                          mov             edx,dword ptr 0x24[eax]
00A7  83 E9 2C                          sub             ecx,0x0000002c
00AA  8B 32                             mov             esi,dword ptr [edx]
00AC  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
00AF  39 F1                             cmp             ecx,esi
00B1  75 09                             jne             L$9
00B3  50                                push            eax
00B4  E8 00 00 00 00                    call            __ReleaseMiniHeap
00B9  83 C4 04                          add             esp,0x00000004
00BC                            L$9:
00BC  89 D8                             mov             eax,ebx
00BE                            L$10:
00BE  85 C0                             test            eax,eax
00C0  75 E0                             jne             L$8
00C2  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
00C8  31 C0                             xor             eax,eax
00CA  5E                                pop             esi
00CB  5B                                pop             ebx
00CC  C3                                ret

Routine Size: 205 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

