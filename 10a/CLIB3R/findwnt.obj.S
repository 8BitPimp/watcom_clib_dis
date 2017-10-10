Module: findwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C1 bytes
0000                            _dos_findfirst_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  81 EC 40 01 00 00                 sub             esp,0x00000140
0009  89 D7                             mov             edi,edx
000B  89 DE                             mov             esi,ebx
000D  89 E2                             mov             edx,esp
000F  52                                push            edx
0010  50                                push            eax
0011  E8 00 00 00 00                    call            _FindFirstFileA
0016  89 C1                             mov             ecx,eax
0018  83 F8 FF                          cmp             eax,0xffffffff
001B  75 09                             jne             L$1
001D  89 03                             mov             dword ptr [ebx],eax
001F  E8 00 00 00 00                    call            __set_errno_nt_
0024  EB 29                             jmp             L$3
0026                            L$1:
0026  89 E3                             mov             ebx,esp
0028  89 FA                             mov             edx,edi
002A  E8 00 00 00 00                    call            __NTFindNextFileWithAttr_
002F  85 C0                             test            eax,eax
0031  75 0C                             jne             L$2
0033  B8 02 00 00 00                    mov             eax,0x00000002
0038  E8 00 00 00 00                    call            __set_errno_dos_
003D  EB 10                             jmp             L$3
003F                            L$2:
003F  89 E2                             mov             edx,esp
0041  89 0E                             mov             dword ptr [esi],ecx
0043  89 F0                             mov             eax,esi
0045  89 7E 04                          mov             dword ptr 0x4[esi],edi
0048  E8 00 00 00 00                    call            __GetNTDirInfo_
004D  31 C0                             xor             eax,eax
004F                            L$3:
004F  81 C4 40 01 00 00                 add             esp,0x00000140
0055  5F                                pop             edi
0056  5E                                pop             esi
0057  59                                pop             ecx
0058  C3                                ret

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

0059                            _dos_findnext_:
0059  53                                push            ebx
005A  51                                push            ecx
005B  52                                push            edx
005C  56                                push            esi
005D  81 EC 40 01 00 00                 sub             esp,0x00000140
0063  89 C6                             mov             esi,eax
0065  89 E0                             mov             eax,esp
0067  50                                push            eax
0068  8B 16                             mov             edx,dword ptr [esi]
006A  52                                push            edx
006B  E8 00 00 00 00                    call            _FindNextFileA
0070  85 C0                             test            eax,eax
0072  75 07                             jne             L$5
0074                            L$4:
0074  E8 00 00 00 00                    call            __set_errno_nt_
0079  EB 1B                             jmp             L$6
007B                            L$5:
007B  89 E3                             mov             ebx,esp
007D  8B 56 04                          mov             edx,dword ptr 0x4[esi]
0080  8B 06                             mov             eax,dword ptr [esi]
0082  E8 00 00 00 00                    call            __NTFindNextFileWithAttr_
0087  85 C0                             test            eax,eax
0089  74 E9                             je              L$4
008B  89 E2                             mov             edx,esp
008D  89 F0                             mov             eax,esi
008F  E8 00 00 00 00                    call            __GetNTDirInfo_
0094  31 C0                             xor             eax,eax
0096                            L$6:
0096  81 C4 40 01 00 00                 add             esp,0x00000140
009C  5E                                pop             esi
009D  5A                                pop             edx
009E  59                                pop             ecx
009F  5B                                pop             ebx
00A0  C3                                ret

Routine Size: 72 bytes,    Routine Base: _TEXT + 0059

00A1                            _dos_findclose_:
00A1  51                                push            ecx
00A2  52                                push            edx
00A3  8B 10                             mov             edx,dword ptr [eax]
00A5  83 FA FF                          cmp             edx,0xffffffff
00A8  74 12                             je              L$7
00AA  52                                push            edx
00AB  E8 00 00 00 00                    call            _FindClose
00B0  85 C0                             test            eax,eax
00B2  75 08                             jne             L$7
00B4  E8 00 00 00 00                    call            __set_errno_nt_
00B9  5A                                pop             edx
00BA  59                                pop             ecx
00BB  C3                                ret
00BC                            L$7:
00BC  31 C0                             xor             eax,eax
00BE  5A                                pop             edx
00BF  59                                pop             ecx
00C0  C3                                ret

Routine Size: 32 bytes,    Routine Base: _TEXT + 00A1

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

