Module: fullpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000085 bytes
0000				_fullpath:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000A  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000E  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
0012  85 DB				test		ebx,ebx
0014  75 22				jne		L$2
0016  BF 04 01 00 00			mov		edi,0x00000104
001B  57				push		edi
001C  E8 00 00 00 00			call		malloc
0021  83 C4 04				add		esp,0x00000004
0024  89 C3				mov		ebx,eax
0026  85 C0				test		eax,eax
0028  75 0E				jne		L$2
002A  6A 05				push		0x00000005
002C				L$1:
002C  E8 00 00 00 00			call		__set_errno
0031  83 C4 04				add		esp,0x00000004
0034  31 C0				xor		eax,eax
0036  EB 46				jmp		L$8
0038				L$2:
0038  85 F6				test		esi,esi
003A  74 05				je		L$3
003C  80 3E 00				cmp		byte ptr [esi],0x00
003F  75 0C				jne		L$4
0041				L$3:
0041  57				push		edi
0042  53				push		ebx
0043  E8 00 00 00 00			call		getcwd
0048  83 C4 08				add		esp,0x00000008
004B  EB 31				jmp		L$8
004D				L$4:
004D  68 00 00 00 00			push		offset DGROUP:L$9
0052  56				push		esi
0053  E8 00 00 00 00			call		strcmp
0058  83 C4 08				add		esp,0x00000008
005B  85 C0				test		eax,eax
005D  75 12				jne		L$6
005F  83 FF 04				cmp		edi,0x00000004
0062  73 04				jae		L$5
0064  6A 0E				push		0x0000000e
0066  EB C4				jmp		L$1
0068				L$5:
0068  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$9
006D  89 03				mov		dword ptr [ebx],eax
006F  EB 0B				jmp		L$7
0071				L$6:
0071  89 E0				mov		eax,esp
0073  50				push		eax
0074  53				push		ebx
0075  57				push		edi
0076  56				push		esi
0077  E8 00 00 00 00			call		_GetFullPathNameA
007C				L$7:
007C  89 D8				mov		eax,ebx
007E				L$8:
007E  83 C4 04				add		esp,0x00000004
0081  5F				pop		edi
0082  5E				pop		esi
0083  5B				pop		ebx
0084  C3				ret		

Routine Size: 133 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000				L$9:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

