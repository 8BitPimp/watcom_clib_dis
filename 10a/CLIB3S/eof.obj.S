Module: eof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000                            eof:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  52                                push            edx
0006  E8 00 00 00 00                    call            filelength
000B  89 C3                             mov             ebx,eax
000D  83 C4 04                          add             esp,0x00000004
0010  83 F8 FF                          cmp             eax,0xffffffff
0013  74 1F                             je              L$2
0015  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0019  51                                push            ecx
001A  E8 00 00 00 00                    call            tell
001F  83 C4 04                          add             esp,0x00000004
0022  83 F8 FF                          cmp             eax,0xffffffff
0025  74 0D                             je              L$2
0027  39 D8                             cmp             eax,ebx
0029  75 07                             jne             L$1
002B  B8 01 00 00 00                    mov             eax,0x00000001
0030  5B                                pop             ebx
0031  C3                                ret
0032                            L$1:
0032  31 C0                             xor             eax,eax
0034                            L$2:
0034  5B                                pop             ebx
0035  C3                                ret

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

