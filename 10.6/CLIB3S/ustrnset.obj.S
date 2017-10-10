Module: ustrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000                            _ustrnset:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0009  EB 0E                             jmp             L$2
000B                            L$1:
000B  66 83 38 00                       cmp             word ptr [eax],0x0000
000F  74 0E                             je              L$3
0011  FF 4D 10                          dec             dword ptr 0x10[ebp]
0014  66 89 10                          mov             word ptr [eax],dx
0017  40                                inc             eax
0018  40                                inc             eax
0019                            L$2:
0019  83 7D 10 00                       cmp             dword ptr 0x10[ebp],0x00000000
001D  75 EC                             jne             L$1
001F                            L$3:
001F  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0022  5D                                pop             ebp
0023  C3                                ret

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

