Module: fdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000126 bytes
0000                            fdopen:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
000B  83 FD FF                          cmp             ebp,0xffffffff
000E  75 11                             jne             L$2
0010  6A 04                             push            0x00000004
0012  E8 00 00 00 00                    call            __set_errno
0017  83 C4 04                          add             esp,0x00000004
001A                            L$1:
001A  31 C0                             xor             eax,eax
001C  E9 9E 00 00 00                    jmp             L$5
0021                            L$2:
0021  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0025  52                                push            edx
0026  E8 00 00 00 00                    call            __open_flags
002B  83 C4 04                          add             esp,0x00000004
002E  89 C6                             mov             esi,eax
0030  89 04 24                          mov             dword ptr [esp],eax
0033  85 C0                             test            eax,eax
0035  0F 84 84 00 00 00                 je              L$5
003B  50                                push            eax
003C  55                                push            ebp
003D  E8 00 00 00 00                    call            __iomode
0042  83 C4 08                          add             esp,0x00000008
0045  83 F8 FF                          cmp             eax,0xffffffff
0048  74 D0                             je              L$1
004A  55                                push            ebp
004B  E8 00 00 00 00                    call            __allocfp
0050  89 C3                             mov             ebx,eax
0052  83 C4 04                          add             esp,0x00000004
0055  89 C7                             mov             edi,eax
0057  85 C0                             test            eax,eax
0059  74 62                             je              L$4
005B  8A 60 0C                          mov             ah,byte ptr 0xc[eax]
005E  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
0065  C7 43 08 00 00 00 00              mov             dword ptr 0x8[ebx],0x00000000
006C  80 E4 FC                          and             ah,0xfc
006F  C7 43 14 00 00 00 00              mov             dword ptr 0x14[ebx],0x00000000
0076  88 63 0C                          mov             byte ptr 0xc[ebx],ah
0079  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
007C  89 6B 10                          mov             dword ptr 0x10[ebx],ebp
007F  09 F1                             or              ecx,esi
0081  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0085  31 C0                             xor             eax,eax
0087  89 4B 0C                          mov             dword ptr 0xc[ebx],ecx
008A  8A 06                             mov             al,byte ptr [esi]
008C  50                                push            eax
008D  E8 00 00 00 00                    call            tolower
0092  83 C4 04                          add             esp,0x00000004
0095  83 F8 61                          cmp             eax,0x00000061
0098  75 0D                             jne             L$3
009A  6A 02                             push            0x00000002
009C  6A 00                             push            0x00000000
009E  53                                push            ebx
009F  E8 00 00 00 00                    call            fseek
00A4  83 C4 0C                          add             esp,0x0000000c
00A7                            L$3:
00A7  57                                push            edi
00A8  E8 00 00 00 00                    call            __chktty
00AD  83 C4 04                          add             esp,0x00000004
00B0  8B 34 24                          mov             esi,dword ptr [esp]
00B3  56                                push            esi
00B4  55                                push            ebp
00B5  E8 00 00 00 00                    call            __SetIOMode
00BA  83 C4 08                          add             esp,0x00000008
00BD                            L$4:
00BD  89 F8                             mov             eax,edi
00BF                            L$5:
00BF  83 C4 04                          add             esp,0x00000004
00C2  5D                                pop             ebp
00C3  5F                                pop             edi
00C4  5E                                pop             esi
00C5  5B                                pop             ebx
00C6  C3                                ret
00C7                            __iomode:
00C7  53                                push            ebx
00C8  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
00CC  52                                push            edx
00CD  E8 00 00 00 00                    call            __IOMode
00D2  83 C4 04                          add             esp,0x00000004
00D5  89 C2                             mov             edx,eax
00D7  8B 4C 24 0C                       mov             ecx,dword ptr 0xc[esp]
00DB  89 C3                             mov             ebx,eax
00DD  31 CA                             xor             edx,ecx
00DF  31 C0                             xor             eax,eax
00E1  F6 C2 C0                          test            dl,0xc0
00E4  74 05                             je              L$6
00E6  B8 06 00 00 00                    mov             eax,0x00000006
00EB                            L$6:
00EB  F6 44 24 0C 01                    test            byte ptr 0xc[esp],0x01
00F0  74 0A                             je              L$7
00F2  F6 C3 01                          test            bl,0x01
00F5  75 05                             jne             L$7
00F7  B8 06 00 00 00                    mov             eax,0x00000006
00FC                            L$7:
00FC  F6 44 24 0C 02                    test            byte ptr 0xc[esp],0x02
0101  74 0A                             je              L$8
0103  F6 C3 02                          test            bl,0x02
0106  75 05                             jne             L$8
0108  B8 06 00 00 00                    mov             eax,0x00000006
010D                            L$8:
010D  83 F8 06                          cmp             eax,0x00000006
0110  75 10                             jne             L$9
0112  50                                push            eax
0113  E8 00 00 00 00                    call            __set_errno
0118  B8 FF FF FF FF                    mov             eax,0xffffffff
011D  83 C4 04                          add             esp,0x00000004
0120  5B                                pop             ebx
0121  C3                                ret
0122                            L$9:
0122  31 C0                             xor             eax,eax
0124  5B                                pop             ebx
0125  C3                                ret

Routine Size: 294 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

