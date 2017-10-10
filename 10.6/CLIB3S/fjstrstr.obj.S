Module: fjstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000014C bytes
0000                            _fjstrstr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 10                          sub             esp,0x00000010
0007  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
000B  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
000F  89 E2                             mov             edx,esp
0011  8C D8                             mov             eax,ds
0013  25 FF FF 00 00                    and             eax,0x0000ffff
0018  50                                push            eax
0019  31 C0                             xor             eax,eax
001B  52                                push            edx
001C  66 8B 44 24 3C                    mov             ax,word ptr 0x3c[esp]
0021  50                                push            eax
0022  8B 54 24 3C                       mov             edx,dword ptr 0x3c[esp]
0026  52                                push            edx
0027  9A 00 00 00 00 00 00              call            _fjgetmoji
002E  83 C4 10                          add             esp,0x00000010
0031  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
0035  8B 14 24                          mov             edx,dword ptr [esp]
0038  89 C7                             mov             edi,eax
003A  66 85 D2                          test            dx,dx
003D  75 07                             jne             L$1
003F  89 D8                             mov             eax,ebx
0041  E9 FA 00 00 00                    jmp             L$6
0046                            L$1:
0046  8D 54 24 08                       lea             edx,0x8[esp]
004A  89 5C 24 04                       mov             dword ptr 0x4[esp],ebx
004E  89 F5                             mov             ebp,esi
0050  8C D8                             mov             eax,ds
0052  25 FF FF 00 00                    and             eax,0x0000ffff
0057  50                                push            eax
0058  31 C0                             xor             eax,eax
005A  52                                push            edx
005B  66 89 D8                          mov             ax,bx
005E  50                                push            eax
005F  56                                push            esi
0060  9A 00 00 00 00 00 00              call            _fjgetmoji
0067  83 C4 10                          add             esp,0x00000010
006A  89 D3                             mov             ebx,edx
006C  8B 4C 24 08                       mov             ecx,dword ptr 0x8[esp]
0070  89 C6                             mov             esi,eax
0072  66 85 C9                          test            cx,cx
0075  75 09                             jne             L$3
0077  31 C0                             xor             eax,eax
0079                            L$2:
0079  31 F6                             xor             esi,esi
007B  E9 C0 00 00 00                    jmp             L$6
0080                            L$3:
0080  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0084  66 3B 04 24                       cmp             ax,word ptr [esp]
0088  75 BC                             jne             L$1
008A                            L$4:
008A  8D 54 24 08                       lea             edx,0x8[esp]
008E  8C D8                             mov             eax,ds
0090  25 FF FF 00 00                    and             eax,0x0000ffff
0095  50                                push            eax
0096  31 C0                             xor             eax,eax
0098  52                                push            edx
0099  66 89 D8                          mov             ax,bx
009C  50                                push            eax
009D  56                                push            esi
009E  9A 00 00 00 00 00 00              call            _fjgetmoji
00A5  83 C4 10                          add             esp,0x00000010
00A8  89 D3                             mov             ebx,edx
00AA  89 C6                             mov             esi,eax
00AC  89 E2                             mov             edx,esp
00AE  8C D8                             mov             eax,ds
00B0  25 FF FF 00 00                    and             eax,0x0000ffff
00B5  50                                push            eax
00B6  31 C0                             xor             eax,eax
00B8  52                                push            edx
00B9  66 8B 44 24 14                    mov             ax,word ptr 0x14[esp]
00BE  50                                push            eax
00BF  57                                push            edi
00C0  9A 00 00 00 00 00 00              call            _fjgetmoji
00C7  83 C4 10                          add             esp,0x00000010
00CA  89 C7                             mov             edi,eax
00CC  8B 0C 24                          mov             ecx,dword ptr [esp]
00CF  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
00D3  66 85 C9                          test            cx,cx
00D6  75 08                             jne             L$5
00D8  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00DC  89 EE                             mov             esi,ebp
00DE  EB 60                             jmp             L$6
00E0                            L$5:
00E0  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00E4  66 85 C0                          test            ax,ax
00E7  74 90                             je              L$2
00E9  66 39 C1                          cmp             cx,ax
00EC  74 9C                             je              L$4
00EE  8D 54 24 08                       lea             edx,0x8[esp]
00F2  8C D8                             mov             eax,ds
00F4  25 FF FF 00 00                    and             eax,0x0000ffff
00F9  50                                push            eax
00FA  31 C0                             xor             eax,eax
00FC  52                                push            edx
00FD  66 8B 44 24 0C                    mov             ax,word ptr 0xc[esp]
0102  50                                push            eax
0103  45                                inc             ebp
0104  55                                push            ebp
0105  9A 00 00 00 00 00 00              call            _fjgetmoji
010C  83 C4 10                          add             esp,0x00000010
010F  89 D3                             mov             ebx,edx
0111  89 C6                             mov             esi,eax
0113  89 E2                             mov             edx,esp
0115  8C D8                             mov             eax,ds
0117  25 FF FF 00 00                    and             eax,0x0000ffff
011C  50                                push            eax
011D  31 C0                             xor             eax,eax
011F  52                                push            edx
0120  66 8B 44 24 3C                    mov             ax,word ptr 0x3c[esp]
0125  50                                push            eax
0126  8B 4C 24 3C                       mov             ecx,dword ptr 0x3c[esp]
012A  51                                push            ecx
012B  9A 00 00 00 00 00 00              call            _fjgetmoji
0132  83 C4 10                          add             esp,0x00000010
0135  89 C7                             mov             edi,eax
0137  89 54 24 0C                       mov             dword ptr 0xc[esp],edx
013B  E9 40 FF FF FF                    jmp             L$3
0140                            L$6:
0140  89 C2                             mov             edx,eax
0142  89 F0                             mov             eax,esi
0144  83 C4 10                          add             esp,0x00000010
0147  5D                                pop             ebp
0148  5F                                pop             edi
0149  5E                                pop             esi
014A  5B                                pop             ebx
014B  CB                                retf

Routine Size: 332 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

