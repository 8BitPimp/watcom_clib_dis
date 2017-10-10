Module: sftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000071 bytes
0000                            _dos_setftime_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 1C                          sub             esp,0x0000001c
0006  89 C6                             mov             esi,eax
0008  89 54 24 18                       mov             dword ptr 0x18[esp],edx
000C  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0012  A1 00 00 00 00                    mov             eax,dword ptr ___FileHandleIDs
0017  89 F7                             mov             edi,esi
0019  8B 3C B8                          mov             edi,dword ptr [eax+edi*4]
001C  89 E0                             mov             eax,esp
001E  50                                push            eax
001F  8D 44 24 0C                       lea             eax,0xc[esp]
0023  50                                push            eax
0024  8D 44 24 18                       lea             eax,0x18[esp]
0028  50                                push            eax
0029  57                                push            edi
002A  E8 00 00 00 00                    call            _GetFileTime
002F  85 C0                             test            eax,eax
0031  75 0F                             jne             L$2
0033                            L$1:
0033  89 F0                             mov             eax,esi
0035  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
003B  E8 00 00 00 00                    call            __set_errno_nt_
0040  EB 28                             jmp             L$3
0042                            L$2:
0042  31 C0                             xor             eax,eax
0044  31 D2                             xor             edx,edx
0046  66 8B 44 24 18                    mov             ax,word ptr 0x18[esp]
004B  66 89 DA                          mov             dx,bx
004E  89 E3                             mov             ebx,esp
0050  E8 00 00 00 00                    call            __FromDOSDT_
0055  89 E0                             mov             eax,esp
0057  50                                push            eax
0058  50                                push            eax
0059  8D 44 24 18                       lea             eax,0x18[esp]
005D  50                                push            eax
005E  57                                push            edi
005F  E8 00 00 00 00                    call            _SetFileTime
0064  85 C0                             test            eax,eax
0066  74 CB                             je              L$1
0068  31 C0                             xor             eax,eax
006A                            L$3:
006A  83 C4 1C                          add             esp,0x0000001c
006D  5F                                pop             edi
006E  5E                                pop             esi
006F  59                                pop             ecx
0070  C3                                ret

Routine Size: 113 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

