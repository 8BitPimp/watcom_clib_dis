Module: flush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DE bytes
0000                            __flush:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0008  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
000B  52                                push            edx
000C  31 F6                             xor             esi,esi
000E  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0014  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
0017  83 C4 04                          add             esp,0x00000004
001A  F6 C4 10                          test            ah,0x10
001D  74 60                             je              L$2
001F  88 E5                             mov             ch,ah
0021  80 E5 EF                          and             ch,0xef
0024  8A 43 0C                          mov             al,byte ptr 0xc[ebx]
0027  88 6B 0D                          mov             byte ptr 0xd[ebx],ch
002A  A8 02                             test            al,0x02
002C  0F 84 8C 00 00 00                 je              L$4
0032  8B 6B 08                          mov             ebp,dword ptr 0x8[ebx]
0035  85 ED                             test            ebp,ebp
0037  0F 84 81 00 00 00                 je              L$4
003D  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
0040  50                                push            eax
0041  55                                push            ebp
0042  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
0045  51                                push            ecx
0046  E8 00 00 00 00                    call            __qwrite
004B  83 C4 0C                          add             esp,0x0000000c
004E  83 F8 FF                          cmp             eax,0xffffffff
0051  75 0D                             jne             L$1
0053  8A 53 0C                          mov             dl,byte ptr 0xc[ebx]
0056  80 CA 20                          or              dl,0x20
0059  89 C6                             mov             esi,eax
005B  88 53 0C                          mov             byte ptr 0xc[ebx],dl
005E  EB 5E                             jmp             L$4
0060                            L$1:
0060  3B 43 04                          cmp             eax,dword ptr 0x4[ebx]
0063  74 59                             je              L$4
0065  6A 0C                             push            0x0000000c
0067  E8 00 00 00 00                    call            __set_errno
006C  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
006F  BE FF FF FF FF                    mov             esi,0xffffffff
0074  80 CC 20                          or              ah,0x20
0077  83 C4 04                          add             esp,0x00000004
007A  88 63 0C                          mov             byte ptr 0xc[ebx],ah
007D  EB 3F                             jmp             L$4
007F                            L$2:
007F  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
0083  74 39                             je              L$4
0085  8A 53 0C                          mov             dl,byte ptr 0xc[ebx]
0088  80 E2 EF                          and             dl,0xef
008B  8A 73 0D                          mov             dh,byte ptr 0xd[ebx]
008E  88 53 0C                          mov             byte ptr 0xc[ebx],dl
0091  F6 C6 20                          test            dh,0x20
0094  75 28                             jne             L$4
0096  8B 43 04                          mov             eax,dword ptr 0x4[ebx]
0099  85 C0                             test            eax,eax
009B  74 11                             je              L$3
009D  6A 01                             push            0x00000001
009F  F7 D8                             neg             eax
00A1  50                                push            eax
00A2  8B 7B 10                          mov             edi,dword ptr 0x10[ebx]
00A5  57                                push            edi
00A6  E8 00 00 00 00                    call            lseek
00AB  83 C4 0C                          add             esp,0x0000000c
00AE                            L$3:
00AE  83 F8 FF                          cmp             eax,0xffffffff
00B1  75 0B                             jne             L$4
00B3  8A 4B 0C                          mov             cl,byte ptr 0xc[ebx]
00B6  80 C9 20                          or              cl,0x20
00B9  89 C6                             mov             esi,eax
00BB  88 4B 0C                          mov             byte ptr 0xc[ebx],cl
00BE                            L$4:
00BE  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
00C1  8B 6B 10                          mov             ebp,dword ptr 0x10[ebx]
00C4  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
00CB  55                                push            ebp
00CC  89 03                             mov             dword ptr [ebx],eax
00CE  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00D4  83 C4 04                          add             esp,0x00000004
00D7  89 F0                             mov             eax,esi
00D9  5D                                pop             ebp
00DA  5F                                pop             edi
00DB  5E                                pop             esi
00DC  5B                                pop             ebx
00DD  C3                                ret

Routine Size: 222 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

