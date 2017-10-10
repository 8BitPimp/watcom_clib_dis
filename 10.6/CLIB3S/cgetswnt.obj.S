Module: cgetswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000150 bytes
0000                            cgets:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 1C                          sub             esp,0x0000001c
0007  8B 7C 24 30                       mov             edi,dword ptr 0x30[esp]
000B  8B 15 00 00 00 00                 mov             edx,dword ptr _WindowsStdin
0011  83 C7 02                          add             edi,0x00000002
0014  85 D2                             test            edx,edx
0016  74 47                             je              L$3
0018  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
001C  31 C0                             xor             eax,eax
001E  8A 03                             mov             al,byte ptr [ebx]
0020  48                                dec             eax
0021  50                                push            eax
0022  57                                push            edi
0023  6A 00                             push            0x00000000
0025  E8 00 00 00 00                    call            __qread
002A  83 C4 0C                          add             esp,0x0000000c
002D  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0031  89 FB                             mov             ebx,edi
0033  8A 00                             mov             al,byte ptr [eax]
0035                            L$1:
0035  0F B6 F0                          movzx           esi,al
0038  83 FE 01                          cmp             esi,0x00000001
003B  7E 12                             jle             L$2
003D  0F B6 33                          movzx           esi,byte ptr [ebx]
0040  83 FE 0D                          cmp             esi,0x0000000d
0043  74 0A                             je              L$2
0045  80 3B 00                          cmp             byte ptr [ebx],0x00
0048  74 05                             je              L$2
004A  43                                inc             ebx
004B  FE C8                             dec             al
004D  EB E6                             jmp             L$1
004F                            L$2:
004F  8A 54 24 30                       mov             dl,byte ptr 0x30[esp]
0053  88 D8                             mov             al,bl
0055  C6 03 00                          mov             byte ptr [ebx],0x00
0058  28 D0                             sub             al,dl
005A  E9 DD 00 00 00                    jmp             L$10
005F                            L$3:
005F  52                                push            edx
0060  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0066  83 C4 04                          add             esp,0x00000004
0069  E8 00 00 00 00                    call            __NTConsoleInput
006E  89 C6                             mov             esi,eax
0070  8B 44 24 30                       mov             eax,dword ptr 0x30[esp]
0074  8A 00                             mov             al,byte ptr [eax]
0076  89 FB                             mov             ebx,edi
0078  88 44 24 18                       mov             byte ptr 0x18[esp],al
007C  BD 08 00 00 00                    mov             ebp,0x00000008
0081                            L$4:
0081  8D 44 24 14                       lea             eax,0x14[esp]
0085  50                                push            eax
0086  6A 01                             push            0x00000001
0088  8D 44 24 08                       lea             eax,0x8[esp]
008C  50                                push            eax
008D  56                                push            esi
008E  E8 00 00 00 00                    call            _ReadConsoleInputA
0093  89 E0                             mov             eax,esp
0095  50                                push            eax
0096  E8 00 00 00 00                    call            __NTRealKey
009B  83 C4 04                          add             esp,0x00000004
009E  85 C0                             test            eax,eax
00A0  74 DF                             je              L$4
00A2  31 C0                             xor             eax,eax
00A4  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
00A8  83 F8 0D                          cmp             eax,0x0000000d
00AB  0F 84 77 00 00 00                 je              L$9
00B1  EB 68                             jmp             L$8
00B3                            L$5:
00B3  31 C0                             xor             eax,eax
00B5  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
00B9  83 F8 08                          cmp             eax,0x00000008
00BC  75 2D                             jne             L$6
00BE  39 FB                             cmp             ebx,edi
00C0  76 54                             jbe             L$7
00C2  55                                push            ebp
00C3  E8 00 00 00 00                    call            putch
00C8  83 C4 04                          add             esp,0x00000004
00CB  6A 20                             push            0x00000020
00CD  E8 00 00 00 00                    call            putch
00D2  83 C4 04                          add             esp,0x00000004
00D5  55                                push            ebp
00D6  E8 00 00 00 00                    call            putch
00DB  83 C4 04                          add             esp,0x00000004
00DE  8A 6C 24 18                       mov             ch,byte ptr 0x18[esp]
00E2  FE C5                             inc             ch
00E4  4B                                dec             ebx
00E5  88 6C 24 18                       mov             byte ptr 0x18[esp],ch
00E9  EB 2B                             jmp             L$7
00EB                            L$6:
00EB  31 C0                             xor             eax,eax
00ED  8A 44 24 18                       mov             al,byte ptr 0x18[esp]
00F1  83 F8 01                          cmp             eax,0x00000001
00F4  7E 20                             jle             L$7
00F6  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
00FA  88 03                             mov             byte ptr [ebx],al
00FC  31 C0                             xor             eax,eax
00FE  8A 44 24 0E                       mov             al,byte ptr 0xe[esp]
0102  50                                push            eax
0103  E8 00 00 00 00                    call            putch
0108  83 C4 04                          add             esp,0x00000004
010B  8A 4C 24 18                       mov             cl,byte ptr 0x18[esp]
010F  FE C9                             dec             cl
0111  43                                inc             ebx
0112  88 4C 24 18                       mov             byte ptr 0x18[esp],cl
0116                            L$7:
0116  66 FF 4C 24 08                    dec             word ptr 0x8[esp]
011B                            L$8:
011B  66 83 7C 24 08 00                 cmp             word ptr 0x8[esp],0x0000
0121  77 90                             ja              L$5
0123  E9 59 FF FF FF                    jmp             L$4
0128                            L$9:
0128  6A 00                             push            0x00000000
012A  C6 03 00                          mov             byte ptr [ebx],0x00
012D  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0133  83 C4 04                          add             esp,0x00000004
0136  88 D8                             mov             al,bl
0138  2A 44 24 30                       sub             al,byte ptr 0x30[esp]
013C                            L$10:
013C  8B 5C 24 30                       mov             ebx,dword ptr 0x30[esp]
0140  2C 02                             sub             al,0x02
0142  88 43 01                          mov             byte ptr 0x1[ebx],al
0145  8D 43 02                          lea             eax,0x2[ebx]
0148  83 C4 1C                          add             esp,0x0000001c
014B  5D                                pop             ebp
014C  5F                                pop             edi
014D  5E                                pop             esi
014E  5B                                pop             ebx
014F  C3                                ret

Routine Size: 336 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

