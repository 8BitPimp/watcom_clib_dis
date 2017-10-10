Module: exvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000012C bytes
0000                            execvpe_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 14 01 00                       enter           0x0114,0x00
0007  89 C1                             mov             ecx,eax
0009  89 D7                             mov             edi,edx
000B  89 5D F4                          mov             dword ptr -0xc[ebp],ebx
000E  E8 00 00 00 00                    call            execve_
0013  89 C6                             mov             esi,eax
0015  89 C2                             mov             edx,eax
0017  83 F8 FF                          cmp             eax,0xffffffff
001A  0F 85 05 01 00 00                 jne             L$6
0020  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0026  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
002A  0F 85 F5 00 00 00                 jne             L$6
0030  80 39 5C                          cmp             byte ptr [ecx],0x5c
0033  0F 84 EC 00 00 00                 je              L$6
0039  80 39 00                          cmp             byte ptr [ecx],0x00
003C  0F 84 E3 00 00 00                 je              L$6
0042  80 79 01 3A                       cmp             byte ptr 0x1[ecx],0x3a
0046  0F 84 D9 00 00 00                 je              L$6
004C  B8 00 00 00 00                    mov             eax,offset DGROUP:L$7
0051  E8 00 00 00 00                    call            getenv_
0056  89 C3                             mov             ebx,eax
0058  85 C0                             test            eax,eax
005A  75 07                             jne             L$1
005C  89 F0                             mov             eax,esi
005E  C9                                leave
005F  5F                                pop             edi
0060  5E                                pop             esi
0061  59                                pop             ecx
0062  C3                                ret
0063                            L$1:
0063  89 C8                             mov             eax,ecx
0065  E8 00 00 00 00                    call            strlen_
006A  40                                inc             eax
006B  89 45 F0                          mov             dword ptr -0x10[ebp],eax
006E  B8 04 01 00 00                    mov             eax,0x00000104
0073  2B 45 F0                          sub             eax,dword ptr -0x10[ebp]
0076  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0079                            L$2:
0079  80 3B 00                          cmp             byte ptr [ebx],0x00
007C  0F 84 A3 00 00 00                 je              L$6
0082  BA 3B 00 00 00                    mov             edx,0x0000003b
0087  89 D8                             mov             eax,ebx
0089  E8 00 00 00 00                    call            strchr_
008E  89 C6                             mov             esi,eax
0090  85 C0                             test            eax,eax
0092  75 0A                             jne             L$3
0094  89 D8                             mov             eax,ebx
0096  E8 00 00 00 00                    call            strlen_
009B  8D 34 03                          lea             esi,[ebx+eax]
009E                            L$3:
009E  89 F0                             mov             eax,esi
00A0  29 D8                             sub             eax,ebx
00A2  89 45 FC                          mov             dword ptr -0x4[ebp],eax
00A5  3B 45 F8                          cmp             eax,dword ptr -0x8[ebp]
00A8  76 1E                             jbe             L$4
00AA  B8 02 00 00 00                    mov             eax,0x00000002
00AF  E8 00 00 00 00                    call            __set_errno_
00B4  B8 0A 00 00 00                    mov             eax,0x0000000a
00B9  E8 00 00 00 00                    call            __set_doserrno_
00BE  B8 FF FF FF FF                    mov             eax,0xffffffff
00C3  C9                                leave
00C4  5F                                pop             edi
00C5  5E                                pop             esi
00C6  59                                pop             ecx
00C7  C3                                ret
00C8                            L$4:
00C8  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00CE  89 DA                             mov             edx,ebx
00D0  8B 5D FC                          mov             ebx,dword ptr -0x4[ebp]
00D3  E8 00 00 00 00                    call            memcpy_
00D8  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00DE  03 45 FC                          add             eax,dword ptr -0x4[ebp]
00E1  80 78 FF 5C                       cmp             byte ptr -0x1[eax],0x5c
00E5  74 04                             je              L$5
00E7  C6 00 5C                          mov             byte ptr [eax],0x5c
00EA  40                                inc             eax
00EB                            L$5:
00EB  8B 5D F0                          mov             ebx,dword ptr -0x10[ebp]
00EE  89 CA                             mov             edx,ecx
00F0  E8 00 00 00 00                    call            memcpy_
00F5  8D 85 EC FE FF FF                 lea             eax,-0x114[ebp]
00FB  8B 5D F4                          mov             ebx,dword ptr -0xc[ebp]
00FE  89 FA                             mov             edx,edi
0100  E8 00 00 00 00                    call            execve_
0105  89 C2                             mov             edx,eax
0107  83 F8 FF                          cmp             eax,0xffffffff
010A  75 19                             jne             L$6
010C  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
0112  83 78 04 01                       cmp             dword ptr 0x4[eax],0x00000001
0116  75 0D                             jne             L$6
0118  80 3E 3B                          cmp             byte ptr [esi],0x3b
011B  75 08                             jne             L$6
011D  8D 5E 01                          lea             ebx,0x1[esi]
0120  E9 54 FF FF FF                    jmp             L$2
0125                            L$6:
0125  89 D0                             mov             eax,edx
0127  C9                                leave
0128  5F                                pop             edi
0129  5E                                pop             esi
012A  59                                pop             ecx
012B  C3                                ret

Routine Size: 300 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000                            L$7:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

