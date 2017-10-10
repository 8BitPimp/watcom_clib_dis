Module: fstrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000                            _fstrrchr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  0F B4 44 24 18                    lfs             eax,fword ptr 0x18[esp]
000B  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
000F  31 FF                             xor             edi,edi
0011  31 DB                             xor             ebx,ebx
0013                            L$1:
0013  31 D2                             xor             edx,edx
0015  64 8A 10                          mov             dl,byte ptr fs:[eax]
0018  39 F2                             cmp             edx,esi
001A  75 04                             jne             L$2
001C  8C E7                             mov             edi,fs
001E  89 C3                             mov             ebx,eax
0020                            L$2:
0020  8C E2                             mov             edx,fs
0022  8E C2                             mov             es,edx
0024  89 C2                             mov             edx,eax
0026  26 8A 0A                          mov             cl,byte ptr es:[edx]
0029  40                                inc             eax
002A  84 C9                             test            cl,cl
002C  75 E5                             jne             L$1
002E  89 FA                             mov             edx,edi
0030  89 D8                             mov             eax,ebx
0032  0F A1                             pop             fs
0034  07                                pop             es
0035  5F                                pop             edi
0036  5E                                pop             esi
0037  5B                                pop             ebx
0038  C3                                ret

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

