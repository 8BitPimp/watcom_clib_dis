Module: mbtowc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000088 bytes
0000                            mbtowc_:
0000  51                                push            ecx
0001  83 EC 04                          sub             esp,0x00000004
0004  89 C1                             mov             ecx,eax
0006  85 D2                             test            edx,edx
0008  75 07                             jne             L$2
000A                            L$1:
000A  31 C0                             xor             eax,eax
000C  83 C4 04                          add             esp,0x00000004
000F  59                                pop             ecx
0010  C3                                ret
0011                            L$2:
0011  85 DB                             test            ebx,ebx
0013  74 F5                             je              L$1
0015  8A 02                             mov             al,byte ptr [edx]
0017  88 04 24                          mov             byte ptr [esp],al
001A  85 C9                             test            ecx,ecx
001C  74 05                             je              L$3
001E  30 E4                             xor             ah,ah
0020  66 89 01                          mov             word ptr [ecx],ax
0023                            L$3:
0023  8A 24 24                          mov             ah,byte ptr [esp]
0026  84 E4                             test            ah,ah
0028  74 E0                             je              L$1
002A  80 FC 81                          cmp             ah,0x81
002D  72 05                             jb              L$4
002F  80 FC 9F                          cmp             ah,0x9f
0032  76 0B                             jbe             L$5
0034                            L$4:
0034  8A 04 24                          mov             al,byte ptr [esp]
0037  3C E0                             cmp             al,0xe0
0039  72 43                             jb              L$10
003B  3C FC                             cmp             al,0xfc
003D  77 3F                             ja              L$10
003F                            L$5:
003F  83 FB 01                          cmp             ebx,0x00000001
0042  76 05                             jbe             L$6
0044  8A 42 01                          mov             al,byte ptr 0x1[edx]
0047  EB 02                             jmp             L$7
0049                            L$6:
0049  30 C0                             xor             al,al
004B                            L$7:
004B  3C 40                             cmp             al,0x40
004D  72 25                             jb              L$9
004F  3C FC                             cmp             al,0xfc
0051  77 21                             ja              L$9
0053  3C 7F                             cmp             al,0x7f
0055  74 1D                             je              L$9
0057  85 C9                             test            ecx,ecx
0059  74 0F                             je              L$8
005B  8A 14 24                          mov             dl,byte ptr [esp]
005E  30 F6                             xor             dh,dh
0060  30 E4                             xor             ah,ah
0062  C1 E2 08                          shl             edx,0x08
0065  01 C2                             add             edx,eax
0067  66 89 11                          mov             word ptr [ecx],dx
006A                            L$8:
006A  B8 02 00 00 00                    mov             eax,0x00000002
006F  83 C4 04                          add             esp,0x00000004
0072  59                                pop             ecx
0073  C3                                ret
0074                            L$9:
0074  B8 FF FF FF FF                    mov             eax,0xffffffff
0079  83 C4 04                          add             esp,0x00000004
007C  59                                pop             ecx
007D  C3                                ret
007E                            L$10:
007E  B8 01 00 00 00                    mov             eax,0x00000001
0083  83 C4 04                          add             esp,0x00000004
0086  59                                pop             ecx
0087  C3                                ret

Routine Size: 136 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

