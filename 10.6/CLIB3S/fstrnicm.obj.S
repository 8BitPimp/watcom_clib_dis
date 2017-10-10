Module: fstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            _fstrnicmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  06                                push            es
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
000B  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
000F                            L$1:
000F  85 F6                             test            esi,esi
0011  75 06                             jne             L$3
0013                            L$2:
0013  31 C0                             xor             eax,eax
0015  07                                pop             es
0016  5E                                pop             esi
0017  5B                                pop             ebx
0018  C3                                ret
0019                            L$3:
0019  8E 44 24 14                       mov             es,dword ptr 0x14[esp]
001D  31 C9                             xor             ecx,ecx
001F  26 8A 03                          mov             al,byte ptr es:[ebx]
0022  88 C1                             mov             cl,al
0024  83 F9 41                          cmp             ecx,0x00000041
0027  7C 07                             jl              L$4
0029  83 F9 5A                          cmp             ecx,0x0000005a
002C  7F 02                             jg              L$4
002E  04 20                             add             al,0x20
0030                            L$4:
0030  8E 44 24 1C                       mov             es,dword ptr 0x1c[esp]
0034  31 C9                             xor             ecx,ecx
0036  26 8A 22                          mov             ah,byte ptr es:[edx]
0039  88 E1                             mov             cl,ah
003B  83 F9 41                          cmp             ecx,0x00000041
003E  7C 08                             jl              L$5
0040  83 F9 5A                          cmp             ecx,0x0000005a
0043  7F 03                             jg              L$5
0045  80 C4 20                          add             ah,0x20
0048                            L$5:
0048  38 E0                             cmp             al,ah
004A  74 13                             je              L$6
004C  31 D2                             xor             edx,edx
004E  88 C2                             mov             dl,al
0050  88 E0                             mov             al,ah
0052  25 FF 00 00 00                    and             eax,0x000000ff
0057  29 C2                             sub             edx,eax
0059  89 D0                             mov             eax,edx
005B  07                                pop             es
005C  5E                                pop             esi
005D  5B                                pop             ebx
005E  C3                                ret
005F                            L$6:
005F  84 E4                             test            ah,ah
0061  74 B0                             je              L$2
0063  43                                inc             ebx
0064  42                                inc             edx
0065  4E                                dec             esi
0066  EB A7                             jmp             L$1

Routine Size: 104 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

