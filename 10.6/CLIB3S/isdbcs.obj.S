Module: isdbcs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,XIB,XI,XIE

Segment: _TEXT BYTE USE32 0000002D bytes
0000				__checkIsDBCS:
0000  83 EC 14				sub		esp,0x00000014
0003  89 E0				mov		eax,esp
0005  50				push		eax
0006  6A 01				push		0x00000001
0008  E8 00 00 00 00			call		_GetCPInfo
000D  85 C0				test		eax,eax
000F  74 18				je		L$2
0011  80 7C 24 06 00			cmp		byte ptr 0x6[esp],0x00
0016  75 07				jne		L$1
0018  80 7C 24 07 00			cmp		byte ptr 0x7[esp],0x00
001D  74 0A				je		L$2
001F				L$1:
001F  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr __IsDBCS,0x00000001
0029				L$2:
0029  83 C4 14				add		esp,0x00000014
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				__IsDBCS:
0000  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: XIB BYTE USE32 00000000 bytes

Segment: XI BYTE USE32 00000006 bytes
0000				__anon163:
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset __checkIsDBCS

Segment: XIE BYTE USE32 00000000 bytes

