Module: mbsspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000104 bytes
0000				_mbsspn:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
000B  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0012  74 4F				je		L$6
0014  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0018  31 ED				xor		ebp,ebp
001A  EB 25				jmp		L$4
001C				L$1:
001C  89 FA				mov		edx,edi
001E				L$2:
001E  89 E0				mov		eax,esp
0020  50				push		eax
0021  52				push		edx
0022  E8 00 00 00 00			call		_mbgetcode
0027  83 C4 08				add		esp,0x00000008
002A  89 C2				mov		edx,eax
002C  3B 2C 24				cmp		ebp,dword ptr [esp]
002F  74 09				je		L$3
0031  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0035  3B 04 24				cmp		eax,dword ptr [esp]
0038  75 E4				jne		L$2
003A				L$3:
003A  3B 2C 24				cmp		ebp,dword ptr [esp]
003D  74 1A				je		L$5
003F  89 F3				mov		ebx,esi
0041				L$4:
0041  8D 44 24 04			lea		eax,0x4[esp]
0045  50				push		eax
0046  53				push		ebx
0047  E8 00 00 00 00			call		_mbgetcode
004C  83 C4 08				add		esp,0x00000008
004F  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0053  89 C6				mov		esi,eax
0055  39 CD				cmp		ebp,ecx
0057  75 C3				jne		L$1
0059				L$5:
0059  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
005D  89 D8				mov		eax,ebx
005F  29 D0				sub		eax,edx
0061  EB 0E				jmp		L$7
0063				L$6:
0063  57				push		edi
0064  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0068  53				push		ebx
0069  E8 00 00 00 00			call		strspn
006E  83 C4 08				add		esp,0x00000008
0071				L$7:
0071  83 C4 08				add		esp,0x00000008
0074  5D				pop		ebp
0075  5F				pop		edi
0076  5E				pop		esi
0077  5B				pop		ebx
0078  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

0079				_mbsspnp:
0079  53				push		ebx
007A  56				push		esi
007B  57				push		edi
007C  55				push		ebp
007D  83 EC 08				sub		esp,0x00000008
0080  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0084  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
0088  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
008F  75 27				jne		L$12
0091  EB 41				jmp		L$14
0093				L$8:
0093  89 FA				mov		edx,edi
0095				L$9:
0095  89 E0				mov		eax,esp
0097  50				push		eax
0098  52				push		edx
0099  E8 00 00 00 00			call		_mbgetcode
009E  83 C4 08				add		esp,0x00000008
00A1  89 C2				mov		edx,eax
00A3  8B 04 24				mov		eax,dword ptr [esp]
00A6  39 C5				cmp		ebp,eax
00A8  75 04				jne		L$11
00AA				L$10:
00AA  89 D8				mov		eax,ebx
00AC  EB C3				jmp		L$7
00AE				L$11:
00AE  3B 44 24 04			cmp		eax,dword ptr 0x4[esp]
00B2  75 E1				jne		L$9
00B4  89 F3				mov		ebx,esi
00B6  EB 02				jmp		L$13
00B8				L$12:
00B8  31 ED				xor		ebp,ebp
00BA				L$13:
00BA  8D 44 24 04			lea		eax,0x4[esp]
00BE  50				push		eax
00BF  53				push		ebx
00C0  E8 00 00 00 00			call		_mbgetcode
00C5  83 C4 08				add		esp,0x00000008
00C8  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
00CC  89 C6				mov		esi,eax
00CE  39 CD				cmp		ebp,ecx
00D0  75 C1				jne		L$8
00D2  EB 29				jmp		L$18
00D4				L$14:
00D4  8A 23				mov		ah,byte ptr [ebx]
00D6  84 E4				test		ah,ah
00D8  74 23				je		L$18
00DA  88 E2				mov		dl,ah
00DC  89 FE				mov		esi,edi
00DE				L$15:
00DE  8A 06				mov		al,byte ptr [esi]
00E0  3A C2				cmp		al,dl
00E2  74 12				je		L$17
00E4  3C 00				cmp		al,0x00
00E6  74 0C				je		L$16
00E8  46				inc		esi
00E9  8A 06				mov		al,byte ptr [esi]
00EB  3A C2				cmp		al,dl
00ED  74 07				je		L$17
00EF  46				inc		esi
00F0  3C 00				cmp		al,0x00
00F2  75 EA				jne		L$15
00F4				L$16:
00F4  2B F6				sub		esi,esi
00F6				L$17:
00F6  85 F6				test		esi,esi
00F8  74 B0				je		L$10
00FA  43				inc		ebx
00FB  EB D7				jmp		L$14
00FD				L$18:
00FD  31 C0				xor		eax,eax
00FF  E9 6D FF FF FF			jmp		L$7

Routine Size: 139 bytes,    Routine Base: _TEXT + 0079

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

