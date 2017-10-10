Module: gtcwdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007B bytes
0000                            getcwd_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  81 EC 04 01 00 00                 sub             esp,0x00000104
000A  89 C3                             mov             ebx,eax
000C  89 D6                             mov             esi,edx
000E  89 E0                             mov             eax,esp
0010  50                                push            eax
0011  68 04 01 00 00                    push            0x00000104
0016  E8 00 00 00 00                    call            _GetCurrentDirectoryA
001B  89 C2                             mov             edx,eax
001D  89 C1                             mov             ecx,eax
001F  85 C0                             test            eax,eax
0021  75 07                             jne             L$1
0023  E8 00 00 00 00                    call            __set_errno_nt_
0028  EB 1A                             jmp             L$3
002A                            L$1:
002A  85 DB                             test            ebx,ebx
002C  75 1A                             jne             L$4
002E  40                                inc             eax
002F  E8 00 00 00 00                    call            malloc_
0034  89 C3                             mov             ebx,eax
0036  85 C0                             test            eax,eax
0038  75 19                             jne             L$5
003A  B8 05 00 00 00                    mov             eax,0x00000005
003F                            L$2:
003F  E8 00 00 00 00                    call            __set_errno_
0044                            L$3:
0044  31 C0                             xor             eax,eax
0046  EB 28                             jmp             L$6
0048                            L$4:
0048  39 F0                             cmp             eax,esi
004A  76 07                             jbe             L$5
004C  B8 0E 00 00 00                    mov             eax,0x0000000e
0051  EB EC                             jmp             L$2
0053                            L$5:
0053  89 E6                             mov             esi,esp
0055  41                                inc             ecx
0056  89 DF                             mov             edi,ebx
0058  06                                push            es
0059  8C D8                             mov             eax,ds
005B  8E C0                             mov             es,eax
005D  57                                push            edi
005E  89 C8                             mov             eax,ecx
0060  C1 E9 02                          shr             ecx,0x02
0063  F2 A5                             repne movsd
0065  8A C8                             mov             cl,al
0067  80 E1 03                          and             cl,0x03
006A  F2 A4                             repne movsb
006C  5F                                pop             edi
006D  07                                pop             es
006E  89 D8                             mov             eax,ebx
0070                            L$6:
0070  81 C4 04 01 00 00                 add             esp,0x00000104
0076  5F                                pop             edi
0077  5E                                pop             esi
0078  59                                pop             ecx
0079  5B                                pop             ebx
007A  C3                                ret

Routine Size: 123 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

