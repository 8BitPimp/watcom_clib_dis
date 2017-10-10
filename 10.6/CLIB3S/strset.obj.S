Module: strset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000                            strset:
0000  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0004  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0008  EB 03                             jmp             L$2
000A                            L$1:
000A  88 10                             mov             byte ptr [eax],dl
000C  40                                inc             eax
000D                            L$2:
000D  80 38 00                          cmp             byte ptr [eax],0x00
0010  75 F8                             jne             L$1
0012  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0016  C3                                ret

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

