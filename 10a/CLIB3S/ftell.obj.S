Module: ftell
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000052 bytes
0000				ftell:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0008  8B 53 10				mov		edx,dword ptr 0x10[ebx]
000B  52				push		edx
000C  E8 00 00 00 00			call		tell
0011  89 C6				mov		esi,eax
0013  83 C4 04				add		esp,0x00000004
0016  89 C7				mov		edi,eax
0018  83 F8 FF				cmp		eax,0xffffffff
001B  74 2E				je		L$3
001D  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0020  51				push		ecx
0021  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0027  8B 6B 04				mov		ebp,dword ptr 0x4[ebx]
002A  83 C4 04				add		esp,0x00000004
002D  85 ED				test		ebp,ebp
002F  74 0D				je		L$2
0031  F6 43 0D 10			test		byte ptr 0xd[ebx],0x10
0035  74 05				je		L$1
0037  8D 3C 2E				lea		edi,[esi+ebp]
003A  EB 02				jmp		L$2
003C				L$1:
003C  29 EF				sub		edi,ebp
003E				L$2:
003E  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0041  52				push		edx
0042  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0048  83 C4 04				add		esp,0x00000004
004B				L$3:
004B  89 F8				mov		eax,edi
004D  5D				pop		ebp
004E  5F				pop		edi
004F  5E				pop		esi
0050  5B				pop		ebx
0051  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

