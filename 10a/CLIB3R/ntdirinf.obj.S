Module: ntdirinf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C6 bytes
0000				__MakeDOSDT_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  89 D6				mov		esi,edx
0007  89 E2				mov		edx,esp
0009  52				push		edx
000A  50				push		eax
000B  E8 00 00 00 00			call		_FileTimeToLocalFileTime
0010  53				push		ebx
0011  56				push		esi
0012  8D 44 24 08			lea		eax,0x8[esp]
0016  50				push		eax
0017  E8 00 00 00 00			call		_FileTimeToDosDateTime
001C  83 C4 08				add		esp,0x00000008
001F  5E				pop		esi
0020  59				pop		ecx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				__FromDOSDT_:
0022  51				push		ecx
0023  83 EC 08				sub		esp,0x00000008
0026  89 C1				mov		ecx,eax
0028  89 E0				mov		eax,esp
002A  50				push		eax
002B  31 C0				xor		eax,eax
002D  66 89 D0				mov		ax,dx
0030  50				push		eax
0031  31 C0				xor		eax,eax
0033  66 89 C8				mov		ax,cx
0036  50				push		eax
0037  E8 00 00 00 00			call		_DosDateTimeToFileTime
003C  53				push		ebx
003D  8D 44 24 04			lea		eax,0x4[esp]
0041  50				push		eax
0042  E8 00 00 00 00			call		_LocalFileTimeToFileTime
0047  83 C4 08				add		esp,0x00000008
004A  59				pop		ecx
004B  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0022

004C				__GetNTDirInfo_:
004C  53				push		ebx
004D  51				push		ecx
004E  56				push		esi
004F  89 C1				mov		ecx,eax
0051  89 D6				mov		esi,edx
0053  8D 58 16				lea		ebx,0x16[eax]
0056  8D 50 18				lea		edx,0x18[eax]
0059  8D 46 14				lea		eax,0x14[esi]
005C  E8 00 00 00 00			call		__MakeDOSDT_
0061  8A 06				mov		al,byte ptr [esi]
0063  88 41 15				mov		byte ptr 0x15[ecx],al
0066  BB FF 00 00 00			mov		ebx,0x000000ff
006B  8B 46 20				mov		eax,dword ptr 0x20[esi]
006E  8D 56 2C				lea		edx,0x2c[esi]
0071  89 41 1A				mov		dword ptr 0x1a[ecx],eax
0074  8D 41 1E				lea		eax,0x1e[ecx]
0077  E8 00 00 00 00			call		strncpy_
007C  C6 81 1D 01 00 00 00		mov		byte ptr 0x11d[ecx],0x00
0083  5E				pop		esi
0084  59				pop		ecx
0085  5B				pop		ebx
0086  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 004C

0087				__NTFindNextFileWithAttr_:
0087  51				push		ecx
0088  56				push		esi
0089  83 EC 04				sub		esp,0x00000004
008C  89 C6				mov		esi,eax
008E  89 14 24				mov		dword ptr [esp],edx
0091  8A 24 24				mov		ah,byte ptr [esp]
0094  80 CC A1				or		ah,0xa1
0097  88 24 24				mov		byte ptr [esp],ah
009A  F6 C4 08				test		ah,0x08
009D  74 08				je		L$1
009F  88 E6				mov		dh,ah
00A1  80 E6 F7				and		dh,0xf7
00A4  88 34 24				mov		byte ptr [esp],dh
00A7				L$1:
00A7  8B 04 24				mov		eax,dword ptr [esp]
00AA  85 03				test		dword ptr [ebx],eax
00AC  74 07				je		L$2
00AE  B8 01 00 00 00			mov		eax,0x00000001
00B3  EB 0B				jmp		L$3
00B5				L$2:
00B5  53				push		ebx
00B6  56				push		esi
00B7  E8 00 00 00 00			call		_FindNextFileA
00BC  85 C0				test		eax,eax
00BE  75 E7				jne		L$1
00C0				L$3:
00C0  83 C4 04				add		esp,0x00000004
00C3  5E				pop		esi
00C4  59				pop		ecx
00C5  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0087

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

