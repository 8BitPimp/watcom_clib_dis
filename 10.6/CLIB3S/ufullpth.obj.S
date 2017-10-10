Module: ufullpth
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009B bytes
0000				_u_fullpath:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000F  8B 6C 24 20			mov		ebp,dword ptr 0x20[esp]
0013  85 DB				test		ebx,ebx
0015  75 28				jne		L$3
0017  68 08 02 00 00			push		0x00000208
001C  BD 04 01 00 00			mov		ebp,0x00000104
0021  E8 00 00 00 00			call		malloc
0026  83 C4 04				add		esp,0x00000004
0029  89 C7				mov		edi,eax
002B  85 C0				test		eax,eax
002D  75 0E				jne		L$2
002F  6A 05				push		0x00000005
0031				L$1:
0031  E8 00 00 00 00			call		__set_errno
0036  83 C4 04				add		esp,0x00000004
0039  31 C0				xor		eax,eax
003B  EB 56				jmp		L$9
003D				L$2:
003D  89 C3				mov		ebx,eax
003F				L$3:
003F  85 F6				test		esi,esi
0041  74 06				je		L$4
0043  66 83 3E 00			cmp		word ptr [esi],0x0000
0047  75 0C				jne		L$6
0049				L$4:
0049  55				push		ebp
004A  53				push		ebx
004B  E8 00 00 00 00			call		_ugetcwd
0050				L$5:
0050  83 C4 08				add		esp,0x00000008
0053  EB 3E				jmp		L$9
0055				L$6:
0055  68 00 00 00 00			push		offset DGROUP:L$10
005A  56				push		esi
005B  E8 00 00 00 00			call		_ustricmp
0060  83 C4 08				add		esp,0x00000008
0063  85 C0				test		eax,eax
0065  75 1F				jne		L$8
0067  83 FD 04				cmp		ebp,0x00000004
006A  73 0D				jae		L$7
006C  57				push		edi
006D  E8 00 00 00 00			call		free
0072  83 C4 04				add		esp,0x00000004
0075  6A 0E				push		0x0000000e
0077  EB B8				jmp		L$1
0079				L$7:
0079  68 00 00 00 00			push		offset DGROUP:L$10
007E  53				push		ebx
007F  E8 00 00 00 00			call		_ustrcpy
0084  EB CA				jmp		L$5
0086				L$8:
0086  89 E0				mov		eax,esp
0088  50				push		eax
0089  53				push		ebx
008A  55				push		ebp
008B  56				push		esi
008C  E8 00 00 00 00			call		_GetFullPathNameW
0091  89 D8				mov		eax,ebx
0093				L$9:
0093  83 C4 04				add		esp,0x00000004
0096  5D				pop		ebp
0097  5F				pop		edi
0098  5E				pop		esi
0099  5B				pop		ebx
009A  C3				ret		

Routine Size: 155 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000008 bytes
0000				L$10:
0000  63 00 6F 00 6E 00 00 00                         c.o.n...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

