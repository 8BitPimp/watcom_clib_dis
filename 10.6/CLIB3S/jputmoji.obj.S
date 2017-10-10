Module: jputmoji
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000                            jputmoji:
0000  53                                push            ebx
0001  56                                push            esi
0002  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0006  31 F6                             xor             esi,esi
0008  66 8B 74 24 10                    mov             si,word ptr 0x10[esp]
000D  56                                push            esi
000E  E8 00 00 00 00                    call            jiszen
0013  83 C4 04                          add             esp,0x00000004
0016  85 C0                             test            eax,eax
0018  74 08                             je              L$1
001A  89 F0                             mov             eax,esi
001C  C1 F8 08                          sar             eax,0x08
001F  88 03                             mov             byte ptr [ebx],al
0021  43                                inc             ebx
0022                            L$1:
0022  8A 44 24 10                       mov             al,byte ptr 0x10[esp]
0026  88 03                             mov             byte ptr [ebx],al
0028  8D 43 01                          lea             eax,0x1[ebx]
002B  5E                                pop             esi
002C  5B                                pop             ebx
002D  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

