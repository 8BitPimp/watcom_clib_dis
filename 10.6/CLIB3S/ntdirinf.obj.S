Module: ntdirinf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D6 bytes
0000                            __MakeDOSDT:
0000  53                                push            ebx
0001  83 EC 08                          sub             esp,0x00000008
0004  89 E0                             mov             eax,esp
0006  50                                push            eax
0007  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
000B  52                                push            edx
000C  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0010  E8 00 00 00 00                    call            _FileTimeToLocalFileTime
0015  53                                push            ebx
0016  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
001A  51                                push            ecx
001B  8D 44 24 08                       lea             eax,0x8[esp]
001F  50                                push            eax
0020  E8 00 00 00 00                    call            _FileTimeToDosDateTime
0025  83 C4 08                          add             esp,0x00000008
0028  5B                                pop             ebx
0029  C3                                ret

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

002A                            __FromDOSDT:
002A  83 EC 08                          sub             esp,0x00000008
002D  89 E0                             mov             eax,esp
002F  50                                push            eax
0030  31 C0                             xor             eax,eax
0032  66 8B 44 24 14                    mov             ax,word ptr 0x14[esp]
0037  50                                push            eax
0038  31 C0                             xor             eax,eax
003A  66 8B 44 24 14                    mov             ax,word ptr 0x14[esp]
003F  50                                push            eax
0040  E8 00 00 00 00                    call            _DosDateTimeToFileTime
0045  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0049  52                                push            edx
004A  8D 44 24 04                       lea             eax,0x4[esp]
004E  50                                push            eax
004F  E8 00 00 00 00                    call            _LocalFileTimeToFileTime
0054  83 C4 08                          add             esp,0x00000008
0057  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 002A

0058                            __GetNTDirInfo:
0058  53                                push            ebx
0059  56                                push            esi
005A  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
005E  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0062  8D 43 16                          lea             eax,0x16[ebx]
0065  50                                push            eax
0066  8D 43 18                          lea             eax,0x18[ebx]
0069  50                                push            eax
006A  8D 46 14                          lea             eax,0x14[esi]
006D  50                                push            eax
006E  E8 00 00 00 00                    call            __MakeDOSDT
0073  83 C4 0C                          add             esp,0x0000000c
0076  8A 06                             mov             al,byte ptr [esi]
0078  83 C6 2C                          add             esi,0x0000002c
007B  88 43 15                          mov             byte ptr 0x15[ebx],al
007E  68 FF 00 00 00                    push            0x000000ff
0083  8B 46 F4                          mov             eax,dword ptr -0xc[esi]
0086  56                                push            esi
0087  89 43 1A                          mov             dword ptr 0x1a[ebx],eax
008A  8D 43 1E                          lea             eax,0x1e[ebx]
008D  50                                push            eax
008E  E8 00 00 00 00                    call            strncpy
0093  83 C4 0C                          add             esp,0x0000000c
0096  C6 83 1D 01 00 00 00              mov             byte ptr 0x11d[ebx],0x00
009D  5E                                pop             esi
009E  5B                                pop             ebx
009F  C3                                ret

Routine Size: 72 bytes,    Routine Base: _TEXT + 0058

00A0                            __NTFindNextFileWithAttr:
00A0  53                                push            ebx
00A1  56                                push            esi
00A2  57                                push            edi
00A3  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
00A7  8B 7C 24 14                       mov             edi,dword ptr 0x14[esp]
00AB  8B 5C 24 18                       mov             ebx,dword ptr 0x18[esp]
00AF                            L$1:
00AF  83 3B 00                          cmp             dword ptr [ebx],0x00000000
00B2  75 06                             jne             L$2
00B4  C7 03 80 00 00 00                 mov             dword ptr [ebx],0x00000080
00BA                            L$2:
00BA  85 3B                             test            dword ptr [ebx],edi
00BC  74 09                             je              L$3
00BE  B8 01 00 00 00                    mov             eax,0x00000001
00C3  5F                                pop             edi
00C4  5E                                pop             esi
00C5  5B                                pop             ebx
00C6  C3                                ret
00C7                            L$3:
00C7  53                                push            ebx
00C8  56                                push            esi
00C9  E8 00 00 00 00                    call            _FindNextFileA
00CE  85 C0                             test            eax,eax
00D0  75 DD                             jne             L$1
00D2  5F                                pop             edi
00D3  5E                                pop             esi
00D4  5B                                pop             ebx
00D5  C3                                ret

Routine Size: 54 bytes,    Routine Base: _TEXT + 00A0

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

