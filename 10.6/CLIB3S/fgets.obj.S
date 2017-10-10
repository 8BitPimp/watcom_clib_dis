Module: fgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000096 bytes
0000                            fgets:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
000B  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
000F  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0013  8B 57 10                          mov             edx,dword ptr 0x10[edi]
0016  52                                push            edx
0017  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
001D  8B 47 0C                          mov             eax,dword ptr 0xc[edi]
0020  83 C4 04                          add             esp,0x00000004
0023  83 E0 30                          and             eax,0x00000030
0026  89 04 24                          mov             dword ptr [esp],eax
0029  8A 67 0C                          mov             ah,byte ptr 0xc[edi]
002C  80 E4 CF                          and             ah,0xcf
002F  89 EB                             mov             ebx,ebp
0031  88 67 0C                          mov             byte ptr 0xc[edi],ah
0034                            L$1:
0034  4E                                dec             esi
0035  85 F6                             test            esi,esi
0037  7E 23                             jle             L$2
0039  57                                push            edi
003A  E8 00 00 00 00                    call            fgetc
003F  83 C4 04                          add             esp,0x00000004
0042  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0046  83 F8 FF                          cmp             eax,0xffffffff
0049  74 11                             je              L$2
004B  8A 44 24 04                       mov             al,byte ptr 0x4[esp]
004F  88 03                             mov             byte ptr [ebx],al
0051  25 FF 00 00 00                    and             eax,0x000000ff
0056  43                                inc             ebx
0057  83 F8 0A                          cmp             eax,0x0000000a
005A  75 D8                             jne             L$1
005C                            L$2:
005C  83 7C 24 04 FF                    cmp             dword ptr 0x4[esp],0xffffffff
0061  75 0E                             jne             L$4
0063  39 EB                             cmp             ebx,ebp
0065  74 06                             je              L$3
0067  F6 47 0C 20                       test            byte ptr 0xc[edi],0x20
006B  74 04                             je              L$4
006D                            L$3:
006D  31 ED                             xor             ebp,ebp
006F  EB 03                             jmp             L$5
0071                            L$4:
0071  C6 03 00                          mov             byte ptr [ebx],0x00
0074                            L$5:
0074  8B 04 24                          mov             eax,dword ptr [esp]
0077  8B 77 0C                          mov             esi,dword ptr 0xc[edi]
007A  09 C6                             or              esi,eax
007C  8B 47 10                          mov             eax,dword ptr 0x10[edi]
007F  50                                push            eax
0080  89 77 0C                          mov             dword ptr 0xc[edi],esi
0083  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0089  83 C4 04                          add             esp,0x00000004
008C  89 E8                             mov             eax,ebp
008E  83 C4 08                          add             esp,0x00000008
0091  5D                                pop             ebp
0092  5F                                pop             edi
0093  5E                                pop             esi
0094  5B                                pop             ebx
0095  C3                                ret

Routine Size: 150 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

