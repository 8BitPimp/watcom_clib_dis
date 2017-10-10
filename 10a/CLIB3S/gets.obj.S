Module: gets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006C bytes
0000				gets:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0007  8B 3D 0C 00 00 00			mov		edi,dword ptr __iob+0xc
000D  8A 25 0C 00 00 00			mov		ah,byte ptr __iob+0xc
0013  89 F3				mov		ebx,esi
0015  80 E4 CF				and		ah,0xcf
0018  83 E7 30				and		edi,0x00000030
001B  88 25 0C 00 00 00			mov		byte ptr __iob+0xc,ah
0021				L$1:
0021  68 00 00 00 00			push		offset __iob
0026  E8 00 00 00 00			call		fgetc
002B  83 C4 04				add		esp,0x00000004
002E  89 C2				mov		edx,eax
0030  83 F8 FF				cmp		eax,0xffffffff
0033  74 0A				je		L$2
0035  83 F8 0A				cmp		eax,0x0000000a
0038  74 05				je		L$2
003A  88 13				mov		byte ptr [ebx],dl
003C  43				inc		ebx
003D  EB E2				jmp		L$1
003F				L$2:
003F  83 FA FF				cmp		edx,0xffffffff
0042  75 11				jne		L$4
0044  39 F3				cmp		ebx,esi
0046  74 09				je		L$3
0048  F6 05 0C 00 00 00 20		test		byte ptr __iob+0xc,0x20
004F  74 04				je		L$4
0051				L$3:
0051  31 F6				xor		esi,esi
0053  EB 03				jmp		L$5
0055				L$4:
0055  C6 03 00				mov		byte ptr [ebx],0x00
0058				L$5:
0058  8B 15 0C 00 00 00			mov		edx,dword ptr __iob+0xc
005E  09 FA				or		edx,edi
0060  89 F0				mov		eax,esi
0062  89 15 0C 00 00 00			mov		dword ptr __iob+0xc,edx
0068  5F				pop		edi
0069  5E				pop		esi
006A  5B				pop		ebx
006B  C3				ret		

Routine Size: 108 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

