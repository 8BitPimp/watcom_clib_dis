Module: readwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				_dos_read:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0007  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
000C  89 DA				mov		edx,ebx
000E  53				push		ebx
000F  8B 34 90				mov		esi,dword ptr [eax+edx*4]
0012  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0018  83 C4 04				add		esp,0x00000004
001B  6A 00				push		0x00000000
001D  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0021  52				push		edx
0022  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
0026  51				push		ecx
0027  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
002B  57				push		edi
002C  56				push		esi
002D  E8 00 00 00 00			call		_ReadFile
0032  85 C0				test		eax,eax
0034  75 13				jne		L$1
0036  53				push		ebx
0037  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003D  83 C4 04				add		esp,0x00000004
0040  E8 00 00 00 00			call		__set_errno_nt
0045  5F				pop		edi
0046  5E				pop		esi
0047  5B				pop		ebx
0048  C3				ret		
0049				L$1:
0049  53				push		ebx
004A  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0050  83 C4 04				add		esp,0x00000004
0053  31 C0				xor		eax,eax
0055  5F				pop		edi
0056  5E				pop		esi
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

