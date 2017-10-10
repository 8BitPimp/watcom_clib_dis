Module: conutwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B0 bytes
0000                            __NTRealKey:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  31 D2                             xor             edx,edx
0006  66 8B 10                          mov             dx,word ptr [eax]
0009  83 FA 01                          cmp             edx,0x00000001
000C  75 1C                             jne             L$2
000E  83 78 04 00                       cmp             dword ptr 0x4[eax],0x00000000
0012  74 16                             je              L$2
0014  66 8B 40 0A                       mov             ax,word ptr 0xa[eax]
0018  66 3D 10 00                       cmp             ax,0x0010
001C  72 06                             jb              L$1
001E  66 3D 12 00                       cmp             ax,0x0012
0022  76 06                             jbe             L$2
0024                            L$1:
0024  B8 01 00 00 00                    mov             eax,0x00000001
0029  C3                                ret
002A                            L$2:
002A  31 C0                             xor             eax,eax
002C  C3                                ret
002D                            initConsoleHandles:
002D  6A 00                             push            0x00000000
002F  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0035  8B 15 00 00 00 00                 mov             edx,dword ptr console_in
003B  83 C4 04                          add             esp,0x00000004
003E  83 FA FF                          cmp             edx,0xffffffff
0041  75 21                             jne             L$3
0043  6A 00                             push            0x00000000
0045  68 80 00 00 00                    push            0x00000080
004A  6A 03                             push            0x00000003
004C  6A 00                             push            0x00000000
004E  6A 01                             push            0x00000001
0050  68 00 00 00 80                    push            0x80000000
0055  68 00 00 00 00                    push            offset DGROUP:L$5
005A  E8 00 00 00 00                    call            _CreateFileA
005F  A3 00 00 00 00                    mov             dword ptr console_in,eax
0064                            L$3:
0064  83 3D 00 00 00 00 FF              cmp             dword ptr console_out,0xffffffff
006B  75 21                             jne             L$4
006D  6A 00                             push            0x00000000
006F  68 80 00 00 00                    push            0x00000080
0074  6A 03                             push            0x00000003
0076  6A 00                             push            0x00000000
0078  6A 02                             push            0x00000002
007A  68 00 00 00 40                    push            0x40000000
007F  68 07 00 00 00                    push            offset DGROUP:L$6
0084  E8 00 00 00 00                    call            _CreateFileA
0089  A3 00 00 00 00                    mov             dword ptr console_out,eax
008E                            L$4:
008E  6A 00                             push            0x00000000
0090  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0096  83 C4 04                          add             esp,0x00000004
0099  C3                                ret

Routine Size: 154 bytes,    Routine Base: _TEXT + 0000

009A                            __NTConsoleInput:
009A  E8 00 00 00 00                    call            initConsoleHandles
009F  A1 00 00 00 00                    mov             eax,dword ptr console_in
00A4  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 009A

00A5                            __NTConsoleOutput:
00A5  E8 00 00 00 00                    call            initConsoleHandles
00AA  A1 00 00 00 00                    mov             eax,dword ptr console_out
00AF  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 00A5

No disassembly errors

Segment: CONST DWORD USE32 0000000F bytes
0000                            L$5:
0000  63 6F 6E 69 6E 24 00                            conin$.
0007                            L$6:
0007  63 6F 6E 6F 75 74 24 00                         conout$.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000                            console_in:
0000  FF FF FF FF                                     ....
0004                            console_out:
0004  FF FF FF FF                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

