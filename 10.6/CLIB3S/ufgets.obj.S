Module: ufgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000084 bytes
0000                            _ufgets:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 04 00 00                       enter           0x0004,0x00
0007  8B 5D 1C                          mov             ebx,dword ptr 0x1c[ebp]
000A  FF 73 10                          push            dword ptr 0x10[ebx]
000D  8B 75 14                          mov             esi,dword ptr 0x14[ebp]
0010  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0016  8B 43 0C                          mov             eax,dword ptr 0xc[ebx]
0019  83 C4 04                          add             esp,0x00000004
001C  83 E0 30                          and             eax,0x00000030
001F  80 63 0C CF                       and             byte ptr 0xc[ebx],0xcf
0023  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0026                            L$1:
0026  FF 4D 18                          dec             dword ptr 0x18[ebp]
0029  83 7D 18 00                       cmp             dword ptr 0x18[ebp],0x00000000
002D  7E 1D                             jle             L$2
002F  53                                push            ebx
0030  E8 00 00 00 00                    call            _ufgetc
0035  83 C4 04                          add             esp,0x00000004
0038  89 C7                             mov             edi,eax
003A  83 F8 FF                          cmp             eax,0xffffffff
003D  74 0D                             je              L$2
003F  66 89 06                          mov             word ptr [esi],ax
0042  0F B7 C0                          movzx           eax,ax
0045  46                                inc             esi
0046  46                                inc             esi
0047  83 F8 0A                          cmp             eax,0x0000000a
004A  75 DA                             jne             L$1
004C                            L$2:
004C  83 FF FF                          cmp             edi,0xffffffff
004F  75 14                             jne             L$4
0051  3B 75 14                          cmp             esi,dword ptr 0x14[ebp]
0054  74 06                             je              L$3
0056  F6 43 0C 20                       test            byte ptr 0xc[ebx],0x20
005A  74 09                             je              L$4
005C                            L$3:
005C  C7 45 14 00 00 00 00              mov             dword ptr 0x14[ebp],0x00000000
0063  EB 05                             jmp             L$5
0065                            L$4:
0065  66 C7 06 00 00                    mov             word ptr [esi],0x0000
006A                            L$5:
006A  8B 45 FC                          mov             eax,dword ptr -0x4[ebp]
006D  FF 73 10                          push            dword ptr 0x10[ebx]
0070  09 43 0C                          or              dword ptr 0xc[ebx],eax
0073  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0079  8B 45 14                          mov             eax,dword ptr 0x14[ebp]
007C  83 C4 04                          add             esp,0x00000004
007F  C9                                leave
0080  5F                                pop             edi
0081  5E                                pop             esi
0082  5B                                pop             ebx
0083  C3                                ret

Routine Size: 132 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

