Module: bsearch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000                            bsearch:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 04 00 00                       enter           0x0004,0x00
0007  8B 45 24                          mov             eax,dword ptr 0x24[ebp]
000A  89 45 FC                          mov             dword ptr -0x4[ebp],eax
000D  83 7D 1C 00                       cmp             dword ptr 0x1c[ebp],0x00000000
0011  74 5D                             je              L$5
0013  8B 45 1C                          mov             eax,dword ptr 0x1c[ebp]
0016  48                                dec             eax
0017  0F AF 45 20                       imul            eax,dword ptr 0x20[ebp]
001B  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
001E  8D 34 03                          lea             esi,[ebx+eax]
0021                            L$1:
0021  39 F3                             cmp             ebx,esi
0023  73 34                             jae             L$4
0025  89 F0                             mov             eax,esi
0027  31 D2                             xor             edx,edx
0029  29 D8                             sub             eax,ebx
002B  F7 75 20                          div             dword ptr 0x20[ebp]
002E  D1 E8                             shr             eax,0x01
0030  0F AF 45 20                       imul            eax,dword ptr 0x20[ebp]
0034  8D 3C 03                          lea             edi,[ebx+eax]
0037  57                                push            edi
0038  FF 75 14                          push            dword ptr 0x14[ebp]
003B  FF 55 FC                          call            dword ptr -0x4[ebp]
003E  83 C4 08                          add             esp,0x00000008
0041  85 C0                             test            eax,eax
0043  75 07                             jne             L$2
0045  89 F8                             mov             eax,edi
0047  C9                                leave
0048  5F                                pop             edi
0049  5E                                pop             esi
004A  5B                                pop             ebx
004B  C3                                ret
004C                            L$2:
004C  7D 04                             jge             L$3
004E  89 FE                             mov             esi,edi
0050  EB CF                             jmp             L$1
0052                            L$3:
0052  8B 5D 20                          mov             ebx,dword ptr 0x20[ebp]
0055  01 FB                             add             ebx,edi
0057  EB C8                             jmp             L$1
0059                            L$4:
0059  75 15                             jne             L$5
005B  56                                push            esi
005C  FF 75 14                          push            dword ptr 0x14[ebp]
005F  FF 55 FC                          call            dword ptr -0x4[ebp]
0062  83 C4 08                          add             esp,0x00000008
0065  85 C0                             test            eax,eax
0067  75 07                             jne             L$5
0069  89 F0                             mov             eax,esi
006B  C9                                leave
006C  5F                                pop             edi
006D  5E                                pop             esi
006E  5B                                pop             ebx
006F  C3                                ret
0070                            L$5:
0070  31 C0                             xor             eax,eax
0072  C9                                leave
0073  5F                                pop             edi
0074  5E                                pop             esi
0075  5B                                pop             ebx
0076  C3                                ret

Routine Size: 119 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

