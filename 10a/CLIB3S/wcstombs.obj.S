Module: wcstombs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
0000                            wcstombs:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
000B  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000F  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0013  31 ED                             xor             ebp,ebp
0015                            L$1:
0015  8A 06                             mov             al,byte ptr [esi]
0017  88 04 24                          mov             byte ptr [esp],al
001A  31 C0                             xor             eax,eax
001C  66 8B 06                          mov             ax,word ptr [esi]
001F  C1 F8 08                          sar             eax,0x08
0022  25 FF 00 00 00                    and             eax,0x000000ff
0027  6A 02                             push            0x00000002
0029  88 44 24 05                       mov             byte ptr 0x5[esp],al
002D  8D 44 24 04                       lea             eax,0x4[esp]
0031  50                                push            eax
0032  6A 00                             push            0x00000000
0034  E8 00 00 00 00                    call            mbtowc
0039  83 C4 0C                          add             esp,0x0000000c
003C  89 C2                             mov             edx,eax
003E  83 F8 FF                          cmp             eax,0xffffffff
0041  74 37                             je              L$6
0043  85 C0                             test            eax,eax
0045  75 05                             jne             L$2
0047  BA 01 00 00 00                    mov             edx,0x00000001
004C                            L$2:
004C  39 FA                             cmp             edx,edi
004E  77 28                             ja              L$5
0050  83 FA 01                          cmp             edx,0x00000001
0053  72 13                             jb              L$4
0055  76 0C                             jbe             L$3
0057  83 FA 02                          cmp             edx,0x00000002
005A  75 0C                             jne             L$4
005C  8A 44 24 01                       mov             al,byte ptr 0x1[esp]
0060  88 43 01                          mov             byte ptr 0x1[ebx],al
0063                            L$3:
0063  8A 04 24                          mov             al,byte ptr [esp]
0066  88 03                             mov             byte ptr [ebx],al
0068                            L$4:
0068  80 3B 00                          cmp             byte ptr [ebx],0x00
006B  74 0B                             je              L$5
006D  83 C6 02                          add             esi,0x00000002
0070  01 D3                             add             ebx,edx
0072  01 D5                             add             ebp,edx
0074  29 D7                             sub             edi,edx
0076  EB 9D                             jmp             L$1
0078                            L$5:
0078  89 E8                             mov             eax,ebp
007A                            L$6:
007A  83 C4 04                          add             esp,0x00000004
007D  5D                                pop             ebp
007E  5F                                pop             edi
007F  5E                                pop             esi
0080  5B                                pop             ebx
0081  C3                                ret

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

