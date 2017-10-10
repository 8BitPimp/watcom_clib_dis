Module: dosgdf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007E bytes
0000                            _dos_getdiskfree:
0000  53                                push            ebx
0001  83 EC 14                          sub             esp,0x00000014
0004  8B 5C 24 20                       mov             ebx,dword ptr 0x20[esp]
0008  83 7C 24 1C 00                    cmp             dword ptr 0x1c[esp],0x00000000
000D  74 1F                             je              L$1
000F  8A 44 24 1C                       mov             al,byte ptr 0x1c[esp]
0013  B4 3A                             mov             ah,0x3a
0015  B2 5C                             mov             dl,0x5c
0017  30 F6                             xor             dh,dh
0019  04 40                             add             al,0x40
001B  88 64 24 01                       mov             byte ptr 0x1[esp],ah
001F  88 54 24 02                       mov             byte ptr 0x2[esp],dl
0023  88 74 24 03                       mov             byte ptr 0x3[esp],dh
0027  88 04 24                          mov             byte ptr [esp],al
002A  89 E0                             mov             eax,esp
002C  EB 02                             jmp             L$2
002E                            L$1:
002E  31 C0                             xor             eax,eax
0030                            L$2:
0030  8D 54 24 04                       lea             edx,0x4[esp]
0034  52                                push            edx
0035  8D 54 24 0C                       lea             edx,0xc[esp]
0039  52                                push            edx
003A  8D 54 24 14                       lea             edx,0x14[esp]
003E  52                                push            edx
003F  8D 54 24 1C                       lea             edx,0x1c[esp]
0043  52                                push            edx
0044  50                                push            eax
0045  E8 00 00 00 00                    call            _GetDiskFreeSpaceA
004A  85 C0                             test            eax,eax
004C  75 0A                             jne             L$3
004E  E8 00 00 00 00                    call            __set_errno_nt
0053  83 C4 14                          add             esp,0x00000014
0056  5B                                pop             ebx
0057  C3                                ret
0058                            L$3:
0058  8B 44 24 04                       mov             eax,dword ptr 0x4[esp]
005C  66 89 03                          mov             word ptr [ebx],ax
005F  8B 44 24 08                       mov             eax,dword ptr 0x8[esp]
0063  66 89 43 02                       mov             word ptr 0x2[ebx],ax
0067  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
006B  66 89 43 04                       mov             word ptr 0x4[ebx],ax
006F  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0073  66 89 43 06                       mov             word ptr 0x6[ebx],ax
0077  31 C0                             xor             eax,eax
0079  83 C4 14                          add             esp,0x00000014
007C  5B                                pop             ebx
007D  C3                                ret

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

