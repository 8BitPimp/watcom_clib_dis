Module: crtnwwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000085 bytes
0000                            _dos_creatnew_:
0000  51                                push            ecx
0001  56                                push            esi
0002  83 EC 0C                          sub             esp,0x0000000c
0005  89 C1                             mov             ecx,eax
0007  89 54 24 08                       mov             dword ptr 0x8[esp],edx
000B  89 DE                             mov             esi,ebx
000D  E8 00 00 00 00                    call            __NTAtMaxFiles_
0012  85 C0                             test            eax,eax
0014  74 11                             je              L$1
0016  B8 0B 00 00 00                    mov             eax,0x0000000b
001B  E8 00 00 00 00                    call            __set_errno_dos_
0020  B8 FF FF FF FF                    mov             eax,0xffffffff
0025  EB 58                             jmp             L$4
0027                            L$1:
0027  89 E3                             mov             ebx,esp
0029  89 D0                             mov             eax,edx
002B  8D 54 24 04                       lea             edx,0x4[esp]
002F  E8 00 00 00 00                    call            __GetNTCreateAttr_
0034  6A 00                             push            0x00000000
0036  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
003A  52                                push            edx
003B  6A 01                             push            0x00000001
003D  6A 00                             push            0x00000000
003F  6A 00                             push            0x00000000
0041  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
0045  53                                push            ebx
0046  51                                push            ecx
0047  E8 00 00 00 00                    call            _CreateFileA
004C  83 F8 FF                          cmp             eax,0xffffffff
004F  75 0C                             jne             L$2
0051  E8 00 00 00 00                    call            __set_errno_nt_
0056  E8 00 00 00 00                    call            _GetLastError
005B  EB 22                             jmp             L$4
005D                            L$2:
005D  FF 15 00 00 00 00                 call            dword ptr __InitAccessH
0063  BA 01 00 00 00                    mov             edx,0x00000001
0068  8A 5C 24 08                       mov             bl,byte ptr 0x8[esp]
006C  89 06                             mov             dword ptr [esi],eax
006E  F6 C3 01                          test            bl,0x01
0071  75 05                             jne             L$3
0073  BA 03 00 00 00                    mov             edx,0x00000003
0078                            L$3:
0078  E8 00 00 00 00                    call            __SetIOMode_
007D  31 C0                             xor             eax,eax
007F                            L$4:
007F  83 C4 0C                          add             esp,0x0000000c
0082  5E                                pop             esi
0083  59                                pop             ecx
0084  C3                                ret

Routine Size: 133 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

