Module: ustrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				_ustrset:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006  8B 55 0C				mov		edx,dword ptr 0xc[ebp]
0009  EB 05				jmp		L$2
000B				L$1:
000B  66 89 10				mov		word ptr [eax],dx
000E  40				inc		eax
000F  40				inc		eax
0010				L$2:
0010  66 83 38 00			cmp		word ptr [eax],0x0000
0014  75 F5				jne		L$1
0016  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0019  5D				pop		ebp
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

