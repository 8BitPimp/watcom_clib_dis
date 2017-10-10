Module: ustrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				_ustrchr:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 55 08				mov		edx,dword ptr 0x8[ebp]
0006				L$1:
0006  0F B7 02				movzx		eax,word ptr [edx]
0009  3B 45 0C				cmp		eax,dword ptr 0xc[ebp]
000C  75 04				jne		L$2
000E  89 D0				mov		eax,edx
0010  5D				pop		ebp
0011  C3				ret		
0012				L$2:
0012  89 D0				mov		eax,edx
0014  42				inc		edx
0015  42				inc		edx
0016  66 83 38 00			cmp		word ptr [eax],0x0000
001A  75 EA				jne		L$1
001C  31 C0				xor		eax,eax
001E  5D				pop		ebp
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

