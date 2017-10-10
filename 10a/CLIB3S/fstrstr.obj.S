Module: fstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F0 bytes
0000				_fstrstr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  83 EC 08				sub		esp,0x00000008
0008  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
000C  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0010  C4 6C 24 28			les		ebp,fword ptr 0x28[esp]
0014  26 80 7D 00 00			cmp		byte ptr es:[ebp],0x00
0019  75 07				jne		L$2
001B				L$1:
001B  89 D9				mov		ecx,ebx
001D  E9 C1 00 00 00			jmp		L$11
0022				L$2:
0022  26 80 7D 01 00			cmp		byte ptr es:0x1[ebp],0x00
0027  75 1F				jne		L$3
0029  31 C0				xor		eax,eax
002B  26 8A 45 00			mov		al,byte ptr es:[ebp]
002F  50				push		eax
0030  31 C0				xor		eax,eax
0032  66 89 F0				mov		ax,si
0035  50				push		eax
0036  53				push		ebx
0037  E8 00 00 00 00			call		_fstrchr
003C  89 D6				mov		esi,edx
003E  83 C4 0C				add		esp,0x0000000c
0041  89 C1				mov		ecx,eax
0043  E9 9B 00 00 00			jmp		L$11
0048				L$3:
0048  B9 FF FF FF FF			mov		ecx,0xffffffff
004D  89 F2				mov		edx,esi
004F  89 DF				mov		edi,ebx
0051  30 C0				xor		al,al
0053  06				push		es
0054  E3 0B				jecxz		L$4
0056  8E C2				mov		es,edx
0058  F2 AE				repne scasb	
005A  75 05				jne		L$4
005C  4F				dec		edi
005D  8C C1				mov		ecx,es
005F  66 A9                                           f.
0061				L$4:
0061  89 CF				mov		edi,ecx
0063  07				pop		es
0064  89 7C 24 04			mov		dword ptr 0x4[esp],edi
0068  8C C1				mov		ecx,es
006A  89 EF				mov		edi,ebp
006C  06				push		es
006D  8E C1				mov		es,ecx
006F  31 C0				xor		eax,eax
0071  89 C1				mov		ecx,eax
0073  49				dec		ecx
0074  F2 AE				repne scasb	
0076  F7 D1				not		ecx
0078  49				dec		ecx
0079  07				pop		es
007A  89 0C 24				mov		dword ptr [esp],ecx
007D				L$5:
007D  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0081  8B 14 24				mov		edx,dword ptr [esp]
0084  29 D9				sub		ecx,ebx
0086  39 D1				cmp		ecx,edx
0088  7C 55				jl		L$10
008A  89 F2				mov		edx,esi
008C  89 DF				mov		edi,ebx
008E  26 8A 45 00			mov		al,byte ptr es:[ebp]
0092  06				push		es
0093  E3 0B				jecxz		L$6
0095  8E C2				mov		es,edx
0097  F2 AE				repne scasb	
0099  75 05				jne		L$6
009B  4F				dec		edi
009C  8C C1				mov		ecx,es
009E  66 A9                                           f.
00A0				L$6:
00A0  89 CF				mov		edi,ecx
00A2  07				pop		es
00A3  89 FB				mov		ebx,edi
00A5  89 CA				mov		edx,ecx
00A7  85 FF				test		edi,edi
00A9  75 05				jne		L$7
00AB  66 85 D2				test		dx,dx
00AE  74 2F				je		L$10
00B0				L$7:
00B0  8B 04 24				mov		eax,dword ptr [esp]
00B3  89 CA				mov		edx,ecx
00B5  89 FE				mov		esi,edi
00B7  8C C1				mov		ecx,es
00B9  89 EF				mov		edi,ebp
00BB  1E				push		ds
00BC  06				push		es
00BD  91				xchg		eax,ecx
00BE  8E DA				mov		ds,edx
00C0  8E C0				mov		es,eax
00C2  09 C9				or		ecx,ecx
00C4  F3 A6				repe cmpsb	
00C6  74 05				je		L$8
00C8  19 C9				sbb		ecx,ecx
00CA  83 D9 FF				sbb		ecx,0xffffffff
00CD				L$8:
00CD  07				pop		es
00CE  1F				pop		ds
00CF  85 C9				test		ecx,ecx
00D1  75 07				jne		L$9
00D3  89 D6				mov		esi,edx
00D5  E9 41 FF FF FF			jmp		L$1
00DA				L$9:
00DA  89 D6				mov		esi,edx
00DC  43				inc		ebx
00DD  EB 9E				jmp		L$5
00DF				L$10:
00DF  31 F6				xor		esi,esi
00E1  31 C9				xor		ecx,ecx
00E3				L$11:
00E3  89 F2				mov		edx,esi
00E5  89 C8				mov		eax,ecx
00E7  83 C4 08				add		esp,0x00000008
00EA  5D				pop		ebp
00EB  07				pop		es
00EC  5F				pop		edi
00ED  5E				pop		esi
00EE  5B				pop		ebx
00EF  C3				ret		

Routine Size: 240 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

