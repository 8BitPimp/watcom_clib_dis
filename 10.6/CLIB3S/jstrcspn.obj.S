Module: jstrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000056 bytes
0000				jstrcspn:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000A  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
000E  31 DB				xor		ebx,ebx
0010  EB 22				jmp		L$4
0012				L$1:
0012  89 FA				mov		edx,edi
0014  EB 07				jmp		L$3
0016				L$2:
0016  66 3B 4C 24 04			cmp		cx,word ptr 0x4[esp]
001B  74 30				je		L$5
001D				L$3:
001D  89 E0				mov		eax,esp
001F  50				push		eax
0020  52				push		edx
0021  E8 00 00 00 00			call		jgetmoji
0026  83 C4 08				add		esp,0x00000008
0029  8B 0C 24				mov		ecx,dword ptr [esp]
002C  89 C2				mov		edx,eax
002E  66 85 C9				test		cx,cx
0031  75 E3				jne		L$2
0033  43				inc		ebx
0034				L$4:
0034  8D 44 24 04			lea		eax,0x4[esp]
0038  50				push		eax
0039  56				push		esi
003A  E8 00 00 00 00			call		jgetmoji
003F  83 C4 08				add		esp,0x00000008
0042  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0046  89 C6				mov		esi,eax
0048  66 85 D2				test		dx,dx
004B  75 C5				jne		L$1
004D				L$5:
004D  89 D8				mov		eax,ebx
004F  83 C4 08				add		esp,0x00000008
0052  5F				pop		edi
0053  5E				pop		esi
0054  5B				pop		ebx
0055  C3				ret		

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

