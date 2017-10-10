Module: tmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000104 bytes
0000                            putbits:
0000  53                                push            ebx
0001  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0005  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0009  83 FB 0F                          cmp             ebx,0x0000000f
000C  76 12                             jbe             L$1
000E  89 DA                             mov             edx,ebx
0010  C1 EA 04                          shr             edx,0x04
0013  52                                push            edx
0014  50                                push            eax
0015  83 E3 0F                          and             ebx,0x0000000f
0018  E8 00 00 00 00                    call            putbits
001D  83 C4 08                          add             esp,0x00000008
0020                            L$1:
0020  80 C3 41                          add             bl,0x41
0023  88 18                             mov             byte ptr [eax],bl
0025  40                                inc             eax
0026  5B                                pop             ebx
0027  C3                                ret
0028                            init_name:
0028  53                                push            ebx
0029  56                                push            esi
002A  57                                push            edi
002B  06                                push            es
002C  BB 00 00 00 00                    mov             ebx,offset _tmpname
0031  B4 41                             mov             ah,0x41
0033  43                                inc             ebx
0034  88 25 00 00 00 00                 mov             byte ptr _tmpname,ah
003A  88 23                             mov             byte ptr [ebx],ah
003C  43                                inc             ebx
003D  C6 03 40                          mov             byte ptr [ebx],0x40
0040  E8 00 00 00 00                    call            getpid
0045  50                                push            eax
0046  43                                inc             ebx
0047  53                                push            ebx
0048  E8 00 00 00 00                    call            putbits
004D  89 C7                             mov             edi,eax
004F  8C D8                             mov             eax,ds
0051  8E C0                             mov             es,eax
0053  BE 00 00 00 00                    mov             esi,offset DGROUP:L$10
0058  83 C4 08                          add             esp,0x00000008
005B  A5                                movsd
005C  A4                                movsb
005D  07                                pop             es
005E  5F                                pop             edi
005F  5E                                pop             esi
0060  5B                                pop             ebx
0061  C3                                ret

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

0062                            tmpnam:
0062  53                                push            ebx
0063  56                                push            esi
0064  57                                push            edi
0065  55                                push            ebp
0066  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
006A  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0070  8B 68 04                          mov             ebp,dword ptr 0x4[eax]
0073  80 3D 00 00 00 00 00              cmp             byte ptr _tmpname,0x00
007A  75 05                             jne             L$2
007C  E8 00 00 00 00                    call            init_name
0081                            L$2:
0081  BF 02 00 00 00                    mov             edi,0x00000002
0086  31 F6                             xor             esi,esi
0088                            L$3:
0088  89 F8                             mov             eax,edi
008A                            L$4:
008A  8A 90 00 00 00 00                 mov             dl,byte ptr _tmpname[eax]
0090  80 FA 5A                          cmp             dl,0x5a
0093  75 13                             jne             L$5
0095  48                                dec             eax
0096  C6 80 01 00 00 00 41              mov             byte ptr _tmpname+0x1[eax],0x41
009D  85 C0                             test            eax,eax
009F  7D E9                             jge             L$4
00A1  E8 00 00 00 00                    call            init_name
00A6  EB E0                             jmp             L$3
00A8                            L$5:
00A8  88 D6                             mov             dh,dl
00AA  56                                push            esi
00AB  FE C6                             inc             dh
00AD  68 00 00 00 00                    push            offset _tmpname
00B2  88 B0 00 00 00 00                 mov             byte ptr _tmpname[eax],dh
00B8  E8 00 00 00 00                    call            access
00BD  83 C4 08                          add             esp,0x00000008
00C0  85 C0                             test            eax,eax
00C2  74 C4                             je              L$3
00C4  85 DB                             test            ebx,ebx
00C6  74 27                             je              L$8
00C8  BE 00 00 00 00                    mov             esi,offset _tmpname
00CD  89 DF                             mov             edi,ebx
00CF  57                                push            edi
00D0                            L$6:
00D0  8A 06                             mov             al,byte ptr [esi]
00D2  88 07                             mov             byte ptr [edi],al
00D4  3C 00                             cmp             al,0x00
00D6  0F 84 10 00 00 00                 je              L$7
00DC  8A 46 01                          mov             al,byte ptr 0x1[esi]
00DF  83 C6 02                          add             esi,0x00000002
00E2  88 47 01                          mov             byte ptr 0x1[edi],al
00E5  83 C7 02                          add             edi,0x00000002
00E8  3C 00                             cmp             al,0x00
00EA  75 E4                             jne             L$6
00EC                            L$7:
00EC  5F                                pop             edi
00ED  EB 05                             jmp             L$9
00EF                            L$8:
00EF  BB 00 00 00 00                    mov             ebx,offset _tmpname
00F4                            L$9:
00F4  55                                push            ebp
00F5  E8 00 00 00 00                    call            __set_errno
00FA  83 C4 04                          add             esp,0x00000004
00FD  89 D8                             mov             eax,ebx
00FF  5D                                pop             ebp
0100  5F                                pop             edi
0101  5E                                pop             esi
0102  5B                                pop             ebx
0103  C3                                ret

Routine Size: 162 bytes,    Routine Base: _TEXT + 0062

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$10:
0000  2E 54 4D 50 00                                  .TMP.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000D bytes
0000                            _tmpname:

BSS Size: 13 bytes

