Module: lseekwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000                            _lseek:
0000  53                                push            ebx
0001  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0005  52                                push            edx
0006  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
000A  53                                push            ebx
000B  8B 4C 24 10                       mov             ecx,dword ptr 0x10[esp]
000F  51                                push            ecx
0010  E8 00 00 00 00                    call            lseek
0015  83 C4 0C                          add             esp,0x0000000c
0018  5B                                pop             ebx
0019  C3                                ret

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A                            lseek:
001A  53                                push            ebx
001B  56                                push            esi
001C  57                                push            edi
001D  8B 74 24 10                       mov             esi,dword ptr 0x10[esp]
0021  8B 1D 00 00 00 00                 mov             ebx,dword ptr __FileHandleIDs
0027  56                                push            esi
0028  8B 1C B3                          mov             ebx,dword ptr [ebx+esi*4]
002B  FF 15 00 00 00 00                 call            dword ptr _AccessFileH
0031  83 C4 04                          add             esp,0x00000004
0034  8B 4C 24 18                       mov             ecx,dword ptr 0x18[esp]
0038  51                                push            ecx
0039  6A 00                             push            0x00000000
003B  8B 74 24 1C                       mov             esi,dword ptr 0x1c[esp]
003F  56                                push            esi
0040  53                                push            ebx
0041  8B 7C 24 20                       mov             edi,dword ptr 0x20[esp]
0045  E8 00 00 00 00                    call            _SetFilePointer
004A  57                                push            edi
004B  89 C3                             mov             ebx,eax
004D  89 C6                             mov             esi,eax
004F  FF 15 00 00 00 00                 call            dword ptr _ReleaseFileH
0055  83 C4 04                          add             esp,0x00000004
0058  83 FB FF                          cmp             ebx,0xffffffff
005B  75 05                             jne             L$1
005D  E8 00 00 00 00                    call            __set_errno_nt
0062                            L$1:
0062  89 F0                             mov             eax,esi
0064  5F                                pop             edi
0065  5E                                pop             esi
0066  5B                                pop             ebx
0067  C3                                ret

Routine Size: 78 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

