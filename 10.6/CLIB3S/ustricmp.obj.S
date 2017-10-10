Module: ustricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000078 bytes
0000				_ustrcmpi:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  FF 75 0C				push		dword ptr 0xc[ebp]
0006  FF 75 08				push		dword ptr 0x8[ebp]
0009  E8 00 00 00 00			call		_ustricmp
000E  83 C4 08				add		esp,0x00000008
0011  5D				pop		ebp
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

0013				_ustricmp:
0013  53				push		ebx
0014  56				push		esi
0015  55				push		ebp
0016  89 E5				mov		ebp,esp
0018  8B 4D 10				mov		ecx,dword ptr 0x10[ebp]
001B  8B 75 14				mov		esi,dword ptr 0x14[ebp]
001E				L$1:
001E  66 8B 01				mov		ax,word ptr [ecx]
0021  89 C3				mov		ebx,eax
0023  30 C3				xor		bl,al
0025  0F B7 DB				movzx		ebx,bx
0028  66 8B 16				mov		dx,word ptr [esi]
002B  85 DB				test		ebx,ebx
002D  75 2D				jne		L$3
002F  89 D3				mov		ebx,edx
0031  30 D3				xor		bl,dl
0033  0F B7 DB				movzx		ebx,bx
0036  85 DB				test		ebx,ebx
0038  75 22				jne		L$3
003A  0F B7 D8				movzx		ebx,ax
003D  83 FB 41				cmp		ebx,0x00000041
0040  7C 0A				jl		L$2
0042  83 FB 5A				cmp		ebx,0x0000005a
0045  7F 05				jg		L$2
0047  05 20 00 00 00			add		eax,0x00000020
004C				L$2:
004C  0F B7 DA				movzx		ebx,dx
004F  83 FB 41				cmp		ebx,0x00000041
0052  7C 08				jl		L$3
0054  83 FB 5A				cmp		ebx,0x0000005a
0057  7F 03				jg		L$3
0059  83 C2 20				add		edx,0x00000020
005C				L$3:
005C  66 39 D0				cmp		ax,dx
005F  75 0B				jne		L$4
0061  66 85 D2				test		dx,dx
0064  74 06				je		L$4
0066  41				inc		ecx
0067  41				inc		ecx
0068  46				inc		esi
0069  46				inc		esi
006A  EB B2				jmp		L$1
006C				L$4:
006C  0F B7 C0				movzx		eax,ax
006F  0F B7 DA				movzx		ebx,dx
0072  29 D8				sub		eax,ebx
0074  5D				pop		ebp
0075  5E				pop		esi
0076  5B				pop		ebx
0077  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 0013

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

