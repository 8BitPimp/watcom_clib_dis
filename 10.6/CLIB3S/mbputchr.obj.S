Module: mbputchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000                            _mbputchar:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  8B 15 00 00 00 00                 mov             edx,dword ptr __IsDBCS
000C  8D 73 01                          lea             esi,0x1[ebx]
000F  85 D2                             test            edx,edx
0011  74 25                             je              L$2
0013  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
0017  51                                push            ecx
0018  E8 00 00 00 00                    call            _ismbclegal
001D  83 C4 04                          add             esp,0x00000004
0020  85 C0                             test            eax,eax
0022  74 0B                             je              L$1
0024  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0028  C1 E8 08                          shr             eax,0x08
002B  88 03                             mov             byte ptr [ebx],al
002D  89 F3                             mov             ebx,esi
002F                            L$1:
002F  8A 44 24 10                       mov             al,byte ptr 0x10[esp]
0033  88 03                             mov             byte ptr [ebx],al
0035  43                                inc             ebx
0036  EB 08                             jmp             L$3
0038                            L$2:
0038  8A 44 24 10                       mov             al,byte ptr 0x10[esp]
003C  88 03                             mov             byte ptr [ebx],al
003E  89 F3                             mov             ebx,esi
0040                            L$3:
0040  89 D8                             mov             eax,ebx
0042  C6 03 00                          mov             byte ptr [ebx],0x00
0045  5E                                pop             esi
0046  5B                                pop             ebx
0047  C3                                ret

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

