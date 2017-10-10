Module: fjstrnic
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000116 bytes
0000                            _fjstrnicmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000A  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
000E  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0012                            L$1:
0012  4B                                dec             ebx
0013  83 FB FF                          cmp             ebx,0xffffffff
0016  0F 84 F1 00 00 00                 je              L$12
001C  89 E2                             mov             edx,esp
001E  8C D8                             mov             eax,ds
0020  25 FF FF 00 00                    and             eax,0x0000ffff
0025  50                                push            eax
0026  31 C0                             xor             eax,eax
0028  52                                push            edx
0029  66 8B 44 24 28                    mov             ax,word ptr 0x28[esp]
002E  50                                push            eax
002F  56                                push            esi
0030  9A 00 00 00 00 00 00              call            _fjgetmoji
0037  83 C4 10                          add             esp,0x00000010
003A  89 C6                             mov             esi,eax
003C  31 C0                             xor             eax,eax
003E  66 8B 04 24                       mov             ax,word ptr [esp]
0042  89 54 24 20                       mov             dword ptr 0x20[esp],edx
0046  83 F8 7F                          cmp             eax,0x0000007f
0049  7E 1B                             jle             L$3
004B  3D 81 82 00 00                    cmp             eax,0x00008281
0050  7C 0C                             jl              L$2
0052  3D 9A 82 00 00                    cmp             eax,0x0000829a
0057  7F 05                             jg              L$2
0059  8D 50 DF                          lea             edx,-0x21[eax]
005C  EB 1D                             jmp             L$5
005E                            L$2:
005E  31 D2                             xor             edx,edx
0060  66 8B 14 24                       mov             dx,word ptr [esp]
0064  EB 15                             jmp             L$5
0066                            L$3:
0066  83 F8 61                          cmp             eax,0x00000061
0069  7C 0A                             jl              L$4
006B  83 F8 7A                          cmp             eax,0x0000007a
006E  7F 05                             jg              L$4
0070  8D 50 E0                          lea             edx,-0x20[eax]
0073  EB 06                             jmp             L$5
0075                            L$4:
0075  31 D2                             xor             edx,edx
0077  66 8B 14 24                       mov             dx,word ptr [esp]
007B                            L$5:
007B  89 14 24                          mov             dword ptr [esp],edx
007E  8D 54 24 04                       lea             edx,0x4[esp]
0082  8C D8                             mov             eax,ds
0084  25 FF FF 00 00                    and             eax,0x0000ffff
0089  50                                push            eax
008A  31 C0                             xor             eax,eax
008C  52                                push            edx
008D  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
0092  50                                push            eax
0093  57                                push            edi
0094  9A 00 00 00 00 00 00              call            _fjgetmoji
009B  83 C4 10                          add             esp,0x00000010
009E  89 C7                             mov             edi,eax
00A0  31 C0                             xor             eax,eax
00A2  66 8B 44 24 04                    mov             ax,word ptr 0x4[esp]
00A7  89 54 24 28                       mov             dword ptr 0x28[esp],edx
00AB  83 F8 7F                          cmp             eax,0x0000007f
00AE  7E 1C                             jle             L$7
00B0  3D 81 82 00 00                    cmp             eax,0x00008281
00B5  7C 0C                             jl              L$6
00B7  3D 9A 82 00 00                    cmp             eax,0x0000829a
00BC  7F 05                             jg              L$6
00BE  8D 50 DF                          lea             edx,-0x21[eax]
00C1  EB 1F                             jmp             L$9
00C3                            L$6:
00C3  31 D2                             xor             edx,edx
00C5  66 8B 54 24 04                    mov             dx,word ptr 0x4[esp]
00CA  EB 16                             jmp             L$9
00CC                            L$7:
00CC  83 F8 61                          cmp             eax,0x00000061
00CF  7C 0A                             jl              L$8
00D1  83 F8 7A                          cmp             eax,0x0000007a
00D4  7F 05                             jg              L$8
00D6  8D 50 E0                          lea             edx,-0x20[eax]
00D9  EB 07                             jmp             L$9
00DB                            L$8:
00DB  31 D2                             xor             edx,edx
00DD  66 8B 54 24 04                    mov             dx,word ptr 0x4[esp]
00E2                            L$9:
00E2  89 54 24 04                       mov             dword ptr 0x4[esp],edx
00E6  8B 04 24                          mov             eax,dword ptr [esp]
00E9  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00ED  66 39 D0                          cmp             ax,dx
00F0  74 10                             je              L$11
00F2  73 07                             jae             L$10
00F4  B8 FF FF FF FF                    mov             eax,0xffffffff
00F9  EB 14                             jmp             L$13
00FB                            L$10:
00FB  B8 01 00 00 00                    mov             eax,0x00000001
0100  EB 0D                             jmp             L$13
0102                            L$11:
0102  66 83 3C 24 00                    cmp             word ptr [esp],0x0000
0107  0F 85 05 FF FF FF                 jne             L$1
010D                            L$12:
010D  31 C0                             xor             eax,eax
010F                            L$13:
010F  83 C4 08                          add             esp,0x00000008
0112  5F                                pop             edi
0113  5E                                pop             esi
0114  5B                                pop             ebx
0115  CB                                retf

Routine Size: 278 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

