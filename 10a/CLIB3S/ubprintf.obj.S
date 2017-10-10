Module: ubprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000                            buf_putc:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0007  8B 02                             mov             eax,dword ptr [edx]
0009  8B 5A 10                          mov             ebx,dword ptr 0x10[edx]
000C  3B 58 04                          cmp             ebx,dword ptr 0x4[eax]
000F  73 10                             jae             L$1
0011  8B 18                             mov             ebx,dword ptr [eax]
0013  8D 4B 02                          lea             ecx,0x2[ebx]
0016  89 08                             mov             dword ptr [eax],ecx
0018  8B 45 10                          mov             eax,dword ptr 0x10[ebp]
001B  66 89 03                          mov             word ptr [ebx],ax
001E  FF 42 10                          inc             dword ptr 0x10[edx]
0021                            L$1:
0021  5D                                pop             ebp
0022  5B                                pop             ebx
0023  C3                                ret

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024                            _u_vbprintf:
0024  C8 08 00 00                       enter           0x0008,0x00
0028  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
002B  68 00 00 00 00                    push            offset buf_putc
0030  89 45 F8                          mov             dword ptr -0x8[ebp],eax
0033  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0036  FF 75 14                          push            dword ptr 0x14[ebp]
0039  48                                dec             eax
003A  FF 75 10                          push            dword ptr 0x10[ebp]
003D  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0040  8D 45 F8                          lea             eax,-0x8[ebp]
0043  50                                push            eax
0044  E8 00 00 00 00                    call            __uprtf
0049  8D 14 00                          lea             edx,[eax+eax]
004C  03 55 08                          add             edx,dword ptr 0x8[ebp]
004F  83 C4 10                          add             esp,0x00000010
0052  66 C7 02 00 00                    mov             word ptr [edx],0x0000
0057  C9                                leave
0058  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0024

0059                            _u_bprintf:
0059  C8 04 00 00                       enter           0x0004,0x00
005D  8D 45 14                          lea             eax,0x14[ebp]
0060  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0063  8D 45 FC                          lea             eax,-0x4[ebp]
0066  50                                push            eax
0067  FF 75 10                          push            dword ptr 0x10[ebp]
006A  FF 75 0C                          push            dword ptr 0xc[ebp]
006D  FF 75 08                          push            dword ptr 0x8[ebp]
0070  E8 00 00 00 00                    call            _u_vbprintf
0075  83 C4 10                          add             esp,0x00000010
0078  C9                                leave
0079  C3                                ret

Routine Size: 33 bytes,    Routine Base: _TEXT + 0059

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

