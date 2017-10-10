Module: jisprint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
0000                            jisprint:
0000  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0004  88 D0                             mov             al,dl
0006  FE C0                             inc             al
0008  25 FF 00 00 00                    and             eax,0x000000ff
000D  8A 80 00 00 00 00                 mov             al,byte ptr _IsTable[eax]
0013  24 08                             and             al,0x08
0015  25 FF 00 00 00                    and             eax,0x000000ff
001A  75 21                             jne             L$1
001C  88 D0                             mov             al,dl
001E  8A 80 01 00 00 00                 mov             al,byte ptr _IsKTable+0x1[eax]
0024  24 03                             and             al,0x03
0026  25 FF 00 00 00                    and             eax,0x000000ff
002B  75 10                             jne             L$1
002D  66 89 D0                          mov             ax,dx
0030  50                                push            eax
0031  E8 00 00 00 00                    call            jiszen
0036  83 C4 04                          add             esp,0x00000004
0039  85 C0                             test            eax,eax
003B  74 05                             je              L$2
003D                            L$1:
003D  B8 01 00 00 00                    mov             eax,0x00000001
0042                            L$2:
0042  C3                                ret

Routine Size: 67 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

