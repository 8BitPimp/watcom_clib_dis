Module: efgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000134 bytes
0000                            _EFG_Format:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
000B  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
000F  8B 74 24 24                       mov             esi,dword ptr 0x24[esp]
0013  8C DF                             mov             edi,ds
0015  C7 46 0C 00 00 00 00              mov             dword ptr 0xc[esi],0x00000000
001C  89 D8                             mov             eax,ebx
001E  8A 4E 15                          mov             cl,byte ptr 0x15[esi]
0021  31 ED                             xor             ebp,ebp
0023  80 F9 47                          cmp             cl,0x47
0026  72 1D                             jb              L$2
0028  76 28                             jbe             L$3
002A  80 F9 66                          cmp             cl,0x66
002D  72 0C                             jb              L$1
002F  76 36                             jbe             L$6
0031  80 F9 67                          cmp             cl,0x67
0034  74 1C                             je              L$3
0036  E9 A3 00 00 00                    jmp             L$11
003B                            L$1:
003B  80 F9 65                          cmp             cl,0x65
003E  74 22                             je              L$5
0040  E9 99 00 00 00                    jmp             L$11
0045                            L$2:
0045  80 F9 45                          cmp             cl,0x45
0048  0F 82 90 00 00 00                 jb              L$11
004E  76 12                             jbe             L$5
0050  EB 15                             jmp             L$6
0052                            L$3:
0052  83 7E 08 00                       cmp             dword ptr 0x8[esi],0x00000000
0056  75 07                             jne             L$4
0058  C7 46 08 01 00 00 00              mov             dword ptr 0x8[esi],0x00000001
005F                            L$4:
005F  80 E9 02                          sub             cl,0x02
0062                            L$5:
0062  BD 01 00 00 00                    mov             ebp,0x00000001
0067                            L$6:
0067  8B 02                             mov             eax,dword ptr [edx]
0069  83 C0 08                          add             eax,0x00000008
006C  89 02                             mov             dword ptr [edx],eax
006E  89 C2                             mov             edx,eax
0070  8B 40 F8                          mov             eax,dword ptr -0x8[eax]
0073  89 04 24                          mov             dword ptr [esp],eax
0076  8B 42 FC                          mov             eax,dword ptr -0x4[edx]
0079  89 44 24 04                       mov             dword ptr 0x4[esp],eax
007D  83 7E 08 FF                       cmp             dword ptr 0x8[esi],0xffffffff
0081  75 07                             jne             L$7
0083  C7 46 08 06 00 00 00              mov             dword ptr 0x8[esi],0x00000006
008A                            L$7:
008A  8A 46 15                          mov             al,byte ptr 0x15[esi]
008D  24 5F                             and             al,0x5f
008F  25 FF 00 00 00                    and             eax,0x000000ff
0094  50                                push            eax
0095  31 C0                             xor             eax,eax
0097  88 C8                             mov             al,cl
0099  50                                push            eax
009A  6A 03                             push            0x00000003
009C  55                                push            ebp
009D  6A 27                             push            0x00000027
009F  6A 00                             push            0x00000000
00A1  8B 4E 08                          mov             ecx,dword ptr 0x8[esi]
00A4  51                                push            ecx
00A5  8D 44 24 1C                       lea             eax,0x1c[esp]
00A9  50                                push            eax
00AA  53                                push            ebx
00AB  E8 00 00 00 00                    call            _FtoS
00B0  8A 23                             mov             ah,byte ptr [ebx]
00B2  83 C4 24                          add             esp,0x00000024
00B5  80 FC 2A                          cmp             ah,0x2a
00B8  75 03                             jne             L$8
00BA  88 66 16                          mov             byte ptr 0x16[esi],ah
00BD                            L$8:
00BD  C6 43 27 00                       mov             byte ptr 0x27[ebx],0x00
00C1                            L$9:
00C1  80 3B 20                          cmp             byte ptr [ebx],0x20
00C4  75 03                             jne             L$10
00C6  43                                inc             ebx
00C7  EB F8                             jmp             L$9
00C9                            L$10:
00C9  56                                push            esi
00CA  53                                push            ebx
00CB  8C DF                             mov             edi,ds
00CD  E8 00 00 00 00                    call            forcedecpt
00D2  83 C4 08                          add             esp,0x00000008
00D5  89 D8                             mov             eax,ebx
00D7  C7 46 08 FF FF FF FF              mov             dword ptr 0x8[esi],0xffffffff
00DE                            L$11:
00DE  89 FA                             mov             edx,edi
00E0  83 C4 08                          add             esp,0x00000008
00E3  5D                                pop             ebp
00E4  5F                                pop             edi
00E5  5E                                pop             esi
00E6  5B                                pop             ebx
00E7  C3                                ret
00E8                            forcedecpt:
00E8  53                                push            ebx
00E9  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
00ED  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
00F1  F6 43 14 01                       test            byte ptr 0x14[ebx],0x01
00F5  75 3B                             jne             L$17
00F7                            L$12:
00F7  8A 30                             mov             dh,byte ptr [eax]
00F9  84 F6                             test            dh,dh
00FB  74 0D                             je              L$13
00FD  80 FE 65                          cmp             dh,0x65
0100  74 08                             je              L$13
0102  80 FE 45                          cmp             dh,0x45
0105  74 03                             je              L$13
0107  40                                inc             eax
0108  EB ED                             jmp             L$12
010A                            L$13:
010A  89 C2                             mov             edx,eax
010C  8A 4B 15                          mov             cl,byte ptr 0x15[ebx]
010F  48                                dec             eax
0110  80 F9 47                          cmp             cl,0x47
0113  74 05                             je              L$14
0115  80 F9 67                          cmp             cl,0x67
0118  75 08                             jne             L$15
011A                            L$14:
011A  80 38 30                          cmp             byte ptr [eax],0x30
011D  75 03                             jne             L$15
011F  48                                dec             eax
0120  EB F8                             jmp             L$14
0122                            L$15:
0122  80 38 2E                          cmp             byte ptr [eax],0x2e
0125  74 01                             je              L$16
0127  40                                inc             eax
0128                            L$16:
0128  8A 1A                             mov             bl,byte ptr [edx]
012A  42                                inc             edx
012B  88 18                             mov             byte ptr [eax],bl
012D  40                                inc             eax
012E  84 DB                             test            bl,bl
0130  75 F6                             jne             L$16
0132                            L$17:
0132  5B                                pop             ebx
0133  C3                                ret

Routine Size: 308 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

