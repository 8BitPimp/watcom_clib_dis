Module: mbsupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000058 bytes
0000				_mbsupr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
000A  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
0010  89 FE				mov		esi,edi
0012  85 D2				test		edx,edx
0014  74 32				je		L$3
0016  89 FB				mov		ebx,edi
0018  EB 15				jmp		L$2
001A				L$1:
001A  51				push		ecx
001B  E8 00 00 00 00			call		_mbctoupper
0020  83 C4 04				add		esp,0x00000004
0023  50				push		eax
0024  53				push		ebx
0025  E8 00 00 00 00			call		_mbputchar
002A  83 C4 08				add		esp,0x00000008
002D  89 C3				mov		ebx,eax
002F				L$2:
002F  89 E0				mov		eax,esp
0031  50				push		eax
0032  56				push		esi
0033  E8 00 00 00 00			call		_mbgetcode
0038  83 C4 08				add		esp,0x00000008
003B  8B 0C 24				mov		ecx,dword ptr [esp]
003E  89 C6				mov		esi,eax
0040  85 C9				test		ecx,ecx
0042  75 D6				jne		L$1
0044  89 F8				mov		eax,edi
0046  EB 09				jmp		L$4
0048				L$3:
0048  57				push		edi
0049  E8 00 00 00 00			call		strupr
004E  83 C4 04				add		esp,0x00000004
0051				L$4:
0051  83 C4 04				add		esp,0x00000004
0054  5F				pop		edi
0055  5E				pop		esi
0056  5B				pop		ebx
0057  C3				ret		

Routine Size: 88 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

