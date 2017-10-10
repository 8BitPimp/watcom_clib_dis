Module: flush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D0 bytes
0000                            __flush_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  89 C1                             mov             ecx,eax
0006  8B 40 10                          mov             eax,dword ptr 0x10[eax]
0009  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
000F  8A 61 0D                          mov             ah,byte ptr 0xd[ecx]
0012  31 F6                             xor             esi,esi
0014  F6 C4 10                          test            ah,0x10
0017  74 5C                             je              L$2
0019  88 E7                             mov             bh,ah
001B  80 E7 EF                          and             bh,0xef
001E  8A 41 0C                          mov             al,byte ptr 0xc[ecx]
0021  88 79 0D                          mov             byte ptr 0xd[ecx],bh
0024  A8 02                             test            al,0x02
0026  0F 84 88 00 00 00                 je              L$4
002C  83 79 08 00                       cmp             dword ptr 0x8[ecx],0x00000000
0030  0F 84 7E 00 00 00                 je              L$4
0036  8B 59 04                          mov             ebx,dword ptr 0x4[ecx]
0039  8B 51 08                          mov             edx,dword ptr 0x8[ecx]
003C  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
003F  E8 00 00 00 00                    call            __qwrite_
0044  83 F8 FF                          cmp             eax,0xffffffff
0047  75 0D                             jne             L$1
0049  8A 51 0C                          mov             dl,byte ptr 0xc[ecx]
004C  80 CA 20                          or              dl,0x20
004F  89 C6                             mov             esi,eax
0051  88 51 0C                          mov             byte ptr 0xc[ecx],dl
0054  EB 5E                             jmp             L$4
0056                            L$1:
0056  3B 41 04                          cmp             eax,dword ptr 0x4[ecx]
0059  74 59                             je              L$4
005B  B8 0C 00 00 00                    mov             eax,0x0000000c
0060  E8 00 00 00 00                    call            __set_errno_
0065  8A 61 0C                          mov             ah,byte ptr 0xc[ecx]
0068  80 CC 20                          or              ah,0x20
006B  BE FF FF FF FF                    mov             esi,0xffffffff
0070  88 61 0C                          mov             byte ptr 0xc[ecx],ah
0073  EB 3F                             jmp             L$4
0075                            L$2:
0075  83 79 08 00                       cmp             dword ptr 0x8[ecx],0x00000000
0079  74 39                             je              L$4
007B  8A 51 0C                          mov             dl,byte ptr 0xc[ecx]
007E  80 E2 EF                          and             dl,0xef
0081  8A 71 0D                          mov             dh,byte ptr 0xd[ecx]
0084  88 51 0C                          mov             byte ptr 0xc[ecx],dl
0087  F6 C6 20                          test            dh,0x20
008A  75 28                             jne             L$4
008C  8B 41 04                          mov             eax,dword ptr 0x4[ecx]
008F  85 C0                             test            eax,eax
0091  74 11                             je              L$3
0093  89 C2                             mov             edx,eax
0095  BB 01 00 00 00                    mov             ebx,0x00000001
009A  F7 DA                             neg             edx
009C  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
009F  E8 00 00 00 00                    call            lseek_
00A4                            L$3:
00A4  83 F8 FF                          cmp             eax,0xffffffff
00A7  75 0B                             jne             L$4
00A9  8A 59 0C                          mov             bl,byte ptr 0xc[ecx]
00AC  80 CB 20                          or              bl,0x20
00AF  89 C6                             mov             esi,eax
00B1  88 59 0C                          mov             byte ptr 0xc[ecx],bl
00B4                            L$4:
00B4  8B 41 08                          mov             eax,dword ptr 0x8[ecx]
00B7  89 01                             mov             dword ptr [ecx],eax
00B9  8B 41 10                          mov             eax,dword ptr 0x10[ecx]
00BC  C7 41 04 00 00 00 00              mov             dword ptr 0x4[ecx],0x00000000
00C3  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
00C9  89 F0                             mov             eax,esi
00CB  5E                                pop             esi
00CC  5A                                pop             edx
00CD  59                                pop             ecx
00CE  5B                                pop             ebx
00CF  C3                                ret

Routine Size: 208 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

