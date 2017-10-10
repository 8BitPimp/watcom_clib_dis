Module: wrlang
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005B bytes
0000                            WResLanguage:
0000                            _WResLanguage:
0000  53                                push            ebx
0001  68 00 00 00 00                    push            offset DGROUP:L$4
0006  E8 00 00 00 00                    call            getenv
000B  89 C3                             mov             ebx,eax
000D  83 C4 04                          add             esp,0x00000004
0010  85 C0                             test            eax,eax
0012  75 0D                             jne             L$2
0014  83 3D 00 00 00 00 00              cmp             dword ptr __IsDBCS,0x00000000
001B  74 3A                             je              L$3
001D                            L$1:
001D  B0 01                             mov             al,0x01
001F  5B                                pop             ebx
0020  C3                                ret
0021                            L$2:
0021  68 06 00 00 00                    push            offset DGROUP:L$5
0026  50                                push            eax
0027  E8 00 00 00 00                    call            stricmp
002C  83 C4 08                          add             esp,0x00000008
002F  85 C0                             test            eax,eax
0031  74 24                             je              L$3
0033  68 0E 00 00 00                    push            offset DGROUP:L$6
0038  53                                push            ebx
0039  E8 00 00 00 00                    call            stricmp
003E  83 C4 08                          add             esp,0x00000008
0041  85 C0                             test            eax,eax
0043  74 D8                             je              L$1
0045  31 C0                             xor             eax,eax
0047  8A 03                             mov             al,byte ptr [ebx]
0049  83 F8 30                          cmp             eax,0x00000030
004C  7C 09                             jl              L$3
004E  83 F8 39                          cmp             eax,0x00000039
0051  7F 04                             jg              L$3
0053  2C 30                             sub             al,0x30
0055  5B                                pop             ebx
0056  C3                                ret
0057                            L$3:
0057  30 C0                             xor             al,al
0059  5B                                pop             ebx
005A  C3                                ret

Routine Size: 91 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000017 bytes
0000                            L$4:
0000  57 4C 41 4E 47 00                               WLANG.
0006                            L$5:
0006  65 6E 67 6C 69 73 68 00                         english.
000E                            L$6:
000E  6A 61 70 61 6E 65 73 65 00                      japanese.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

