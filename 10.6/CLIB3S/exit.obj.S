Module: exit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				_null_exit_rtn:
0000				__null_int23_exit:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				exit:
0001  FF 15 00 00 00 00			call		dword ptr __atexit
0007  FF 15 00 00 00 00			call		dword ptr __int23_exit
000D  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0011  52				push		edx
0012  E8 00 00 00 00			call		_exit
0017  83 C4 04				add		esp,0x00000004
001A  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0001

001B				_exit:
001B  53				push		ebx
001C  FF 15 00 00 00 00			call		dword ptr __int23_exit
0022  FF 15 00 00 00 00			call		dword ptr __FPE_handler_exit
0028  83 3D 00 00 00 00 00		cmp		dword ptr _WindowExitRtn,0x00000000
002F  74 06				je		L$1
0031  FF 15 00 00 00 00			call		dword ptr _WindowExitRtn
0037				L$1:
0037  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
003B  53				push		ebx
003C  E9 00 00 00 00			jmp		__exit

Routine Size: 38 bytes,    Routine Base: _TEXT + 001B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				__atexit:
0000  00 00 00 00                                     DD	offset _null_exit_rtn
0004				__int23_exit:
0004  00 00 00 00                                     DD	offset __null_int23_exit
0008				__FPE_handler_exit:
0008  00 00 00 00                                     DD	offset _null_exit_rtn

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

