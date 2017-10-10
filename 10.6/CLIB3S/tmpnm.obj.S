Module: tmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000126 bytes
0000                            putbits:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0009  83 FB 1F                          cmp             ebx,0x0000001f
000C  76 12                             jbe             L$1
000E  89 DA                             mov             edx,ebx
0010  C1 EA 05                          shr             edx,0x05
0013  52                                push            edx
0014  50                                push            eax
0015  83 E3 1F                          and             ebx,0x0000001f
0018  E8 00 00 00 00                    call            putbits
001D  83 C4 08                          add             esp,0x00000008
0020                            L$1:
0020  83 FB 0A                          cmp             ebx,0x0000000a
0023  72 08                             jb              L$2
0025  80 C3 37                          add             bl,0x37
0028  88 18                             mov             byte ptr [eax],bl
002A  40                                inc             eax
002B  5B                                pop             ebx
002C  C3                                ret
002D                            L$2:
002D  80 C3 30                          add             bl,0x30
0030  88 18                             mov             byte ptr [eax],bl
0032  40                                inc             eax
0033  5B                                pop             ebx
0034  C3                                ret
0035                            init_name:
0035  53                                push            ebx
0036  B4 5F                             mov             ah,0x5f
0038  BB 00 00 00 00                    mov             ebx,offset _tmpname
003D  88 25 00 00 00 00                 mov             byte ptr _tmpname,ah
0043  E8 00 00 00 00                    call            getpid
0048  50                                push            eax
0049  43                                inc             ebx
004A  53                                push            ebx
004B  E8 00 00 00 00                    call            putbits
0050  8D 58 01                          lea             ebx,0x1[eax]
0053  C6 00 2E                          mov             byte ptr [eax],0x2e
0056  C6 03 41                          mov             byte ptr [ebx],0x41
0059  43                                inc             ebx
005A  C6 03 41                          mov             byte ptr [ebx],0x41
005D  43                                inc             ebx
005E  83 C4 08                          add             esp,0x00000008
0061  89 D8                             mov             eax,ebx
0063  C6 03 40                          mov             byte ptr [ebx],0x40
0066  2D 00 00 00 00                    sub             eax,offset _tmpname
006B  5B                                pop             ebx
006C  C3                                ret

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

006D                            tmpnam:
006D  53                                push            ebx
006E  56                                push            esi
006F  57                                push            edi
0070  55                                push            ebp
0071  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0075  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
007B  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
007E  80 3D 00 00 00 00 00              cmp             byte ptr _tmpname,0x00
0085  75 09                             jne             L$4
0087                            L$3:
0087  E8 00 00 00 00                    call            init_name
008C  89 C6                             mov             esi,eax
008E  EB 18                             jmp             L$5
0090                            L$4:
0090  BF 00 00 00 00                    mov             edi,offset _tmpname
0095  06                                push            es
0096  8C D8                             mov             eax,ds
0098  8E C0                             mov             es,eax
009A  29 C9                             sub             ecx,ecx
009C  49                                dec             ecx
009D  31 C0                             xor             eax,eax
009F  F2 AE                             repne scasb
00A1  F7 D1                             not             ecx
00A3  49                                dec             ecx
00A4  07                                pop             es
00A5  8D 71 FF                          lea             esi,-0x1[ecx]
00A8                            L$5:
00A8  31 C0                             xor             eax,eax
00AA  8A 86 00 00 00 00                 mov             al,byte ptr _tmpname[esi]
00B0  83 F8 5A                          cmp             eax,0x0000005a
00B3  75 18                             jne             L$6
00B5  B6 41                             mov             dh,0x41
00B7  31 C0                             xor             eax,eax
00B9  88 B6 00 00 00 00                 mov             byte ptr _tmpname[esi],dh
00BF  8A 86 FF FF FF FF                 mov             al,byte ptr _tmpname-0x1[esi]
00C5  4E                                dec             esi
00C6  83 F8 2E                          cmp             eax,0x0000002e
00C9  75 DD                             jne             L$5
00CB  EB BA                             jmp             L$3
00CD                            L$6:
00CD  88 C2                             mov             dl,al
00CF  6A 00                             push            0x00000000
00D1  FE C2                             inc             dl
00D3  68 00 00 00 00                    push            offset _tmpname
00D8  88 96 00 00 00 00                 mov             byte ptr _tmpname[esi],dl
00DE  E8 00 00 00 00                    call            access
00E3  83 C4 08                          add             esp,0x00000008
00E6  85 C0                             test            eax,eax
00E8  74 BE                             je              L$5
00EA  85 DB                             test            ebx,ebx
00EC  74 23                             je              L$9
00EE  BE 00 00 00 00                    mov             esi,offset _tmpname
00F3  89 DF                             mov             edi,ebx
00F5  57                                push            edi
00F6                            L$7:
00F6  8A 06                             mov             al,byte ptr [esi]
00F8  88 07                             mov             byte ptr [edi],al
00FA  3C 00                             cmp             al,0x00
00FC  74 10                             je              L$8
00FE  8A 46 01                          mov             al,byte ptr 0x1[esi]
0101  83 C6 02                          add             esi,0x00000002
0104  88 47 01                          mov             byte ptr 0x1[edi],al
0107  83 C7 02                          add             edi,0x00000002
010A  3C 00                             cmp             al,0x00
010C  75 E8                             jne             L$7
010E                            L$8:
010E  5F                                pop             edi
010F  EB 05                             jmp             L$10
0111                            L$9:
0111  BB 00 00 00 00                    mov             ebx,offset _tmpname
0116                            L$10:
0116  55                                push            ebp
0117  E8 00 00 00 00                    call            __set_errno
011C  83 C4 04                          add             esp,0x00000004
011F  89 D8                             mov             eax,ebx
0121  5D                                pop             ebp
0122  5F                                pop             edi
0123  5E                                pop             esi
0124  5B                                pop             ebx
0125  C3                                ret

Routine Size: 185 bytes,    Routine Base: _TEXT + 006D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000D bytes
0000                            _tmpname:

BSS Size: 13 bytes

