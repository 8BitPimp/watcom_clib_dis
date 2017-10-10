Module: fstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000                            _fstrchr:
0000  53                                push            ebx
0001  06                                push            es
0002  0F A0                             push            fs
0004  0F B4 44 24 10                    lfs             eax,fword ptr 0x10[esp]
0009  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000D                            L$1:
000D  31 D2                             xor             edx,edx
000F  64 8A 10                          mov             dl,byte ptr fs:[eax]
0012  39 DA                             cmp             edx,ebx
0014  75 07                             jne             L$2
0016  8C E2                             mov             edx,fs
0018  0F A1                             pop             fs
001A  07                                pop             es
001B  5B                                pop             ebx
001C  C3                                ret
001D                            L$2:
001D  8C E2                             mov             edx,fs
001F  8E C2                             mov             es,edx
0021  89 C2                             mov             edx,eax
0023  26 8A 0A                          mov             cl,byte ptr es:[edx]
0026  40                                inc             eax
0027  84 C9                             test            cl,cl
0029  75 E2                             jne             L$1
002B  31 D2                             xor             edx,edx
002D  31 C0                             xor             eax,eax
002F  0F A1                             pop             fs
0031  07                                pop             es
0032  5B                                pop             ebx
0033  C3                                ret

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

