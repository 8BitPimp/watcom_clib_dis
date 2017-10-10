Module: dospnwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000112 bytes
0000				__dospawn:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 58				sub		esp,0x00000058
0009  8B 44 24 78			mov		eax,dword ptr 0x78[esp]
000D  8B 94 24 84 00 00 00		mov		edx,dword ptr 0x84[esp]
0014  8B 5C 24 7C			mov		ebx,dword ptr 0x7c[esp]
0018  31 C9				xor		ecx,ecx
001A  E8 00 00 00 00			call		__ccmdline_
001F  89 E0				mov		eax,esp
0021  BB 44 00 00 00			mov		ebx,0x00000044
0026  31 D2				xor		edx,edx
0028  E8 00 00 00 00			call		memset_
002D  8D 44 24 44			lea		eax,0x44[esp]
0031  50				push		eax
0032  8D 44 24 04			lea		eax,0x4[esp]
0036  50				push		eax
0037  BA 01 00 00 00			mov		edx,0x00000001
003C  6A 00				push		0x00000000
003E  66 89 54 24 3C			mov		word ptr 0x3c[esp],dx
0043  8B 94 24 8C 00 00 00		mov		edx,dword ptr 0x8c[esp]
004A  52				push		edx
004B  6A 00				push		0x00000000
004D  6A 01				push		0x00000001
004F  6A 00				push		0x00000000
0051  6A 00				push		0x00000000
0053  8B 9C 24 9C 00 00 00		mov		ebx,dword ptr 0x9c[esp]
005A  53				push		ebx
005B  6A 00				push		0x00000000
005D  E8 00 00 00 00			call		_CreateProcessA
0062  85 C0				test		eax,eax
0064  75 0A				jne		L$2
0066				L$1:
0066  E8 00 00 00 00			call		__set_errno_nt_
006B  E9 98 00 00 00			jmp		L$9
0070				L$2:
0070  83 7C 24 74 00			cmp		dword ptr 0x74[esp],0x00000000
0075  0F 85 6D 00 00 00			jne		L$6
007B  E8 00 00 00 00			call		_GetVersion
0080  A9 00 00 00 80			test		eax,0x80000000
0085  74 39				je		L$4
0087  68 E8 03 00 00			push		0x000003e8
008C  BD 03 01 00 00			mov		ebp,0x00000103
0091  E8 00 00 00 00			call		_Sleep
0096  89 6C 24 54			mov		dword ptr 0x54[esp],ebp
009A				L$3:
009A  81 7C 24 54 03 01 00 00		cmp		dword ptr 0x54[esp],0x00000103
00A2  75 4C				jne		L$8
00A4  6A 64				push		0x00000064
00A6  E8 00 00 00 00			call		_Sleep
00AB  8D 44 24 54			lea		eax,0x54[esp]
00AF  50				push		eax
00B0  8B 54 24 48			mov		edx,dword ptr 0x48[esp]
00B4  52				push		edx
00B5  E8 00 00 00 00			call		_GetExitCodeProcess
00BA  85 C0				test		eax,eax
00BC  75 DC				jne		L$3
00BE  EB A6				jmp		L$1
00C0				L$4:
00C0  6A FF				push		0xffffffff
00C2  8B 74 24 48			mov		esi,dword ptr 0x48[esp]
00C6  56				push		esi
00C7  E8 00 00 00 00			call		_WaitForSingleObject
00CC  85 C0				test		eax,eax
00CE  75 11				jne		L$5
00D0  8D 44 24 54			lea		eax,0x54[esp]
00D4  50				push		eax
00D5  8B 7C 24 48			mov		edi,dword ptr 0x48[esp]
00D9  57				push		edi
00DA  E8 00 00 00 00			call		_GetExitCodeProcess
00DF  EB 0F				jmp		L$8
00E1				L$5:
00E1  E8 00 00 00 00			call		__set_errno_nt_
00E6  EB 04				jmp		L$7
00E8				L$6:
00E8  8B 44 24 4C			mov		eax,dword ptr 0x4c[esp]
00EC				L$7:
00EC  89 44 24 54			mov		dword ptr 0x54[esp],eax
00F0				L$8:
00F0  8B 5C 24 44			mov		ebx,dword ptr 0x44[esp]
00F4  53				push		ebx
00F5  E8 00 00 00 00			call		_CloseHandle
00FA  8B 4C 24 48			mov		ecx,dword ptr 0x48[esp]
00FE  51				push		ecx
00FF  E8 00 00 00 00			call		_CloseHandle
0104  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
0108				L$9:
0108  83 C4 58				add		esp,0x00000058
010B  5D				pop		ebp
010C  5F				pop		edi
010D  5E				pop		esi
010E  5A				pop		edx
010F  59				pop		ecx
0110  5B				pop		ebx
0111  C3				ret		

Routine Size: 274 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

