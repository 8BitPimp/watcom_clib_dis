Module: nheapmin
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A5 bytes
0000                            _heapshrink_:
0000                            _heapmin_:
0000                            _nheapmin_:
0000                            _nheapshrink_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  A1 00 00 00 00                    mov             eax,dword ptr ___nheapbeg
0009  E9 8E 00 00 00                    jmp             L$9
000E                            __ReturnMemToSystem_:
000E  53                                push            ebx
000F  51                                push            ecx
0010  52                                push            edx
0011  56                                push            esi
0012  89 C3                             mov             ebx,eax
0014  50                                push            eax
0015  8B 70 08                          mov             esi,dword ptr 0x8[eax]
0018  E8 00 00 00 00                    call            _LocalFree
001D  85 C0                             test            eax,eax
001F  74 0A                             je              L$1
0021  B8 FF FF FF FF                    mov             eax,0xffffffff
0026  5E                                pop             esi
0027  5A                                pop             edx
0028  59                                pop             ecx
0029  5B                                pop             ebx
002A  C3                                ret
002B                            L$1:
002B  8B 15 00 00 00 00                 mov             edx,dword ptr ___MiniHeapRover
0031  39 D3                             cmp             ebx,edx
0033  75 1E                             jne             L$3
0035  85 F6                             test            esi,esi
0037  74 08                             je              L$2
0039  89 35 00 00 00 00                 mov             dword ptr ___MiniHeapRover,esi
003F  EB 12                             jmp             L$3
0041                            L$2:
0041  A1 00 00 00 00                    mov             eax,dword ptr ___nheapbeg
0046  31 D3                             xor             ebx,edx
0048  A3 00 00 00 00                    mov             dword ptr ___MiniHeapRover,eax
004D  89 1D 00 00 00 00                 mov             dword ptr ___LargestSizeB4MiniHeapRover,ebx
0053                            L$3:
0053  31 C0                             xor             eax,eax
0055  5E                                pop             esi
0056  5A                                pop             edx
0057  59                                pop             ecx
0058  5B                                pop             ebx
0059  C3                                ret
005A                            __ReleaseMiniHeap_:
005A  53                                push            ebx
005B  52                                push            edx
005C  8B 58 04                          mov             ebx,dword ptr 0x4[eax]
005F  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0062  E8 00 00 00 00                    call            __ReturnMemToSystem_
0067  85 C0                             test            eax,eax
0069  75 16                             jne             L$6
006B  85 DB                             test            ebx,ebx
006D  75 08                             jne             L$4
006F  89 15 00 00 00 00                 mov             dword ptr ___nheapbeg,edx
0075  EB 03                             jmp             L$5
0077                            L$4:
0077  89 53 08                          mov             dword ptr 0x8[ebx],edx
007A                            L$5:
007A  85 D2                             test            edx,edx
007C  74 03                             je              L$6
007E  89 5A 04                          mov             dword ptr 0x4[edx],ebx
0081                            L$6:
0081  5A                                pop             edx
0082  5B                                pop             ebx
0083  C3                                ret
0084                            L$7:
0084  8B 08                             mov             ecx,dword ptr [eax]
0086  8B 50 24                          mov             edx,dword ptr 0x24[eax]
0089  83 E9 2C                          sub             ecx,0x0000002c
008C  8B 32                             mov             esi,dword ptr [edx]
008E  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
0091  39 F1                             cmp             ecx,esi
0093  75 05                             jne             L$8
0095  E8 00 00 00 00                    call            __ReleaseMiniHeap_
009A                            L$8:
009A  89 D8                             mov             eax,ebx
009C                            L$9:
009C  85 C0                             test            eax,eax
009E  75 E4                             jne             L$7
00A0  5E                                pop             esi
00A1  5A                                pop             edx
00A2  59                                pop             ecx
00A3  5B                                pop             ebx
00A4  C3                                ret

Routine Size: 165 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

