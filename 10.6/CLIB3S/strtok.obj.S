Module: strtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B1 bytes
0000				strtok:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 20				sub		esp,0x00000020
0005  8B 74 24 2C			mov		esi,dword ptr 0x2c[esp]
0009  85 F6				test		esi,esi
000B  75 14				jne		L$2
000D  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0013  8B 70 10				mov		esi,dword ptr 0x10[eax]
0016  85 F6				test		esi,esi
0018  75 07				jne		L$2
001A				L$1:
001A  31 C0				xor		eax,eax
001C  E9 8A 00 00 00			jmp		L$10
0021				L$2:
0021  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
0025  52				push		edx
0026  8D 44 24 04			lea		eax,0x4[esp]
002A  50				push		eax
002B  E8 00 00 00 00			call		__setbits
0030  83 C4 08				add		esp,0x00000008
0033  EB 1F				jmp		L$4
0035				L$3:
0035  89 D8				mov		eax,ebx
0037  C1 E8 03				shr		eax,0x03
003A  31 D2				xor		edx,edx
003C  8A 14 04				mov		dl,byte ptr [esp+eax]
003F  89 D8				mov		eax,ebx
0041  83 E0 07				and		eax,0x00000007
0044  8A 80 00 00 00 00			mov		al,byte ptr _Bits[eax]
004A  25 FF 00 00 00			and		eax,0x000000ff
004F  85 C2				test		edx,eax
0051  74 09				je		L$5
0053  46				inc		esi
0054				L$4:
0054  31 DB				xor		ebx,ebx
0056  8A 1E				mov		bl,byte ptr [esi]
0058  85 DB				test		ebx,ebx
005A  75 D9				jne		L$3
005C				L$5:
005C  85 DB				test		ebx,ebx
005E  74 BA				je		L$1
0060  89 F3				mov		ebx,esi
0062  EB 30				jmp		L$8
0064				L$6:
0064  89 C2				mov		edx,eax
0066  C1 EA 03				shr		edx,0x03
0069  8A 14 14				mov		dl,byte ptr [esp+edx]
006C  83 E0 07				and		eax,0x00000007
006F  81 E2 FF 00 00 00			and		edx,0x000000ff
0075  8A 80 00 00 00 00			mov		al,byte ptr _Bits[eax]
007B  25 FF 00 00 00			and		eax,0x000000ff
0080  85 C2				test		edx,eax
0082  74 0F				je		L$7
0084  C6 03 00				mov		byte ptr [ebx],0x00
0087  43				inc		ebx
0088  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
008E  89 58 10				mov		dword ptr 0x10[eax],ebx
0091  EB 16				jmp		L$9
0093				L$7:
0093  43				inc		ebx
0094				L$8:
0094  31 C0				xor		eax,eax
0096  8A 03				mov		al,byte ptr [ebx]
0098  85 C0				test		eax,eax
009A  75 C8				jne		L$6
009C  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
00A2  C7 40 10 00 00 00 00		mov		dword ptr 0x10[eax],0x00000000
00A9				L$9:
00A9  89 F0				mov		eax,esi
00AB				L$10:
00AB  83 C4 20				add		esp,0x00000020
00AE  5E				pop		esi
00AF  5B				pop		ebx
00B0  C3				ret		

Routine Size: 177 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

