Module: gtimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000                            _dos_gettime:
0000  53                                push            ebx
0001  83 EC 10                          sub             esp,0x00000010
0004  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0008  89 E0                             mov             eax,esp
000A  50                                push            eax
000B  E8 00 00 00 00                    call            _GetLocalTime
0010  8A 44 24 08                       mov             al,byte ptr 0x8[esp]
0014  88 03                             mov             byte ptr [ebx],al
0016  8A 44 24 0A                       mov             al,byte ptr 0xa[esp]
001A  88 43 01                          mov             byte ptr 0x1[ebx],al
001D  8A 44 24 0C                       mov             al,byte ptr 0xc[esp]
0021  88 43 02                          mov             byte ptr 0x2[ebx],al
0024  B4 0A                             mov             ah,0x0a
0026  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
002A  F6 E4                             mul             ah
002C  88 43 03                          mov             byte ptr 0x3[ebx],al
002F  83 C4 10                          add             esp,0x00000010
0032  5B                                pop             ebx
0033  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

