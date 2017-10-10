Module: spvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000173 bytes
0000                            spawnvpe:
0000  68 38 01 00 00                    push            0x00000138
0005  E8 00 00 00 00                    call            __CHK
000A  53                                push            ebx
000B  56                                push            esi
000C  57                                push            edi
000D  C8 14 01 00                       enter           0x0114,0x00
0011  8B 75 18                          mov             esi,dword ptr 0x18[ebp]
0014  FF 75 20                          push            dword ptr 0x20[ebp]
0017  FF 75 1C                          push            dword ptr 0x1c[ebp]
001A  56                                push            esi
001B  FF 75 14                          push            dword ptr 0x14[ebp]
001E  E8 00 00 00 00                    call            spawnve
0023  83 C4 10                          add             esp,0x00000010
0026  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0029  83 F8 FF                          cmp             eax,0xffffffff
002C  0F 85 39 01 00 00                 jne             L$7
0032  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0038  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
003C  74 10                             je              L$1
003E  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0044  83 78 04 09                       cmp             dword ptr 0x4[eax],0x00000009
0048  0F 85 1D 01 00 00                 jne             L$7
004E                            L$1:
004E  0F B6 06                          movzx           eax,byte ptr [esi]
0051  83 F8 5C                          cmp             eax,0x0000005c
0054  0F 84 11 01 00 00                 je              L$7
005A  80 3E 00                          cmp             byte ptr [esi],0x00
005D  0F 84 08 01 00 00                 je              L$7
0063  0F B6 46 01                       movzx           eax,byte ptr 0x1[esi]
0067  83 F8 3A                          cmp             eax,0x0000003a
006A  0F 84 FB 00 00 00                 je              L$7
0070  68 00 00 00 00                    push            offset DGROUP:L$8
0075  E8 00 00 00 00                    call            getenv
007A  83 C4 04                          add             esp,0x00000004
007D  89 C3                             mov             ebx,eax
007F  85 C0                             test            eax,eax
0081  0F 84 E4 00 00 00                 je              L$7
0087  56                                push            esi
0088  E8 00 00 00 00                    call            strlen
008D  40                                inc             eax
008E  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0091  B8 04 01 00 00                    mov             eax,0x00000104
0096  2B 45 F4                          sub             eax,dword ptr -0xc[ebp]
0099  83 C4 04                          add             esp,0x00000004
009C  89 45 F0                          mov             dword ptr -0x10[ebp],eax
009F                            L$2:
009F  80 3B 00                          cmp             byte ptr [ebx],0x00
00A2  0F 84 C3 00 00 00                 je              L$7
00A8  6A 3B                             push            0x0000003b
00AA  53                                push            ebx
00AB  E8 00 00 00 00                    call            strchr
00B0  83 C4 08                          add             esp,0x00000008
00B3  89 C7                             mov             edi,eax
00B5  85 C0                             test            eax,eax
00B7  75 0C                             jne             L$3
00B9  53                                push            ebx
00BA  E8 00 00 00 00                    call            strlen
00BF  83 C4 04                          add             esp,0x00000004
00C2  8D 3C 03                          lea             edi,[ebx+eax]
00C5                            L$3:
00C5  89 F8                             mov             eax,edi
00C7  29 D8                             sub             eax,ebx
00C9  89 45 F8                          mov             dword ptr -0x8[ebp],eax
00CC  3B 45 F0                          cmp             eax,dword ptr -0x10[ebp]
00CF  76 1E                             jbe             L$4
00D1  6A 02                             push            0x00000002
00D3  E8 00 00 00 00                    call            __set_errno
00D8  83 C4 04                          add             esp,0x00000004
00DB  6A 0A                             push            0x0000000a
00DD  E8 00 00 00 00                    call            __set_doserrno
00E2  B8 FF FF FF FF                    mov             eax,0xffffffff
00E7  83 C4 04                          add             esp,0x00000004
00EA  C9                                leave
00EB  5F                                pop             edi
00EC  5E                                pop             esi
00ED  5B                                pop             ebx
00EE  C3                                ret
00EF                            L$4:
00EF  50                                push            eax
00F0  53                                push            ebx
00F1  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00F7  50                                push            eax
00F8  E8 00 00 00 00                    call            memcpy
00FD  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
0103  03 45 F8                          add             eax,dword ptr -0x8[ebp]
0106  0F B6 58 FF                       movzx           ebx,byte ptr -0x1[eax]
010A  83 C4 0C                          add             esp,0x0000000c
010D  83 FB 5C                          cmp             ebx,0x0000005c
0110  74 04                             je              L$5
0112  C6 00 5C                          mov             byte ptr [eax],0x5c
0115  40                                inc             eax
0116                            L$5:
0116  FF 75 F4                          push            dword ptr -0xc[ebp]
0119  56                                push            esi
011A  50                                push            eax
011B  E8 00 00 00 00                    call            memcpy
0120  83 C4 0C                          add             esp,0x0000000c
0123  FF 75 20                          push            dword ptr 0x20[ebp]
0126  FF 75 1C                          push            dword ptr 0x1c[ebp]
0129  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
012F  50                                push            eax
0130  FF 75 14                          push            dword ptr 0x14[ebp]
0133  E8 00 00 00 00                    call            spawnve
0138  83 C4 10                          add             esp,0x00000010
013B  89 45 FC                          mov             dword ptr -0x4[ebp],eax
013E  83 F8 FF                          cmp             eax,0xffffffff
0141  75 28                             jne             L$7
0143  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0149  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
014D  74 0C                             je              L$6
014F  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0155  83 78 04 09                       cmp             dword ptr 0x4[eax],0x00000009
0159  75 10                             jne             L$7
015B                            L$6:
015B  0F B6 07                          movzx           eax,byte ptr [edi]
015E  83 F8 3B                          cmp             eax,0x0000003b
0161  75 08                             jne             L$7
0163  8D 5F 01                          lea             ebx,0x1[edi]
0166  E9 34 FF FF FF                    jmp             L$2
016B                            L$7:
016B  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
016E  C9                                leave
016F  5F                                pop             edi
0170  5E                                pop             esi
0171  5B                                pop             ebx
0172  C3                                ret

Routine Size: 371 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$8:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

