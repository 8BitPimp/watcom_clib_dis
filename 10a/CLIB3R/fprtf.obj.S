Module: fprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A8 bytes
0000                            file_putc_:
0000  53                                push            ebx
0001  89 C3                             mov             ebx,eax
0003  89 D0                             mov             eax,edx
0005  8B 13                             mov             edx,dword ptr [ebx]
0007  E8 00 00 00 00                    call            fputc_
000C  FF 43 10                          inc             dword ptr 0x10[ebx]
000F  5B                                pop             ebx
0010  C3                                ret

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011                            __fprtf_:
0011  51                                push            ecx
0012  56                                push            esi
0013  57                                push            edi
0014  55                                push            ebp
0015  89 C6                             mov             esi,eax
0017  8B 40 10                          mov             eax,dword ptr 0x10[eax]
001A  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0020  8B 6E 0C                          mov             ebp,dword ptr 0xc[esi]
0023  8A 66 0C                          mov             ah,byte ptr 0xc[esi]
0026  8B 4E 08                          mov             ecx,dword ptr 0x8[esi]
0029  80 E4 CF                          and             ah,0xcf
002C  83 E5 30                          and             ebp,0x00000030
002F  88 66 0C                          mov             byte ptr 0xc[esi],ah
0032  85 C9                             test            ecx,ecx
0034  75 07                             jne             L$1
0036  89 F0                             mov             eax,esi
0038  E8 00 00 00 00                    call            __ioalloc_
003D                            L$1:
003D  8A 4E 0D                          mov             cl,byte ptr 0xd[esi]
0040  31 FF                             xor             edi,edi
0042  F6 C1 04                          test            cl,0x04
0045  74 14                             je              L$2
0047  88 CD                             mov             ch,cl
0049  80 E5 FA                          and             ch,0xfa
004C  88 E8                             mov             al,ch
004E  88 6E 0D                          mov             byte ptr 0xd[esi],ch
0051  0C 01                             or              al,0x01
0053  BF 01 00 00 00                    mov             edi,0x00000001
0058  88 46 0D                          mov             byte ptr 0xd[esi],al
005B                            L$2:
005B  B9 00 00 00 00                    mov             ecx,offset file_putc_
0060  89 F0                             mov             eax,esi
0062  E8 00 00 00 00                    call            __prtf_
0067  89 C2                             mov             edx,eax
0069  85 FF                             test            edi,edi
006B  74 18                             je              L$3
006D  8A 66 0D                          mov             ah,byte ptr 0xd[esi]
0070  80 E4 FA                          and             ah,0xfa
0073  88 E3                             mov             bl,ah
0075  88 66 0D                          mov             byte ptr 0xd[esi],ah
0078  80 CB 04                          or              bl,0x04
007B  89 F0                             mov             eax,esi
007D  88 5E 0D                          mov             byte ptr 0xd[esi],bl
0080  E8 00 00 00 00                    call            __flush_
0085                            L$3:
0085  8B 46 10                          mov             eax,dword ptr 0x10[esi]
0088  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
008E  F6 46 0C 20                       test            byte ptr 0xc[esi],0x20
0092  74 05                             je              L$4
0094  BA FF FF FF FF                    mov             edx,0xffffffff
0099                            L$4:
0099  8B 7E 0C                          mov             edi,dword ptr 0xc[esi]
009C  09 EF                             or              edi,ebp
009E  89 D0                             mov             eax,edx
00A0  89 7E 0C                          mov             dword ptr 0xc[esi],edi
00A3  5D                                pop             ebp
00A4  5F                                pop             edi
00A5  5E                                pop             esi
00A6  59                                pop             ecx
00A7  C3                                ret

Routine Size: 151 bytes,    Routine Base: _TEXT + 0011

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

