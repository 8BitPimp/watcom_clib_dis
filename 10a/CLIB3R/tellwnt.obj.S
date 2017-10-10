Module: tellwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000                            tell_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  89 C3                             mov             ebx,eax
0005  8B 15 00 00 00 00                 mov             edx,dword ptr ___FileHandleIDs
000B  89 C1                             mov             ecx,eax
000D  8B 14 8A                          mov             edx,dword ptr [edx+ecx*4]
0010  FF 15 00 00 00 00                 call            dword ptr __AccessFileH
0016  6A 01                             push            0x00000001
0018  6A 00                             push            0x00000000
001A  6A 00                             push            0x00000000
001C  52                                push            edx
001D  E8 00 00 00 00                    call            _SetFilePointer
0022  89 C2                             mov             edx,eax
0024  83 F8 FF                          cmp             eax,0xffffffff
0027  75 05                             jne             L$1
0029  E8 00 00 00 00                    call            __set_errno_nt_
002E                            L$1:
002E  89 D8                             mov             eax,ebx
0030  FF 15 00 00 00 00                 call            dword ptr __ReleaseFileH
0036  89 D0                             mov             eax,edx
0038  5A                                pop             edx
0039  59                                pop             ecx
003A  5B                                pop             ebx
003B  C3                                ret

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

