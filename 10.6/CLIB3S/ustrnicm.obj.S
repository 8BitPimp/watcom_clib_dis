Module: ustrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000                            _ustrnicmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  55                                push            ebp
0003  89 E5                             mov             ebp,esp
0005  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
0008  8B 4D 14                          mov             ecx,dword ptr 0x14[ebp]
000B                            L$1:
000B  83 7D 18 00                       cmp             dword ptr 0x18[ebp],0x00000000
000F  75 06                             jne             L$3
0011                            L$2:
0011  31 C0                             xor             eax,eax
0013  5D                                pop             ebp
0014  5E                                pop             esi
0015  5B                                pop             ebx
0016  C3                                ret
0017                            L$3:
0017  66 8B 06                          mov             ax,word ptr [esi]
001A  89 C3                             mov             ebx,eax
001C  30 C3                             xor             bl,al
001E  0F B7 DB                          movzx           ebx,bx
0021  66 8B 11                          mov             dx,word ptr [ecx]
0024  85 DB                             test            ebx,ebx
0026  75 2D                             jne             L$5
0028  89 D3                             mov             ebx,edx
002A  30 D3                             xor             bl,dl
002C  0F B7 DB                          movzx           ebx,bx
002F  85 DB                             test            ebx,ebx
0031  75 22                             jne             L$5
0033  0F B7 D8                          movzx           ebx,ax
0036  83 FB 41                          cmp             ebx,0x00000041
0039  7C 0A                             jl              L$4
003B  83 FB 5A                          cmp             ebx,0x0000005a
003E  7F 05                             jg              L$4
0040  05 20 00 00 00                    add             eax,0x00000020
0045                            L$4:
0045  0F B7 DA                          movzx           ebx,dx
0048  83 FB 41                          cmp             ebx,0x00000041
004B  7C 08                             jl              L$5
004D  83 FB 5A                          cmp             ebx,0x0000005a
0050  7F 03                             jg              L$5
0052  83 C2 20                          add             edx,0x00000020
0055                            L$5:
0055  66 39 D0                          cmp             ax,dx
0058  74 0C                             je              L$6
005A  0F B7 C0                          movzx           eax,ax
005D  0F B7 DA                          movzx           ebx,dx
0060  29 D8                             sub             eax,ebx
0062  5D                                pop             ebp
0063  5E                                pop             esi
0064  5B                                pop             ebx
0065  C3                                ret
0066                            L$6:
0066  66 85 D2                          test            dx,dx
0069  74 A6                             je              L$2
006B  FF 4D 18                          dec             dword ptr 0x18[ebp]
006E  46                                inc             esi
006F  46                                inc             esi
0070  41                                inc             ecx
0071  41                                inc             ecx
0072  EB 97                             jmp             L$1

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

