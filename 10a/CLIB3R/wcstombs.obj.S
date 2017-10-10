Module: wcstombs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000080 bytes
0000                            wcstombs_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  83 EC 04                          sub             esp,0x00000004
0007  89 C1                             mov             ecx,eax
0009  89 D6                             mov             esi,edx
000B  89 DF                             mov             edi,ebx
000D  31 ED                             xor             ebp,ebp
000F                            L$1:
000F  8A 06                             mov             al,byte ptr [esi]
0011  31 D2                             xor             edx,edx
0013  88 04 24                          mov             byte ptr [esp],al
0016  66 8B 16                          mov             dx,word ptr [esi]
0019  C1 FA 08                          sar             edx,0x08
001C  BB 02 00 00 00                    mov             ebx,0x00000002
0021  81 E2 FF 00 00 00                 and             edx,0x000000ff
0027  31 C0                             xor             eax,eax
0029  88 54 24 01                       mov             byte ptr 0x1[esp],dl
002D  89 E2                             mov             edx,esp
002F  E8 00 00 00 00                    call            mbtowc_
0034  89 C3                             mov             ebx,eax
0036  89 C2                             mov             edx,eax
0038  83 F8 FF                          cmp             eax,0xffffffff
003B  75 04                             jne             L$2
003D  89 C5                             mov             ebp,eax
003F  EB 35                             jmp             L$6
0041                            L$2:
0041  85 C0                             test            eax,eax
0043  75 05                             jne             L$3
0045  BA 01 00 00 00                    mov             edx,0x00000001
004A                            L$3:
004A  39 FA                             cmp             edx,edi
004C  77 28                             ja              L$6
004E  83 FA 01                          cmp             edx,0x00000001
0051  72 13                             jb              L$5
0053  76 0C                             jbe             L$4
0055  83 FA 02                          cmp             edx,0x00000002
0058  75 0C                             jne             L$5
005A  8A 44 24 01                       mov             al,byte ptr 0x1[esp]
005E  88 41 01                          mov             byte ptr 0x1[ecx],al
0061                            L$4:
0061  8A 04 24                          mov             al,byte ptr [esp]
0064  88 01                             mov             byte ptr [ecx],al
0066                            L$5:
0066  80 39 00                          cmp             byte ptr [ecx],0x00
0069  74 0B                             je              L$6
006B  83 C6 02                          add             esi,0x00000002
006E  01 D1                             add             ecx,edx
0070  01 D5                             add             ebp,edx
0072  29 D7                             sub             edi,edx
0074  EB 99                             jmp             L$1
0076                            L$6:
0076  89 E8                             mov             eax,ebp
0078  83 C4 04                          add             esp,0x00000004
007B  5D                                pop             ebp
007C  5F                                pop             edi
007D  5E                                pop             esi
007E  59                                pop             ecx
007F  C3                                ret

Routine Size: 128 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

