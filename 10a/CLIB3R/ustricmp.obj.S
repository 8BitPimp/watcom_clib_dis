Module: ustricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004B bytes
0000				_ustrcmpi_:
0000				_ustricmp_:
0000  53				push		ebx
0001  51				push		ecx
0002				L$1:
0002  66 8B 18				mov		bx,word ptr [eax]
0005  66 8B 0A				mov		cx,word ptr [edx]
0008  F6 C7 FF				test		bh,0xff
000B  75 23				jne		L$3
000D  F6 C5 FF				test		ch,0xff
0010  75 1E				jne		L$3
0012  66 83 FB 41			cmp		bx,0x0041
0016  72 09				jb		L$2
0018  66 83 FB 5A			cmp		bx,0x005a
001C  77 03				ja		L$2
001E  83 C3 20				add		ebx,0x00000020
0021				L$2:
0021  66 83 F9 41			cmp		cx,0x0041
0025  72 09				jb		L$3
0027  66 83 F9 5A			cmp		cx,0x005a
002B  77 03				ja		L$3
002D  83 C1 20				add		ecx,0x00000020
0030				L$3:
0030  66 39 CB				cmp		bx,cx
0033  75 0B				jne		L$4
0035  66 85 C9				test		cx,cx
0038  74 06				je		L$4
003A  40				inc		eax
003B  40				inc		eax
003C  42				inc		edx
003D  42				inc		edx
003E  EB C2				jmp		L$1
0040				L$4:
0040  0F B7 C3				movzx		eax,bx
0043  0F B7 D1				movzx		edx,cx
0046  29 D0				sub		eax,edx
0048  59				pop		ecx
0049  5B				pop		ebx
004A  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

