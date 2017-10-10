Module: umemcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				__umemcmp:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 55 0C				mov		edx,dword ptr 0xc[ebp]
0007  8B 45 10				mov		eax,dword ptr 0x10[ebp]
000A  EB 1C				jmp		L$3
000C				L$1:
000C  66 8B 1A				mov		bx,word ptr [edx]
000F  66 3B 18				cmp		bx,word ptr [eax]
0012  74 0D				je		L$2
0014  0F B7 D3				movzx		edx,bx
0017  0F B7 00				movzx		eax,word ptr [eax]
001A  29 C2				sub		edx,eax
001C  89 D0				mov		eax,edx
001E  5D				pop		ebp
001F  5B				pop		ebx
0020  C3				ret		
0021				L$2:
0021  FF 4D 14				dec		dword ptr 0x14[ebp]
0024  42				inc		edx
0025  42				inc		edx
0026  40				inc		eax
0027  40				inc		eax
0028				L$3:
0028  83 7D 14 00			cmp		dword ptr 0x14[ebp],0x00000000
002C  75 DE				jne		L$1
002E  31 C0				xor		eax,eax
0030  5D				pop		ebp
0031  5B				pop		ebx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

