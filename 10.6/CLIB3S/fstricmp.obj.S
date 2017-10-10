Module: fstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000                            _fstricmp:
0000  53                                push            ebx
0001  06                                push            es
0002  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0006  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
000A                            L$1:
000A  8E 44 24 10                       mov             es,dword ptr 0x10[esp]
000E  31 C9                             xor             ecx,ecx
0010  26 8A 02                          mov             al,byte ptr es:[edx]
0013  88 C1                             mov             cl,al
0015  83 F9 41                          cmp             ecx,0x00000041
0018  7C 07                             jl              L$2
001A  83 F9 5A                          cmp             ecx,0x0000005a
001D  7F 02                             jg              L$2
001F  04 20                             add             al,0x20
0021                            L$2:
0021  8E 44 24 18                       mov             es,dword ptr 0x18[esp]
0025  31 C9                             xor             ecx,ecx
0027  26 8A 23                          mov             ah,byte ptr es:[ebx]
002A  88 E1                             mov             cl,ah
002C  83 F9 41                          cmp             ecx,0x00000041
002F  7C 08                             jl              L$3
0031  83 F9 5A                          cmp             ecx,0x0000005a
0034  7F 03                             jg              L$3
0036  80 C4 20                          add             ah,0x20
0039                            L$3:
0039  38 E0                             cmp             al,ah
003B  75 08                             jne             L$4
003D  84 E4                             test            ah,ah
003F  74 04                             je              L$4
0041  42                                inc             edx
0042  43                                inc             ebx
0043  EB C5                             jmp             L$1
0045                            L$4:
0045  31 D2                             xor             edx,edx
0047  88 C2                             mov             dl,al
0049  88 E0                             mov             al,ah
004B  25 FF 00 00 00                    and             eax,0x000000ff
0050  29 C2                             sub             edx,eax
0052  89 D0                             mov             eax,edx
0054  07                                pop             es
0055  5B                                pop             ebx
0056  C3                                ret

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

