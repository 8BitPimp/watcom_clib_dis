Module: cgetswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000013E bytes
0000                            cgets_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  55                                push            ebp
0006  83 EC 1C                          sub             esp,0x0000001c
0009  50                                push            eax
000A  8B 15 00 00 00 00                 mov             edx,dword ptr __WindowsStdin
0010  8D 78 02                          lea             edi,0x2[eax]
0013  85 D2                             test            edx,edx
0015  74 4A                             je              L$3
0017  31 DB                             xor             ebx,ebx
0019  8A 18                             mov             bl,byte ptr [eax]
001B  89 FA                             mov             edx,edi
001D  4B                                dec             ebx
001E  31 C0                             xor             eax,eax
0020  E8 00 00 00 00                    call            __qread_
0025  8B 04 24                          mov             eax,dword ptr [esp]
0028  89 7C 24 1C                       mov             dword ptr 0x1c[esp],edi
002C  8A 00                             mov             al,byte ptr [eax]
002E                            L$1:
002E  3C 01                             cmp             al,0x01
0030  76 1A                             jbe             L$2
0032  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0036  8A 22                             mov             ah,byte ptr [edx]
0038  80 FC 0D                          cmp             ah,0x0d
003B  74 0F                             je              L$2
003D  84 E4                             test            ah,ah
003F  74 0B                             je              L$2
0041  8D 5A 01                          lea             ebx,0x1[edx]
0044  FE C8                             dec             al
0046  89 5C 24 1C                       mov             dword ptr 0x1c[esp],ebx
004A  EB E2                             jmp             L$1
004C                            L$2:
004C  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0050  8A 3C 24                          mov             bh,byte ptr [esp]
0053  C6 00 00                          mov             byte ptr [eax],0x00
0056  8A 44 24 1C                       mov             al,byte ptr 0x1c[esp]
005A  28 F8                             sub             al,bh
005C  E9 C8 00 00 00                    jmp             L$10
0061                            L$3:
0061  8B 1C 24                          mov             ebx,dword ptr [esp]
0064  31 C0                             xor             eax,eax
0066  BD 20 00 00 00                    mov             ebp,0x00000020
006B  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0071  E8 00 00 00 00                    call            __NTConsoleInput_
0076  89 7C 24 1C                       mov             dword ptr 0x1c[esp],edi
007A  89 C6                             mov             esi,eax
007C  8A 1B                             mov             bl,byte ptr [ebx]
007E                            L$4:
007E  8D 44 24 18                       lea             eax,0x18[esp]
0082  50                                push            eax
0083  6A 01                             push            0x00000001
0085  8D 44 24 0C                       lea             eax,0xc[esp]
0089  50                                push            eax
008A  56                                push            esi
008B  E8 00 00 00 00                    call            _ReadConsoleInputA
0090  8D 44 24 04                       lea             eax,0x4[esp]
0094  E8 00 00 00 00                    call            __NTRealKey_
0099  85 C0                             test            eax,eax
009B  74 E1                             je              L$4
009D  80 7C 24 12 0D                    cmp             byte ptr 0x12[esp],0x0d
00A2  0F 84 69 00 00 00                 je              L$9
00A8  EB 5A                             jmp             L$8
00AA                            L$5:
00AA  8A 44 24 12                       mov             al,byte ptr 0x12[esp]
00AE  3C 08                             cmp             al,0x08
00B0  75 2E                             jne             L$6
00B2  3B 7C 24 1C                       cmp             edi,dword ptr 0x1c[esp]
00B6  73 47                             jae             L$7
00B8  B8 08 00 00 00                    mov             eax,0x00000008
00BD  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
00C1  E8 00 00 00 00                    call            putch_
00C6  89 E8                             mov             eax,ebp
00C8  FE C3                             inc             bl
00CA  E8 00 00 00 00                    call            putch_
00CF  B8 08 00 00 00                    mov             eax,0x00000008
00D4  4A                                dec             edx
00D5  E8 00 00 00 00                    call            putch_
00DA  89 54 24 1C                       mov             dword ptr 0x1c[esp],edx
00DE  EB 1F                             jmp             L$7
00E0                            L$6:
00E0  80 FB 01                          cmp             bl,0x01
00E3  76 1A                             jbe             L$7
00E5  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
00E9  FE CB                             dec             bl
00EB  88 02                             mov             byte ptr [edx],al
00ED  31 C0                             xor             eax,eax
00EF  8D 4A 01                          lea             ecx,0x1[edx]
00F2  8A 44 24 12                       mov             al,byte ptr 0x12[esp]
00F6  89 4C 24 1C                       mov             dword ptr 0x1c[esp],ecx
00FA  E8 00 00 00 00                    call            putch_
00FF                            L$7:
00FF  66 FF 4C 24 0C                    dec             word ptr 0xc[esp]
0104                            L$8:
0104  66 83 7C 24 0C 00                 cmp             word ptr 0xc[esp],0x0000
010A  77 9E                             ja              L$5
010C  E9 6D FF FF FF                    jmp             L$4
0111                            L$9:
0111  8B 44 24 1C                       mov             eax,dword ptr 0x1c[esp]
0115  C6 00 00                          mov             byte ptr [eax],0x00
0118  31 C0                             xor             eax,eax
011A  8A 2C 24                          mov             ch,byte ptr [esp]
011D  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0123  8A 44 24 1C                       mov             al,byte ptr 0x1c[esp]
0127  28 E8                             sub             al,ch
0129                            L$10:
0129  8B 14 24                          mov             edx,dword ptr [esp]
012C  2C 02                             sub             al,0x02
012E  88 42 01                          mov             byte ptr 0x1[edx],al
0131  8D 42 02                          lea             eax,0x2[edx]
0134  83 C4 20                          add             esp,0x00000020
0137  5D                                pop             ebp
0138  5F                                pop             edi
0139  5E                                pop             esi
013A  5A                                pop             edx
013B  59                                pop             ecx
013C  5B                                pop             ebx
013D  C3                                ret

Routine Size: 318 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

