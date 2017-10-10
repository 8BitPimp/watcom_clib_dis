Module: fstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F5 bytes
0000                            _fstrstr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  55                                push            ebp
0005  83 EC 0C                          sub             esp,0x0000000c
0008  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
000C  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
0010  C4 6C 24 2C                       les             ebp,fword ptr 0x2c[esp]
0014  26 8A 65 00                       mov             ah,byte ptr es:[ebp]
0018  84 E4                             test            ah,ah
001A  75 07                             jne             L$2
001C                            L$1:
001C  89 D9                             mov             ecx,ebx
001E  E9 C5 00 00 00                    jmp             L$11
0023                            L$2:
0023  26 80 7D 01 00                    cmp             byte ptr es:0x1[ebp],0x00
0028  75 1D                             jne             L$3
002A  31 C9                             xor             ecx,ecx
002C  88 E1                             mov             cl,ah
002E  51                                push            ecx
002F  31 C9                             xor             ecx,ecx
0031  66 89 F1                          mov             cx,si
0034  51                                push            ecx
0035  53                                push            ebx
0036  E8 00 00 00 00                    call            _fstrchr
003B  89 D6                             mov             esi,edx
003D  89 C1                             mov             ecx,eax
003F  83 C4 0C                          add             esp,0x0000000c
0042  E9 A1 00 00 00                    jmp             L$11
0047                            L$3:
0047  B9 FF FF FF FF                    mov             ecx,0xffffffff
004C  89 F2                             mov             edx,esi
004E  89 DF                             mov             edi,ebx
0050  30 C0                             xor             al,al
0052  06                                push            es
0053  E3 0B                             jecxz           L$4
0055  8E C2                             mov             es,edx
0057  F2 AE                             repne scasb
0059  75 05                             jne             L$4
005B  4F                                dec             edi
005C  8C C1                             mov             ecx,es
005E  66 A9                                           f.
0060                            L$4:
0060  89 CF                             mov             edi,ecx
0062  07                                pop             es
0063  89 7C 24 04                       mov             dword ptr 0x4[esp],edi
0067  8C C1                             mov             ecx,es
0069  89 EF                             mov             edi,ebp
006B  06                                push            es
006C  8E C1                             mov             es,ecx
006E  31 C0                             xor             eax,eax
0070  89 C1                             mov             ecx,eax
0072  49                                dec             ecx
0073  F2 AE                             repne scasb
0075  F7 D1                             not             ecx
0077  49                                dec             ecx
0078  07                                pop             es
0079  89 0C 24                          mov             dword ptr [esp],ecx
007C                            L$5:
007C  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0080  8B 14 24                          mov             edx,dword ptr [esp]
0083  29 D9                             sub             ecx,ebx
0085  39 D1                             cmp             ecx,edx
0087  72 5B                             jb              L$10
0089  89 F2                             mov             edx,esi
008B  89 DF                             mov             edi,ebx
008D  26 8A 45 00                       mov             al,byte ptr es:[ebp]
0091  06                                push            es
0092  E3 0B                             jecxz           L$6
0094  8E C2                             mov             es,edx
0096  F2 AE                             repne scasb
0098  75 05                             jne             L$6
009A  4F                                dec             edi
009B  8C C1                             mov             ecx,es
009D  66 A9                                           f.
009F                            L$6:
009F  89 CF                             mov             edi,ecx
00A1  07                                pop             es
00A2  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
00A6  89 FB                             mov             ebx,edi
00A8  89 CA                             mov             edx,ecx
00AA  85 FF                             test            edi,edi
00AC  75 05                             jne             L$7
00AE  66 85 D2                          test            dx,dx
00B1  74 31                             je              L$10
00B3                            L$7:
00B3  8B 04 24                          mov             eax,dword ptr [esp]
00B6  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00BA  8C C1                             mov             ecx,es
00BC  89 EF                             mov             edi,ebp
00BE  89 DE                             mov             esi,ebx
00C0  1E                                push            ds
00C1  06                                push            es
00C2  91                                xchg            eax,ecx
00C3  8E DA                             mov             ds,edx
00C5  8E C0                             mov             es,eax
00C7  09 C9                             or              ecx,ecx
00C9  F3 A6                             repe cmpsb
00CB  74 05                             je              L$8
00CD  19 C9                             sbb             ecx,ecx
00CF  83 D9 FF                          sbb             ecx,0xffffffff
00D2                            L$8:
00D2  07                                pop             es
00D3  1F                                pop             ds
00D4  85 C9                             test            ecx,ecx
00D6  75 07                             jne             L$9
00D8  89 D6                             mov             esi,edx
00DA  E9 3D FF FF FF                    jmp             L$1
00DF                            L$9:
00DF  89 D6                             mov             esi,edx
00E1  43                                inc             ebx
00E2  EB 98                             jmp             L$5
00E4                            L$10:
00E4  31 F6                             xor             esi,esi
00E6  31 C9                             xor             ecx,ecx
00E8                            L$11:
00E8  89 F2                             mov             edx,esi
00EA  89 C8                             mov             eax,ecx
00EC  83 C4 0C                          add             esp,0x0000000c
00EF  5D                                pop             ebp
00F0  07                                pop             es
00F1  5F                                pop             edi
00F2  5E                                pop             esi
00F3  5B                                pop             ebx
00F4  C3                                ret

Routine Size: 245 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

