Module: ustrerro
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000                            _ustrerror:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  85 C0                             test            eax,eax
0006  7C 05                             jl              L$1
0008  83 F8 0F                          cmp             eax,0x0000000f
000B  7E 07                             jle             L$2
000D                            L$1:
000D  B8 00 00 00 00                    mov             eax,offset DGROUP:L$4
0012  EB 07                             jmp             L$3
0014                            L$2:
0014  8B 04 85 00 00 00 00              mov             eax,dword ptr sys_errlist[eax*4]
001B                            L$3:
001B  50                                push            eax
001C  68 00 00 00 00                    push            offset Uni_Error_String
0021  E8 00 00 00 00                    call            _atouni
0026  83 C4 08                          add             esp,0x00000008
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000000E bytes
0000                            L$4:
0000  75 6E 6B 6E 6F 77 6E 20 65 72 72 6F 72 00       unknown error.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000050 bytes
0000                            Uni_Error_String:

BSS Size: 80 bytes

