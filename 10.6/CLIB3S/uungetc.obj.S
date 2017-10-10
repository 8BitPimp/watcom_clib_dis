Module: uungetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D8 bytes
0000                            _uungetc:
0000  53                                push            ebx
0001  56                                push            esi
0002  55                                push            ebp
0003  89 E5                             mov             ebp,esp
0005  8B 75 10                          mov             esi,dword ptr 0x10[ebp]
0008  8B 5D 14                          mov             ebx,dword ptr 0x14[ebp]
000B  83 FE FF                          cmp             esi,0xffffffff
000E  75 06                             jne             L$1
0010  89 F0                             mov             eax,esi
0012  5D                                pop             ebp
0013  5E                                pop             esi
0014  5B                                pop             ebx
0015  C3                                ret
0016                            L$1:
0016  FF 73 10                          push            dword ptr 0x10[ebx]
0019  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
001F  83 C4 04                          add             esp,0x00000004
0022  F6 43 0D 10                       test            byte ptr 0xd[ebx],0x10
0026  74 15                             je              L$3
0028                            L$2:
0028  FF 73 10                          push            dword ptr 0x10[ebx]
002B  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0031  B8 FF FF FF FF                    mov             eax,0xffffffff
0036  83 C4 04                          add             esp,0x00000004
0039  5D                                pop             ebp
003A  5E                                pop             esi
003B  5B                                pop             ebx
003C  C3                                ret
003D                            L$3:
003D  F6 43 0C 01                       test            byte ptr 0xc[ebx],0x01
0041  74 E5                             je              L$2
0043  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
0047  75 09                             jne             L$4
0049  53                                push            ebx
004A  E8 00 00 00 00                    call            __ioalloc
004F  83 C4 04                          add             esp,0x00000004
0052                            L$4:
0052  8D 43 18                          lea             eax,0x18[ebx]
0055  3B 43 08                          cmp             eax,dword ptr 0x8[ebx]
0058  75 0D                             jne             L$5
005A  6A 02                             push            0x00000002
005C  E8 00 00 00 00                    call            malloc
0061  83 C4 04                          add             esp,0x00000004
0064  89 43 08                          mov             dword ptr 0x8[ebx],eax
0067                            L$5:
0067  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
006B  75 11                             jne             L$6
006D  6A 01                             push            0x00000001
006F  68 00 00 00 00                    push            offset DGROUP:L$11
0074  E8 00 00 00 00                    call            __fatal_runtime_error
0079  83 C4 08                          add             esp,0x00000008
007C  EB 04                             jmp             L$7
007E                            L$6:
007E  80 4B 0C 08                       or              byte ptr 0xc[ebx],0x08
0082                            L$7:
0082  83 7B 04 00                       cmp             dword ptr 0x4[ebx],0x00000000
0086  75 19                             jne             L$8
0088  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
008B  03 43 14                          add             eax,dword ptr 0x14[ebx]
008E  C7 43 04 02 00 00 00              mov             dword ptr 0x4[ebx],0x00000002
0095  48                                dec             eax
0096  48                                dec             eax
0097  89 03                             mov             dword ptr [ebx],eax
0099  8B 03                             mov             eax,dword ptr [ebx]
009B  80 4B 0C 04                       or              byte ptr 0xc[ebx],0x04
009F  EB 1D                             jmp             L$10
00A1                            L$8:
00A1  8B 03                             mov             eax,dword ptr [ebx]
00A3  3B 43 08                          cmp             eax,dword ptr 0x8[ebx]
00A6  74 80                             je              L$2
00A8  83 2B 02                          sub             dword ptr [ebx],0x00000002
00AB  8B 03                             mov             eax,dword ptr [ebx]
00AD  83 43 04 02                       add             dword ptr 0x4[ebx],0x00000002
00B1  0F B7 00                          movzx           eax,word ptr [eax]
00B4  39 F0                             cmp             eax,esi
00B6  74 04                             je              L$9
00B8  80 4B 0C 04                       or              byte ptr 0xc[ebx],0x04
00BC                            L$9:
00BC  8B 03                             mov             eax,dword ptr [ebx]
00BE                            L$10:
00BE  66 89 30                          mov             word ptr [eax],si
00C1  FF 73 10                          push            dword ptr 0x10[ebx]
00C4  80 63 0C EF                       and             byte ptr 0xc[ebx],0xef
00C8  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
00CE  83 C4 04                          add             esp,0x00000004
00D1  0F B7 C6                          movzx           eax,si
00D4  5D                                pop             ebp
00D5  5E                                pop             esi
00D6  5B                                pop             ebx
00D7  C3                                ret

Routine Size: 216 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000038 bytes
0000                            L$11:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 55 4E y to allocate UN
0020  49 43 4F 44 45 20 66 69 6C 65 20 73 74 72 75 63 ICODE file struc
0030  74 75 72 65 73 0D 0A 00                         tures...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

