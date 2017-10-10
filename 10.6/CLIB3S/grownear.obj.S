Module: grownear
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000165 bytes
0000                            __LinkUpNewMHeap:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  A1 00 00 00 00                    mov             eax,dword ptr __nheapbeg
000A  31 DB                             xor             ebx,ebx
000C  EB 09                             jmp             L$2
000E                            L$1:
000E  39 C2                             cmp             edx,eax
0010  72 09                             jb              L$3
0012  89 C3                             mov             ebx,eax
0014  8B 40 08                          mov             eax,dword ptr 0x8[eax]
0017                            L$2:
0017  85 C0                             test            eax,eax
0019  75 F3                             jne             L$1
001B                            L$3:
001B  89 5A 04                          mov             dword ptr 0x4[edx],ebx
001E  89 42 08                          mov             dword ptr 0x8[edx],eax
0021  85 DB                             test            ebx,ebx
0023  74 05                             je              L$4
0025  89 53 08                          mov             dword ptr 0x8[ebx],edx
0028  EB 06                             jmp             L$5
002A                            L$4:
002A  89 15 00 00 00 00                 mov             dword ptr __nheapbeg,edx
0030                            L$5:
0030  85 C0                             test            eax,eax
0032  74 03                             je              L$6
0034  89 50 04                          mov             dword ptr 0x4[eax],edx
0037                            L$6:
0037  8D 5A 20                          lea             ebx,0x20[edx]
003A  8B 02                             mov             eax,dword ptr [edx]
003C  83 C2 2C                          add             edx,0x0000002c
003F  C7 42 F4 00 00 00 00              mov             dword ptr -0xc[edx],0x00000000
0046  C7 42 E4 00 00 00 00              mov             dword ptr -0x1c[edx],0x00000000
004D  C7 42 EC 00 00 00 00              mov             dword ptr -0x14[edx],0x00000000
0054  C7 42 F0 00 00 00 00              mov             dword ptr -0x10[edx],0x00000000
005B  89 5A F8                          mov             dword ptr -0x8[edx],ebx
005E  89 5A FC                          mov             dword ptr -0x4[edx],ebx
0061  83 E8 2C                          sub             eax,0x0000002c
0064  89 5A E0                          mov             dword ptr -0x20[edx],ebx
0067  89 02                             mov             dword ptr [edx],eax
0069  C7 04 02 FF FF FF FF              mov             dword ptr [edx+eax],0xffffffff
0070  89 D0                             mov             eax,edx
0072  5B                                pop             ebx
0073  C3                                ret
0074                            __CreateNewNHeap:
0074  53                                push            ebx
0075  56                                push            esi
0076  57                                push            edi
0077  83 3D 00 00 00 00 00              cmp             dword ptr __heap_enabled,0x00000000
007E  75 06                             jne             L$8
0080                            L$7:
0080  31 C0                             xor             eax,eax
0082  5F                                pop             edi
0083  5E                                pop             esi
0084  5B                                pop             ebx
0085  C3                                ret
0086                            L$8:
0086  83 3D 00 00 00 00 FE              cmp             dword ptr _curbrk,0xfffffffe
008D  74 F1                             je              L$7
008F  8D 44 24 10                       lea             eax,0x10[esp]
0093  50                                push            eax
0094  E8 00 00 00 00                    call            __AdjustAmount
0099  83 C4 04                          add             esp,0x00000004
009C  85 C0                             test            eax,eax
009E  74 67                             je              L$9
00A0  6A 40                             push            0x00000040
00A2  68 00 10 00 00                    push            0x00001000
00A7  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
00AB  51                                push            ecx
00AC  6A 00                             push            0x00000000
00AE  E8 00 00 00 00                    call            _VirtualAlloc
00B3  89 C3                             mov             ebx,eax
00B5  85 C0                             test            eax,eax
00B7  74 4E                             je              L$9
00B9  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
00BD  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
00C1  83 E8 04                          sub             eax,0x00000004
00C4  39 F0                             cmp             eax,esi
00C6  77 B8                             ja              L$7
00C8  89 44 24 10                       mov             dword ptr 0x10[esp],eax
00CC  83 F8 38                          cmp             eax,0x00000038
00CF  72 AF                             jb              L$7
00D1  53                                push            ebx
00D2  89 03                             mov             dword ptr [ebx],eax
00D4  E8 00 00 00 00                    call            __LinkUpNewMHeap
00D9  89 C2                             mov             edx,eax
00DB  83 C4 04                          add             esp,0x00000004
00DE  8B 00                             mov             eax,dword ptr [eax]
00E0  89 44 24 10                       mov             dword ptr 0x10[esp],eax
00E4  0C 01                             or              al,0x01
00E6  89 02                             mov             dword ptr [edx],eax
00E8  83 C2 04                          add             edx,0x00000004
00EB  8B 7B 18                          mov             edi,dword ptr 0x18[ebx]
00EE  C7 43 14 FF FF FF FF              mov             dword ptr 0x14[ebx],0xffffffff
00F5  47                                inc             edi
00F6  52                                push            edx
00F7  89 7B 18                          mov             dword ptr 0x18[ebx],edi
00FA  E8 00 00 00 00                    call            _nfree
00FF  B8 01 00 00 00                    mov             eax,0x00000001
0104  83 C4 04                          add             esp,0x00000004
0107                            L$9:
0107  5F                                pop             edi
0108  5E                                pop             esi
0109  5B                                pop             ebx
010A  C3                                ret

Routine Size: 267 bytes,    Routine Base: _TEXT + 0000

010B                            __ExpandDGROUP:
010B  E8 00 00 00 00                    call            _nheapshrink
0110  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0114  52                                push            edx
0115  E8 00 00 00 00                    call            __CreateNewNHeap
011A  83 C4 04                          add             esp,0x00000004
011D  C3                                ret
011E                            __AdjustAmount:
011E  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0122  8B 02                             mov             eax,dword ptr [edx]
0124  83 C0 0B                          add             eax,0x0000000b
0127  24 F8                             and             al,0xf8
0129  85 C0                             test            eax,eax
012B  75 01                             jne             L$10
012D  C3                                ret
012E                            L$10:
012E  89 02                             mov             dword ptr [edx],eax
0130  83 C0 3C                          add             eax,0x0000003c
0133  3B 02                             cmp             eax,dword ptr [edx]
0135  73 03                             jae             L$12
0137                            L$11:
0137  31 C0                             xor             eax,eax
0139  C3                                ret
013A                            L$12:
013A  8B 0D 00 00 00 00                 mov             ecx,dword ptr _amblksiz
0140  39 C8                             cmp             eax,ecx
0142  73 04                             jae             L$13
0144  89 C8                             mov             eax,ecx
0146  24 FE                             and             al,0xfe
0148                            L$13:
0148  89 02                             mov             dword ptr [edx],eax
014A  05 FF 0F 00 00                    add             eax,0x00000fff
014F  3B 02                             cmp             eax,dword ptr [edx]
0151  72 E4                             jb              L$11
0153  30 C0                             xor             al,al
0155  80 E4 F0                          and             ah,0xf0
0158  89 02                             mov             dword ptr [edx],eax
015A  85 C0                             test            eax,eax
015C  0F 95 C0                          setne           al
015F  25 FF 00 00 00                    and             eax,0x000000ff
0164  C3                                ret

Routine Size: 90 bytes,    Routine Base: _TEXT + 010B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

