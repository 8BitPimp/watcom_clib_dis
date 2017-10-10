Module: creatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000080 bytes
0000				_dos_creat_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 0C				sub		esp,0x0000000c
0005  89 C1				mov		ecx,eax
0007  89 54 24 08			mov		dword ptr 0x8[esp],edx
000B  89 DE				mov		esi,ebx
000D  E8 00 00 00 00			call		__NTAtMaxFiles_
0012  85 C0				test		eax,eax
0014  74 11				je		L$1
0016  B8 0B 00 00 00			mov		eax,0x0000000b
001B  E8 00 00 00 00			call		__set_errno_
0020  B8 FF FF FF FF			mov		eax,0xffffffff
0025  EB 53				jmp		L$4
0027				L$1:
0027  89 E3				mov		ebx,esp
0029  89 D0				mov		eax,edx
002B  8D 54 24 04			lea		edx,0x4[esp]
002F  E8 00 00 00 00			call		__GetNTCreateAttr_
0034  6A 00				push		0x00000000
0036  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003A  52				push		edx
003B  6A 02				push		0x00000002
003D  6A 00				push		0x00000000
003F  6A 00				push		0x00000000
0041  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0045  53				push		ebx
0046  51				push		ecx
0047  E8 00 00 00 00			call		_CreateFileA
004C  83 F8 FF				cmp		eax,0xffffffff
004F  75 07				jne		L$2
0051  E8 00 00 00 00			call		__set_errno_nt_
0056  EB 22				jmp		L$4
0058				L$2:
0058  FF 15 00 00 00 00			call		dword ptr __InitAccessH
005E  BA 01 00 00 00			mov		edx,0x00000001
0063  8A 5C 24 08			mov		bl,byte ptr 0x8[esp]
0067  89 06				mov		dword ptr [esi],eax
0069  F6 C3 01				test		bl,0x01
006C  75 05				jne		L$3
006E  BA 03 00 00 00			mov		edx,0x00000003
0073				L$3:
0073  E8 00 00 00 00			call		__SetIOMode_
0078  31 C0				xor		eax,eax
007A				L$4:
007A  83 C4 0C				add		esp,0x0000000c
007D  5E				pop		esi
007E  59				pop		ecx
007F  C3				ret		

Routine Size: 128 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

