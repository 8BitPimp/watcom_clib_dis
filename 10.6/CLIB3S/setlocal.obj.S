Module: setlocal
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A0 bytes
0000                            setlocale:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 04                          sub             esp,0x00000004
0006  8B 7C 24 14                       mov             edi,dword ptr 0x14[esp]
000A  8B 74 24 18                       mov             esi,dword ptr 0x18[esp]
000E  85 FF                             test            edi,edi
0010  7C 05                             jl              L$1
0012  83 FF 06                          cmp             edi,0x00000006
0015  7E 07                             jle             L$2
0017                            L$1:
0017  31 C0                             xor             eax,eax
0019  E9 7B 00 00 00                    jmp             L$9
001E                            L$2:
001E  85 F6                             test            esi,esi
0020  75 0D                             jne             L$3
0022  31 C0                             xor             eax,eax
0024  8A 87 00 00 00 00                 mov             al,byte ptr _LocaleSetting[edi]
002A  89 04 24                          mov             dword ptr [esp],eax
002D  EB 60                             jmp             L$8
002F                            L$3:
002F  31 D2                             xor             edx,edx
0031  8A 26                             mov             ah,byte ptr [esi]
0033  89 14 24                          mov             dword ptr [esp],edx
0036  84 E4                             test            ah,ah
0038  75 1C                             jne             L$5
003A  EB 26                             jmp             L$7
003C                            L$4:
003C  51                                push            ecx
003D  56                                push            esi
003E  E8 00 00 00 00                    call            strcmp
0043  83 C4 08                          add             esp,0x00000008
0046  85 C0                             test            eax,eax
0048  74 18                             je              L$7
004A  8B 04 24                          mov             eax,dword ptr [esp]
004D  40                                inc             eax
004E  83 C3 04                          add             ebx,0x00000004
0051  89 04 24                          mov             dword ptr [esp],eax
0054  EB 02                             jmp             L$6
0056                            L$5:
0056  31 DB                             xor             ebx,ebx
0058                            L$6:
0058  8B 8B 00 00 00 00                 mov             ecx,dword ptr ValidLocales[ebx]
005E  85 C9                             test            ecx,ecx
0060  75 DA                             jne             L$4
0062                            L$7:
0062  83 3C 24 02                       cmp             dword ptr [esp],0x00000002
0066  74 27                             je              L$8
0068  8A 04 24                          mov             al,byte ptr [esp]
006B  88 87 00 00 00 00                 mov             byte ptr _LocaleSetting[edi],al
0071  83 FF 06                          cmp             edi,0x00000006
0074  75 19                             jne             L$8
0076  A2 03 00 00 00                    mov             byte ptr _LocaleSetting+0x3,al
007B  A2 00 00 00 00                    mov             byte ptr _LocaleSetting,al
0080  A2 01 00 00 00                    mov             byte ptr _LocaleSetting+0x1,al
0085  A2 02 00 00 00                    mov             byte ptr _LocaleSetting+0x2,al
008A  A2 04 00 00 00                    mov             byte ptr _LocaleSetting+0x4,al
008F                            L$8:
008F  8B 04 24                          mov             eax,dword ptr [esp]
0092  8B 04 85 00 00 00 00              mov             eax,dword ptr ValidLocales[eax*4]
0099                            L$9:
0099  83 C4 04                          add             esp,0x00000004
009C  5F                                pop             edi
009D  5E                                pop             esi
009E  5B                                pop             ebx
009F  C3                                ret

Routine Size: 160 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000                            L$10:
0000  43 00                                           C.
0002                            L$11:
0002  00                                              .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000                            ValidLocales:
0000  00 00 00 00                                     DD        offset DGROUP:L$10
0004  02 00 00 00                                     DD        offset DGROUP:L$11
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

