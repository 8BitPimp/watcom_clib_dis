Module: exvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000144 bytes
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
0016  89 C7                             mov             edi,eax
0018  83 C4 0C                          add             esp,0x0000000c
001B  89 45 FC                          mov             dword ptr -0x4[ebp],eax
001E  83 F8 FF                          cmp             eax,0xffffffff
0021  0F 85 15 01 00 00                 jne             L$6
0027  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
002D  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
0031  0F 85 05 01 00 00                 jne             L$6
0037  80 3E 5C                          cmp             byte ptr [esi],0x5c
003A  0F 84 FC 00 00 00                 je              L$6
0040  80 3E 00                          cmp             byte ptr [esi],0x00
0043  0F 84 F3 00 00 00                 je              L$6
0049  80 7E 01 3A                       cmp             byte ptr 0x1[esi],0x3a
004D  0F 84 E9 00 00 00                 je              L$6
0053  68 00 00 00 00                    push            offset DGROUP:L$7
0058  E8 00 00 00 00                    call            getenv
005D  83 C4 04                          add             esp,0x00000004
0060  89 C3                             mov             ebx,eax
0062  85 C0                             test            eax,eax
0064  75 07                             jne             L$1
0066  89 F8                             mov             eax,edi
0068  C9                                leave
0069  5F                                pop             edi
006A  5E                                pop             esi
006B  5B                                pop             ebx
006C  C3                                ret
006D                            L$1:
006D  56                                push            esi
006E  E8 00 00 00 00                    call            strlen
0073  40                                inc             eax
0074  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0077  B8 04 01 00 00                    mov             eax,0x00000104
007C  2B 45 F4                          sub             eax,dword ptr -0xc[ebp]
007F  83 C4 04                          add             esp,0x00000004
0082  89 45 F0                          mov             dword ptr -0x10[ebp],eax
0085                            L$2:
0085  80 3B 00                          cmp             byte ptr [ebx],0x00
0088  0F 84 AE 00 00 00                 je              L$6
008E  6A 3B                             push            0x0000003b
0090  53                                push            ebx
0091  E8 00 00 00 00                    call            strchr
0096  83 C4 08                          add             esp,0x00000008
0099  89 C7                             mov             edi,eax
009B  85 C0                             test            eax,eax
009D  75 0C                             jne             L$3
009F  53                                push            ebx
00A0  E8 00 00 00 00                    call            strlen
00A5  83 C4 04                          add             esp,0x00000004
00A8  8D 3C 03                          lea             edi,[ebx+eax]
00AB                            L$3:
00AB  89 F8                             mov             eax,edi
00AD  29 D8                             sub             eax,ebx
00AF  89 45 F8                          mov             dword ptr -0x8[ebp],eax
00B2  3B 45 F0                          cmp             eax,dword ptr -0x10[ebp]
00B5  76 1E                             jbe             L$4
00B7  6A 02                             push            0x00000002
00B9  E8 00 00 00 00                    call            __set_errno
00BE  83 C4 04                          add             esp,0x00000004
00C1  6A 0A                             push            0x0000000a
00C3  E8 00 00 00 00                    call            __set_doserrno
00C8  B8 FF FF FF FF                    mov             eax,0xffffffff
00CD  83 C4 04                          add             esp,0x00000004
00D0  C9                                leave
00D1  5F                                pop             edi
00D2  5E                                pop             esi
00D3  5B                                pop             ebx
00D4  C3                                ret
00D5                            L$4:
00D5  50                                push            eax
00D6  53                                push            ebx
00D7  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00DD  50                                push            eax
00DE  E8 00 00 00 00                    call            memcpy
00E3  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00E9  03 45 F8                          add             eax,dword ptr -0x8[ebp]
00EC  83 C4 0C                          add             esp,0x0000000c
00EF  80 78 FF 5C                       cmp             byte ptr -0x1[eax],0x5c
00F3  74 04                             je              L$5
00F5  C6 00 5C                          mov             byte ptr [eax],0x5c
00F8  40                                inc             eax
00F9                            L$5:
00F9  FF 75 F4                          push            dword ptr -0xc[ebp]
00FC  56                                push            esi
00FD  50                                push            eax
00FE  E8 00 00 00 00                    call            memcpy
0103  83 C4 0C                          add             esp,0x0000000c
0106  FF 75 1C                          push            dword ptr 0x1c[ebp]
0109  FF 75 18                          push            dword ptr 0x18[ebp]
010C  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
0112  50                                push            eax
0113  E8 00 00 00 00                    call            execve
0118  83 C4 0C                          add             esp,0x0000000c
011B  89 45 FC                          mov             dword ptr -0x4[ebp],eax
011E  83 F8 FF                          cmp             eax,0xffffffff
0121  75 19                             jne             L$6
0123  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0129  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
012D  75 0D                             jne             L$6
012F  80 3F 3B                          cmp             byte ptr [edi],0x3b
0132  75 08                             jne             L$6
0134  8D 5F 01                          lea             ebx,0x1[edi]
0137  E9 49 FF FF FF                    jmp             L$2
013C                            L$6:
013C  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
013F  C9                                leave
0140  5F                                pop             edi
0141  5E                                pop             esi
0142  5B                                pop             ebx
0143  C3                                ret

Routine Size: 324 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$7:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

