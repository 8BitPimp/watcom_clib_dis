Module: exvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000                            execve_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  89 C7                             mov             edi,eax
0005  89 D6                             mov             esi,edx
0007  89 D9                             mov             ecx,ebx
0009  89 FA                             mov             edx,edi
000B  89 F3                             mov             ebx,esi
000D  31 C0                             xor             eax,eax
000F  E8 00 00 00 00                    call            spawnve_
0014  89 C1                             mov             ecx,eax
0016  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
001C  83 78 04 00                       cmp             dword ptr 0x4[eax],0x00000000
0020  74 09                             je              L$1
0022  B8 FF FF FF FF                    mov             eax,0xffffffff
0027  5F                                pop             edi
0028  5E                                pop             esi
0029  59                                pop             ecx
002A  C3                                ret
002B                            L$1:
002B  FF 15 00 00 00 00                 call            dword ptr ___int23_exit
0031  51                                push            ecx
0032  E8 00 00 00 00                    call            _ExitProcess
0037  31 C0                             xor             eax,eax
0039  5F                                pop             edi
003A  5E                                pop             esi
003B  59                                pop             ecx
003C  C3                                ret

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

