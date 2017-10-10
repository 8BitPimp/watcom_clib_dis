Module: utimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000142 bytes
0000				utime_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 48				sub		esp,0x00000048
0007  89 D3				mov		ebx,edx
0009  6A 00				push		0x00000000
000B  6A 00				push		0x00000000
000D  6A 03				push		0x00000003
000F  6A 00				push		0x00000000
0011  6A 00				push		0x00000000
0013  68 00 00 00 C0			push		0xc0000000
0018  50				push		eax
0019  E8 00 00 00 00			call		_CreateFileA
001E  89 C7				mov		edi,eax
0020  89 C6				mov		esi,eax
0022  83 F8 FF				cmp		eax,0xffffffff
0025  74 1F				je		L$2
0027  8D 44 24 28			lea		eax,0x28[esp]
002B  50				push		eax
002C  8D 44 24 34			lea		eax,0x34[esp]
0030  50				push		eax
0031  8D 44 24 48			lea		eax,0x48[esp]
0035  50				push		eax
0036  57				push		edi
0037  E8 00 00 00 00			call		_GetFileTime
003C  85 C0				test		eax,eax
003E  75 10				jne		L$3
0040  57				push		edi
0041				L$1:
0041  E8 00 00 00 00			call		_CloseHandle
0046				L$2:
0046  E8 00 00 00 00			call		__set_errno_nt_
004B  E9 EA 00 00 00			jmp		L$6
0050				L$3:
0050  85 DB				test		ebx,ebx
0052  75 13				jne		L$4
0054  31 C0				xor		eax,eax
0056  8D 5C 24 38			lea		ebx,0x38[esp]
005A  E8 00 00 00 00			call		time_
005F  89 44 24 3C			mov		dword ptr 0x3c[esp],eax
0063  89 44 24 38			mov		dword ptr 0x38[esp],eax
0067				L$4:
0067  8D 43 04				lea		eax,0x4[ebx]
006A  E8 00 00 00 00			call		localtime_
006F  89 C2				mov		edx,eax
0071  B8 6C 07 00 00			mov		eax,0x0000076c
0076  66 8B 5A 14			mov		bx,word ptr 0x14[edx]
007A  01 D8				add		eax,ebx
007C  66 89 04 24			mov		word ptr [esp],ax
0080  66 89 44 24 10			mov		word ptr 0x10[esp],ax
0085  66 8B 42 10			mov		ax,word ptr 0x10[edx]
0089  40				inc		eax
008A  66 89 44 24 02			mov		word ptr 0x2[esp],ax
008F  66 89 44 24 12			mov		word ptr 0x12[esp],ax
0094  66 8B 42 0C			mov		ax,word ptr 0xc[edx]
0098  66 89 44 24 06			mov		word ptr 0x6[esp],ax
009D  66 89 44 24 16			mov		word ptr 0x16[esp],ax
00A2  66 8B 42 08			mov		ax,word ptr 0x8[edx]
00A6  66 89 44 24 08			mov		word ptr 0x8[esp],ax
00AB  66 89 44 24 18			mov		word ptr 0x18[esp],ax
00B0  66 8B 42 04			mov		ax,word ptr 0x4[edx]
00B4  66 89 44 24 0A			mov		word ptr 0xa[esp],ax
00B9  66 89 44 24 1A			mov		word ptr 0x1a[esp],ax
00BE  66 8B 02				mov		ax,word ptr [edx]
00C1  66 89 44 24 0C			mov		word ptr 0xc[esp],ax
00C6  66 89 44 24 1C			mov		word ptr 0x1c[esp],ax
00CB  8D 44 24 20			lea		eax,0x20[esp]
00CF  50				push		eax
00D0  8D 44 24 14			lea		eax,0x14[esp]
00D4  31 C9				xor		ecx,ecx
00D6  50				push		eax
00D7  66 89 4C 24 16			mov		word ptr 0x16[esp],cx
00DC  66 89 4C 24 26			mov		word ptr 0x26[esp],cx
00E1  E8 00 00 00 00			call		_SystemTimeToFileTime
00E6  8D 44 24 28			lea		eax,0x28[esp]
00EA  50				push		eax
00EB  8D 44 24 24			lea		eax,0x24[esp]
00EF  50				push		eax
00F0  E8 00 00 00 00			call		_LocalFileTimeToFileTime
00F5  8D 44 24 20			lea		eax,0x20[esp]
00F9  50				push		eax
00FA  8D 44 24 04			lea		eax,0x4[esp]
00FE  50				push		eax
00FF  E8 00 00 00 00			call		_SystemTimeToFileTime
0104  8D 44 24 30			lea		eax,0x30[esp]
0108  50				push		eax
0109  8D 44 24 24			lea		eax,0x24[esp]
010D  50				push		eax
010E  E8 00 00 00 00			call		_LocalFileTimeToFileTime
0113  8D 44 24 28			lea		eax,0x28[esp]
0117  50				push		eax
0118  8D 44 24 34			lea		eax,0x34[esp]
011C  50				push		eax
011D  8D 44 24 48			lea		eax,0x48[esp]
0121  50				push		eax
0122  56				push		esi
0123  E8 00 00 00 00			call		_SetFileTime
0128  85 C0				test		eax,eax
012A  75 06				jne		L$5
012C  56				push		esi
012D  E9 0F FF FF FF			jmp		L$1
0132				L$5:
0132  56				push		esi
0133  E8 00 00 00 00			call		_CloseHandle
0138  31 C0				xor		eax,eax
013A				L$6:
013A  83 C4 48				add		esp,0x00000048
013D  5F				pop		edi
013E  5E				pop		esi
013F  59				pop		ecx
0140  5B				pop		ebx
0141  C3				ret		

Routine Size: 322 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

