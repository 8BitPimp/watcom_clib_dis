Module: fgetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000195 bytes
0000                            fgetc:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
000A  52                                push            edx
000B  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0011  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
0014  83 C4 04                          add             esp,0x00000004
0017  F6 C4 01                          test            ah,0x01
001A  75 1A                             jne             L$1
001C  6A 04                             push            0x00000004
001E  E8 00 00 00 00                    call            __set_errno
0023  8A 53 0C                          mov             dl,byte ptr 0xc[ebx]
0026  BE FF FF FF FF                    mov             esi,0xffffffff
002B  80 CA 20                          or              dl,0x20
002E  83 C4 04                          add             esp,0x00000004
0031  88 53 0C                          mov             byte ptr 0xc[ebx],dl
0034  EB 22                             jmp             L$3
0036                            L$1:
0036  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
0039  49                                dec             ecx
003A  89 4B 04                          mov             dword ptr 0x4[ebx],ecx
003D  85 C9                             test            ecx,ecx
003F  7D 0D                             jge             L$2
0041  53                                push            ebx
0042  E8 00 00 00 00                    call            __filbuf
0047  83 C4 04                          add             esp,0x00000004
004A  89 C6                             mov             esi,eax
004C  EB 0A                             jmp             L$3
004E                            L$2:
004E  8B 03                             mov             eax,dword ptr [ebx]
0050  8A 10                             mov             dl,byte ptr [eax]
0052  40                                inc             eax
0053  0F B6 F2                          movzx           esi,dl
0056  89 03                             mov             dword ptr [ebx],eax
0058                            L$3:
0058  F6 43 0C 40                       test            byte ptr 0xc[ebx],0x40
005C  75 3A                             jne             L$6
005E  83 FE 0D                          cmp             esi,0x0000000d
0061  75 22                             jne             L$5
0063  8B 7B 04                          mov             edi,dword ptr 0x4[ebx]
0066  4F                                dec             edi
0067  89 7B 04                          mov             dword ptr 0x4[ebx],edi
006A  85 FF                             test            edi,edi
006C  7D 0D                             jge             L$4
006E  53                                push            ebx
006F  E8 00 00 00 00                    call            __filbuf
0074  83 C4 04                          add             esp,0x00000004
0077  89 C6                             mov             esi,eax
0079  EB 0A                             jmp             L$5
007B                            L$4:
007B  8B 03                             mov             eax,dword ptr [ebx]
007D  8A 10                             mov             dl,byte ptr [eax]
007F  40                                inc             eax
0080  0F B6 F2                          movzx           esi,dl
0083  89 03                             mov             dword ptr [ebx],eax
0085                            L$5:
0085  83 FE 1A                          cmp             esi,0x0000001a
0088  75 0E                             jne             L$6
008A  8A 4B 0C                          mov             cl,byte ptr 0xc[ebx]
008D  80 C9 10                          or              cl,0x10
0090  BE FF FF FF FF                    mov             esi,0xffffffff
0095  88 4B 0C                          mov             byte ptr 0xc[ebx],cl
0098                            L$6:
0098  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
009B  50                                push            eax
009C  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00A2  83 C4 04                          add             esp,0x00000004
00A5  89 F0                             mov             eax,esi
00A7  5F                                pop             edi
00A8  5E                                pop             esi
00A9  5B                                pop             ebx
00AA  C3                                ret

Routine Size: 171 bytes,    Routine Base: _TEXT + 0000

00AB                            __filbuf:
00AB  53                                push            ebx
00AC  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
00B0  53                                push            ebx
00B1  E8 00 00 00 00                    call            __fill_buffer
00B6  83 C4 04                          add             esp,0x00000004
00B9  85 C0                             test            eax,eax
00BB  75 07                             jne             L$7
00BD  B8 FF FF FF FF                    mov             eax,0xffffffff
00C2  5B                                pop             ebx
00C3  C3                                ret
00C4                            L$7:
00C4  8B 53 04                          mov             edx,dword ptr 0x4[ebx]
00C7  8B 0B                             mov             ecx,dword ptr [ebx]
00C9  4A                                dec             edx
00CA  41                                inc             ecx
00CB  89 53 04                          mov             dword ptr 0x4[ebx],edx
00CE  89 0B                             mov             dword ptr [ebx],ecx
00D0  8A 41 FF                          mov             al,byte ptr -0x1[ecx]
00D3  25 FF 00 00 00                    and             eax,0x000000ff
00D8  5B                                pop             ebx
00D9  C3                                ret

Routine Size: 47 bytes,    Routine Base: _TEXT + 00AB

00DA                            __fill_buffer:
00DA  53                                push            ebx
00DB  56                                push            esi
00DC  57                                push            edi
00DD  55                                push            ebp
00DE  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
00E2  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
00E6  75 09                             jne             L$8
00E8  53                                push            ebx
00E9  E8 00 00 00 00                    call            __ioalloc
00EE  83 C4 04                          add             esp,0x00000004
00F1                            L$8:
00F1  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
00F4  F6 C4 20                          test            ah,0x20
00F7  74 12                             je              L$9
00F9  F6 C4 06                          test            ah,0x06
00FC  74 0D                             je              L$9
00FE  68 00 20 00 00                    push            0x00002000
0103  E8 00 00 00 00                    call            __flushall
0108  83 C4 04                          add             esp,0x00000004
010B                            L$9:
010B  8B 53 08                          mov             edx,dword ptr 0x8[ebx]
010E  89 13                             mov             dword ptr [ebx],edx
0110  8A 73 0C                          mov             dh,byte ptr 0xc[ebx]
0113  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0116  80 E6 FB                          and             dh,0xfb
0119  25 00 24 00 00                    and             eax,0x00002400
011E  88 73 0C                          mov             byte ptr 0xc[ebx],dh
0121  3D 00 24 00 00                    cmp             eax,0x00002400
0126  75 23                             jne             L$10
0128  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
012B  85 C9                             test            ecx,ecx
012D  75 1C                             jne             L$10
012F  89 4B 04                          mov             dword ptr 0x4[ebx],ecx
0132  E8 00 00 00 00                    call            getche
0137  89 C2                             mov             edx,eax
0139  83 F8 FF                          cmp             eax,0xffffffff
013C  74 30                             je              L$13
013E  8B 03                             mov             eax,dword ptr [ebx]
0140  88 10                             mov             byte ptr [eax],dl
0142  C7 43 04 01 00 00 00              mov             dword ptr 0x4[ebx],0x00000001
0149  EB 23                             jmp             L$13
014B                            L$10:
014B  F6 43 0D 04                       test            byte ptr 0xd[ebx],0x04
014F  74 07                             je              L$11
0151  B8 01 00 00 00                    mov             eax,0x00000001
0156  EB 03                             jmp             L$12
0158                            L$11:
0158  8B 43 14                          mov             eax,dword ptr 0x14[ebx]
015B                            L$12:
015B  50                                push            eax
015C  8B 33                             mov             esi,dword ptr [ebx]
015E  56                                push            esi
015F  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
0162  57                                push            edi
0163  E8 00 00 00 00                    call            __qread
0168  83 C4 0C                          add             esp,0x0000000c
016B  89 43 04                          mov             dword ptr 0x4[ebx],eax
016E                            L$13:
016E  8B 6B 04                          mov             ebp,dword ptr 0x4[ebx]
0171  85 ED                             test            ebp,ebp
0173  7F 18                             jg              L$15
0175  75 06                             jne             L$14
0177  80 4B 0C 10                       or              byte ptr 0xc[ebx],0x10
017B  EB 10                             jmp             L$15
017D                            L$14:
017D  8A 6B 0C                          mov             ch,byte ptr 0xc[ebx]
0180  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
0187  80 CD 20                          or              ch,0x20
018A  88 6B 0C                          mov             byte ptr 0xc[ebx],ch
018D                            L$15:
018D  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
0190  5D                                pop             ebp
0191  5F                                pop             edi
0192  5E                                pop             esi
0193  5B                                pop             ebx
0194  C3                                ret

Routine Size: 187 bytes,    Routine Base: _TEXT + 00DA

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

