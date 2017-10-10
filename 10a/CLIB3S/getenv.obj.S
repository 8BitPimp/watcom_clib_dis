Module: getenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005B bytes
0000				getenv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0008  8B 1D 00 00 00 00			mov		ebx,dword ptr environ
000E  85 DB				test		ebx,ebx
0010  74 42				je		L$4
0012  85 ED				test		ebp,ebp
0014  74 3E				je		L$4
0016  89 EF				mov		edi,ebp
0018  06				push		es
0019  8C D8				mov		eax,ds
001B  8E C0				mov		es,eax
001D  29 C9				sub		ecx,ecx
001F  49				dec		ecx
0020  31 C0				xor		eax,eax
0022  F2 AE				repne scasb	
0024  F7 D1				not		ecx
0026  49				dec		ecx
0027  07				pop		es
0028  89 CF				mov		edi,ecx
002A  EB 22				jmp		L$3
002C				L$1:
002C  57				push		edi
002D  55				push		ebp
002E  56				push		esi
002F  E8 00 00 00 00			call		strnicmp
0034  83 C4 0C				add		esp,0x0000000c
0037  85 C0				test		eax,eax
0039  75 10				jne		L$2
003B  80 3C 37 3D			cmp		byte ptr [edi+esi],0x3d
003F  75 0A				jne		L$2
0041  8D 47 01				lea		eax,0x1[edi]
0044  01 F0				add		eax,esi
0046  5D				pop		ebp
0047  5F				pop		edi
0048  5E				pop		esi
0049  5B				pop		ebx
004A  C3				ret		
004B				L$2:
004B  83 C3 04				add		ebx,0x00000004
004E				L$3:
004E  8B 33				mov		esi,dword ptr [ebx]
0050  85 F6				test		esi,esi
0052  75 D8				jne		L$1
0054				L$4:
0054  31 C0				xor		eax,eax
0056  5D				pop		ebp
0057  5F				pop		edi
0058  5E				pop		esi
0059  5B				pop		ebx
005A  C3				ret		

Routine Size: 91 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

