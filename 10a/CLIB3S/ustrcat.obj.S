Module: ustrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000                            _ustrcat:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 55 10                          mov             edx,dword ptr 0x10[ebp]
0007  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
000A                            L$1:
000A  66 83 38 00                       cmp             word ptr [eax],0x0000
000E  74 04                             je              L$2
0010  40                                inc             eax
0011  40                                inc             eax
0012  EB F6                             jmp             L$1
0014                            L$2:
0014  66 8B 1A                          mov             bx,word ptr [edx]
0017  42                                inc             edx
0018  42                                inc             edx
0019  66 89 18                          mov             word ptr [eax],bx
001C  40                                inc             eax
001D  40                                inc             eax
001E  66 85 DB                          test            bx,bx
0021  75 F1                             jne             L$2
0023  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0026  5D                                pop             ebp
0027  5B                                pop             ebx
0028  C3                                ret

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

