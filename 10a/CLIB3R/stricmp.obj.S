Module: stricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000				strcmpi_:
0000				_stricmp_:
0000				stricmp_:
0000  53				push		ebx
0001				L$1:
0001  8A 18				mov		bl,byte ptr [eax]
0003  8A 3A				mov		bh,byte ptr [edx]
0005  80 FB 41				cmp		bl,0x41
0008  72 08				jb		L$2
000A  80 FB 5A				cmp		bl,0x5a
000D  77 03				ja		L$2
000F  80 C3 20				add		bl,0x20
0012				L$2:
0012  80 FF 41				cmp		bh,0x41
0015  72 08				jb		L$3
0017  80 FF 5A				cmp		bh,0x5a
001A  77 03				ja		L$3
001C  80 C7 20				add		bh,0x20
001F				L$3:
001F  38 FB				cmp		bl,bh
0021  75 08				jne		L$4
0023  84 FF				test		bh,bh
0025  74 04				je		L$4
0027  40				inc		eax
0028  42				inc		edx
0029  EB D6				jmp		L$1
002B				L$4:
002B  31 D2				xor		edx,edx
002D  31 C0				xor		eax,eax
002F  88 DA				mov		dl,bl
0031  88 F8				mov		al,bh
0033  29 C2				sub		edx,eax
0035  89 D0				mov		eax,edx
0037  5B				pop		ebx
0038  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

