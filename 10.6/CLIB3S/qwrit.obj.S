Module: qwrit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CD bytes
0000				__qwrite:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000A  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
000F  89 DE				mov		esi,ebx
0011  53				push		ebx
0012  8B 34 B0				mov		esi,dword ptr [eax+esi*4]
0015  FF 15 00 00 00 00			call		dword ptr _AccessFileH
001B  83 C4 04				add		esp,0x00000004
001E  53				push		ebx
001F  E8 00 00 00 00			call		__IOMode
0024  83 C4 04				add		esp,0x00000004
0027  A8 80				test		al,0x80
0029  74 25				je		L$2
002B  6A 02				push		0x00000002
002D  6A 00				push		0x00000000
002F  6A 00				push		0x00000000
0031  56				push		esi
0032  E8 00 00 00 00			call		_SetFilePointer
0037  83 F8 FF				cmp		eax,0xffffffff
003A  75 14				jne		L$2
003C				L$1:
003C  53				push		ebx
003D  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0043  83 C4 04				add		esp,0x00000004
0046  E8 00 00 00 00			call		__set_errno_nt
004B  E9 76 00 00 00			jmp		L$5
0050				L$2:
0050  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdout,0x00000000
0057  74 32				je		L$3
0059  53				push		ebx
005A  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0060  83 C4 04				add		esp,0x00000004
0063  85 C0				test		eax,eax
0065  74 24				je		L$3
0067  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
006B  52				push		edx
006C  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
0070  51				push		ecx
0071  50				push		eax
0072  FF 15 00 00 00 00			call		dword ptr _WindowsStdout
0078  83 C4 0C				add		esp,0x0000000c
007B  53				push		ebx
007C  89 C6				mov		esi,eax
007E  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0084  83 C4 04				add		esp,0x00000004
0087  89 F0				mov		eax,esi
0089  EB 3B				jmp		L$5
008B				L$3:
008B  6A 00				push		0x00000000
008D  8D 44 24 04			lea		eax,0x4[esp]
0091  50				push		eax
0092  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0096  51				push		ecx
0097  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
009B  57				push		edi
009C  56				push		esi
009D  E8 00 00 00 00			call		_WriteFile
00A2  85 C0				test		eax,eax
00A4  74 96				je		L$1
00A6  8B 04 24				mov		eax,dword ptr [esp]
00A9  3B 44 24 1C			cmp		eax,dword ptr 0x1c[esp]
00AD  74 0A				je		L$4
00AF  6A 0C				push		0x0000000c
00B1  E8 00 00 00 00			call		__set_errno
00B6  83 C4 04				add		esp,0x00000004
00B9				L$4:
00B9  53				push		ebx
00BA  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00C0  83 C4 04				add		esp,0x00000004
00C3  8B 04 24				mov		eax,dword ptr [esp]
00C6				L$5:
00C6  83 C4 04				add		esp,0x00000004
00C9  5F				pop		edi
00CA  5E				pop		esi
00CB  5B				pop		ebx
00CC  C3				ret		

Routine Size: 205 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

