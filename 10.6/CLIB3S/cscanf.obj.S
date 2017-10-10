Module: cscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000				cget_console:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  E8 00 00 00 00			call		getche
000A  89 C2				mov		edx,eax
000C  83 F8 FF				cmp		eax,0xffffffff
000F  75 04				jne		L$1
0011  80 4B 10 02			or		byte ptr 0x10[ebx],0x02
0015				L$1:
0015  89 D0				mov		eax,edx
0017  5B				pop		ebx
0018  C3				ret		
0019				uncget_console:
0019  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
001D  52				push		edx
001E  E8 00 00 00 00			call		ungetch
0023  83 C4 04				add		esp,0x00000004
0026  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

0027				vcscanf:
0027  53				push		ebx
0028  56				push		esi
0029  83 EC 14				sub		esp,0x00000014
002C  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0030  51				push		ecx
0031  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0035  BA 00 00 00 00			mov		edx,offset cget_console
003A  56				push		esi
003B  8D 44 24 08			lea		eax,0x8[esp]
003F  BB 00 00 00 00			mov		ebx,offset uncget_console
0044  50				push		eax
0045  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0049  89 5C 24 10			mov		dword ptr 0x10[esp],ebx
004D  E8 00 00 00 00			call		__scnf
0052  83 C4 0C				add		esp,0x0000000c
0055  83 C4 14				add		esp,0x00000014
0058  5E				pop		esi
0059  5B				pop		ebx
005A  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0027

005B				cscanf:
005B  83 EC 04				sub		esp,0x00000004
005E  8D 44 24 0C			lea		eax,0xc[esp]
0062  89 04 24				mov		dword ptr [esp],eax
0065  89 E0				mov		eax,esp
0067  50				push		eax
0068  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
006C  52				push		edx
006D  E8 00 00 00 00			call		vcscanf
0072  83 C4 08				add		esp,0x00000008
0075  83 C4 04				add		esp,0x00000004
0078  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 005B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

