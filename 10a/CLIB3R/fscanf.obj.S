Module: fscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007C bytes
0000                            cget_file_:
0000  52                                push            edx
0001  89 C2                             mov             edx,eax
0003  8B 40 08                          mov             eax,dword ptr 0x8[eax]
0006  E8 00 00 00 00                    call            fgetc_
000B  83 F8 FF                          cmp             eax,0xffffffff
000E  75 04                             jne             L$1
0010  80 4A 10 02                       or              byte ptr 0x10[edx],0x02
0014                            L$1:
0014  5A                                pop             edx
0015  C3                                ret
0016                            uncget_file_:
0016  8B 52 08                          mov             edx,dword ptr 0x8[edx]
0019  E9 00 00 00 00                    jmp             ungetc_

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E                            vfscanf_:
001E  51                                push            ecx
001F  56                                push            esi
0020  57                                push            edi
0021  83 EC 14                          sub             esp,0x00000014
0024  89 C1                             mov             ecx,eax
0026  BE 00 00 00 00                    mov             esi,offset cget_file_
002B  8B 40 10                          mov             eax,dword ptr 0x10[eax]
002E  BF 00 00 00 00                    mov             edi,offset uncget_file_
0033  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0039  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
003D  89 34 24                          mov             dword ptr [esp],esi
0040  89 7C 24 04                       mov             dword ptr 0x4[esp],edi
0044  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
0047  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
004D  89 E0                             mov             eax,esp
004F  E8 00 00 00 00                    call            __scnf_
0054  83 C4 14                          add             esp,0x00000014
0057  5F                                pop             edi
0058  5E                                pop             esi
0059  59                                pop             ecx
005A  C3                                ret

Routine Size: 61 bytes,    Routine Base: _TEXT + 001E

005B                            fscanf_:
005B  53                                push            ebx
005C  52                                push            edx
005D  83 EC 04                          sub             esp,0x00000004
0060  8D 5C 24 18                       lea             ebx,0x18[esp]
0064  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0068  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
006C  89 1C 24                          mov             dword ptr [esp],ebx
006F  89 E3                             mov             ebx,esp
0071  E8 00 00 00 00                    call            vfscanf_
0076  83 C4 04                          add             esp,0x00000004
0079  5A                                pop             edx
007A  5B                                pop             ebx
007B  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 005B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

