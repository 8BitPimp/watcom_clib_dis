Module: filewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D8 bytes
0000                            _dos_open_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 0C                          sub             esp,0x0000000c
0007  50                                push            eax
0008  89 D1                             mov             ecx,edx
000A  89 DD                             mov             ebp,ebx
000C  E8 00 00 00 00                    call            __NTAtMaxFiles_
0011  85 C0                             test            eax,eax
0013  74 14                             je              L$1
0015  B8 0B 00 00 00                    mov             eax,0x0000000b
001A  E8 00 00 00 00                    call            __set_errno_
001F  B8 FF FF FF FF                    mov             eax,0xffffffff
0024  E9 7C 00 00 00                    jmp             L$6
0029                            L$1:
0029  89 D6                             mov             esi,edx
002B  8D 5C 24 04                       lea             ebx,0x4[esp]
002F  83 E6 07                          and             esi,0x00000007
0032  8D 54 24 08                       lea             edx,0x8[esp]
0036  89 F0                             mov             eax,esi
0038  E8 00 00 00 00                    call            __GetNTAccessAttr_
003D  89 C8                             mov             eax,ecx
003F  8D 54 24 0C                       lea             edx,0xc[esp]
0043  83 E0 70                          and             eax,0x00000070
0046  E8 00 00 00 00                    call            __GetNTShareAttr_
004B  6A 00                             push            0x00000000
004D  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0051  52                                push            edx
0052  6A 03                             push            0x00000003
0054  6A 00                             push            0x00000000
0056  8B 5C 24 1C                       mov             ebx,dword ptr 0x1c[esp]
005A  53                                push            ebx
005B  8B 4C 24 1C                       mov             ecx,dword ptr 0x1c[esp]
005F  51                                push            ecx
0060  8B 44 24 18                       mov             eax,dword ptr 0x18[esp]
0064  50                                push            eax
0065  E8 00 00 00 00                    call            _CreateFileA
006A  83 F8 FF                          cmp             eax,0xffffffff
006D  75 07                             jne             L$2
006F  E8 00 00 00 00                    call            __set_errno_nt_
0074  EB 2F                             jmp             L$6
0076                            L$2:
0076  FF 15 00 00 00 00                 call            dword ptr __InitAccessH
007C  89 45 00                          mov             dword ptr [ebp],eax
007F  83 FE 02                          cmp             esi,0x00000002
0082  75 05                             jne             L$3
0084  BF 03 00 00 00                    mov             edi,0x00000003
0089                            L$3:
0089  85 F6                             test            esi,esi
008B  75 05                             jne             L$4
008D  BF 01 00 00 00                    mov             edi,0x00000001
0092                            L$4:
0092  83 FE 01                          cmp             esi,0x00000001
0095  75 05                             jne             L$5
0097  BF 02 00 00 00                    mov             edi,0x00000002
009C                            L$5:
009C  89 FA                             mov             edx,edi
009E  E8 00 00 00 00                    call            __SetIOMode_
00A3  31 C0                             xor             eax,eax
00A5                            L$6:
00A5  83 C4 10                          add             esp,0x00000010
00A8  5D                                pop             ebp
00A9  5F                                pop             edi
00AA  5E                                pop             esi
00AB  59                                pop             ecx
00AC  C3                                ret

Routine Size: 173 bytes,    Routine Base: _TEXT + 0000

00AD                            _dos_close_:
00AD  E9 00 00 00 00                    jmp             close_

Routine Size: 5 bytes,    Routine Base: _TEXT + 00AD

00B2                            _dos_commit_:
00B2  51                                push            ecx
00B3  52                                push            edx
00B4  89 C2                             mov             edx,eax
00B6  A1 00 00 00 00                    mov             eax,dword ptr ___FileHandleIDs
00BB  C1 E2 02                          shl             edx,0x02
00BE  8B 04 02                          mov             eax,dword ptr [edx+eax]
00C1  50                                push            eax
00C2  E8 00 00 00 00                    call            _FlushFileBuffers
00C7  85 C0                             test            eax,eax
00C9  75 08                             jne             L$7
00CB  E8 00 00 00 00                    call            __set_errno_nt_
00D0  5A                                pop             edx
00D1  59                                pop             ecx
00D2  C3                                ret
00D3                            L$7:
00D3  31 C0                             xor             eax,eax
00D5  5A                                pop             edx
00D6  59                                pop             ecx
00D7  C3                                ret

Routine Size: 38 bytes,    Routine Base: _TEXT + 00B2

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

