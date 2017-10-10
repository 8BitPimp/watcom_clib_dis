Module: fjstrncm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000093 bytes
0000                            _fjstrncmp:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  83 EC 08                          sub             esp,0x00000008
0006  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
000A  8B 7C 24 24                       mov             edi,dword ptr 0x24[esp]
000E  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0012                            L$1:
0012  4B                                dec             ebx
0013  83 FB FF                          cmp             ebx,0xffffffff
0016  0F 84 6E 00 00 00                 je              L$4
001C  8D 54 24 04                       lea             edx,0x4[esp]
0020  8C D8                             mov             eax,ds
0022  25 FF FF 00 00                    and             eax,0x0000ffff
0027  50                                push            eax
0028  31 C0                             xor             eax,eax
002A  52                                push            edx
002B  66 8B 44 24 28                    mov             ax,word ptr 0x28[esp]
0030  50                                push            eax
0031  56                                push            esi
0032  9A 00 00 00 00 00 00              call            _fjgetmoji
0039  83 C4 10                          add             esp,0x00000010
003C  89 C6                             mov             esi,eax
003E  89 54 24 20                       mov             dword ptr 0x20[esp],edx
0042  8C D8                             mov             eax,ds
0044  89 E2                             mov             edx,esp
0046  25 FF FF 00 00                    and             eax,0x0000ffff
004B  50                                push            eax
004C  31 C0                             xor             eax,eax
004E  52                                push            edx
004F  66 8B 44 24 30                    mov             ax,word ptr 0x30[esp]
0054  50                                push            eax
0055  57                                push            edi
0056  9A 00 00 00 00 00 00              call            _fjgetmoji
005D  83 C4 10                          add             esp,0x00000010
0060  89 C7                             mov             edi,eax
0062  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
0066  89 54 24 28                       mov             dword ptr 0x28[esp],edx
006A  8B 14 24                          mov             edx,dword ptr [esp]
006D  66 39 D0                          cmp             ax,dx
0070  74 10                             je              L$3
0072  73 07                             jae             L$2
0074  B8 FF FF FF FF                    mov             eax,0xffffffff
0079  EB 11                             jmp             L$5
007B                            L$2:
007B  B8 01 00 00 00                    mov             eax,0x00000001
0080  EB 0A                             jmp             L$5
0082                            L$3:
0082  66 83 7C 24 04 00                 cmp             word ptr 0x4[esp],0x0000
0088  75 88                             jne             L$1
008A                            L$4:
008A  31 C0                             xor             eax,eax
008C                            L$5:
008C  83 C4 08                          add             esp,0x00000008
008F  5F                                pop             edi
0090  5E                                pop             esi
0091  5B                                pop             ebx
0092  CB                                retf

Routine Size: 147 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

