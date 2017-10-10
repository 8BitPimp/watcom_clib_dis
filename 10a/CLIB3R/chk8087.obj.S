Module: chk8087
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000084 bytes
0000				__save_8087_:
0000  9B DD 30				fsave		[eax]
0003  9B				fwait		
0004  C3				ret		
0005				__rest_8087_:
0005  DD 20				frstor		[eax]
0007  9B				fwait		
0008  C3				ret		

Routine Size: 9 bytes,    Routine Base: _TEXT + 0000

0009				__init_8087_:
0009  53				push		ebx
000A  52				push		edx
000B  80 3D 00 00 00 00 00		cmp		byte ptr __real87,0x00
0012  74 16				je		L$1
0014  BA 00 00 00 00			mov		edx,offset __save_8087_
0019  BB 00 00 00 00			mov		ebx,offset __rest_8087_
001E  89 15 00 00 00 00			mov		dword ptr ___Save8087,edx
0024  89 1D 00 00 00 00			mov		dword ptr ___Rest8087,ebx
002A				L$1:
002A  31 C0				xor		eax,eax
002C  66 A1 00 00 00 00			mov		ax,word ptr __8087cw
0032  E8 00 00 00 00			call		__init_80x87
0037  5A				pop		edx
0038  5B				pop		ebx
0039  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0009

003A				_fpreset_:
003A  80 3D 00 00 00 00 00		cmp		byte ptr __real87,0x00
0041  75 C6				jne		__init_8087_
0043  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 003A

0044				__chk8087_:
0044  52				push		edx
0045  8A 25 00 00 00 00			mov		ah,byte ptr __8087
004B  84 E4				test		ah,ah
004D  75 33				jne		L$3
004F  88 25 00 00 00 00			mov		byte ptr __real87,ah
0055  2B C0				sub		eax,eax
0057  50				push		eax
0058  DB E3				fninit		
005A  D9 3C 24				fnstcw		word ptr [esp]
005D  58				pop		eax
005E  8A C4				mov		al,ah
0060  30 D2				xor		dl,dl
0062  3C 03				cmp		al,0x03
0064  75 07				jne		L$2
0066  E8 00 00 00 00			call		__init_8087_
006B  88 C2				mov		dl,al
006D				L$2:
006D  80 3D 00 00 00 00 00		cmp		byte ptr __no87,0x00
0074  75 0C				jne		L$3
0076  88 15 00 00 00 00			mov		byte ptr __8087,dl
007C  88 15 00 00 00 00			mov		byte ptr __real87,dl
0082				L$3:
0082  5A				pop		edx
0083  C3				ret		

Routine Size: 64 bytes,    Routine Base: _TEXT + 0044

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

