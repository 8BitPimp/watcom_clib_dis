Module: nexpand
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000020A bytes
0000                            _expand:
0000  53                                push            ebx
0001  8B 54 24 0C                       mov             edx,dword ptr 0xc[esp]
0005  52                                push            edx
0006  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
000A  53                                push            ebx
000B  E8 00 00 00 00                    call            _nexpand
0010  83 C4 08                          add             esp,0x00000008
0013  5B                                pop             ebx
0014  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015                            __HeapManager_expand:
0015  53                                push            ebx
0016  56                                push            esi
0017  57                                push            edi
0018  55                                push            ebp
0019  83 EC 10                          sub             esp,0x00000010
001C  8B 74 24 28                       mov             esi,dword ptr 0x28[esp]
0020  8B 6C 24 30                       mov             ebp,dword ptr 0x30[esp]
0024  8B 44 24 2C                       mov             eax,dword ptr 0x2c[esp]
0028  83 C0 07                          add             eax,0x00000007
002B  8B 54 24 2C                       mov             edx,dword ptr 0x2c[esp]
002F  24 FC                             and             al,0xfc
0031  39 D0                             cmp             eax,edx
0033  73 05                             jae             L$1
0035  B8 FF FF FF FF                    mov             eax,0xffffffff
003A                            L$1:
003A  83 F8 0C                          cmp             eax,0x0000000c
003D  73 05                             jae             L$2
003F  B8 0C 00 00 00                    mov             eax,0x0000000c
0044                            L$2:
0044  8D 56 FC                          lea             edx,-0x4[esi]
0047  89 14 24                          mov             dword ptr [esp],edx
004A  8B 12                             mov             edx,dword ptr [edx]
004C  80 E2 FE                          and             dl,0xfe
004F  39 D0                             cmp             eax,edx
0051  0F 86 07 01 00 00                 jbe             L$14
0057  8B 3C 24                          mov             edi,dword ptr [esp]
005A  29 D0                             sub             eax,edx
005C  01 D7                             add             edi,edx
005E  89 45 00                          mov             dword ptr [ebp],eax
0061                            L$3:
0061  8B 07                             mov             eax,dword ptr [edi]
0063  89 44 24 0C                       mov             dword ptr 0xc[esp],eax
0067  83 F8 FF                          cmp             eax,0xffffffff
006A  75 0A                             jne             L$4
006C  B8 02 00 00 00                    mov             eax,0x00000002
0071  E9 42 01 00 00                    jmp             L$20
0076                            L$4:
0076  F6 44 24 0C 01                    test            byte ptr 0xc[esp],0x01
007B  0F 85 D6 00 00 00                 jne             L$13
0081  8B 47 08                          mov             eax,dword ptr 0x8[edi]
0084  89 44 24 08                       mov             dword ptr 0x8[esp],eax
0088  8B 47 04                          mov             eax,dword ptr 0x4[edi]
008B  8C DA                             mov             edx,ds
008D  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0091  B8 00 00 00 00                    mov             eax,offset __nheapbeg
0096  66 3B 54 24 24                    cmp             dx,word ptr 0x24[esp]
009B  75 1A                             jne             L$8
009D  8B 1D 00 00 00 00                 mov             ebx,dword ptr __nheapbeg
00A3  EB 0B                             jmp             L$7
00A5                            L$5:
00A5  39 F3                             cmp             ebx,esi
00A7  77 04                             ja              L$6
00A9  39 CE                             cmp             esi,ecx
00AB  72 0A                             jb              L$8
00AD                            L$6:
00AD  8B 5B 08                          mov             ebx,dword ptr 0x8[ebx]
00B0                            L$7:
00B0  8B 4B 08                          mov             ecx,dword ptr 0x8[ebx]
00B3  85 C9                             test            ecx,ecx
00B5  75 EE                             jne             L$5
00B7                            L$8:
00B7  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
00BA  39 D7                             cmp             edi,edx
00BC  75 06                             jne             L$9
00BE  8B 42 04                          mov             eax,dword ptr 0x4[edx]
00C1  89 43 0C                          mov             dword ptr 0xc[ebx],eax
00C4                            L$9:
00C4  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
00C8  8B 4D 00                          mov             ecx,dword ptr [ebp]
00CB  39 C8                             cmp             eax,ecx
00CD  72 07                             jb              L$10
00CF  29 C8                             sub             eax,ecx
00D1  83 F8 0C                          cmp             eax,0x0000000c
00D4  73 3C                             jae             L$11
00D6                            L$10:
00D6  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
00DA  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00DE  89 50 08                          mov             dword ptr 0x8[eax],edx
00E1  89 D0                             mov             eax,edx
00E3  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00E7  89 50 04                          mov             dword ptr 0x4[eax],edx
00EA  8B 14 24                          mov             edx,dword ptr [esp]
00ED  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
00F1  01 02                             add             dword ptr [edx],eax
00F3  8B 43 1C                          mov             eax,dword ptr 0x1c[ebx]
00F6  30 F6                             xor             dh,dh
00F8  48                                dec             eax
00F9  88 35 00 00 00 00                 mov             byte ptr __fheap_clean,dh
00FF  89 43 1C                          mov             dword ptr 0x1c[ebx],eax
0102  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0106  8B 55 00                          mov             edx,dword ptr [ebp]
0109  39 D0                             cmp             eax,edx
010B  72 3C                             jb              L$12
010D  E9 A4 00 00 00                    jmp             L$19
0112                            L$11:
0112  01 CF                             add             edi,ecx
0114  89 07                             mov             dword ptr [edi],eax
0116  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
011A  89 47 04                          mov             dword ptr 0x4[edi],eax
011D  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0121  89 47 08                          mov             dword ptr 0x8[edi],eax
0124  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0128  89 78 08                          mov             dword ptr 0x8[eax],edi
012B  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
012F  89 78 04                          mov             dword ptr 0x4[eax],edi
0132  8B 14 24                          mov             edx,dword ptr [esp]
0135  8B 45 00                          mov             eax,dword ptr [ebp]
0138  01 02                             add             dword ptr [edx],eax
013A  30 D2                             xor             dl,dl
013C  31 C0                             xor             eax,eax
013E  88 15 00 00 00 00                 mov             byte ptr __fheap_clean,dl
0144  E9 6F 00 00 00                    jmp             L$20
0149                            L$12:
0149  89 D1                             mov             ecx,edx
014B  29 C1                             sub             ecx,eax
014D  01 C7                             add             edi,eax
014F  89 4D 00                          mov             dword ptr [ebp],ecx
0152  E9 0A FF FF FF                    jmp             L$3
0157                            L$13:
0157  B8 01 00 00 00                    mov             eax,0x00000001
015C  EB 5A                             jmp             L$20
015E                            L$14:
015E  29 C2                             sub             edx,eax
0160  83 FA 0C                          cmp             edx,0x0000000c
0163  72 51                             jb              L$19
0165  8B 2C 24                          mov             ebp,dword ptr [esp]
0168  89 C7                             mov             edi,eax
016A  80 CA 01                          or              dl,0x01
016D  66 83 CF 01                       or              di,0x0001
0171  8D 0C 28                          lea             ecx,[eax+ebp]
0174  89 7D 00                          mov             dword ptr [ebp],edi
0177  B8 00 00 00 00                    mov             eax,offset __nheapbeg
017C  89 11                             mov             dword ptr [ecx],edx
017E  8C DA                             mov             edx,ds
0180  89 0C 24                          mov             dword ptr [esp],ecx
0183  66 3B 54 24 24                    cmp             dx,word ptr 0x24[esp]
0188  75 1A                             jne             L$18
018A  8B 1D 00 00 00 00                 mov             ebx,dword ptr __nheapbeg
0190  EB 0B                             jmp             L$17
0192                            L$15:
0192  39 F3                             cmp             ebx,esi
0194  77 04                             ja              L$16
0196  39 FE                             cmp             esi,edi
0198  72 0A                             jb              L$18
019A                            L$16:
019A  8B 5B 08                          mov             ebx,dword ptr 0x8[ebx]
019D                            L$17:
019D  8B 7B 08                          mov             edi,dword ptr 0x8[ebx]
01A0  85 FF                             test            edi,edi
01A2  75 EE                             jne             L$15
01A4                            L$18:
01A4  FF 43 18                          inc             dword ptr 0x18[ebx]
01A7  8B 04 24                          mov             eax,dword ptr [esp]
01AA  83 C0 04                          add             eax,0x00000004
01AD  50                                push            eax
01AE  E8 00 00 00 00                    call            _nfree
01B3  83 C4 04                          add             esp,0x00000004
01B6                            L$19:
01B6  31 C0                             xor             eax,eax
01B8                            L$20:
01B8  83 C4 10                          add             esp,0x00000010
01BB  5D                                pop             ebp
01BC  5F                                pop             edi
01BD  5E                                pop             esi
01BE  5B                                pop             ebx
01BF  C3                                ret

Routine Size: 427 bytes,    Routine Base: _TEXT + 0015

01C0                            _nexpand:
01C0  53                                push            ebx
01C1  83 EC 04                          sub             esp,0x00000004
01C4  FF 15 00 00 00 00                 call            dword ptr _AccessNHeap
01CA  89 E0                             mov             eax,esp
01CC  50                                push            eax
01CD  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
01D1  52                                push            edx
01D2  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
01D6  53                                push            ebx
01D7  B8 00 00 00 00                    mov             eax,offset __nheapbeg
01DC  8C DA                             mov             edx,ds
01DE  31 C0                             xor             eax,eax
01E0  66 89 D0                          mov             ax,dx
01E3  50                                push            eax
01E4  E8 00 00 00 00                    call            __HeapManager_expand
01E9  83 C4 10                          add             esp,0x00000010
01EC  85 C0                             test            eax,eax
01EE  75 0D                             jne             L$21
01F0  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
01F6  89 D8                             mov             eax,ebx
01F8  83 C4 04                          add             esp,0x00000004
01FB  5B                                pop             ebx
01FC  C3                                ret
01FD                            L$21:
01FD  FF 15 00 00 00 00                 call            dword ptr _ReleaseNHeap
0203  31 C0                             xor             eax,eax
0205  83 C4 04                          add             esp,0x00000004
0208  5B                                pop             ebx
0209  C3                                ret

Routine Size: 74 bytes,    Routine Base: _TEXT + 01C0

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

