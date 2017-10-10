Module: plusfsta
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000055 bytes
0000				__plusplus_fstat:
0000  83 EC 48				sub		esp,0x00000048
0003  89 E0				mov		eax,esp
0005  50				push		eax
0006  8B 54 24 50			mov		edx,dword ptr 0x50[esp]
000A  52				push		edx
000B  E8 00 00 00 00			call		fstat
0010  83 C4 08				add		esp,0x00000008
0013  85 C0				test		eax,eax
0015  74 09				je		L$1
0017  B8 FF FF FF FF			mov		eax,0xffffffff
001C  83 C4 48				add		esp,0x00000048
001F  C3				ret		
0020				L$1:
0020  F6 44 24 08 01			test		byte ptr 0x8[esp],0x01
0025  0F 94 C0				sete		al
0028  25 FF 00 00 00			and		eax,0x000000ff
002D  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
0031  83 C0 02				add		eax,0x00000002
0034  F6 C2 10				test		dl,0x10
0037  74 02				je		L$2
0039  0C 08				or		al,0x08
003B				L$2:
003B  F6 44 24 09 01			test		byte ptr 0x9[esp],0x01
0040  74 04				je		L$3
0042  0C 80				or		al,0x80
0044  EB 03				jmp		L$4
0046				L$3:
0046  80 CC 01				or		ah,0x01
0049				L$4:
0049  8B 54 24 50			mov		edx,dword ptr 0x50[esp]
004D  89 02				mov		dword ptr [edx],eax
004F  31 C0				xor		eax,eax
0051  83 C4 48				add		esp,0x00000048
0054  C3				ret		

Routine Size: 85 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

