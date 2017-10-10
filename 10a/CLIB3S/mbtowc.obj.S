Module: mbtowc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007E bytes
0000                            mbtowc:
0000  53                                push            ebx
0001  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
0005  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0009  85 DB                             test            ebx,ebx
000B  75 04                             jne             L$2
000D                            L$1:
000D  31 C0                             xor             eax,eax
000F  5B                                pop             ebx
0010  C3                                ret
0011                            L$2:
0011  83 7C 24 10 00                    cmp             dword ptr 0x10[esp],0x00000000
0016  74 F5                             je              L$1
0018  8A 0B                             mov             cl,byte ptr [ebx]
001A  85 D2                             test            edx,edx
001C  74 07                             je              L$3
001E  88 C8                             mov             al,cl
0020  30 E4                             xor             ah,ah
0022  66 89 02                          mov             word ptr [edx],ax
0025                            L$3:
0025  84 C9                             test            cl,cl
0027  74 E4                             je              L$1
0029  80 F9 81                          cmp             cl,0x81
002C  72 05                             jb              L$4
002E  80 F9 9F                          cmp             cl,0x9f
0031  76 0A                             jbe             L$5
0033                            L$4:
0033  80 F9 E0                          cmp             cl,0xe0
0036  72 3F                             jb              L$10
0038  80 F9 FC                          cmp             cl,0xfc
003B  77 3A                             ja              L$10
003D                            L$5:
003D  83 7C 24 10 01                    cmp             dword ptr 0x10[esp],0x00000001
0042  76 05                             jbe             L$6
0044  8A 43 01                          mov             al,byte ptr 0x1[ebx]
0047  EB 02                             jmp             L$7
0049                            L$6:
0049  30 C0                             xor             al,al
004B                            L$7:
004B  3C 40                             cmp             al,0x40
004D  72 21                             jb              L$9
004F  3C FC                             cmp             al,0xfc
0051  77 1D                             ja              L$9
0053  3C 7F                             cmp             al,0x7f
0055  74 19                             je              L$9
0057  85 D2                             test            edx,edx
0059  74 0E                             je              L$8
005B  88 CB                             mov             bl,cl
005D  30 FF                             xor             bh,bh
005F  30 E4                             xor             ah,ah
0061  C1 E3 08                          shl             ebx,0x08
0064  01 C3                             add             ebx,eax
0066  66 89 1A                          mov             word ptr [edx],bx
0069                            L$8:
0069  B8 02 00 00 00                    mov             eax,0x00000002
006E  5B                                pop             ebx
006F  C3                                ret
0070                            L$9:
0070  B8 FF FF FF FF                    mov             eax,0xffffffff
0075  5B                                pop             ebx
0076  C3                                ret
0077                            L$10:
0077  B8 01 00 00 00                    mov             eax,0x00000001
007C  5B                                pop             ebx
007D  C3                                ret

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

