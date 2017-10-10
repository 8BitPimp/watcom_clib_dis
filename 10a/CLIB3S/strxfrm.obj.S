Module: strxfrm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000027 bytes
0000				strxfrm:
0000  53				push		ebx
0001  56				push		esi
0002  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0006  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
000A  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
000E  31 DB				xor		ebx,ebx
0010				L$1:
0010  39 F3				cmp		ebx,esi
0012  73 04				jae		L$2
0014  8A 08				mov		cl,byte ptr [eax]
0016  88 0A				mov		byte ptr [edx],cl
0018				L$2:
0018  80 38 00				cmp		byte ptr [eax],0x00
001B  74 05				je		L$3
001D  40				inc		eax
001E  42				inc		edx
001F  43				inc		ebx
0020  EB EE				jmp		L$1
0022				L$3:
0022  89 D8				mov		eax,ebx
0024  5E				pop		esi
0025  5B				pop		ebx
0026  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

