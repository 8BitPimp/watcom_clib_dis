Module: dospnwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000145 bytes
0000                            __dospawn:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 58                          sub             esp,0x00000058
0007  6A 00                             push            0x00000000
0009  8B 54 24 78                       mov             edx,dword ptr 0x78[esp]
000D  52                                push            edx
000E  8B 9C 24 84 00 00 00              mov             ebx,dword ptr 0x84[esp]
0015  53                                push            ebx
0016  8B 4C 24 7C                       mov             ecx,dword ptr 0x7c[esp]
001A  51                                push            ecx
001B  E8 00 00 00 00                    call            __ccmdline
0020  83 C4 10                          add             esp,0x00000010
0023  6A 44                             push            0x00000044
0025  6A 00                             push            0x00000000
0027  8D 44 24 08                       lea             eax,0x8[esp]
002B  50                                push            eax
002C  E8 00 00 00 00                    call            memset
0031  83 C4 0C                          add             esp,0x0000000c
0034  8D 44 24 44                       lea             eax,0x44[esp]
0038  50                                push            eax
0039  8D 44 24 04                       lea             eax,0x4[esp]
003D  50                                push            eax
003E  6A 00                             push            0x00000000
0040  8B B4 24 84 00 00 00              mov             esi,dword ptr 0x84[esp]
0047  56                                push            esi
0048  6A 00                             push            0x00000000
004A  6A 01                             push            0x00000001
004C  6A 00                             push            0x00000000
004E  6A 00                             push            0x00000000
0050  8B BC 24 94 00 00 00              mov             edi,dword ptr 0x94[esp]
0057  57                                push            edi
0058  BA 01 00 00 00                    mov             edx,0x00000001
005D  6A 00                             push            0x00000000
005F  66 89 54 24 58                    mov             word ptr 0x58[esp],dx
0064  E8 00 00 00 00                    call            _CreateProcessA
0069  85 C0                             test            eax,eax
006B  75 2D                             jne             L$3
006D  E8 00 00 00 00                    call            _GetLastError
0072  89 C2                             mov             edx,eax
0074  83 F8 05                          cmp             eax,0x00000005
0077  74 0E                             je              L$1
0079  3D C1 00 00 00                    cmp             eax,0x000000c1
007E  74 07                             je              L$1
0080  3D A1 00 00 00                    cmp             eax,0x000000a1
0085  75 05                             jne             L$2
0087                            L$1:
0087  BA 02 00 00 00                    mov             edx,0x00000002
008C                            L$2:
008C  52                                push            edx
008D  E8 00 00 00 00                    call            __set_errno_dos
0092  83 C4 04                          add             esp,0x00000004
0095  E9 A3 00 00 00                    jmp             L$10
009A                            L$3:
009A  83 7C 24 6C 00                    cmp             dword ptr 0x6c[esp],0x00000000
009F  0F 85 78 00 00 00                 jne             L$7
00A5  66 A1 00 00 00 00                 mov             ax,word ptr _osbuild
00AB  30 C0                             xor             al,al
00AD  80 E4 80                          and             ah,0x80
00B0  25 FF FF 00 00                    and             eax,0x0000ffff
00B5  74 3E                             je              L$5
00B7  68 E8 03 00 00                    push            0x000003e8
00BC  BB 03 01 00 00                    mov             ebx,0x00000103
00C1  E8 00 00 00 00                    call            _Sleep
00C6  89 5C 24 54                       mov             dword ptr 0x54[esp],ebx
00CA                            L$4:
00CA  81 7C 24 54 03 01 00 00           cmp             dword ptr 0x54[esp],0x00000103
00D2  75 51                             jne             L$9
00D4  6A 64                             push            0x00000064
00D6  E8 00 00 00 00                    call            _Sleep
00DB  8D 44 24 54                       lea             eax,0x54[esp]
00DF  50                                push            eax
00E0  8B 74 24 48                       mov             esi,dword ptr 0x48[esp]
00E4  56                                push            esi
00E5  E8 00 00 00 00                    call            _GetExitCodeProcess
00EA  85 C0                             test            eax,eax
00EC  75 DC                             jne             L$4
00EE  E8 00 00 00 00                    call            __set_errno_nt
00F3  EB 48                             jmp             L$10
00F5                            L$5:
00F5  6A FF                             push            0xffffffff
00F7  8B 44 24 48                       mov             eax,dword ptr 0x48[esp]
00FB  50                                push            eax
00FC  E8 00 00 00 00                    call            _WaitForSingleObject
0101  85 C0                             test            eax,eax
0103  75 11                             jne             L$6
0105  8D 44 24 54                       lea             eax,0x54[esp]
0109  50                                push            eax
010A  8B 54 24 48                       mov             edx,dword ptr 0x48[esp]
010E  52                                push            edx
010F  E8 00 00 00 00                    call            _GetExitCodeProcess
0114  EB 0F                             jmp             L$9
0116                            L$6:
0116  E8 00 00 00 00                    call            __set_errno_nt
011B  EB 04                             jmp             L$8
011D                            L$7:
011D  8B 44 24 4C                       mov             eax,dword ptr 0x4c[esp]
0121                            L$8:
0121  89 44 24 54                       mov             dword ptr 0x54[esp],eax
0125                            L$9:
0125  8B 7C 24 44                       mov             edi,dword ptr 0x44[esp]
0129  57                                push            edi
012A  E8 00 00 00 00                    call            _CloseHandle
012F  8B 6C 24 48                       mov             ebp,dword ptr 0x48[esp]
0133  55                                push            ebp
0134  E8 00 00 00 00                    call            _CloseHandle
0139  8B 44 24 54                       mov             eax,dword ptr 0x54[esp]
013D                            L$10:
013D  83 C4 58                          add             esp,0x00000058
0140  5D                                pop             ebp
0141  5F                                pop             edi
0142  5E                                pop             esi
0143  5B                                pop             ebx
0144  C3                                ret

Routine Size: 325 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

