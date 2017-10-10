Module: growhdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000				sys_grow_handles:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_SetHandleCount
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

000B				_grow_handles:
000B  53				push		ebx
000C  FF 15 00 00 00 00			call		dword ptr _AccessIOB
0012  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0016  3B 05 00 00 00 00			cmp		eax,dword ptr __NFiles
001C  76 28				jbe		L$1
001E  50				push		eax
001F  E8 00 00 00 00			call		sys_grow_handles
0024  8B 0D 00 00 00 00			mov		ecx,dword ptr __NFiles
002A  89 C3				mov		ebx,eax
002C  83 C4 04				add		esp,0x00000004
002F  39 C8				cmp		eax,ecx
0031  76 13				jbe		L$1
0033  E8 00 00 00 00			call		__get_errno_ptr
0038  83 38 05				cmp		dword ptr [eax],0x00000005
003B  74 09				je		L$1
003D  53				push		ebx
003E  E8 00 00 00 00			call		__grow_iomode
0043  83 C4 04				add		esp,0x00000004
0046				L$1:
0046  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
004C  A1 00 00 00 00			mov		eax,dword ptr __NFiles
0051  5B				pop		ebx
0052  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 000B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

