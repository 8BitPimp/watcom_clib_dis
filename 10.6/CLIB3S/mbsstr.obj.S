Module: mbsstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000BA bytes
0000                            _mbsstr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
000E  0F 84 8C 00 00 00                 je              L$7
0014  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0018  06                                push            es
0019  8C D8                             mov             eax,ds
001B  8E C0                             mov             es,eax
001D  29 C9                             sub             ecx,ecx
001F  49                                dec             ecx
0020  31 C0                             xor             eax,eax
0022  F2 AE                             repne scasb
0024  F7 D1                             not             ecx
0026  49                                dec             ecx
0027  07                                pop             es
0028  89 0C 24                          mov             dword ptr [esp],ecx
002B                            L$1:
002B  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
002F  80 38 00                          cmp             byte ptr [eax],0x00
0032  0F 84 64 00 00 00                 je              L$6
0038  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
003C  31 DB                             xor             ebx,ebx
003E  31 FF                             xor             edi,edi
0040                            L$2:
0040  8D 44 24 08                       lea             eax,0x8[esp]
0044  50                                push            eax
0045  55                                push            ebp
0046  E8 00 00 00 00                    call            _mbgetcode
004B  83 C4 08                          add             esp,0x00000008
004E  89 C5                             mov             ebp,eax
0050  8D 44 24 04                       lea             eax,0x4[esp]
0054  50                                push            eax
0055  56                                push            esi
0056  E8 00 00 00 00                    call            _mbgetcode
005B  89 C2                             mov             edx,eax
005D  83 C4 08                          add             esp,0x00000008
0060  89 C6                             mov             esi,eax
0062  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0066  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
006A  43                                inc             ebx
006B  39 C8                             cmp             eax,ecx
006D  75 0B                             jne             L$3
006F  8A 0A                             mov             cl,byte ptr [edx]
0071  BF 01 00 00 00                    mov             edi,0x00000001
0076  84 C9                             test            cl,cl
0078  75 C6                             jne             L$2
007A                            L$3:
007A  85 FF                             test            edi,edi
007C  74 0D                             je              L$4
007E  83 7C 24 04 00                    cmp             dword ptr 0x4[esp],0x00000000
0083  75 06                             jne             L$4
0085  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0089  EB 27                             jmp             L$8
008B                            L$4:
008B  8B 04 24                          mov             eax,dword ptr [esp]
008E  29 D8                             sub             eax,ebx
0090  39 D8                             cmp             eax,ebx
0092  73 02                             jae             L$5
0094  89 C3                             mov             ebx,eax
0096                            L$5:
0096  01 5C 24 20                       add             dword ptr 0x20[esp],ebx
009A  EB 8F                             jmp             L$1
009C                            L$6:
009C  31 C0                             xor             eax,eax
009E  EB 12                             jmp             L$8
00A0                            L$7:
00A0  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
00A4  53                                push            ebx
00A5  8B 4C 24 24                       mov             ecx,dword ptr 0x24[esp]
00A9  51                                push            ecx
00AA  E8 00 00 00 00                    call            strstr
00AF  83 C4 08                          add             esp,0x00000008
00B2                            L$8:
00B2  83 C4 0C                          add             esp,0x0000000c
00B5  5D                                pop             ebp
00B6  5F                                pop             edi
00B7  5E                                pop             esi
00B8  5B                                pop             ebx
00B9  C3                                ret

Routine Size: 186 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

