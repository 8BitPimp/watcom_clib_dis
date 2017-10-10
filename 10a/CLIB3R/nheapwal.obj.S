Module: nheapwal
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C3 bytes
0000                            _heapwalk_:
0000                            _nheapwalk_:
0000  53                                push            ebx
0001  52                                push            edx
0002  89 C2                             mov             edx,eax
0004  FF 15 00 00 00 00                 call            dword ptr __AccessNHeap
000A  8B 1D 00 00 00 00                 mov             ebx,dword ptr ___nheapbeg
0010  89 D0                             mov             eax,edx
0012  89 DA                             mov             edx,ebx
0014  E8 00 00 00 00                    call            __NHeapWalk_
0019  89 C2                             mov             edx,eax
001B  FF 15 00 00 00 00                 call            dword ptr __ReleaseNHeap
0021  89 D0                             mov             eax,edx
0023  5A                                pop             edx
0024  5B                                pop             ebx
0025  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

0026                            __NHeapWalk_:
0026  53                                push            ebx
0027  51                                push            ecx
0028  55                                push            ebp
0029  89 C3                             mov             ebx,eax
002B  85 D2                             test            edx,edx
002D  75 09                             jne             L$1
002F  B8 01 00 00 00                    mov             eax,0x00000001
0034  5D                                pop             ebp
0035  59                                pop             ecx
0036  5B                                pop             ebx
0037  C3                                ret
0038                            L$1:
0038  8B 00                             mov             eax,dword ptr [eax]
003A  85 C0                             test            eax,eax
003C  75 05                             jne             L$2
003E  8D 42 2C                          lea             eax,0x2c[edx]
0041  EB 30                             jmp             L$7
0043                            L$2:
0043  8B 15 00 00 00 00                 mov             edx,dword ptr ___nheapbeg
0049                            L$3:
0049  8B 4A 08                          mov             ecx,dword ptr 0x8[edx]
004C  85 C9                             test            ecx,ecx
004E  74 0D                             je              L$5
0050  39 C2                             cmp             edx,eax
0052  77 04                             ja              L$4
0054  39 C8                             cmp             eax,ecx
0056  72 05                             jb              L$5
0058                            L$4:
0058  8B 52 08                          mov             edx,dword ptr 0x8[edx]
005B  EB EC                             jmp             L$3
005D                            L$5:
005D  8B 08                             mov             ecx,dword ptr [eax]
005F  80 E1 FE                          and             cl,0xfe
0062  01 C1                             add             ecx,eax
0064  39 C1                             cmp             ecx,eax
0066  77 09                             ja              L$6
0068  B8 03 00 00 00                    mov             eax,0x00000003
006D  5D                                pop             ebp
006E  59                                pop             ecx
006F  5B                                pop             ebx
0070  C3                                ret
0071                            L$6:
0071  89 C8                             mov             eax,ecx
0073                            L$7:
0073  83 38 FF                          cmp             dword ptr [eax],0xffffffff
0076  75 25                             jne             L$9
0078  8B 6A 08                          mov             ebp,dword ptr 0x8[edx]
007B  85 ED                             test            ebp,ebp
007D  75 17                             jne             L$8
007F  66 C7 43 04 00 00                 mov             word ptr 0x4[ebx],0x0000
0085  89 6B 0A                          mov             dword ptr 0xa[ebx],ebp
0088  89 6B 06                          mov             dword ptr 0x6[ebx],ebp
008B  B8 04 00 00 00                    mov             eax,0x00000004
0090  89 2B                             mov             dword ptr [ebx],ebp
0092  5D                                pop             ebp
0093  59                                pop             ecx
0094  5B                                pop             ebx
0095  C3                                ret
0096                            L$8:
0096  89 EA                             mov             edx,ebp
0098  8D 45 2C                          lea             eax,0x2c[ebp]
009B  EB D6                             jmp             L$7
009D                            L$9:
009D  C7 43 0A 01 00 00 00              mov             dword ptr 0xa[ebx],0x00000001
00A4  8C 5B 04                          mov             dword ptr 0x4[ebx],ds
00A7  89 03                             mov             dword ptr [ebx],eax
00A9  8B 10                             mov             edx,dword ptr [eax]
00AB  80 E2 FE                          and             dl,0xfe
00AE  89 53 06                          mov             dword ptr 0x6[ebx],edx
00B1  F6 00 01                          test            byte ptr [eax],0x01
00B4  74 07                             je              L$10
00B6  C7 43 0A 00 00 00 00              mov             dword ptr 0xa[ebx],0x00000000
00BD                            L$10:
00BD  31 C0                             xor             eax,eax
00BF  5D                                pop             ebp
00C0  59                                pop             ecx
00C1  5B                                pop             ebx
00C2  C3                                ret

Routine Size: 157 bytes,    Routine Base: _TEXT + 0026

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

