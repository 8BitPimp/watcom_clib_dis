Module: cscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005E bytes
0000				cget_console_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  E8 00 00 00 00			call		getche_
0008  83 F8 FF				cmp		eax,0xffffffff
000B  75 04				jne		L$1
000D  80 4A 10 02			or		byte ptr 0x10[edx],0x02
0011				L$1:
0011  5A				pop		edx
0012  C3				ret		
0013				uncget_console_:
0013  E9 00 00 00 00			jmp		ungetch_

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

0018				vcscanf_:
0018  53				push		ebx
0019  51				push		ecx
001A  56				push		esi
001B  83 EC 14				sub		esp,0x00000014
001E  89 C1				mov		ecx,eax
0020  89 D3				mov		ebx,edx
0022  BA 00 00 00 00			mov		edx,offset cget_console_
0027  BE 00 00 00 00			mov		esi,offset uncget_console_
002C  89 E0				mov		eax,esp
002E  89 14 24				mov		dword ptr [esp],edx
0031  89 CA				mov		edx,ecx
0033  89 74 24 04			mov		dword ptr 0x4[esp],esi
0037  E8 00 00 00 00			call		__scnf_
003C  83 C4 14				add		esp,0x00000014
003F  5E				pop		esi
0040  59				pop		ecx
0041  5B				pop		ebx
0042  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0018

0043				cscanf_:
0043  52				push		edx
0044  83 EC 04				sub		esp,0x00000004
0047  8D 54 24 10			lea		edx,0x10[esp]
004B  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
004F  89 14 24				mov		dword ptr [esp],edx
0052  89 E2				mov		edx,esp
0054  E8 00 00 00 00			call		vcscanf_
0059  83 C4 04				add		esp,0x00000004
005C  5A				pop		edx
005D  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0043

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

