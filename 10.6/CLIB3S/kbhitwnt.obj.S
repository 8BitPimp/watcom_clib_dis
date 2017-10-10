Module: kbhitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000092 bytes
0000				kbhit:
0000  53				push		ebx
0001  83 EC 18				sub		esp,0x00000018
0004  8B 15 00 00 00 00			mov		edx,dword ptr _WindowsKbhit
000A  85 D2				test		edx,edx
000C  74 1A				je		L$1
000E  6A 00				push		0x00000000
0010  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0016  83 C4 04				add		esp,0x00000004
0019  50				push		eax
001A  FF 15 00 00 00 00			call		dword ptr _WindowsKbhit
0020  83 C4 04				add		esp,0x00000004
0023  83 C4 18				add		esp,0x00000018
0026  5B				pop		ebx
0027  C3				ret		
0028				L$1:
0028  52				push		edx
0029  FF 15 00 00 00 00			call		dword ptr _AccessFileH
002F  83 C4 04				add		esp,0x00000004
0032  E8 00 00 00 00			call		__NTConsoleInput
0037  89 C3				mov		ebx,eax
0039				L$2:
0039  8D 44 24 14			lea		eax,0x14[esp]
003D  50				push		eax
003E  6A 01				push		0x00000001
0040  8D 44 24 08			lea		eax,0x8[esp]
0044  50				push		eax
0045  53				push		ebx
0046  E8 00 00 00 00			call		_PeekConsoleInputA
004B  83 7C 24 14 00			cmp		dword ptr 0x14[esp],0x00000000
0050  74 23				je		L$3
0052  89 E0				mov		eax,esp
0054  50				push		eax
0055  E8 00 00 00 00			call		__NTRealKey
005A  83 C4 04				add		esp,0x00000004
005D  85 C0				test		eax,eax
005F  75 14				jne		L$3
0061  8D 44 24 14			lea		eax,0x14[esp]
0065  50				push		eax
0066  6A 01				push		0x00000001
0068  8D 44 24 08			lea		eax,0x8[esp]
006C  50				push		eax
006D  53				push		ebx
006E  E8 00 00 00 00			call		_ReadConsoleInputA
0073  EB C4				jmp		L$2
0075				L$3:
0075  6A 00				push		0x00000000
0077  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
007D  83 C4 04				add		esp,0x00000004
0080  83 7C 24 14 00			cmp		dword ptr 0x14[esp],0x00000000
0085  0F 95 C0				setne		al
0088  25 FF 00 00 00			and		eax,0x000000ff
008D  83 C4 18				add		esp,0x00000018
0090  5B				pop		ebx
0091  C3				ret		

Routine Size: 146 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

