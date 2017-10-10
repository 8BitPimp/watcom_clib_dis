Module: getenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000062 bytes
0000				getenv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0008  8B 1D 00 00 00 00			mov		ebx,dword ptr environ
000E  85 DB				test		ebx,ebx
0010  74 49				je		L$4
0012  85 ED				test		ebp,ebp
0014  74 45				je		L$4
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
002A  EB 29				jmp		L$3
002C				L$1:
002C  57				push		edi
002D  55				push		ebp
002E  56				push		esi
002F  E8 00 00 00 00			call		strnicmp
0034  83 C4 0C				add		esp,0x0000000c
0037  85 C0				test		eax,eax
0039  75 17				jne		L$2
003B  8A 04 37				mov		al,byte ptr [edi+esi]
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  83 F8 3D				cmp		eax,0x0000003d
0046  75 0A				jne		L$2
0048  8D 47 01				lea		eax,0x1[edi]
004B  01 F0				add		eax,esi
004D  5D				pop		ebp
004E  5F				pop		edi
004F  5E				pop		esi
0050  5B				pop		ebx
0051  C3				ret		
0052				L$2:
0052  83 C3 04				add		ebx,0x00000004
0055				L$3:
0055  8B 33				mov		esi,dword ptr [ebx]
0057  85 F6				test		esi,esi
0059  75 D1				jne		L$1
005B				L$4:
005B  31 C0				xor		eax,eax
005D  5D				pop		ebp
005E  5F				pop		edi
005F  5E				pop		esi
0060  5B				pop		ebx
0061  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

