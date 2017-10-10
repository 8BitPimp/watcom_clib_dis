Module: ftell
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000064 bytes
0000                            ftell:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
000A  52                                push            edx
000B  E8 00 00 00 00                    call            tell
0010  83 C4 04                          add             esp,0x00000004
0013  89 C6                             mov             esi,eax
0015  83 F8 FF                          cmp             eax,0xffffffff
0018  74 46                             je              L$4
001A  8B 4B 10                          mov             ecx,dword ptr 0x10[ebx]
001D  51                                push            ecx
001E  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0024  8A 63 0C                          mov             ah,byte ptr 0xc[ebx]
0027  83 C4 04                          add             esp,0x00000004
002A  F6 C4 80                          test            ah,0x80
002D  74 0F                             je              L$1
002F  F6 43 0D 10                       test            byte ptr 0xd[ebx],0x10
0033  74 09                             je              L$1
0035  53                                push            ebx
0036  E8 00 00 00 00                    call            fflush
003B  83 C4 04                          add             esp,0x00000004
003E                            L$1:
003E  8B 7B 04                          mov             edi,dword ptr 0x4[ebx]
0041  85 FF                             test            edi,edi
0043  74 0C                             je              L$3
0045  F6 43 0D 10                       test            byte ptr 0xd[ebx],0x10
0049  74 04                             je              L$2
004B  01 FE                             add             esi,edi
004D  EB 02                             jmp             L$3
004F                            L$2:
004F  29 FE                             sub             esi,edi
0051                            L$3:
0051  8B 53 10                          mov             edx,dword ptr 0x10[ebx]
0054  52                                push            edx
0055  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
005B  83 C4 04                          add             esp,0x00000004
005E  89 F0                             mov             eax,esi
0060                            L$4:
0060  5F                                pop             edi
0061  5E                                pop             esi
0062  5B                                pop             ebx
0063  C3                                ret

Routine Size: 100 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

