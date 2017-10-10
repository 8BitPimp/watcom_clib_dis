Module: setvbuf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009C bytes
0000                            setvbuf:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0008  8B 6C 24 18                       mov             ebp,dword ptr 0x18[esp]
000C  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
0010  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0014  81 FF FF FF FF 7F                 cmp             edi,0x7fffffff
001A  76 0A                             jbe             L$2
001C                            L$1:
001C  B8 FF FF FF FF                    mov             eax,0xffffffff
0021  5D                                pop             ebp
0022  5F                                pop             edi
0023  5E                                pop             esi
0024  5B                                pop             ebx
0025  C3                                ret
0026                            L$2:
0026  81 FE 00 02 00 00                 cmp             esi,0x00000200
002C  72 0A                             jb              L$3
002E  76 10                             jbe             L$5
0030  81 FE 00 04 00 00                 cmp             esi,0x00000400
0036  EB 06                             jmp             L$4
0038                            L$3:
0038  81 FE 00 01 00 00                 cmp             esi,0x00000100
003E                            L$4:
003E  75 DC                             jne             L$1
0040                            L$5:
0040  85 ED                             test            ebp,ebp
0042  74 04                             je              L$6
0044  85 FF                             test            edi,edi
0046  74 D4                             je              L$1
0048                            L$6:
0048  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
004B  52                                push            edx
004C  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0052  83 C4 04                          add             esp,0x00000004
0055  53                                push            ebx
0056  E8 00 00 00 00                    call            __chktty
005B  83 C4 04                          add             esp,0x00000004
005E  85 FF                             test            edi,edi
0060  74 03                             je              L$7
0062  89 7B 14                          mov             dword ptr 0x14[ebx],edi
0065                            L$7:
0065  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
0068  89 6B 08                          mov             dword ptr 0x8[ebx],ebp
006B  80 E4 F8                          and             ah,0xf8
006E  88 63 0D                          mov             byte ptr 0xd[ebx],ah
0071  8B 4B 0C                          mov             ecx,dword ptr 0xc[ebx]
0074  89 2B                             mov             dword ptr [ebx],ebp
0076  09 F1                             or              ecx,esi
0078  89 4B 0C                          mov             dword ptr 0xc[ebx],ecx
007B  85 ED                             test            ebp,ebp
007D  75 09                             jne             L$8
007F  53                                push            ebx
0080  E8 00 00 00 00                    call            __ioalloc
0085  83 C4 04                          add             esp,0x00000004
0088                            L$8:
0088  8B 73 10                          mov             esi,dword ptr 0x10[ebx]
008B  56                                push            esi
008C  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0092  83 C4 04                          add             esp,0x00000004
0095  31 C0                             xor             eax,eax
0097  5D                                pop             ebp
0098  5F                                pop             edi
0099  5E                                pop             esi
009A  5B                                pop             ebx
009B  C3                                ret

Routine Size: 156 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

