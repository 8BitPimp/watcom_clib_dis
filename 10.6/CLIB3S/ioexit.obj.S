Module: ioexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000				__full_io_exit:
0000  6A 00				push		0x00000000
0002  E8 00 00 00 00			call		docloseall
0007  83 C4 04				add		esp,0x00000004
000A  E9 00 00 00 00			jmp		__purgefp

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

000F				fcloseall:
000F  6A 03				push		0x00000003
0011  E8 00 00 00 00			call		docloseall
0016  83 C4 04				add		esp,0x00000004
0019  C3				ret		
001A				docloseall:
001A  53				push		ebx
001B  56				push		esi
001C  57				push		edi
001D  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0021  89 D0				mov		eax,edx
0023  C1 E0 02				shl		eax,0x02
0026  29 D0				sub		eax,edx
0028  C1 E0 02				shl		eax,0x02
002B  01 D0				add		eax,edx
002D  BF 00 00 00 00			mov		edi,offset __iob
0032  01 C0				add		eax,eax
0034  31 DB				xor		ebx,ebx
0036  01 C7				add		edi,eax
0038  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
003D  EB 31				jmp		L$4
003F				L$1:
003F  8B 30				mov		esi,dword ptr [eax]
0041  8B 40 04				mov		eax,dword ptr 0x4[eax]
0044  8A 48 0D				mov		cl,byte ptr 0xd[eax]
0047  BA 01 00 00 00			mov		edx,0x00000001
004C  F6 C1 40				test		cl,0x40
004F  75 12				jne		L$2
0051  F6 C1 08				test		cl,0x08
0054  75 0D				jne		L$2
0056  39 F8				cmp		eax,edi
0058  72 14				jb		L$3
005A  3D 4E 00 00 00			cmp		eax,offset __iob+0x4e
005F  73 02				jae		L$2
0061  31 D2				xor		edx,edx
0063				L$2:
0063  52				push		edx
0064  50				push		eax
0065  43				inc		ebx
0066  E8 00 00 00 00			call		__shutdown_stream
006B  83 C4 08				add		esp,0x00000008
006E				L$3:
006E  89 F0				mov		eax,esi
0070				L$4:
0070  85 C0				test		eax,eax
0072  75 CB				jne		L$1
0074  89 D8				mov		eax,ebx
0076  5F				pop		edi
0077  5E				pop		esi
0078  5B				pop		ebx
0079  C3				ret		

Routine Size: 107 bytes,    Routine Base: _TEXT + 000F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

