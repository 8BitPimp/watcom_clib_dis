Module: ufputc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            write_wide_char:
0000  53                                push            ebx
0001  C8 04 00 00                       enter           0x0004,0x00
0005  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0008  F6 43 0C 40                       test            byte ptr 0xc[ebx],0x40
000C  74 14                             je              L$2
000E  53                                push            ebx
000F  6A 01                             push            0x00000001
0011  6A 02                             push            0x00000002
0013  8D 45 10                          lea             eax,0x10[ebp]
0016                            L$1:
0016  50                                push            eax
0017  E8 00 00 00 00                    call            fwrite
001C  83 C4 10                          add             esp,0x00000010
001F  C9                                leave
0020  5B                                pop             ebx
0021  C3                                ret
0022                            L$2:
0022  0F B7 45 10                       movzx           eax,word ptr 0x10[ebp]
0026  50                                push            eax
0027  8D 45 FC                          lea             eax,-0x4[ebp]
002A  50                                push            eax
002B  E8 00 00 00 00                    call            wctomb
0030  83 C4 08                          add             esp,0x00000008
0033  85 C0                             test            eax,eax
0035  7E 09                             jle             L$3
0037  53                                push            ebx
0038  6A 01                             push            0x00000001
003A  50                                push            eax
003B  8D 45 FC                          lea             eax,-0x4[ebp]
003E  EB D6                             jmp             L$1
0040                            L$3:
0040  31 C0                             xor             eax,eax
0042  C9                                leave
0043  5B                                pop             ebx
0044  C3                                ret

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

0045                            _ufputc:
0045  55                                push            ebp
0046  89 E5                             mov             ebp,esp
0048  0F B7 45 08                       movzx           eax,word ptr 0x8[ebp]
004C  50                                push            eax
004D  FF 75 0C                          push            dword ptr 0xc[ebp]
0050  E8 00 00 00 00                    call            write_wide_char
0055  83 C4 08                          add             esp,0x00000008
0058  85 C0                             test            eax,eax
005A  75 07                             jne             L$4
005C  B8 FF FF FF FF                    mov             eax,0xffffffff
0061  5D                                pop             ebp
0062  C3                                ret
0063                            L$4:
0063  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
0066  5D                                pop             ebp
0067  C3                                ret

Routine Size: 35 bytes,    Routine Base: _TEXT + 0045

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

