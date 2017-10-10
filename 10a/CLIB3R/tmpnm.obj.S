Module: tmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F6 bytes
0000                            putbits_:
0000  53                                push            ebx
0001  89 D3                             mov             ebx,edx
0003  83 FA 0F                          cmp             edx,0x0000000f
0006  76 0B                             jbe             L$1
0008  C1 EA 04                          shr             edx,0x04
000B  E8 00 00 00 00                    call            putbits_
0010  83 E3 0F                          and             ebx,0x0000000f
0013                            L$1:
0013  80 C3 41                          add             bl,0x41
0016  88 18                             mov             byte ptr [eax],bl
0018  40                                inc             eax
0019  5B                                pop             ebx
001A  C3                                ret
001B                            init_name_:
001B  53                                push            ebx
001C  52                                push            edx
001D  56                                push            esi
001E  57                                push            edi
001F  06                                push            es
0020  BA 00 00 00 00                    mov             edx,offset __tmpname
0025  B4 41                             mov             ah,0x41
0027  42                                inc             edx
0028  88 25 00 00 00 00                 mov             byte ptr __tmpname,ah
002E  88 22                             mov             byte ptr [edx],ah
0030  42                                inc             edx
0031  C6 02 40                          mov             byte ptr [edx],0x40
0034  E8 00 00 00 00                    call            getpid_
0039  42                                inc             edx
003A  89 C3                             mov             ebx,eax
003C  89 D0                             mov             eax,edx
003E  89 DA                             mov             edx,ebx
0040  E8 00 00 00 00                    call            putbits_
0045  89 C7                             mov             edi,eax
0047  8C D8                             mov             eax,ds
0049  8E C0                             mov             es,eax
004B  BE 00 00 00 00                    mov             esi,offset DGROUP:L$10
0050  A5                                movsd
0051  A4                                movsb
0052  07                                pop             es
0053  5F                                pop             edi
0054  5E                                pop             esi
0055  5A                                pop             edx
0056  5B                                pop             ebx
0057  C3                                ret

Routine Size: 88 bytes,    Routine Base: _TEXT + 0000

0058                            tmpnam_:
0058  53                                push            ebx
0059  51                                push            ecx
005A  52                                push            edx
005B  56                                push            esi
005C  57                                push            edi
005D  89 C3                             mov             ebx,eax
005F  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0065  8B 48 04                          mov             ecx,dword ptr 0x4[eax]
0068  80 3D 00 00 00 00 00              cmp             byte ptr __tmpname,0x00
006F  75 05                             jne             L$2
0071  E8 00 00 00 00                    call            init_name_
0076                            L$2:
0076  BF 02 00 00 00                    mov             edi,0x00000002
007B  31 F6                             xor             esi,esi
007D                            L$3:
007D  89 F8                             mov             eax,edi
007F                            L$4:
007F  8A 90 00 00 00 00                 mov             dl,byte ptr __tmpname[eax]
0085  80 FA 5A                          cmp             dl,0x5a
0088  75 13                             jne             L$5
008A  48                                dec             eax
008B  C6 80 01 00 00 00 41              mov             byte ptr __tmpname+0x1[eax],0x41
0092  85 C0                             test            eax,eax
0094  7D E9                             jge             L$4
0096  E8 00 00 00 00                    call            init_name_
009B  EB E0                             jmp             L$3
009D                            L$5:
009D  88 D6                             mov             dh,dl
009F  FE C6                             inc             dh
00A1  88 B0 00 00 00 00                 mov             byte ptr __tmpname[eax],dh
00A7  B8 00 00 00 00                    mov             eax,offset __tmpname
00AC  89 F2                             mov             edx,esi
00AE  E8 00 00 00 00                    call            access_
00B3  85 C0                             test            eax,eax
00B5  74 C6                             je              L$3
00B7  85 DB                             test            ebx,ebx
00B9  74 27                             je              L$8
00BB  BE 00 00 00 00                    mov             esi,offset __tmpname
00C0  89 DF                             mov             edi,ebx
00C2  57                                push            edi
00C3                            L$6:
00C3  8A 06                             mov             al,byte ptr [esi]
00C5  88 07                             mov             byte ptr [edi],al
00C7  3C 00                             cmp             al,0x00
00C9  0F 84 10 00 00 00                 je              L$7
00CF  8A 46 01                          mov             al,byte ptr 0x1[esi]
00D2  83 C6 02                          add             esi,0x00000002
00D5  88 47 01                          mov             byte ptr 0x1[edi],al
00D8  83 C7 02                          add             edi,0x00000002
00DB  3C 00                             cmp             al,0x00
00DD  75 E4                             jne             L$6
00DF                            L$7:
00DF  5F                                pop             edi
00E0  EB 05                             jmp             L$9
00E2                            L$8:
00E2  BB 00 00 00 00                    mov             ebx,offset __tmpname
00E7                            L$9:
00E7  89 C8                             mov             eax,ecx
00E9  E8 00 00 00 00                    call            __set_errno_
00EE  89 D8                             mov             eax,ebx
00F0  5F                                pop             edi
00F1  5E                                pop             esi
00F2  5A                                pop             edx
00F3  59                                pop             ecx
00F4  5B                                pop             ebx
00F5  C3                                ret

Routine Size: 158 bytes,    Routine Base: _TEXT + 0058

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$10:
0000  2E 54 4D 50 00                                  .TMP.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000D bytes
0000                            __tmpname:

BSS Size: 13 bytes

