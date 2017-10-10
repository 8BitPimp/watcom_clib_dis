Module: cputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				cputs:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005				L$1:
0005  31 C0				xor		eax,eax
0007  8A 03				mov		al,byte ptr [ebx]
0009  43				inc		ebx
000A  85 C0				test		eax,eax
000C  74 0B				je		L$2
000E  50				push		eax
000F  E8 00 00 00 00			call		putch
0014  83 C4 04				add		esp,0x00000004
0017  EB EC				jmp		L$1
0019				L$2:
0019  5B				pop		ebx
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

