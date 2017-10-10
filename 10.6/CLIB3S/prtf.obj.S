Module: prtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000CA7 bytes
0000				__prtf:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  81 EC 20 01 00 00			sub		esp,0x00000120
000B  8B 9C 24 40 01 00 00		mov		ebx,dword ptr 0x140[esp]
0012  8B BC 24 3C 01 00 00		mov		edi,dword ptr 0x13c[esp]
0019  30 E4				xor		ah,ah
001B  30 D2				xor		dl,dl
001D  88 A4 24 1C 01 00 00		mov		byte ptr 0x11c[esp],ah
0024  88 94 24 14 01 00 00		mov		byte ptr 0x114[esp],dl
002B  8B 84 24 38 01 00 00		mov		eax,dword ptr 0x138[esp]
0032  31 D2				xor		edx,edx
0034  89 84 24 00 01 00 00		mov		dword ptr 0x100[esp],eax
003B  89 94 24 10 01 00 00		mov		dword ptr 0x110[esp],edx
0042  E9 A4 00 00 00			jmp		L$6
0047				L$1:
0047  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
004E  50				push		eax
004F  53				push		ebx
0050  56				push		esi
0051  E8 00 00 00 00			call		getprintspecs
0056  89 C7				mov		edi,eax
0058  83 C4 0C				add		esp,0x0000000c
005B  8A 00				mov		al,byte ptr [eax]
005D  47				inc		edi
005E  88 84 24 15 01 00 00		mov		byte ptr 0x115[esp],al
0065  84 C0				test		al,al
0067  0F 84 58 03 00 00			je		L$27
006D  31 C0				xor		eax,eax
006F  8A 84 24 15 01 00 00		mov		al,byte ptr 0x115[esp]
0076  83 F8 6E				cmp		eax,0x0000006e
0079  0F 85 29 01 00 00			jne		L$13
007F  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
0086  24 20				and		al,0x20
0088  0F B6 F0				movzx		esi,al
008B  8A A4 24 14 01 00 00		mov		ah,byte ptr 0x114[esp]
0092  80 E4 40				and		ah,0x40
0095  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
009C  24 80				and		al,0x80
009E  85 F6				test		esi,esi
00A0  0F 84 76 00 00 00			je		L$7
00A6  0F B6 F0				movzx		esi,al
00A9  85 F6				test		esi,esi
00AB  74 16				je		L$3
00AD  8B 03				mov		eax,dword ptr [ebx]
00AF  83 C0 08				add		eax,0x00000008
00B2  89 03				mov		dword ptr [ebx],eax
00B4  C4 70 F8				les		esi,fword ptr -0x8[eax]
00B7				L$2:
00B7  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
00BE  26 89 06				mov		dword ptr es:[esi],eax
00C1  EB 28				jmp		L$6
00C3				L$3:
00C3  88 E0				mov		al,ah
00C5  25 FF 00 00 00			and		eax,0x000000ff
00CA  74 0C				je		L$4
00CC  8B 2B				mov		ebp,dword ptr [ebx]
00CE  83 C5 04				add		ebp,0x00000004
00D1  89 2B				mov		dword ptr [ebx],ebp
00D3  8B 75 FC				mov		esi,dword ptr -0x4[ebp]
00D6  EB 0A				jmp		L$5
00D8				L$4:
00D8  8B 33				mov		esi,dword ptr [ebx]
00DA  83 C6 04				add		esi,0x00000004
00DD  89 33				mov		dword ptr [ebx],esi
00DF  8B 76 FC				mov		esi,dword ptr -0x4[esi]
00E2				L$5:
00E2  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
00E9  89 06				mov		dword ptr [esi],eax
00EB				L$6:
00EB  8A 37				mov		dh,byte ptr [edi]
00ED  84 F6				test		dh,dh
00EF  0F 84 D0 02 00 00			je		L$27
00F5  31 C0				xor		eax,eax
00F7  88 F0				mov		al,dh
00F9  8D 77 01				lea		esi,0x1[edi]
00FC  83 F8 25				cmp		eax,0x00000025
00FF  0F 84 42 FF FF FF			je		L$1
0105  50				push		eax
0106  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
010D  50				push		eax
010E  89 F7				mov		edi,esi
0110  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
0117  83 C4 08				add		esp,0x00000008
011A  EB CF				jmp		L$6
011C				L$7:
011C  8A 94 24 14 01 00 00		mov		dl,byte ptr 0x114[esp]
0123  80 E2 10				and		dl,0x10
0126  0F B6 F2				movzx		esi,dl
0129  85 F6				test		esi,esi
012B  74 49				je		L$11
012D  0F B6 F0				movzx		esi,al
0130  85 F6				test		esi,esi
0132  74 17				je		L$8
0134  8B 0B				mov		ecx,dword ptr [ebx]
0136  83 C1 08				add		ecx,0x00000008
0139  89 0B				mov		dword ptr [ebx],ecx
013B  C4 71 F8				les		esi,fword ptr -0x8[ecx]
013E  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0145  66 26 89 06			mov		word ptr es:[esi],ax
0149  EB A0				jmp		L$6
014B				L$8:
014B  88 E0				mov		al,ah
014D  25 FF 00 00 00			and		eax,0x000000ff
0152  74 16				je		L$10
0154  8B 13				mov		edx,dword ptr [ebx]
0156  83 C2 04				add		edx,0x00000004
0159  89 13				mov		dword ptr [ebx],edx
015B  8B 72 FC				mov		esi,dword ptr -0x4[edx]
015E				L$9:
015E  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0165  66 89 06				mov		word ptr [esi],ax
0168  EB 81				jmp		L$6
016A				L$10:
016A  8B 03				mov		eax,dword ptr [ebx]
016C  83 C0 04				add		eax,0x00000004
016F  89 03				mov		dword ptr [ebx],eax
0171  8B 70 FC				mov		esi,dword ptr -0x4[eax]
0174  EB E8				jmp		L$9
0176				L$11:
0176  0F B6 F0				movzx		esi,al
0179  85 F6				test		esi,esi
017B  74 0F				je		L$12
017D  8B 2B				mov		ebp,dword ptr [ebx]
017F  83 C5 08				add		ebp,0x00000008
0182  89 2B				mov		dword ptr [ebx],ebp
0184  C4 75 F8				les		esi,fword ptr -0x8[ebp]
0187  E9 2B FF FF FF			jmp		L$2
018C				L$12:
018C  88 E0				mov		al,ah
018E  25 FF 00 00 00			and		eax,0x000000ff
0193  0F 85 3F FF FF FF			jne		L$4
0199  8B 0B				mov		ecx,dword ptr [ebx]
019B  83 C1 04				add		ecx,0x00000004
019E  89 0B				mov		dword ptr [ebx],ecx
01A0  8B 71 FC				mov		esi,dword ptr -0x4[ecx]
01A3  E9 3A FF FF FF			jmp		L$5
01A8				L$13:
01A8  8D 84 24 1C 01 00 00		lea		eax,0x11c[esp]
01AF  50				push		eax
01B0  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
01B7  50				push		eax
01B8  53				push		ebx
01B9  8D 44 24 0C			lea		eax,0xc[esp]
01BD  50				push		eax
01BE  E8 00 00 00 00			call		formstring
01C3  83 C4 10				add		esp,0x00000010
01C6  89 C6				mov		esi,eax
01C8  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
01CF  8E C2				mov		es,edx
01D1  24 08				and		al,0x08
01D3  25 FF 00 00 00			and		eax,0x000000ff
01D8  75 3D				jne		L$15
01DA  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
01E1  83 F8 20				cmp		eax,0x00000020
01E4  75 31				jne		L$15
01E6				L$14:
01E6  8B 94 24 04 01 00 00		mov		edx,dword ptr 0x104[esp]
01ED  4A				dec		edx
01EE  89 94 24 04 01 00 00		mov		dword ptr 0x104[esp],edx
01F5  85 D2				test		edx,edx
01F7  7C 1E				jl		L$15
01F9  31 C0				xor		eax,eax
01FB  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
0202  50				push		eax
0203  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
020A  50				push		eax
020B  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
0212  83 C4 08				add		esp,0x00000008
0215  EB CF				jmp		L$14
0217				L$15:
0217  8D AC 24 17 01 00 00		lea		ebp,0x117[esp]
021E				L$16:
021E  8A 6D 00				mov		ch,byte ptr [ebp]
0221  84 ED				test		ch,ch
0223  74 1A				je		L$17
0225  31 C0				xor		eax,eax
0227  88 E8				mov		al,ch
0229  50				push		eax
022A  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0231  50				push		eax
0232  45				inc		ebp
0233  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
023A  83 C4 08				add		esp,0x00000008
023D  EB DF				jmp		L$16
023F				L$17:
023F  8B 84 24 0C 01 00 00		mov		eax,dword ptr 0x10c[esp]
0246  8D 68 FF				lea		ebp,-0x1[eax]
0249  89 AC 24 0C 01 00 00		mov		dword ptr 0x10c[esp],ebp
0250  85 C0				test		eax,eax
0252  74 16				je		L$18
0254  6A 30				push		0x00000030
0256  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
025D  50				push		eax
025E  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
0265  83 C4 08				add		esp,0x00000008
0268  EB D5				jmp		L$17
026A				L$18:
026A  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
0271  24 08				and		al,0x08
0273  25 FF 00 00 00			and		eax,0x000000ff
0278  75 3D				jne		L$20
027A  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
0281  83 F8 20				cmp		eax,0x00000020
0284  74 31				je		L$20
0286				L$19:
0286  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
028D  48				dec		eax
028E  89 84 24 04 01 00 00		mov		dword ptr 0x104[esp],eax
0295  85 C0				test		eax,eax
0297  7C 1E				jl		L$20
0299  31 C0				xor		eax,eax
029B  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
02A2  50				push		eax
02A3  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
02AA  50				push		eax
02AB  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
02B2  83 C4 08				add		esp,0x00000008
02B5  EB CF				jmp		L$19
02B7				L$20:
02B7  31 C0				xor		eax,eax
02B9  8A 84 24 15 01 00 00		mov		al,byte ptr 0x115[esp]
02C0  83 F8 73				cmp		eax,0x00000073
02C3  74 09				je		L$21
02C5  83 F8 53				cmp		eax,0x00000053
02C8  0F 85 76 00 00 00			jne		L$24
02CE				L$21:
02CE  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
02D5  24 20				and		al,0x20
02D7  25 FF 00 00 00			and		eax,0x000000ff
02DC  74 36				je		L$23
02DE				L$22:
02DE  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
02E5  8D 50 FF				lea		edx,-0x1[eax]
02E8  89 94 24 08 01 00 00		mov		dword ptr 0x108[esp],edx
02EF  85 C0				test		eax,eax
02F1  0F 84 7D 00 00 00			je		L$25
02F7  31 C0				xor		eax,eax
02F9  26 8A 06				mov		al,byte ptr es:[esi]
02FC  50				push		eax
02FD  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0304  50				push		eax
0305  83 C6 02				add		esi,0x00000002
0308  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
030F  83 C4 08				add		esp,0x00000008
0312  EB CA				jmp		L$22
0314				L$23:
0314  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
031B  8D 68 FF				lea		ebp,-0x1[eax]
031E  89 AC 24 08 01 00 00		mov		dword ptr 0x108[esp],ebp
0325  85 C0				test		eax,eax
0327  74 4B				je		L$25
0329  31 C0				xor		eax,eax
032B  26 8A 06				mov		al,byte ptr es:[esi]
032E  50				push		eax
032F  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0336  50				push		eax
0337  46				inc		esi
0338  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
033F  83 C4 08				add		esp,0x00000008
0342  EB D0				jmp		L$23
0344				L$24:
0344  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
034B  8D 48 FF				lea		ecx,-0x1[eax]
034E  89 8C 24 08 01 00 00		mov		dword ptr 0x108[esp],ecx
0355  85 C0				test		eax,eax
0357  74 1B				je		L$25
0359  31 C0				xor		eax,eax
035B  26 8A 06				mov		al,byte ptr es:[esi]
035E  50				push		eax
035F  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0366  50				push		eax
0367  46				inc		esi
0368  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
036F  83 C4 08				add		esp,0x00000008
0372  EB D0				jmp		L$24
0374				L$25:
0374  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
037B  24 08				and		al,0x08
037D  25 FF 00 00 00			and		eax,0x000000ff
0382  0F 84 63 FD FF FF			je		L$6
0388  83 BC 24 04 01 00 00 00		cmp		dword ptr 0x104[esp],0x00000000
0390  0F 8E 55 FD FF FF			jle		L$6
0396				L$26:
0396  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
039D  8D 70 FF				lea		esi,-0x1[eax]
03A0  89 B4 24 04 01 00 00		mov		dword ptr 0x104[esp],esi
03A7  85 C0				test		eax,eax
03A9  0F 84 3C FD FF FF			je		L$6
03AF  6A 20				push		0x00000020
03B1  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
03B8  50				push		eax
03B9  FF 94 24 4C 01 00 00		call		dword ptr 0x14c[esp]
03C0  83 C4 08				add		esp,0x00000008
03C3  EB D1				jmp		L$26
03C5				L$27:
03C5  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
03CC  81 C4 20 01 00 00			add		esp,0x00000120
03D2				L$28:
03D2  5D				pop		ebp
03D3				L$29:
03D3  07				pop		es
03D4  5F				pop		edi
03D5  5E				pop		esi
03D6  5B				pop		ebx
03D7  C3				ret		
03D8				getprintspecs:
03D8  53				push		ebx
03D9  56				push		esi
03DA  57				push		edi
03DB  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
03DF  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
03E3  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
03E7  53				push		ebx
03E8  C6 43 17 00			mov		byte ptr 0x17[ebx],0x00
03EC  50				push		eax
03ED  C6 43 16 20			mov		byte ptr 0x16[ebx],0x20
03F1  E8 00 00 00 00			call		evalflags
03F6  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
03FD  83 C4 08				add		esp,0x00000008
0400  8A 10				mov		dl,byte ptr [eax]
0402  81 E2 FF 00 00 00			and		edx,0x000000ff
0408  83 FA 30				cmp		edx,0x00000030
040B  7C 26				jl		L$31
040D  83 FA 39				cmp		edx,0x00000039
0410  7F 21				jg		L$31
0412				L$30:
0412  6B 4B 04 0A			imul		ecx,dword ptr 0x4[ebx],0x0000000a
0416  31 D2				xor		edx,edx
0418  8A 10				mov		dl,byte ptr [eax]
041A  83 EA 30				sub		edx,0x00000030
041D  40				inc		eax
041E  01 D1				add		ecx,edx
0420  31 D2				xor		edx,edx
0422  89 4B 04				mov		dword ptr 0x4[ebx],ecx
0425  8A 10				mov		dl,byte ptr [eax]
0427  83 FA 30				cmp		edx,0x00000030
042A  7C 32				jl		L$33
042C  83 FA 39				cmp		edx,0x00000039
042F  7E E1				jle		L$30
0431  EB 2B				jmp		L$33
0433				L$31:
0433  31 D2				xor		edx,edx
0435  8A 10				mov		dl,byte ptr [eax]
0437  83 FA 2A				cmp		edx,0x0000002a
043A  75 22				jne		L$33
043C  8B 16				mov		edx,dword ptr [esi]
043E  83 C2 04				add		edx,0x00000004
0441  89 16				mov		dword ptr [esi],edx
0443  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0446  89 53 04				mov		dword ptr 0x4[ebx],edx
0449  85 D2				test		edx,edx
044B  7D 10				jge		L$32
044D  89 D7				mov		edi,edx
044F  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0452  F7 DF				neg		edi
0454  80 CA 08				or		dl,0x08
0457  89 7B 04				mov		dword ptr 0x4[ebx],edi
045A  88 53 14				mov		byte ptr 0x14[ebx],dl
045D				L$32:
045D  40				inc		eax
045E				L$33:
045E  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
0465  31 D2				xor		edx,edx
0467  8A 10				mov		dl,byte ptr [eax]
0469  83 FA 2E				cmp		edx,0x0000002e
046C  75 49				jne		L$36
046E  40				inc		eax
046F  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0476  31 D2				xor		edx,edx
0478  8A 10				mov		dl,byte ptr [eax]
047A  83 FA 2A				cmp		edx,0x0000002a
047D  75 1B				jne		L$35
047F  8B 16				mov		edx,dword ptr [esi]
0481  83 C2 04				add		edx,0x00000004
0484  89 16				mov		dword ptr [esi],edx
0486  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0489  89 53 08				mov		dword ptr 0x8[ebx],edx
048C  85 D2				test		edx,edx
048E  7D 07				jge		L$34
0490  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
0497				L$34:
0497  40				inc		eax
0498  EB 1D				jmp		L$36
049A				L$35:
049A  31 D2				xor		edx,edx
049C  8A 10				mov		dl,byte ptr [eax]
049E  83 FA 30				cmp		edx,0x00000030
04A1  7C 14				jl		L$36
04A3  83 FA 39				cmp		edx,0x00000039
04A6  7F 0F				jg		L$36
04A8  6B 4B 08 0A			imul		ecx,dword ptr 0x8[ebx],0x0000000a
04AC  83 EA 30				sub		edx,0x00000030
04AF  01 D1				add		ecx,edx
04B1  40				inc		eax
04B2  89 4B 08				mov		dword ptr 0x8[ebx],ecx
04B5  EB E3				jmp		L$35
04B7				L$36:
04B7  8A 10				mov		dl,byte ptr [eax]
04B9  8D 48 01				lea		ecx,0x1[eax]
04BC  80 FA 4E				cmp		dl,0x4e
04BF  72 1B				jb		L$38
04C1  76 56				jbe		L$44
04C3  80 FA 6C				cmp		dl,0x6c
04C6  72 0B				jb		L$37
04C8  76 22				jbe		L$39
04CA  80 FA 77				cmp		dl,0x77
04CD  74 1D				je		L$39
04CF  5F				pop		edi
04D0  5E				pop		esi
04D1  5B				pop		ebx
04D2  C3				ret		
04D3				L$37:
04D3  80 FA 68				cmp		dl,0x68
04D6  74 22				je		L$41
04D8  5F				pop		edi
04D9  5E				pop		esi
04DA  5B				pop		ebx
04DB  C3				ret		
04DC				L$38:
04DC  80 FA 46				cmp		dl,0x46
04DF  72 3E				jb		L$46
04E1  76 2C				jbe		L$43
04E3  80 FA 4C				cmp		dl,0x4c
04E6  74 18				je		L$42
04E8  5F				pop		edi
04E9  5E				pop		esi
04EA  5B				pop		ebx
04EB  C3				ret		
04EC				L$39:
04EC  8A 73 14				mov		dh,byte ptr 0x14[ebx]
04EF  80 CE 20				or		dh,0x20
04F2  40				inc		eax
04F3				L$40:
04F3  88 73 14				mov		byte ptr 0x14[ebx],dh
04F6  5F				pop		edi
04F7  5E				pop		esi
04F8  5B				pop		ebx
04F9  C3				ret		
04FA				L$41:
04FA  80 4B 14 10			or		byte ptr 0x14[ebx],0x10
04FE  EB 1D				jmp		L$45
0500				L$42:
0500  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0503  80 CA 40				or		dl,0x40
0506  89 C8				mov		eax,ecx
0508  88 53 14				mov		byte ptr 0x14[ebx],dl
050B  5F				pop		edi
050C  5E				pop		esi
050D  5B				pop		ebx
050E  C3				ret		
050F				L$43:
050F  8A 73 14				mov		dh,byte ptr 0x14[ebx]
0512  80 CE 80				or		dh,0x80
0515  89 C8				mov		eax,ecx
0517  EB DA				jmp		L$40
0519				L$44:
0519  80 4B 14 40			or		byte ptr 0x14[ebx],0x40
051D				L$45:
051D  89 C8				mov		eax,ecx
051F				L$46:
051F  5F				pop		edi
0520  5E				pop		esi
0521  5B				pop		ebx
0522  C3				ret		
0523				evalflags:
0523  53				push		ebx
0524  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0528  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
052C  C6 40 14 00			mov		byte ptr 0x14[eax],0x00
0530				L$47:
0530  31 D2				xor		edx,edx
0532  8A 13				mov		dl,byte ptr [ebx]
0534  83 FA 2D				cmp		edx,0x0000002d
0537  75 06				jne		L$48
0539  80 48 14 08			or		byte ptr 0x14[eax],0x08
053D  EB 42				jmp		L$52
053F				L$48:
053F  83 FA 23				cmp		edx,0x00000023
0542  75 06				jne		L$49
0544  80 48 14 01			or		byte ptr 0x14[eax],0x01
0548  EB 37				jmp		L$52
054A				L$49:
054A  83 FA 2B				cmp		edx,0x0000002b
054D  75 10				jne		L$50
054F  8A 70 14				mov		dh,byte ptr 0x14[eax]
0552  80 CE 04				or		dh,0x04
0555  88 F1				mov		cl,dh
0557  80 E1 FD				and		cl,0xfd
055A  88 48 14				mov		byte ptr 0x14[eax],cl
055D  EB 22				jmp		L$52
055F				L$50:
055F  83 FA 20				cmp		edx,0x00000020
0562  75 14				jne		L$51
0564  8A 50 14				mov		dl,byte ptr 0x14[eax]
0567  80 E2 04				and		dl,0x04
056A  81 E2 FF 00 00 00			and		edx,0x000000ff
0570  75 0F				jne		L$52
0572  80 48 14 02			or		byte ptr 0x14[eax],0x02
0576  EB 09				jmp		L$52
0578				L$51:
0578  83 FA 30				cmp		edx,0x00000030
057B  75 07				jne		L$53
057D  C6 40 16 30			mov		byte ptr 0x16[eax],0x30
0581				L$52:
0581  43				inc		ebx
0582  EB AC				jmp		L$47
0584				L$53:
0584  89 D8				mov		eax,ebx
0586  5B				pop		ebx
0587  C3				ret		
0588				far_strlen:
0588  53				push		ebx
0589  56				push		esi
058A  06				push		es
058B  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
058F  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0593  8E 44 24 14			mov		es,dword ptr 0x14[esp]
0597  31 C0				xor		eax,eax
0599				L$54:
0599  89 DA				mov		edx,ebx
059B  26 8A 0A				mov		cl,byte ptr es:[edx]
059E  43				inc		ebx
059F  84 C9				test		cl,cl
05A1  74 07				je		L$55
05A3  39 F0				cmp		eax,esi
05A5  74 03				je		L$55
05A7  40				inc		eax
05A8  EB EF				jmp		L$54
05AA				L$55:
05AA  07				pop		es
05AB  5E				pop		esi
05AC  5B				pop		ebx
05AD  C3				ret		
05AE				far_other_strlen:
05AE  53				push		ebx
05AF  56				push		esi
05B0  57				push		edi
05B1  06				push		es
05B2  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
05B6  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
05BA  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
05BE  31 C0				xor		eax,eax
05C0  8E C2				mov		es,edx
05C2				L$56:
05C2  89 D9				mov		ecx,ebx
05C4  66 26 8B 39			mov		di,word ptr es:[ecx]
05C8  83 C3 02				add		ebx,0x00000002
05CB  66 85 FF				test		di,di
05CE  0F 84 FF FD FF FF			je		L$29
05D4  39 F0				cmp		eax,esi
05D6  0F 84 F7 FD FF FF			je		L$29
05DC  40				inc		eax
05DD  EB E3				jmp		L$56
05DF				fmt4hex:
05DF  53				push		ebx
05E0  56				push		esi
05E1  57				push		edi
05E2  55				push		ebp
05E3  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
05E7  6A 10				push		0x00000010
05E9  55				push		ebp
05EA  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
05EE  52				push		edx
05EF  E8 00 00 00 00			call		itoa
05F4  83 C4 0C				add		esp,0x0000000c
05F7  89 EF				mov		edi,ebp
05F9  06				push		es
05FA  8C D8				mov		eax,ds
05FC  8E C0				mov		es,eax
05FE  29 C9				sub		ecx,ecx
0600  49				dec		ecx
0601  31 C0				xor		eax,eax
0603  F2 AE				repne scasb	
0605  F7 D1				not		ecx
0607  49				dec		ecx
0608  07				pop		es
0609  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
060D  89 EE				mov		esi,ebp
060F  48				dec		eax
0610  8D 14 29				lea		edx,[ecx+ebp]
0613  8D 1C 28				lea		ebx,[eax+ebp]
0616  EB 07				jmp		L$58
0618				L$57:
0618  4A				dec		edx
0619  8A 0A				mov		cl,byte ptr [edx]
061B  48				dec		eax
061C  88 0B				mov		byte ptr [ebx],cl
061E  4B				dec		ebx
061F				L$58:
061F  39 F2				cmp		edx,esi
0621  75 F5				jne		L$57
0623  8D 14 28				lea		edx,[eax+ebp]
0626				L$59:
0626  85 C0				test		eax,eax
0628  7C 07				jl		L$60
062A  48				dec		eax
062B  C6 02 30				mov		byte ptr [edx],0x30
062E  4A				dec		edx
062F  EB F5				jmp		L$59
0631				L$60:
0631  03 6C 24 1C			add		ebp,dword ptr 0x1c[esp]
0635  C6 45 00 00			mov		byte ptr [ebp],0x00
0639  5D				pop		ebp
063A  5F				pop		edi
063B  5E				pop		esi
063C  5B				pop		ebx
063D  C3				ret		
063E				FixedPoint_Format:
063E  53				push		ebx
063F  56				push		esi
0640  57				push		edi
0641  83 EC 04				sub		esp,0x00000004
0644  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0648  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
064C  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0650  89 04 24				mov		dword ptr [esp],eax
0653  85 C0				test		eax,eax
0655  7D 0B				jge		L$61
0657  89 C2				mov		edx,eax
0659  C6 03 2D				mov		byte ptr [ebx],0x2d
065C  F7 DA				neg		edx
065E  43				inc		ebx
065F  89 14 24				mov		dword ptr [esp],edx
0662				L$61:
0662  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
0666  75 07				jne		L$62
0668  C7 46 08 04 00 00 00		mov		dword ptr 0x8[esi],0x00000004
066F				L$62:
066F  6A 0A				push		0x0000000a
0671  31 C0				xor		eax,eax
0673  53				push		ebx
0674  66 8B 44 24 0A			mov		ax,word ptr 0xa[esp]
0679  50				push		eax
067A  E8 00 00 00 00			call		itoa
067F  83 C4 0C				add		esp,0x0000000c
0682  89 D9				mov		ecx,ebx
0684				L$63:
0684  8A 23				mov		ah,byte ptr [ebx]
0686  8D 53 01				lea		edx,0x1[ebx]
0689  84 E4				test		ah,ah
068B  74 04				je		L$64
068D  89 D3				mov		ebx,edx
068F  EB F3				jmp		L$63
0691				L$64:
0691  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
0695  74 2C				je		L$67
0697  C6 03 2E				mov		byte ptr [ebx],0x2e
069A  31 C0				xor		eax,eax
069C  89 D3				mov		ebx,edx
069E  EB 1B				jmp		L$66
06A0				L$65:
06A0  31 D2				xor		edx,edx
06A2  66 89 54 24 02			mov		word ptr 0x2[esp],dx
06A7  8B 3C 24				mov		edi,dword ptr [esp]
06AA  6B D7 0A				imul		edx,edi,0x0000000a
06AD  89 14 24				mov		dword ptr [esp],edx
06B0  8A 54 24 02			mov		dl,byte ptr 0x2[esp]
06B4  80 C2 30				add		dl,0x30
06B7  40				inc		eax
06B8  88 13				mov		byte ptr [ebx],dl
06BA  43				inc		ebx
06BB				L$66:
06BB  3B 46 08				cmp		eax,dword ptr 0x8[esi]
06BE  7C E0				jl		L$65
06C0  C6 03 00				mov		byte ptr [ebx],0x00
06C3				L$67:
06C3  8B 04 24				mov		eax,dword ptr [esp]
06C6  30 C0				xor		al,al
06C8  80 E4 80				and		ah,0x80
06CB  25 FF FF 00 00			and		eax,0x0000ffff
06D0  0F 84 5E 00 00 00			je		L$76
06D6				L$68:
06D6  39 CB				cmp		ebx,ecx
06D8  75 39				jne		L$73
06DA  8D 59 01				lea		ebx,0x1[ecx]
06DD  C6 01 31				mov		byte ptr [ecx],0x31
06E0				L$69:
06E0  31 D2				xor		edx,edx
06E2  8A 13				mov		dl,byte ptr [ebx]
06E4  8D 43 01				lea		eax,0x1[ebx]
06E7  83 FA 30				cmp		edx,0x00000030
06EA  75 04				jne		L$70
06EC  89 C3				mov		ebx,eax
06EE  EB F0				jmp		L$69
06F0				L$70:
06F0  83 FA 2E				cmp		edx,0x0000002e
06F3  75 15				jne		L$72
06F5  C6 03 30				mov		byte ptr [ebx],0x30
06F8  8D 58 01				lea		ebx,0x1[eax]
06FB  C6 00 2E				mov		byte ptr [eax],0x2e
06FE				L$71:
06FE  31 C0				xor		eax,eax
0700  8A 03				mov		al,byte ptr [ebx]
0702  83 F8 30				cmp		eax,0x00000030
0705  75 03				jne		L$72
0707  43				inc		ebx
0708  EB F4				jmp		L$71
070A				L$72:
070A  C6 03 30				mov		byte ptr [ebx],0x30
070D  43				inc		ebx
070E  C6 03 00				mov		byte ptr [ebx],0x00
0711  EB 21				jmp		L$76
0713				L$73:
0713  4B				dec		ebx
0714  31 C0				xor		eax,eax
0716  8A 03				mov		al,byte ptr [ebx]
0718  83 F8 2E				cmp		eax,0x0000002e
071B  75 01				jne		L$74
071D  4B				dec		ebx
071E				L$74:
071E  31 C0				xor		eax,eax
0720  8A 03				mov		al,byte ptr [ebx]
0722  83 F8 39				cmp		eax,0x00000039
0725  74 08				je		L$75
0727  88 C2				mov		dl,al
0729  FE C2				inc		dl
072B  88 13				mov		byte ptr [ebx],dl
072D  EB 05				jmp		L$76
072F				L$75:
072F  C6 03 30				mov		byte ptr [ebx],0x30
0732  EB A2				jmp		L$68
0734				L$76:
0734  83 C4 04				add		esp,0x00000004
0737  5F				pop		edi
0738  5E				pop		esi
0739  5B				pop		ebx
073A  C3				ret		
073B				float_format:
073B  53				push		ebx
073C  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0740  52				push		edx
0741  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0745  53				push		ebx
0746  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
074A  51				push		ecx
074B  FF 15 00 00 00 00			call		dword ptr __EFG_printf
0751  83 C4 0C				add		esp,0x0000000c
0754				L$77:
0754  5B				pop		ebx
0755  C3				ret		
0756				formstring:
0756  53				push		ebx
0757  56				push		esi
0758  57				push		edi
0759  06				push		es
075A  55				push		ebp
075B  83 EC 0C				sub		esp,0x0000000c
075E  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
0762  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0766  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
076A  BA 01 00 00 00			mov		edx,0x00000001
076F  8C 5C 24 04			mov		dword ptr 0x4[esp],ds
0773  89 FE				mov		esi,edi
0775  89 14 24				mov		dword ptr [esp],edx
0778  8A 53 15				mov		dl,byte ptr 0x15[ebx]
077B  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0782  80 FA 69				cmp		dl,0x69
0785  72 1C				jb		L$80
0787  0F 86 69 00 00 00			jbe		L$85
078D  80 FA 75				cmp		dl,0x75
0790  72 0C				jb		L$79
0792  76 1D				jbe		L$81
0794  80 FA 78				cmp		dl,0x78
0797				L$78:
0797  74 18				je		L$81
0799  E9 62 00 00 00			jmp		L$86
079E				L$79:
079E  80 FA 6F				cmp		dl,0x6f
07A1  EB F4				jmp		L$78
07A3				L$80:
07A3  80 FA 58				cmp		dl,0x58
07A6  72 58				jb		L$86
07A8  76 07				jbe		L$81
07AA  80 FA 64				cmp		dl,0x64
07AD  74 47				je		L$85
07AF  EB 4F				jmp		L$86
07B1				L$81:
07B1  8A 53 14				mov		dl,byte ptr 0x14[ebx]
07B4  31 C9				xor		ecx,ecx
07B6  80 E2 20				and		dl,0x20
07B9  88 D1				mov		cl,dl
07BB  85 C9				test		ecx,ecx
07BD  74 0C				je		L$82
07BF  8B 10				mov		edx,dword ptr [eax]
07C1  83 C2 04				add		edx,0x00000004
07C4  89 10				mov		dword ptr [eax],edx
07C6  8B 4A FC				mov		ecx,dword ptr -0x4[edx]
07C9  EB 27				jmp		L$84
07CB				L$82:
07CB  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
07CE  80 E1 10				and		cl,0x10
07D1  85 C9				test		ecx,ecx
07D3  74 13				je		L$83
07D5  8B 28				mov		ebp,dword ptr [eax]
07D7  83 C5 04				add		ebp,0x00000004
07DA  89 28				mov		dword ptr [eax],ebp
07DC  66 8B 4D FC			mov		cx,word ptr -0x4[ebp]
07E0  81 E1 FF FF 00 00			and		ecx,0x0000ffff
07E6  EB 0A				jmp		L$84
07E8				L$83:
07E8  8B 08				mov		ecx,dword ptr [eax]
07EA  83 C1 04				add		ecx,0x00000004
07ED  89 08				mov		dword ptr [eax],ecx
07EF  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
07F2				L$84:
07F2  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
07F6				L$85:
07F6  83 7B 08 FF			cmp		dword ptr 0x8[ebx],0xffffffff
07FA  74 04				je		L$86
07FC  C6 43 16 20			mov		byte ptr 0x16[ebx],0x20
0800				L$86:
0800  8A 53 15				mov		dl,byte ptr 0x15[ebx]
0803  BD 0A 00 00 00			mov		ebp,0x0000000a
0808  80 FA 65				cmp		dl,0x65
080B  72 60				jb		L$89
080D  0F 86 E1 00 00 00			jbe		L$95
0813  80 FA 6F				cmp		dl,0x6f
0816  72 3C				jb		L$88
0818  0F 86 F5 00 00 00			jbe		L$96
081E  80 FA 73				cmp		dl,0x73
0821  72 23				jb		L$87
0823  0F 86 9A 01 00 00			jbe		L$109
0829  80 FA 75				cmp		dl,0x75
082C  0F 82 71 03 00 00			jb		L$128
0832  0F 86 84 02 00 00			jbe		L$121
0838  80 FA 78				cmp		dl,0x78
083B  0F 84 58 02 00 00			je		L$119
0841  E9 5D 03 00 00			jmp		L$128
0846				L$87:
0846  80 FA 70				cmp		dl,0x70
0849  0F 84 94 02 00 00			je		L$122
084F  E9 4F 03 00 00			jmp		L$128
0854				L$88:
0854  80 FA 67				cmp		dl,0x67
0857  72 62				jb		L$94
0859  0F 86 95 00 00 00			jbe		L$95
085F  80 FA 69				cmp		dl,0x69
0862  0F 84 D8 00 00 00			je		L$98
0868  E9 36 03 00 00			jmp		L$128
086D				L$89:
086D  80 FA 50				cmp		dl,0x50
0870  72 33				jb		L$91
0872  0F 86 6B 02 00 00			jbe		L$122
0878  80 FA 58				cmp		dl,0x58
087B  72 1A				jb		L$90
087D  0F 86 16 02 00 00			jbe		L$119
0883  80 FA 63				cmp		dl,0x63
0886  0F 82 17 03 00 00			jb		L$128
088C  0F 86 E5 02 00 00			jbe		L$127
0892  E9 A9 00 00 00			jmp		L$98
0897				L$90:
0897  80 FA 53				cmp		dl,0x53
089A  0F 84 23 01 00 00			je		L$109
08A0  E9 FE 02 00 00			jmp		L$128
08A5				L$91:
08A5  80 FA 46				cmp		dl,0x46
08A8  72 0C				jb		L$93
08AA  76 0F				jbe		L$94
08AC  80 FA 47				cmp		dl,0x47
08AF				L$92:
08AF  74 43				je		L$95
08B1  E9 ED 02 00 00			jmp		L$128
08B6				L$93:
08B6  80 FA 45				cmp		dl,0x45
08B9  EB F4				jmp		L$92
08BB				L$94:
08BB  8A 53 14				mov		dl,byte ptr 0x14[ebx]
08BE  31 C9				xor		ecx,ecx
08C0  80 E2 10				and		dl,0x10
08C3  88 D1				mov		cl,dl
08C5  85 C9				test		ecx,ecx
08C7  74 2B				je		L$95
08C9  8B 08				mov		ecx,dword ptr [eax]
08CB  83 C1 04				add		ecx,0x00000004
08CE  89 08				mov		dword ptr [eax],ecx
08D0  53				push		ebx
08D1  8B 41 FC				mov		eax,dword ptr -0x4[ecx]
08D4  50				push		eax
08D5  57				push		edi
08D6  E8 00 00 00 00			call		FixedPoint_Format
08DB  83 C4 0C				add		esp,0x0000000c
08DE  31 C0				xor		eax,eax
08E0  8C 5C 24 04			mov		dword ptr 0x4[esp],ds
08E4  6A FF				push		0xffffffff
08E6  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
08EB  50				push		eax
08EC  57				push		edi
08ED  89 FE				mov		esi,edi
08EF  E9 C2 00 00 00			jmp		L$107
08F4				L$95:
08F4  53				push		ebx
08F5  50				push		eax
08F6  57				push		edi
08F7  E8 00 00 00 00			call		float_format
08FC  83 C4 0C				add		esp,0x0000000c
08FF  31 C9				xor		ecx,ecx
0901  6A FF				push		0xffffffff
0903  66 89 D1				mov		cx,dx
0906  51				push		ecx
0907  50				push		eax
0908  89 C6				mov		esi,eax
090A  89 54 24 10			mov		dword ptr 0x10[esp],edx
090E  E9 A3 00 00 00			jmp		L$107
0913				L$96:
0913  8A 43 14				mov		al,byte ptr 0x14[ebx]
0916  BD 08 00 00 00			mov		ebp,0x00000008
091B  24 01				and		al,0x01
091D  25 FF 00 00 00			and		eax,0x000000ff
0922  74 04				je		L$97
0924  C6 07 30				mov		byte ptr [edi],0x30
0927  47				inc		edi
0928				L$97:
0928  55				push		ebp
0929  57				push		edi
092A  51				push		ecx
092B  E8 00 00 00 00			call		ltoa
0930  8B 43 08				mov		eax,dword ptr 0x8[ebx]
0933  83 C4 0C				add		esp,0x0000000c
0936  85 C0				test		eax,eax
0938  0F 85 6D 00 00 00			jne		L$105
093E  EB 5C				jmp		L$104
0940				L$98:
0940  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0943  80 E2 20				and		dl,0x20
0946  81 E2 FF 00 00 00			and		edx,0x000000ff
094C  74 14				je		L$100
094E  8B 08				mov		ecx,dword ptr [eax]
0950  83 C1 04				add		ecx,0x00000004
0953  55				push		ebp
0954  89 08				mov		dword ptr [eax],ecx
0956  57				push		edi
0957  8B 41 FC				mov		eax,dword ptr -0x4[ecx]
095A				L$99:
095A  50				push		eax
095B  E8 00 00 00 00			call		ltoa
0960  EB 2F				jmp		L$102
0962				L$100:
0962  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0965  80 E2 10				and		dl,0x10
0968  81 E2 FF 00 00 00			and		edx,0x000000ff
096E  74 0F				je		L$101
0970  8B 10				mov		edx,dword ptr [eax]
0972  83 C2 04				add		edx,0x00000004
0975  55				push		ebp
0976  89 10				mov		dword ptr [eax],edx
0978  57				push		edi
0979  0F BF 42 FC			movsx		eax,word ptr -0x4[edx]
097D  EB DB				jmp		L$99
097F				L$101:
097F  8B 10				mov		edx,dword ptr [eax]
0981  83 C2 04				add		edx,0x00000004
0984  55				push		ebp
0985  89 10				mov		dword ptr [eax],edx
0987  57				push		edi
0988  8B 4A FC				mov		ecx,dword ptr -0x4[edx]
098B  51				push		ecx
098C  E8 00 00 00 00			call		itoa
0991				L$102:
0991  83 C4 0C				add		esp,0x0000000c
0994				L$103:
0994  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
0998  75 11				jne		L$105
099A  31 C0				xor		eax,eax
099C				L$104:
099C  8A 07				mov		al,byte ptr [edi]
099E  83 F8 30				cmp		eax,0x00000030
09A1  75 08				jne		L$105
09A3  8E 44 24 04			mov		es,dword ptr 0x4[esp]
09A7  26 C6 06 00			mov		byte ptr es:[esi],0x00
09AB				L$105:
09AB  31 C0				xor		eax,eax
09AD  6A FF				push		0xffffffff
09AF				L$106:
09AF  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
09B4  50				push		eax
09B5  56				push		esi
09B6				L$107:
09B6  E8 00 00 00 00			call		far_strlen
09BB				L$108:
09BB  83 C4 0C				add		esp,0x0000000c
09BE  E9 09 02 00 00			jmp		L$129
09C3				L$109:
09C3  8A 53 14				mov		dl,byte ptr 0x14[ebx]
09C6  80 E2 80				and		dl,0x80
09C9  81 E2 FF 00 00 00			and		edx,0x000000ff
09CF  74 27				je		L$112
09D1  8B 30				mov		esi,dword ptr [eax]
09D3  83 C6 08				add		esi,0x00000008
09D6  89 30				mov		dword ptr [eax],esi
09D8  89 F0				mov		eax,esi
09DA  8B 40 F8				mov		eax,dword ptr -0x8[eax]
09DD  66 8B 76 FC			mov		si,word ptr -0x4[esi]
09E1  85 C0				test		eax,eax
09E3  75 05				jne		L$110
09E5  66 85 F6				test		si,si
09E8  74 08				je		L$111
09EA				L$110:
09EA  89 74 24 04			mov		dword ptr 0x4[esp],esi
09EE  89 C6				mov		esi,eax
09F0  EB 3A				jmp		L$115
09F2				L$111:
09F2  8B 74 24 30			mov		esi,dword ptr 0x30[esp]
09F6  EB 30				jmp		L$114
09F8				L$112:
09F8  8A 53 14				mov		dl,byte ptr 0x14[ebx]
09FB  80 E2 40				and		dl,0x40
09FE  81 E2 FF 00 00 00			and		edx,0x000000ff
0A04  74 10				je		L$113
0A06  8B 08				mov		ecx,dword ptr [eax]
0A08  83 C1 04				add		ecx,0x00000004
0A0B  89 08				mov		dword ptr [eax],ecx
0A0D  8B 71 FC				mov		esi,dword ptr -0x4[ecx]
0A10  85 F6				test		esi,esi
0A12  75 14				jne		L$114
0A14  EB DC				jmp		L$111
0A16				L$113:
0A16  8B 10				mov		edx,dword ptr [eax]
0A18  83 C2 04				add		edx,0x00000004
0A1B  89 10				mov		dword ptr [eax],edx
0A1D  8B 72 FC				mov		esi,dword ptr -0x4[edx]
0A20  85 F6				test		esi,esi
0A22  75 04				jne		L$114
0A24  8B 74 24 30			mov		esi,dword ptr 0x30[esp]
0A28				L$114:
0A28  8C 5C 24 04			mov		dword ptr 0x4[esp],ds
0A2C				L$115:
0A2C  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
0A2F  31 FF				xor		edi,edi
0A31  31 C0				xor		eax,eax
0A33  80 E1 F9				and		cl,0xf9
0A36  89 3C 24				mov		dword ptr [esp],edi
0A39  8A 43 15				mov		al,byte ptr 0x15[ebx]
0A3C  88 4B 14				mov		byte ptr 0x14[ebx],cl
0A3F  83 F8 53				cmp		eax,0x00000053
0A42  75 2A				jne		L$117
0A44  88 C8				mov		al,cl
0A46  24 20				and		al,0x20
0A48  25 FF 00 00 00			and		eax,0x000000ff
0A4D  74 12				je		L$116
0A4F  8E 44 24 04			mov		es,dword ptr 0x4[esp]
0A53  31 C0				xor		eax,eax
0A55  66 26 8B 06			mov		ax,word ptr es:[esi]
0A59  83 C6 02				add		esi,0x00000002
0A5C  E9 6B 01 00 00			jmp		L$129
0A61				L$116:
0A61  8E 44 24 04			mov		es,dword ptr 0x4[esp]
0A65  26 8A 06				mov		al,byte ptr es:[esi]
0A68  46				inc		esi
0A69  E9 5E 01 00 00			jmp		L$129
0A6E				L$117:
0A6E  88 C8				mov		al,cl
0A70  24 20				and		al,0x20
0A72  25 FF 00 00 00			and		eax,0x000000ff
0A77  74 17				je		L$118
0A79  8B 43 08				mov		eax,dword ptr 0x8[ebx]
0A7C  50				push		eax
0A7D  31 C0				xor		eax,eax
0A7F  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
0A84  50				push		eax
0A85  56				push		esi
0A86  E8 00 00 00 00			call		far_other_strlen
0A8B  E9 2B FF FF FF			jmp		L$108
0A90				L$118:
0A90  8B 6B 08				mov		ebp,dword ptr 0x8[ebx]
0A93  55				push		ebp
0A94  E9 16 FF FF FF			jmp		L$106
0A99				L$119:
0A99  8A 43 14				mov		al,byte ptr 0x14[ebx]
0A9C  24 01				and		al,0x01
0A9E  25 FF 00 00 00			and		eax,0x000000ff
0AA3  74 12				je		L$120
0AA5  85 C9				test		ecx,ecx
0AA7  74 0E				je		L$120
0AA9  C6 43 17 30			mov		byte ptr 0x17[ebx],0x30
0AAD  8A 43 15				mov		al,byte ptr 0x15[ebx]
0AB0  C6 43 19 00			mov		byte ptr 0x19[ebx],0x00
0AB4  88 43 18				mov		byte ptr 0x18[ebx],al
0AB7				L$120:
0AB7  BD 10 00 00 00			mov		ebp,0x00000010
0ABC				L$121:
0ABC  55				push		ebp
0ABD  57				push		edi
0ABE  51				push		ecx
0ABF  E8 00 00 00 00			call		ultoa
0AC4  31 C0				xor		eax,eax
0AC6  8A 43 15				mov		al,byte ptr 0x15[ebx]
0AC9  83 C4 0C				add		esp,0x0000000c
0ACC  83 F8 58				cmp		eax,0x00000058
0ACF  0F 85 BF FE FF FF			jne		L$103
0AD5  57				push		edi
0AD6  E8 00 00 00 00			call		zupstr
0ADB  83 C4 04				add		esp,0x00000004
0ADE  E9 B1 FE FF FF			jmp		L$103
0AE3				L$122:
0AE3  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
0AE7  75 1E				jne		L$124
0AE9  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0AEC  31 C9				xor		ecx,ecx
0AEE  80 E2 80				and		dl,0x80
0AF1  88 D1				mov		cl,dl
0AF3  85 C9				test		ecx,ecx
0AF5  74 09				je		L$123
0AF7  C7 43 04 0D 00 00 00		mov		dword ptr 0x4[ebx],0x0000000d
0AFE  EB 07				jmp		L$124
0B00				L$123:
0B00  C7 43 04 08 00 00 00		mov		dword ptr 0x4[ebx],0x00000008
0B07				L$124:
0B07  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
0B0B  8B 08				mov		ecx,dword ptr [eax]
0B0D  83 C1 04				add		ecx,0x00000004
0B10  89 08				mov		dword ptr [eax],ecx
0B12  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0B15  80 E2 80				and		dl,0x80
0B18  88 54 24 08			mov		byte ptr 0x8[esp],dl
0B1C  31 D2				xor		edx,edx
0B1E  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
0B22  8B 69 FC				mov		ebp,dword ptr -0x4[ecx]
0B25  85 D2				test		edx,edx
0B27  74 26				je		L$125
0B29  83 C1 04				add		ecx,0x00000004
0B2C  89 08				mov		dword ptr [eax],ecx
0B2E  6A 04				push		0x00000004
0B30  8B 41 FC				mov		eax,dword ptr -0x4[ecx]
0B33  57				push		edi
0B34  25 FF FF 00 00			and		eax,0x0000ffff
0B39  50				push		eax
0B3A  E8 00 00 00 00			call		fmt4hex
0B3F  83 C4 0C				add		esp,0x0000000c
0B42  6A 08				push		0x00000008
0B44  8D 47 05				lea		eax,0x5[edi]
0B47  50				push		eax
0B48  55				push		ebp
0B49  C6 47 04 3A			mov		byte ptr 0x4[edi],0x3a
0B4D  EB 04				jmp		L$126
0B4F				L$125:
0B4F  6A 08				push		0x00000008
0B51  57				push		edi
0B52  55				push		ebp
0B53				L$126:
0B53  E8 00 00 00 00			call		fmt4hex
0B58  83 C4 0C				add		esp,0x0000000c
0B5B  31 C0				xor		eax,eax
0B5D  8A 43 15				mov		al,byte ptr 0x15[ebx]
0B60  83 F8 50				cmp		eax,0x00000050
0B63  0F 85 42 FE FF FF			jne		L$105
0B69  57				push		edi
0B6A  E8 00 00 00 00			call		zupstr
0B6F  83 C4 04				add		esp,0x00000004
0B72  E9 34 FE FF FF			jmp		L$105
0B77				L$127:
0B77  8B 10				mov		edx,dword ptr [eax]
0B79  83 C2 04				add		edx,0x00000004
0B7C  89 10				mov		dword ptr [eax],edx
0B7E  8A 42 FC				mov		al,byte ptr -0x4[edx]
0B81  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
0B85  31 C9				xor		ecx,ecx
0B87  88 07				mov		byte ptr [edi],al
0B89  89 0C 24				mov		dword ptr [esp],ecx
0B8C  8A 73 14				mov		dh,byte ptr 0x14[ebx]
0B8F  C7 43 08 01 00 00 00		mov		dword ptr 0x8[ebx],0x00000001
0B96  80 E6 F9				and		dh,0xf9
0B99  B8 01 00 00 00			mov		eax,0x00000001
0B9E  88 73 14				mov		byte ptr 0x14[ebx],dh
0BA1  EB 29				jmp		L$129
0BA3				L$128:
0BA3  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
0BAA  8A 43 15				mov		al,byte ptr 0x15[ebx]
0BAD  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
0BB1  88 07				mov		byte ptr [edi],al
0BB3  C7 43 08 01 00 00 00		mov		dword ptr 0x8[ebx],0x00000001
0BBA  8A 43 14				mov		al,byte ptr 0x14[ebx]
0BBD  31 FF				xor		edi,edi
0BBF  24 F9				and		al,0xf9
0BC1  89 3C 24				mov		dword ptr [esp],edi
0BC4  88 43 14				mov		byte ptr 0x14[ebx],al
0BC7  B8 01 00 00 00			mov		eax,0x00000001
0BCC				L$129:
0BCC  83 3C 24 00			cmp		dword ptr [esp],0x00000000
0BD0  74 4F				je		L$135
0BD2  8E 44 24 04			mov		es,dword ptr 0x4[esp]
0BD6  31 C9				xor		ecx,ecx
0BD8  26 8A 0E				mov		cl,byte ptr es:[esi]
0BDB  83 F9 2D				cmp		ecx,0x0000002d
0BDE  75 08				jne		L$130
0BE0  46				inc		esi
0BE1  C6 43 17 2D			mov		byte ptr 0x17[ebx],0x2d
0BE5  48				dec		eax
0BE6  EB 22				jmp		L$132
0BE8				L$130:
0BE8  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0BEB  31 C9				xor		ecx,ecx
0BED  80 E2 02				and		dl,0x02
0BF0  88 D1				mov		cl,dl
0BF2  85 C9				test		ecx,ecx
0BF4  74 06				je		L$131
0BF6  C6 43 17 20			mov		byte ptr 0x17[ebx],0x20
0BFA  EB 0E				jmp		L$132
0BFC				L$131:
0BFC  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
0BFF  80 E1 04				and		cl,0x04
0C02  85 C9				test		ecx,ecx
0C04  74 08				je		L$133
0C06  C6 43 17 2B			mov		byte ptr 0x17[ebx],0x2b
0C0A				L$132:
0C0A  C6 43 18 00			mov		byte ptr 0x18[ebx],0x00
0C0E				L$133:
0C0E  8B 53 08				mov		edx,dword ptr 0x8[ebx]
0C11  39 D0				cmp		eax,edx
0C13  7E 05				jle		L$134
0C15  89 43 08				mov		dword ptr 0x8[ebx],eax
0C18  EB 07				jmp		L$135
0C1A				L$134:
0C1A  89 D1				mov		ecx,edx
0C1C  29 C1				sub		ecx,eax
0C1E  89 4B 0C				mov		dword ptr 0xc[ebx],ecx
0C21				L$135:
0C21  31 C9				xor		ecx,ecx
0C23  8A 4B 16				mov		cl,byte ptr 0x16[ebx]
0C26  83 F9 2A				cmp		ecx,0x0000002a
0C29  75 0D				jne		L$136
0C2B  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0C2E  C6 43 17 00			mov		byte ptr 0x17[ebx],0x00
0C32  80 E2 F9				and		dl,0xf9
0C35  88 53 14				mov		byte ptr 0x14[ebx],dl
0C38				L$136:
0C38  8B 4B 08				mov		ecx,dword ptr 0x8[ebx]
0C3B  83 F9 FF				cmp		ecx,0xffffffff
0C3E  74 04				je		L$137
0C40  39 C8				cmp		eax,ecx
0C42  7D 0D				jge		L$138
0C44				L$137:
0C44  31 C9				xor		ecx,ecx
0C46  8A 4B 15				mov		cl,byte ptr 0x15[ebx]
0C49  83 F9 63				cmp		ecx,0x00000063
0C4C  74 03				je		L$138
0C4E  89 43 08				mov		dword ptr 0x8[ebx],eax
0C51				L$138:
0C51  6A FF				push		0xffffffff
0C53  8D 4B 17				lea		ecx,0x17[ebx]
0C56  8C D8				mov		eax,ds
0C58  25 FF FF 00 00			and		eax,0x0000ffff
0C5D  50				push		eax
0C5E  51				push		ecx
0C5F  E8 00 00 00 00			call		far_strlen
0C64  83 C4 0C				add		esp,0x0000000c
0C67  8B 6B 08				mov		ebp,dword ptr 0x8[ebx]
0C6A  8B 53 0C				mov		edx,dword ptr 0xc[ebx]
0C6D  01 E8				add		eax,ebp
0C6F  8B 4B 04				mov		ecx,dword ptr 0x4[ebx]
0C72  01 D0				add		eax,edx
0C74  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0C78  29 C1				sub		ecx,eax
0C7A  89 F0				mov		eax,esi
0C7C  89 4B 04				mov		dword ptr 0x4[ebx],ecx
0C7F  83 C4 0C				add		esp,0x0000000c
0C82  E9 4B F7 FF FF			jmp		L$28
0C87				zupstr:
0C87  53				push		ebx
0C88  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0C8C				L$139:
0C8C  80 3B 00				cmp		byte ptr [ebx],0x00
0C8F  0F 84 BF FA FF FF			je		L$77
0C95  31 C0				xor		eax,eax
0C97  8A 03				mov		al,byte ptr [ebx]
0C99  50				push		eax
0C9A  E8 00 00 00 00			call		toupper
0C9F  83 C4 04				add		esp,0x00000004
0CA2  88 03				mov		byte ptr [ebx],al
0CA4  43				inc		ebx
0CA5  EB E5				jmp		L$139

Routine Size: 3239 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

