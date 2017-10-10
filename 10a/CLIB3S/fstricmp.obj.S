Module: fstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004B bytes
0000                            _fstricmp:
0000  53                                push            ebx
0001  06                                push            es
0002  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0006  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
000A                            L$1:
000A  8E 44 24 10                       mov             es,dword ptr 0x10[esp]
000E  26 8A 1A                          mov             bl,byte ptr es:[edx]
0011  80 FB 41                          cmp             bl,0x41
0014  72 08                             jb              L$2
0016  80 FB 5A                          cmp             bl,0x5a
0019  77 03                             ja              L$2
001B  80 C3 20                          add             bl,0x20
001E                            L$2:
001E  8E 44 24 18                       mov             es,dword ptr 0x18[esp]
0022  26 8A 38                          mov             bh,byte ptr es:[eax]
0025  80 FF 41                          cmp             bh,0x41
0028  72 08                             jb              L$3
002A  80 FF 5A                          cmp             bh,0x5a
002D  77 03                             ja              L$3
002F  80 C7 20                          add             bh,0x20
0032                            L$3:
0032  38 FB                             cmp             bl,bh
0034  75 08                             jne             L$4
0036  84 FF                             test            bh,bh
0038  74 04                             je              L$4
003A  42                                inc             edx
003B  40                                inc             eax
003C  EB CC                             jmp             L$1
003E                            L$4:
003E  31 C0                             xor             eax,eax
0040  31 D2                             xor             edx,edx
0042  88 D8                             mov             al,bl
0044  88 FA                             mov             dl,bh
0046  29 D0                             sub             eax,edx
0048  07                                pop             es
0049  5B                                pop             ebx
004A  C3                                ret

Routine Size: 75 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

