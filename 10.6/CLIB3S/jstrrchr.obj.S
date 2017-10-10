Module: jstrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000038 bytes
0000				jstrrchr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000A  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
000E  31 F6				xor		esi,esi
0010				L$1:
0010  89 E0				mov		eax,esp
0012  50				push		eax
0013  53				push		ebx
0014  E8 00 00 00 00			call		jgetmoji
0019  83 C4 08				add		esp,0x00000008
001C  8B 14 24				mov		edx,dword ptr [esp]
001F  66 85 D2				test		dx,dx
0022  74 0B				je		L$3
0024  66 39 D7				cmp		di,dx
0027  75 02				jne		L$2
0029  89 DE				mov		esi,ebx
002B				L$2:
002B  89 C3				mov		ebx,eax
002D  EB E1				jmp		L$1
002F				L$3:
002F  89 F0				mov		eax,esi
0031  83 C4 04				add		esp,0x00000004
0034  5F				pop		edi
0035  5E				pop		esi
0036  5B				pop		ebx
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

