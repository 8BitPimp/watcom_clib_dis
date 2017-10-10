Module: jstrskip
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				jstrskip:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000A  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
000E  EB 27				jmp		L$4
0010				L$1:
0010  89 FA				mov		edx,edi
0012				L$2:
0012  89 E0				mov		eax,esp
0014  50				push		eax
0015  52				push		edx
0016  E8 00 00 00 00			call		jgetmoji
001B  83 C4 08				add		esp,0x00000008
001E  89 C2				mov		edx,eax
0020  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0024  8B 0C 24				mov		ecx,dword ptr [esp]
0027  66 39 C8				cmp		ax,cx
002A  74 09				je		L$3
002C  66 85 C9				test		cx,cx
002F  75 E1				jne		L$2
0031  89 F0				mov		eax,esi
0033  EB 1D				jmp		L$5
0035				L$3:
0035  89 DE				mov		esi,ebx
0037				L$4:
0037  8D 44 24 04			lea		eax,0x4[esp]
003B  50				push		eax
003C  56				push		esi
003D  E8 00 00 00 00			call		jgetmoji
0042  83 C4 08				add		esp,0x00000008
0045  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0049  89 C3				mov		ebx,eax
004B  66 85 D2				test		dx,dx
004E  75 C0				jne		L$1
0050  31 C0				xor		eax,eax
0052				L$5:
0052  83 C4 08				add		esp,0x00000008
0055  5F				pop		edi
0056  5E				pop		esi
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

