Module: fgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008F bytes
0000                            fgets:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 08                          sub             esp,0x00000008
0007  8B 6C 24 1C                       mov             ebp,dword ptr 0x1c[esp]
000B  8B 74 24 20                       mov             esi,dword ptr 0x20[esp]
000F  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
0013  8B 57 10                          mov             edx,dword ptr 0x10[edi]
0016  52                                push            edx
0017  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
001D  8B 47 0C                          mov             eax,dword ptr 0xc[edi]
0020  83 C4 04                          add             esp,0x00000004
0023  83 E0 30                          and             eax,0x00000030
0026  89 44 24 04                       mov             dword ptr 0x4[esp],eax
002A  8A 67 0C                          mov             ah,byte ptr 0xc[edi]
002D  80 E4 CF                          and             ah,0xcf
0030  89 EB                             mov             ebx,ebp
0032  88 67 0C                          mov             byte ptr 0xc[edi],ah
0035                            L$1:
0035  4E                                dec             esi
0036  85 F6                             test            esi,esi
0038  7E 1B                             jle             L$2
003A  57                                push            edi
003B  E8 00 00 00 00                    call            fgetc
0040  83 C4 04                          add             esp,0x00000004
0043  89 04 24                          mov             dword ptr [esp],eax
0046  83 F8 FF                          cmp             eax,0xffffffff
0049  74 0A                             je              L$2
004B  8A 04 24                          mov             al,byte ptr [esp]
004E  88 03                             mov             byte ptr [ebx],al
0050  43                                inc             ebx
0051  3C 0A                             cmp             al,0x0a
0053  75 E0                             jne             L$1
0055                            L$2:
0055  83 3C 24 FF                       cmp             dword ptr [esp],0xffffffff
0059  75 0E                             jne             L$4
005B  39 EB                             cmp             ebx,ebp
005D  74 06                             je              L$3
005F  F6 47 0C 20                       test            byte ptr 0xc[edi],0x20
0063  74 04                             je              L$4
0065                            L$3:
0065  31 ED                             xor             ebp,ebp
0067  EB 03                             jmp             L$5
0069                            L$4:
0069  C6 03 00                          mov             byte ptr [ebx],0x00
006C                            L$5:
006C  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0070  8B 77 0C                          mov             esi,dword ptr 0xc[edi]
0073  09 C6                             or              esi,eax
0075  8B 47 10                          mov             eax,dword ptr 0x10[edi]
0078  50                                push            eax
0079  89 77 0C                          mov             dword ptr 0xc[edi],esi
007C  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0082  83 C4 04                          add             esp,0x00000004
0085  89 E8                             mov             eax,ebp
0087  83 C4 08                          add             esp,0x00000008
008A  5D                                pop             ebp
008B  5F                                pop             edi
008C  5E                                pop             esi
008D  5B                                pop             ebx
008E  C3                                ret

Routine Size: 143 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

