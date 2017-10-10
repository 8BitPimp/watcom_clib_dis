Module: memmax
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000                            _memmax:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
0009  BF FC FF FF FF                    mov             edi,0xfffffffc
000E  8B 35 00 00 00 00                 mov             esi,dword ptr __nheapbeg
0014  31 DB                             xor             ebx,ebx
0016  EB 1C                             jmp             L$5
0018                            L$1:
0018  8D 4E 20                          lea             ecx,0x20[esi]
001B  8B 46 28                          mov             eax,dword ptr 0x28[esi]
001E                            L$2:
001E  39 C8                             cmp             eax,ecx
0020  74 0F                             je              L$4
0022  8B 10                             mov             edx,dword ptr [eax]
0024  01 FA                             add             edx,edi
0026  39 DA                             cmp             edx,ebx
0028  76 02                             jbe             L$3
002A  89 D3                             mov             ebx,edx
002C                            L$3:
002C  8B 40 08                          mov             eax,dword ptr 0x8[eax]
002F  EB ED                             jmp             L$2
0031                            L$4:
0031  8B 76 08                          mov             esi,dword ptr 0x8[esi]
0034                            L$5:
0034  85 F6                             test            esi,esi
0036  75 E0                             jne             L$1
0038  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
003E  89 D8                             mov             eax,ebx
0040  5F                                pop             edi
0041  5E                                pop             esi
0042  5B                                pop             ebx
0043  C3                                ret

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

