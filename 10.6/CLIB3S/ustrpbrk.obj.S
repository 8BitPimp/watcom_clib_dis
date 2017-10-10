Module: ustrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				_ustrpbrk:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0007  EB 1B				jmp		L$5
0009				L$1:
0009  8B 55 10				mov		edx,dword ptr 0x10[ebp]
000C  EB 07				jmp		L$3
000E				L$2:
000E  66 39 D9				cmp		cx,bx
0011  74 0A				je		L$4
0013  42				inc		edx
0014  42				inc		edx
0015				L$3:
0015  66 8B 1A				mov		bx,word ptr [edx]
0018  66 85 DB				test		bx,bx
001B  75 F1				jne		L$2
001D				L$4:
001D  66 85 DB				test		bx,bx
0020  75 0C				jne		L$6
0022  40				inc		eax
0023  40				inc		eax
0024				L$5:
0024  66 8B 08				mov		cx,word ptr [eax]
0027  66 85 C9				test		cx,cx
002A  75 DD				jne		L$1
002C  31 C0				xor		eax,eax
002E				L$6:
002E  5D				pop		ebp
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

