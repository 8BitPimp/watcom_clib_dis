Module: fjstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B4 bytes
0000                            _fjstrrev:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  0F A8                             push            gs
0008  55                                push            ebp
0009  8B 6C 24 24                       mov             ebp,dword ptr 0x24[esp]
000D  8E 44 24 28                       mov             es,dword ptr 0x28[esp]
0011  89 EF                             mov             edi,ebp
0013  8C C1                             mov             ecx,es
0015  89 EA                             mov             edx,ebp
0017  06                                push            es
0018  8E C1                             mov             es,ecx
001A  31 C0                             xor             eax,eax
001C  89 C1                             mov             ecx,eax
001E  49                                dec             ecx
001F  F2 AE                             repne scasb
0021  F7 D1                             not             ecx
0023  49                                dec             ecx
0024  07                                pop             es
0025  8E 64 24 28                       mov             fs,dword ptr 0x28[esp]
0029  8D 04 29                          lea             eax,[ecx+ebp]
002C                            L$1:
002C  39 C2                             cmp             edx,eax
002E  73 50                             jae             L$3
0030  31 DB                             xor             ebx,ebx
0032  26 8A 1A                          mov             bl,byte ptr es:[edx]
0035  8A 9B 01 00 00 00                 mov             bl,byte ptr _IsKTable+0x1[ebx]
003B  80 E3 04                          and             bl,0x04
003E  81 E3 FF 00 00 00                 and             ebx,0x000000ff
0044  74 37                             je              L$2
0046  8C C3                             mov             ebx,es
0048  8E EB                             mov             gs,ebx
004A  8D 5A 01                          lea             ebx,0x1[edx]
004D  65 0F B6 33                       movzx           esi,byte ptr gs:[ebx]
0051  8A 8E 01 00 00 00                 mov             cl,byte ptr _IsKTable+0x1[esi]
0057  80 E1 08                          and             cl,0x08
005A  0F B6 F1                          movzx           esi,cl
005D  85 F6                             test            esi,esi
005F  74 1C                             je              L$2
0061  65 8A 0B                          mov             cl,byte ptr gs:[ebx]
0064  26 8A 2A                          mov             ch,byte ptr es:[edx]
0067  30 CD                             xor             ch,cl
0069  26 88 2A                          mov             byte ptr es:[edx],ch
006C  88 E9                             mov             cl,ch
006E  65 8A 2B                          mov             ch,byte ptr gs:[ebx]
0071  30 CD                             xor             ch,cl
0073  65 88 2B                          mov             byte ptr gs:[ebx],ch
0076  88 E9                             mov             cl,ch
0078  26 30 0A                          xor             byte ptr es:[edx],cl
007B  89 DA                             mov             edx,ebx
007D                            L$2:
007D  42                                inc             edx
007E  EB AC                             jmp             L$1
0080                            L$3:
0080  8E 44 24 28                       mov             es,dword ptr 0x28[esp]
0084  89 EA                             mov             edx,ebp
0086                            L$4:
0086  48                                dec             eax
0087  39 C2                             cmp             edx,eax
0089  73 19                             jae             L$5
008B  64 8A 18                          mov             bl,byte ptr fs:[eax]
008E  26 8A 3A                          mov             bh,byte ptr es:[edx]
0091  30 DF                             xor             bh,bl
0093  26 88 3A                          mov             byte ptr es:[edx],bh
0096  64 8A 08                          mov             cl,byte ptr fs:[eax]
0099  30 F9                             xor             cl,bh
009B  64 88 08                          mov             byte ptr fs:[eax],cl
009E  26 30 0A                          xor             byte ptr es:[edx],cl
00A1  42                                inc             edx
00A2  EB E2                             jmp             L$4
00A4                            L$5:
00A4  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
00A8  89 E8                             mov             eax,ebp
00AA  5D                                pop             ebp
00AB  0F A9                             pop             gs
00AD  0F A1                             pop             fs
00AF  07                                pop             es
00B0  5F                                pop             edi
00B1  5E                                pop             esi
00B2  5B                                pop             ebx
00B3  CB                                retf

Routine Size: 180 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

