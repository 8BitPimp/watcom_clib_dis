Module: fmemicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000                            _fmemicmp:
0000  53                                push            ebx
0001  06                                push            es
0002  83 EC 04                          sub             esp,0x00000004
0005  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0009  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
000D  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0011  EB 44                             jmp             L$5
0013                            L$1:
0013  8E 44 24 14                       mov             es,dword ptr 0x14[esp]
0017  26 8A 0A                          mov             cl,byte ptr es:[edx]
001A  88 0C 24                          mov             byte ptr [esp],cl
001D  80 F9 41                          cmp             cl,0x41
0020  72 0B                             jb              L$2
0022  80 F9 5A                          cmp             cl,0x5a
0025  77 06                             ja              L$2
0027  80 C1 20                          add             cl,0x20
002A  88 0C 24                          mov             byte ptr [esp],cl
002D                            L$2:
002D  8E 44 24 1C                       mov             es,dword ptr 0x1c[esp]
0031  26 8A 08                          mov             cl,byte ptr es:[eax]
0034  80 F9 41                          cmp             cl,0x41
0037  72 08                             jb              L$3
0039  80 F9 5A                          cmp             cl,0x5a
003C  77 03                             ja              L$3
003E  80 C1 20                          add             cl,0x20
0041                            L$3:
0041  8A 2C 24                          mov             ch,byte ptr [esp]
0044  38 E9                             cmp             cl,ch
0046  74 0C                             je              L$4
0048  31 C0                             xor             eax,eax
004A  31 D2                             xor             edx,edx
004C  88 E8                             mov             al,ch
004E  88 CA                             mov             dl,cl
0050  29 D0                             sub             eax,edx
0052  EB 09                             jmp             L$6
0054                            L$4:
0054  42                                inc             edx
0055  40                                inc             eax
0056  4B                                dec             ebx
0057                            L$5:
0057  85 DB                             test            ebx,ebx
0059  75 B8                             jne             L$1
005B  31 C0                             xor             eax,eax
005D                            L$6:
005D  83 C4 04                          add             esp,0x00000004
0060  07                                pop             es
0061  5B                                pop             ebx
0062  C3                                ret

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

