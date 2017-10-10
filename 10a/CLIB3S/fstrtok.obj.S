Module: fstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F0 bytes
0000				_fstrtok:
0000  53				push		ebx
0001  56				push		esi
0002  06				push		es
0003  83 EC 20				sub		esp,0x00000020
0006  8B 74 24 34			mov		esi,dword ptr 0x34[esp]
000A  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
000E  85 DB				test		ebx,ebx
0010  75 24				jne		L$1
0012  66 85 F6				test		si,si
0015  75 1F				jne		L$1
0017  8B 1D 00 00 00 00			mov		ebx,dword ptr nextftok
001D  66 8B 35 04 00 00 00		mov		si,word ptr nextftok+0x4
0024  85 DB				test		ebx,ebx
0026  75 0E				jne		L$1
0028  66 85 F6				test		si,si
002B  75 09				jne		L$1
002D  31 D2				xor		edx,edx
002F  31 C0				xor		eax,eax
0031  E9 B3 00 00 00			jmp		L$9
0036				L$1:
0036  31 C0				xor		eax,eax
0038  66 8B 44 24 3C			mov		ax,word ptr 0x3c[esp]
003D  50				push		eax
003E  8B 54 24 3C			mov		edx,dword ptr 0x3c[esp]
0042  52				push		edx
0043  8C D8				mov		eax,ds
0045  8D 54 24 08			lea		edx,0x8[esp]
0049  25 FF FF 00 00			and		eax,0x0000ffff
004E  50				push		eax
004F  52				push		edx
0050  E8 00 00 00 00			call		__fsetbits
0055  83 C4 10				add		esp,0x00000010
0058  EB 20				jmp		L$3
005A				L$2:
005A  89 C2				mov		edx,eax
005C  C1 EA 03				shr		edx,0x03
005F  31 C9				xor		ecx,ecx
0061  8A 0C 14				mov		cl,byte ptr [esp+edx]
0064  89 C2				mov		edx,eax
0066  83 E2 07				and		edx,0x00000007
0069  8A 92 00 00 00 00			mov		dl,byte ptr _Bits[edx]
006F  81 E2 FF 00 00 00			and		edx,0x000000ff
0075  85 D1				test		ecx,edx
0077  74 0C				je		L$4
0079  43				inc		ebx
007A				L$3:
007A  8E C6				mov		es,esi
007C  31 C0				xor		eax,eax
007E  26 8A 03				mov		al,byte ptr es:[ebx]
0081  85 C0				test		eax,eax
0083  75 D5				jne		L$2
0085				L$4:
0085  85 C0				test		eax,eax
0087  75 04				jne		L$5
0089  31 D2				xor		edx,edx
008B  EB 5C				jmp		L$9
008D				L$5:
008D  8E C6				mov		es,esi
008F  89 D8				mov		eax,ebx
0091  EB 38				jmp		L$8
0093				L$6:
0093  89 D1				mov		ecx,edx
0095  C1 E9 03				shr		ecx,0x03
0098  8A 0C 0C				mov		cl,byte ptr [esp+ecx]
009B  83 E2 07				and		edx,0x00000007
009E  81 E1 FF 00 00 00			and		ecx,0x000000ff
00A4  8A 92 00 00 00 00			mov		dl,byte ptr _Bits[edx]
00AA  81 E2 FF 00 00 00			and		edx,0x000000ff
00B0  85 D1				test		ecx,edx
00B2  74 16				je		L$7
00B4  8C 05 04 00 00 00			mov		dword ptr nextftok+0x4,es
00BA  26 C6 00 00			mov		byte ptr es:[eax],0x00
00BE  40				inc		eax
00BF  89 F2				mov		edx,esi
00C1  A3 00 00 00 00			mov		dword ptr nextftok,eax
00C6  89 D8				mov		eax,ebx
00C8  EB 1F				jmp		L$9
00CA				L$7:
00CA  40				inc		eax
00CB				L$8:
00CB  31 D2				xor		edx,edx
00CD  26 8A 10				mov		dl,byte ptr es:[eax]
00D0  85 D2				test		edx,edx
00D2  75 BF				jne		L$6
00D4  89 D8				mov		eax,ebx
00D6  31 D2				xor		edx,edx
00D8  31 C9				xor		ecx,ecx
00DA  66 89 15 04 00 00 00		mov		word ptr nextftok+0x4,dx
00E1  89 0D 00 00 00 00			mov		dword ptr nextftok,ecx
00E7  89 F2				mov		edx,esi
00E9				L$9:
00E9  83 C4 20				add		esp,0x00000020
00EC  07				pop		es
00ED  5E				pop		esi
00EE  5B				pop		ebx
00EF  C3				ret		

Routine Size: 240 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000006 bytes
0000				nextftok:
0000  00 00 00 00 00 00                               ......

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

