Module: gtcwdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
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
001D  89 C6				mov		esi,eax
001F  85 C0				test		eax,eax
0021  75 07				jne		L$1
0023  E8 00 00 00 00			call		__set_errno_nt
0028  EB 1E				jmp		L$3
002A				L$1:
002A  85 DB				test		ebx,ebx
002C  75 1E				jne		L$4
002E  40				inc		eax
002F  50				push		eax
0030  E8 00 00 00 00			call		malloc
0035  83 C4 04				add		esp,0x00000004
0038  89 C3				mov		ebx,eax
003A  85 C0				test		eax,eax
003C  75 1B				jne		L$5
003E  6A 05				push		0x00000005
0040				L$2:
0040  E8 00 00 00 00			call		__set_errno
0045  83 C4 04				add		esp,0x00000004
0048				L$3:
0048  31 C0				xor		eax,eax
004A  EB 2C				jmp		L$6
004C				L$4:
004C  3B 84 24 18 01 00 00		cmp		eax,dword ptr 0x118[esp]
0053  76 04				jbe		L$5
0055  6A 0E				push		0x0000000e
0057  EB E7				jmp		L$2
0059				L$5:
0059  8D 4E 01				lea		ecx,0x1[esi]
005C  89 DF				mov		edi,ebx
005E  89 E6				mov		esi,esp
0060  06				push		es
0061  8C D8				mov		eax,ds
0063  8E C0				mov		es,eax
0065  57				push		edi
0066  89 C8				mov		eax,ecx
0068  C1 E9 02				shr		ecx,0x02
006B  F2 A5				repne movsd	
006D  8A C8				mov		cl,al
006F  80 E1 03				and		cl,0x03
0072  F2 A4				repne movsb	
0074  5F				pop		edi
0075  07				pop		es
0076  89 D8				mov		eax,ebx
0078				L$6:
0078  81 C4 04 01 00 00			add		esp,0x00000104
007E  5F				pop		edi
007F  5E				pop		esi
0080  5B				pop		ebx
0081  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

