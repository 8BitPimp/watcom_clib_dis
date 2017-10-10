Module: fstrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000                            _fstrdup_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  55                                push            ebp
0005  83 EC 04                          sub             esp,0x00000004
0008  52                                push            edx
0009  89 C6                             mov             esi,eax
000B  89 D1                             mov             ecx,edx
000D  89 C7                             mov             edi,eax
000F  06                                push            es
0010  8E C1                             mov             es,ecx
0012  31 C0                             xor             eax,eax
0014  89 C1                             mov             ecx,eax
0016  49                                dec             ecx
0017  F2 AE                             repne scasb
0019  F7 D1                             not             ecx
001B  49                                dec             ecx
001C  07                                pop             es
001D  8D 59 01                          lea             ebx,0x1[ecx]
0020  8C 5C 24 04                       mov             dword ptr 0x4[esp],ds
0024  89 D8                             mov             eax,ebx
0026  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
002A  E8 00 00 00 00                    call            malloc_
002F  89 C5                             mov             ebp,eax
0031  85 C0                             test            eax,eax
0033  75 05                             jne             L$1
0035  66 85 D2                          test            dx,dx
0038  74 24                             je              L$2
003A                            L$1:
003A  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
003E  8B 0C 24                          mov             ecx,dword ptr [esp]
0041  89 C7                             mov             edi,eax
0043  89 D8                             mov             eax,ebx
0045  1E                                push            ds
0046  06                                push            es
0047  57                                push            edi
0048  91                                xchg            eax,ecx
0049  8E D8                             mov             ds,eax
004B  8E C2                             mov             es,edx
004D  89 C8                             mov             eax,ecx
004F  C1 E9 02                          shr             ecx,0x02
0052  F2 A5                             repne movsd
0054  8A C8                             mov             cl,al
0056  80 E1 03                          and             cl,0x03
0059  F2 A4                             repne movsb
005B  58                                pop             eax
005C  07                                pop             es
005D  1F                                pop             ds
005E                            L$2:
005E  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0062  89 E8                             mov             eax,ebp
0064  83 C4 08                          add             esp,0x00000008
0067  5D                                pop             ebp
0068  5F                                pop             edi
0069  5E                                pop             esi
006A  59                                pop             ecx
006B  5B                                pop             ebx
006C  C3                                ret

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

