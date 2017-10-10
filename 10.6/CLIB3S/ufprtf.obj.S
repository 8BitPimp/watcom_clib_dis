Module: ufprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B0 bytes
0000                            file_putc:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 5D 0C                          mov             ebx,dword ptr 0xc[ebp]
0007  FF 33                             push            dword ptr [ebx]
0009  FF 75 10                          push            dword ptr 0x10[ebp]
000C  E8 00 00 00 00                    call            _ufputc
0011  83 C4 08                          add             esp,0x00000008
0014  FF 43 10                          inc             dword ptr 0x10[ebx]
0017  5D                                pop             ebp
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A                            __ufprtf:
001A  53                                push            ebx
001B  56                                push            esi
001C  57                                push            edi
001D  C8 04 00 00                       enter           0x0004,0x00
0021  8B 5D 14                          mov             ebx,dword ptr 0x14[ebp]
0024  FF 73 10                          push            dword ptr 0x10[ebx]
0027  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
002D  8B 73 0C                          mov             esi,dword ptr 0xc[ebx]
0030  83 C4 04                          add             esp,0x00000004
0033  83 E6 30                          and             esi,0x00000030
0036  80 63 0C CF                       and             byte ptr 0xc[ebx],0xcf
003A  89 75 FC                          mov             dword ptr -0x4[ebp],esi
003D  83 7B 08 00                       cmp             dword ptr 0x8[ebx],0x00000000
0041  75 09                             jne             L$1
0043  53                                push            ebx
0044  E8 00 00 00 00                    call            __ioalloc
0049  83 C4 04                          add             esp,0x00000004
004C                            L$1:
004C  31 FF                             xor             edi,edi
004E  F6 43 0D 04                       test            byte ptr 0xd[ebx],0x04
0052  74 0D                             je              L$2
0054  80 63 0D FA                       and             byte ptr 0xd[ebx],0xfa
0058  BF 01 00 00 00                    mov             edi,0x00000001
005D  80 4B 0D 01                       or              byte ptr 0xd[ebx],0x01
0061                            L$2:
0061  68 00 00 00 00                    push            offset file_putc
0066  FF 75 1C                          push            dword ptr 0x1c[ebp]
0069  FF 75 18                          push            dword ptr 0x18[ebp]
006C  53                                push            ebx
006D  E8 00 00 00 00                    call            __uprtf
0072  89 C6                             mov             esi,eax
0074  83 C4 10                          add             esp,0x00000010
0077  85 FF                             test            edi,edi
0079  74 11                             je              L$3
007B  80 63 0D FA                       and             byte ptr 0xd[ebx],0xfa
007F  53                                push            ebx
0080  80 4B 0D 04                       or              byte ptr 0xd[ebx],0x04
0084  E8 00 00 00 00                    call            __flush
0089  83 C4 04                          add             esp,0x00000004
008C                            L$3:
008C  FF 73 10                          push            dword ptr 0x10[ebx]
008F  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0095  83 C4 04                          add             esp,0x00000004
0098  F6 43 0C 20                       test            byte ptr 0xc[ebx],0x20
009C  74 05                             je              L$4
009E  BE FF FF FF FF                    mov             esi,0xffffffff
00A3                            L$4:
00A3  8B 7D FC                          mov             edi,dword ptr -0x4[ebp]
00A6  89 F0                             mov             eax,esi
00A8  09 7B 0C                          or              dword ptr 0xc[ebx],edi
00AB  C9                                leave
00AC  5F                                pop             edi
00AD  5E                                pop             esi
00AE  5B                                pop             ebx
00AF  C3                                ret

Routine Size: 150 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

