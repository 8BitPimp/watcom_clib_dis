Module: trdlist
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000121 bytes
0000                            __GetThreadData:
0000  53                                push            ebx
0001  31 DB                             xor             ebx,ebx
0003  53                                push            ebx
0004  E8 00 00 00 00                    call            __NTAddThread
0009  83 C4 04                          add             esp,0x00000004
000C  85 C0                             test            eax,eax
000E  74 0E                             je              L$1
0010  8B 15 00 00 00 00                 mov             edx,dword ptr __TlsIndex
0016  52                                push            edx
0017  E8 00 00 00 00                    call            _TlsGetValue
001C  89 C3                             mov             ebx,eax
001E                            L$1:
001E  85 DB                             test            ebx,ebx
0020  75 0F                             jne             L$2
0022  6A 01                             push            0x00000001
0024  68 00 00 00 00                    push            offset DGROUP:L$14
0029  E8 00 00 00 00                    call            __fatal_runtime_error
002E  83 C4 08                          add             esp,0x00000008
0031                            L$2:
0031  89 D8                             mov             eax,ebx
0033  5B                                pop             ebx
0034  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

0035                            __AddThreadData:
0035  53                                push            ebx
0036  56                                push            esi
0037  57                                push            edi
0038  8B 7C 24 14                       mov             edi,dword ptr 0x14[esp]
003C  FF 15 00 00 00 00                 call            dword ptr _AccessTDList
0042  6A 10                             push            0x00000010
0044  BE 01 00 00 00                    mov             esi,0x00000001
0049  56                                push            esi
004A  E8 00 00 00 00                    call            calloc
004F  89 C3                             mov             ebx,eax
0051  83 C4 08                          add             esp,0x00000008
0054  85 C0                             test            eax,eax
0056  74 3B                             je              L$4
0058  57                                push            edi
0059  E8 00 00 00 00                    call            __initthread
005E  83 C4 04                          add             esp,0x00000004
0061  85 C0                             test            eax,eax
0063  74 0D                             je              L$3
0065  53                                push            ebx
0066  E8 00 00 00 00                    call            free
006B  31 F6                             xor             esi,esi
006D  83 C4 04                          add             esp,0x00000004
0070  EB 23                             jmp             L$5
0072                            L$3:
0072  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0076  89 7B 08                          mov             dword ptr 0x8[ebx],edi
0079  89 43 04                          mov             dword ptr 0x4[ebx],eax
007C  31 C0                             xor             eax,eax
007E  8A 47 52                          mov             al,byte ptr 0x52[edi]
0081  89 43 0C                          mov             dword ptr 0xc[ebx],eax
0084  A1 00 00 00 00                    mov             eax,dword ptr __thread_data_list
0089  89 1D 00 00 00 00                 mov             dword ptr __thread_data_list,ebx
008F  89 03                             mov             dword ptr [ebx],eax
0091  EB 02                             jmp             L$5
0093                            L$4:
0093  31 F6                             xor             esi,esi
0095                            L$5:
0095  FF 15 00 00 00 00                 call            dword ptr _ReleaseTDList
009B  89 F0                             mov             eax,esi
009D  5F                                pop             edi
009E  5E                                pop             esi
009F  5B                                pop             ebx
00A0  C3                                ret

Routine Size: 108 bytes,    Routine Base: _TEXT + 0035

00A1                            __RemoveThreadData:
00A1  53                                push            ebx
00A2  56                                push            esi
00A3  57                                push            edi
00A4  8B 7C 24 10                       mov             edi,dword ptr 0x10[esp]
00A8  FF 15 00 00 00 00                 call            dword ptr _AccessTDList
00AE  BE 00 00 00 00                    mov             esi,offset __thread_data_list
00B3  8B 1D 00 00 00 00                 mov             ebx,dword ptr __thread_data_list
00B9  EB 2A                             jmp             L$9
00BB                            L$6:
00BB  3B 7B 04                          cmp             edi,dword ptr 0x4[ebx]
00BE  75 21                             jne             L$8
00C0  83 7B 0C 00                       cmp             dword ptr 0xc[ebx],0x00000000
00C4  74 0C                             je              L$7
00C6  8B 7B 08                          mov             edi,dword ptr 0x8[ebx]
00C9  57                                push            edi
00CA  E8 00 00 00 00                    call            free
00CF  83 C4 04                          add             esp,0x00000004
00D2                            L$7:
00D2  8B 3B                             mov             edi,dword ptr [ebx]
00D4  53                                push            ebx
00D5  89 3E                             mov             dword ptr [esi],edi
00D7  E8 00 00 00 00                    call            free
00DC  83 C4 04                          add             esp,0x00000004
00DF  EB 08                             jmp             L$10
00E1                            L$8:
00E1  89 DE                             mov             esi,ebx
00E3  8B 1B                             mov             ebx,dword ptr [ebx]
00E5                            L$9:
00E5  85 DB                             test            ebx,ebx
00E7  75 D2                             jne             L$6
00E9                            L$10:
00E9  FF 15 00 00 00 00                 call            dword ptr _ReleaseTDList
00EF  5F                                pop             edi
00F0                            L$11:
00F0  5E                                pop             esi
00F1  5B                                pop             ebx
00F2  C3                                ret

Routine Size: 82 bytes,    Routine Base: _TEXT + 00A1

00F3                            __FreeThreadDataList:
00F3  53                                push            ebx
00F4  56                                push            esi
00F5  8B 1D 00 00 00 00                 mov             ebx,dword ptr __thread_data_list
00FB                            L$12:
00FB  85 DB                             test            ebx,ebx
00FD  74 F1                             je              L$11
00FF  8B 53 0C                          mov             edx,dword ptr 0xc[ebx]
0102  8B 33                             mov             esi,dword ptr [ebx]
0104  85 D2                             test            edx,edx
0106  74 0C                             je              L$13
0108  8B 4B 08                          mov             ecx,dword ptr 0x8[ebx]
010B  51                                push            ecx
010C  E8 00 00 00 00                    call            free
0111  83 C4 04                          add             esp,0x00000004
0114                            L$13:
0114  53                                push            ebx
0115  E8 00 00 00 00                    call            free
011A  83 C4 04                          add             esp,0x00000004
011D  89 F3                             mov             ebx,esi
011F  EB DA                             jmp             L$12

Routine Size: 46 bytes,    Routine Base: _TEXT + 00F3

No disassembly errors

Segment: CONST DWORD USE32 00000025 bytes
0000                            L$14:
0000  54 68 72 65 61 64 20 68 61 73 20 6E 6F 20 74 68 Thread has no th
0010  72 65 61 64 2D 73 70 65 63 69 66 69 63 20 64 61 read-specific da
0020  74 61 0D 0A 00                                  ta...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000                            __thread_data_list:

BSS Size: 4 bytes

