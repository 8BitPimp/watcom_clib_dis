Module: crwd386
GROUP: 'DGROUP' _DATA

Segment: _TEXT BYTE USE32 00000001 bytes
0000				__null_FPE_rtn:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000047 bytes
0000				_dynend:
0000  00 00 00 00                                     ....
0004				_curbrk:
0004  00 00 00 00                                     ....
0008				_LpCmdLine:
0008  00 00 00 00                                     ....
000C				_LpPgmName:
000C  00 00 00 00                                     ....
0010				_LpDllName:
0010  00 00 00 00                                     ....
0014				_psp:
0014  00 00 00 00                                     ....
0018				_STACKLOW:
0018				__x386_stacklow:
0018  00 00 00 00                                     ....
001C				_STACKTOP:
001C  00 00 00 00                                     ....
0020				__ASTACKSIZ:
0020  00 00 00 00                                     ....
0024				__ASTACKPTR:
0024  00 00 00 00                                     ....
0028				_cbyte:
0028  00 00 00 00                                     ....
002C				_cbyte2:
002C  00 00 00 00                                     ....
0030				_child:
0030  00 00 00 00                                     ....
0034				__no87:
0034  00 00                                           ..
0036				_Extender:
0036  00                                              .
0037				_ExtenderSubtype:
0037  00                                              .
0038				__X32VM:
0038  00                                              .
0039				_Envptr:
0039  00 00 00 00                                     ....
003D				_Envseg:
003D  00 00                                           ..
003F				_osmajor:
003F  00                                              .
0040				_osminor:
0040  00                                              .
0041				_osbuild:
0041  00 00                                           ..
0043				___FPE_handler:
0043				__FPE_handler:
0043  00 00 00 00                                     DD	offset __null_FPE_rtn

