Module: ntfio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B0 bytes
0000                            __GetNTCreateAttr:
0000  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0004  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0008  F6 44 24 04 01                    test            byte ptr 0x4[esp],0x01
000D  74 0E                             je              L$1
000F  C7 02 00 00 00 80                 mov             dword ptr [edx],0x80000000
0015  C7 00 01 00 00 00                 mov             dword ptr [eax],0x00000001
001B  EB 0C                             jmp             L$2
001D                            L$1:
001D  C7 02 00 00 00 C0                 mov             dword ptr [edx],0xc0000000
0023  C7 00 80 00 00 00                 mov             dword ptr [eax],0x00000080
0029                            L$2:
0029  F6 44 24 04 02                    test            byte ptr 0x4[esp],0x02
002E  74 03                             je              L$3
0030  80 08 02                          or              byte ptr [eax],0x02
0033                            L$3:
0033  F6 44 24 04 04                    test            byte ptr 0x4[esp],0x04
0038  74 03                             je              L$4
003A  80 08 04                          or              byte ptr [eax],0x04
003D                            L$4:
003D  C3                                ret

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

003E                            __GetNTAccessAttr:
003E  53                                push            ebx
003F  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0043  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0047  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
004B  83 FB 02                          cmp             ebx,0x00000002
004E  75 0E                             jne             L$6
0050  C7 02 00 00 00 C0                 mov             dword ptr [edx],0xc0000000
0056                            L$5:
0056  C7 00 80 00 00 00                 mov             dword ptr [eax],0x00000080
005C  5B                                pop             ebx
005D  C3                                ret
005E                            L$6:
005E  83 FB 01                          cmp             ebx,0x00000001
0061  75 08                             jne             L$7
0063  C7 02 00 00 00 40                 mov             dword ptr [edx],0x40000000
0069  EB EB                             jmp             L$5
006B                            L$7:
006B  C7 02 00 00 00 80                 mov             dword ptr [edx],0x80000000
0071  C7 00 01 00 00 00                 mov             dword ptr [eax],0x00000001
0077  5B                                pop             ebx
0078  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 003E

0079                            __GetNTShareAttr:
0079  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
007D  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0081  85 D2                             test            edx,edx
0083  74 05                             je              L$8
0085  83 FA 40                          cmp             edx,0x00000040
0088  75 07                             jne             L$9
008A                            L$8:
008A  C7 00 03 00 00 00                 mov             dword ptr [eax],0x00000003
0090  C3                                ret
0091                            L$9:
0091  83 FA 20                          cmp             edx,0x00000020
0094  75 07                             jne             L$10
0096  C7 00 01 00 00 00                 mov             dword ptr [eax],0x00000001
009C  C3                                ret
009D                            L$10:
009D  83 FA 30                          cmp             edx,0x00000030
00A0  75 07                             jne             L$11
00A2  C7 00 02 00 00 00                 mov             dword ptr [eax],0x00000002
00A8  C3                                ret
00A9                            L$11:
00A9  C7 00 00 00 00 00                 mov             dword ptr [eax],0x00000000
00AF  C3                                ret

Routine Size: 55 bytes,    Routine Base: _TEXT + 0079

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

