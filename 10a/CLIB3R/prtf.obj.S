Module: prtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000009FA bytes
0000				__prtf_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  55				push		ebp
0004  83 EC 4C				sub		esp,0x0000004c
0007  89 DE				mov		esi,ebx
0009  89 4C 24 44			mov		dword ptr 0x44[esp],ecx
000D  30 DB				xor		bl,bl
000F  89 44 24 28			mov		dword ptr 0x28[esp],eax
0013  88 5C 24 48			mov		byte ptr 0x48[esp],bl
0017  88 5C 24 3C			mov		byte ptr 0x3c[esp],bl
001B  31 DB				xor		ebx,ebx
001D  89 D7				mov		edi,edx
001F  89 5C 24 38			mov		dword ptr 0x38[esp],ebx
0023  BD 04 00 00 00			mov		ebp,0x00000004
0028  EB 59				jmp		L$5
002A				L$1:
002A  8D 5C 24 28			lea		ebx,0x28[esp]
002E  89 F2				mov		edx,esi
0030  E8 00 00 00 00			call		getprintspecs_
0035  89 C7				mov		edi,eax
0037  8A 00				mov		al,byte ptr [eax]
0039  47				inc		edi
003A  88 44 24 3D			mov		byte ptr 0x3d[esp],al
003E  84 C0				test		al,al
0040  0F 84 2F 02 00 00			je		L$28
0046  3C 6E				cmp		al,0x6e
0048  0F 85 D7 00 00 00			jne		L$14
004E  8A 5C 24 3C			mov		bl,byte ptr 0x3c[esp]
0052  F6 C3 20				test		bl,0x20
0055  74 59				je		L$7
0057  F6 C3 80				test		bl,0x80
005A  74 13				je		L$3
005C  8B 0E				mov		ecx,dword ptr [esi]
005E  83 C1 08				add		ecx,0x00000008
0061  89 0E				mov		dword ptr [esi],ecx
0063  C4 51 F8				les		edx,fword ptr -0x8[ecx]
0066				L$2:
0066  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
006A  26 89 02				mov		dword ptr es:[edx],eax
006D  EB 14				jmp		L$5
006F				L$3:
006F  F6 C3 40				test		bl,0x40
0072  74 31				je		L$6
0074  8B 1E				mov		ebx,dword ptr [esi]
0076  01 EB				add		ebx,ebp
0078  89 1E				mov		dword ptr [esi],ebx
007A  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
007D				L$4:
007D  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
0081  89 02				mov		dword ptr [edx],eax
0083				L$5:
0083  8A 0F				mov		cl,byte ptr [edi]
0085  84 C9				test		cl,cl
0087  0F 84 E8 01 00 00			je		L$28
008D  8D 47 01				lea		eax,0x1[edi]
0090  80 F9 25				cmp		cl,0x25
0093  74 95				je		L$1
0095  89 C7				mov		edi,eax
0097  31 D2				xor		edx,edx
0099  8D 44 24 28			lea		eax,0x28[esp]
009D  88 CA				mov		dl,cl
009F  FF 54 24 44			call		dword ptr 0x44[esp]
00A3  EB DE				jmp		L$5
00A5				L$6:
00A5  8B 16				mov		edx,dword ptr [esi]
00A7  01 EA				add		edx,ebp
00A9  89 16				mov		dword ptr [esi],edx
00AB  8B 52 FC				mov		edx,dword ptr -0x4[edx]
00AE  EB CD				jmp		L$4
00B0				L$7:
00B0  F6 C3 10				test		bl,0x10
00B3  74 3B				je		L$11
00B5  F6 C3 80				test		bl,0x80
00B8  74 14				je		L$8
00BA  8B 06				mov		eax,dword ptr [esi]
00BC  83 C0 08				add		eax,0x00000008
00BF  89 06				mov		dword ptr [esi],eax
00C1  C4 50 F8				les		edx,fword ptr -0x8[eax]
00C4  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
00C8  66 26 89 02			mov		word ptr es:[edx],ax
00CC  EB B5				jmp		L$5
00CE				L$8:
00CE  F6 C3 40				test		bl,0x40
00D1  74 12				je		L$10
00D3  8B 0E				mov		ecx,dword ptr [esi]
00D5  01 E9				add		ecx,ebp
00D7  89 0E				mov		dword ptr [esi],ecx
00D9  8B 51 FC				mov		edx,dword ptr -0x4[ecx]
00DC				L$9:
00DC  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
00E0  66 89 02				mov		word ptr [edx],ax
00E3  EB 9E				jmp		L$5
00E5				L$10:
00E5  8B 1E				mov		ebx,dword ptr [esi]
00E7  01 EB				add		ebx,ebp
00E9  89 1E				mov		dword ptr [esi],ebx
00EB  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
00EE  EB EC				jmp		L$9
00F0				L$11:
00F0  F6 C3 80				test		bl,0x80
00F3  74 0F				je		L$12
00F5  8B 16				mov		edx,dword ptr [esi]
00F7  83 C2 08				add		edx,0x00000008
00FA  89 16				mov		dword ptr [esi],edx
00FC  C4 52 F8				les		edx,fword ptr -0x8[edx]
00FF  E9 62 FF FF FF			jmp		L$2
0104				L$12:
0104  F6 C3 40				test		bl,0x40
0107  74 0E				je		L$13
0109  8B 06				mov		eax,dword ptr [esi]
010B  01 E8				add		eax,ebp
010D  89 06				mov		dword ptr [esi],eax
010F  8B 50 FC				mov		edx,dword ptr -0x4[eax]
0112  E9 66 FF FF FF			jmp		L$4
0117				L$13:
0117  8B 0E				mov		ecx,dword ptr [esi]
0119  01 E9				add		ecx,ebp
011B  89 0E				mov		dword ptr [esi],ecx
011D  8B 51 FC				mov		edx,dword ptr -0x4[ecx]
0120  E9 58 FF FF FF			jmp		L$4
0125				L$14:
0125  89 E0				mov		eax,esp
0127  8D 5C 24 28			lea		ebx,0x28[esp]
012B  8D 4C 24 48			lea		ecx,0x48[esp]
012F  89 F2				mov		edx,esi
0131  E8 00 00 00 00			call		formstring_
0136  8E C2				mov		es,edx
0138  8A 54 24 3C			mov		dl,byte ptr 0x3c[esp]
013C  89 C3				mov		ebx,eax
013E  F6 C2 08				test		dl,0x08
0141  75 24				jne		L$16
0143  80 7C 24 3E 20			cmp		byte ptr 0x3e[esp],0x20
0148  75 1D				jne		L$16
014A				L$15:
014A  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
014E  48				dec		eax
014F  89 44 24 2C			mov		dword ptr 0x2c[esp],eax
0153  85 C0				test		eax,eax
0155  7C 10				jl		L$16
0157  31 D2				xor		edx,edx
0159  8D 44 24 28			lea		eax,0x28[esp]
015D  8A 54 24 3E			mov		dl,byte ptr 0x3e[esp]
0161  FF 54 24 44			call		dword ptr 0x44[esp]
0165  EB E3				jmp		L$15
0167				L$16:
0167  8D 4C 24 3F			lea		ecx,0x3f[esp]
016B				L$17:
016B  8A 01				mov		al,byte ptr [ecx]
016D  84 C0				test		al,al
016F  74 0F				je		L$18
0171  31 D2				xor		edx,edx
0173  88 C2				mov		dl,al
0175  8D 44 24 28			lea		eax,0x28[esp]
0179  41				inc		ecx
017A  FF 54 24 44			call		dword ptr 0x44[esp]
017E  EB EB				jmp		L$17
0180				L$18:
0180  8B 44 24 34			mov		eax,dword ptr 0x34[esp]
0184  8D 48 FF				lea		ecx,-0x1[eax]
0187  89 4C 24 34			mov		dword ptr 0x34[esp],ecx
018B  85 C0				test		eax,eax
018D  74 0F				je		L$19
018F  8D 44 24 28			lea		eax,0x28[esp]
0193  BA 30 00 00 00			mov		edx,0x00000030
0198  FF 54 24 44			call		dword ptr 0x44[esp]
019C  EB E2				jmp		L$18
019E				L$19:
019E  F6 44 24 3C 08			test		byte ptr 0x3c[esp],0x08
01A3  75 24				jne		L$21
01A5  80 7C 24 3E 20			cmp		byte ptr 0x3e[esp],0x20
01AA  74 1D				je		L$21
01AC				L$20:
01AC  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
01B0  48				dec		eax
01B1  89 44 24 2C			mov		dword ptr 0x2c[esp],eax
01B5  85 C0				test		eax,eax
01B7  7C 10				jl		L$21
01B9  31 D2				xor		edx,edx
01BB  8D 44 24 28			lea		eax,0x28[esp]
01BF  8A 54 24 3E			mov		dl,byte ptr 0x3e[esp]
01C3  FF 54 24 44			call		dword ptr 0x44[esp]
01C7  EB E3				jmp		L$20
01C9				L$21:
01C9  8A 74 24 3D			mov		dh,byte ptr 0x3d[esp]
01CD  80 FE 73				cmp		dh,0x73
01D0  74 05				je		L$22
01D2  80 FE 53				cmp		dh,0x53
01D5  75 47				jne		L$25
01D7				L$22:
01D7  F6 44 24 3C 20			test		byte ptr 0x3c[esp],0x20
01DC  74 21				je		L$24
01DE				L$23:
01DE  8B 44 24 30			mov		eax,dword ptr 0x30[esp]
01E2  8D 48 FF				lea		ecx,-0x1[eax]
01E5  89 4C 24 30			mov		dword ptr 0x30[esp],ecx
01E9  85 C0				test		eax,eax
01EB  74 50				je		L$26
01ED  31 D2				xor		edx,edx
01EF  8D 44 24 28			lea		eax,0x28[esp]
01F3  26 8A 13				mov		dl,byte ptr es:[ebx]
01F6  FF 54 24 44			call		dword ptr 0x44[esp]
01FA  83 C3 02				add		ebx,0x00000002
01FD  EB DF				jmp		L$23
01FF				L$24:
01FF  8B 44 24 30			mov		eax,dword ptr 0x30[esp]
0203  8D 50 FF				lea		edx,-0x1[eax]
0206  89 54 24 30			mov		dword ptr 0x30[esp],edx
020A  85 C0				test		eax,eax
020C  74 2F				je		L$26
020E  31 D2				xor		edx,edx
0210  8D 44 24 28			lea		eax,0x28[esp]
0214  26 8A 13				mov		dl,byte ptr es:[ebx]
0217  FF 54 24 44			call		dword ptr 0x44[esp]
021B  43				inc		ebx
021C  EB E1				jmp		L$24
021E				L$25:
021E  8B 44 24 30			mov		eax,dword ptr 0x30[esp]
0222  8D 48 FF				lea		ecx,-0x1[eax]
0225  89 4C 24 30			mov		dword ptr 0x30[esp],ecx
0229  85 C0				test		eax,eax
022B  74 10				je		L$26
022D  31 D2				xor		edx,edx
022F  8D 44 24 28			lea		eax,0x28[esp]
0233  26 8A 13				mov		dl,byte ptr es:[ebx]
0236  FF 54 24 44			call		dword ptr 0x44[esp]
023A  43				inc		ebx
023B  EB E1				jmp		L$25
023D				L$26:
023D  F6 44 24 3C 08			test		byte ptr 0x3c[esp],0x08
0242  0F 84 3B FE FF FF			je		L$5
0248  83 7C 24 2C 00			cmp		dword ptr 0x2c[esp],0x00000000
024D  0F 8E 30 FE FF FF			jle		L$5
0253				L$27:
0253  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
0257  8D 50 FF				lea		edx,-0x1[eax]
025A  89 54 24 2C			mov		dword ptr 0x2c[esp],edx
025E  85 C0				test		eax,eax
0260  0F 84 1D FE FF FF			je		L$5
0266  8D 44 24 28			lea		eax,0x28[esp]
026A  BA 20 00 00 00			mov		edx,0x00000020
026F  FF 54 24 44			call		dword ptr 0x44[esp]
0273  EB DE				jmp		L$27
0275				L$28:
0275  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
0279  83 C4 4C				add		esp,0x0000004c
027C  5D				pop		ebp
027D  07				pop		es
027E  5F				pop		edi
027F  5E				pop		esi
0280  C3				ret		
0281				getprintspecs_:
0281  51				push		ecx
0282  56				push		esi
0283  57				push		edi
0284  89 D6				mov		esi,edx
0286  C6 43 17 00			mov		byte ptr 0x17[ebx],0x00
028A  89 DA				mov		edx,ebx
028C  C6 43 16 20			mov		byte ptr 0x16[ebx],0x20
0290  E8 00 00 00 00			call		evalflags_
0295  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
029C  8A 08				mov		cl,byte ptr [eax]
029E  89 C2				mov		edx,eax
02A0  80 F9 30				cmp		cl,0x30
02A3  72 24				jb		L$30
02A5  80 F9 39				cmp		cl,0x39
02A8  77 1F				ja		L$30
02AA				L$29:
02AA  6B 4B 04 0A			imul		ecx,dword ptr 0x4[ebx],0x0000000a
02AE  31 D2				xor		edx,edx
02B0  8A 10				mov		dl,byte ptr [eax]
02B2  83 EA 30				sub		edx,0x00000030
02B5  01 D1				add		ecx,edx
02B7  40				inc		eax
02B8  89 4B 04				mov		dword ptr 0x4[ebx],ecx
02BB  8A 08				mov		cl,byte ptr [eax]
02BD  80 F9 30				cmp		cl,0x30
02C0  72 2E				jb		L$32
02C2  80 F9 39				cmp		cl,0x39
02C5  76 E3				jbe		L$29
02C7  EB 27				jmp		L$32
02C9				L$30:
02C9  80 38 2A				cmp		byte ptr [eax],0x2a
02CC  75 22				jne		L$32
02CE  8B 16				mov		edx,dword ptr [esi]
02D0  83 C2 04				add		edx,0x00000004
02D3  89 16				mov		dword ptr [esi],edx
02D5  8B 52 FC				mov		edx,dword ptr -0x4[edx]
02D8  89 53 04				mov		dword ptr 0x4[ebx],edx
02DB  85 D2				test		edx,edx
02DD  7D 10				jge		L$31
02DF  89 D7				mov		edi,edx
02E1  8A 73 14				mov		dh,byte ptr 0x14[ebx]
02E4  F7 DF				neg		edi
02E6  80 CE 08				or		dh,0x08
02E9  89 7B 04				mov		dword ptr 0x4[ebx],edi
02EC  88 73 14				mov		byte ptr 0x14[ebx],dh
02EF				L$31:
02EF  40				inc		eax
02F0				L$32:
02F0  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
02F7  80 38 2E				cmp		byte ptr [eax],0x2e
02FA  75 47				jne		L$35
02FC  40				inc		eax
02FD  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0304  80 38 2A				cmp		byte ptr [eax],0x2a
0307  75 1B				jne		L$34
0309  8B 16				mov		edx,dword ptr [esi]
030B  83 C2 04				add		edx,0x00000004
030E  89 16				mov		dword ptr [esi],edx
0310  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0313  89 53 08				mov		dword ptr 0x8[ebx],edx
0316  85 D2				test		edx,edx
0318  7D 07				jge		L$33
031A  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
0321				L$33:
0321  40				inc		eax
0322  EB 1F				jmp		L$35
0324				L$34:
0324  8A 08				mov		cl,byte ptr [eax]
0326  80 F9 30				cmp		cl,0x30
0329  72 18				jb		L$35
032B  80 F9 39				cmp		cl,0x39
032E  77 13				ja		L$35
0330  6B 4B 08 0A			imul		ecx,dword ptr 0x8[ebx],0x0000000a
0334  31 D2				xor		edx,edx
0336  8A 10				mov		dl,byte ptr [eax]
0338  83 EA 30				sub		edx,0x00000030
033B  01 D1				add		ecx,edx
033D  40				inc		eax
033E  89 4B 08				mov		dword ptr 0x8[ebx],ecx
0341  EB E1				jmp		L$34
0343				L$35:
0343  8A 08				mov		cl,byte ptr [eax]
0345  8D 50 01				lea		edx,0x1[eax]
0348  80 F9 4E				cmp		cl,0x4e
034B  72 1B				jb		L$37
034D  76 56				jbe		L$43
034F  80 F9 6C				cmp		cl,0x6c
0352  72 0B				jb		L$36
0354  76 22				jbe		L$38
0356  80 F9 77				cmp		cl,0x77
0359  74 1D				je		L$38
035B  5F				pop		edi
035C  5E				pop		esi
035D  59				pop		ecx
035E  C3				ret		
035F				L$36:
035F  80 F9 68				cmp		cl,0x68
0362  74 22				je		L$39
0364  5F				pop		edi
0365  5E				pop		esi
0366  59				pop		ecx
0367  C3				ret		
0368				L$37:
0368  80 F9 46				cmp		cl,0x46
036B  72 43				jb		L$44
036D  76 30				jbe		L$42
036F  80 F9 4C				cmp		cl,0x4c
0372  74 21				je		L$40
0374  5F				pop		edi
0375  5E				pop		esi
0376  59				pop		ecx
0377  C3				ret		
0378				L$38:
0378  8A 53 14				mov		dl,byte ptr 0x14[ebx]
037B  80 CA 20				or		dl,0x20
037E  40				inc		eax
037F  88 53 14				mov		byte ptr 0x14[ebx],dl
0382  5F				pop		edi
0383  5E				pop		esi
0384  59				pop		ecx
0385  C3				ret		
0386				L$39:
0386  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
0389  80 C9 10				or		cl,0x10
038C  89 D0				mov		eax,edx
038E  88 4B 14				mov		byte ptr 0x14[ebx],cl
0391  5F				pop		edi
0392  5E				pop		esi
0393  59				pop		ecx
0394  C3				ret		
0395				L$40:
0395  80 4B 14 40			or		byte ptr 0x14[ebx],0x40
0399				L$41:
0399  89 D0				mov		eax,edx
039B  5F				pop		edi
039C  5E				pop		esi
039D  59				pop		ecx
039E  C3				ret		
039F				L$42:
039F  80 4B 14 80			or		byte ptr 0x14[ebx],0x80
03A3  EB F4				jmp		L$41
03A5				L$43:
03A5  8A 6B 14				mov		ch,byte ptr 0x14[ebx]
03A8  80 CD 40				or		ch,0x40
03AB  89 D0				mov		eax,edx
03AD  88 6B 14				mov		byte ptr 0x14[ebx],ch
03B0				L$44:
03B0  5F				pop		edi
03B1  5E				pop		esi
03B2  59				pop		ecx
03B3  C3				ret		
03B4				evalflags_:
03B4  53				push		ebx
03B5  51				push		ecx
03B6  C6 42 14 00			mov		byte ptr 0x14[edx],0x00
03BA				L$45:
03BA  8A 18				mov		bl,byte ptr [eax]
03BC  80 FB 2D				cmp		bl,0x2d
03BF  75 06				jne		L$46
03C1  80 4A 14 08			or		byte ptr 0x14[edx],0x08
03C5  EB 42				jmp		L$50
03C7				L$46:
03C7  80 FB 23				cmp		bl,0x23
03CA  75 06				jne		L$47
03CC  80 4A 14 01			or		byte ptr 0x14[edx],0x01
03D0  EB 37				jmp		L$50
03D2				L$47:
03D2  80 FB 2B				cmp		bl,0x2b
03D5  75 13				jne		L$48
03D7  8A 6A 14				mov		ch,byte ptr 0x14[edx]
03DA  80 CD 04				or		ch,0x04
03DD  88 EB				mov		bl,ch
03DF  88 6A 14				mov		byte ptr 0x14[edx],ch
03E2  80 E3 FD				and		bl,0xfd
03E5  88 5A 14				mov		byte ptr 0x14[edx],bl
03E8  EB 1F				jmp		L$50
03EA				L$48:
03EA  80 FB 20				cmp		bl,0x20
03ED  75 12				jne		L$49
03EF  8A 7A 14				mov		bh,byte ptr 0x14[edx]
03F2  F6 C7 04				test		bh,0x04
03F5  75 12				jne		L$50
03F7  88 F9				mov		cl,bh
03F9  80 C9 02				or		cl,0x02
03FC  88 4A 14				mov		byte ptr 0x14[edx],cl
03FF  EB 08				jmp		L$50
0401				L$49:
0401  80 FB 30				cmp		bl,0x30
0404  75 06				jne		L$51
0406  88 5A 16				mov		byte ptr 0x16[edx],bl
0409				L$50:
0409  40				inc		eax
040A  EB AE				jmp		L$45
040C				L$51:
040C  59				pop		ecx
040D  5B				pop		ebx
040E  C3				ret		
040F				far_strlen_:
040F  51				push		ecx
0410  56				push		esi
0411  57				push		edi
0412  06				push		es
0413  89 D6				mov		esi,edx
0415  89 DF				mov		edi,ebx
0417  89 C2				mov		edx,eax
0419  31 C0				xor		eax,eax
041B				L$52:
041B  8E C6				mov		es,esi
041D  89 D3				mov		ebx,edx
041F  26 8A 0B				mov		cl,byte ptr es:[ebx]
0422  42				inc		edx
0423  84 C9				test		cl,cl
0425  74 07				je		L$53
0427  39 F8				cmp		eax,edi
0429  74 03				je		L$53
042B  40				inc		eax
042C  EB ED				jmp		L$52
042E				L$53:
042E  07				pop		es
042F  5F				pop		edi
0430  5E				pop		esi
0431  59				pop		ecx
0432  C3				ret		
0433				far_other_strlen_:
0433  51				push		ecx
0434  56				push		esi
0435  57				push		edi
0436  06				push		es
0437  89 D1				mov		ecx,edx
0439  89 DE				mov		esi,ebx
043B  89 C2				mov		edx,eax
043D  31 C0				xor		eax,eax
043F				L$54:
043F  8E C1				mov		es,ecx
0441  89 D3				mov		ebx,edx
0443  66 26 8B 3B			mov		di,word ptr es:[ebx]
0447  83 C2 02				add		edx,0x00000002
044A  66 85 FF				test		di,di
044D  74 DF				je		L$53
044F  39 F0				cmp		eax,esi
0451  74 DB				je		L$53
0453  40				inc		eax
0454  EB E9				jmp		L$54
0456				fmt4hex_:
0456  51				push		ecx
0457  56				push		esi
0458  57				push		edi
0459  55				push		ebp
045A  83 EC 04				sub		esp,0x00000004
045D  89 D5				mov		ebp,edx
045F  89 1C 24				mov		dword ptr [esp],ebx
0462  BB 10 00 00 00			mov		ebx,0x00000010
0467  89 EF				mov		edi,ebp
0469  E8 00 00 00 00			call		itoa_
046E  06				push		es
046F  8C D8				mov		eax,ds
0471  8E C0				mov		es,eax
0473  29 C9				sub		ecx,ecx
0475  49				dec		ecx
0476  31 C0				xor		eax,eax
0478  F2 AE				repne scasb	
047A  F7 D1				not		ecx
047C  49				dec		ecx
047D  07				pop		es
047E  8B 04 24				mov		eax,dword ptr [esp]
0481  89 CE				mov		esi,ecx
0483  89 EF				mov		edi,ebp
0485  48				dec		eax
0486  8D 14 29				lea		edx,[ecx+ebp]
0489  8D 1C 28				lea		ebx,[eax+ebp]
048C  EB 08				jmp		L$56
048E				L$55:
048E  4A				dec		edx
048F  4E				dec		esi
0490  8A 0A				mov		cl,byte ptr [edx]
0492  48				dec		eax
0493  88 0B				mov		byte ptr [ebx],cl
0495  4B				dec		ebx
0496				L$56:
0496  39 FA				cmp		edx,edi
0498  75 F4				jne		L$55
049A  8D 14 28				lea		edx,[eax+ebp]
049D				L$57:
049D  85 C0				test		eax,eax
049F  7C 07				jl		L$58
04A1  48				dec		eax
04A2  C6 02 30				mov		byte ptr [edx],0x30
04A5  4A				dec		edx
04A6  EB F5				jmp		L$57
04A8				L$58:
04A8  03 2C 24				add		ebp,dword ptr [esp]
04AB  C6 45 00 00			mov		byte ptr [ebp],0x00
04AF  83 C4 04				add		esp,0x00000004
04B2  5D				pop		ebp
04B3  5F				pop		edi
04B4  5E				pop		esi
04B5  59				pop		ecx
04B6  C3				ret		
04B7				FixedPoint_Format_:
04B7  51				push		ecx
04B8  56				push		esi
04B9  57				push		edi
04BA  83 EC 04				sub		esp,0x00000004
04BD  89 C1				mov		ecx,eax
04BF  89 DE				mov		esi,ebx
04C1  89 14 24				mov		dword ptr [esp],edx
04C4  85 D2				test		edx,edx
04C6  7D 0B				jge		L$59
04C8  F7 DA				neg		edx
04CA  8D 48 01				lea		ecx,0x1[eax]
04CD  C6 00 2D				mov		byte ptr [eax],0x2d
04D0  89 14 24				mov		dword ptr [esp],edx
04D3				L$59:
04D3  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
04D7  75 07				jne		L$60
04D9  C7 46 08 04 00 00 00		mov		dword ptr 0x8[esi],0x00000004
04E0				L$60:
04E0  BB 0A 00 00 00			mov		ebx,0x0000000a
04E5  31 C0				xor		eax,eax
04E7  89 CA				mov		edx,ecx
04E9  66 8B 44 24 02			mov		ax,word ptr 0x2[esp]
04EE  E8 00 00 00 00			call		itoa_
04F3  89 CB				mov		ebx,ecx
04F5				L$61:
04F5  8A 21				mov		ah,byte ptr [ecx]
04F7  8D 51 01				lea		edx,0x1[ecx]
04FA  84 E4				test		ah,ah
04FC  74 04				je		L$62
04FE  89 D1				mov		ecx,edx
0500  EB F3				jmp		L$61
0502				L$62:
0502  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
0506  74 2C				je		L$65
0508  C6 01 2E				mov		byte ptr [ecx],0x2e
050B  31 C0				xor		eax,eax
050D  89 D1				mov		ecx,edx
050F  EB 1B				jmp		L$64
0511				L$63:
0511  31 D2				xor		edx,edx
0513  66 89 54 24 02			mov		word ptr 0x2[esp],dx
0518  8B 3C 24				mov		edi,dword ptr [esp]
051B  6B D7 0A				imul		edx,edi,0x0000000a
051E  89 14 24				mov		dword ptr [esp],edx
0521  8A 54 24 02			mov		dl,byte ptr 0x2[esp]
0525  80 C2 30				add		dl,0x30
0528  40				inc		eax
0529  88 11				mov		byte ptr [ecx],dl
052B  41				inc		ecx
052C				L$64:
052C  3B 46 08				cmp		eax,dword ptr 0x8[esi]
052F  7C E0				jl		L$63
0531  C6 01 00				mov		byte ptr [ecx],0x00
0534				L$65:
0534  F6 44 24 01 80			test		byte ptr 0x1[esp],0x80
0539  74 50				je		L$74
053B				L$66:
053B  39 D9				cmp		ecx,ebx
053D  75 32				jne		L$71
053F  8D 4B 01				lea		ecx,0x1[ebx]
0542  C6 03 31				mov		byte ptr [ebx],0x31
0545				L$67:
0545  8A 11				mov		dl,byte ptr [ecx]
0547  8D 41 01				lea		eax,0x1[ecx]
054A  80 FA 30				cmp		dl,0x30
054D  75 04				jne		L$68
054F  89 C1				mov		ecx,eax
0551  EB F2				jmp		L$67
0553				L$68:
0553  80 FA 2E				cmp		dl,0x2e
0556  75 10				jne		L$70
0558  C6 01 30				mov		byte ptr [ecx],0x30
055B  8D 48 01				lea		ecx,0x1[eax]
055E  88 10				mov		byte ptr [eax],dl
0560				L$69:
0560  80 39 30				cmp		byte ptr [ecx],0x30
0563  75 03				jne		L$70
0565  41				inc		ecx
0566  EB F8				jmp		L$69
0568				L$70:
0568  C6 01 30				mov		byte ptr [ecx],0x30
056B  41				inc		ecx
056C  C6 01 00				mov		byte ptr [ecx],0x00
056F  EB 1A				jmp		L$74
0571				L$71:
0571  49				dec		ecx
0572  80 39 2E				cmp		byte ptr [ecx],0x2e
0575  75 01				jne		L$72
0577  49				dec		ecx
0578				L$72:
0578  8A 01				mov		al,byte ptr [ecx]
057A  3C 39				cmp		al,0x39
057C  74 08				je		L$73
057E  88 C4				mov		ah,al
0580  FE C4				inc		ah
0582  88 21				mov		byte ptr [ecx],ah
0584  EB 05				jmp		L$74
0586				L$73:
0586  C6 01 30				mov		byte ptr [ecx],0x30
0589  EB B0				jmp		L$66
058B				L$74:
058B  83 C4 04				add		esp,0x00000004
058E  5F				pop		edi
058F  5E				pop		esi
0590  59				pop		ecx
0591  C3				ret		
0592				float_format_:
0592  FF 15 00 00 00 00			call		dword ptr ___EFG_printf
0598  C3				ret		
0599				formstring_:
0599  56				push		esi
059A  57				push		edi
059B  06				push		es
059C  55				push		ebp
059D  83 EC 08				sub		esp,0x00000008
05A0  89 C7				mov		edi,eax
05A2  89 DE				mov		esi,ebx
05A4  89 0C 24				mov		dword ptr [esp],ecx
05A7  BB 01 00 00 00			mov		ebx,0x00000001
05AC  8C D8				mov		eax,ds
05AE  89 F9				mov		ecx,edi
05B0  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
05B4  8E C0				mov		es,eax
05B6  8A 46 15				mov		al,byte ptr 0x15[esi]
05B9  C7 46 0C 00 00 00 00		mov		dword ptr 0xc[esi],0x00000000
05C0  3C 69				cmp		al,0x69
05C2  72 16				jb		L$77
05C4  0F 86 50 00 00 00			jbe		L$82
05CA  3C 75				cmp		al,0x75
05CC  72 08				jb		L$76
05CE  76 16				jbe		L$78
05D0  3C 78				cmp		al,0x78
05D2				L$75:
05D2  74 12				je		L$78
05D4  EB 4E				jmp		L$83
05D6				L$76:
05D6  3C 6F				cmp		al,0x6f
05D8  EB F8				jmp		L$75
05DA				L$77:
05DA  3C 58				cmp		al,0x58
05DC  72 46				jb		L$83
05DE  76 06				jbe		L$78
05E0  3C 64				cmp		al,0x64
05E2  74 36				je		L$82
05E4  EB 3E				jmp		L$83
05E6				L$78:
05E6  8A 66 14				mov		ah,byte ptr 0x14[esi]
05E9  F6 C4 20				test		ah,0x20
05EC  74 0C				je		L$79
05EE  8B 1A				mov		ebx,dword ptr [edx]
05F0  83 C3 04				add		ebx,0x00000004
05F3  89 1A				mov		dword ptr [edx],ebx
05F5  8B 6B FC				mov		ebp,dword ptr -0x4[ebx]
05F8  EB 1C				jmp		L$81
05FA				L$79:
05FA  F6 C4 10				test		ah,0x10
05FD  74 0D				je		L$80
05FF  8B 02				mov		eax,dword ptr [edx]
0601  83 C0 04				add		eax,0x00000004
0604  89 02				mov		dword ptr [edx],eax
0606  0F B7 68 FC			movzx		ebp,word ptr -0x4[eax]
060A  EB 0A				jmp		L$81
060C				L$80:
060C  8B 2A				mov		ebp,dword ptr [edx]
060E  83 C5 04				add		ebp,0x00000004
0611  89 2A				mov		dword ptr [edx],ebp
0613  8B 6D FC				mov		ebp,dword ptr -0x4[ebp]
0616				L$81:
0616  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
061A				L$82:
061A  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
061E  74 04				je		L$83
0620  C6 46 16 20			mov		byte ptr 0x16[esi],0x20
0624				L$83:
0624  8A 46 15				mov		al,byte ptr 0x15[esi]
0627  BB 0A 00 00 00			mov		ebx,0x0000000a
062C  3C 65				cmp		al,0x65
062E  72 59				jb		L$86
0630  0F 86 C4 00 00 00			jbe		L$92
0636  3C 6F				cmp		al,0x6f
0638  72 38				jb		L$85
063A  0F 86 CE 00 00 00			jbe		L$93
0640  3C 73				cmp		al,0x73
0642  72 21				jb		L$84
0644  0F 86 3F 01 00 00			jbe		L$102
064A  3C 75				cmp		al,0x75
064C  0F 82 CB 02 00 00			jb		L$122
0652  0F 86 FA 01 00 00			jbe		L$115
0658  3C 78				cmp		al,0x78
065A  0F 84 D5 01 00 00			je		L$113
0660  E9 B8 02 00 00			jmp		L$122
0665				L$84:
0665  3C 70				cmp		al,0x70
0667  0F 84 04 02 00 00			je		L$116
066D  E9 AB 02 00 00			jmp		L$122
0672				L$85:
0672  3C 67				cmp		al,0x67
0674  72 5A				jb		L$91
0676  0F 86 7E 00 00 00			jbe		L$92
067C  3C 69				cmp		al,0x69
067E  0F 84 C5 00 00 00			je		L$98
0684  E9 94 02 00 00			jmp		L$122
0689				L$86:
0689  3C 50				cmp		al,0x50
068B  72 30				jb		L$88
068D  0F 86 DE 01 00 00			jbe		L$116
0693  3C 58				cmp		al,0x58
0695  72 19				jb		L$87
0697  0F 86 98 01 00 00			jbe		L$113
069D  3C 63				cmp		al,0x63
069F  0F 82 78 02 00 00			jb		L$122
06A5  0F 86 45 02 00 00			jbe		L$121
06AB  E9 99 00 00 00			jmp		L$98
06B0				L$87:
06B0  3C 53				cmp		al,0x53
06B2  0F 84 D1 00 00 00			je		L$102
06B8  E9 60 02 00 00			jmp		L$122
06BD				L$88:
06BD  3C 46				cmp		al,0x46
06BF  72 0B				jb		L$90
06C1  76 0D				jbe		L$91
06C3  3C 47				cmp		al,0x47
06C5				L$89:
06C5  74 33				je		L$92
06C7  E9 51 02 00 00			jmp		L$122
06CC				L$90:
06CC  3C 45				cmp		al,0x45
06CE  EB F5				jmp		L$89
06D0				L$91:
06D0  F6 46 14 10			test		byte ptr 0x14[esi],0x10
06D4  74 24				je		L$92
06D6  8B 1A				mov		ebx,dword ptr [edx]
06D8  83 C3 04				add		ebx,0x00000004
06DB  89 1A				mov		dword ptr [edx],ebx
06DD  89 F8				mov		eax,edi
06DF  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
06E2  89 F3				mov		ebx,esi
06E4  E8 00 00 00 00			call		FixedPoint_Format_
06E9  BB FF FF FF FF			mov		ebx,0xffffffff
06EE  8C D8				mov		eax,ds
06F0  8C DA				mov		edx,ds
06F2  8E C0				mov		es,eax
06F4  89 F8				mov		eax,edi
06F6  89 F9				mov		ecx,edi
06F8  EB 45				jmp		L$97
06FA				L$92:
06FA  89 F8				mov		eax,edi
06FC  89 F3				mov		ebx,esi
06FE  E8 00 00 00 00			call		float_format_
0703  BB FF FF FF FF			mov		ebx,0xffffffff
0708  8E C2				mov		es,edx
070A  89 C1				mov		ecx,eax
070C  EB 31				jmp		L$97
070E				L$93:
070E  8A 46 14				mov		al,byte ptr 0x14[esi]
0711  BB 08 00 00 00			mov		ebx,0x00000008
0716  A8 01				test		al,0x01
0718  74 04				je		L$94
071A  C6 07 30				mov		byte ptr [edi],0x30
071D  47				inc		edi
071E				L$94:
071E  89 E8				mov		eax,ebp
0720  89 FA				mov		edx,edi
0722  E8 00 00 00 00			call		ltoa_
0727				L$95:
0727  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
072B  75 09				jne		L$96
072D  80 3F 30				cmp		byte ptr [edi],0x30
0730  75 04				jne		L$96
0732  26 C6 01 00			mov		byte ptr es:[ecx],0x00
0736				L$96:
0736  BB FF FF FF FF			mov		ebx,0xffffffff
073B  8C C2				mov		edx,es
073D  89 C8				mov		eax,ecx
073F				L$97:
073F  E8 00 00 00 00			call		far_strlen_
0744  E9 FE 01 00 00			jmp		L$123
0749				L$98:
0749  8A 46 14				mov		al,byte ptr 0x14[esi]
074C  A8 20				test		al,0x20
074E  74 13				je		L$100
0750  8B 2A				mov		ebp,dword ptr [edx]
0752  83 C5 04				add		ebp,0x00000004
0755  89 2A				mov		dword ptr [edx],ebp
0757  89 FA				mov		edx,edi
0759  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
075C				L$99:
075C  E8 00 00 00 00			call		ltoa_
0761  EB C4				jmp		L$95
0763				L$100:
0763  A8 10				test		al,0x10
0765  74 0F				je		L$101
0767  8B 02				mov		eax,dword ptr [edx]
0769  83 C0 04				add		eax,0x00000004
076C  89 02				mov		dword ptr [edx],eax
076E  89 FA				mov		edx,edi
0770  0F BF 40 FC			movsx		eax,word ptr -0x4[eax]
0774  EB E6				jmp		L$99
0776				L$101:
0776  8B 2A				mov		ebp,dword ptr [edx]
0778  83 C5 04				add		ebp,0x00000004
077B  89 2A				mov		dword ptr [edx],ebp
077D  89 FA				mov		edx,edi
077F  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0782  E8 00 00 00 00			call		itoa_
0787  EB 9E				jmp		L$95
0789				L$102:
0789  8A 66 14				mov		ah,byte ptr 0x14[esi]
078C  F6 C4 80				test		ah,0x80
078F  74 22				je		L$105
0791  8B 0A				mov		ecx,dword ptr [edx]
0793  83 C1 08				add		ecx,0x00000008
0796  89 0A				mov		dword ptr [edx],ecx
0798  66 8B 51 FC			mov		dx,word ptr -0x4[ecx]
079C  8B 49 F8				mov		ecx,dword ptr -0x8[ecx]
079F  85 C9				test		ecx,ecx
07A1  75 05				jne		L$103
07A3  66 85 D2				test		dx,dx
07A6  74 04				je		L$104
07A8				L$103:
07A8  8E C2				mov		es,edx
07AA  EB 33				jmp		L$109
07AC				L$104:
07AC  8C D8				mov		eax,ds
07AE  8B 0C 24				mov		ecx,dword ptr [esp]
07B1  EB 2A				jmp		L$108
07B3				L$105:
07B3  F6 C4 40				test		ah,0x40
07B6  74 12				je		L$107
07B8  8B 1A				mov		ebx,dword ptr [edx]
07BA  83 C3 04				add		ebx,0x00000004
07BD  89 1A				mov		dword ptr [edx],ebx
07BF  8B 4B FC				mov		ecx,dword ptr -0x4[ebx]
07C2  85 C9				test		ecx,ecx
07C4  74 E6				je		L$104
07C6				L$106:
07C6  8C D8				mov		eax,ds
07C8  EB 13				jmp		L$108
07CA				L$107:
07CA  8B 02				mov		eax,dword ptr [edx]
07CC  83 C0 04				add		eax,0x00000004
07CF  89 02				mov		dword ptr [edx],eax
07D1  8B 48 FC				mov		ecx,dword ptr -0x4[eax]
07D4  85 C9				test		ecx,ecx
07D6  75 EE				jne		L$106
07D8  8C D8				mov		eax,ds
07DA  8B 0C 24				mov		ecx,dword ptr [esp]
07DD				L$108:
07DD  8E C0				mov		es,eax
07DF				L$109:
07DF  8A 7E 14				mov		bh,byte ptr 0x14[esi]
07E2  8A 46 15				mov		al,byte ptr 0x15[esi]
07E5  31 FF				xor		edi,edi
07E7  80 E7 F9				and		bh,0xf9
07EA  89 7C 24 04			mov		dword ptr 0x4[esp],edi
07EE  88 7E 14				mov		byte ptr 0x14[esi],bh
07F1  3C 53				cmp		al,0x53
07F3  75 1E				jne		L$111
07F5  F6 C7 20				test		bh,0x20
07F8  74 0E				je		L$110
07FA  31 C0				xor		eax,eax
07FC  66 26 8B 01			mov		ax,word ptr es:[ecx]
0800  83 C1 02				add		ecx,0x00000002
0803  E9 3F 01 00 00			jmp		L$123
0808				L$110:
0808  31 C0				xor		eax,eax
080A  26 8A 01				mov		al,byte ptr es:[ecx]
080D  41				inc		ecx
080E  E9 34 01 00 00			jmp		L$123
0813				L$111:
0813  F6 C7 20				test		bh,0x20
0816  74 11				je		L$112
0818  8C C2				mov		edx,es
081A  89 C8				mov		eax,ecx
081C  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
081F  E8 00 00 00 00			call		far_other_strlen_
0824  E9 1E 01 00 00			jmp		L$123
0829				L$112:
0829  8C C2				mov		edx,es
082B  89 C8				mov		eax,ecx
082D  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
0830  E9 0A FF FF FF			jmp		L$97
0835				L$113:
0835  F6 46 14 01			test		byte ptr 0x14[esi],0x01
0839  74 12				je		L$114
083B  85 ED				test		ebp,ebp
083D  74 0E				je		L$114
083F  C6 46 17 30			mov		byte ptr 0x17[esi],0x30
0843  8A 46 15				mov		al,byte ptr 0x15[esi]
0846  C6 46 19 00			mov		byte ptr 0x19[esi],0x00
084A  88 46 18				mov		byte ptr 0x18[esi],al
084D				L$114:
084D  BB 10 00 00 00			mov		ebx,0x00000010
0852				L$115:
0852  89 E8				mov		eax,ebp
0854  89 FA				mov		edx,edi
0856  E8 00 00 00 00			call		ultoa_
085B  80 7E 15 58			cmp		byte ptr 0x15[esi],0x58
085F  0F 85 C2 FE FF FF			jne		L$95
0865  89 F8				mov		eax,edi
0867  E8 00 00 00 00			call		zupstr_
086C  E9 B6 FE FF FF			jmp		L$95
0871				L$116:
0871  83 7E 04 00			cmp		dword ptr 0x4[esi],0x00000000
0875  75 16				jne		L$118
0877  F6 46 14 80			test		byte ptr 0x14[esi],0x80
087B  74 09				je		L$117
087D  C7 46 04 0D 00 00 00		mov		dword ptr 0x4[esi],0x0000000d
0884  EB 07				jmp		L$118
0886				L$117:
0886  C7 46 04 08 00 00 00		mov		dword ptr 0x4[esi],0x00000008
088D				L$118:
088D  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0891  8B 02				mov		eax,dword ptr [edx]
0893  83 C0 04				add		eax,0x00000004
0896  89 02				mov		dword ptr [edx],eax
0898  8A 5E 14				mov		bl,byte ptr 0x14[esi]
089B  8B 68 FC				mov		ebp,dword ptr -0x4[eax]
089E  F6 C3 80				test		bl,0x80
08A1  74 29				je		L$119
08A3  83 C0 04				add		eax,0x00000004
08A6  89 02				mov		dword ptr [edx],eax
08A8  BB 04 00 00 00			mov		ebx,0x00000004
08AD  8B 40 FC				mov		eax,dword ptr -0x4[eax]
08B0  89 FA				mov		edx,edi
08B2  25 FF FF 00 00			and		eax,0x0000ffff
08B7  E8 00 00 00 00			call		fmt4hex_
08BC  BB 08 00 00 00			mov		ebx,0x00000008
08C1  8D 57 05				lea		edx,0x5[edi]
08C4  89 E8				mov		eax,ebp
08C6  C6 47 04 3A			mov		byte ptr 0x4[edi],0x3a
08CA  EB 09				jmp		L$120
08CC				L$119:
08CC  BB 08 00 00 00			mov		ebx,0x00000008
08D1  89 E8				mov		eax,ebp
08D3  89 FA				mov		edx,edi
08D5				L$120:
08D5  E8 00 00 00 00			call		fmt4hex_
08DA  80 7E 15 50			cmp		byte ptr 0x15[esi],0x50
08DE  0F 85 52 FE FF FF			jne		L$96
08E4  89 F8				mov		eax,edi
08E6  E8 00 00 00 00			call		zupstr_
08EB  E9 46 FE FF FF			jmp		L$96
08F0				L$121:
08F0  8B 1A				mov		ebx,dword ptr [edx]
08F2  83 C3 04				add		ebx,0x00000004
08F5  89 1A				mov		dword ptr [edx],ebx
08F7  8A 43 FC				mov		al,byte ptr -0x4[ebx]
08FA  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
08FE  88 07				mov		byte ptr [edi],al
0900  C7 46 08 01 00 00 00		mov		dword ptr 0x8[esi],0x00000001
0907  B8 01 00 00 00			mov		eax,0x00000001
090C  8A 76 14				mov		dh,byte ptr 0x14[esi]
090F  31 FF				xor		edi,edi
0911  80 E6 F9				and		dh,0xf9
0914  89 7C 24 04			mov		dword ptr 0x4[esp],edi
0918  88 76 14				mov		byte ptr 0x14[esi],dh
091B  EB 2A				jmp		L$123
091D				L$122:
091D  C7 46 04 00 00 00 00		mov		dword ptr 0x4[esi],0x00000000
0924  8A 46 15				mov		al,byte ptr 0x15[esi]
0927  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
092B  88 07				mov		byte ptr [edi],al
092D  C7 46 08 01 00 00 00		mov		dword ptr 0x8[esi],0x00000001
0934  8A 46 14				mov		al,byte ptr 0x14[esi]
0937  31 FF				xor		edi,edi
0939  24 F9				and		al,0xf9
093B  89 7C 24 04			mov		dword ptr 0x4[esp],edi
093F  88 46 14				mov		byte ptr 0x14[esi],al
0942  B8 01 00 00 00			mov		eax,0x00000001
0947				L$123:
0947  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
094C  74 3F				je		L$129
094E  26 8A 11				mov		dl,byte ptr es:[ecx]
0951  80 FA 2D				cmp		dl,0x2d
0954  75 0B				jne		L$124
0956  41				inc		ecx
0957  C6 46 18 00			mov		byte ptr 0x18[esi],0x00
095B  48				dec		eax
095C  88 56 17				mov		byte ptr 0x17[esi],dl
095F  EB 1B				jmp		L$127
0961				L$124:
0961  8A 76 14				mov		dh,byte ptr 0x14[esi]
0964  F6 C6 02				test		dh,0x02
0967  74 06				je		L$125
0969  C6 46 17 20			mov		byte ptr 0x17[esi],0x20
096D  EB 09				jmp		L$126
096F				L$125:
096F  F6 C6 04				test		dh,0x04
0972  74 08				je		L$127
0974  C6 46 17 2B			mov		byte ptr 0x17[esi],0x2b
0978				L$126:
0978  C6 46 18 00			mov		byte ptr 0x18[esi],0x00
097C				L$127:
097C  8B 56 08				mov		edx,dword ptr 0x8[esi]
097F  39 D0				cmp		eax,edx
0981  7E 05				jle		L$128
0983  89 46 08				mov		dword ptr 0x8[esi],eax
0986  EB 05				jmp		L$129
0988				L$128:
0988  29 C2				sub		edx,eax
098A  89 56 0C				mov		dword ptr 0xc[esi],edx
098D				L$129:
098D  80 7E 16 2A			cmp		byte ptr 0x16[esi],0x2a
0991  75 0D				jne		L$130
0993  8A 56 14				mov		dl,byte ptr 0x14[esi]
0996  C6 46 17 00			mov		byte ptr 0x17[esi],0x00
099A  80 E2 F9				and		dl,0xf9
099D  88 56 14				mov		byte ptr 0x14[esi],dl
09A0				L$130:
09A0  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
09A3  83 FB FF				cmp		ebx,0xffffffff
09A6  74 04				je		L$131
09A8  39 D8				cmp		eax,ebx
09AA  7D 09				jge		L$132
09AC				L$131:
09AC  80 7E 15 63			cmp		byte ptr 0x15[esi],0x63
09B0  74 03				je		L$132
09B2  89 46 08				mov		dword ptr 0x8[esi],eax
09B5				L$132:
09B5  BB FF FF FF FF			mov		ebx,0xffffffff
09BA  8D 46 17				lea		eax,0x17[esi]
09BD  8C DA				mov		edx,ds
09BF  E8 00 00 00 00			call		far_strlen_
09C4  8B 6E 08				mov		ebp,dword ptr 0x8[esi]
09C7  8B 56 0C				mov		edx,dword ptr 0xc[esi]
09CA  01 E8				add		eax,ebp
09CC  8B 5E 04				mov		ebx,dword ptr 0x4[esi]
09CF  01 D0				add		eax,edx
09D1  8C C2				mov		edx,es
09D3  29 C3				sub		ebx,eax
09D5  89 C8				mov		eax,ecx
09D7  89 5E 04				mov		dword ptr 0x4[esi],ebx
09DA  83 C4 08				add		esp,0x00000008
09DD  5D				pop		ebp
09DE  07				pop		es
09DF  5F				pop		edi
09E0  5E				pop		esi
09E1  C3				ret		
09E2				zupstr_:
09E2  52				push		edx
09E3  89 C2				mov		edx,eax
09E5				L$133:
09E5  80 3A 00				cmp		byte ptr [edx],0x00
09E8  74 0E				je		L$134
09EA  31 C0				xor		eax,eax
09EC  8A 02				mov		al,byte ptr [edx]
09EE  E8 00 00 00 00			call		toupper_
09F3  88 02				mov		byte ptr [edx],al
09F5  42				inc		edx
09F6  EB ED				jmp		L$133
09F8				L$134:
09F8  5A				pop		edx
09F9  C3				ret		

Routine Size: 2554 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

