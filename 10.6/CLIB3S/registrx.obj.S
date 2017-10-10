Module: registrx
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000                            _beginthreadex:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
0008  52                                push            edx
0009  8B 5C 24 28                       mov             ebx,dword ptr 0x28[esp]
000D  53                                push            ebx
000E  8B 4C 24 28                       mov             ecx,dword ptr 0x28[esp]
0012  51                                push            ecx
0013  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
0017  56                                push            esi
0018  8B 7C 24 28                       mov             edi,dword ptr 0x28[esp]
001C  57                                push            edi
001D  8B 6C 24 28                       mov             ebp,dword ptr 0x28[esp]
0021  55                                push            ebp
0022  FF 15 00 00 00 00                 call            dword ptr __BeginThreadEx
0028  83 C4 18                          add             esp,0x00000018
002B  5D                                pop             ebp
002C  5F                                pop             edi
002D  5E                                pop             esi
002E  5B                                pop             ebx
002F  C3                                ret

Routine Size: 48 bytes,    Routine Base: _TEXT + 0000

0030                            _endthreadex:
0030  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0034  52                                push            edx
0035  FF 15 00 00 00 00                 call            dword ptr __EndThreadEx
003B  83 C4 04                          add             esp,0x00000004
003E  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 0030

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000                            __BeginThreadEx:
0000  00 00 00 00                                     DD        offset __CBeginThreadEx
0004                            __EndThreadEx:
0004  00 00 00 00                                     DD        offset __CEndThreadEx

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

