Module: fjstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000011B bytes
0000                            _fjstrtok:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  55                                push            ebp
0007  83 7C 24 20 00                    cmp             dword ptr 0x20[esp],0x00000000
000C  75 16                             jne             L$1
000E  66 83 7C 24 24 00                 cmp             word ptr 0x24[esp],0x0000
0014  75 0E                             jne             L$1
0016  66 8B 15 04 00 00 00              mov             dx,word ptr DGROUP:L$14
001D  A1 00 00 00 00                    mov             eax,dword ptr DGROUP:L$13
0022  EB 08                             jmp             L$2
0024                            L$1:
0024  8B 54 24 24                       mov             edx,dword ptr 0x24[esp]
0028  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
002C                            L$2:
002C  85 C0                             test            eax,eax
002E  75 0E                             jne             L$5
0030  66 85 D2                          test            dx,dx
0033  75 09                             jne             L$5
0035                            L$3:
0035  31 D2                             xor             edx,edx
0037                            L$4:
0037  31 C0                             xor             eax,eax
0039  E9 D5 00 00 00                    jmp             L$12
003E                            L$5:
003E  31 DB                             xor             ebx,ebx
0040  66 8B 5C 24 2C                    mov             bx,word ptr 0x2c[esp]
0045  53                                push            ebx
0046  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
004A  53                                push            ebx
004B  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0051  52                                push            edx
0052  50                                push            eax
0053  9A 00 00 00 00 00 00              call            _fjstrskip
005A  89 D3                             mov             ebx,edx
005C  83 C4 10                          add             esp,0x00000010
005F  89 D6                             mov             esi,edx
0061  89 C7                             mov             edi,eax
0063  85 C0                             test            eax,eax
0065  75 05                             jne             L$6
0067  66 85 D2                          test            dx,dx
006A  74 C9                             je              L$3
006C                            L$6:
006C  8E C2                             mov             es,edx
006E  26 80 38 00                       cmp             byte ptr es:[eax],0x00
0072  74 C1                             je              L$3
0074  31 D2                             xor             edx,edx
0076  26 8A 10                          mov             dl,byte ptr es:[eax]
0079  8A 92 01 00 00 00                 mov             dl,byte ptr _IsKTable+0x1[edx]
007F  80 E2 04                          and             dl,0x04
0082  81 E2 FF 00 00 00                 and             edx,0x000000ff
0088  74 07                             je              L$7
008A  26 80 78 01 00                    cmp             byte ptr es:0x1[eax],0x00
008F  74 A4                             je              L$3
0091                            L$7:
0091  31 C0                             xor             eax,eax
0093  66 8B 44 24 2C                    mov             ax,word ptr 0x2c[esp]
0098  50                                push            eax
0099  8B 4C 24 2C                       mov             ecx,dword ptr 0x2c[esp]
009D  31 C0                             xor             eax,eax
009F  51                                push            ecx
00A0  66 89 F0                          mov             ax,si
00A3  50                                push            eax
00A4  57                                push            edi
00A5  9A 00 00 00 00 00 00              call            _fjstrmatch
00AC  89 D1                             mov             ecx,edx
00AE  83 C4 10                          add             esp,0x00000010
00B1  8E C2                             mov             es,edx
00B3  89 C2                             mov             edx,eax
00B5  85 C0                             test            eax,eax
00B7  75 0C                             jne             L$8
00B9  66 85 C9                          test            cx,cx
00BC  75 07                             jne             L$8
00BE  31 C2                             xor             edx,eax
00C0  E9 72 FF FF FF                    jmp             L$4
00C5                            L$8:
00C5  8E E1                             mov             fs,ecx
00C7  64 8A 18                          mov             bl,byte ptr fs:[eax]
00CA  84 DB                             test            bl,bl
00CC  75 13                             jne             L$9
00CE  30 FF                             xor             bh,bh
00D0  31 ED                             xor             ebp,ebp
00D2  66 89 1D 04 00 00 00              mov             word ptr DGROUP:L$14,bx
00D9  89 2D 00 00 00 00                 mov             dword ptr DGROUP:L$13,ebp
00DF  EB 2E                             jmp             L$11
00E1                            L$9:
00E1  31 DB                             xor             ebx,ebx
00E3  64 8A 18                          mov             bl,byte ptr fs:[eax]
00E6  8A 9B 01 00 00 00                 mov             bl,byte ptr _IsKTable+0x1[ebx]
00EC  80 E3 04                          and             bl,0x04
00EF  81 E3 FF 00 00 00                 and             ebx,0x000000ff
00F5  74 07                             je              L$10
00F7  8D 50 01                          lea             edx,0x1[eax]
00FA  26 C6 00 00                       mov             byte ptr es:[eax],0x00
00FE                            L$10:
00FE  26 C6 02 00                       mov             byte ptr es:[edx],0x00
0102  42                                inc             edx
0103  8C 05 04 00 00 00                 mov             dword ptr DGROUP:L$14,es
0109  89 15 00 00 00 00                 mov             dword ptr DGROUP:L$13,edx
010F                            L$11:
010F  89 F2                             mov             edx,esi
0111  89 F8                             mov             eax,edi
0113                            L$12:
0113  5D                                pop             ebp
0114  0F A1                             pop             fs
0116  07                                pop             es
0117  5F                                pop             edi
0118  5E                                pop             esi
0119  5B                                pop             ebx
011A  CB                                retf

Routine Size: 283 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000006 bytes
0000                            L$13:
0004                            L$14:

BSS Size: 6 bytes

