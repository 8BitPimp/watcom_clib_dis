Module: winlsem
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003A bytes
0000                            __InitWinLinesSem:
0000  6A 00                             push            0x00000000
0002  6A 00                             push            0x00000000
0004  6A 00                             push            0x00000000
0006  E8 00 00 00 00                    call            _CreateMutexA
000B  A3 00 00 00 00                    mov             dword ptr __WinLines_sem,eax
0010  C3                                ret

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011                            __FiniWinLinesSem:
0011  8B 15 00 00 00 00                 mov             edx,dword ptr __WinLines_sem
0017  52                                push            edx
0018  E8 00 00 00 00                    call            _CloseHandle
001D  C3                                ret

Routine Size: 13 bytes,    Routine Base: _TEXT + 0011

001E                            _AccessWinLines:
001E  6A FF                             push            0xffffffff
0020  8B 15 00 00 00 00                 mov             edx,dword ptr __WinLines_sem
0026  52                                push            edx
0027  E8 00 00 00 00                    call            _WaitForSingleObject
002C  C3                                ret

Routine Size: 15 bytes,    Routine Base: _TEXT + 001E

002D                            _ReleaseWinLines:
002D  8B 15 00 00 00 00                 mov             edx,dword ptr __WinLines_sem
0033  52                                push            edx
0034  E8 00 00 00 00                    call            _ReleaseMutex
0039  C3                                ret

Routine Size: 13 bytes,    Routine Base: _TEXT + 002D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

