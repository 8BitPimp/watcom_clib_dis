Module: fmemset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000026 bytes
0000                            _fmemset:
0000  57                                push            edi
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  8B 7C 24 08                       mov             edi,dword ptr 0x8[esp]
0009  8A 44 24 10                       mov             al,byte ptr 0x10[esp]
000D  8B 4C 24 14                       mov             ecx,dword ptr 0x14[esp]
0011  06                                push            es
0012  57                                push            edi
0013  8E C2                             mov             es,edx
0015  88 C4                             mov             ah,al
0017  D1 E9                             shr             ecx,0x01
0019  F2 66 AB                          repne stosw
001C  11 C9                             adc             ecx,ecx
001E  F2 AA                             repne stosb
0020  5F                                pop             edi
0021  07                                pop             es
0022  89 F8                             mov             eax,edi
0024  5F                                pop             edi
0025  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

