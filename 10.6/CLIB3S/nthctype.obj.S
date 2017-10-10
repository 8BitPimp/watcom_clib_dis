Module: nthctype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000				nthctype:
0000  53				push		ebx
0001  56				push		esi
0002  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0006  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
000A  B8 FF FF FF FF			mov		eax,0xffffffff
000F				L$1:
000F  8A 13				mov		dl,byte ptr [ebx]
0011  84 D2				test		dl,dl
0013  75 08				jne		L$2
0015  B8 FF FF FF FF			mov		eax,0xffffffff
001A  5E				pop		esi
001B  5B				pop		ebx
001C  C3				ret		
001D				L$2:
001D  50				push		eax
001E  31 C0				xor		eax,eax
0020  88 D0				mov		al,dl
0022  50				push		eax
0023  43				inc		ebx
0024  4E				dec		esi
0025  E8 00 00 00 00			call		chkctype
002A  83 C4 08				add		esp,0x00000008
002D  83 FE FF				cmp		esi,0xffffffff
0030  75 DD				jne		L$1
0032  5E				pop		esi
0033  5B				pop		ebx
0034  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

