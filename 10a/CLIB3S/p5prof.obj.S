Module: p5prof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 000000CB bytes
0000                            fini:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  81 EC 08 03 00 00                 sub             esp,0x00000308
000A  6A 00                             push            0x00000000
000C  8D 84 24 08 02 00 00              lea             eax,0x208[esp]
0013  50                                push            eax
0014  8D 84 24 0C 01 00 00              lea             eax,0x10c[esp]
001B  50                                push            eax
001C  8D 84 24 10 03 00 00              lea             eax,0x310[esp]
0023  50                                push            eax
0024  A1 00 00 00 00                    mov             eax,dword ptr ___Argv
0029  8B 10                             mov             edx,dword ptr [eax]
002B  52                                push            edx
002C  E8 00 00 00 00                    call            _splitpath
0031  83 C4 14                          add             esp,0x00000014
0034  68 00 00 00 00                    push            offset DGROUP:L$4
0039  8D 84 24 08 02 00 00              lea             eax,0x208[esp]
0040  50                                push            eax
0041  8D 84 24 0C 01 00 00              lea             eax,0x10c[esp]
0048  50                                push            eax
0049  8D 84 24 10 03 00 00              lea             eax,0x310[esp]
0050  50                                push            eax
0051  8D 44 24 10                       lea             eax,0x10[esp]
0055  50                                push            eax
0056  E8 00 00 00 00                    call            _makepath
005B  83 C4 14                          add             esp,0x00000014
005E  68 05 00 00 00                    push            offset DGROUP:L$5
0063  8D 44 24 04                       lea             eax,0x4[esp]
0067  50                                push            eax
0068  BB 00 00 00 00                    mov             ebx,offset _start_TI
006D  E8 00 00 00 00                    call            fopen
0072  83 C4 08                          add             esp,0x00000008
0075  89 C6                             mov             esi,eax
0077  85 C0                             test            eax,eax
0079  74 45                             je              L$3
007B                            L$1:
007B  81 FB 00 00 00 00                 cmp             ebx,offset _end_TI
0081  73 34                             jae             L$2
0083  8B 4B 08                          mov             ecx,dword ptr 0x8[ebx]
0086  51                                push            ecx
0087  8B 7B 0C                          mov             edi,dword ptr 0xc[ebx]
008A  57                                push            edi
008B  8B 2B                             mov             ebp,dword ptr [ebx]
008D  55                                push            ebp
008E  8D 7B 10                          lea             edi,0x10[ebx]
0091  57                                push            edi
0092  68 09 00 00 00                    push            offset DGROUP:L$6
0097  56                                push            esi
0098  E8 00 00 00 00                    call            fprintf
009D  83 C4 18                          add             esp,0x00000018
00A0  06                                push            es
00A1  8C D8                             mov             eax,ds
00A3  8E C0                             mov             es,eax
00A5  29 C9                             sub             ecx,ecx
00A7  49                                dec             ecx
00A8  31 C0                             xor             eax,eax
00AA  F2 AE                             repne scasb
00AC  F7 D1                             not             ecx
00AE  49                                dec             ecx
00AF  07                                pop             es
00B0  83 C1 11                          add             ecx,0x00000011
00B3  01 CB                             add             ebx,ecx
00B5  EB C4                             jmp             L$1
00B7                            L$2:
00B7  56                                push            esi
00B8  E8 00 00 00 00                    call            fclose
00BD  83 C4 04                          add             esp,0x00000004
00C0                            L$3:
00C0  81 C4 08 03 00 00                 add             esp,0x00000308
00C6  5D                                pop             ebp
00C7  5F                                pop             edi
00C8  5E                                pop             esi
00C9  5B                                pop             ebx
00CA  C3                                ret

Routine Size: 203 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000020 bytes
0000                            L$4:
0000  2E 70 72 66 00                                  .prf.
0005                            L$5:
0005  77 74 2B 00                                     wt+.
0009                            L$6:
0009  25 32 30 2E 32 30 73 09 25 30 38 78 09 25 30 38 %20.20s.%08x.%08
0019  78 25 30 38 78 0A 00                            x%08x..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000                            __p5_profile:
0000  00 20                                           .
0002  00 00 00 00                                     DD        offset fini

Segment: YIE BYTE USE32 00000000 bytes

