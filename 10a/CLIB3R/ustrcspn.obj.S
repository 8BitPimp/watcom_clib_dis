Module: ustrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000				_ustrcspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  C8 04 00 00			enter		0x0004,0x00
0007  89 D1				mov		ecx,edx
0009  89 C2				mov		edx,eax
000B  31 DB				xor		ebx,ebx
000D  EB 1C				jmp		L$5
000F				L$1:
000F  89 C8				mov		eax,ecx
0011  EB 08				jmp		L$3
0013				L$2:
0013  66 3B 75 FC			cmp		si,word ptr -0x4[ebp]
0017  74 0A				je		L$4
0019  40				inc		eax
001A  40				inc		eax
001B				L$3:
001B  66 8B 30				mov		si,word ptr [eax]
001E  66 85 F6				test		si,si
0021  75 F0				jne		L$2
0023				L$4:
0023  66 85 F6				test		si,si
0026  75 0E				jne		L$6
0028  42				inc		edx
0029  42				inc		edx
002A  43				inc		ebx
002B				L$5:
002B  66 8B 02				mov		ax,word ptr [edx]
002E  89 45 FC				mov		dword ptr -0x4[ebp],eax
0031  66 85 C0				test		ax,ax
0034  75 D9				jne		L$1
0036				L$6:
0036  89 D8				mov		eax,ebx
0038  C9				leave		
0039  5E				pop		esi
003A  59				pop		ecx
003B  5B				pop		ebx
003C  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

