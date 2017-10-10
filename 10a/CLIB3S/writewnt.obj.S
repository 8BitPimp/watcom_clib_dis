Module: writewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005A bytes
0000				_dos_write:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0007  8B 1D 00 00 00 00			mov		ebx,dword ptr __FileHandleIDs
000D  89 F0				mov		eax,esi
000F  56				push		esi
0010  8B 1C 83				mov		ebx,dword ptr [ebx+eax*4]
0013  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0019  83 C4 04				add		esp,0x00000004
001C  6A 00				push		0x00000000
001E  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0022  52				push		edx
0023  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
0027  51				push		ecx
0028  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
002C  57				push		edi
002D  53				push		ebx
002E  E8 00 00 00 00			call		_WriteFile
0033  85 C0				test		eax,eax
0035  75 13				jne		L$1
0037  56				push		esi
0038  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003E  83 C4 04				add		esp,0x00000004
0041  E8 00 00 00 00			call		__set_errno_nt
0046  5F				pop		edi
0047  5E				pop		esi
0048  5B				pop		ebx
0049  C3				ret		
004A				L$1:
004A  56				push		esi
004B  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0051  83 C4 04				add		esp,0x00000004
0054  31 C0				xor		eax,eax
0056  5F				pop		edi
0057  5E				pop		esi
0058  5B				pop		ebx
0059  C3				ret		

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

