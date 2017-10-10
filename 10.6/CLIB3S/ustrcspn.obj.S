Module: ustrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000				_ustrcspn:
0000  53				push		ebx
0001  56				push		esi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0008  31 DB				xor		ebx,ebx
000A  EB 1C				jmp		L$5
000C				L$1:
000C  8B 55 14				mov		edx,dword ptr 0x14[ebp]
000F  EB 07				jmp		L$3
0011				L$2:
0011  66 39 CE				cmp		si,cx
0014  74 0A				je		L$4
0016  42				inc		edx
0017  42				inc		edx
0018				L$3:
0018  66 8B 0A				mov		cx,word ptr [edx]
001B  66 85 C9				test		cx,cx
001E  75 F1				jne		L$2
0020				L$4:
0020  66 85 C9				test		cx,cx
0023  75 0B				jne		L$6
0025  40				inc		eax
0026  40				inc		eax
0027  43				inc		ebx
0028				L$5:
0028  66 8B 30				mov		si,word ptr [eax]
002B  66 85 F6				test		si,si
002E  75 DC				jne		L$1
0030				L$6:
0030  89 D8				mov		eax,ebx
0032  5D				pop		ebp
0033  5E				pop		esi
0034  5B				pop		ebx
0035  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

