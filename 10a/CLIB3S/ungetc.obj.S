Module: ungetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D5 bytes
0000                            ungetc:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0008  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
000C  83 FA FF                          cmp             edx,0xffffffff
000F  75 07                             jne             L$1
0011  89 D0                             mov             eax,edx
0013  5D                                pop             ebp
0014  5F                                pop             edi
0015  5E                                pop             esi
0016  5B                                pop             ebx
0017  C3                                ret
0018                            L$1:
0018  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
001B  51                                push            ecx
001C  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0022  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
0025  83 C4 04                          add             esp,0x00000004
0028  F6 C4 10                          test            ah,0x10
002B  74 17                             je              L$3
002D  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0030  52                                push            edx
0031                            L$2:
0031  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0037  B8 FF FF FF FF                    mov             eax,0xffffffff
003C  83 C4 04                          add             esp,0x00000004
003F  5D                                pop             ebp
0040  5F                                pop             edi
0041  5E                                pop             esi
0042  5B                                pop             ebx
0043  C3                                ret
0044                            L$3:
0044  F6 43 0C 01                       test            byte ptr 0xc[ebx],0x01
0048  75 06                             jne             L$5
004A                            L$4:
004A  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
004D  50                                push            eax
004E  EB E1                             jmp             L$2
0050                            L$5:
0050  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
0054  75 09                             jne             L$6
0056  53                                push            ebx
0057  E8 00 00 00 00                    call            __ioalloc
005C  83 C4 04                          add             esp,0x00000004
005F                            L$6:
005F  8B 7B 04                          mov             edi,dword ptr 0x4[ebx]
0062  85 FF                             test            edi,edi
0064  75 21                             jne             L$7
0066  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
0069  03 43 14                          add             eax,dword ptr 0x14[ebx]
006C  C7 43 04 01 00 00 00              mov             dword ptr 0x4[ebx],0x00000001
0073  48                                dec             eax
0074  8A 4B 0C                          mov             cl,byte ptr 0xc[ebx]
0077  89 03                             mov             dword ptr [ebx],eax
0079  80 C9 04                          or              cl,0x04
007C  8B 03                             mov             eax,dword ptr [ebx]
007E  8A 54 24 14                       mov             dl,byte ptr 0x14[esp]
0082  88 4B 0C                          mov             byte ptr 0xc[ebx],cl
0085  EB 2B                             jmp             L$9
0087                            L$7:
0087  8B 03                             mov             eax,dword ptr [ebx]
0089  3B 43 08                          cmp             eax,dword ptr 0x8[ebx]
008C  74 BC                             je              L$4
008E  8B 0B                             mov             ecx,dword ptr [ebx]
0090  8D 57 01                          lea             edx,0x1[edi]
0093  49                                dec             ecx
0094  89 53 04                          mov             dword ptr 0x4[ebx],edx
0097  89 0B                             mov             dword ptr [ebx],ecx
0099  8A 01                             mov             al,byte ptr [ecx]
009B  8B 74 24 14                       mov             esi,dword ptr 0x14[esp]
009F  25 FF 00 00 00                    and             eax,0x000000ff
00A4  39 F0                             cmp             eax,esi
00A6  74 04                             je              L$8
00A8  80 4B 0C 04                       or              byte ptr 0xc[ebx],0x04
00AC                            L$8:
00AC  8B 03                             mov             eax,dword ptr [ebx]
00AE  8A 54 24 14                       mov             dl,byte ptr 0x14[esp]
00B2                            L$9:
00B2  88 10                             mov             byte ptr [eax],dl
00B4  8A 6B 0C                          mov             ch,byte ptr 0xc[ebx]
00B7  8B 6B 10                          mov             ebp,dword ptr 0x10[ebx]
00BA  80 E5 EF                          and             ch,0xef
00BD  55                                push            ebp
00BE  88 6B 0C                          mov             byte ptr 0xc[ebx],ch
00C1  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00C7  83 C4 04                          add             esp,0x00000004
00CA  31 C0                             xor             eax,eax
00CC  8A 44 24 14                       mov             al,byte ptr 0x14[esp]
00D0  5D                                pop             ebp
00D1  5F                                pop             edi
00D2  5E                                pop             esi
00D3  5B                                pop             ebx
00D4  C3                                ret

Routine Size: 213 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

