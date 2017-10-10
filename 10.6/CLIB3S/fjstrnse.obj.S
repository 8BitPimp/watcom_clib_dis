Module: fjstrnse
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001C8 bytes
0000				_fjstrnset:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  83 EC 20				sub		esp,0x00000020
0008  8B 5C 24 3C			mov		ebx,dword ptr 0x3c[esp]
000C  8B 6C 24 48			mov		ebp,dword ptr 0x48[esp]
0010  8B 44 24 40			mov		eax,dword ptr 0x40[esp]
0014  89 1C 24				mov		dword ptr [esp],ebx
0017  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
001B  85 ED				test		ebp,ebp
001D  75 09				jne		L$1
001F  89 C2				mov		edx,eax
0021  89 DE				mov		esi,ebx
0023  E9 95 01 00 00			jmp		L$14
0028				L$1:
0028  31 C0				xor		eax,eax
002A  66 8B 44 24 44			mov		ax,word ptr 0x44[esp]
002F  50				push		eax
0030  89 44 24 14			mov		dword ptr 0x14[esp],eax
0034  E8 00 00 00 00			call		jiszen
0039  83 C4 04				add		esp,0x00000004
003C  85 C0				test		eax,eax
003E  0F 95 C0				setne		al
0041  25 FF 00 00 00			and		eax,0x000000ff
0046  89 EA				mov		edx,ebp
0048  40				inc		eax
0049  0F AF D0				imul		edx,eax
004C  8B 4C 24 40			mov		ecx,dword ptr 0x40[esp]
0050  89 DF				mov		edi,ebx
0052  06				push		es
0053  8E C1				mov		es,ecx
0055  31 C0				xor		eax,eax
0057  89 C1				mov		ecx,eax
0059  49				dec		ecx
005A  F2 AE				repne scasb	
005C  F7 D1				not		ecx
005E  49				dec		ecx
005F  07				pop		es
0060  89 54 24 04			mov		dword ptr 0x4[esp],edx
0064  89 CE				mov		esi,ecx
0066  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
006A  39 D1				cmp		ecx,edx
006C  77 66				ja		L$5
006E  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0072  57				push		edi
0073  E8 00 00 00 00			call		jiszen
0078  83 C4 04				add		esp,0x00000004
007B  85 C0				test		eax,eax
007D  74 46				je		L$4
007F  89 F5				mov		ebp,esi
0081  31 FF				xor		edi,edi
0083  D1 ED				shr		ebp,0x01
0085  EB 22				jmp		L$3
0087				L$2:
0087  31 F6				xor		esi,esi
0089  66 8B 74 24 44			mov		si,word ptr 0x44[esp]
008E  56				push		esi
008F  31 F6				xor		esi,esi
0091  66 8B 74 24 44			mov		si,word ptr 0x44[esp]
0096  56				push		esi
0097  53				push		ebx
0098  47				inc		edi
0099  9A 00 00 00 00 00 00		call		_fjputmoji
00A0  83 C4 0C				add		esp,0x0000000c
00A3  89 C3				mov		ebx,eax
00A5  89 54 24 40			mov		dword ptr 0x40[esp],edx
00A9				L$3:
00A9  39 EF				cmp		edi,ebp
00AB  72 DA				jb		L$2
00AD  F6 44 24 0C 01			test		byte ptr 0xc[esp],0x01
00B2  0F 84 FE 00 00 00			je		L$13
00B8  8E 44 24 40			mov		es,dword ptr 0x40[esp]
00BC  26 C6 03 20			mov		byte ptr es:[ebx],0x20
00C0  E9 F1 00 00 00			jmp		L$13
00C5				L$4:
00C5  8A 44 24 44			mov		al,byte ptr 0x44[esp]
00C9  8B 54 24 40			mov		edx,dword ptr 0x40[esp]
00CD  89 F1				mov		ecx,esi
00CF  E9 CF 00 00 00			jmp		L$12
00D4				L$5:
00D4  8B 44 24 40			mov		eax,dword ptr 0x40[esp]
00D8  89 44 24 14			mov		dword ptr 0x14[esp],eax
00DC  8D 42 FF				lea		eax,-0x1[edx]
00DF  89 DF				mov		edi,ebx
00E1  89 44 24 08			mov		dword ptr 0x8[esp],eax
00E5  EB 23				jmp		L$7
00E7				L$6:
00E7  31 C0				xor		eax,eax
00E9  8C D8				mov		eax,ds
00EB  50				push		eax
00EC  8D 74 24 1C			lea		esi,0x1c[esp]
00F0  56				push		esi
00F1  31 F6				xor		esi,esi
00F3  66 8B 74 24 1C			mov		si,word ptr 0x1c[esp]
00F8  56				push		esi
00F9  57				push		edi
00FA  9A 00 00 00 00 00 00		call		_fjgetmoji
0101  83 C4 10				add		esp,0x00000010
0104  89 C7				mov		edi,eax
0106  89 54 24 14			mov		dword ptr 0x14[esp],edx
010A				L$7:
010A  89 FE				mov		esi,edi
010C  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0110  29 DE				sub		esi,ebx
0112  39 C6				cmp		esi,eax
0114  72 D1				jb		L$6
0116  8D 54 24 18			lea		edx,0x18[esp]
011A  8C D8				mov		eax,ds
011C  25 FF FF 00 00			and		eax,0x0000ffff
0121  50				push		eax
0122  31 C0				xor		eax,eax
0124  52				push		edx
0125  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
012A  50				push		eax
012B  57				push		edi
012C  9A 00 00 00 00 00 00		call		_fjgetmoji
0133  83 C4 10				add		esp,0x00000010
0136  3B 74 24 04			cmp		esi,dword ptr 0x4[esp]
013A  74 1D				je		L$8
013C  31 C0				xor		eax,eax
013E  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
0143  50				push		eax
0144  E8 00 00 00 00			call		jiszen
0149  83 C4 04				add		esp,0x00000004
014C  85 C0				test		eax,eax
014E  74 09				je		L$8
0150  8E 44 24 14			mov		es,dword ptr 0x14[esp]
0154  26 C6 47 01 20			mov		byte ptr es:0x1[edi],0x20
0159				L$8:
0159  31 C0				xor		eax,eax
015B  66 8B 44 24 44			mov		ax,word ptr 0x44[esp]
0160  50				push		eax
0161  E8 00 00 00 00			call		jiszen
0166  83 C4 04				add		esp,0x00000004
0169  85 C0				test		eax,eax
016B  74 2C				je		L$11
016D  31 FF				xor		edi,edi
016F  EB 22				jmp		L$10
0171				L$9:
0171  31 F6				xor		esi,esi
0173  66 8B 74 24 44			mov		si,word ptr 0x44[esp]
0178  56				push		esi
0179  31 F6				xor		esi,esi
017B  66 8B 74 24 44			mov		si,word ptr 0x44[esp]
0180  56				push		esi
0181  53				push		ebx
0182  47				inc		edi
0183  9A 00 00 00 00 00 00		call		_fjputmoji
018A  83 C4 0C				add		esp,0x0000000c
018D  89 C3				mov		ebx,eax
018F  89 54 24 40			mov		dword ptr 0x40[esp],edx
0193				L$10:
0193  39 EF				cmp		edi,ebp
0195  73 1F				jae		L$13
0197  EB D8				jmp		L$9
0199				L$11:
0199  8A 44 24 44			mov		al,byte ptr 0x44[esp]
019D  8B 54 24 40			mov		edx,dword ptr 0x40[esp]
01A1  89 E9				mov		ecx,ebp
01A3				L$12:
01A3  89 DF				mov		edi,ebx
01A5  06				push		es
01A6  57				push		edi
01A7  8E C2				mov		es,edx
01A9  88 C4				mov		ah,al
01AB  D1 E9				shr		ecx,0x01
01AD  F2 66 AB				repne stosw	
01B0  11 C9				adc		ecx,ecx
01B2  F2 AA				repne stosb	
01B4  5F				pop		edi
01B5  07				pop		es
01B6				L$13:
01B6  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
01BA  8B 34 24				mov		esi,dword ptr [esp]
01BD				L$14:
01BD  89 F0				mov		eax,esi
01BF  83 C4 20				add		esp,0x00000020
01C2  5D				pop		ebp
01C3  07				pop		es
01C4  5F				pop		edi
01C5  5E				pop		esi
01C6  5B				pop		ebx
01C7  CB				retf		

Routine Size: 456 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

