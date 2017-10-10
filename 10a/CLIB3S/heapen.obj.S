Module: heapen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000                            _heapenable:
0000  53                                push            ebx
0001  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
0007  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
000B  8B 1D 00 00 00 00                 mov             ebx,dword ptr __heap_enabled
0011  A3 00 00 00 00                    mov             dword ptr __heap_enabled,eax
0016  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
001C  89 D8                             mov             eax,ebx
001E  5B                                pop             ebx
001F  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000                            __heap_enabled:
0000  01 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

