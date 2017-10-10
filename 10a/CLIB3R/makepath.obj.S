Module: makepath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DD bytes
0000				pickup_:
0000  3C 5C				cmp		al,0x5c
0002  74 04				je		L$1
0004  3C 2F				cmp		al,0x2f
0006  75 09				jne		L$3
0008				L$1:
0008  80 3A 00				cmp		byte ptr [edx],0x00
000B  75 02				jne		L$2
000D  88 02				mov		byte ptr [edx],al
000F				L$2:
000F  8A 02				mov		al,byte ptr [edx]
0011				L$3:
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

0012				_makepath_:
0012  56				push		esi
0013  57				push		edi
0014  83 EC 04				sub		esp,0x00000004
0017  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
001B  89 C6				mov		esi,eax
001D  30 E4				xor		ah,ah
001F  88 24 24				mov		byte ptr [esp],ah
0022  85 D2				test		edx,edx
0024  74 0D				je		L$4
0026  8A 02				mov		al,byte ptr [edx]
0028  84 C0				test		al,al
002A  74 07				je		L$4
002C  88 06				mov		byte ptr [esi],al
002E  46				inc		esi
002F  C6 06 3A				mov		byte ptr [esi],0x3a
0032  46				inc		esi
0033				L$4:
0033  C6 06 00				mov		byte ptr [esi],0x00
0036  85 DB				test		ebx,ebx
0038  74 31				je		L$8
003A  80 3B 00				cmp		byte ptr [ebx],0x00
003D  74 2C				je		L$8
003F				L$5:
003F  31 C0				xor		eax,eax
0041  89 E2				mov		edx,esp
0043  8A 03				mov		al,byte ptr [ebx]
0045  43				inc		ebx
0046  E8 00 00 00 00			call		pickup_
004B  88 06				mov		byte ptr [esi],al
004D  8A 13				mov		dl,byte ptr [ebx]
004F  46				inc		esi
0050  84 D2				test		dl,dl
0052  75 EB				jne		L$5
0054  80 3C 24 00			cmp		byte ptr [esp],0x00
0058  75 04				jne		L$6
005A  C6 04 24 5C			mov		byte ptr [esp],0x5c
005E				L$6:
005E  8A 3C 24				mov		bh,byte ptr [esp]
0061  3A 7E FF				cmp		bh,byte ptr -0x1[esi]
0064  75 03				jne		L$7
0066  4E				dec		esi
0067  EB 02				jmp		L$8
0069				L$7:
0069  88 3E				mov		byte ptr [esi],bh
006B				L$8:
006B  80 3C 24 00			cmp		byte ptr [esp],0x00
006F  75 04				jne		L$9
0071  C6 04 24 5C			mov		byte ptr [esp],0x5c
0075				L$9:
0075  8D 5E 01				lea		ebx,0x1[esi]
0078  85 C9				test		ecx,ecx
007A  74 2F				je		L$11
007C  31 C0				xor		eax,eax
007E  89 E2				mov		edx,esp
0080  8A 01				mov		al,byte ptr [ecx]
0082  E8 00 00 00 00			call		pickup_
0087  8A 34 24				mov		dh,byte ptr [esp]
008A  38 F0				cmp		al,dh
008C  74 06				je		L$10
008E  3A 36				cmp		dh,byte ptr [esi]
0090  75 02				jne		L$10
0092  89 DE				mov		esi,ebx
0094				L$10:
0094  8A 11				mov		dl,byte ptr [ecx]
0096  84 D2				test		dl,dl
0098  74 1A				je		L$12
009A  31 C0				xor		eax,eax
009C  88 D0				mov		al,dl
009E  89 E2				mov		edx,esp
00A0  41				inc		ecx
00A1  E8 00 00 00 00			call		pickup_
00A6  88 06				mov		byte ptr [esi],al
00A8  46				inc		esi
00A9  EB E9				jmp		L$10
00AB				L$11:
00AB  8A 14 24				mov		dl,byte ptr [esp]
00AE  3A 16				cmp		dl,byte ptr [esi]
00B0  75 02				jne		L$12
00B2  89 DE				mov		esi,ebx
00B4				L$12:
00B4  85 FF				test		edi,edi
00B6  74 1A				je		L$15
00B8  8A 37				mov		dh,byte ptr [edi]
00BA  84 F6				test		dh,dh
00BC  74 14				je		L$15
00BE  80 FE 2E				cmp		dh,0x2e
00C1  74 04				je		L$14
00C3  C6 06 2E				mov		byte ptr [esi],0x2e
00C6				L$13:
00C6  46				inc		esi
00C7				L$14:
00C7  8A 3F				mov		bh,byte ptr [edi]
00C9  84 FF				test		bh,bh
00CB  74 05				je		L$15
00CD  47				inc		edi
00CE  88 3E				mov		byte ptr [esi],bh
00D0  EB F4				jmp		L$13
00D2				L$15:
00D2  C6 06 00				mov		byte ptr [esi],0x00
00D5  83 C4 04				add		esp,0x00000004
00D8  5F				pop		edi
00D9  5E				pop		esi
00DA  C2 04 00				ret		0x0004

Routine Size: 203 bytes,    Routine Base: _TEXT + 0012

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

