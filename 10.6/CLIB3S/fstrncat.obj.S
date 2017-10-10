Module: fstrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005E bytes
0000                            _fstrncat:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  55                                push            ebp
0007  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
000B  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
000F  8B 74 24 2C                       mov             esi,dword ptr 0x2c[esp]
0013  B9 FF FF FF FF                    mov             ecx,0xffffffff
0018  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
001C  89 EF                             mov             edi,ebp
001E  30 C0                             xor             al,al
0020  06                                push            es
0021  E3 0B                             jecxz           L$1
0023  8E C2                             mov             es,edx
0025  F2 AE                             repne scasb
0027  75 05                             jne             L$1
0029  4F                                dec             edi
002A  8C C1                             mov             ecx,es
002C  66 A9                                           f.
002E                            L$1:
002E  89 CF                             mov             edi,ecx
0030  07                                pop             es
0031  8E 64 24 28                       mov             fs,dword ptr 0x28[esp]
0035  8E C1                             mov             es,ecx
0037  89 F8                             mov             eax,edi
0039                            L$2:
0039  85 F6                             test            esi,esi
003B  74 0F                             je              L$3
003D  64 8A 13                          mov             dl,byte ptr fs:[ebx]
0040  26 88 10                          mov             byte ptr es:[eax],dl
0043  84 D2                             test            dl,dl
0045  74 05                             je              L$3
0047  40                                inc             eax
0048  43                                inc             ebx
0049  4E                                dec             esi
004A  EB ED                             jmp             L$2
004C                            L$3:
004C  8B 54 24 20                       mov             edx,dword ptr 0x20[esp]
0050  26 C6 00 00                       mov             byte ptr es:[eax],0x00
0054  89 E8                             mov             eax,ebp
0056  5D                                pop             ebp
0057  0F A1                             pop             fs
0059  07                                pop             es
005A  5F                                pop             edi
005B  5E                                pop             esi
005C  5B                                pop             ebx
005D  C3                                ret

Routine Size: 94 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

