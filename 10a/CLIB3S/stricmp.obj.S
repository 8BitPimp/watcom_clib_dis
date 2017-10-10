Module: stricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000056 bytes
0000                            strcmpi:
0000                            _stricmp:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
000A  53                                push            ebx
000B  E8 00 00 00 00                    call            stricmp
0010  83 C4 08                          add             esp,0x00000008
0013  5B                                pop             ebx
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015                            stricmp:
0015  53                                push            ebx
0016  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
001A  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
001E                            L$1:
001E  8A 18                             mov             bl,byte ptr [eax]
0020  8A 3A                             mov             bh,byte ptr [edx]
0022  80 FB 41                          cmp             bl,0x41
0025  72 08                             jb              L$2
0027  80 FB 5A                          cmp             bl,0x5a
002A  77 03                             ja              L$2
002C  80 C3 20                          add             bl,0x20
002F                            L$2:
002F  80 FF 41                          cmp             bh,0x41
0032  72 08                             jb              L$3
0034  80 FF 5A                          cmp             bh,0x5a
0037  77 03                             ja              L$3
0039  80 C7 20                          add             bh,0x20
003C                            L$3:
003C  38 FB                             cmp             bl,bh
003E  75 08                             jne             L$4
0040  84 FF                             test            bh,bh
0042  74 04                             je              L$4
0044  40                                inc             eax
0045  42                                inc             edx
0046  EB D6                             jmp             L$1
0048                            L$4:
0048  31 D2                             xor             edx,edx
004A  31 C0                             xor             eax,eax
004C  88 DA                             mov             dl,bl
004E  88 F8                             mov             al,bh
0050  29 C2                             sub             edx,eax
0052  89 D0                             mov             eax,edx
0054  5B                                pop             ebx
0055  C3                                ret

Routine Size: 65 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

