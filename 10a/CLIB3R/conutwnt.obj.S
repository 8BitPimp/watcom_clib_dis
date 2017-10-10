Module: conutwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A6 bytes
0000                            __NTRealKey_:
0000  66 83 38 01                       cmp             word ptr [eax],0x0001
0004  75 1C                             jne             L$2
0006  83 78 04 00                       cmp             dword ptr 0x4[eax],0x00000000
000A  74 16                             je              L$2
000C  66 8B 40 0A                       mov             ax,word ptr 0xa[eax]
0010  66 3D 10 00                       cmp             ax,0x0010
0014  72 06                             jb              L$1
0016  66 3D 12 00                       cmp             ax,0x0012
001A  76 06                             jbe             L$2
001C                            L$1:
001C  B8 01 00 00 00                    mov             eax,0x00000001
0021  C3                                ret
0022                            L$2:
0022  31 C0                             xor             eax,eax
0024  C3                                ret
0025                            initConsoleHandles_:
0025  53                                push            ebx
0026  51                                push            ecx
0027  52                                push            edx
0028  31 C0                             xor             eax,eax
002A  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0030  8B 15 00 00 00 00                 mov             edx,dword ptr _consoles_opened
0036  85 D2                             test            edx,edx
0038  75 4A                             jne             L$3
003A  52                                push            edx
003B  68 80 00 00 00                    push            0x00000080
0040  6A 03                             push            0x00000003
0042  52                                push            edx
0043  BB 01 00 00 00                    mov             ebx,0x00000001
0048  53                                push            ebx
0049  68 00 00 00 80                    push            0x80000000
004E  68 00 00 00 00                    push            offset DGROUP:L$4
0053  89 1D 00 00 00 00                 mov             dword ptr _consoles_opened,ebx
0059  E8 00 00 00 00                    call            _CreateFileA
005E  6A 00                             push            0x00000000
0060  68 80 00 00 00                    push            0x00000080
0065  6A 03                             push            0x00000003
0067  6A 00                             push            0x00000000
0069  6A 02                             push            0x00000002
006B  68 00 00 00 40                    push            0x40000000
0070  68 07 00 00 00                    push            offset DGROUP:L$5
0075  A3 00 00 00 00                    mov             dword ptr _console_in,eax
007A  E8 00 00 00 00                    call            _CreateFileA
007F  A3 00 00 00 00                    mov             dword ptr _console_out,eax
0084                            L$3:
0084  31 C0                             xor             eax,eax
0086  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
008C  5A                                pop             edx
008D  59                                pop             ecx
008E  5B                                pop             ebx
008F  C3                                ret

Routine Size: 144 bytes,    Routine Base: _TEXT + 0000

0090                            __NTConsoleInput_:
0090  E8 00 00 00 00                    call            initConsoleHandles_
0095  A1 00 00 00 00                    mov             eax,dword ptr _console_in
009A  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 0090

009B                            __NTConsoleOutput_:
009B  E8 00 00 00 00                    call            initConsoleHandles_
00A0  A1 00 00 00 00                    mov             eax,dword ptr _console_out
00A5  C3                                ret

Routine Size: 11 bytes,    Routine Base: _TEXT + 009B

No disassembly errors

Segment: CONST DWORD USE32 0000000F bytes
0000                            L$4:
0000  63 6F 6E 69 6E 24 00                            conin$.
0007                            L$5:
0007  63 6F 6E 6F 75 74 24 00                         conout$.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000C bytes
0000                            _console_out:
0004                            _console_in:
0008                            _consoles_opened:

BSS Size: 12 bytes

