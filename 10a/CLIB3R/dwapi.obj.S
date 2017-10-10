Module: dwapi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000                            _dwDeleteOnClose_:
0000  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsDestroyOnClose,0x00000000
0007  74 11                             je              L$1
0009  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
000F  85 C0                             test            eax,eax
0011  74 07                             je              L$1
0013  FF 15 00 00 00 00                 call            dword ptr __WindowsDestroyOnClose
0019  C3                                ret
001A                            L$1:
001A  31 C0                             xor             eax,eax
001C  C3                                ret

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

001D                            _dwSetAboutDlg_:
001D  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsSetAbout,0x00000000
0024  74 F4                             je              L$1
0026  FF 15 00 00 00 00                 call            dword ptr __WindowsSetAbout
002C  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 001D

002D                            _dwSetAppTitle_:
002D  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsSetAppTitle,0x00000000
0034  74 E4                             je              L$1
0036  FF 15 00 00 00 00                 call            dword ptr __WindowsSetAppTitle
003C  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 002D

003D                            _dwSetConTitle_:
003D  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsSetAppTitle,0x00000000
0044  74 11                             je              L$2
0046  FF 15 00 00 00 00                 call            dword ptr __WindowsIsWindowedHandle
004C  85 C0                             test            eax,eax
004E  74 07                             je              L$2
0050  FF 15 00 00 00 00                 call            dword ptr __WindowsSetConTitle
0056  C3                                ret
0057                            L$2:
0057  31 C0                             xor             eax,eax
0059  C3                                ret

Routine Size: 29 bytes,    Routine Base: _TEXT + 003D

005A                            _dwYield_:
005A  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsYieldControl,0x00000000
0061  74 F4                             je              L$2
0063  FF 15 00 00 00 00                 call            dword ptr __WindowsYieldControl
0069  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 005A

006A                            _dwShutDown_:
006A  83 3D 00 00 00 00 00              cmp             dword ptr __WindowsShutDown,0x00000000
0071  74 E4                             je              L$2
0073  FF 15 00 00 00 00                 call            dword ptr __WindowsShutDown
0079  C3                                ret

Routine Size: 16 bytes,    Routine Base: _TEXT + 006A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

