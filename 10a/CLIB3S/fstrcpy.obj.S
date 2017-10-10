Module: fstrcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000                            _fstrcpy:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0007  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
000B  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
000F  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0013  1E                                push            ds
0014  06                                push            es
0015  50                                push            eax
0016  66 8E C2                          mov             es,dx
0019  66 8E D9                          mov             ds,cx
001C  8B F3                             mov             esi,ebx
001E  8B F8                             mov             edi,eax
0020                            L$1:
0020  8A 06                             mov             al,byte ptr [esi]
0022  26 88 07                          mov             byte ptr es:[edi],al
0025  3C 00                             cmp             al,0x00
0027  0F 84 11 00 00 00                 je              L$2
002D  8A 46 01                          mov             al,byte ptr 0x1[esi]
0030  83 C6 02                          add             esi,0x00000002
0033  26 88 47 01                       mov             byte ptr es:0x1[edi],al
0037  83 C7 02                          add             edi,0x00000002
003A  3C 00                             cmp             al,0x00
003C  75 E2                             jne             L$1
003E                            L$2:
003E  58                                pop             eax
003F  07                                pop             es
0040  1F                                pop             ds
0041  5F                                pop             edi
0042  5E                                pop             esi
0043  5B                                pop             ebx
0044  C3                                ret

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

