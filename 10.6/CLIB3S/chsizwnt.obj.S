Module: chsizwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007E bytes
0000                            chsize:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0007  A1 00 00 00 00                    mov             eax,dword ptr __FileHandleIDs
000C  89 DE                             mov             esi,ebx
000E  53                                push            ebx
000F  8B 34 B0                          mov             esi,dword ptr [eax+esi*4]
0012  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0018  83 C4 04                          add             esp,0x00000004
001B  6A 01                             push            0x00000001
001D  6A 00                             push            0x00000000
001F  53                                push            ebx
0020  E8 00 00 00 00                    call            lseek
0025  83 C4 0C                          add             esp,0x0000000c
0028  6A 00                             push            0x00000000
002A  6A 00                             push            0x00000000
002C  8B 54 24 1C                       mov             edx,dword ptr 0x1c[esp]
0030  52                                push            edx
0031  56                                push            esi
0032  89 C7                             mov             edi,eax
0034  E8 00 00 00 00                    call            _SetFilePointer
0039  83 F8 FF                          cmp             eax,0xffffffff
003C  75 13                             jne             L$3
003E                            L$1:
003E  53                                push            ebx
003F  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0045  83 C4 04                          add             esp,0x00000004
0048                            L$2:
0048  E8 00 00 00 00                    call            __set_errno_nt
004D  5F                                pop             edi
004E  5E                                pop             esi
004F  5B                                pop             ebx
0050  C3                                ret
0051                            L$3:
0051  56                                push            esi
0052  E8 00 00 00 00                    call            _SetEndOfFile
0057  85 C0                             test            eax,eax
0059  74 E3                             je              L$1
005B  6A 00                             push            0x00000000
005D  57                                push            edi
005E  53                                push            ebx
005F  E8 00 00 00 00                    call            lseek
0064  83 C4 0C                          add             esp,0x0000000c
0067  53                                push            ebx
0068  89 C6                             mov             esi,eax
006A  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0070  83 C4 04                          add             esp,0x00000004
0073  83 FE FF                          cmp             esi,0xffffffff
0076  74 D0                             je              L$2
0078  31 C0                             xor             eax,eax
007A  5F                                pop             edi
007B  5E                                pop             esi
007C  5B                                pop             ebx
007D  C3                                ret

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

