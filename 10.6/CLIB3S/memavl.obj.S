Module: memavl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000040 bytes
0000                            _memavl:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
0009  BF FC FF FF FF                    mov             edi,0xfffffffc
000E  8B 35 00 00 00 00                 mov             esi,dword ptr __nheapbeg
0014  31 DB                             xor             ebx,ebx
0016  EB 18                             jmp             L$4
0018                            L$1:
0018  8D 4E 20                          lea             ecx,0x20[esi]
001B  8B 46 28                          mov             eax,dword ptr 0x28[esi]
001E                            L$2:
001E  39 C8                             cmp             eax,ecx
0020  74 0B                             je              L$3
0022  8B 10                             mov             edx,dword ptr [eax]
0024  01 FA                             add             edx,edi
0026  8B 40 08                          mov             eax,dword ptr 0x8[eax]
0029  01 D3                             add             ebx,edx
002B  EB F1                             jmp             L$2
002D                            L$3:
002D  8B 76 08                          mov             esi,dword ptr 0x8[esi]
0030                            L$4:
0030  85 F6                             test            esi,esi
0032  75 E4                             jne             L$1
0034  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
003A  89 D8                             mov             eax,ebx
003C  5F                                pop             edi
003D  5E                                pop             esi
003E  5B                                pop             ebx
003F  C3                                ret

Routine Size: 64 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

