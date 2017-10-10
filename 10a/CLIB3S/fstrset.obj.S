Module: fstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				_fstrset:
0000  06				push		es
0001  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0005  C4 44 24 08			les		eax,fword ptr 0x8[esp]
0009  EB 04				jmp		L$2
000B				L$1:
000B  26 88 10				mov		byte ptr es:[eax],dl
000E  40				inc		eax
000F				L$2:
000F  26 80 38 00			cmp		byte ptr es:[eax],0x00
0013  75 F6				jne		L$1
0015  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0019  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
001D  07				pop		es
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

