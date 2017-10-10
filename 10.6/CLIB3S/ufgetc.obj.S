Module: ufgetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001AD bytes
0000                            read_wide_char:
0000  53                                push            ebx
0001  C8 08 00 00                       enter           0x0008,0x00
0005  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0008  F6 43 0C 40                       test            byte ptr 0xc[ebx],0x40
000C  74 13                             je              L$1
000E  53                                push            ebx
000F  6A 01                             push            0x00000001
0011  6A 02                             push            0x00000002
0013  FF 75 10                          push            dword ptr 0x10[ebp]
0016  E8 00 00 00 00                    call            fread
001B  83 C4 10                          add             esp,0x00000010
001E  C9                                leave
001F  5B                                pop             ebx
0020  C3                                ret
0021                            L$1:
0021  53                                push            ebx
0022  6A 01                             push            0x00000001
0024  6A 01                             push            0x00000001
0026  8D 45 FC                          lea             eax,-0x4[ebp]
0029  50                                push            eax
002A  E8 00 00 00 00                    call            fread
002F  83 C4 10                          add             esp,0x00000010
0032  85 C0                             test            eax,eax
0034  74 51                             je              L$4
0036  0F B6 45 FC                       movzx           eax,byte ptr -0x4[ebp]
003A  8A 80 01 00 00 00                 mov             al,byte ptr _IsKTable+0x1[eax]
0040  24 04                             and             al,0x04
0042  0F B6 C0                          movzx           eax,al
0045  85 C0                             test            eax,eax
0047  74 15                             je              L$2
0049  53                                push            ebx
004A  6A 01                             push            0x00000001
004C  6A 01                             push            0x00000001
004E  8D 45 FD                          lea             eax,-0x3[ebp]
0051  50                                push            eax
0052  E8 00 00 00 00                    call            fread
0057  83 C4 10                          add             esp,0x00000010
005A  85 C0                             test            eax,eax
005C  74 29                             je              L$4
005E                            L$2:
005E  6A 02                             push            0x00000002
0060  8D 45 FC                          lea             eax,-0x4[ebp]
0063  50                                push            eax
0064  8D 45 F8                          lea             eax,-0x8[ebp]
0067  50                                push            eax
0068  E8 00 00 00 00                    call            mbtowc
006D  83 C4 0C                          add             esp,0x0000000c
0070  85 C0                             test            eax,eax
0072  7C 11                             jl              L$3
0074  8B 5D 10                          mov             ebx,dword ptr 0x10[ebp]
0077  8B 45 F8                          mov             eax,dword ptr -0x8[ebp]
007A  66 89 03                          mov             word ptr [ebx],ax
007D  B8 01 00 00 00                    mov             eax,0x00000001
0082  C9                                leave
0083  5B                                pop             ebx
0084  C3                                ret
0085                            L$3:
0085  31 C0                             xor             eax,eax
0087                            L$4:
0087  C9                                leave
0088  5B                                pop             ebx
0089  C3                                ret

Routine Size: 138 bytes,    Routine Base: _TEXT + 0000

008A                            _ufgetc:
008A  53                                push            ebx
008B  C8 04 00 00                       enter           0x0004,0x00
008F  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0092  8D 45 FC                          lea             eax,-0x4[ebp]
0095  50                                push            eax
0096  53                                push            ebx
0097  E8 00 00 00 00                    call            read_wide_char
009C  83 C4 08                          add             esp,0x00000008
009F  85 C0                             test            eax,eax
00A1  75 08                             jne             L$6
00A3                            L$5:
00A3  B8 FF FF FF FF                    mov             eax,0xffffffff
00A8  C9                                leave
00A9  5B                                pop             ebx
00AA  C3                                ret
00AB                            L$6:
00AB  F6 43 0C 40                       test            byte ptr 0xc[ebx],0x40
00AF  75 18                             jne             L$7
00B1  66 83 7D FC 0D                    cmp             word ptr -0x4[ebp],0x000d
00B6  75 11                             jne             L$7
00B8  8D 45 FC                          lea             eax,-0x4[ebp]
00BB  50                                push            eax
00BC  53                                push            ebx
00BD  E8 00 00 00 00                    call            read_wide_char
00C2  83 C4 08                          add             esp,0x00000008
00C5  85 C0                             test            eax,eax
00C7  74 DA                             je              L$5
00C9                            L$7:
00C9  0F B7 45 FC                       movzx           eax,word ptr -0x4[ebp]
00CD  C9                                leave
00CE  5B                                pop             ebx
00CF  C3                                ret

Routine Size: 70 bytes,    Routine Base: _TEXT + 008A

00D0                            __ufilbuf:
00D0  53                                push            ebx
00D1  55                                push            ebp
00D2  89 E5                             mov             ebp,esp
00D4  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
00D7  53                                push            ebx
00D8  E8 00 00 00 00                    call            __ufill_buffer
00DD  83 C4 04                          add             esp,0x00000004
00E0  85 C0                             test            eax,eax
00E2  75 08                             jne             L$8
00E4  B8 FF FF FF FF                    mov             eax,0xffffffff
00E9  5D                                pop             ebp
00EA  5B                                pop             ebx
00EB  C3                                ret
00EC                            L$8:
00EC  83 03 02                          add             dword ptr [ebx],0x00000002
00EF  8B 03                             mov             eax,dword ptr [ebx]
00F1  83 6B 04 02                       sub             dword ptr 0x4[ebx],0x00000002
00F5  66 8B 40 FE                       mov             ax,word ptr -0x2[eax]
00F9  0F B7 C0                          movzx           eax,ax
00FC  5D                                pop             ebp
00FD  5B                                pop             ebx
00FE  C3                                ret

Routine Size: 47 bytes,    Routine Base: _TEXT + 00D0

00FF                            __ufill_buffer:
00FF  53                                push            ebx
0100  55                                push            ebp
0101  89 E5                             mov             ebp,esp
0103  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0106  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
010A  75 09                             jne             L$9
010C  53                                push            ebx
010D  E8 00 00 00 00                    call            __ioalloc
0112  83 C4 04                          add             esp,0x00000004
0115                            L$9:
0115  F6 43 0D 20                       test            byte ptr 0xd[ebx],0x20
0119  74 13                             je              L$10
011B  F6 43 0D 06                       test            byte ptr 0xd[ebx],0x06
011F  74 0D                             je              L$10
0121  68 00 20 00 00                    push            0x00002000
0126  E8 00 00 00 00                    call            __flushall
012B  83 C4 04                          add             esp,0x00000004
012E                            L$10:
012E  8B 53 08                          mov             edx,dword ptr 0x8[ebx]
0131  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0134  89 13                             mov             dword ptr [ebx],edx
0136  25 00 24 00 00                    and             eax,0x00002400
013B  80 63 0C FB                       and             byte ptr 0xc[ebx],0xfb
013F  3D 00 24 00 00                    cmp             eax,0x00002400
0144  75 27                             jne             L$11
0146  83 7B 10 00                       cmp             dword ptr 0x10[ebx],0x00000000
014A  75 21                             jne             L$11
014C  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
0153  E8 00 00 00 00                    call            getche
0158  89 C2                             mov             edx,eax
015A  83 F8 FF                          cmp             eax,0xffffffff
015D  74 2F                             je              L$14
015F  8B 03                             mov             eax,dword ptr [ebx]
0161  66 89 10                          mov             word ptr [eax],dx
0164  C7 43 04 02 00 00 00              mov             dword ptr 0x4[ebx],0x00000002
016B  EB 21                             jmp             L$14
016D                            L$11:
016D  F6 43 0D 04                       test            byte ptr 0xd[ebx],0x04
0171  74 07                             je              L$12
0173  B8 02 00 00 00                    mov             eax,0x00000002
0178  EB 03                             jmp             L$13
017A                            L$12:
017A  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
017D                            L$13:
017D  50                                push            eax
017E  FF 33                             push            dword ptr [ebx]
0180  FF 73 10                          push            dword ptr 0x10[ebx]
0183  E8 00 00 00 00                    call            __qread
0188  83 C4 0C                          add             esp,0x0000000c
018B  89 43 04                          mov             dword ptr 0x4[ebx],eax
018E                            L$14:
018E  83 7B 04 00                       cmp             dword ptr 0x4[ebx],0x00000000
0192  7F 13                             jg              L$16
0194  75 06                             jne             L$15
0196  80 4B 0C 10                       or              byte ptr 0xc[ebx],0x10
019A  EB 0B                             jmp             L$16
019C                            L$15:
019C  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
01A3  80 4B 0C 20                       or              byte ptr 0xc[ebx],0x20
01A7                            L$16:
01A7  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
01AA  5D                                pop             ebp
01AB  5B                                pop             ebx
01AC  C3                                ret

Routine Size: 174 bytes,    Routine Base: _TEXT + 00FF

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

