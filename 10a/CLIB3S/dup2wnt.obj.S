Module: dup2wnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009B bytes
0000				dup2:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
000F  39 FB				cmp		ebx,edi
0011  75 07				jne		L$1
0013  89 F8				mov		eax,edi
0015  E9 79 00 00 00			jmp		L$3
001A				L$1:
001A  E8 00 00 00 00			call		_GetCurrentProcess
001F  89 C6				mov		esi,eax
0021  89 DD				mov		ebp,ebx
0023  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
0028  53				push		ebx
0029  8B 2C A8				mov		ebp,dword ptr [eax+ebp*4]
002C  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0032  83 C4 04				add		esp,0x00000004
0035  6A 02				push		0x00000002
0037  6A 01				push		0x00000001
0039  6A 00				push		0x00000000
003B  8D 44 24 0C			lea		eax,0xc[esp]
003F  50				push		eax
0040  56				push		esi
0041  55				push		ebp
0042  56				push		esi
0043  E8 00 00 00 00			call		_DuplicateHandle
0048  85 C0				test		eax,eax
004A  75 11				jne		L$2
004C  53				push		ebx
004D  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0053  83 C4 04				add		esp,0x00000004
0056  E8 00 00 00 00			call		__set_errno_nt
005B  EB 36				jmp		L$3
005D				L$2:
005D  57				push		edi
005E  E8 00 00 00 00			call		close
0063  83 C4 04				add		esp,0x00000004
0066  57				push		edi
0067  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
006B  52				push		edx
006C  E8 00 00 00 00			call		__NTAddSpecificFileHandle
0071  83 C4 08				add		esp,0x00000008
0074  53				push		ebx
0075  E8 00 00 00 00			call		__IOMode
007A  83 C4 04				add		esp,0x00000004
007D  50				push		eax
007E  57				push		edi
007F  E8 00 00 00 00			call		__SetIOMode
0084  83 C4 08				add		esp,0x00000008
0087  53				push		ebx
0088  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
008E  83 C4 04				add		esp,0x00000004
0091  31 C0				xor		eax,eax
0093				L$3:
0093  83 C4 04				add		esp,0x00000004
0096  5D				pop		ebp
0097  5F				pop		edi
0098  5E				pop		esi
0099  5B				pop		ebx
009A  C3				ret		

Routine Size: 155 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

