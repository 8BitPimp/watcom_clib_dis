Module: findwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F4 bytes
0000				_dos_findfirst:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  81 EC 40 01 00 00			sub		esp,0x00000140
0009  8B BC 24 54 01 00 00		mov		edi,dword ptr 0x154[esp]
0010  8B 9C 24 58 01 00 00		mov		ebx,dword ptr 0x158[esp]
0017  89 E0				mov		eax,esp
0019  50				push		eax
001A  8B 94 24 54 01 00 00		mov		edx,dword ptr 0x154[esp]
0021  52				push		edx
0022  E8 00 00 00 00			call		_FindFirstFileA
0027  89 C6				mov		esi,eax
0029  83 F8 FF				cmp		eax,0xffffffff
002C  75 09				jne		L$1
002E  89 03				mov		dword ptr [ebx],eax
0030  E8 00 00 00 00			call		__set_errno_nt
0035  EB 45				jmp		L$4
0037				L$1:
0037  85 FF				test		edi,edi
0039  75 05				jne		L$2
003B  BF E7 FF FF FF			mov		edi,0xffffffe7
0040				L$2:
0040  89 E0				mov		eax,esp
0042  50				push		eax
0043  57				push		edi
0044  56				push		esi
0045  E8 00 00 00 00			call		__NTFindNextFileWithAttr
004A  83 C4 0C				add		esp,0x0000000c
004D  85 C0				test		eax,eax
004F  75 18				jne		L$3
0051  56				push		esi
0052  C7 03 FF FF FF FF			mov		dword ptr [ebx],0xffffffff
0058  E8 00 00 00 00			call		_FindClose
005D  6A 02				push		0x00000002
005F  E8 00 00 00 00			call		__set_errno_dos
0064  83 C4 04				add		esp,0x00000004
0067  EB 13				jmp		L$4
0069				L$3:
0069  89 E0				mov		eax,esp
006B  50				push		eax
006C  89 33				mov		dword ptr [ebx],esi
006E  53				push		ebx
006F  89 7B 04				mov		dword ptr 0x4[ebx],edi
0072  E8 00 00 00 00			call		__GetNTDirInfo
0077  83 C4 08				add		esp,0x00000008
007A  31 C0				xor		eax,eax
007C				L$4:
007C  81 C4 40 01 00 00			add		esp,0x00000140
0082  5F				pop		edi
0083  5E				pop		esi
0084  5B				pop		ebx
0085  C3				ret		

Routine Size: 134 bytes,    Routine Base: _TEXT + 0000

0086				_dos_findnext:
0086  53				push		ebx
0087  56				push		esi
0088  81 EC 40 01 00 00			sub		esp,0x00000140
008E  8B 9C 24 4C 01 00 00		mov		ebx,dword ptr 0x14c[esp]
0095  89 E0				mov		eax,esp
0097  50				push		eax
0098  8B 13				mov		edx,dword ptr [ebx]
009A  52				push		edx
009B  E8 00 00 00 00			call		_FindNextFileA
00A0  85 C0				test		eax,eax
00A2  75 07				jne		L$6
00A4				L$5:
00A4  E8 00 00 00 00			call		__set_errno_nt
00A9  EB 24				jmp		L$7
00AB				L$6:
00AB  89 E0				mov		eax,esp
00AD  50				push		eax
00AE  8B 4B 04				mov		ecx,dword ptr 0x4[ebx]
00B1  51				push		ecx
00B2  8B 33				mov		esi,dword ptr [ebx]
00B4  56				push		esi
00B5  E8 00 00 00 00			call		__NTFindNextFileWithAttr
00BA  83 C4 0C				add		esp,0x0000000c
00BD  85 C0				test		eax,eax
00BF  74 E3				je		L$5
00C1  89 E0				mov		eax,esp
00C3  50				push		eax
00C4  53				push		ebx
00C5  E8 00 00 00 00			call		__GetNTDirInfo
00CA  83 C4 08				add		esp,0x00000008
00CD  31 C0				xor		eax,eax
00CF				L$7:
00CF  81 C4 40 01 00 00			add		esp,0x00000140
00D5  5E				pop		esi
00D6  5B				pop		ebx
00D7  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0086

00D8				_dos_findclose:
00D8  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00DC  8B 10				mov		edx,dword ptr [eax]
00DE  83 FA FF				cmp		edx,0xffffffff
00E1  74 0E				je		L$8
00E3  52				push		edx
00E4  E8 00 00 00 00			call		_FindClose
00E9  85 C0				test		eax,eax
00EB  0F 84 00 00 00 00			je		__set_errno_nt
00F1				L$8:
00F1  31 C0				xor		eax,eax
00F3  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 00D8

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

