Module: fstatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000170 bytes
0000				_fstat_:
0000				fstat_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 24				sub		esp,0x00000024
0007  89 C7				mov		edi,eax
0009  89 D6				mov		esi,edx
000B  89 C3				mov		ebx,eax
000D  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0012  8B 1C 98				mov		ebx,dword ptr [eax+ebx*4]
0015  89 F8				mov		eax,edi
0017  FF 15 00 00 00 00			call		dword ptr __AccessFileH
001D  89 F8				mov		eax,edi
001F  66 C7 42 08 00 00			mov		word ptr 0x8[edx],0x0000
0025  E8 00 00 00 00			call		__IOMode_
002A  89 44 24 18			mov		dword ptr 0x18[esp],eax
002E  A8 01				test		al,0x01
0030  74 0E				je		L$1
0032  66 8B 52 08			mov		dx,word ptr 0x8[edx]
0036  81 CA 24 01 00 00			or		edx,0x00000124
003C  66 89 56 08			mov		word ptr 0x8[esi],dx
0040				L$1:
0040  F6 44 24 18 02			test		byte ptr 0x18[esp],0x02
0045  74 04				je		L$2
0047  80 4E 08 92			or		byte ptr 0x8[esi],0x92
004B				L$2:
004B  53				push		ebx
004C  E8 00 00 00 00			call		_GetFileType
0051  F6 44 24 19 20			test		byte ptr 0x19[esp],0x20
0056  75 0E				jne		L$3
0058  83 F8 02				cmp		eax,0x00000002
005B  74 09				je		L$3
005D  83 F8 03				cmp		eax,0x00000003
0060  74 04				je		L$3
0062  85 C0				test		eax,eax
0064  75 29				jne		L$4
0066				L$3:
0066  C7 46 16 00 00 00 00		mov		dword ptr 0x16[esi],0x00000000
006D  C7 46 1E 00 00 00 00		mov		dword ptr 0x1e[esi],0x00000000
0074  66 C7 46 08 24 21			mov		word ptr 0x8[esi],0x2124
007A  C7 46 12 01 00 00 00		mov		dword ptr 0x12[esi],0x00000001
0081  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
0084  89 46 22				mov		dword ptr 0x22[esi],eax
0087  89 46 1A				mov		dword ptr 0x1a[esi],eax
008A  E9 B3 00 00 00			jmp		L$7
008F				L$4:
008F  6A 00				push		0x00000000
0091  53				push		ebx
0092  E8 00 00 00 00			call		_GetFileSize
0097  83 F8 FF				cmp		eax,0xffffffff
009A  75 12				jne		L$6
009C				L$5:
009C  89 F8				mov		eax,edi
009E  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00A4  E8 00 00 00 00			call		__set_errno_nt_
00A9  E9 BA 00 00 00			jmp		L$8
00AE				L$6:
00AE  89 46 16				mov		dword ptr 0x16[esi],eax
00B1  89 E0				mov		eax,esp
00B3  50				push		eax
00B4  8D 44 24 0C			lea		eax,0xc[esp]
00B8  50				push		eax
00B9  8D 44 24 18			lea		eax,0x18[esp]
00BD  50				push		eax
00BE  53				push		ebx
00BF  E8 00 00 00 00			call		_GetFileTime
00C4  85 C0				test		eax,eax
00C6  74 D4				je		L$5
00C8  8D 44 24 10			lea		eax,0x10[esp]
00CC  8D 54 24 20			lea		edx,0x20[esp]
00D0  8D 5C 24 1C			lea		ebx,0x1c[esp]
00D4  E8 00 00 00 00			call		__MakeDOSDT_
00D9  31 D2				xor		edx,edx
00DB  31 C0				xor		eax,eax
00DD  66 8B 54 24 1C			mov		dx,word ptr 0x1c[esp]
00E2  66 8B 44 24 20			mov		ax,word ptr 0x20[esp]
00E7  8D 5C 24 1C			lea		ebx,0x1c[esp]
00EB  E8 00 00 00 00			call		_d2ttime_
00F0  8D 54 24 20			lea		edx,0x20[esp]
00F4  89 46 22				mov		dword ptr 0x22[esi],eax
00F7  8D 44 24 08			lea		eax,0x8[esp]
00FB  E8 00 00 00 00			call		__MakeDOSDT_
0100  31 D2				xor		edx,edx
0102  31 C0				xor		eax,eax
0104  66 8B 54 24 1C			mov		dx,word ptr 0x1c[esp]
0109  66 8B 44 24 20			mov		ax,word ptr 0x20[esp]
010E  8D 5C 24 1C			lea		ebx,0x1c[esp]
0112  E8 00 00 00 00			call		_d2ttime_
0117  8D 54 24 20			lea		edx,0x20[esp]
011B  89 46 1A				mov		dword ptr 0x1a[esi],eax
011E  89 E0				mov		eax,esp
0120  E8 00 00 00 00			call		__MakeDOSDT_
0125  31 D2				xor		edx,edx
0127  31 C0				xor		eax,eax
0129  66 8B 54 24 1C			mov		dx,word ptr 0x1c[esp]
012E  66 8B 44 24 20			mov		ax,word ptr 0x20[esp]
0133  E8 00 00 00 00			call		_d2ttime_
0138  C7 46 12 00 00 00 00		mov		dword ptr 0x12[esi],0x00000000
013F  89 46 1E				mov		dword ptr 0x1e[esi],eax
0142				L$7:
0142  8B 46 12				mov		eax,dword ptr 0x12[esi]
0145  89 06				mov		dword ptr [esi],eax
0147  89 F8				mov		eax,edi
0149  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
014F  66 C7 46 0A 01 00			mov		word ptr 0xa[esi],0x0001
0155  66 C7 46 10 00 00			mov		word ptr 0x10[esi],0x0000
015B  66 8B 46 10			mov		ax,word ptr 0x10[esi]
015F  89 7E 04				mov		dword ptr 0x4[esi],edi
0162  98				cwde		
0163  89 46 0C				mov		dword ptr 0xc[esi],eax
0166  31 C0				xor		eax,eax
0168				L$8:
0168  83 C4 24				add		esp,0x00000024
016B  5F				pop		edi
016C  5E				pop		esi
016D  59				pop		ecx
016E  5B				pop		ebx
016F  C3				ret		

Routine Size: 368 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

