Module: getdswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,XIB,XI,XIE

Segment: _TEXT BYTE USE32 00000018 bytes
0000                            __GETDS:
0000  66 2E 8E 1D 00 00 00 00           mov             ds,word ptr cs:__saved_ds
0008  C3                                ret
0009                            __save_ds:
0009  B8 00 00 00 00                    mov             eax,offset __saved_ds
000E  8C DA                             mov             edx,ds
0010  66 89 15 00 00 00 00              mov             word ptr __saved_ds,dx
0017  C3                                ret

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000002 bytes
0000                            __saved_ds:

BSS Size: 2 bytes

Segment: XIB BYTE USE32 00000000 bytes

Segment: XI BYTE USE32 00000006 bytes
0000                            __anon33:
0000  00 0A                                           ..
0002  00 00 00 00                                     DD        offset __save_ds

Segment: XIE BYTE USE32 00000000 bytes

