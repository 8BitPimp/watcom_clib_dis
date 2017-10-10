Module: strrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000                            _strrev:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  52                                push            edx
0005  E8 00 00 00 00                    call            strrev
000A  83 C4 04                          add             esp,0x00000004
000D  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E                            strrev:
000E  53                                push            ebx
000F  56                                push            esi
0010  57                                push            edi
0011  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0015  89 F7                             mov             edi,esi
0017  06                                push            es
0018  8C D8                             mov             eax,ds
001A  8E C0                             mov             es,eax
001C  29 C9                             sub             ecx,ecx
001E  49                                dec             ecx
001F  31 C0                             xor             eax,eax
0021  F2 AE                             repne scasb
0023  F7 D1                             not             ecx
0025  49                                dec             ecx
0026  07                                pop             es
0027  8D 04 0E                          lea             eax,[esi+ecx]
002A  89 F2                             mov             edx,esi
002C                            L$1:
002C  48                                dec             eax
002D  39 C2                             cmp             edx,eax
002F  73 0B                             jae             L$2
0031  8A 38                             mov             bh,byte ptr [eax]
0033  8A 1A                             mov             bl,byte ptr [edx]
0035  88 3A                             mov             byte ptr [edx],bh
0037  42                                inc             edx
0038  88 18                             mov             byte ptr [eax],bl
003A  EB F0                             jmp             L$1
003C                            L$2:
003C  89 F0                             mov             eax,esi
003E  5F                                pop             edi
003F  5E                                pop             esi
0040  5B                                pop             ebx
0041  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

