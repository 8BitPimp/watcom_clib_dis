Module: memicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000071 bytes
0000				_memicmp:
0000  53				push		ebx
0001  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0005  52				push		edx
0006  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000A  53				push		ebx
000B  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
000F  51				push		ecx
0010  E8 00 00 00 00			call		memicmp
0015  83 C4 0C				add		esp,0x0000000c
0018  5B				pop		ebx
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A				memicmp:
001A  53				push		ebx
001B  56				push		esi
001C  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0020  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0024  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0028  EB 3E				jmp		L$5
002A				L$1:
002A  8A 03				mov		al,byte ptr [ebx]
002C  31 C9				xor		ecx,ecx
002E  8A 22				mov		ah,byte ptr [edx]
0030  88 C1				mov		cl,al
0032  83 F9 41				cmp		ecx,0x00000041
0035  7C 07				jl		L$2
0037  83 F9 5A				cmp		ecx,0x0000005a
003A  7F 02				jg		L$2
003C  04 20				add		al,0x20
003E				L$2:
003E  31 C9				xor		ecx,ecx
0040  88 E1				mov		cl,ah
0042  83 F9 41				cmp		ecx,0x00000041
0045  7C 08				jl		L$3
0047  83 F9 5A				cmp		ecx,0x0000005a
004A  7F 03				jg		L$3
004C  80 C4 20				add		ah,0x20
004F				L$3:
004F  38 E0				cmp		al,ah
0051  74 12				je		L$4
0053  31 D2				xor		edx,edx
0055  88 C2				mov		dl,al
0057  88 E0				mov		al,ah
0059  25 FF 00 00 00			and		eax,0x000000ff
005E  29 C2				sub		edx,eax
0060  89 D0				mov		eax,edx
0062  5E				pop		esi
0063  5B				pop		ebx
0064  C3				ret		
0065				L$4:
0065  43				inc		ebx
0066  42				inc		edx
0067  4E				dec		esi
0068				L$5:
0068  85 F6				test		esi,esi
006A  75 BE				jne		L$1
006C  31 C0				xor		eax,eax
006E  5E				pop		esi
006F  5B				pop		ebx
0070  C3				ret		

Routine Size: 87 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

