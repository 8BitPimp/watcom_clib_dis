Module: fullpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000                            _fullpath_:
0000  51                                push            ecx
0001  56                                push            esi
0002  83 EC 04                          sub             esp,0x00000004
0005  89 C6                             mov             esi,eax
0007  89 D1                             mov             ecx,edx
0009  85 C0                             test            eax,eax
000B  75 20                             jne             L$2
000D  BB 04 01 00 00                    mov             ebx,0x00000104
0012  89 D8                             mov             eax,ebx
0014  E8 00 00 00 00                    call            malloc_
0019  89 C6                             mov             esi,eax
001B  85 C0                             test            eax,eax
001D  75 0E                             jne             L$2
001F  B8 05 00 00 00                    mov             eax,0x00000005
0024                            L$1:
0024  E8 00 00 00 00                    call            __set_errno_
0029  31 C0                             xor             eax,eax
002B  EB 46                             jmp             L$8
002D                            L$2:
002D  85 C9                             test            ecx,ecx
002F  74 05                             je              L$3
0031  80 39 00                          cmp             byte ptr [ecx],0x00
0034  75 0B                             jne             L$4
0036                            L$3:
0036  89 F0                             mov             eax,esi
0038  89 DA                             mov             edx,ebx
003A  E8 00 00 00 00                    call            getcwd_
003F  EB 32                             jmp             L$8
0041                            L$4:
0041  BA 00 00 00 00                    mov             edx,offset DGROUP:L$9
0046  89 C8                             mov             eax,ecx
0048  E8 00 00 00 00                    call            strcmp_
004D  85 C0                             test            eax,eax
004F  75 15                             jne             L$6
0051  83 FB 04                          cmp             ebx,0x00000004
0054  73 07                             jae             L$5
0056  B8 0E 00 00 00                    mov             eax,0x0000000e
005B  EB C7                             jmp             L$1
005D                            L$5:
005D  A1 00 00 00 00                    mov             eax,dword ptr DGROUP:L$9
0062  89 06                             mov             dword ptr [esi],eax
0064  EB 0B                             jmp             L$7
0066                            L$6:
0066  89 E0                             mov             eax,esp
0068  50                                push            eax
0069  56                                push            esi
006A  53                                push            ebx
006B  51                                push            ecx
006C  E8 00 00 00 00                    call            _GetFullPathNameA
0071                            L$7:
0071  89 F0                             mov             eax,esi
0073                            L$8:
0073  83 C4 04                          add             esp,0x00000004
0076  5E                                pop             esi
0077  59                                pop             ecx
0078  C3                                ret

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000                            L$9:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

