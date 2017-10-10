Module: crwd386
GROUP: 'DGROUP' _DATA

Segment: _TEXT BYTE USE32 00000001 bytes
0000				__null_FPE_rtn:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000041 bytes
0000				_dynend:
0000  00 00 00 00                                     ....
0004				_curbrk:
0004  00 00 00 00                                     ....
0008				_LpCmdLine:
0008  00 00 00 00                                     ....
000C				_LpPgmName:
000C  00 00 00 00                                     ....
0010				_psp:
0010  00 00 00 00                                     ....
0014				_STACKLOW:
0014				__x386_stacklow:
0014  00 00 00 00                                     ....
0018				_STACKTOP:
0018  00 00 00 00                                     ....
001C				__ASTACKSIZ:
001C  00 00 00 00                                     ....
0020				__ASTACKPTR:
0020  00 00 00 00                                     ....
0024				_cbyte:
0024  00 00 00 00                                     ....
0028				_cbyte2:
0028  00 00 00 00                                     ....
002C				_child:
002C  00 00 00 00                                     ....
0030				__no87:
0030  00 00                                           ..
0032				_Extender:
0032  00                                              .
0033				_ExtenderSubtype:
0033  00                                              .
0034				__X32VM:
0034  00                                              .
0035				_Envptr:
0035  00 00 00 00                                     ....
0039				_Envseg:
0039  00 00                                           ..
003B				_osmajor:
003B  00                                              .
003C				_osminor:
003C  00                                              .
003D				___FPE_handler:
003D				__FPE_handler:
003D  00 00 00 00                                     DD	offset __null_FPE_rtn

