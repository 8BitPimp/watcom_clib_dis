Module: grownear
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000143 bytes
0000                            __LinkUpNewMHeap_:
0000  53                                push            ebx
0001  52                                push            edx
0002  89 C2                             mov             edx,eax
0004  A1 00 00 00 00                    mov             eax,dword ptr ___nheapbeg
0009  31 DB                             xor             ebx,ebx
000B  EB 09                             jmp             L$2
000D                            L$1:
000D  39 C2                             cmp             edx,eax
000F  72 09                             jb              L$3
0011  89 C3                             mov             ebx,eax
0013  8B 40 08                          mov             eax,dword ptr 0x8[eax]
0016                            L$2:
0016  85 C0                             test            eax,eax
0018  75 F3                             jne             L$1
001A                            L$3:
001A  89 5A 04                          mov             dword ptr 0x4[edx],ebx
001D  89 42 08                          mov             dword ptr 0x8[edx],eax
0020  85 DB                             test            ebx,ebx
0022  74 05                             je              L$4
0024  89 53 08                          mov             dword ptr 0x8[ebx],edx
0027  EB 06                             jmp             L$5
0029                            L$4:
0029  89 15 00 00 00 00                 mov             dword ptr ___nheapbeg,edx
002F                            L$5:
002F  85 C0                             test            eax,eax
0031  74 03                             je              L$6
0033  89 50 04                          mov             dword ptr 0x4[eax],edx
0036                            L$6:
0036  8D 5A 20                          lea             ebx,0x20[edx]
0039  8B 02                             mov             eax,dword ptr [edx]
003B  83 C2 2C                          add             edx,0x0000002c
003E  C7 42 F4 00 00 00 00              mov             dword ptr -0xc[edx],0x00000000
0045  C7 42 E4 00 00 00 00              mov             dword ptr -0x1c[edx],0x00000000
004C  C7 42 EC 00 00 00 00              mov             dword ptr -0x14[edx],0x00000000
0053  C7 42 F0 00 00 00 00              mov             dword ptr -0x10[edx],0x00000000
005A  89 5A F8                          mov             dword ptr -0x8[edx],ebx
005D  89 5A FC                          mov             dword ptr -0x4[edx],ebx
0060  83 E8 2C                          sub             eax,0x0000002c
0063  89 5A E0                          mov             dword ptr -0x20[edx],ebx
0066  89 02                             mov             dword ptr [edx],eax
0068  C7 04 02 FF FF FF FF              mov             dword ptr [edx+eax],0xffffffff
006F  89 D0                             mov             eax,edx
0071  5A                                pop             edx
0072  5B                                pop             ebx
0073  C3                                ret

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

0074                            __ExpandDGROUP_:
0074                            __CreateNewNHeap_:
0074  53                                push            ebx
0075  51                                push            ecx
0076  52                                push            edx
0077  56                                push            esi
0078  57                                push            edi
0079  50                                push            eax
007A  83 3D 00 00 00 00 00              cmp             dword ptr ___heap_enabled,0x00000000
0081  75 04                             jne             L$8
0083                            L$7:
0083  31 C0                             xor             eax,eax
0085  EB 69                             jmp             L$9
0087                            L$8:
0087  83 3D 00 00 00 00 FE              cmp             dword ptr __curbrk,0xfffffffe
008E  74 F3                             je              L$7
0090  89 E0                             mov             eax,esp
0092  E8 00 00 00 00                    call            __AdjustAmount_
0097  85 C0                             test            eax,eax
0099  74 55                             je              L$9
009B  8B 0C 24                          mov             ecx,dword ptr [esp]
009E  51                                push            ecx
009F  6A 00                             push            0x00000000
00A1  E8 00 00 00 00                    call            _LocalAlloc
00A6  89 C2                             mov             edx,eax
00A8  85 C0                             test            eax,eax
00AA  74 44                             je              L$9
00AC  8B 04 24                          mov             eax,dword ptr [esp]
00AF  8B 34 24                          mov             esi,dword ptr [esp]
00B2  83 E8 04                          sub             eax,0x00000004
00B5  39 F0                             cmp             eax,esi
00B7  77 CA                             ja              L$7
00B9  89 04 24                          mov             dword ptr [esp],eax
00BC  83 F8 38                          cmp             eax,0x00000038
00BF  72 C2                             jb              L$7
00C1  89 02                             mov             dword ptr [edx],eax
00C3  89 D0                             mov             eax,edx
00C5  E8 00 00 00 00                    call            __LinkUpNewMHeap_
00CA  89 C3                             mov             ebx,eax
00CC  8B 00                             mov             eax,dword ptr [eax]
00CE  89 04 24                          mov             dword ptr [esp],eax
00D1  0C 01                             or              al,0x01
00D3  89 03                             mov             dword ptr [ebx],eax
00D5  8B 7A 18                          mov             edi,dword ptr 0x18[edx]
00D8  C7 42 14 FF FF FF FF              mov             dword ptr 0x14[edx],0xffffffff
00DF  47                                inc             edi
00E0  8D 43 04                          lea             eax,0x4[ebx]
00E3  89 7A 18                          mov             dword ptr 0x18[edx],edi
00E6  E8 00 00 00 00                    call            _nfree_
00EB  B8 01 00 00 00                    mov             eax,0x00000001
00F0                            L$9:
00F0  83 C4 04                          add             esp,0x00000004
00F3  5F                                pop             edi
00F4  5E                                pop             esi
00F5  5A                                pop             edx
00F6  59                                pop             ecx
00F7  5B                                pop             ebx
00F8  C3                                ret
00F9                            __AdjustAmount_:
00F9  51                                push            ecx
00FA  52                                push            edx
00FB  89 C2                             mov             edx,eax
00FD  8B 00                             mov             eax,dword ptr [eax]
00FF  83 C0 03                          add             eax,0x00000003
0102  24 FC                             and             al,0xfc
0104  85 C0                             test            eax,eax
0106  74 38                             je              L$13
0108  89 02                             mov             dword ptr [edx],eax
010A  83 C0 3C                          add             eax,0x0000003c
010D  3B 02                             cmp             eax,dword ptr [edx]
010F  73 05                             jae             L$11
0111                            L$10:
0111  31 C0                             xor             eax,eax
0113  5A                                pop             edx
0114  59                                pop             ecx
0115  C3                                ret
0116                            L$11:
0116  8B 0D 00 00 00 00                 mov             ecx,dword ptr __amblksiz
011C  39 C8                             cmp             eax,ecx
011E  73 04                             jae             L$12
0120  89 C8                             mov             eax,ecx
0122  24 FE                             and             al,0xfe
0124                            L$12:
0124  89 02                             mov             dword ptr [edx],eax
0126  05 FF 0F 00 00                    add             eax,0x00000fff
012B  3B 02                             cmp             eax,dword ptr [edx]
012D  72 E2                             jb              L$10
012F  80 E4 F0                          and             ah,0xf0
0132  30 C0                             xor             al,al
0134  89 02                             mov             dword ptr [edx],eax
0136  85 C0                             test            eax,eax
0138  0F 95 C0                          setne           al
013B  25 FF 00 00 00                    and             eax,0x000000ff
0140                            L$13:
0140  5A                                pop             edx
0141  59                                pop             ecx
0142  C3                                ret

Routine Size: 207 bytes,    Routine Base: _TEXT + 0074

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

