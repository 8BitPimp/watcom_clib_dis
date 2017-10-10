Module: nrealloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000083 bytes
0000                            realloc_:
0000                            _nrealloc_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  55                                push            ebp
0005  83 EC 04                          sub             esp,0x00000004
0008  89 C3                             mov             ebx,eax
000A  89 D1                             mov             ecx,edx
000C  85 C0                             test            eax,eax
000E  75 09                             jne             L$1
0010  89 D0                             mov             eax,edx
0012  E8 00 00 00 00                    call            _nmalloc_
0017  EB 61                             jmp             L$5
0019                            L$1:
0019  85 D2                             test            edx,edx
001B  75 09                             jne             L$2
001D  E8 00 00 00 00                    call            _nfree_
0022  31 C0                             xor             eax,eax
0024  EB 54                             jmp             L$5
0026                            L$2:
0026  E8 00 00 00 00                    call            _nmsize_
002B  89 C5                             mov             ebp,eax
002D  89 D8                             mov             eax,ebx
002F  E8 00 00 00 00                    call            _nexpand_
0034  89 04 24                          mov             dword ptr [esp],eax
0037  85 C0                             test            eax,eax
0039  75 3C                             jne             L$4
003B  89 C8                             mov             eax,ecx
003D  E8 00 00 00 00                    call            _nmalloc_
0042  89 C7                             mov             edi,eax
0044  89 04 24                          mov             dword ptr [esp],eax
0047  85 C0                             test            eax,eax
0049  74 23                             je              L$3
004B  89 DE                             mov             esi,ebx
004D  89 E9                             mov             ecx,ebp
004F  06                                push            es
0050  8C D8                             mov             eax,ds
0052  8E C0                             mov             es,eax
0054  57                                push            edi
0055  89 C8                             mov             eax,ecx
0057  C1 E9 02                          shr             ecx,0x02
005A  F2 A5                             repne movsd
005C  8A C8                             mov             cl,al
005E  80 E1 03                          and             cl,0x03
0061  F2 A4                             repne movsb
0063  5F                                pop             edi
0064  07                                pop             es
0065  89 D8                             mov             eax,ebx
0067  E8 00 00 00 00                    call            _nfree_
006C  EB 09                             jmp             L$4
006E                            L$3:
006E  89 D8                             mov             eax,ebx
0070  89 EA                             mov             edx,ebp
0072  E8 00 00 00 00                    call            _nexpand_
0077                            L$4:
0077  8B 04 24                          mov             eax,dword ptr [esp]
007A                            L$5:
007A  83 C4 04                          add             esp,0x00000004
007D  5D                                pop             ebp
007E  5F                                pop             edi
007F  5E                                pop             esi
0080  59                                pop             ecx
0081  5B                                pop             ebx
0082  C3                                ret

Routine Size: 131 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

