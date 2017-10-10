Module: ustrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000073 bytes
0000                            _ustrstr_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  56                                push            esi
0003  57                                push            edi
0004  C8 04 00 00                       enter           0x0004,0x00
0008  89 C6                             mov             esi,eax
000A  89 D1                             mov             ecx,edx
000C  66 83 3A 00                       cmp             word ptr [edx],0x0000
0010  74 5B                             je              L$5
0012  66 83 7A 02 00                    cmp             word ptr 0x2[edx],0x0000
0017  75 0A                             jne             L$1
0019  0F B7 12                          movzx           edx,word ptr [edx]
001C  E8 00 00 00 00                    call            _ustrchr_
0021  EB 4A                             jmp             L$5
0023                            L$1:
0023  BB FF FF FF FF                    mov             ebx,0xffffffff
0028  31 D2                             xor             edx,edx
002A  E8 00 00 00 00                    call            __umemchr_
002F  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0032  89 C8                             mov             eax,ecx
0034  E8 00 00 00 00                    call            _ustrlen_
0039  89 C7                             mov             edi,eax
003B                            L$2:
003B  8B 5D FC                          mov             ebx,dword ptr -0x4[ebp]
003E  29 F3                             sub             ebx,esi
0040  D1 FB                             sar             ebx,0x01
0042  39 FB                             cmp             ebx,edi
0044  7C 25                             jl              L$4
0046  89 F0                             mov             eax,esi
0048  0F B7 11                          movzx           edx,word ptr [ecx]
004B  E8 00 00 00 00                    call            __umemchr_
0050  89 C6                             mov             esi,eax
0052  85 C0                             test            eax,eax
0054  74 15                             je              L$4
0056  89 CA                             mov             edx,ecx
0058  89 FB                             mov             ebx,edi
005A  E8 00 00 00 00                    call            __umemcmp_
005F  85 C0                             test            eax,eax
0061  75 04                             jne             L$3
0063  89 F0                             mov             eax,esi
0065  EB 06                             jmp             L$5
0067                            L$3:
0067  46                                inc             esi
0068  46                                inc             esi
0069  EB D0                             jmp             L$2
006B                            L$4:
006B  31 C0                             xor             eax,eax
006D                            L$5:
006D  C9                                leave
006E  5F                                pop             edi
006F  5E                                pop             esi
0070  59                                pop             ecx
0071  5B                                pop             ebx
0072  C3                                ret

Routine Size: 115 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

