Module: fputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000093 bytes
0000                            fputs_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  55                                push            ebp
0005  89 C1                             mov             ecx,eax
0007  89 D3                             mov             ebx,edx
0009  8B 42 10                          mov             eax,dword ptr 0x10[edx]
000C  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0012  83 7A 08 00                       cmp             dword ptr 0x8[edx],0x00000000
0016  75 07                             jne             L$1
0018  89 D8                             mov             eax,ebx
001A  E8 00 00 00 00                    call            __ioalloc_
001F                            L$1:
001F  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
0022  31 FF                             xor             edi,edi
0024  F6 C4 04                          test            ah,0x04
0027  74 15                             je              L$2
0029  88 E2                             mov             dl,ah
002B  80 E2 F9                          and             dl,0xf9
002E  88 D6                             mov             dh,dl
0030  88 53 0D                          mov             byte ptr 0xd[ebx],dl
0033  80 CE 02                          or              dh,0x02
0036  BF 01 00 00 00                    mov             edi,0x00000001
003B  88 73 0D                          mov             byte ptr 0xd[ebx],dh
003E                            L$2:
003E  89 CD                             mov             ebp,ecx
0040  31 F6                             xor             esi,esi
0042                            L$3:
0042  31 C0                             xor             eax,eax
0044  8A 01                             mov             al,byte ptr [ecx]
0046  85 C0                             test            eax,eax
0048  74 0F                             je              L$4
004A  89 DA                             mov             edx,ebx
004C  41                                inc             ecx
004D  E8 00 00 00 00                    call            fputc_
0052  83 F8 FF                          cmp             eax,0xffffffff
0055  75 EB                             jne             L$3
0057  89 C6                             mov             esi,eax
0059                            L$4:
0059  85 FF                             test            edi,edi
005B  74 1D                             je              L$5
005D  8A 43 0D                          mov             al,byte ptr 0xd[ebx]
0060  24 F9                             and             al,0xf9
0062  88 C4                             mov             ah,al
0064  88 43 0D                          mov             byte ptr 0xd[ebx],al
0067  80 CC 04                          or              ah,0x04
006A  88 63 0D                          mov             byte ptr 0xd[ebx],ah
006D  85 F6                             test            esi,esi
006F  75 09                             jne             L$5
0071  89 D8                             mov             eax,ebx
0073  E8 00 00 00 00                    call            __flush_
0078  89 C6                             mov             esi,eax
007A                            L$5:
007A  85 F6                             test            esi,esi
007C  75 04                             jne             L$6
007E  89 CE                             mov             esi,ecx
0080  29 EE                             sub             esi,ebp
0082                            L$6:
0082  8B 43 10                          mov             eax,dword ptr 0x10[ebx]
0085  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
008B  89 F0                             mov             eax,esi
008D  5D                                pop             ebp
008E  5F                                pop             edi
008F  5E                                pop             esi
0090  59                                pop             ecx
0091  5B                                pop             ebx
0092  C3                                ret

Routine Size: 147 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

