Module: fmemmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006C bytes
0000                            _fmemmove:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  06                                push            es
0004  0F A0                             push            fs
0006  8B 54 24 18                       mov             edx,dword ptr 0x18[esp]
000A  8B 5C 24 24                       mov             ebx,dword ptr 0x24[esp]
000E  8B 44 24 20                       mov             eax,dword ptr 0x20[esp]
0012  8B 4C 24 28                       mov             ecx,dword ptr 0x28[esp]
0016  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
001A  39 D0                             cmp             eax,edx
001C  75 05                             jne             L$1
001E  66 39 F3                          cmp             bx,si
0021  74 3A                             je              L$4
0023                            L$1:
0023  39 D0                             cmp             eax,edx
0025  73 20                             jae             L$3
0027  8D 34 08                          lea             esi,[eax+ecx]
002A  39 D6                             cmp             esi,edx
002C  76 19                             jbe             L$3
002E  8E 64 24 1C                       mov             fs,dword ptr 0x1c[esp]
0032  8E C3                             mov             es,ebx
0034  89 F0                             mov             eax,esi
0036  01 CA                             add             edx,ecx
0038                            L$2:
0038  85 C9                             test            ecx,ecx
003A  74 21                             je              L$4
003C  48                                dec             eax
003D  4A                                dec             edx
003E  26 8A 18                          mov             bl,byte ptr es:[eax]
0041  49                                dec             ecx
0042  64 88 1A                          mov             byte ptr fs:[edx],bl
0045  EB F1                             jmp             L$2
0047                            L$3:
0047  8E 44 24 1C                       mov             es,dword ptr 0x1c[esp]
004B  89 D7                             mov             edi,edx
004D  89 DE                             mov             esi,ebx
004F  1E                                push            ds
0050  96                                xchg            eax,esi
0051  8E D8                             mov             ds,eax
0053  D1 E9                             shr             ecx,0x01
0055  66 F3 A5                          rep movsw
0058  11 C9                             adc             ecx,ecx
005A  F3 A4                             rep movsb
005C  1F                                pop             ds
005D                            L$4:
005D  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
0061  89 D0                             mov             eax,edx
0063  89 DA                             mov             edx,ebx
0065  0F A1                             pop             fs
0067  07                                pop             es
0068  5F                                pop             edi
0069  5E                                pop             esi
006A  5B                                pop             ebx
006B  C3                                ret

Routine Size: 108 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

