Module: dosret
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000098 bytes
0000				_dosret0:
0000  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0004  85 D2				test		edx,edx
0006  75 03				jne		L$1
0008  31 C0				xor		eax,eax
000A  C3				ret		
000B				L$1:
000B  52				push		edx
000C  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0010  51				push		ecx
0011  E8 00 00 00 00			call		_dosretax
0016  83 C4 08				add		esp,0x00000008
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A				_dosretax:
001A  53				push		ebx
001B  83 7C 24 0C 00			cmp		dword ptr 0xc[esp],0x00000000
0020  74 0F				je		L$2
0022  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0026  53				push		ebx
0027  E8 00 00 00 00			call		__set_errno_dos
002C  83 C4 04				add		esp,0x00000004
002F  5B				pop		ebx
0030  C3				ret		
0031				L$2:
0031  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 001A

0037				__set_errno_dos:
0037  53				push		ebx
0038  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
003C  53				push		ebx
003D  E8 00 00 00 00			call		__set_doserrno
0042  83 C4 04				add		esp,0x00000004
0045  83 FB 7B				cmp		ebx,0x0000007b
0048  75 04				jne		L$3
004A  6A 01				push		0x00000001
004C  EB 2C				jmp		L$7
004E				L$3:
004E  81 FB CE 00 00 00			cmp		ebx,0x000000ce
0054  75 04				jne		L$4
0056  6A 09				push		0x00000009
0058  EB 20				jmp		L$7
005A				L$4:
005A  81 FB B7 00 00 00			cmp		ebx,0x000000b7
0060  75 04				jne		L$5
0062  6A 07				push		0x00000007
0064  EB 14				jmp		L$7
0066				L$5:
0066  83 FB 13				cmp		ebx,0x00000013
0069  76 05				jbe		L$6
006B  BB 13 00 00 00			mov		ebx,0x00000013
0070				L$6:
0070  8B 9B FD FF FF FF			mov		ebx,dword ptr xlat-0x3[ebx]
0076  C1 FB 18				sar		ebx,0x18
0079  53				push		ebx
007A				L$7:
007A  E8 00 00 00 00			call		__set_errno
007F  83 C4 04				add		esp,0x00000004
0082  B8 FF FF FF FF			mov		eax,0xffffffff
0087  5B				pop		ebx
0088  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0037

0089				__set_errno_nt:
0089  E8 00 00 00 00			call		_GetLastError
008E  50				push		eax
008F  E8 00 00 00 00			call		__set_errno_dos
0094  83 C4 04				add		esp,0x00000004
0097  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0089

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000				xlat:
0000  00 09 01 01 0B 06 04 05 05 05 02 03 FF FF 07 08 ................
0010  06 08 01 FF                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

