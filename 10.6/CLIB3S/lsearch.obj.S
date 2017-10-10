Module: lsearch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000                            lsearch:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  89 E5                             mov             ebp,esp
0006  8B 7D 18                          mov             edi,dword ptr 0x18[ebp]
0009  8B 5D 1C                          mov             ebx,dword ptr 0x1c[ebp]
000C  8B 33                             mov             esi,dword ptr [ebx]
000E  EB 19                             jmp             L$3
0010                            L$1:
0010  57                                push            edi
0011  FF 75 14                          push            dword ptr 0x14[ebp]
0014  FF 55 24                          call            dword ptr 0x24[ebp]
0017  83 C4 08                          add             esp,0x00000008
001A  85 C0                             test            eax,eax
001C  75 07                             jne             L$2
001E  89 F8                             mov             eax,edi
0020  5D                                pop             ebp
0021  5F                                pop             edi
0022  5E                                pop             esi
0023  5B                                pop             ebx
0024  C3                                ret
0025                            L$2:
0025  03 7D 20                          add             edi,dword ptr 0x20[ebp]
0028  4E                                dec             esi
0029                            L$3:
0029  85 F6                             test            esi,esi
002B  75 E3                             jne             L$1
002D  FF 75 20                          push            dword ptr 0x20[ebp]
0030  FF 75 14                          push            dword ptr 0x14[ebp]
0033  57                                push            edi
0034  E8 00 00 00 00                    call            memcpy
0039  83 C4 0C                          add             esp,0x0000000c
003C  89 F8                             mov             eax,edi
003E  FF 03                             inc             dword ptr [ebx]
0040  5D                                pop             ebp
0041  5F                                pop             edi
0042  5E                                pop             esi
0043  5B                                pop             ebx
0044  C3                                ret

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

