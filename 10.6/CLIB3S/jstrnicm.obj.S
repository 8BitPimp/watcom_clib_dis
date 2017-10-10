Module: jstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D1 bytes
0000                            jstrnicmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000A  8B 7C 24 1C                       mov             edi,dword ptr 0x1c[esp]
000E  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0012                            L$1:
0012  4B                                dec             ebx
0013  83 FB FF                          cmp             ebx,0xffffffff
0016  0F 84 AC 00 00 00                 je              L$8
001C  8D 44 24 04                       lea             eax,0x4[esp]
0020  50                                push            eax
0021  56                                push            esi
0022  E8 00 00 00 00                    call            jgetmoji
0027  83 C4 08                          add             esp,0x00000008
002A  89 C6                             mov             esi,eax
002C  31 C0                             xor             eax,eax
002E  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0033  50                                push            eax
0034  E8 00 00 00 00                    call            jiszen
0039  83 C4 04                          add             esp,0x00000004
003C  85 C0                             test            eax,eax
003E  74 0F                             je              L$2
0040  31 C0                             xor             eax,eax
0042  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0047  50                                push            eax
0048  E8 00 00 00 00                    call            jtoupper
004D  EB 0B                             jmp             L$3
004F                            L$2:
004F  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
0054  50                                push            eax
0055  E8 00 00 00 00                    call            toupper
005A                            L$3:
005A  83 C4 04                          add             esp,0x00000004
005D  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0061  89 E0                             mov             eax,esp
0063  50                                push            eax
0064  57                                push            edi
0065  E8 00 00 00 00                    call            jgetmoji
006A  83 C4 08                          add             esp,0x00000008
006D  89 C7                             mov             edi,eax
006F  31 C0                             xor             eax,eax
0071  66 8B 04 24                       mov             ax,word ptr [esp]
0075  50                                push            eax
0076  E8 00 00 00 00                    call            jiszen
007B  83 C4 04                          add             esp,0x00000004
007E  85 C0                             test            eax,eax
0080  74 0E                             je              L$4
0082  31 C0                             xor             eax,eax
0084  66 8B 04 24                       mov             ax,word ptr [esp]
0088  50                                push            eax
0089  E8 00 00 00 00                    call            jtoupper
008E  EB 0A                             jmp             L$5
0090                            L$4:
0090  66 8B 04 24                       mov             ax,word ptr [esp]
0094  50                                push            eax
0095  E8 00 00 00 00                    call            toupper
009A                            L$5:
009A  83 C4 04                          add             esp,0x00000004
009D  89 04 24                          mov             dword ptr [esp],eax
00A0  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00A4  8B 14 24                          mov             edx,dword ptr [esp]
00A7  66 39 D0                          cmp             ax,dx
00AA  74 10                             je              L$7
00AC  73 07                             jae             L$6
00AE  B8 FF FF FF FF                    mov             eax,0xffffffff
00B3  EB 15                             jmp             L$9
00B5                            L$6:
00B5  B8 01 00 00 00                    mov             eax,0x00000001
00BA  EB 0E                             jmp             L$9
00BC                            L$7:
00BC  66 83 7C 24 04 00                 cmp             word ptr 0x4[esp],0x0000
00C2  0F 85 4A FF FF FF                 jne             L$1
00C8                            L$8:
00C8  31 C0                             xor             eax,eax
00CA                            L$9:
00CA  83 C4 08                          add             esp,0x00000008
00CD  5F                                pop             edi
00CE  5E                                pop             esi
00CF  5B                                pop             ebx
00D0  C3                                ret

Routine Size: 209 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

