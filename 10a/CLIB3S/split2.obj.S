Module: split2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F3 bytes
0000                            pcopy:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0007  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
000B  85 C0                             test            eax,eax
000D  75 06                             jne             L$1
000F  89 D8                             mov             eax,ebx
0011  5F                                pop             edi
0012  5E                                pop             esi
0013  5B                                pop             ebx
0014  C3                                ret
0015                            L$1:
0015  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0019  2B 54 24 18                       sub             edx,dword ptr 0x18[esp]
001D  89 18                             mov             dword ptr [eax],ebx
001F  81 FA 07 01 00 00                 cmp             edx,0x00000107
0025  72 05                             jb              L$2
0027  BA 06 01 00 00                    mov             edx,0x00000106
002C                            L$2:
002C  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0030  89 DF                             mov             edi,ebx
0032  89 D1                             mov             ecx,edx
0034  06                                push            es
0035  8C D8                             mov             eax,ds
0037  8E C0                             mov             es,eax
0039  57                                push            edi
003A  89 C8                             mov             eax,ecx
003C  C1 E9 02                          shr             ecx,0x02
003F  F2 A5                             repne movsd
0041  8A C8                             mov             cl,al
0043  80 E1 03                          and             cl,0x03
0046  F2 A4                             repne movsb
0048  5F                                pop             edi
0049  07                                pop             es
004A  8D 04 13                          lea             eax,[ebx+edx]
004D  C6 00 00                          mov             byte ptr [eax],0x00
0050  40                                inc             eax
0051  5F                                pop             edi
0052  5E                                pop             esi
0053  5B                                pop             ebx
0054  C3                                ret

Routine Size: 85 bytes,    Routine Base: _TEXT + 0000

0055                            _splitpath2:
0055  53                                push            ebx
0056  56                                push            esi
0057  57                                push            edi
0058  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
005C  8B 44 24 14                       mov             eax,dword ptr 0x14[esp]
0060  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
0064  80 3B 00                          cmp             byte ptr [ebx],0x00
0067  74 21                             je              L$4
0069  8A 73 01                          mov             dh,byte ptr 0x1[ebx]
006C  80 FE 3A                          cmp             dh,0x3a
006F  75 19                             jne             L$4
0071  85 F6                             test            esi,esi
0073  74 10                             je              L$3
0075  89 06                             mov             dword ptr [esi],eax
0077  8A 13                             mov             dl,byte ptr [ebx]
0079  C6 40 02 00                       mov             byte ptr 0x2[eax],0x00
007D  88 10                             mov             byte ptr [eax],dl
007F  88 70 01                          mov             byte ptr 0x1[eax],dh
0082  83 C0 03                          add             eax,0x00000003
0085                            L$3:
0085  83 C3 02                          add             ebx,0x00000002
0088  EB 0A                             jmp             L$5
008A                            L$4:
008A  85 F6                             test            esi,esi
008C  74 06                             je              L$5
008E  89 06                             mov             dword ptr [esi],eax
0090  C6 00 00                          mov             byte ptr [eax],0x00
0093  40                                inc             eax
0094                            L$5:
0094  89 DF                             mov             edi,ebx
0096  89 D9                             mov             ecx,ebx
0098                            L$6:
0098  31 F6                             xor             esi,esi
009A                            L$7:
009A  8A 13                             mov             dl,byte ptr [ebx]
009C  84 D2                             test            dl,dl
009E  74 19                             je              L$10
00A0  80 FA 2E                          cmp             dl,0x2e
00A3  75 05                             jne             L$8
00A5  89 DE                             mov             esi,ebx
00A7  43                                inc             ebx
00A8  EB F0                             jmp             L$7
00AA                            L$8:
00AA  43                                inc             ebx
00AB  80 FA 5C                          cmp             dl,0x5c
00AE  74 05                             je              L$9
00B0  80 FA 2F                          cmp             dl,0x2f
00B3  75 E5                             jne             L$7
00B5                            L$9:
00B5  89 DF                             mov             edi,ebx
00B7  EB DF                             jmp             L$6
00B9                            L$10:
00B9  57                                push            edi
00BA  51                                push            ecx
00BB  50                                push            eax
00BC  8B 54 24 28                       mov             edx,dword ptr 0x28[esp]
00C0  52                                push            edx
00C1  E8 00 00 00 00                    call            pcopy
00C6  83 C4 10                          add             esp,0x00000010
00C9  85 F6                             test            esi,esi
00CB  75 02                             jne             L$11
00CD  89 DE                             mov             esi,ebx
00CF                            L$11:
00CF  56                                push            esi
00D0  57                                push            edi
00D1  50                                push            eax
00D2  8B 4C 24 2C                       mov             ecx,dword ptr 0x2c[esp]
00D6  51                                push            ecx
00D7  E8 00 00 00 00                    call            pcopy
00DC  83 C4 10                          add             esp,0x00000010
00DF  53                                push            ebx
00E0  56                                push            esi
00E1  50                                push            eax
00E2  8B 74 24 30                       mov             esi,dword ptr 0x30[esp]
00E6  56                                push            esi
00E7  E8 00 00 00 00                    call            pcopy
00EC  83 C4 10                          add             esp,0x00000010
00EF  5F                                pop             edi
00F0  5E                                pop             esi
00F1  5B                                pop             ebx
00F2  C3                                ret

Routine Size: 158 bytes,    Routine Base: _TEXT + 0055

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

