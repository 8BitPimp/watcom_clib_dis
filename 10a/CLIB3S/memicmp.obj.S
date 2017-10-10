Module: memicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000                            _memicmp:
0000  53                                push            ebx
0001  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0005  52                                push            edx
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  53                                push            ebx
000B  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
000F  51                                push            ecx
0010  E8 00 00 00 00                    call            memicmp
0015  83 C4 0C                          add             esp,0x0000000c
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A                            memicmp:
001A  53                                push            ebx
001B  83 EC 04                          sub             esp,0x00000004
001E  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0022  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0026  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
002A  EB 42                             jmp             L$5
002C                            L$1:
002C  8A 2A                             mov             ch,byte ptr [edx]
002E  8A 08                             mov             cl,byte ptr [eax]
0030  88 2C 24                          mov             byte ptr [esp],ch
0033  80 F9 41                          cmp             cl,0x41
0036  72 08                             jb              L$2
0038  80 F9 5A                          cmp             cl,0x5a
003B  77 03                             ja              L$2
003D  80 C1 20                          add             cl,0x20
0040                            L$2:
0040  8A 2C 24                          mov             ch,byte ptr [esp]
0043  80 FD 41                          cmp             ch,0x41
0046  72 0B                             jb              L$3
0048  80 FD 5A                          cmp             ch,0x5a
004B  77 06                             ja              L$3
004D  80 C5 20                          add             ch,0x20
0050  88 2C 24                          mov             byte ptr [esp],ch
0053                            L$3:
0053  8A 2C 24                          mov             ch,byte ptr [esp]
0056  38 E9                             cmp             cl,ch
0058  74 11                             je              L$4
005A  31 D2                             xor             edx,edx
005C  31 C0                             xor             eax,eax
005E  88 CA                             mov             dl,cl
0060  88 E8                             mov             al,ch
0062  29 C2                             sub             edx,eax
0064  89 D0                             mov             eax,edx
0066  83 C4 04                          add             esp,0x00000004
0069  5B                                pop             ebx
006A  C3                                ret
006B                            L$4:
006B  40                                inc             eax
006C  42                                inc             edx
006D  4B                                dec             ebx
006E                            L$5:
006E  85 DB                             test            ebx,ebx
0070  75 BA                             jne             L$1
0072  31 C0                             xor             eax,eax
0074  83 C4 04                          add             esp,0x00000004
0077  5B                                pop             ebx
0078  C3                                ret

Routine Size: 95 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

