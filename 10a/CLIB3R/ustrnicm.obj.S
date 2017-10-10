Module: ustrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000                            _ustrnicmp_:
0000  51                                push            ecx
0001  56                                push            esi
0002                            L$1:
0002  85 DB                             test            ebx,ebx
0004  75 05                             jne             L$3
0006                            L$2:
0006  31 C0                             xor             eax,eax
0008  5E                                pop             esi
0009  59                                pop             ecx
000A  C3                                ret
000B                            L$3:
000B  66 8B 08                          mov             cx,word ptr [eax]
000E  66 8B 32                          mov             si,word ptr [edx]
0011  F6 C5 FF                          test            ch,0xff
0014  75 25                             jne             L$5
0016  66 F7 C6 00 FF                    test            si,0xff00
001B  75 1E                             jne             L$5
001D  66 83 F9 41                       cmp             cx,0x0041
0021  72 09                             jb              L$4
0023  66 83 F9 5A                       cmp             cx,0x005a
0027  77 03                             ja              L$4
0029  83 C1 20                          add             ecx,0x00000020
002C                            L$4:
002C  66 83 FE 41                       cmp             si,0x0041
0030  72 09                             jb              L$5
0032  66 83 FE 5A                       cmp             si,0x005a
0036  77 03                             ja              L$5
0038  83 C6 20                          add             esi,0x00000020
003B                            L$5:
003B  66 39 F1                          cmp             cx,si
003E  74 0B                             je              L$6
0040  0F B7 C1                          movzx           eax,cx
0043  0F B7 D6                          movzx           edx,si
0046  29 D0                             sub             eax,edx
0048  5E                                pop             esi
0049  59                                pop             ecx
004A  C3                                ret
004B                            L$6:
004B  66 85 F6                          test            si,si
004E  74 B6                             je              L$2
0050  40                                inc             eax
0051  40                                inc             eax
0052  42                                inc             edx
0053  42                                inc             edx
0054  4B                                dec             ebx
0055  EB AB                             jmp             L$1

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

