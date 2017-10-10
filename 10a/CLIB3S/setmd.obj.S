Module: setmd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FA bytes
0000                            setmode:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000A  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000E  53                                push            ebx
000F  E8 00 00 00 00                    call            __IOMode
0014  89 44 24 04                       mov             dword ptr 0x4[esp],eax
0018  83 C4 04                          add             esp,0x00000004
001B  89 44 24 04                       mov             dword ptr 0x4[esp],eax
001F  85 C0                             test            eax,eax
0021  75 14                             jne             L$2
0023  6A 04                             push            0x00000004
0025  E8 00 00 00 00                    call            __set_errno
002A                            L$1:
002A  B8 FF FF FF FF                    mov             eax,0xffffffff
002F  83 C4 04                          add             esp,0x00000004
0032  E9 A6 00 00 00                    jmp             L$11
0037                            L$2:
0037  53                                push            ebx
0038  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
003E  83 C4 04                          add             esp,0x00000004
0041  F6 04 24 40                       test            byte ptr [esp],0x40
0045  74 07                             je              L$3
0047  B8 00 02 00 00                    mov             eax,0x00000200
004C  EB 05                             jmp             L$4
004E                            L$3:
004E  B8 00 01 00 00                    mov             eax,0x00000100
0053                            L$4:
0053  89 C7                             mov             edi,eax
0055  39 C6                             cmp             esi,eax
0057  0F 84 74 00 00 00                 je              L$10
005D  81 FE 00 02 00 00                 cmp             esi,0x00000200
0063  74 0C                             je              L$5
0065  81 FE 00 01 00 00                 cmp             esi,0x00000100
006B  0F 85 73 00 00 00                 jne             L$12
0071                            L$5:
0071  8A 54 24 04                       mov             dl,byte ptr 0x4[esp]
0075  80 E2 BF                          and             dl,0xbf
0078  88 54 24 04                       mov             byte ptr 0x4[esp],dl
007C  81 FE 00 02 00 00                 cmp             esi,0x00000200
0082  75 09                             jne             L$6
0084  88 D6                             mov             dh,dl
0086  80 CE 40                          or              dh,0x40
0089  88 74 24 04                       mov             byte ptr 0x4[esp],dh
008D                            L$6:
008D  8B 4C 24 04                       mov             ecx,dword ptr 0x4[esp]
0091  51                                push            ecx
0092  53                                push            ebx
0093  E8 00 00 00 00                    call            __SetIOMode
0098  A1 00 00 00 00                    mov             eax,dword ptr __OpenStreams
009D  83 C4 08                          add             esp,0x00000008
00A0  EB 2B                             jmp             L$9
00A2                            L$7:
00A2  8B 50 04                          mov             edx,dword ptr 0x4[eax]
00A5  83 7A 0C 00                       cmp             dword ptr 0xc[edx],0x00000000
00A9  74 20                             je              L$8
00AB  3B 5A 10                          cmp             ebx,dword ptr 0x10[edx]
00AE  75 1B                             jne             L$8
00B0  8A 4A 0C                          mov             cl,byte ptr 0xc[edx]
00B3  80 E1 BF                          and             cl,0xbf
00B6  88 4A 0C                          mov             byte ptr 0xc[edx],cl
00B9  81 FE 00 02 00 00                 cmp             esi,0x00000200
00BF  75 10                             jne             L$10
00C1  88 CD                             mov             ch,cl
00C3  80 CD 40                          or              ch,0x40
00C6  88 6A 0C                          mov             byte ptr 0xc[edx],ch
00C9  EB 06                             jmp             L$10
00CB                            L$8:
00CB  8B 00                             mov             eax,dword ptr [eax]
00CD                            L$9:
00CD  85 C0                             test            eax,eax
00CF  75 D1                             jne             L$7
00D1                            L$10:
00D1  53                                push            ebx
00D2  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00D8  83 C4 04                          add             esp,0x00000004
00DB  89 F8                             mov             eax,edi
00DD                            L$11:
00DD  83 C4 08                          add             esp,0x00000008
00E0  5F                                pop             edi
00E1  5E                                pop             esi
00E2  5B                                pop             ebx
00E3  C3                                ret
00E4                            L$12:
00E4  6A 09                             push            0x00000009
00E6  E8 00 00 00 00                    call            __set_errno
00EB  83 C4 04                          add             esp,0x00000004
00EE  53                                push            ebx
00EF  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00F5  E9 30 FF FF FF                    jmp             L$1

Routine Size: 250 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

