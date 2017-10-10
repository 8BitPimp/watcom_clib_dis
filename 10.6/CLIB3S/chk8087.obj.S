Module: chk8087
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000                            __save_8087:
0000  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0004  9B DD 30                          fsave           [eax]
0007  9B                                fwait
0008  C3                                ret
0009                            __rest_8087:
0009  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
000D  DD 20                             frstor          [eax]
000F  9B                                fwait
0010  C3                                ret

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011                            __init_8087:
0011  53                                push            ebx
0012  80 3D 00 00 00 00 00              cmp             byte ptr __real87,0x00
0019  74 16                             je              L$1
001B  BA 00 00 00 00                    mov             edx,offset __save_8087
0020  BB 00 00 00 00                    mov             ebx,offset __rest_8087
0025  89 15 00 00 00 00                 mov             dword ptr __Save8087,edx
002B  89 1D 00 00 00 00                 mov             dword ptr __Rest8087,ebx
0031                            L$1:
0031  31 C0                             xor             eax,eax
0033  66 A1 00 00 00 00                 mov             ax,word ptr __8087cw
0039  E8 00 00 00 00                    call            __init_80x87
003E  5B                                pop             ebx
003F  C3                                ret

Routine Size: 47 bytes,    Routine Base: _TEXT + 0011

0040                            _fpreset:
0040  80 3D 00 00 00 00 00              cmp             byte ptr __real87,0x00
0047  75 C8                             jne             __init_8087
0049  C3                                ret

Routine Size: 10 bytes,    Routine Base: _TEXT + 0040

004A                            __chk8087:
004A  53                                push            ebx
004B  8A 25 00 00 00 00                 mov             ah,byte ptr __8087
0051  84 E4                             test            ah,ah
0053  75 3D                             jne             L$3
0055  88 25 00 00 00 00                 mov             byte ptr __real87,ah
005B  30 DB                             xor             bl,bl
005D  2B C0                             sub             eax,eax
005F  50                                push            eax
0060  DB E3                             fninit
0062  D9 3C 24                          fnstcw          word ptr [esp]
0065  58                                pop             eax
0066  8A C4                             mov             al,ah
0068  30 FF                             xor             bh,bh
006A  25 FF 00 00 00                    and             eax,0x000000ff
006F  83 F8 03                          cmp             eax,0x00000003
0072  75 09                             jne             L$2
0074  E8 00 00 00 00                    call            __init_8087
0079  88 C3                             mov             bl,al
007B  88 C7                             mov             bh,al
007D                            L$2:
007D  80 3D 00 00 00 00 00              cmp             byte ptr __no87,0x00
0084  75 0C                             jne             L$3
0086  88 1D 00 00 00 00                 mov             byte ptr __8087,bl
008C  88 3D 00 00 00 00                 mov             byte ptr __real87,bh
0092                            L$3:
0092  5B                                pop             ebx
0093  C3                                ret

Routine Size: 74 bytes,    Routine Base: _TEXT + 004A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

