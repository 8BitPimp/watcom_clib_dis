Module: filewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000EA bytes
0000				_dos_open:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  E8 00 00 00 00			call		__NTAtMaxFiles
000C  85 C0				test		eax,eax
000E  74 14				je		L$1
0010  6A 0B				push		0x0000000b
0012  E8 00 00 00 00			call		__set_errno
0017  B8 FF FF FF FF			mov		eax,0xffffffff
001C  83 C4 04				add		esp,0x00000004
001F  E9 93 00 00 00			jmp		L$6
0024				L$1:
0024  89 E0				mov		eax,esp
0026  50				push		eax
0027  8D 44 24 08			lea		eax,0x8[esp]
002B  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
002F  50				push		eax
0030  83 E3 07				and		ebx,0x00000007
0033  53				push		ebx
0034  E8 00 00 00 00			call		__GetNTAccessAttr
0039  83 C4 0C				add		esp,0x0000000c
003C  8D 44 24 08			lea		eax,0x8[esp]
0040  50				push		eax
0041  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0045  83 E0 70				and		eax,0x00000070
0048  50				push		eax
0049  E8 00 00 00 00			call		__GetNTShareAttr
004E  83 C4 08				add		esp,0x00000008
0051  6A 00				push		0x00000000
0053  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0057  52				push		edx
0058  6A 03				push		0x00000003
005A  6A 00				push		0x00000000
005C  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0060  51				push		ecx
0061  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0065  57				push		edi
0066  8B 6C 24 38			mov		ebp,dword ptr 0x38[esp]
006A  55				push		ebp
006B  E8 00 00 00 00			call		_CreateFileA
0070  83 F8 FF				cmp		eax,0xffffffff
0073  75 07				jne		L$2
0075  E8 00 00 00 00			call		__set_errno_nt
007A  EB 3B				jmp		L$6
007C				L$2:
007C  50				push		eax
007D  FF 15 00 00 00 00			call		dword ptr _InitAccessH
0083  83 C4 04				add		esp,0x00000004
0086  8B 4C 24 28			mov		ecx,dword ptr 0x28[esp]
008A  89 C2				mov		edx,eax
008C  89 01				mov		dword ptr [ecx],eax
008E  83 FB 02				cmp		ebx,0x00000002
0091  75 05				jne		L$3
0093  BE 03 00 00 00			mov		esi,0x00000003
0098				L$3:
0098  85 DB				test		ebx,ebx
009A  75 05				jne		L$4
009C  BE 01 00 00 00			mov		esi,0x00000001
00A1				L$4:
00A1  83 FB 01				cmp		ebx,0x00000001
00A4  75 05				jne		L$5
00A6  BE 02 00 00 00			mov		esi,0x00000002
00AB				L$5:
00AB  56				push		esi
00AC  52				push		edx
00AD  E8 00 00 00 00			call		__SetIOMode
00B2  83 C4 08				add		esp,0x00000008
00B5  31 C0				xor		eax,eax
00B7				L$6:
00B7  83 C4 0C				add		esp,0x0000000c
00BA  5D				pop		ebp
00BB  5F				pop		edi
00BC  5E				pop		esi
00BD  5B				pop		ebx
00BE  C3				ret		

Routine Size: 191 bytes,    Routine Base: _TEXT + 0000

00BF				_dos_close:
00BF  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00C3  52				push		edx
00C4  E8 00 00 00 00			call		close
00C9  83 C4 04				add		esp,0x00000004
00CC  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 00BF

00CD				_dos_commit:
00CD  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00D1  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
00D6  8B 04 90				mov		eax,dword ptr [eax+edx*4]
00D9  50				push		eax
00DA  E8 00 00 00 00			call		_FlushFileBuffers
00DF  85 C0				test		eax,eax
00E1  0F 84 00 00 00 00			je		__set_errno_nt
00E7  31 C0				xor		eax,eax
00E9  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 00CD

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

