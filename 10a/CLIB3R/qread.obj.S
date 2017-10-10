Module: qread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000				__qread_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 04				sub		esp,0x00000004
0005  89 C6				mov		esi,eax
0007  FF 15 00 00 00 00			call		dword ptr __AccessFileH
000D  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
0014  74 14				je		L$1
0016  89 F0				mov		eax,esi
0018  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
001E  85 C0				test		eax,eax
0020  74 08				je		L$1
0022  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
0028  EB 38				jmp		L$3
002A				L$1:
002A  8B 0D 00 00 00 00			mov		ecx,dword ptr ___FileHandleIDs
0030  89 F0				mov		eax,esi
0032  6A 00				push		0x00000000
0034  8B 0C 81				mov		ecx,dword ptr [ecx+eax*4]
0037  8D 44 24 04			lea		eax,0x4[esp]
003B  50				push		eax
003C  53				push		ebx
003D  52				push		edx
003E  51				push		ecx
003F  E8 00 00 00 00			call		_ReadFile
0044  85 C0				test		eax,eax
0046  75 0F				jne		L$2
0048  89 F0				mov		eax,esi
004A  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0050  E8 00 00 00 00			call		__set_errno_nt_
0055  EB 0B				jmp		L$3
0057				L$2:
0057  89 F0				mov		eax,esi
0059  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
005F  8B 04 24				mov		eax,dword ptr [esp]
0062				L$3:
0062  83 C4 04				add		esp,0x00000004
0065  5E				pop		esi
0066  59				pop		ecx
0067  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

