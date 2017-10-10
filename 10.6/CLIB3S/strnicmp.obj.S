Module: strnicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000                            _strnicmp:
0000  53                                push            ebx
0001  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0005  52                                push            edx
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  53                                push            ebx
000B  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
000F  51                                push            ecx
0010  E8 00 00 00 00                    call            strnicmp
0015  83 C4 0C                          add             esp,0x0000000c
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A                            strnicmp:
001A  53                                push            ebx
001B  56                                push            esi
001C  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0020  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0024  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
0028                            L$1:
0028  85 F6                             test            esi,esi
002A  75 05                             jne             L$3
002C                            L$2:
002C  31 C0                             xor             eax,eax
002E  5E                                pop             esi
002F  5B                                pop             ebx
0030  C3                                ret
0031                            L$3:
0031  8A 02                             mov             al,byte ptr [edx]
0033  31 C9                             xor             ecx,ecx
0035  8A 23                             mov             ah,byte ptr [ebx]
0037  88 C1                             mov             cl,al
0039  83 F9 41                          cmp             ecx,0x00000041
003C  7C 07                             jl              L$4
003E  83 F9 5A                          cmp             ecx,0x0000005a
0041  7F 02                             jg              L$4
0043  04 20                             add             al,0x20
0045                            L$4:
0045  31 C9                             xor             ecx,ecx
0047  88 E1                             mov             cl,ah
0049  83 F9 41                          cmp             ecx,0x00000041
004C  7C 08                             jl              L$5
004E  83 F9 5A                          cmp             ecx,0x0000005a
0051  7F 03                             jg              L$5
0053  80 C4 20                          add             ah,0x20
0056                            L$5:
0056  38 E0                             cmp             al,ah
0058  74 12                             je              L$6
005A  31 D2                             xor             edx,edx
005C  88 C2                             mov             dl,al
005E  88 E0                             mov             al,ah
0060  25 FF 00 00 00                    and             eax,0x000000ff
0065  29 C2                             sub             edx,eax
0067  89 D0                             mov             eax,edx
0069  5E                                pop             esi
006A  5B                                pop             ebx
006B  C3                                ret
006C                            L$6:
006C  84 E4                             test            ah,ah
006E  74 BC                             je              L$2
0070  42                                inc             edx
0071  43                                inc             ebx
0072  4E                                dec             esi
0073  EB B3                             jmp             L$1

Routine Size: 91 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

