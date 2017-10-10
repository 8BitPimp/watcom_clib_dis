Module: ustrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000				_ustrncpy:
0000  53				push		ebx
0001  56				push		esi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0008  8B 55 14				mov		edx,dword ptr 0x14[ebp]
000B  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
000E  89 C1				mov		ecx,eax
0010  EB 11				jmp		L$2
0012				L$1:
0012  66 83 3A 00			cmp		word ptr [edx],0x0000
0016  74 0F				je		L$3
0018  4B				dec		ebx
0019  66 8B 32				mov		si,word ptr [edx]
001C  42				inc		edx
001D  42				inc		edx
001E  66 89 30				mov		word ptr [eax],si
0021  40				inc		eax
0022  40				inc		eax
0023				L$2:
0023  85 DB				test		ebx,ebx
0025  75 EB				jne		L$1
0027				L$3:
0027  85 DB				test		ebx,ebx
0029  74 0A				je		L$4
002B  4B				dec		ebx
002C  66 C7 00 00 00			mov		word ptr [eax],0x0000
0031  40				inc		eax
0032  40				inc		eax
0033  EB F2				jmp		L$3
0035				L$4:
0035  89 C8				mov		eax,ecx
0037  5D				pop		ebp
0038  5E				pop		esi
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

