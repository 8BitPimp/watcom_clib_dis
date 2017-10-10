Module: winpaint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000018B bytes
0000				_RepaintWindow:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 1C				sub		esp,0x0000001c
0007  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
000B  8B 74 24 34			mov		esi,dword ptr 0x34[esp]
000F  8B 7C 24 38			mov		edi,dword ptr 0x38[esp]
0013  8B 56 04				mov		edx,dword ptr 0x4[esi]
0016  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
0019  89 D0				mov		eax,edx
001B  C1 FA 1F				sar		edx,0x1f
001E  F7 F9				idiv		ecx
0020  89 44 24 18			mov		dword ptr 0x18[esp],eax
0024  66 85 C0				test		ax,ax
0027  74 12				je		L$1
0029  8B 56 04				mov		edx,dword ptr 0x4[esi]
002C  89 D0				mov		eax,edx
002E  C1 FA 1F				sar		edx,0x1f
0031  F7 F9				idiv		ecx
0033  85 D2				test		edx,edx
0035  74 04				je		L$1
0037  FF 4C 24 18			dec		dword ptr 0x18[esp]
003B				L$1:
003B  8B 56 0C				mov		edx,dword ptr 0xc[esi]
003E  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
0041  89 D0				mov		eax,edx
0043  C1 FA 1F				sar		edx,0x1f
0046  F7 F9				idiv		ecx
0048  89 44 24 04			mov		dword ptr 0x4[esp],eax
004C  66 85 C0				test		ax,ax
004F  0F 84 2E 01 00 00			je		L$8
0055  31 C0				xor		eax,eax
0057  8B 6B 24				mov		ebp,dword ptr 0x24[ebx]
005A  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
005F  39 E8				cmp		eax,ebp
0061  7C 09				jl		L$2
0063  66 8B 43 24			mov		ax,word ptr 0x24[ebx]
0067  48				dec		eax
0068  89 44 24 04			mov		dword ptr 0x4[esp],eax
006C				L$2:
006C  8B 56 0C				mov		edx,dword ptr 0xc[esi]
006F  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
0072  89 D0				mov		eax,edx
0074  C1 FA 1F				sar		edx,0x1f
0077  F7 F9				idiv		ecx
0079  85 D2				test		edx,edx
007B  75 04				jne		L$3
007D  FF 4C 24 04			dec		dword ptr 0x4[esp]
0081				L$3:
0081  8B 16				mov		edx,dword ptr [esi]
0083  8B 6B 28				mov		ebp,dword ptr 0x28[ebx]
0086  89 D0				mov		eax,edx
0088  C1 FA 1F				sar		edx,0x1f
008B  F7 FD				idiv		ebp
008D  89 44 24 14			mov		dword ptr 0x14[esp],eax
0091  66 85 C0				test		ax,ax
0094  74 11				je		L$4
0096  8B 16				mov		edx,dword ptr [esi]
0098  89 D0				mov		eax,edx
009A  C1 FA 1F				sar		edx,0x1f
009D  F7 FD				idiv		ebp
009F  85 D2				test		edx,edx
00A1  74 04				je		L$4
00A3  FF 4C 24 14			dec		dword ptr 0x14[esp]
00A7				L$4:
00A7  8B 56 08				mov		edx,dword ptr 0x8[esi]
00AA  8B 6B 28				mov		ebp,dword ptr 0x28[ebx]
00AD  89 D0				mov		eax,edx
00AF  C1 FA 1F				sar		edx,0x1f
00B2  F7 FD				idiv		ebp
00B4  89 C1				mov		ecx,eax
00B6  66 85 C0				test		ax,ax
00B9  0F 84 C4 00 00 00			je		L$8
00BF  8B 56 08				mov		edx,dword ptr 0x8[esi]
00C2  89 D0				mov		eax,edx
00C4  C1 FA 1F				sar		edx,0x1f
00C7  F7 FD				idiv		ebp
00C9  85 D2				test		edx,edx
00CB  75 01				jne		L$5
00CD  49				dec		ecx
00CE				L$5:
00CE  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
00D2  29 D1				sub		ecx,edx
00D4  41				inc		ecx
00D5  89 D0				mov		eax,edx
00D7  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
00DB  66 0F AF 43 28			imul		ax,word ptr 0x28[ebx]
00E0  66 8B 73 2C			mov		si,word ptr 0x2c[ebx]
00E4  89 44 24 10			mov		dword ptr 0x10[esp],eax
00E8  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00EC  0F AF C6				imul		eax,esi
00EF  8B 2D 00 00 00 00			mov		ebp,dword ptr _FixedFont
00F5  55				push		ebp
00F6  57				push		edi
00F7  89 44 24 10			mov		dword ptr 0x10[esp],eax
00FB  31 F6				xor		esi,esi
00FD  E8 00 00 00 00			call		_SelectObject
0102  66 8B 74 24 18			mov		si,word ptr 0x18[esp]
0107  89 04 24				mov		dword ptr [esp],eax
010A  EB 62				jmp		L$7
010C				L$6:
010C  8B 6B 20				mov		ebp,dword ptr 0x20[ebx]
010F  0F AF EE				imul		ebp,esi
0112  8B 43 32				mov		eax,dword ptr 0x32[ebx]
0115  01 C5				add		ebp,eax
0117  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
011A  8B 14 85 00 00 00 00		mov		edx,dword ptr _ColorMap[eax*4]
0121  52				push		edx
0122  57				push		edi
0123  E8 00 00 00 00			call		_SetBkColor
0128  8B 43 08				mov		eax,dword ptr 0x8[ebx]
012B  8B 0C 85 00 00 00 00		mov		ecx,dword ptr _ColorMap[eax*4]
0132  51				push		ecx
0133  57				push		edi
0134  E8 00 00 00 00			call		_SetTextColor
0139  31 C0				xor		eax,eax
013B  66 8B 44 24 0C			mov		ax,word ptr 0xc[esp]
0140  50				push		eax
0141  31 C0				xor		eax,eax
0143  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
0148  01 E8				add		eax,ebp
014A  50				push		eax
014B  31 C0				xor		eax,eax
014D  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
0152  50				push		eax
0153  31 C0				xor		eax,eax
0155  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
015A  50				push		eax
015B  57				push		edi
015C  E8 00 00 00 00			call		_TextOutA
0161  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0165  66 03 53 2C			add		dx,word ptr 0x2c[ebx]
0169  46				inc		esi
016A  89 54 24 08			mov		dword ptr 0x8[esp],edx
016E				L$7:
016E  31 C0				xor		eax,eax
0170  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0175  39 C6				cmp		esi,eax
0177  7E 93				jle		L$6
0179  8B 04 24				mov		eax,dword ptr [esp]
017C  50				push		eax
017D  57				push		edi
017E  E8 00 00 00 00			call		_SelectObject
0183				L$8:
0183  83 C4 1C				add		esp,0x0000001c
0186  5D				pop		ebp
0187  5F				pop		edi
0188  5E				pop		esi
0189  5B				pop		ebx
018A  C3				ret		

Routine Size: 395 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

