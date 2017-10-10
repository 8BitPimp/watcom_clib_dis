Module: ustricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            _ustrcmpi:
0000  55                                push            ebp
0001  89 E5                             mov             ebp,esp
0003  FF 75 0C                          push            dword ptr 0xc[ebp]
0006  FF 75 08                          push            dword ptr 0x8[ebp]
0009  E8 00 00 00 00                    call            _ustricmp
000E  83 C4 08                          add             esp,0x00000008
0011  5D                                pop             ebp
0012  C3                                ret

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

0013                            _ustricmp:
0013  53                                push            ebx
0014  55                                push            ebp
0015  89 E5                             mov             ebp,esp
0017  8B 4D 0C                          mov             ecx,dword ptr 0xc[ebp]
001A  8B 5D 10                          mov             ebx,dword ptr 0x10[ebp]
001D                            L$1:
001D  66 8B 01                          mov             ax,word ptr [ecx]
0020  66 8B 13                          mov             dx,word ptr [ebx]
0023  F6 C4 FF                          test            ah,0xff
0026  75 25                             jne             L$3
0028  F6 C6 FF                          test            dh,0xff
002B  75 20                             jne             L$3
002D  66 3D 41 00                       cmp             ax,0x0041
0031  72 0B                             jb              L$2
0033  66 3D 5A 00                       cmp             ax,0x005a
0037  77 05                             ja              L$2
0039  05 20 00 00 00                    add             eax,0x00000020
003E                            L$2:
003E  66 83 FA 41                       cmp             dx,0x0041
0042  72 09                             jb              L$3
0044  66 83 FA 5A                       cmp             dx,0x005a
0048  77 03                             ja              L$3
004A  83 C2 20                          add             edx,0x00000020
004D                            L$3:
004D  66 39 D0                          cmp             ax,dx
0050  75 0B                             jne             L$4
0052  66 85 D2                          test            dx,dx
0055  74 06                             je              L$4
0057  41                                inc             ecx
0058  41                                inc             ecx
0059  43                                inc             ebx
005A  43                                inc             ebx
005B  EB C0                             jmp             L$1
005D                            L$4:
005D  0F B7 C0                          movzx           eax,ax
0060  0F B7 DA                          movzx           ebx,dx
0063  29 D8                             sub             eax,ebx
0065  5D                                pop             ebp
0066  5B                                pop             ebx
0067  C3                                ret

Routine Size: 85 bytes,    Routine Base: _TEXT + 0013

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

