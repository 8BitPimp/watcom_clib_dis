Module: segread
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 0000002A bytes
0000                            segread:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  8C C8                             mov             eax,cs
0007  66 89 43 02                       mov             word ptr 0x2[ebx],ax
000B  8C D8                             mov             eax,ds
000D  66 89 43 06                       mov             word ptr 0x6[ebx],ax
0011  8C C0                             mov             eax,es
0013  66 89 03                          mov             word ptr [ebx],ax
0016  8C D0                             mov             eax,ss
0018  66 89 43 04                       mov             word ptr 0x4[ebx],ax
001C  8C E0                             mov             eax,fs
001E  66 89 43 08                       mov             word ptr 0x8[ebx],ax
0022  8C E8                             mov             eax,gs
0024  66 89 43 0A                       mov             word ptr 0xa[ebx],ax
0028  5B                                pop             ebx
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

