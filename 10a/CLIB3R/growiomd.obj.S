Module: growiomd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A7 bytes
0000                            __grow_iomode_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  55                                push            ebp
0006  50                                push            eax
0007  FF 15 00 00 00 00                 call            dword ptr __AccessIOB
000D  8B 14 24                          mov             edx,dword ptr [esp]
0010  8B 1D 00 00 00 00                 mov             ebx,dword ptr __iomode
0016  C1 E2 02                          shl             edx,0x02
0019  81 FB 00 00 00 00                 cmp             ebx,offset ___init_mode
001F  75 32                             jne             L$1
0021  31 C0                             xor             eax,eax
0023  E8 00 00 00 00                    call            realloc_
0028  89 C7                             mov             edi,eax
002A  89 C5                             mov             ebp,eax
002C  85 C0                             test            eax,eax
002E  74 2C                             je              L$2
0030  8B 0D 00 00 00 00                 mov             ecx,dword ptr ___NFiles
0036  89 DE                             mov             esi,ebx
0038  C1 E1 02                          shl             ecx,0x02
003B  06                                push            es
003C  8C D8                             mov             eax,ds
003E  8E C0                             mov             es,eax
0040  57                                push            edi
0041  89 C8                             mov             eax,ecx
0043  C1 E9 02                          shr             ecx,0x02
0046  F2 A5                             repne movsd
0048  8A C8                             mov             cl,al
004A  80 E1 03                          and             cl,0x03
004D  F2 A4                             repne movsb
004F  5F                                pop             edi
0050  07                                pop             es
0051  EB 09                             jmp             L$2
0053                            L$1:
0053  89 D8                             mov             eax,ebx
0055  E8 00 00 00 00                    call            realloc_
005A  89 C5                             mov             ebp,eax
005C                            L$2:
005C  85 ED                             test            ebp,ebp
005E  75 0D                             jne             L$3
0060  E8 00 00 00 00                    call            __get_errno_ptr_
0065  C7 00 05 00 00 00                 mov             dword ptr [eax],0x00000005
006B  EB 2A                             jmp             L$4
006D                            L$3:
006D  8B 1C 24                          mov             ebx,dword ptr [esp]
0070  8B 0D 00 00 00 00                 mov             ecx,dword ptr ___NFiles
0076  31 D2                             xor             edx,edx
0078  89 C8                             mov             eax,ecx
007A  29 CB                             sub             ebx,ecx
007C  C1 E0 02                          shl             eax,0x02
007F  C1 E3 02                          shl             ebx,0x02
0082  01 E8                             add             eax,ebp
0084  E8 00 00 00 00                    call            memset_
0089  8B 04 24                          mov             eax,dword ptr [esp]
008C  89 2D 00 00 00 00                 mov             dword ptr __iomode,ebp
0092  A3 00 00 00 00                    mov             dword ptr ___NFiles,eax
0097                            L$4:
0097  FF 15 00 00 00 00                 call            dword ptr __ReleaseIOB
009D  83 C4 04                          add             esp,0x00000004
00A0  5D                                pop             ebp
00A1  5F                                pop             edi
00A2  5E                                pop             esi
00A3  5A                                pop             edx
00A4  59                                pop             ecx
00A5  5B                                pop             ebx
00A6  C3                                ret

Routine Size: 167 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

