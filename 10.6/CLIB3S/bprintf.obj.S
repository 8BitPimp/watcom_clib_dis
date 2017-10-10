Module: bprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000089 bytes
0000                            buf_putc:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  8B 02                             mov             eax,dword ptr [edx]
0007  8B 5A 10                          mov             ebx,dword ptr 0x10[edx]
000A  3B 58 04                          cmp             ebx,dword ptr 0x4[eax]
000D  73 10                             jae             L$1
000F  8B 18                             mov             ebx,dword ptr [eax]
0011  8D 4B 01                          lea             ecx,0x1[ebx]
0014  89 08                             mov             dword ptr [eax],ecx
0016  8A 44 24 0C                       mov             al,byte ptr 0xc[esp]
001A  88 03                             mov             byte ptr [ebx],al
001C  FF 42 10                          inc             dword ptr 0x10[edx]
001F                            L$1:
001F  5B                                pop             ebx
0020  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 0000

0021                            _vbprintf:
0021  53                                push            ebx
0022  83 EC 08                          sub             esp,0x00000008
0025  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0029  68 00 00 00 00                    push            offset buf_putc
002E  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0032  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0036  52                                push            edx
0037  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
003B  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
003F  48                                dec             eax
0040  53                                push            ebx
0041  89 44 24 10                       mov             dword ptr 0x10[esp],eax
0045  8D 44 24 0C                       lea             eax,0xc[esp]
0049  50                                push            eax
004A  E8 00 00 00 00                    call            __prtf
004F  83 C4 10                          add             esp,0x00000010
0052  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0056  C6 04 02 00                       mov             byte ptr [edx+eax],0x00
005A  83 C4 08                          add             esp,0x00000008
005D  5B                                pop             ebx
005E  C3                                ret

Routine Size: 62 bytes,    Routine Base: _TEXT + 0021

005F                            _bprintf:
005F  53                                push            ebx
0060  83 EC 04                          sub             esp,0x00000004
0063  8D 44 24 18                       lea             eax,0x18[esp]
0067  89 04 24                          mov             dword ptr [esp],eax
006A  89 E0                             mov             eax,esp
006C  50                                push            eax
006D  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
0071  52                                push            edx
0072  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0076  53                                push            ebx
0077  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
007B  51                                push            ecx
007C  E8 00 00 00 00                    call            _vbprintf
0081  83 C4 10                          add             esp,0x00000010
0084  83 C4 04                          add             esp,0x00000004
0087  5B                                pop             ebx
0088  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 005F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

