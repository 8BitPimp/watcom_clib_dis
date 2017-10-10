Module: xmsgwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000061 bytes
0000				__exit_with_msg:
0000  53				push		ebx
0001  83 EC 04				sub		esp,0x00000004
0004  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0008  31 DB				xor		ebx,ebx
000A  EB 01				jmp		L$2
000C				L$1:
000C  43				inc		ebx
000D				L$2:
000D  89 C2				mov		edx,eax
000F  8A 0A				mov		cl,byte ptr [edx]
0011  40				inc		eax
0012  84 C9				test		cl,cl
0014  75 F6				jne		L$1
0016  6A 00				push		0x00000000
0018  8D 44 24 04			lea		eax,0x4[esp]
001C  50				push		eax
001D  53				push		ebx
001E  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0022  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
0027  52				push		edx
0028  8B 58 04				mov		ebx,dword ptr 0x4[eax]
002B  53				push		ebx
002C  E8 00 00 00 00			call		_WriteFile
0031  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0035  51				push		ecx
0036  E9 00 00 00 00			jmp		__exit

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

003B				__fatal_runtime_error:
003B  53				push		ebx
003C  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0040  52				push		edx
0041  E8 00 00 00 00			call		__EnterWVIDEO
0046  83 C4 04				add		esp,0x00000004
0049  85 C0				test		eax,eax
004B  75 12				jne		L$3
004D  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0051  53				push		ebx
0052  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0056  51				push		ecx
0057  E8 00 00 00 00			call		__exit_with_msg
005C  83 C4 08				add		esp,0x00000008
005F				L$3:
005F  5B				pop		ebx
0060  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 003B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

