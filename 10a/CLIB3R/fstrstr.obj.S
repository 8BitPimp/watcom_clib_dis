Module: fstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E1 bytes
0000				_fstrstr_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  52				push		edx
0008  89 C6				mov		esi,eax
000A  8E C1				mov		es,ecx
000C  89 DD				mov		ebp,ebx
000E  26 8A 65 00			mov		ah,byte ptr es:[ebp]
0012  84 E4				test		ah,ah
0014  75 07				jne		L$1
0016  89 F0				mov		eax,esi
0018  E9 BC 00 00 00			jmp		L$10
001D				L$1:
001D  26 80 7D 01 00			cmp		byte ptr es:0x1[ebp],0x00
0022  75 13				jne		L$2
0024  31 DB				xor		ebx,ebx
0026  8B 14 24				mov		edx,dword ptr [esp]
0029  88 E3				mov		bl,ah
002B  89 F0				mov		eax,esi
002D  E8 00 00 00 00			call		_fstrchr_
0032  E9 A2 00 00 00			jmp		L$10
0037				L$2:
0037  8B 14 24				mov		edx,dword ptr [esp]
003A  B9 FF FF FF FF			mov		ecx,0xffffffff
003F  89 F7				mov		edi,esi
0041  30 C0				xor		al,al
0043  06				push		es
0044  E3 0B				jecxz		L$3
0046  8E C2				mov		es,edx
0048  F2 AE				repne scasb	
004A  75 05				jne		L$3
004C  4F				dec		edi
004D  8C C1				mov		ecx,es
004F  66 A9                                           f.
0051				L$3:
0051  89 CF				mov		edi,ecx
0053  07				pop		es
0054  89 7C 24 08			mov		dword ptr 0x8[esp],edi
0058  8C C1				mov		ecx,es
005A  89 DF				mov		edi,ebx
005C  06				push		es
005D  8E C1				mov		es,ecx
005F  31 C0				xor		eax,eax
0061  89 C1				mov		ecx,eax
0063  49				dec		ecx
0064  F2 AE				repne scasb	
0066  F7 D1				not		ecx
0068  49				dec		ecx
0069  07				pop		es
006A  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
006E				L$4:
006E  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0072  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0076  29 F1				sub		ecx,esi
0078  39 D1				cmp		ecx,edx
007A  7C 59				jl		L$9
007C  8B 14 24				mov		edx,dword ptr [esp]
007F  89 F7				mov		edi,esi
0081  26 8A 45 00			mov		al,byte ptr es:[ebp]
0085  06				push		es
0086  E3 0B				jecxz		L$5
0088  8E C2				mov		es,edx
008A  F2 AE				repne scasb	
008C  75 05				jne		L$5
008E  4F				dec		edi
008F  8C C1				mov		ecx,es
0091  66 A9                                           f.
0093				L$5:
0093  89 CF				mov		edi,ecx
0095  07				pop		es
0096  89 FB				mov		ebx,edi
0098  89 CA				mov		edx,ecx
009A  85 FF				test		edi,edi
009C  75 05				jne		L$6
009E  66 85 D2				test		dx,dx
00A1  74 32				je		L$9
00A3				L$6:
00A3  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00A7  89 CA				mov		edx,ecx
00A9  89 FE				mov		esi,edi
00AB  8C C1				mov		ecx,es
00AD  89 EF				mov		edi,ebp
00AF  1E				push		ds
00B0  06				push		es
00B1  91				xchg		eax,ecx
00B2  8E DA				mov		ds,edx
00B4  8E C0				mov		es,eax
00B6  09 C9				or		ecx,ecx
00B8  F3 A6				repe cmpsb	
00BA  74 05				je		L$7
00BC  19 C9				sbb		ecx,ecx
00BE  83 D9 FF				sbb		ecx,0xffffffff
00C1				L$7:
00C1  07				pop		es
00C2  1F				pop		ds
00C3  85 C9				test		ecx,ecx
00C5  75 04				jne		L$8
00C7  89 D8				mov		eax,ebx
00C9  EB 0E				jmp		L$10
00CB				L$8:
00CB  89 D0				mov		eax,edx
00CD  8D 73 01				lea		esi,0x1[ebx]
00D0  89 04 24				mov		dword ptr [esp],eax
00D3  EB 99				jmp		L$4
00D5				L$9:
00D5  31 D2				xor		edx,edx
00D7  31 C0				xor		eax,eax
00D9				L$10:
00D9  83 C4 0C				add		esp,0x0000000c
00DC  5D				pop		ebp
00DD  07				pop		es
00DE  5F				pop		edi
00DF  5E				pop		esi
00E0  C3				ret		

Routine Size: 225 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

