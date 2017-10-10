Module: usscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007F bytes
0000                            cget_string:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0007  8B 50 08                          mov             edx,dword ptr 0x8[eax]
000A  0F B7 1A                          movzx           ebx,word ptr [edx]
000D  85 DB                             test            ebx,ebx
000F  74 0A                             je              L$1
0011  42                                inc             edx
0012  42                                inc             edx
0013  89 50 08                          mov             dword ptr 0x8[eax],edx
0016  89 D8                             mov             eax,ebx
0018  5D                                pop             ebp
0019  5B                                pop             ebx
001A  C3                                ret
001B                            L$1:
001B  BB FF FF FF FF                    mov             ebx,0xffffffff
0020  80 48 10 02                       or              byte ptr 0x10[eax],0x02
0024  89 D8                             mov             eax,ebx
0026  5D                                pop             ebp
0027  5B                                pop             ebx
0028  C3                                ret
0029                            uncget_string:
0029  55                                push            ebp
002A  89 E5                             mov             ebp,esp
002C  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
002F  83 68 08 02                       sub             dword ptr 0x8[eax],0x00000002
0033  5D                                pop             ebp
0034  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

0035                            _uvsscanf:
0035  C8 14 00 00                       enter           0x0014,0x00
0039  FF 75 10                          push            dword ptr 0x10[ebp]
003C  8B 45 08                          mov             eax,dword ptr 0x8[ebp]
003F  FF 75 0C                          push            dword ptr 0xc[ebp]
0042  89 45 F4                          mov             dword ptr -0xc[ebp],eax
0045  8D 45 EC                          lea             eax,-0x14[ebp]
0048  50                                push            eax
0049  C7 45 EC 00 00 00 00              mov             dword ptr -0x14[ebp],offset cget_string
0050  C7 45 F0 00 00 00 00              mov             dword ptr -0x10[ebp],offset uncget_string
0057  E8 00 00 00 00                    call            __uscnf
005C  83 C4 0C                          add             esp,0x0000000c
005F  C9                                leave
0060  C3                                ret

Routine Size: 44 bytes,    Routine Base: _TEXT + 0035

0061                            _usscanf:
0061  C8 04 00 00                       enter           0x0004,0x00
0065  8D 45 10                          lea             eax,0x10[ebp]
0068  89 45 FC                          mov             dword ptr -0x4[ebp],eax
006B  8D 45 FC                          lea             eax,-0x4[ebp]
006E  50                                push            eax
006F  FF 75 0C                          push            dword ptr 0xc[ebp]
0072  FF 75 08                          push            dword ptr 0x8[ebp]
0075  E8 00 00 00 00                    call            _uvsscanf
007A  83 C4 0C                          add             esp,0x0000000c
007D  C9                                leave
007E  C3                                ret

Routine Size: 30 bytes,    Routine Base: _TEXT + 0061

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

