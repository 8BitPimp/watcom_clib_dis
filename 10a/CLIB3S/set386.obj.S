Module: set386
GROUP: 'DGROUP' _DATA

Segment: _TEXT PARA USE32 00000022 bytes
0000				memset:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0008  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
000C  88 D6				mov		dh,dl
000E  C1 E2 08				shl		edx,0x08
0011  88 F2				mov		dl,dh
0013  C1 E2 08				shl		edx,0x08
0016  88 F2				mov		dl,dh
0018  E8 00 00 00 00			call		__STOSB
001D  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

