Module: searchen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E9 bytes
0000                            _searchenv_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 04 00 00                       enter           0x0004,0x00
0007  89 C1                             mov             ecx,eax
0009  89 D7                             mov             edi,edx
000B  89 DE                             mov             esi,ebx
000D  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0013  8B 40 04                          mov             eax,dword ptr 0x4[eax]
0016  31 D2                             xor             edx,edx
0018  89 45 FC                          mov             dword ptr -0x4[ebp],eax
001B  89 C8                             mov             eax,ecx
001D  E8 00 00 00 00                    call            access_
0022  85 C0                             test            eax,eax
0024  75 47                             jne             L$3
0026  89 D8                             mov             eax,ebx
0028  80 39 5C                          cmp             byte ptr [ecx],0x5c
002B  74 34                             je              L$2
002D  80 39 2E                          cmp             byte ptr [ecx],0x2e
0030  74 2F                             je              L$2
0032  80 39 2F                          cmp             byte ptr [ecx],0x2f
0035  74 2A                             je              L$2
0037  80 39 00                          cmp             byte ptr [ecx],0x00
003A  74 06                             je              L$1
003C  80 79 01 3A                       cmp             byte ptr 0x1[ecx],0x3a
0040  74 1F                             je              L$2
0042                            L$1:
0042  BA 50 00 00 00                    mov             edx,0x00000050
0047  89 F0                             mov             eax,esi
0049  E8 00 00 00 00                    call            getcwd_
004E  89 F0                             mov             eax,esi
0050  E8 00 00 00 00                    call            strlen_
0055  01 F0                             add             eax,esi
0057  80 78 FF 5C                       cmp             byte ptr -0x1[eax],0x5c
005B  74 04                             je              L$2
005D  C6 00 5C                          mov             byte ptr [eax],0x5c
0060  40                                inc             eax
0061                            L$2:
0061  89 CA                             mov             edx,ecx
0063  E8 00 00 00 00                    call            strcpy_
0068  C9                                leave
0069  5F                                pop             edi
006A  5E                                pop             esi
006B  59                                pop             ecx
006C  C3                                ret
006D                            L$3:
006D  89 F8                             mov             eax,edi
006F  E8 00 00 00 00                    call            getenv_
0074  89 C3                             mov             ebx,eax
0076  85 C0                             test            eax,eax
0078  0F 84 63 00 00 00                 je              L$9
007E                            L$4:
007E  80 3B 00                          cmp             byte ptr [ebx],0x00
0081  0F 84 5A 00 00 00                 je              L$9
0087  89 F0                             mov             eax,esi
0089                            L$5:
0089  80 3B 00                          cmp             byte ptr [ebx],0x00
008C  74 0D                             je              L$6
008E  80 3B 3B                          cmp             byte ptr [ebx],0x3b
0091  74 08                             je              L$6
0093  8A 13                             mov             dl,byte ptr [ebx]
0095  43                                inc             ebx
0096  88 10                             mov             byte ptr [eax],dl
0098  40                                inc             eax
0099  EB EE                             jmp             L$5
009B                            L$6:
009B  39 F0                             cmp             eax,esi
009D  74 3A                             je              L$8
009F  80 78 FF 5C                       cmp             byte ptr -0x1[eax],0x5c
00A3  74 10                             je              L$7
00A5  80 78 FF 2F                       cmp             byte ptr -0x1[eax],0x2f
00A9  74 0A                             je              L$7
00AB  80 78 FF 3A                       cmp             byte ptr -0x1[eax],0x3a
00AF  74 04                             je              L$7
00B1  C6 00 5C                          mov             byte ptr [eax],0x5c
00B4  40                                inc             eax
00B5                            L$7:
00B5  89 CA                             mov             edx,ecx
00B7  C6 00 00                          mov             byte ptr [eax],0x00
00BA  E8 00 00 00 00                    call            strcat_
00BF  89 F0                             mov             eax,esi
00C1  31 D2                             xor             edx,edx
00C3  E8 00 00 00 00                    call            access_
00C8  85 C0                             test            eax,eax
00CA  75 0D                             jne             L$8
00CC  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
00CF  E8 00 00 00 00                    call            __set_errno_
00D4  C9                                leave
00D5  5F                                pop             edi
00D6  5E                                pop             esi
00D7  59                                pop             ecx
00D8  C3                                ret
00D9                            L$8:
00D9  80 3B 00                          cmp             byte ptr [ebx],0x00
00DC  74 03                             je              L$9
00DE  43                                inc             ebx
00DF  EB 9D                             jmp             L$4
00E1                            L$9:
00E1  C6 06 00                          mov             byte ptr [esi],0x00
00E4  C9                                leave
00E5  5F                                pop             edi
00E6  5E                                pop             esi
00E7  59                                pop             ecx
00E8  C3                                ret

Routine Size: 233 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

