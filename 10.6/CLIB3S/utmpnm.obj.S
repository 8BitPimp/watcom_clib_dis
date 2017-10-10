Module: utmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000011C bytes
0000                            putbits:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0007  8B 5D 10                          mov             ebx,dword ptr 0x10[ebp]
000A  83 FB 1F                          cmp             ebx,0x0000001f
000D  76 12                             jbe             L$1
000F  89 DA                             mov             edx,ebx
0011  C1 EA 05                          shr             edx,0x05
0014  52                                push            edx
0015  50                                push            eax
0016  83 E3 1F                          and             ebx,0x0000001f
0019  E8 00 00 00 00                    call            putbits
001E  83 C4 08                          add             esp,0x00000008
0021                            L$1:
0021  83 FB 0A                          cmp             ebx,0x0000000a
0024  72 05                             jb              L$2
0026  83 C3 37                          add             ebx,0x00000037
0029  EB 03                             jmp             L$3
002B                            L$2:
002B  83 C3 30                          add             ebx,0x00000030
002E                            L$3:
002E  66 89 18                          mov             word ptr [eax],bx
0031  40                                inc             eax
0032  40                                inc             eax
0033  5D                                pop             ebp
0034  5B                                pop             ebx
0035  C3                                ret
0036                            init_name:
0036  53                                push            ebx
0037  66 C7 05 00 00 00 00 5F 00        mov             word ptr _tmpname,0x005f
0040  BB 00 00 00 00                    mov             ebx,offset _tmpname
0045  E8 00 00 00 00                    call            getpid
004A  50                                push            eax
004B  43                                inc             ebx
004C  43                                inc             ebx
004D  53                                push            ebx
004E  E8 00 00 00 00                    call            putbits
0053  8D 58 02                          lea             ebx,0x2[eax]
0056  66 C7 00 2E 00                    mov             word ptr [eax],0x002e
005B  66 C7 03 41 00                    mov             word ptr [ebx],0x0041
0060  43                                inc             ebx
0061  43                                inc             ebx
0062  66 C7 03 41 00                    mov             word ptr [ebx],0x0041
0067  43                                inc             ebx
0068  43                                inc             ebx
0069  89 D8                             mov             eax,ebx
006B  83 C4 08                          add             esp,0x00000008
006E  2D 00 00 00 00                    sub             eax,offset _tmpname
0073  66 C7 03 40 00                    mov             word ptr [ebx],0x0040
0078  D1 F8                             sar             eax,0x01
007A  5B                                pop             ebx
007B  C3                                ret

Routine Size: 124 bytes,    Routine Base: _TEXT + 0000

007C                            _utmpnam:
007C  53                                push            ebx
007D  56                                push            esi
007E  57                                push            edi
007F  55                                push            ebp
0080  89 E5                             mov             ebp,esp
0082  8B 75 14                          mov             esi,dword ptr 0x14[ebp]
0085  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
008B  8B 78 04                          mov             edi,dword ptr 0x4[eax]
008E  66 83 3D 00 00 00 00 00           cmp             word ptr _tmpname,0x0000
0096  75 09                             jne             L$5
0098                            L$4:
0098  E8 00 00 00 00                    call            init_name
009D  89 C3                             mov             ebx,eax
009F  EB 10                             jmp             L$6
00A1                            L$5:
00A1  68 00 00 00 00                    push            offset _tmpname
00A6  E8 00 00 00 00                    call            _ustrlen
00AB  83 C4 04                          add             esp,0x00000004
00AE  8D 58 FF                          lea             ebx,-0x1[eax]
00B1                            L$6:
00B1  8D 04 1B                          lea             eax,[ebx+ebx]
00B4  0F B7 90 00 00 00 00              movzx           edx,word ptr _tmpname[eax]
00BB  83 FA 5A                          cmp             edx,0x0000005a
00BE  75 19                             jne             L$7
00C0  66 C7 80 00 00 00 00 41 00        mov             word ptr _tmpname[eax],0x0041
00C9  0F B7 04 5D FE FF FF FF           movzx           eax,word ptr _tmpname-0x2[ebx*2]
00D1  4B                                dec             ebx
00D2  83 F8 2E                          cmp             eax,0x0000002e
00D5  75 DA                             jne             L$6
00D7  EB BF                             jmp             L$4
00D9                            L$7:
00D9  6A 00                             push            0x00000000
00DB  68 00 00 00 00                    push            offset _tmpname
00E0  66 FF 80 00 00 00 00              inc             word ptr _tmpname[eax]
00E7  E8 00 00 00 00                    call            _uaccess
00EC  83 C4 08                          add             esp,0x00000008
00EF  85 C0                             test            eax,eax
00F1  74 BE                             je              L$6
00F3  85 F6                             test            esi,esi
00F5  74 10                             je              L$8
00F7  68 00 00 00 00                    push            offset _tmpname
00FC  56                                push            esi
00FD  E8 00 00 00 00                    call            _ustrcpy
0102  83 C4 08                          add             esp,0x00000008
0105  EB 05                             jmp             L$9
0107                            L$8:
0107  BE 00 00 00 00                    mov             esi,offset _tmpname
010C                            L$9:
010C  57                                push            edi
010D  E8 00 00 00 00                    call            __set_errno
0112  83 C4 04                          add             esp,0x00000004
0115  89 F0                             mov             eax,esi
0117  5D                                pop             ebp
0118  5F                                pop             edi
0119  5E                                pop             esi
011A  5B                                pop             ebx
011B  C3                                ret

Routine Size: 160 bytes,    Routine Base: _TEXT + 007C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000001A bytes
0000                            _tmpname:

BSS Size: 26 bytes

