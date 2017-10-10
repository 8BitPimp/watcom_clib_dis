Module: exvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000163 bytes
0000                            execvpe:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 14 01 00                       enter           0x0114,0x00
0007  8B 75 14                          mov             esi,dword ptr 0x14[ebp]
000A  FF 75 1C                          push            dword ptr 0x1c[ebp]
000D  FF 75 18                          push            dword ptr 0x18[ebp]
0010  56                                push            esi
0011  E8 00 00 00 00                    call            execve
0016  83 C4 0C                          add             esp,0x0000000c
0019  89 45 F0                          mov             dword ptr -0x10[ebp],eax
001C  83 F8 FF                          cmp             eax,0xffffffff
001F  0F 85 36 01 00 00                 jne             L$7
0025  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
002B  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
002F  74 10                             je              L$1
0031  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0037  83 78 04 09                       cmp             dword ptr 0x4[eax],0x00000009
003B  0F 85 1A 01 00 00                 jne             L$7
0041                            L$1:
0041  0F B6 06                          movzx           eax,byte ptr [esi]
0044  83 F8 5C                          cmp             eax,0x0000005c
0047  0F 84 0E 01 00 00                 je              L$7
004D  80 3E 00                          cmp             byte ptr [esi],0x00
0050  0F 84 05 01 00 00                 je              L$7
0056  0F B6 46 01                       movzx           eax,byte ptr 0x1[esi]
005A  83 F8 3A                          cmp             eax,0x0000003a
005D  0F 84 F8 00 00 00                 je              L$7
0063  68 00 00 00 00                    push            offset DGROUP:L$8
0068  E8 00 00 00 00                    call            getenv
006D  83 C4 04                          add             esp,0x00000004
0070  89 C3                             mov             ebx,eax
0072  85 C0                             test            eax,eax
0074  0F 84 E1 00 00 00                 je              L$7
007A  56                                push            esi
007B  E8 00 00 00 00                    call            strlen
0080  40                                inc             eax
0081  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0084  B8 04 01 00 00                    mov             eax,0x00000104
0089  2B 45 F8                          sub             eax,dword ptr -0x8[ebp]
008C  83 C4 04                          add             esp,0x00000004
008F  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0092                            L$2:
0092  80 3B 00                          cmp             byte ptr [ebx],0x00
0095  0F 84 C0 00 00 00                 je              L$7
009B  6A 3B                             push            0x0000003b
009D  53                                push            ebx
009E  E8 00 00 00 00                    call            strchr
00A3  83 C4 08                          add             esp,0x00000008
00A6  89 C7                             mov             edi,eax
00A8  85 C0                             test            eax,eax
00AA  75 0C                             jne             L$3
00AC  53                                push            ebx
00AD  E8 00 00 00 00                    call            strlen
00B2  83 C4 04                          add             esp,0x00000004
00B5  8D 3C 03                          lea             edi,[ebx+eax]
00B8                            L$3:
00B8  89 F8                             mov             eax,edi
00BA  29 D8                             sub             eax,ebx
00BC  89 45 FC                          mov             dword ptr -0x4[ebp],eax
00BF  3B 45 F4                          cmp             eax,dword ptr -0xc[ebp]
00C2  76 1E                             jbe             L$4
00C4  6A 02                             push            0x00000002
00C6  E8 00 00 00 00                    call            __set_errno
00CB  83 C4 04                          add             esp,0x00000004
00CE  6A 0A                             push            0x0000000a
00D0  E8 00 00 00 00                    call            __set_doserrno
00D5  B8 FF FF FF FF                    mov             eax,0xffffffff
00DA  83 C4 04                          add             esp,0x00000004
00DD  C9                                leave
00DE  5F                                pop             edi
00DF  5E                                pop             esi
00E0  5B                                pop             ebx
00E1  C3                                ret
00E2                            L$4:
00E2  50                                push            eax
00E3  53                                push            ebx
00E4  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00EA  8D 9D EC FE FF FF                 lea             ebx,-0x114[ebp]
00F0  50                                push            eax
00F1  03 5D FC                          add             ebx,dword ptr -0x4[ebp]
00F4  E8 00 00 00 00                    call            memcpy
00F9  0F B6 43 FF                       movzx           eax,byte ptr -0x1[ebx]
00FD  83 C4 0C                          add             esp,0x0000000c
0100  83 F8 5C                          cmp             eax,0x0000005c
0103  74 04                             je              L$5
0105  C6 03 5C                          mov             byte ptr [ebx],0x5c
0108  43                                inc             ebx
0109                            L$5:
0109  FF 75 F8                          push            dword ptr -0x8[ebp]
010C  56                                push            esi
010D  53                                push            ebx
010E  E8 00 00 00 00                    call            memcpy
0113  83 C4 0C                          add             esp,0x0000000c
0116  FF 75 1C                          push            dword ptr 0x1c[ebp]
0119  FF 75 18                          push            dword ptr 0x18[ebp]
011C  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
0122  50                                push            eax
0123  E8 00 00 00 00                    call            execve
0128  83 C4 0C                          add             esp,0x0000000c
012B  89 45 F0                          mov             dword ptr -0x10[ebp],eax
012E  83 F8 FF                          cmp             eax,0xffffffff
0131  75 28                             jne             L$7
0133  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0139  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
013D  74 0C                             je              L$6
013F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0145  83 78 04 09                       cmp             dword ptr 0x4[eax],0x00000009
0149  75 10                             jne             L$7
014B                            L$6:
014B  0F B6 07                          movzx           eax,byte ptr [edi]
014E  83 F8 3B                          cmp             eax,0x0000003b
0151  75 08                             jne             L$7
0153  8D 5F 01                          lea             ebx,0x1[edi]
0156  E9 37 FF FF FF                    jmp             L$2
015B                            L$7:
015B  8B 45 F0                          mov             eax,dword ptr -0x10[ebp]
015E  C9                                leave
015F  5F                                pop             edi
0160  5E                                pop             esi
0161  5B                                pop             ebx
0162  C3                                ret

Routine Size: 355 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$8:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

