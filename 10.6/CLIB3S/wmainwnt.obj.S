Module: wmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FB bytes
0000                            __WinMain:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  83 EC 08                          sub             esp,0x00000008
0007  B8 01 00 00 00                    mov             eax,0x00000001
000C  E8 00 00 00 00                    call            __InitRtns
0011  A1 00 00 00 00                    mov             eax,dword ptr __ThreadDataSize
0016  83 C0 03                          add             eax,0x00000003
0019  24 FC                             and             al,0xfc
001B  29 C4                             sub             esp,eax
001D  89 E3                             mov             ebx,esp
001F  8B 15 00 00 00 00                 mov             edx,dword ptr __ThreadDataSize
0025  52                                push            edx
0026  6A 00                             push            0x00000000
0028  53                                push            ebx
0029  E8 00 00 00 00                    call            memset
002E  83 C4 0C                          add             esp,0x0000000c
0031  53                                push            ebx
0032  8D 45 F8                          lea             eax,-0x8[ebp]
0035  50                                push            eax
0036  E8 00 00 00 00                    call            __NTMainInit
003B  8B 1D 00 00 00 00                 mov             ebx,dword ptr __ASTACKSIZ
0041  83 C3 03                          add             ebx,0x00000003
0044  83 C4 08                          add             esp,0x00000008
0047  80 E3 FC                          and             bl,0xfc
004A  E8 00 00 00 00                    call            stackavail
004F  39 C3                             cmp             ebx,eax
0051  73 08                             jae             L$1
0053  89 D8                             mov             eax,ebx
0055  29 C4                             sub             esp,eax
0057  89 E0                             mov             eax,esp
0059  EB 02                             jmp             L$2
005B                            L$1:
005B  31 C0                             xor             eax,eax
005D                            L$2:
005D  8B 15 00 00 00 00                 mov             edx,dword ptr __ASTACKSIZ
0063  01 D0                             add             eax,edx
0065  A3 00 00 00 00                    mov             dword ptr __ASTACKPTR,eax
006A  E8 00 00 00 00                    call            __CommonInit
006F  E8 00 00 00 00                    call            _GetCommandLineA
0074  50                                push            eax
0075  31 DB                             xor             ebx,ebx
0077  E8 00 00 00 00                    call            strdup
007C  89 C2                             mov             edx,eax
007E  8A 18                             mov             bl,byte ptr [eax]
0080  83 C4 04                          add             esp,0x00000004
0083  83 FB 22                          cmp             ebx,0x00000022
0086  75 16                             jne             L$6
0088                            L$3:
0088  40                                inc             eax
0089  31 D2                             xor             edx,edx
008B  8A 10                             mov             dl,byte ptr [eax]
008D  83 FA 22                          cmp             edx,0x00000022
0090  74 04                             je              L$4
0092  84 D2                             test            dl,dl
0094  75 F2                             jne             L$3
0096                            L$4:
0096  80 38 00                          cmp             byte ptr [eax],0x00
0099  74 26                             je              L$7
009B                            L$5:
009B  40                                inc             eax
009C  EB 23                             jmp             L$7
009E                            L$6:
009E  8A 10                             mov             dl,byte ptr [eax]
00A0  FE C2                             inc             dl
00A2  81 E2 FF 00 00 00                 and             edx,0x000000ff
00A8  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
00AE  80 E2 02                          and             dl,0x02
00B1  81 E2 FF 00 00 00                 and             edx,0x000000ff
00B7  75 08                             jne             L$7
00B9  80 38 00                          cmp             byte ptr [eax],0x00
00BC  74 03                             je              L$7
00BE  40                                inc             eax
00BF  EB DD                             jmp             L$6
00C1                            L$7:
00C1  8A 10                             mov             dl,byte ptr [eax]
00C3  FE C2                             inc             dl
00C5  81 E2 FF 00 00 00                 and             edx,0x000000ff
00CB  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
00D1  80 E2 02                          and             dl,0x02
00D4  81 E2 FF 00 00 00                 and             edx,0x000000ff
00DA  75 BF                             jne             L$5
00DC  6A 0A                             push            0x0000000a
00DE  50                                push            eax
00DF  52                                push            edx
00E0  52                                push            edx
00E1  E8 00 00 00 00                    call            _GetModuleHandleA
00E6  50                                push            eax
00E7  FF 15 00 00 00 00                 call            dword ptr _WinMainProc
00ED  50                                push            eax
00EE  E8 00 00 00 00                    call            exit
00F3  83 C4 04                          add             esp,0x00000004
00F6  89 EC                             mov             esp,ebp
00F8  5D                                pop             ebp
00F9  5B                                pop             ebx
00FA  C3                                ret

Routine Size: 251 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000                            _WinMainProc:

BSS Size: 4 bytes

