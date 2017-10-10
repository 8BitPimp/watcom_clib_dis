Module: qsort
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000463 bytes
0000				byteswap:
0000  06				push		es
0001  1E				push		ds
0002  07				pop		es
0003  0F B6 D1				movzx		edx,cl
0006  C1 E9 02				shr		ecx,0x02
0009  74 0B				je		L$2
000B				L$1:
000B  8B 07				mov		eax,dword ptr [edi]
000D  87 06				xchg		dword ptr [esi],eax
000F  AB				stosd		
0010  83 C6 04				add		esi,0x00000004
0013  49				dec		ecx
0014  75 F5				jne		L$1
0016				L$2:
0016  80 E2 03				and		dl,0x03
0019  74 09				je		L$4
001B				L$3:
001B  8A 07				mov		al,byte ptr [edi]
001D  86 06				xchg		byte ptr [esi],al
001F  AA				stosb		
0020  46				inc		esi
0021  4A				dec		edx
0022  75 F7				jne		L$3
0024				L$4:
0024  07				pop		es
0025  C3				ret		
0026				med3:
0026  53				push		ebx
0027  56				push		esi
0028  57				push		edi
0029  06				push		es
002A  0F A0				push		fs
002C  0F A8				push		gs
002E  55				push		ebp
002F  89 E5				mov		ebp,esp
0031  8B 7D 20				mov		edi,dword ptr 0x20[ebp]
0034  8B 75 28				mov		esi,dword ptr 0x28[ebp]
0037  FF 75 24				push		dword ptr 0x24[ebp]
003A  57				push		edi
003B  FF 55 2C				call		dword ptr 0x2c[ebp]
003E  83 C4 08				add		esp,0x00000008
0041  85 C0				test		eax,eax
0043  7E 22				jle		L$7
0045  56				push		esi
0046  57				push		edi
0047  FF 55 2C				call		dword ptr 0x2c[ebp]
004A  83 C4 08				add		esp,0x00000008
004D  85 C0				test		eax,eax
004F  7E 12				jle		L$6
0051  56				push		esi
0052  FF 75 24				push		dword ptr 0x24[ebp]
0055  FF 55 2C				call		dword ptr 0x2c[ebp]
0058  83 C4 08				add		esp,0x00000008
005B  85 C0				test		eax,eax
005D  7F 22				jg		L$8
005F				L$5:
005F  89 F0				mov		eax,esi
0061  EB 21				jmp		L$9
0063				L$6:
0063  89 F8				mov		eax,edi
0065  EB 1D				jmp		L$9
0067				L$7:
0067  56				push		esi
0068  57				push		edi
0069  FF 55 2C				call		dword ptr 0x2c[ebp]
006C  83 C4 08				add		esp,0x00000008
006F  85 C0				test		eax,eax
0071  7D F0				jge		L$6
0073  56				push		esi
0074  FF 75 24				push		dword ptr 0x24[ebp]
0077  FF 55 2C				call		dword ptr 0x2c[ebp]
007A  83 C4 08				add		esp,0x00000008
007D  85 C0				test		eax,eax
007F  7F DE				jg		L$5
0081				L$8:
0081  8B 45 24				mov		eax,dword ptr 0x24[ebp]
0084				L$9:
0084  5D				pop		ebp
0085				L$10:
0085  0F A9				pop		gs
0087  0F A1				pop		fs
0089  07				pop		es
008A  5F				pop		edi
008B  5E				pop		esi
008C  5B				pop		ebx
008D  C3				ret		

Routine Size: 142 bytes,    Routine Base: _TEXT + 0000

008E				qsort:
008E  53				push		ebx
008F  56				push		esi
0090  57				push		edi
0091  06				push		es
0092  0F A0				push		fs
0094  0F A8				push		gs
0096  C8 48 01 00			enter		0x0148,0x00
009A  8B 45 2C				mov		eax,dword ptr 0x2c[ebp]
009D  89 45 E8				mov		dword ptr -0x18[ebp],eax
00A0  8B 45 20				mov		eax,dword ptr 0x20[ebp]
00A3  0B 45 28				or		eax,dword ptr 0x28[ebp]
00A6  A8 03				test		al,0x03
00A8  74 07				je		L$11
00AA  B8 02 00 00 00			mov		eax,0x00000002
00AF  EB 0A				jmp		L$12
00B1				L$11:
00B1  83 7D 28 04			cmp		dword ptr 0x28[ebp],0x00000004
00B5  0F 97 C0				seta		al
00B8  0F B6 C0				movzx		eax,al
00BB				L$12:
00BB  89 45 DC				mov		dword ptr -0x24[ebp],eax
00BE  6B 45 28 03			imul		eax,dword ptr 0x28[ebp],0x00000003
00C2  89 45 C4				mov		dword ptr -0x3c[ebp],eax
00C5  8B 45 28				mov		eax,dword ptr 0x28[ebp]
00C8  01 C0				add		eax,eax
00CA  C7 45 E4 00 00 00 00		mov		dword ptr -0x1c[ebp],0x00000000
00D1  89 45 C0				mov		dword ptr -0x40[ebp],eax
00D4				L$13:
00D4  83 7D 24 01			cmp		dword ptr 0x24[ebp],0x00000001
00D8  0F 86 8B 00 00 00			jbe		L$23
00DE  83 7D 24 10			cmp		dword ptr 0x24[ebp],0x00000010
00E2  0F 83 AA 00 00 00			jae		L$24
00E8  8B 45 C4				mov		eax,dword ptr -0x3c[ebp]
00EB  89 45 E0				mov		dword ptr -0x20[ebp],eax
00EE  8B 45 24				mov		eax,dword ptr 0x24[ebp]
00F1  0F AF 45 28			imul		eax,dword ptr 0x28[ebp]
00F5  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
00F8  01 C3				add		ebx,eax
00FA  89 5D C8				mov		dword ptr -0x38[ebp],ebx
00FD  EB 64				jmp		L$22
00FF				L$14:
00FF  8B 45 20				mov		eax,dword ptr 0x20[ebp]
0102  03 45 E0				add		eax,dword ptr -0x20[ebp]
0105  89 45 D8				mov		dword ptr -0x28[ebp],eax
0108  EB 4B				jmp		L$21
010A				L$15:
010A  89 45 F0				mov		dword ptr -0x10[ebp],eax
010D  EB 27				jmp		L$19
010F				L$16:
010F  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0113  74 0D				je		L$17
0115  8B 4D 28				mov		ecx,dword ptr 0x28[ebp]
0118  8B 75 F0				mov		esi,dword ptr -0x10[ebp]
011B  E8 00 00 00 00			call		byteswap
0120  EB 0E				jmp		L$18
0122				L$17:
0122  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0125  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
0128  8B 1F				mov		ebx,dword ptr [edi]
012A  8B 00				mov		eax,dword ptr [eax]
012C  89 19				mov		dword ptr [ecx],ebx
012E  89 07				mov		dword ptr [edi],eax
0130				L$18:
0130  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
0133  29 45 F0				sub		dword ptr -0x10[ebp],eax
0136				L$19:
0136  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0139  3B 45 20				cmp		eax,dword ptr 0x20[ebp]
013C  76 11				jbe		L$20
013E  89 C7				mov		edi,eax
0140  50				push		eax
0141  2B 7D E0				sub		edi,dword ptr -0x20[ebp]
0144  57				push		edi
0145  FF 55 E8				call		dword ptr -0x18[ebp]
0148  83 C4 08				add		esp,0x00000008
014B  85 C0				test		eax,eax
014D  7F C0				jg		L$16
014F				L$20:
014F  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
0152  01 45 D8				add		dword ptr -0x28[ebp],eax
0155				L$21:
0155  8B 45 D8				mov		eax,dword ptr -0x28[ebp]
0158  3B 45 C8				cmp		eax,dword ptr -0x38[ebp]
015B  72 AD				jb		L$15
015D  8B 45 C0				mov		eax,dword ptr -0x40[ebp]
0160  29 45 E0				sub		dword ptr -0x20[ebp],eax
0163				L$22:
0163  83 7D E0 00			cmp		dword ptr -0x20[ebp],0x00000000
0167  7F 96				jg		L$14
0169				L$23:
0169  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
016D  0F 84 EA 02 00 00			je		L$56
0173  FF 4D E4				dec		dword ptr -0x1c[ebp]
0176  8B 45 E4				mov		eax,dword ptr -0x1c[ebp]
0179  8B 9C 85 B8 FE FF FF		mov		ebx,dword ptr -0x148[ebp+eax*4]
0180  8B 84 85 38 FF FF FF		mov		eax,dword ptr -0xc8[ebp+eax*4]
0187  89 5D 20				mov		dword ptr 0x20[ebp],ebx
018A  89 45 24				mov		dword ptr 0x24[ebp],eax
018D  E9 42 FF FF FF			jmp		L$13
0192				L$24:
0192  8B 45 24				mov		eax,dword ptr 0x24[ebp]
0195  D1 E8				shr		eax,0x01
0197  0F AF 45 28			imul		eax,dword ptr 0x28[ebp]
019B  8B 7D 20				mov		edi,dword ptr 0x20[ebp]
019E  01 C7				add		edi,eax
01A0  83 7D 24 1D			cmp		dword ptr 0x24[ebp],0x0000001d
01A4  0F 86 82 00 00 00			jbe		L$26
01AA  8B 75 24				mov		esi,dword ptr 0x24[ebp]
01AD  4E				dec		esi
01AE  0F AF 75 28			imul		esi,dword ptr 0x28[ebp]
01B2  8B 45 20				mov		eax,dword ptr 0x20[ebp]
01B5  89 45 CC				mov		dword ptr -0x34[ebp],eax
01B8  01 C6				add		esi,eax
01BA  83 7D 24 2A			cmp		dword ptr 0x24[ebp],0x0000002a
01BE  76 5A				jbe		L$25
01C0  8B 5D 24				mov		ebx,dword ptr 0x24[ebp]
01C3  C1 EB 03				shr		ebx,0x03
01C6  0F AF 5D 28			imul		ebx,dword ptr 0x28[ebp]
01CA  8D 04 1B				lea		eax,[ebx+ebx]
01CD  89 45 BC				mov		dword ptr -0x44[ebp],eax
01D0  8B 45 20				mov		eax,dword ptr 0x20[ebp]
01D3  FF 75 E8				push		dword ptr -0x18[ebp]
01D6  03 45 BC				add		eax,dword ptr -0x44[ebp]
01D9  50				push		eax
01DA  8B 45 20				mov		eax,dword ptr 0x20[ebp]
01DD  01 D8				add		eax,ebx
01DF  50				push		eax
01E0  FF 75 20				push		dword ptr 0x20[ebp]
01E3  E8 00 00 00 00			call		med3
01E8  83 C4 10				add		esp,0x00000010
01EB  89 45 CC				mov		dword ptr -0x34[ebp],eax
01EE  FF 75 E8				push		dword ptr -0x18[ebp]
01F1  8D 04 1F				lea		eax,[edi+ebx]
01F4  50				push		eax
01F5  57				push		edi
01F6  29 DF				sub		edi,ebx
01F8  57				push		edi
01F9  E8 00 00 00 00			call		med3
01FE  83 C4 10				add		esp,0x00000010
0201  89 C7				mov		edi,eax
0203  FF 75 E8				push		dword ptr -0x18[ebp]
0206  89 F0				mov		eax,esi
0208  56				push		esi
0209  29 D8				sub		eax,ebx
020B  50				push		eax
020C  2B 75 BC				sub		esi,dword ptr -0x44[ebp]
020F  56				push		esi
0210  E8 00 00 00 00			call		med3
0215  83 C4 10				add		esp,0x00000010
0218  89 C6				mov		esi,eax
021A				L$25:
021A  FF 75 E8				push		dword ptr -0x18[ebp]
021D  56				push		esi
021E  57				push		edi
021F  FF 75 CC				push		dword ptr -0x34[ebp]
0222  E8 00 00 00 00			call		med3
0227  83 C4 10				add		esp,0x00000010
022A  89 C7				mov		edi,eax
022C				L$26:
022C  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0230  74 21				je		L$28
0232  8B 45 20				mov		eax,dword ptr 0x20[ebp]
0235  89 45 D4				mov		dword ptr -0x2c[ebp],eax
0238  74 0C				je		L$27
023A  8B 4D 28				mov		ecx,dword ptr 0x28[ebp]
023D  89 C6				mov		esi,eax
023F  E8 00 00 00 00			call		byteswap
0244  EB 18				jmp		L$29
0246				L$27:
0246  8B 4D 20				mov		ecx,dword ptr 0x20[ebp]
0249  8B 18				mov		ebx,dword ptr [eax]
024B  8B 07				mov		eax,dword ptr [edi]
024D  89 01				mov		dword ptr [ecx],eax
024F  89 1F				mov		dword ptr [edi],ebx
0251  EB 0B				jmp		L$29
0253				L$28:
0253  8D 45 B8				lea		eax,-0x48[ebp]
0256  89 45 D4				mov		dword ptr -0x2c[ebp],eax
0259  8B 07				mov		eax,dword ptr [edi]
025B  89 45 B8				mov		dword ptr -0x48[ebp],eax
025E				L$29:
025E  8B 45 20				mov		eax,dword ptr 0x20[ebp]
0261  89 45 FC				mov		dword ptr -0x4[ebp],eax
0264  89 45 EC				mov		dword ptr -0x14[ebp],eax
0267  8B 45 24				mov		eax,dword ptr 0x24[ebp]
026A  48				dec		eax
026B  0F AF 45 28			imul		eax,dword ptr 0x28[ebp]
026F  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
0272  01 C3				add		ebx,eax
0274  89 5D F4				mov		dword ptr -0xc[ebp],ebx
0277  89 5D F8				mov		dword ptr -0x8[ebp],ebx
027A				L$30:
027A  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
027D  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
0280  77 48				ja		L$34
0282  FF 75 D4				push		dword ptr -0x2c[ebp]
0285  50				push		eax
0286  FF 55 E8				call		dword ptr -0x18[ebp]
0289  83 C4 08				add		esp,0x00000008
028C  85 C0				test		eax,eax
028E  7F 3A				jg		L$34
0290  75 30				jne		L$33
0292  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0296  74 10				je		L$31
0298  8B 4D 28				mov		ecx,dword ptr 0x28[ebp]
029B  8B 7D FC				mov		edi,dword ptr -0x4[ebp]
029E  8B 75 EC				mov		esi,dword ptr -0x14[ebp]
02A1  E8 00 00 00 00			call		byteswap
02A6  EB 14				jmp		L$32
02A8				L$31:
02A8  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
02AB  8B 5D EC				mov		ebx,dword ptr -0x14[ebp]
02AE  8B 4D EC				mov		ecx,dword ptr -0x14[ebp]
02B1  8B 00				mov		eax,dword ptr [eax]
02B3  8B 1B				mov		ebx,dword ptr [ebx]
02B5  89 01				mov		dword ptr [ecx],eax
02B7  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
02BA  89 18				mov		dword ptr [eax],ebx
02BC				L$32:
02BC  8B 45 28				mov		eax,dword ptr 0x28[ebp]
02BF  01 45 EC				add		dword ptr -0x14[ebp],eax
02C2				L$33:
02C2  8B 45 28				mov		eax,dword ptr 0x28[ebp]
02C5  01 45 FC				add		dword ptr -0x4[ebp],eax
02C8  EB B0				jmp		L$30
02CA				L$34:
02CA  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
02CD  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
02D0  72 48				jb		L$38
02D2  FF 75 D4				push		dword ptr -0x2c[ebp]
02D5  50				push		eax
02D6  FF 55 E8				call		dword ptr -0x18[ebp]
02D9  83 C4 08				add		esp,0x00000008
02DC  85 C0				test		eax,eax
02DE  7C 3A				jl		L$38
02E0  75 30				jne		L$37
02E2  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
02E6  74 10				je		L$35
02E8  8B 4D 28				mov		ecx,dword ptr 0x28[ebp]
02EB  8B 7D F4				mov		edi,dword ptr -0xc[ebp]
02EE  8B 75 F8				mov		esi,dword ptr -0x8[ebp]
02F1  E8 00 00 00 00			call		byteswap
02F6  EB 14				jmp		L$36
02F8				L$35:
02F8  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
02FB  8B 5D F8				mov		ebx,dword ptr -0x8[ebp]
02FE  8B 4D F8				mov		ecx,dword ptr -0x8[ebp]
0301  8B 00				mov		eax,dword ptr [eax]
0303  8B 1B				mov		ebx,dword ptr [ebx]
0305  89 01				mov		dword ptr [ecx],eax
0307  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
030A  89 18				mov		dword ptr [eax],ebx
030C				L$36:
030C  8B 45 28				mov		eax,dword ptr 0x28[ebp]
030F  29 45 F4				sub		dword ptr -0xc[ebp],eax
0312				L$37:
0312  8B 45 28				mov		eax,dword ptr 0x28[ebp]
0315  29 45 F8				sub		dword ptr -0x8[ebp],eax
0318  EB B0				jmp		L$34
031A				L$38:
031A  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
031D  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
0320  77 34				ja		L$41
0322  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0326  74 0F				je		L$39
0328  8B 4D 28				mov		ecx,dword ptr 0x28[ebp]
032B  8B 7D F8				mov		edi,dword ptr -0x8[ebp]
032E  89 C6				mov		esi,eax
0330  E8 00 00 00 00			call		byteswap
0335  EB 11				jmp		L$40
0337				L$39:
0337  8B 18				mov		ebx,dword ptr [eax]
0339  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
033C  8B 4D FC				mov		ecx,dword ptr -0x4[ebp]
033F  8B 00				mov		eax,dword ptr [eax]
0341  89 01				mov		dword ptr [ecx],eax
0343  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0346  89 18				mov		dword ptr [eax],ebx
0348				L$40:
0348  8B 45 28				mov		eax,dword ptr 0x28[ebp]
034B  01 45 FC				add		dword ptr -0x4[ebp],eax
034E  29 45 F8				sub		dword ptr -0x8[ebp],eax
0351  E9 24 FF FF FF			jmp		L$30
0356				L$41:
0356  8B 45 24				mov		eax,dword ptr 0x24[ebp]
0359  0F AF 45 28			imul		eax,dword ptr 0x28[ebp]
035D  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
0360  8B 4D EC				mov		ecx,dword ptr -0x14[ebp]
0363  01 C3				add		ebx,eax
0365  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0368  2B 4D 20				sub		ecx,dword ptr 0x20[ebp]
036B  2B 45 EC				sub		eax,dword ptr -0x14[ebp]
036E  89 5D D0				mov		dword ptr -0x30[ebp],ebx
0371  39 C1				cmp		ecx,eax
0373  7C 02				jl		L$42
0375  89 C1				mov		ecx,eax
0377				L$42:
0377  85 C9				test		ecx,ecx
0379  76 2D				jbe		L$47
037B  8B 7D FC				mov		edi,dword ptr -0x4[ebp]
037E  8B 75 20				mov		esi,dword ptr 0x20[ebp]
0381  29 CF				sub		edi,ecx
0383  06				push		es
0384  1E				push		ds
0385  07				pop		es
0386  0F B6 D1				movzx		edx,cl
0389  C1 E9 02				shr		ecx,0x02
038C  74 0B				je		L$44
038E				L$43:
038E  8B 07				mov		eax,dword ptr [edi]
0390  87 06				xchg		dword ptr [esi],eax
0392  AB				stosd		
0393  83 C6 04				add		esi,0x00000004
0396  49				dec		ecx
0397  75 F5				jne		L$43
0399				L$44:
0399  80 E2 03				and		dl,0x03
039C  74 09				je		L$46
039E				L$45:
039E  8A 07				mov		al,byte ptr [edi]
03A0  86 06				xchg		byte ptr [esi],al
03A2  AA				stosb		
03A3  46				inc		esi
03A4  4A				dec		edx
03A5  75 F7				jne		L$45
03A7				L$46:
03A7  07				pop		es
03A8				L$47:
03A8  8B 45 D0				mov		eax,dword ptr -0x30[ebp]
03AB  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
03AE  2B 45 F4				sub		eax,dword ptr -0xc[ebp]
03B1  2B 4D F8				sub		ecx,dword ptr -0x8[ebp]
03B4  2B 45 28				sub		eax,dword ptr 0x28[ebp]
03B7  39 C1				cmp		ecx,eax
03B9  72 02				jb		L$48
03BB  89 C1				mov		ecx,eax
03BD				L$48:
03BD  85 C9				test		ecx,ecx
03BF  76 2D				jbe		L$53
03C1  8B 7D D0				mov		edi,dword ptr -0x30[ebp]
03C4  8B 75 FC				mov		esi,dword ptr -0x4[ebp]
03C7  29 CF				sub		edi,ecx
03C9  06				push		es
03CA  1E				push		ds
03CB  07				pop		es
03CC  0F B6 D1				movzx		edx,cl
03CF  C1 E9 02				shr		ecx,0x02
03D2  74 0B				je		L$50
03D4				L$49:
03D4  8B 07				mov		eax,dword ptr [edi]
03D6  87 06				xchg		dword ptr [esi],eax
03D8  AB				stosd		
03D9  83 C6 04				add		esi,0x00000004
03DC  49				dec		ecx
03DD  75 F5				jne		L$49
03DF				L$50:
03DF  80 E2 03				and		dl,0x03
03E2  74 09				je		L$52
03E4				L$51:
03E4  8A 07				mov		al,byte ptr [edi]
03E6  86 06				xchg		byte ptr [esi],al
03E8  AA				stosb		
03E9  46				inc		esi
03EA  4A				dec		edx
03EB  75 F7				jne		L$51
03ED				L$52:
03ED  07				pop		es
03EE				L$53:
03EE  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
03F1  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
03F4  8B 75 D0				mov		esi,dword ptr -0x30[ebp]
03F7  8B 7D E4				mov		edi,dword ptr -0x1c[ebp]
03FA  2B 5D EC				sub		ebx,dword ptr -0x14[ebp]
03FD  2B 4D F8				sub		ecx,dword ptr -0x8[ebp]
0400  C1 E7 02				shl		edi,0x02
0403  29 CE				sub		esi,ecx
0405  39 D9				cmp		ecx,ebx
0407  72 1E				jb		L$54
0409  89 C8				mov		eax,ecx
040B  31 D2				xor		edx,edx
040D  F7 75 28				div		dword ptr 0x28[ebp]
0410  31 D2				xor		edx,edx
0412  89 84 2F 38 FF FF FF		mov		dword ptr -0xc8[edi+ebp],eax
0419  89 D8				mov		eax,ebx
041B  F7 75 28				div		dword ptr 0x28[ebp]
041E  89 B4 2F B8 FE FF FF		mov		dword ptr -0x148[edi+ebp],esi
0425  EB 2B				jmp		L$55
0427				L$54:
0427  3B 5D 28				cmp		ebx,dword ptr 0x28[ebp]
042A  0F 86 39 FD FF FF			jbe		L$23
0430  8B 45 20				mov		eax,dword ptr 0x20[ebp]
0433  31 D2				xor		edx,edx
0435  89 84 2F B8 FE FF FF		mov		dword ptr -0x148[edi+ebp],eax
043C  89 D8				mov		eax,ebx
043E  F7 75 28				div		dword ptr 0x28[ebp]
0441  31 D2				xor		edx,edx
0443  89 84 2F 38 FF FF FF		mov		dword ptr -0xc8[edi+ebp],eax
044A  89 C8				mov		eax,ecx
044C  F7 75 28				div		dword ptr 0x28[ebp]
044F  89 75 20				mov		dword ptr 0x20[ebp],esi
0452				L$55:
0452  89 45 24				mov		dword ptr 0x24[ebp],eax
0455  FF 45 E4				inc		dword ptr -0x1c[ebp]
0458  E9 77 FC FF FF			jmp		L$13
045D				L$56:
045D  C9				leave		
045E  E9 22 FC FF FF			jmp		L$10

Routine Size: 981 bytes,    Routine Base: _TEXT + 008E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

