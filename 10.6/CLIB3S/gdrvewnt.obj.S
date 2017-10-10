Module: gdrvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000				_dos_getdrive:
0000  81 EC 04 01 00 00			sub		esp,0x00000104
0006  89 E0				mov		eax,esp
0008  50				push		eax
0009  68 04 01 00 00			push		0x00000104
000E  E8 00 00 00 00			call		_GetCurrentDirectoryA
0013  31 C0				xor		eax,eax
0015  8A 04 24				mov		al,byte ptr [esp]
0018  50				push		eax
0019  E8 00 00 00 00			call		tolower
001E  83 C4 04				add		esp,0x00000004
0021  8B 94 24 08 01 00 00		mov		edx,dword ptr 0x108[esp]
0028  83 E8 60				sub		eax,0x00000060
002B  89 02				mov		dword ptr [edx],eax
002D  81 C4 04 01 00 00			add		esp,0x00000104
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

