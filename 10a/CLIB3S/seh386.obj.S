Module: seh386
GROUP: 'DGROUP' _DATA

Segment: _TEXT DWORD USE32 0000011F bytes
0000                            __TryInit:
0000  64 FF 35 00 00 00 00              push            dword ptr fs:[0x0]
0007  8F 00                             pop             dword ptr [eax]
0009  C7 40 04 32 00 00 00              mov             dword ptr 0x4[eax],offset __TryHandler
0010  89 68 08                          mov             dword ptr 0x8[eax],ebp
0013  C6 40 10 FF                       mov             byte ptr 0x10[eax],0xff
0017  C6 40 11 00                       mov             byte ptr 0x11[eax],0x00
001B  64 A3 00 00 00 00                 mov             dword ptr fs:[0x0],eax
0021  C3                                ret

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022                            __TryFini:
0022  FF 30                             push            dword ptr [eax]
0024  64 8F 05 00 00 00 00              pop             dword ptr fs:[0x0]
002B  64 A3 00 00 00 00                 mov             dword ptr fs:[0x0],eax
0031  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 0022

0032                            __TryHandler:
0032  55                                push            ebp
0033  89 E5                             mov             ebp,esp
0035  57                                push            edi
0036  56                                push            esi
0037  52                                push            edx
0038  51                                push            ecx
0039  53                                push            ebx
003A  8B 7D 0C                          mov             edi,dword ptr 0xc[ebp]
003D  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0040  F7 40 04 06 00 00 00              test            dword ptr 0x4[eax],0x00000006
0047  74 0D                             je              L$1
0049  89 FD                             mov             ebp,edi
004B  C6 45 12 FF                       mov             byte ptr 0x12[ebp],0xff
004F  E8 72 00 00 00                    call            L$9
0054  EB 3E                             jmp             L$4
0056                            L$1:
0056  89 47 14                          mov             dword ptr 0x14[edi],eax
0059  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
005C  89 47 18                          mov             dword ptr 0x18[edi],eax
005F  89 FD                             mov             ebp,edi
0061  8B 7D 0C                          mov             edi,dword ptr 0xc[ebp]
0064  29 DB                             sub             ebx,ebx
0066  8A 5D 10                          mov             bl,byte ptr 0x10[ebp]
0069                            L$2:
0069  80 FB FF                          cmp             bl,0xff
006C  74 26                             je              L$4
006E  88 5D 12                          mov             byte ptr 0x12[ebp],bl
0071  8D 1C 5B                          lea             ebx,[ebx+ebx*2]
0074  80 7C 5F 01 00                    cmp             byte ptr 0x1[edi+ebx*2],0x00
0079  75 14                             jne             L$3
007B  55                                push            ebp
007C  57                                push            edi
007D  53                                push            ebx
007E  8B 6D 08                          mov             ebp,dword ptr 0x8[ebp]
0081  FF 64 5F 02                       jmp             dword ptr 0x2[edi+ebx*2]

Routine Size: 83 bytes,    Routine Base: _TEXT + 0032

0085                            __Except:
0085  5A                                pop             edx
0086  5B                                pop             ebx
0087  5F                                pop             edi
0088  5D                                pop             ebp
0089  40                                inc             eax
008A  74 0D                             je              L$5
008C  48                                dec             eax
008D  75 11                             jne             L$6
008F                            L$3:
008F  8A 1C 5F                          mov             bl,byte ptr [edi+ebx*2]
0092  EB D5                             jmp             L$2
0094                            L$4:
0094  B8 01 00 00 00                    mov             eax,0x00000001
0099                            L$5:
0099  5B                                pop             ebx
009A  59                                pop             ecx
009B  5A                                pop             edx
009C  5E                                pop             esi
009D  5F                                pop             edi
009E  5D                                pop             ebp
009F  C3                                ret
00A0                            L$6:
00A0  52                                push            edx
00A1  E8 06 00 00 00                    call            L$7
00A6  E8 1B 00 00 00                    call            L$9
00AB  C3                                ret
00AC                            L$7:
00AC  55                                push            ebp
00AD  57                                push            edi
00AE  56                                push            esi
00AF  52                                push            edx
00B0  51                                push            ecx
00B1  53                                push            ebx
00B2  6A 00                             push            0x00000000
00B4  68 BF 00 00 00                    push            offset L$8
00B9  55                                push            ebp
00BA  E8 00 00 00 00                    call            _RtlUnwind
00BF                            L$8:
00BF  5B                                pop             ebx
00C0  59                                pop             ecx
00C1  5A                                pop             edx
00C2  5E                                pop             esi
00C3  5F                                pop             edi
00C4  5D                                pop             ebp
00C5  C3                                ret
00C6                            L$9:
00C6  55                                push            ebp
00C7  57                                push            edi
00C8  56                                push            esi
00C9  52                                push            edx
00CA  51                                push            ecx
00CB  53                                push            ebx
00CC  8B 7D 0C                          mov             edi,dword ptr 0xc[ebp]
00CF  29 DB                             sub             ebx,ebx
00D1  8A 5D 10                          mov             bl,byte ptr 0x10[ebp]
00D4  C6 45 11 01                       mov             byte ptr 0x11[ebp],0x01
00D8                            L$10:
00D8  80 FB FF                          cmp             bl,0xff
00DB  74 25                             je              L$12
00DD  3A 5D 12                          cmp             bl,byte ptr 0x12[ebp]
00E0  74 20                             je              L$12
00E2  8D 1C 5B                          lea             ebx,[ebx+ebx*2]
00E5  80 7C 5F 01 00                    cmp             byte ptr 0x1[edi+ebx*2],0x00
00EA  74 0E                             je              L$11
00EC  55                                push            ebp
00ED  57                                push            edi
00EE  53                                push            ebx
00EF  8B 6D 08                          mov             ebp,dword ptr 0x8[ebp]
00F2  FF 54 5F 02                       call            dword ptr 0x2[edi+ebx*2]
00F6  5A                                pop             edx
00F7  5B                                pop             ebx
00F8  5F                                pop             edi
00F9  5D                                pop             ebp
00FA                            L$11:
00FA  8A 1C 5F                          mov             bl,byte ptr [edi+ebx*2]
00FD  88 5D 10                          mov             byte ptr 0x10[ebp],bl
0100  EB D6                             jmp             L$10
0102                            L$12:
0102  C6 45 11 00                       mov             byte ptr 0x11[ebp],0x00
0106  5B                                pop             ebx
0107  59                                pop             ecx
0108  5A                                pop             edx
0109  5E                                pop             esi
010A  5F                                pop             edi
010B  5D                                pop             ebp
010C  C3                                ret

Routine Size: 136 bytes,    Routine Base: _TEXT + 0085

010D                            __TryUnwind:
010D  55                                push            ebp
010E  64 8B 2D 00 00 00 00              mov             ebp,dword ptr fs:[0x0]
0115  88 45 12                          mov             byte ptr 0x12[ebp],al
0118  E8 A9 FF FF FF                    call            L$9
011D  5D                                pop             ebp
011E  C3                                ret

Routine Size: 18 bytes,    Routine Base: _TEXT + 010D

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

