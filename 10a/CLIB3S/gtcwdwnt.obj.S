Module: gtcwdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000				getcwd:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  81 EC 04 01 00 00			sub		esp,0x00000104
0009  8B 9C 24 14 01 00 00		mov		ebx,dword ptr 0x114[esp]
0010  89 E0				mov		eax,esp
0012  50				push		eax
0013  68 04 01 00 00			push		0x00000104
0018  E8 00 00 00 00			call		_GetCurrentDirectoryA
001D  89 C2				mov		edx,eax
001F  89 C6				mov		esi,eax
0021  85 C0				test		eax,eax
0023  75 07				jne		L$1
0025  E8 00 00 00 00			call		__set_errno_nt
002A  EB 20				jmp		L$3
002C				L$1:
002C  85 DB				test		ebx,ebx
002E  75 20				jne		L$4
0030  8D 50 01				lea		edx,0x1[eax]
0033  52				push		edx
0034  E8 00 00 00 00			call		malloc
0039  83 C4 04				add		esp,0x00000004
003C  89 C3				mov		ebx,eax
003E  85 C0				test		eax,eax
0040  75 1B				jne		L$5
0042  6A 05				push		0x00000005
0044				L$2:
0044  E8 00 00 00 00			call		__set_errno
0049  83 C4 04				add		esp,0x00000004
004C				L$3:
004C  31 C0				xor		eax,eax
004E  EB 2C				jmp		L$6
0050				L$4:
0050  3B 84 24 18 01 00 00		cmp		eax,dword ptr 0x118[esp]
0057  76 04				jbe		L$5
0059  6A 0E				push		0x0000000e
005B  EB E7				jmp		L$2
005D				L$5:
005D  8D 4E 01				lea		ecx,0x1[esi]
0060  89 DF				mov		edi,ebx
0062  89 E6				mov		esi,esp
0064  06				push		es
0065  8C D8				mov		eax,ds
0067  8E C0				mov		es,eax
0069  57				push		edi
006A  89 C8				mov		eax,ecx
006C  C1 E9 02				shr		ecx,0x02
006F  F2 A5				repne movsd	
0071  8A C8				mov		cl,al
0073  80 E1 03				and		cl,0x03
0076  F2 A4				repne movsb	
0078  5F				pop		edi
0079  07				pop		es
007A  89 D8				mov		eax,ebx
007C				L$6:
007C  81 C4 04 01 00 00			add		esp,0x00000104
0082  5F				pop		edi
0083  5E				pop		esi
0084  5B				pop		ebx
0085  C3				ret		

Routine Size: 134 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

