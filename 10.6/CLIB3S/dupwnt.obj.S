Module: dupwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B1 bytes
0000				_dup:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		dup
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				dup:
000E  53				push		ebx
000F  56				push		esi
0010  57				push		edi
0011  83 EC 04				sub		esp,0x00000004
0014  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0018  C7 04 24 FF FF FF FF		mov		dword ptr [esp],0xffffffff
001F  E8 00 00 00 00			call		__NTAtMaxFiles
0024  85 C0				test		eax,eax
0026  74 11				je		L$1
0028  6A 0B				push		0x0000000b
002A  E8 00 00 00 00			call		__set_errno
002F  B8 FF FF FF FF			mov		eax,0xffffffff
0034  83 C4 04				add		esp,0x00000004
0037  EB 71				jmp		L$3
0039				L$1:
0039  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
003E  89 F3				mov		ebx,esi
0040  8B 3C 98				mov		edi,dword ptr [eax+ebx*4]
0043  E8 00 00 00 00			call		_GetCurrentProcess
0048  56				push		esi
0049  89 C3				mov		ebx,eax
004B  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0051  83 C4 04				add		esp,0x00000004
0054  6A 02				push		0x00000002
0056  6A 01				push		0x00000001
0058  6A 00				push		0x00000000
005A  8D 44 24 0C			lea		eax,0xc[esp]
005E  50				push		eax
005F  53				push		ebx
0060  57				push		edi
0061  53				push		ebx
0062  E8 00 00 00 00			call		_DuplicateHandle
0067  85 C0				test		eax,eax
0069  75 11				jne		L$2
006B  56				push		esi
006C  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0072  83 C4 04				add		esp,0x00000004
0075  E8 00 00 00 00			call		__set_errno_nt
007A  EB 2E				jmp		L$3
007C				L$2:
007C  8B 1C 24				mov		ebx,dword ptr [esp]
007F  53				push		ebx
0080  FF 15 00 00 00 00			call		dword ptr _InitAccessH
0086  83 C4 04				add		esp,0x00000004
0089  56				push		esi
008A  89 C3				mov		ebx,eax
008C  E8 00 00 00 00			call		__IOMode
0091  83 C4 04				add		esp,0x00000004
0094  50				push		eax
0095  53				push		ebx
0096  E8 00 00 00 00			call		__SetIOMode
009B  83 C4 08				add		esp,0x00000008
009E  56				push		esi
009F  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00A5  83 C4 04				add		esp,0x00000004
00A8  89 D8				mov		eax,ebx
00AA				L$3:
00AA  83 C4 04				add		esp,0x00000004
00AD  5F				pop		edi
00AE  5E				pop		esi
00AF  5B				pop		ebx
00B0  C3				ret		

Routine Size: 163 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

