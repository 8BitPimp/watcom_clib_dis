Module: plusfsta
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000				__plusplus_fstat_:
0000  53				push		ebx
0001  83 EC 48				sub		esp,0x00000048
0004  89 D3				mov		ebx,edx
0006  89 E2				mov		edx,esp
0008  E8 00 00 00 00			call		fstat_
000D  85 C0				test		eax,eax
000F  74 0A				je		L$1
0011  B8 FF FF FF FF			mov		eax,0xffffffff
0016  83 C4 48				add		esp,0x00000048
0019  5B				pop		ebx
001A  C3				ret		
001B				L$1:
001B  F6 44 24 08 01			test		byte ptr 0x8[esp],0x01
0020  0F 94 C0				sete		al
0023  25 FF 00 00 00			and		eax,0x000000ff
0028  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
002C  83 C0 02				add		eax,0x00000002
002F  F6 C2 10				test		dl,0x10
0032  74 02				je		L$2
0034  0C 08				or		al,0x08
0036				L$2:
0036  F6 44 24 09 01			test		byte ptr 0x9[esp],0x01
003B  74 04				je		L$3
003D  0C 80				or		al,0x80
003F  EB 03				jmp		L$4
0041				L$3:
0041  80 CC 01				or		ah,0x01
0044				L$4:
0044  89 03				mov		dword ptr [ebx],eax
0046  31 C0				xor		eax,eax
0048  83 C4 48				add		esp,0x00000048
004B  5B				pop		ebx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

