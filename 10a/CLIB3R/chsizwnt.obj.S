Module: chsizwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000				chsize_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C3				mov		ebx,eax
0005  8B 35 00 00 00 00			mov		esi,dword ptr ___FileHandleIDs
000B  8B 34 86				mov		esi,dword ptr [esi+eax*4]
000E  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0014  6A 00				push		0x00000000
0016  6A 00				push		0x00000000
0018  52				push		edx
0019  56				push		esi
001A  E8 00 00 00 00			call		_SetFilePointer
001F  83 F8 FF				cmp		eax,0xffffffff
0022  75 11				jne		L$2
0024				L$1:
0024  89 D8				mov		eax,ebx
0026  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002C  E8 00 00 00 00			call		__set_errno_nt_
0031  5E				pop		esi
0032  59				pop		ecx
0033  5B				pop		ebx
0034  C3				ret		
0035				L$2:
0035  56				push		esi
0036  E8 00 00 00 00			call		_SetEndOfFile
003B  85 C0				test		eax,eax
003D  74 E5				je		L$1
003F  89 D8				mov		eax,ebx
0041  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0047  31 C0				xor		eax,eax
0049  5E				pop		esi
004A  59				pop		ecx
004B  5B				pop		ebx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

