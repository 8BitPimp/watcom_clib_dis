Module: fstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				_fstricmp_:
0000  06				push		es
0001  0F A0				push		fs
0003  8E E2				mov		fs,edx
0005  8E C1				mov		es,ecx
0007				L$1:
0007  64 8A 10				mov		dl,byte ptr fs:[eax]
000A  80 FA 41				cmp		dl,0x41
000D  72 08				jb		L$2
000F  80 FA 5A				cmp		dl,0x5a
0012  77 03				ja		L$2
0014  80 C2 20				add		dl,0x20
0017				L$2:
0017  26 8A 33				mov		dh,byte ptr es:[ebx]
001A  80 FE 41				cmp		dh,0x41
001D  72 08				jb		L$3
001F  80 FE 5A				cmp		dh,0x5a
0022  77 03				ja		L$3
0024  80 C6 20				add		dh,0x20
0027				L$3:
0027  38 F2				cmp		dl,dh
0029  75 08				jne		L$4
002B  84 F6				test		dh,dh
002D  74 04				je		L$4
002F  40				inc		eax
0030  43				inc		ebx
0031  EB D4				jmp		L$1
0033				L$4:
0033  31 C0				xor		eax,eax
0035  31 DB				xor		ebx,ebx
0037  88 D0				mov		al,dl
0039  88 F3				mov		bl,dh
003B  29 D8				sub		eax,ebx
003D  0F A1				pop		fs
003F  07				pop		es
0040  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

