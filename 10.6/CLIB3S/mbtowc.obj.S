Module: mbtowc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000099 bytes
0000                            mbtowc:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
0009  85 C9                             test            ecx,ecx
000B  75 04                             jne             L$2
000D                            L$1:
000D  31 C0                             xor             eax,eax
000F  5B                                pop             ebx
0010  C3                                ret
0011                            L$2:
0011  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0016  74 F5                             je              L$1
0018  8A 11                             mov             dl,byte ptr [ecx]
001A  85 DB                             test            ebx,ebx
001C  74 07                             je              L$3
001E  30 E4                             xor             ah,ah
0020  88 D0                             mov             al,dl
0022  66 89 03                          mov             word ptr [ebx],ax
0025                            L$3:
0025  84 D2                             test            dl,dl
0027  74 E4                             je              L$1
0029  31 C0                             xor             eax,eax
002B  88 D0                             mov             al,dl
002D  3D 81 00 00 00                    cmp             eax,0x00000081
0032  7C 07                             jl              L$4
0034  3D 9F 00 00 00                    cmp             eax,0x0000009f
0039  7E 12                             jle             L$5
003B                            L$4:
003B  31 C0                             xor             eax,eax
003D  88 D0                             mov             al,dl
003F  3D E0 00 00 00                    cmp             eax,0x000000e0
0044  7C 4C                             jl              L$10
0046  3D FC 00 00 00                    cmp             eax,0x000000fc
004B  7F 45                             jg              L$10
004D                            L$5:
004D  83 7C 24 10 01                    cmp             dword ptr 0x10[esp],0x00000001
0052  76 05                             jbe             L$6
0054  8A 71 01                          mov             dh,byte ptr 0x1[ecx]
0057  EB 02                             jmp             L$7
0059                            L$6:
0059  30 F6                             xor             dh,dh
005B                            L$7:
005B  31 C0                             xor             eax,eax
005D  88 F0                             mov             al,dh
005F  83 F8 40                          cmp             eax,0x00000040
0062  7C 27                             jl              L$9
0064  3D FC 00 00 00                    cmp             eax,0x000000fc
0069  7F 20                             jg              L$9
006B  83 F8 7F                          cmp             eax,0x0000007f
006E  74 1B                             je              L$9
0070  85 DB                             test            ebx,ebx
0072  74 10                             je              L$8
0074  30 E4                             xor             ah,ah
0076  88 D0                             mov             al,dl
0078  C1 E0 08                          shl             eax,0x08
007B  88 F2                             mov             dl,dh
007D  30 F6                             xor             dh,dh
007F  01 D0                             add             eax,edx
0081  66 89 03                          mov             word ptr [ebx],ax
0084                            L$8:
0084  B8 02 00 00 00                    mov             eax,0x00000002
0089  5B                                pop             ebx
008A  C3                                ret
008B                            L$9:
008B  B8 FF FF FF FF                    mov             eax,0xffffffff
0090  5B                                pop             ebx
0091  C3                                ret
0092                            L$10:
0092  B8 01 00 00 00                    mov             eax,0x00000001
0097  5B                                pop             ebx
0098  C3                                ret

Routine Size: 153 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

