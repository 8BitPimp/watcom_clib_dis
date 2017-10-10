Module: strncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000047 bytes
0000                            strncat:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 6C 24 14                       mov             ebp,dword ptr 0x14[esp]
0008  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000C  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0010  B9 FF FF FF FF                    mov             ecx,0xffffffff
0015  89 EF                             mov             edi,ebp
0017  30 C0                             xor             al,al
0019  06                                push            es
001A  E3 0B                             jecxz           L$1
001C  8C DA                             mov             edx,ds
001E  8E C2                             mov             es,edx
0020  F2 AE                             repne scasb
0022  75 03                             jne             L$1
0024  4F                                dec             edi
0025  66 A9                                           f.
0027                            L$1:
0027  89 CF                             mov             edi,ecx
0029  07                                pop             es
002A  89 F8                             mov             eax,edi
002C                            L$2:
002C  85 F6                             test            esi,esi
002E  74 0D                             je              L$3
0030  8A 13                             mov             dl,byte ptr [ebx]
0032  88 10                             mov             byte ptr [eax],dl
0034  84 D2                             test            dl,dl
0036  74 05                             je              L$3
0038  40                                inc             eax
0039  43                                inc             ebx
003A  4E                                dec             esi
003B  EB EF                             jmp             L$2
003D                            L$3:
003D  C6 00 00                          mov             byte ptr [eax],0x00
0040  89 E8                             mov             eax,ebp
0042  5D                                pop             ebp
0043  5F                                pop             edi
0044  5E                                pop             esi
0045  5B                                pop             ebx
0046  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

