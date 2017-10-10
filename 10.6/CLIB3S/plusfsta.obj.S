Module: plusfsta
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
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
0020  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0024  30 E4				xor		ah,ah
0026  24 01				and		al,0x01
0028  25 FF FF 00 00			and		eax,0x0000ffff
002D  0F 94 C0				sete		al
0030  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0034  25 FF 00 00 00			and		eax,0x000000ff
0039  30 F6				xor		dh,dh
003B  83 C0 02				add		eax,0x00000002
003E  80 E2 10				and		dl,0x10
0041  81 E2 FF FF 00 00			and		edx,0x0000ffff
0047  74 02				je		L$2
0049  0C 08				or		al,0x08
004B				L$2:
004B  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
004F  30 D2				xor		dl,dl
0051  80 E6 01				and		dh,0x01
0054  81 E2 FF FF 00 00			and		edx,0x0000ffff
005A  74 04				je		L$3
005C  0C 80				or		al,0x80
005E  EB 03				jmp		L$4
0060				L$3:
0060  80 CC 01				or		ah,0x01
0063				L$4:
0063  8B 54 24 50			mov		edx,dword ptr 0x50[esp]
0067  89 02				mov		dword ptr [edx],eax
0069  31 C0				xor		eax,eax
006B  83 C4 48				add		esp,0x00000048
006E  C3				ret		

Routine Size: 111 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

