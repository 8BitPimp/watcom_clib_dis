Module: ustrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000                            _ustrlen:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0006                            L$1:
0006  66 83 38 00                       cmp             word ptr [eax],0x0000
000A  74 04                             je              L$2
000C  40                                inc             eax
000D  40                                inc             eax
000E  EB F6                             jmp             L$1
0010                            L$2:
0010  2B 45 08                          sub             eax,dword ptr 0x8[ebp]
0013  D1 F8                             sar             eax,0x01
0015  5D                                pop             ebp
0016  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

