Module: dospnwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000117 bytes
0000				__dospawn:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 58				sub		esp,0x00000058
0007  6A 00				push		0x00000000
0009  8B 54 24 78			mov		edx,dword ptr 0x78[esp]
000D  52				push		edx
000E  8B 9C 24 84 00 00 00		mov		ebx,dword ptr 0x84[esp]
0015  53				push		ebx
0016  8B 4C 24 7C			mov		ecx,dword ptr 0x7c[esp]
001A  51				push		ecx
001B  E8 00 00 00 00			call		__ccmdline
0020  83 C4 10				add		esp,0x00000010
0023  6A 44				push		0x00000044
0025  6A 00				push		0x00000000
0027  8D 44 24 08			lea		eax,0x8[esp]
002B  50				push		eax
002C  E8 00 00 00 00			call		memset
0031  83 C4 0C				add		esp,0x0000000c
0034  8D 44 24 44			lea		eax,0x44[esp]
0038  50				push		eax
0039  8D 44 24 04			lea		eax,0x4[esp]
003D  50				push		eax
003E  6A 00				push		0x00000000
0040  8B B4 24 84 00 00 00		mov		esi,dword ptr 0x84[esp]
0047  56				push		esi
0048  6A 00				push		0x00000000
004A  6A 01				push		0x00000001
004C  6A 00				push		0x00000000
004E  6A 00				push		0x00000000
0050  8B BC 24 94 00 00 00		mov		edi,dword ptr 0x94[esp]
0057  57				push		edi
0058  BA 01 00 00 00			mov		edx,0x00000001
005D  6A 00				push		0x00000000
005F  66 89 54 24 58			mov		word ptr 0x58[esp],dx
0064  E8 00 00 00 00			call		_CreateProcessA
0069  85 C0				test		eax,eax
006B  75 0A				jne		L$2
006D				L$1:
006D  E8 00 00 00 00			call		__set_errno_nt
0072  E9 98 00 00 00			jmp		L$9
0077				L$2:
0077  83 7C 24 6C 00			cmp		dword ptr 0x6c[esp],0x00000000
007C  0F 85 6D 00 00 00			jne		L$6
0082  E8 00 00 00 00			call		_GetVersion
0087  A9 00 00 00 80			test		eax,0x80000000
008C  74 39				je		L$4
008E  68 E8 03 00 00			push		0x000003e8
0093  BB 03 01 00 00			mov		ebx,0x00000103
0098  E8 00 00 00 00			call		_Sleep
009D  89 5C 24 54			mov		dword ptr 0x54[esp],ebx
00A1				L$3:
00A1  81 7C 24 54 03 01 00 00		cmp		dword ptr 0x54[esp],0x00000103
00A9  75 4C				jne		L$8
00AB  6A 64				push		0x00000064
00AD  E8 00 00 00 00			call		_Sleep
00B2  8D 44 24 54			lea		eax,0x54[esp]
00B6  50				push		eax
00B7  8B 74 24 48			mov		esi,dword ptr 0x48[esp]
00BB  56				push		esi
00BC  E8 00 00 00 00			call		_GetExitCodeProcess
00C1  85 C0				test		eax,eax
00C3  75 DC				jne		L$3
00C5  EB A6				jmp		L$1
00C7				L$4:
00C7  6A FF				push		0xffffffff
00C9  8B 44 24 48			mov		eax,dword ptr 0x48[esp]
00CD  50				push		eax
00CE  E8 00 00 00 00			call		_WaitForSingleObject
00D3  85 C0				test		eax,eax
00D5  75 11				jne		L$5
00D7  8D 44 24 54			lea		eax,0x54[esp]
00DB  50				push		eax
00DC  8B 54 24 48			mov		edx,dword ptr 0x48[esp]
00E0  52				push		edx
00E1  E8 00 00 00 00			call		_GetExitCodeProcess
00E6  EB 0F				jmp		L$8
00E8				L$5:
00E8  E8 00 00 00 00			call		__set_errno_nt
00ED  EB 04				jmp		L$7
00EF				L$6:
00EF  8B 44 24 4C			mov		eax,dword ptr 0x4c[esp]
00F3				L$7:
00F3  89 44 24 54			mov		dword ptr 0x54[esp],eax
00F7				L$8:
00F7  8B 7C 24 44			mov		edi,dword ptr 0x44[esp]
00FB  57				push		edi
00FC  E8 00 00 00 00			call		_CloseHandle
0101  8B 6C 24 48			mov		ebp,dword ptr 0x48[esp]
0105  55				push		ebp
0106  E8 00 00 00 00			call		_CloseHandle
010B  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
010F				L$9:
010F  83 C4 58				add		esp,0x00000058
0112  5D				pop		ebp
0113  5F				pop		edi
0114  5E				pop		esi
0115  5B				pop		ebx
0116  C3				ret		

Routine Size: 279 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

