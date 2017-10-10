Module: cmdname
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000                            _cmdname:
0000  56                                push            esi
0001  57                                push            edi
0002  8B 35 00 00 00 00                 mov             esi,dword ptr _argv
0008  8B 7C 24 0C                       mov             edi,dword ptr 0xc[esp]
000C  8B 36                             mov             esi,dword ptr [esi]
000E  57                                push            edi
000F                            L$1:
000F  8A 06                             mov             al,byte ptr [esi]
0011  88 07                             mov             byte ptr [edi],al
0013  3C 00                             cmp             al,0x00
0015  74 10                             je              L$2
0017  8A 46 01                          mov             al,byte ptr 0x1[esi]
001A  83 C6 02                          add             esi,0x00000002
001D  88 47 01                          mov             byte ptr 0x1[edi],al
0020  83 C7 02                          add             edi,0x00000002
0023  3C 00                             cmp             al,0x00
0025  75 E8                             jne             L$1
0027                            L$2:
0027  5F                                pop             edi
0028  89 F8                             mov             eax,edi
002A  5F                                pop             edi
002B  5E                                pop             esi
002C  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

