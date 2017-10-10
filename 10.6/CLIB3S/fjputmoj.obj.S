Module: fjputmoj
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000                            _fjputmoji:
0000  53                                push            ebx
0001  56                                push            esi
0002  06                                push            es
0003  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0007  31 F6                             xor             esi,esi
0009  66 8B 74 24 1C                    mov             si,word ptr 0x1c[esp]
000E  56                                push            esi
000F  E8 00 00 00 00                    call            jiszen
0014  83 C4 04                          add             esp,0x00000004
0017  85 C0                             test            eax,eax
0019  74 0D                             je              L$1
001B  89 F0                             mov             eax,esi
001D  8E 44 24 18                       mov             es,dword ptr 0x18[esp]
0021  C1 F8 08                          sar             eax,0x08
0024  26 88 03                          mov             byte ptr es:[ebx],al
0027  43                                inc             ebx
0028                            L$1:
0028  8E 44 24 18                       mov             es,dword ptr 0x18[esp]
002C  8A 44 24 1C                       mov             al,byte ptr 0x1c[esp]
0030  8C C2                             mov             edx,es
0032  26 88 03                          mov             byte ptr es:[ebx],al
0035  8D 43 01                          lea             eax,0x1[ebx]
0038  07                                pop             es
0039  5E                                pop             esi
003A  5B                                pop             ebx
003B  CB                                retf

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

