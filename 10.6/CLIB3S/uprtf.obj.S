Module: uprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000B38 bytes
0000				__uprtf:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  C8 28 02 00			enter		0x0228,0x00
0008  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
000B  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
0012  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0015  C6 45 EC 00			mov		byte ptr -0x14[ebp],0x00
0019  C7 45 E8 00 00 00 00		mov		dword ptr -0x18[ebp],0x00000000
0020  8B 7D 1C				mov		edi,dword ptr 0x1c[ebp]
0023  89 45 D8				mov		dword ptr -0x28[ebp],eax
0026  E9 70 00 00 00			jmp		L$6
002B				L$1:
002B  8D 45 D8				lea		eax,-0x28[ebp]
002E  50				push		eax
002F  53				push		ebx
0030  56				push		esi
0031  E8 00 00 00 00			call		getprintspecs
0036  89 C7				mov		edi,eax
0038  83 C4 0C				add		esp,0x0000000c
003B  66 8B 00				mov		ax,word ptr [eax]
003E  47				inc		edi
003F  47				inc		edi
0040  66 89 45 ED			mov		word ptr -0x13[ebp],ax
0044  66 85 C0				test		ax,ax
0047  0F 84 36 02 00 00			je		L$27
004D  0F B7 C0				movzx		eax,ax
0050  83 F8 6E				cmp		eax,0x0000006e
0053  0F 85 CF 00 00 00			jne		L$13
0059  8A 45 EC				mov		al,byte ptr -0x14[ebp]
005C  24 20				and		al,0x20
005E  0F B6 F0				movzx		esi,al
0061  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0064  24 40				and		al,0x40
0066  8A 65 EC				mov		ah,byte ptr -0x14[ebp]
0069  80 E4 80				and		ah,0x80
006C  85 F6				test		esi,esi
006E  74 5D				je		L$8
0070  0F B6 F4				movzx		esi,ah
0073  85 F6				test		esi,esi
0075  74 10				je		L$3
0077				L$2:
0077  83 03 08				add		dword ptr [ebx],0x00000008
007A  8B 03				mov		eax,dword ptr [ebx]
007C  C4 70 F8				les		esi,fword ptr -0x8[eax]
007F  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0082  26 89 06				mov		dword ptr es:[esi],eax
0085  EB 14				jmp		L$6
0087				L$3:
0087  0F B6 C0				movzx		eax,al
008A  85 C0				test		eax,eax
008C  74 35				je		L$7
008E				L$4:
008E  83 03 04				add		dword ptr [ebx],0x00000004
0091  8B 03				mov		eax,dword ptr [ebx]
0093  8B 70 FC				mov		esi,dword ptr -0x4[eax]
0096				L$5:
0096  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0099  89 06				mov		dword ptr [esi],eax
009B				L$6:
009B  66 83 3F 00			cmp		word ptr [edi],0x0000
009F  0F 84 DE 01 00 00			je		L$27
00A5  0F B7 07				movzx		eax,word ptr [edi]
00A8  8D 77 02				lea		esi,0x2[edi]
00AB  83 F8 25				cmp		eax,0x00000025
00AE  0F 84 77 FF FF FF			je		L$1
00B4  50				push		eax
00B5  8D 45 D8				lea		eax,-0x28[ebp]
00B8  50				push		eax
00B9  89 F7				mov		edi,esi
00BB  FF 55 24				call		dword ptr 0x24[ebp]
00BE  83 C4 08				add		esp,0x00000008
00C1  EB D8				jmp		L$6
00C3				L$7:
00C3  83 03 04				add		dword ptr [ebx],0x00000004
00C6  8B 33				mov		esi,dword ptr [ebx]
00C8  8B 76 FC				mov		esi,dword ptr -0x4[esi]
00CB  EB C9				jmp		L$5
00CD				L$8:
00CD  8A 55 EC				mov		dl,byte ptr -0x14[ebp]
00D0  80 E2 10				and		dl,0x10
00D3  0F B6 F2				movzx		esi,dl
00D6  85 F6				test		esi,esi
00D8  74 39				je		L$12
00DA  0F B6 F4				movzx		esi,ah
00DD  85 F6				test		esi,esi
00DF  74 11				je		L$9
00E1  83 03 08				add		dword ptr [ebx],0x00000008
00E4  8B 03				mov		eax,dword ptr [ebx]
00E6  C4 70 F8				les		esi,fword ptr -0x8[eax]
00E9  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
00EC  66 26 89 06			mov		word ptr es:[esi],ax
00F0  EB A9				jmp		L$6
00F2				L$9:
00F2  0F B6 C0				movzx		eax,al
00F5  85 C0				test		eax,eax
00F7  74 10				je		L$11
00F9  83 03 04				add		dword ptr [ebx],0x00000004
00FC  8B 33				mov		esi,dword ptr [ebx]
00FE  8B 76 FC				mov		esi,dword ptr -0x4[esi]
0101				L$10:
0101  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0104  66 89 06				mov		word ptr [esi],ax
0107  EB 92				jmp		L$6
0109				L$11:
0109  83 03 04				add		dword ptr [ebx],0x00000004
010C  8B 03				mov		eax,dword ptr [ebx]
010E  8B 70 FC				mov		esi,dword ptr -0x4[eax]
0111  EB EE				jmp		L$10
0113				L$12:
0113  0F B6 F4				movzx		esi,ah
0116  85 F6				test		esi,esi
0118  0F 85 59 FF FF FF			jne		L$2
011E  0F B6 C0				movzx		eax,al
0121  85 C0				test		eax,eax
0123  E9 66 FF FF FF			jmp		L$4
0128				L$13:
0128  8D 45 FC				lea		eax,-0x4[ebp]
012B  50				push		eax
012C  8D 45 D8				lea		eax,-0x28[ebp]
012F  50				push		eax
0130  53				push		ebx
0131  8D 85 D8 FD FF FF			lea		eax,-0x228[ebp]
0137  50				push		eax
0138  E8 00 00 00 00			call		formstring
013D  89 C6				mov		esi,eax
013F  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0142  24 08				and		al,0x08
0144  8E C2				mov		es,edx
0146  0F B6 C0				movzx		eax,al
0149  83 C4 10				add		esp,0x00000010
014C  85 C0				test		eax,eax
014E  75 23				jne		L$15
0150  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
0154  83 F8 20				cmp		eax,0x00000020
0157  75 1A				jne		L$15
0159				L$14:
0159  FF 4D DC				dec		dword ptr -0x24[ebp]
015C  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0160  7C 11				jl		L$15
0162  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
0166  50				push		eax
0167  8D 45 D8				lea		eax,-0x28[ebp]
016A  50				push		eax
016B  FF 55 24				call		dword ptr 0x24[ebp]
016E  83 C4 08				add		esp,0x00000008
0171  EB E6				jmp		L$14
0173				L$15:
0173  8D 45 F1				lea		eax,-0xf[ebp]
0176  89 45 F8				mov		dword ptr -0x8[ebp],eax
0179				L$16:
0179  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
017C  66 83 38 00			cmp		word ptr [eax],0x0000
0180  74 14				je		L$17
0182  0F B7 00				movzx		eax,word ptr [eax]
0185  50				push		eax
0186  8D 45 D8				lea		eax,-0x28[ebp]
0189  50				push		eax
018A  83 45 F8 02			add		dword ptr -0x8[ebp],0x00000002
018E  FF 55 24				call		dword ptr 0x24[ebp]
0191  83 C4 08				add		esp,0x00000008
0194  EB E3				jmp		L$16
0196				L$17:
0196  8B 45 E4				mov		eax,dword ptr -0x1c[ebp]
0199  FF 4D E4				dec		dword ptr -0x1c[ebp]
019C  85 C0				test		eax,eax
019E  74 0E				je		L$18
01A0  6A 30				push		0x00000030
01A2  8D 45 D8				lea		eax,-0x28[ebp]
01A5  50				push		eax
01A6  FF 55 24				call		dword ptr 0x24[ebp]
01A9  83 C4 08				add		esp,0x00000008
01AC  EB E8				jmp		L$17
01AE				L$18:
01AE  8A 45 EC				mov		al,byte ptr -0x14[ebp]
01B1  24 08				and		al,0x08
01B3  0F B6 C0				movzx		eax,al
01B6  85 C0				test		eax,eax
01B8  75 23				jne		L$20
01BA  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
01BE  83 F8 20				cmp		eax,0x00000020
01C1  74 1A				je		L$20
01C3				L$19:
01C3  FF 4D DC				dec		dword ptr -0x24[ebp]
01C6  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
01CA  7C 11				jl		L$20
01CC  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
01D0  50				push		eax
01D1  8D 45 D8				lea		eax,-0x28[ebp]
01D4  50				push		eax
01D5  FF 55 24				call		dword ptr 0x24[ebp]
01D8  83 C4 08				add		esp,0x00000008
01DB  EB E6				jmp		L$19
01DD				L$20:
01DD  0F B7 45 ED			movzx		eax,word ptr -0x13[ebp]
01E1  83 F8 73				cmp		eax,0x00000073
01E4  74 05				je		L$21
01E6  83 F8 53				cmp		eax,0x00000053
01E9  75 45				jne		L$24
01EB				L$21:
01EB  8A 45 EC				mov		al,byte ptr -0x14[ebp]
01EE  24 10				and		al,0x10
01F0  0F B6 C0				movzx		eax,al
01F3  85 C0				test		eax,eax
01F5  74 1C				je		L$23
01F7				L$22:
01F7  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
01FA  FF 4D E0				dec		dword ptr -0x20[ebp]
01FD  85 C0				test		eax,eax
01FF  74 4C				je		L$25
0201  26 0F B6 06			movzx		eax,byte ptr es:[esi]
0205  50				push		eax
0206  8D 45 D8				lea		eax,-0x28[ebp]
0209  50				push		eax
020A  46				inc		esi
020B  FF 55 24				call		dword ptr 0x24[ebp]
020E  83 C4 08				add		esp,0x00000008
0211  EB E4				jmp		L$22
0213				L$23:
0213  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
0216  FF 4D E0				dec		dword ptr -0x20[ebp]
0219  85 C0				test		eax,eax
021B  74 30				je		L$25
021D  26 0F B7 06			movzx		eax,word ptr es:[esi]
0221  50				push		eax
0222  8D 45 D8				lea		eax,-0x28[ebp]
0225  50				push		eax
0226  46				inc		esi
0227  46				inc		esi
0228  FF 55 24				call		dword ptr 0x24[ebp]
022B  83 C4 08				add		esp,0x00000008
022E  EB E3				jmp		L$23
0230				L$24:
0230  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
0233  FF 4D E0				dec		dword ptr -0x20[ebp]
0236  85 C0				test		eax,eax
0238  74 13				je		L$25
023A  26 0F B7 06			movzx		eax,word ptr es:[esi]
023E  50				push		eax
023F  8D 45 D8				lea		eax,-0x28[ebp]
0242  50				push		eax
0243  46				inc		esi
0244  46				inc		esi
0245  FF 55 24				call		dword ptr 0x24[ebp]
0248  83 C4 08				add		esp,0x00000008
024B  EB E3				jmp		L$24
024D				L$25:
024D  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0250  24 08				and		al,0x08
0252  0F B6 C0				movzx		eax,al
0255  85 C0				test		eax,eax
0257  0F 84 3E FE FF FF			je		L$6
025D  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0261  0F 8E 34 FE FF FF			jle		L$6
0267				L$26:
0267  8B 45 DC				mov		eax,dword ptr -0x24[ebp]
026A  FF 4D DC				dec		dword ptr -0x24[ebp]
026D  85 C0				test		eax,eax
026F  0F 84 26 FE FF FF			je		L$6
0275  6A 20				push		0x00000020
0277  8D 45 D8				lea		eax,-0x28[ebp]
027A  50				push		eax
027B  FF 55 24				call		dword ptr 0x24[ebp]
027E  83 C4 08				add		esp,0x00000008
0281  EB E4				jmp		L$26
0283				L$27:
0283  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0286				L$28:
0286  C9				leave		
0287  07				pop		es
0288  5F				pop		edi
0289  5E				pop		esi
028A  5B				pop		ebx
028B  C3				ret		
028C				getprintspecs:
028C  53				push		ebx
028D  56				push		esi
028E  55				push		ebp
028F  89 E5				mov		ebp,esp
0291  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0294  8B 75 14				mov		esi,dword ptr 0x14[ebp]
0297  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
029A  53				push		ebx
029B  66 C7 43 19 00 00			mov		word ptr 0x19[ebx],0x0000
02A1  50				push		eax
02A2  66 C7 43 17 20 00			mov		word ptr 0x17[ebx],0x0020
02A8  E8 00 00 00 00			call		evalflags
02AD  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
02B4  0F B7 10				movzx		edx,word ptr [eax]
02B7  83 C4 08				add		esp,0x00000008
02BA  83 FA 30				cmp		edx,0x00000030
02BD  7C 25				jl		L$30
02BF  83 FA 39				cmp		edx,0x00000039
02C2  7F 20				jg		L$30
02C4				L$29:
02C4  6B 53 04 0A			imul		edx,dword ptr 0x4[ebx],0x0000000a
02C8  0F B7 08				movzx		ecx,word ptr [eax]
02CB  83 E9 30				sub		ecx,0x00000030
02CE  01 CA				add		edx,ecx
02D0  40				inc		eax
02D1  40				inc		eax
02D2  89 53 04				mov		dword ptr 0x4[ebx],edx
02D5  0F B7 10				movzx		edx,word ptr [eax]
02D8  83 FA 30				cmp		edx,0x00000030
02DB  7C 27				jl		L$32
02DD  83 FA 39				cmp		edx,0x00000039
02E0  7E E2				jle		L$29
02E2  EB 20				jmp		L$32
02E4				L$30:
02E4  0F B7 10				movzx		edx,word ptr [eax]
02E7  83 FA 2A				cmp		edx,0x0000002a
02EA  75 18				jne		L$32
02EC  83 06 04				add		dword ptr [esi],0x00000004
02EF  8B 16				mov		edx,dword ptr [esi]
02F1  8B 52 FC				mov		edx,dword ptr -0x4[edx]
02F4  89 53 04				mov		dword ptr 0x4[ebx],edx
02F7  85 D2				test		edx,edx
02F9  7D 07				jge		L$31
02FB  F7 5B 04				neg		dword ptr 0x4[ebx]
02FE  80 4B 14 08			or		byte ptr 0x14[ebx],0x08
0302				L$31:
0302  40				inc		eax
0303  40				inc		eax
0304				L$32:
0304  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
030B  0F B7 10				movzx		edx,word ptr [eax]
030E  83 FA 2E				cmp		edx,0x0000002e
0311  75 48				jne		L$35
0313  40				inc		eax
0314  40				inc		eax
0315  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
031C  0F B7 10				movzx		edx,word ptr [eax]
031F  83 FA 2A				cmp		edx,0x0000002a
0322  75 1A				jne		L$34
0324  83 06 04				add		dword ptr [esi],0x00000004
0327  8B 16				mov		edx,dword ptr [esi]
0329  8B 52 FC				mov		edx,dword ptr -0x4[edx]
032C  89 53 08				mov		dword ptr 0x8[ebx],edx
032F  85 D2				test		edx,edx
0331  7D 07				jge		L$33
0333  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
033A				L$33:
033A  40				inc		eax
033B  40				inc		eax
033C  EB 1D				jmp		L$35
033E				L$34:
033E  0F B7 10				movzx		edx,word ptr [eax]
0341  83 FA 30				cmp		edx,0x00000030
0344  7C 15				jl		L$35
0346  83 FA 39				cmp		edx,0x00000039
0349  7F 10				jg		L$35
034B  6B 73 08 0A			imul		esi,dword ptr 0x8[ebx],0x0000000a
034F  83 EA 30				sub		edx,0x00000030
0352  01 D6				add		esi,edx
0354  40				inc		eax
0355  40				inc		eax
0356  89 73 08				mov		dword ptr 0x8[ebx],esi
0359  EB E3				jmp		L$34
035B				L$35:
035B  66 8B 30				mov		si,word ptr [eax]
035E  8D 50 02				lea		edx,0x2[eax]
0361  66 83 FE 4E			cmp		si,0x004e
0365  72 1E				jb		L$37
0367  76 4C				jbe		L$41
0369  66 83 FE 6C			cmp		si,0x006c
036D  72 0C				jb		L$36
036F  76 26				jbe		L$38
0371  66 83 FE 77			cmp		si,0x0077
0375  74 20				je		L$38
0377  5D				pop		ebp
0378  5E				pop		esi
0379  5B				pop		ebx
037A  C3				ret		
037B				L$36:
037B  66 83 FE 68			cmp		si,0x0068
037F  74 20				je		L$39
0381  5D				pop		ebp
0382  5E				pop		esi
0383  5B				pop		ebx
0384  C3				ret		
0385				L$37:
0385  66 83 FE 46			cmp		si,0x0046
0389  72 30				jb		L$42
038B  76 1E				jbe		L$40
038D  66 83 FE 4C			cmp		si,0x004c
0391  74 22				je		L$41
0393  5D				pop		ebp
0394  5E				pop		esi
0395  5B				pop		ebx
0396  C3				ret		
0397				L$38:
0397  40				inc		eax
0398  40				inc		eax
0399  80 4B 14 20			or		byte ptr 0x14[ebx],0x20
039D  5D				pop		ebp
039E  5E				pop		esi
039F  5B				pop		ebx
03A0  C3				ret		
03A1				L$39:
03A1  89 D0				mov		eax,edx
03A3  80 4B 14 10			or		byte ptr 0x14[ebx],0x10
03A7  5D				pop		ebp
03A8  5E				pop		esi
03A9  5B				pop		ebx
03AA  C3				ret		
03AB				L$40:
03AB  89 D0				mov		eax,edx
03AD  80 4B 14 80			or		byte ptr 0x14[ebx],0x80
03B1  5D				pop		ebp
03B2  5E				pop		esi
03B3  5B				pop		ebx
03B4  C3				ret		
03B5				L$41:
03B5  89 D0				mov		eax,edx
03B7  80 4B 14 40			or		byte ptr 0x14[ebx],0x40
03BB				L$42:
03BB  5D				pop		ebp
03BC  5E				pop		esi
03BD  5B				pop		ebx
03BE  C3				ret		
03BF				evalflags:
03BF  53				push		ebx
03C0  55				push		ebp
03C1  89 E5				mov		ebp,esp
03C3  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
03C6  8B 45 10				mov		eax,dword ptr 0x10[ebp]
03C9  C6 40 14 00			mov		byte ptr 0x14[eax],0x00
03CD				L$43:
03CD  0F B7 13				movzx		edx,word ptr [ebx]
03D0  83 FA 2D				cmp		edx,0x0000002d
03D3  75 06				jne		L$44
03D5  80 48 14 08			or		byte ptr 0x14[eax],0x08
03D9  EB 3D				jmp		L$48
03DB				L$44:
03DB  83 FA 23				cmp		edx,0x00000023
03DE  75 06				jne		L$45
03E0  80 48 14 01			or		byte ptr 0x14[eax],0x01
03E4  EB 32				jmp		L$48
03E6				L$45:
03E6  83 FA 2B				cmp		edx,0x0000002b
03E9  75 0A				jne		L$46
03EB  80 48 14 04			or		byte ptr 0x14[eax],0x04
03EF  80 60 14 FD			and		byte ptr 0x14[eax],0xfd
03F3  EB 23				jmp		L$48
03F5				L$46:
03F5  83 FA 20				cmp		edx,0x00000020
03F8  75 13				jne		L$47
03FA  8A 50 14				mov		dl,byte ptr 0x14[eax]
03FD  80 E2 04				and		dl,0x04
0400  0F B6 D2				movzx		edx,dl
0403  85 D2				test		edx,edx
0405  75 11				jne		L$48
0407  80 48 14 02			or		byte ptr 0x14[eax],0x02
040B  EB 0B				jmp		L$48
040D				L$47:
040D  83 FA 30				cmp		edx,0x00000030
0410  75 0A				jne		L$49
0412  66 C7 40 17 30 00			mov		word ptr 0x17[eax],0x0030
0418				L$48:
0418  43				inc		ebx
0419  43				inc		ebx
041A  EB B1				jmp		L$43
041C				L$49:
041C  89 D8				mov		eax,ebx
041E				L$50:
041E  5D				pop		ebp
041F  5B				pop		ebx
0420  C3				ret		
0421				far_strlen:
0421  06				push		es
0422  55				push		ebp
0423  89 E5				mov		ebp,esp
0425  8E 45 10				mov		es,dword ptr 0x10[ebp]
0428  31 C0				xor		eax,eax
042A				L$51:
042A  8B 55 0C				mov		edx,dword ptr 0xc[ebp]
042D  83 45 0C 02			add		dword ptr 0xc[ebp],0x00000002
0431  66 26 83 3A 00			cmp		word ptr es:[edx],0x0000
0436  74 08				je		L$52
0438  3B 45 14				cmp		eax,dword ptr 0x14[ebp]
043B  74 03				je		L$52
043D  40				inc		eax
043E  EB EA				jmp		L$51
0440				L$52:
0440  5D				pop		ebp
0441  07				pop		es
0442  C3				ret		
0443				far_other_strlen:
0443  53				push		ebx
0444  56				push		esi
0445  06				push		es
0446  55				push		ebp
0447  89 E5				mov		ebp,esp
0449  8B 75 18				mov		esi,dword ptr 0x18[ebp]
044C  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
044F  31 C0				xor		eax,eax
0451  8E C6				mov		es,esi
0453				L$53:
0453  89 DA				mov		edx,ebx
0455  43				inc		ebx
0456  26 80 3A 00			cmp		byte ptr es:[edx],0x00
045A  74 08				je		L$54
045C  3B 45 1C				cmp		eax,dword ptr 0x1c[ebp]
045F  74 03				je		L$54
0461  40				inc		eax
0462  EB EF				jmp		L$53
0464				L$54:
0464  5D				pop		ebp
0465  07				pop		es
0466  5E				pop		esi
0467  5B				pop		ebx
0468  C3				ret		
0469				fmt4hex:
0469  53				push		ebx
046A  56				push		esi
046B  57				push		edi
046C  55				push		ebp
046D  89 E5				mov		ebp,esp
046F  8B 75 18				mov		esi,dword ptr 0x18[ebp]
0472  6A 10				push		0x00000010
0474  56				push		esi
0475  FF 75 14				push		dword ptr 0x14[ebp]
0478  E8 00 00 00 00			call		_uitoa
047D  83 C4 0C				add		esp,0x0000000c
0480  56				push		esi
0481  E8 00 00 00 00			call		_ustrlen
0486  89 C2				mov		edx,eax
0488  83 C4 04				add		esp,0x00000004
048B  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
048E  89 F1				mov		ecx,esi
0490  48				dec		eax
0491  01 D2				add		edx,edx
0493  8D 1C 00				lea		ebx,[eax+eax]
0496  01 F2				add		edx,esi
0498  01 F3				add		ebx,esi
049A  EB 0B				jmp		L$56
049C				L$55:
049C  4A				dec		edx
049D  4A				dec		edx
049E  66 8B 3A				mov		di,word ptr [edx]
04A1  48				dec		eax
04A2  66 89 3B				mov		word ptr [ebx],di
04A5  4B				dec		ebx
04A6  4B				dec		ebx
04A7				L$56:
04A7  39 CA				cmp		edx,ecx
04A9  75 F1				jne		L$55
04AB  8D 14 00				lea		edx,[eax+eax]
04AE  01 F2				add		edx,esi
04B0				L$57:
04B0  85 C0				test		eax,eax
04B2  7C 0A				jl		L$58
04B4  48				dec		eax
04B5  66 C7 02 30 00			mov		word ptr [edx],0x0030
04BA  4A				dec		edx
04BB  4A				dec		edx
04BC  EB F2				jmp		L$57
04BE				L$58:
04BE  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
04C1  66 C7 04 46 00 00			mov		word ptr [esi+eax*2],0x0000
04C7  5D				pop		ebp
04C8  5F				pop		edi
04C9  5E				pop		esi
04CA  5B				pop		ebx
04CB  C3				ret		
04CC				FixedPoint_Format:
04CC  53				push		ebx
04CD  56				push		esi
04CE  C8 04 00 00			enter		0x0004,0x00
04D2  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
04D5  8B 75 18				mov		esi,dword ptr 0x18[ebp]
04D8  8B 45 14				mov		eax,dword ptr 0x14[ebp]
04DB  89 45 FC				mov		dword ptr -0x4[ebp],eax
04DE  85 C0				test		eax,eax
04E0  7D 0A				jge		L$59
04E2  F7 5D FC				neg		dword ptr -0x4[ebp]
04E5  66 C7 03 2D 00			mov		word ptr [ebx],0x002d
04EA  43				inc		ebx
04EB  43				inc		ebx
04EC				L$59:
04EC  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
04F0  75 07				jne		L$60
04F2  C7 46 08 04 00 00 00		mov		dword ptr 0x8[esi],0x00000004
04F9				L$60:
04F9  6A 0A				push		0x0000000a
04FB  53				push		ebx
04FC  0F B7 45 FE			movzx		eax,word ptr -0x2[ebp]
0500  50				push		eax
0501  E8 00 00 00 00			call		_uitoa
0506  83 C4 0C				add		esp,0x0000000c
0509  89 D9				mov		ecx,ebx
050B				L$61:
050B  8D 53 02				lea		edx,0x2[ebx]
050E  66 83 3B 00			cmp		word ptr [ebx],0x0000
0512  74 04				je		L$62
0514  89 D3				mov		ebx,edx
0516  EB F3				jmp		L$61
0518				L$62:
0518  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
051C  74 30				je		L$65
051E  66 C7 03 2E 00			mov		word ptr [ebx],0x002e
0523  31 C0				xor		eax,eax
0525  89 D3				mov		ebx,edx
0527  EB 1B				jmp		L$64
0529				L$63:
0529  66 C7 45 FE 00 00			mov		word ptr -0x2[ebp],0x0000
052F  6B 55 FC 0A			imul		edx,dword ptr -0x4[ebp],0x0000000a
0533  89 55 FC				mov		dword ptr -0x4[ebp],edx
0536  66 0F B6 55 FE			movzx		dx,byte ptr -0x2[ebp]
053B  83 C2 30				add		edx,0x00000030
053E  40				inc		eax
053F  66 89 13				mov		word ptr [ebx],dx
0542  43				inc		ebx
0543  43				inc		ebx
0544				L$64:
0544  3B 46 08				cmp		eax,dword ptr 0x8[esi]
0547  7C E0				jl		L$63
0549  66 C7 03 00 00			mov		word ptr [ebx],0x0000
054E				L$65:
054E  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0551  30 C0				xor		al,al
0553  80 E4 80				and		ah,0x80
0556  0F B7 C0				movzx		eax,ax
0559  85 C0				test		eax,eax
055B  0F 84 6B 00 00 00			je		L$74
0561				L$66:
0561  39 CB				cmp		ebx,ecx
0563  75 45				jne		L$71
0565  8D 59 02				lea		ebx,0x2[ecx]
0568  66 C7 01 31 00			mov		word ptr [ecx],0x0031
056D				L$67:
056D  0F B7 03				movzx		eax,word ptr [ebx]
0570  8D 73 02				lea		esi,0x2[ebx]
0573  83 F8 30				cmp		eax,0x00000030
0576  75 04				jne		L$68
0578  89 F3				mov		ebx,esi
057A  EB F1				jmp		L$67
057C				L$68:
057C  83 F8 2E				cmp		eax,0x0000002e
057F  75 19				jne		L$70
0581  66 C7 03 30 00			mov		word ptr [ebx],0x0030
0586  8D 5E 02				lea		ebx,0x2[esi]
0589  66 C7 06 2E 00			mov		word ptr [esi],0x002e
058E				L$69:
058E  0F B7 03				movzx		eax,word ptr [ebx]
0591  83 F8 30				cmp		eax,0x00000030
0594  75 04				jne		L$70
0596  43				inc		ebx
0597  43				inc		ebx
0598  EB F4				jmp		L$69
059A				L$70:
059A  66 C7 03 30 00			mov		word ptr [ebx],0x0030
059F  43				inc		ebx
05A0  43				inc		ebx
05A1  66 C7 03 00 00			mov		word ptr [ebx],0x0000
05A6  C9				leave		
05A7  5E				pop		esi
05A8  5B				pop		ebx
05A9  C3				ret		
05AA				L$71:
05AA  4B				dec		ebx
05AB  4B				dec		ebx
05AC  0F B7 03				movzx		eax,word ptr [ebx]
05AF  83 F8 2E				cmp		eax,0x0000002e
05B2  75 02				jne		L$72
05B4  4B				dec		ebx
05B5  4B				dec		ebx
05B6				L$72:
05B6  0F B7 03				movzx		eax,word ptr [ebx]
05B9  83 F8 39				cmp		eax,0x00000039
05BC  74 07				je		L$73
05BE  66 FF 03				inc		word ptr [ebx]
05C1  C9				leave		
05C2  5E				pop		esi
05C3  5B				pop		ebx
05C4  C3				ret		
05C5				L$73:
05C5  66 C7 03 30 00			mov		word ptr [ebx],0x0030
05CA  EB 95				jmp		L$66
05CC				L$74:
05CC  C9				leave		
05CD  5E				pop		esi
05CE  5B				pop		ebx
05CF  C3				ret		
05D0				float_format:
05D0  53				push		ebx
05D1  56				push		esi
05D2  57				push		edi
05D3  06				push		es
05D4  55				push		ebp
05D5  89 E5				mov		ebp,esp
05D7  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
05DA  FF 75 20				push		dword ptr 0x20[ebp]
05DD  FF 75 1C				push		dword ptr 0x1c[ebp]
05E0  53				push		ebx
05E1  8C DF				mov		edi,ds
05E3  FF 15 00 00 00 00			call		dword ptr __EFG_printf
05E9  83 C4 0C				add		esp,0x0000000c
05EC  89 D6				mov		esi,edx
05EE  89 C1				mov		ecx,eax
05F0  8D 83 00 01 00 00			lea		eax,0x100[ebx]
05F6  8E C7				mov		es,edi
05F8  81 C3 00 02 00 00			add		ebx,0x00000200
05FE				L$75:
05FE  48				dec		eax
05FF  4B				dec		ebx
0600  4B				dec		ebx
0601  66 26 0F B6 10			movzx		dx,byte ptr es:[eax]
0606  66 89 13				mov		word ptr [ebx],dx
0609  39 C8				cmp		eax,ecx
060B  75 F1				jne		L$75
060D  66 39 F7				cmp		di,si
0610  75 EC				jne		L$75
0612  8C DA				mov		edx,ds
0614  89 D8				mov		eax,ebx
0616  5D				pop		ebp
0617  07				pop		es
0618  5F				pop		edi
0619  5E				pop		esi
061A  5B				pop		ebx
061B  C3				ret		
061C				formstring:
061C  53				push		ebx
061D  56				push		esi
061E  57				push		edi
061F  06				push		es
0620  C8 10 00 00			enter		0x0010,0x00
0624  8B 75 18				mov		esi,dword ptr 0x18[ebp]
0627  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
062A  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
062D  C7 45 F4 01 00 00 00		mov		dword ptr -0xc[ebp],0x00000001
0634  8C 5D FC				mov		dword ptr -0x4[ebp],ds
0637  89 F7				mov		edi,esi
0639  66 8B 53 15			mov		dx,word ptr 0x15[ebx]
063D  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0644  66 83 FA 69			cmp		dx,0x0069
0648  72 1F				jb		L$78
064A  0F 86 67 00 00 00			jbe		L$83
0650  66 83 FA 75			cmp		dx,0x0075
0654  72 0D				jb		L$77
0656  76 21				jbe		L$79
0658  66 83 FA 78			cmp		dx,0x0078
065C				L$76:
065C  74 1B				je		L$79
065E  E9 60 00 00 00			jmp		L$84
0663				L$77:
0663  66 83 FA 6F			cmp		dx,0x006f
0667  EB F3				jmp		L$76
0669				L$78:
0669  66 83 FA 58			cmp		dx,0x0058
066D  72 54				jb		L$84
066F  76 08				jbe		L$79
0671  66 83 FA 64			cmp		dx,0x0064
0675  74 40				je		L$83
0677  EB 4A				jmp		L$84
0679				L$79:
0679  8A 53 14				mov		dl,byte ptr 0x14[ebx]
067C  80 E2 20				and		dl,0x20
067F  0F B6 D2				movzx		edx,dl
0682  85 D2				test		edx,edx
0684  74 0A				je		L$80
0686  83 00 04				add		dword ptr [eax],0x00000004
0689  8B 10				mov		edx,dword ptr [eax]
068B  8B 52 FC				mov		edx,dword ptr -0x4[edx]
068E  EB 20				jmp		L$82
0690				L$80:
0690  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0693  80 E2 10				and		dl,0x10
0696  0F B6 D2				movzx		edx,dl
0699  85 D2				test		edx,edx
069B  74 0B				je		L$81
069D  83 00 04				add		dword ptr [eax],0x00000004
06A0  8B 10				mov		edx,dword ptr [eax]
06A2  0F B7 52 FC			movzx		edx,word ptr -0x4[edx]
06A6  EB 08				jmp		L$82
06A8				L$81:
06A8  83 00 04				add		dword ptr [eax],0x00000004
06AB  8B 10				mov		edx,dword ptr [eax]
06AD  8B 52 FC				mov		edx,dword ptr -0x4[edx]
06B0				L$82:
06B0  89 55 F0				mov		dword ptr -0x10[ebp],edx
06B3  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
06B7				L$83:
06B7  83 7B 08 FF			cmp		dword ptr 0x8[ebx],0xffffffff
06BB  74 06				je		L$84
06BD  66 C7 43 17 20 00			mov		word ptr 0x17[ebx],0x0020
06C3				L$84:
06C3  66 8B 4B 15			mov		cx,word ptr 0x15[ebx]
06C7  BA 0A 00 00 00			mov		edx,0x0000000a
06CC  66 83 F9 65			cmp		cx,0x0065
06D0  72 6B				jb		L$87
06D2  0F 86 E9 00 00 00			jbe		L$93
06D8  66 83 F9 6F			cmp		cx,0x006f
06DC  72 40				jb		L$86
06DE  0F 86 F6 00 00 00			jbe		L$94
06E4  66 83 F9 73			cmp		cx,0x0073
06E8  72 25				jb		L$85
06EA  0F 86 85 01 00 00			jbe		L$106
06F0  66 83 F9 75			cmp		cx,0x0075
06F4  0F 82 41 03 00 00			jb		L$126
06FA  0F 86 5D 02 00 00			jbe		L$118
0700  66 83 F9 78			cmp		cx,0x0078
0704  0F 84 28 02 00 00			je		L$116
070A  E9 2C 03 00 00			jmp		L$126
070F				L$85:
070F  66 83 F9 70			cmp		cx,0x0070
0713  0F 84 6C 02 00 00			je		L$119
0719  E9 1D 03 00 00			jmp		L$126
071E				L$86:
071E  66 83 F9 67			cmp		cx,0x0067
0722  0F 82 6A 00 00 00			jb		L$92
0728  0F 86 93 00 00 00			jbe		L$93
072E  66 83 F9 69			cmp		cx,0x0069
0732  0F 84 F3 00 00 00			je		L$102
0738  E9 FE 02 00 00			jmp		L$126
073D				L$87:
073D  66 83 F9 50			cmp		cx,0x0050
0741  72 36				jb		L$89
0743  0F 86 3C 02 00 00			jbe		L$119
0749  66 83 F9 58			cmp		cx,0x0058
074D  72 1B				jb		L$88
074F  0F 86 DD 01 00 00			jbe		L$116
0755  66 83 F9 63			cmp		cx,0x0063
0759  0F 82 DC 02 00 00			jb		L$126
075F  0F 86 B2 02 00 00			jbe		L$124
0765  E9 C1 00 00 00			jmp		L$102
076A				L$88:
076A  66 83 F9 53			cmp		cx,0x0053
076E  0F 84 01 01 00 00			je		L$106
0774  E9 C2 02 00 00			jmp		L$126
0779				L$89:
0779  66 83 F9 46			cmp		cx,0x0046
077D  72 0D				jb		L$91
077F  76 11				jbe		L$92
0781  66 83 F9 47			cmp		cx,0x0047
0785				L$90:
0785  74 3A				je		L$93
0787  E9 AF 02 00 00			jmp		L$126
078C				L$91:
078C  66 83 F9 45			cmp		cx,0x0045
0790  EB F3				jmp		L$90
0792				L$92:
0792  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0795  80 E2 10				and		dl,0x10
0798  0F B6 D2				movzx		edx,dl
079B  85 D2				test		edx,edx
079D  74 22				je		L$93
079F  83 00 04				add		dword ptr [eax],0x00000004
07A2  8B 00				mov		eax,dword ptr [eax]
07A4  53				push		ebx
07A5  8B 40 FC				mov		eax,dword ptr -0x4[eax]
07A8  50				push		eax
07A9  56				push		esi
07AA  E8 00 00 00 00			call		FixedPoint_Format
07AF  83 C4 0C				add		esp,0x0000000c
07B2  8C 5D FC				mov		dword ptr -0x4[ebp],ds
07B5  6A FF				push		0xffffffff
07B7  0F B7 45 FC			movzx		eax,word ptr -0x4[ebp]
07BB  50				push		eax
07BC  56				push		esi
07BD  89 F7				mov		edi,esi
07BF  EB 5D				jmp		L$100
07C1				L$93:
07C1  53				push		ebx
07C2  50				push		eax
07C3  56				push		esi
07C4  E8 00 00 00 00			call		float_format
07C9  83 C4 0C				add		esp,0x0000000c
07CC  89 55 FC				mov		dword ptr -0x4[ebp],edx
07CF  6A FF				push		0xffffffff
07D1  0F B7 D2				movzx		edx,dx
07D4  52				push		edx
07D5  50				push		eax
07D6  89 C7				mov		edi,eax
07D8  EB 44				jmp		L$100
07DA				L$94:
07DA  8A 43 14				mov		al,byte ptr 0x14[ebx]
07DD  24 01				and		al,0x01
07DF  0F B6 C0				movzx		eax,al
07E2  BA 08 00 00 00			mov		edx,0x00000008
07E7  85 C0				test		eax,eax
07E9  74 07				je		L$95
07EB  66 C7 06 30 00			mov		word ptr [esi],0x0030
07F0  46				inc		esi
07F1  46				inc		esi
07F2				L$95:
07F2  52				push		edx
07F3  56				push		esi
07F4  FF 75 F0				push		dword ptr -0x10[ebp]
07F7  E8 00 00 00 00			call		_ultoa
07FC				L$96:
07FC  83 C4 0C				add		esp,0x0000000c
07FF				L$97:
07FF  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
0803  75 11				jne		L$98
0805  0F B7 06				movzx		eax,word ptr [esi]
0808  83 F8 30				cmp		eax,0x00000030
080B  75 09				jne		L$98
080D  8E 45 FC				mov		es,dword ptr -0x4[ebp]
0810  66 26 C7 07 00 00			mov		word ptr es:[edi],0x0000
0816				L$98:
0816  6A FF				push		0xffffffff
0818				L$99:
0818  0F B7 45 FC			movzx		eax,word ptr -0x4[ebp]
081C  50				push		eax
081D  57				push		edi
081E				L$100:
081E  E8 00 00 00 00			call		far_strlen
0823				L$101:
0823  83 C4 0C				add		esp,0x0000000c
0826  E9 3B 02 00 00			jmp		L$128
082B				L$102:
082B  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
082E  80 E1 20				and		cl,0x20
0831  0F B6 C9				movzx		ecx,cl
0834  85 C9				test		ecx,ecx
0836  74 12				je		L$104
0838  83 00 04				add		dword ptr [eax],0x00000004
083B  52				push		edx
083C  8B 00				mov		eax,dword ptr [eax]
083E  56				push		esi
083F  8B 40 FC				mov		eax,dword ptr -0x4[eax]
0842				L$103:
0842  50				push		eax
0843  E8 00 00 00 00			call		_ultoa
0848  EB B2				jmp		L$96
084A				L$104:
084A  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
084D  80 E1 10				and		cl,0x10
0850  0F B6 C9				movzx		ecx,cl
0853  85 C9				test		ecx,ecx
0855  74 0D				je		L$105
0857  83 00 04				add		dword ptr [eax],0x00000004
085A  52				push		edx
085B  8B 00				mov		eax,dword ptr [eax]
085D  56				push		esi
085E  0F BF 40 FC			movsx		eax,word ptr -0x4[eax]
0862  EB DE				jmp		L$103
0864				L$105:
0864  52				push		edx
0865  83 00 04				add		dword ptr [eax],0x00000004
0868  56				push		esi
0869  8B 00				mov		eax,dword ptr [eax]
086B  FF 70 FC				push		dword ptr -0x4[eax]
086E  E8 00 00 00 00			call		_uitoa
0873  EB 87				jmp		L$96
0875				L$106:
0875  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0878  80 E2 80				and		dl,0x80
087B  0F B6 D2				movzx		edx,dl
087E  85 D2				test		edx,edx
0880  74 21				je		L$109
0882  83 00 08				add		dword ptr [eax],0x00000008
0885  8B 00				mov		eax,dword ptr [eax]
0887  66 8B 78 FC			mov		di,word ptr -0x4[eax]
088B  8B 40 F8				mov		eax,dword ptr -0x8[eax]
088E  85 C0				test		eax,eax
0890  75 05				jne		L$107
0892  66 85 FF				test		di,di
0895  74 07				je		L$108
0897				L$107:
0897  89 7D FC				mov		dword ptr -0x4[ebp],edi
089A  89 C7				mov		edi,eax
089C  EB 32				jmp		L$112
089E				L$108:
089E  8B 7D 24				mov		edi,dword ptr 0x24[ebp]
08A1  EB 2A				jmp		L$111
08A3				L$109:
08A3  8A 53 14				mov		dl,byte ptr 0x14[ebx]
08A6  80 E2 40				and		dl,0x40
08A9  0F B6 D2				movzx		edx,dl
08AC  85 D2				test		edx,edx
08AE  74 0E				je		L$110
08B0  83 00 04				add		dword ptr [eax],0x00000004
08B3  8B 00				mov		eax,dword ptr [eax]
08B5  8B 78 FC				mov		edi,dword ptr -0x4[eax]
08B8  85 FF				test		edi,edi
08BA  75 11				jne		L$111
08BC  EB E0				jmp		L$108
08BE				L$110:
08BE  83 00 04				add		dword ptr [eax],0x00000004
08C1  8B 00				mov		eax,dword ptr [eax]
08C3  8B 78 FC				mov		edi,dword ptr -0x4[eax]
08C6  85 FF				test		edi,edi
08C8  75 03				jne		L$111
08CA  8B 7D 24				mov		edi,dword ptr 0x24[ebp]
08CD				L$111:
08CD  8C 5D FC				mov		dword ptr -0x4[ebp],ds
08D0				L$112:
08D0  C7 45 F4 00 00 00 00		mov		dword ptr -0xc[ebp],0x00000000
08D7  0F B7 43 15			movzx		eax,word ptr 0x15[ebx]
08DB  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
08DF  83 F8 53				cmp		eax,0x00000053
08E2  75 27				jne		L$114
08E4  8A 43 14				mov		al,byte ptr 0x14[ebx]
08E7  24 10				and		al,0x10
08E9  0F B6 C0				movzx		eax,al
08EC  85 C0				test		eax,eax
08EE  74 0D				je		L$113
08F0  8E 45 FC				mov		es,dword ptr -0x4[ebp]
08F3  26 0F B6 07			movzx		eax,byte ptr es:[edi]
08F7  47				inc		edi
08F8  E9 69 01 00 00			jmp		L$128
08FD				L$113:
08FD  8E 45 FC				mov		es,dword ptr -0x4[ebp]
0900  26 0F B7 07			movzx		eax,word ptr es:[edi]
0904  47				inc		edi
0905  47				inc		edi
0906  E9 5B 01 00 00			jmp		L$128
090B				L$114:
090B  8A 43 14				mov		al,byte ptr 0x14[ebx]
090E  24 10				and		al,0x10
0910  0F B6 C0				movzx		eax,al
0913  85 C0				test		eax,eax
0915  74 13				je		L$115
0917  FF 73 08				push		dword ptr 0x8[ebx]
091A  0F B7 45 FC			movzx		eax,word ptr -0x4[ebp]
091E  50				push		eax
091F  57				push		edi
0920  E8 00 00 00 00			call		far_other_strlen
0925  E9 F9 FE FF FF			jmp		L$101
092A				L$115:
092A  FF 73 08				push		dword ptr 0x8[ebx]
092D  E9 E6 FE FF FF			jmp		L$99
0932				L$116:
0932  8A 43 14				mov		al,byte ptr 0x14[ebx]
0935  24 01				and		al,0x01
0937  0F B6 C0				movzx		eax,al
093A  85 C0				test		eax,eax
093C  74 1A				je		L$117
093E  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
0942  74 14				je		L$117
0944  66 C7 43 19 30 00			mov		word ptr 0x19[ebx],0x0030
094A  66 8B 43 15			mov		ax,word ptr 0x15[ebx]
094E  66 C7 43 1D 00 00			mov		word ptr 0x1d[ebx],0x0000
0954  66 89 43 1B			mov		word ptr 0x1b[ebx],ax
0958				L$117:
0958  BA 10 00 00 00			mov		edx,0x00000010
095D				L$118:
095D  52				push		edx
095E  56				push		esi
095F  FF 75 F0				push		dword ptr -0x10[ebp]
0962  E8 00 00 00 00			call		_uultoa
0967  0F B7 43 15			movzx		eax,word ptr 0x15[ebx]
096B  83 C4 0C				add		esp,0x0000000c
096E  83 F8 58				cmp		eax,0x00000058
0971  0F 85 88 FE FF FF			jne		L$97
0977  56				push		esi
0978  E8 00 00 00 00			call		zupstr
097D  83 C4 04				add		esp,0x00000004
0980  E9 7A FE FF FF			jmp		L$97
0985				L$119:
0985  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
0989  75 1D				jne		L$121
098B  8A 53 14				mov		dl,byte ptr 0x14[ebx]
098E  80 E2 80				and		dl,0x80
0991  0F B6 D2				movzx		edx,dl
0994  85 D2				test		edx,edx
0996  74 09				je		L$120
0998  C7 43 04 0D 00 00 00		mov		dword ptr 0x4[ebx],0x0000000d
099F  EB 07				jmp		L$121
09A1				L$120:
09A1  C7 43 04 08 00 00 00		mov		dword ptr 0x4[ebx],0x00000008
09A8				L$121:
09A8  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
09AC  83 00 04				add		dword ptr [eax],0x00000004
09AF  8B 10				mov		edx,dword ptr [eax]
09B1  8B 4A FC				mov		ecx,dword ptr -0x4[edx]
09B4  89 4D F8				mov		dword ptr -0x8[ebp],ecx
09B7  8A 4B 14				mov		cl,byte ptr 0x14[ebx]
09BA  80 E1 80				and		cl,0x80
09BD  0F B6 C9				movzx		ecx,cl
09C0  85 C9				test		ecx,ecx
09C2  74 2A				je		L$122
09C4  83 C2 04				add		edx,0x00000004
09C7  89 10				mov		dword ptr [eax],edx
09C9  6A 04				push		0x00000004
09CB  8B 42 FC				mov		eax,dword ptr -0x4[edx]
09CE  56				push		esi
09CF  25 FF FF 00 00			and		eax,0x0000ffff
09D4  50				push		eax
09D5  E8 00 00 00 00			call		fmt4hex
09DA  83 C4 0C				add		esp,0x0000000c
09DD  6A 08				push		0x00000008
09DF  8D 46 0A				lea		eax,0xa[esi]
09E2  50				push		eax
09E3  FF 75 F8				push		dword ptr -0x8[ebp]
09E6  66 C7 46 08 3A 00			mov		word ptr 0x8[esi],0x003a
09EC  EB 06				jmp		L$123
09EE				L$122:
09EE  6A 08				push		0x00000008
09F0  56				push		esi
09F1  FF 75 F8				push		dword ptr -0x8[ebp]
09F4				L$123:
09F4  E8 00 00 00 00			call		fmt4hex
09F9  83 C4 0C				add		esp,0x0000000c
09FC  0F B7 43 15			movzx		eax,word ptr 0x15[ebx]
0A00  83 F8 50				cmp		eax,0x00000050
0A03  0F 85 0D FE FF FF			jne		L$98
0A09  56				push		esi
0A0A  E8 00 00 00 00			call		zupstr
0A0F  83 C4 04				add		esp,0x00000004
0A12  E9 FF FD FF FF			jmp		L$98
0A17				L$124:
0A17  83 00 04				add		dword ptr [eax],0x00000004
0A1A  8B 00				mov		eax,dword ptr [eax]
0A1C  66 8B 40 FC			mov		ax,word ptr -0x4[eax]
0A20  66 89 06				mov		word ptr [esi],ax
0A23  8A 43 14				mov		al,byte ptr 0x14[ebx]
0A26  24 10				and		al,0x10
0A28  0F B6 C0				movzx		eax,al
0A2B  85 C0				test		eax,eax
0A2D  74 04				je		L$125
0A2F  C6 46 01 00			mov		byte ptr 0x1[esi],0x00
0A33				L$125:
0A33  66 C7 46 02 00 00			mov		word ptr 0x2[esi],0x0000
0A39  EB 14				jmp		L$127
0A3B				L$126:
0A3B  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
0A42  66 8B 43 15			mov		ax,word ptr 0x15[ebx]
0A46  66 C7 46 02 00 00			mov		word ptr 0x2[esi],0x0000
0A4C  66 89 06				mov		word ptr [esi],ax
0A4F				L$127:
0A4F  C7 45 F4 00 00 00 00		mov		dword ptr -0xc[ebp],0x00000000
0A56  C7 43 08 01 00 00 00		mov		dword ptr 0x8[ebx],0x00000001
0A5D  B8 01 00 00 00			mov		eax,0x00000001
0A62  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
0A66				L$128:
0A66  83 7D F4 00			cmp		dword ptr -0xc[ebp],0x00000000
0A6A  74 57				je		L$134
0A6C  8E 45 FC				mov		es,dword ptr -0x4[ebp]
0A6F  26 0F B7 17			movzx		edx,word ptr es:[edi]
0A73  83 FA 2D				cmp		edx,0x0000002d
0A76  75 0B				jne		L$129
0A78  47				inc		edi
0A79  47				inc		edi
0A7A  66 C7 43 19 2D 00			mov		word ptr 0x19[ebx],0x002d
0A80  48				dec		eax
0A81  EB 28				jmp		L$131
0A83				L$129:
0A83  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0A86  80 E2 02				and		dl,0x02
0A89  0F B6 D2				movzx		edx,dl
0A8C  85 D2				test		edx,edx
0A8E  74 08				je		L$130
0A90  66 C7 43 19 20 00			mov		word ptr 0x19[ebx],0x0020
0A96  EB 13				jmp		L$131
0A98				L$130:
0A98  8A 53 14				mov		dl,byte ptr 0x14[ebx]
0A9B  80 E2 04				and		dl,0x04
0A9E  0F B6 D2				movzx		edx,dl
0AA1  85 D2				test		edx,edx
0AA3  74 0C				je		L$132
0AA5  66 C7 43 19 2B 00			mov		word ptr 0x19[ebx],0x002b
0AAB				L$131:
0AAB  66 C7 43 1B 00 00			mov		word ptr 0x1b[ebx],0x0000
0AB1				L$132:
0AB1  3B 43 08				cmp		eax,dword ptr 0x8[ebx]
0AB4  7E 05				jle		L$133
0AB6  89 43 08				mov		dword ptr 0x8[ebx],eax
0AB9  EB 08				jmp		L$134
0ABB				L$133:
0ABB  8B 53 08				mov		edx,dword ptr 0x8[ebx]
0ABE  29 C2				sub		edx,eax
0AC0  89 53 0C				mov		dword ptr 0xc[ebx],edx
0AC3				L$134:
0AC3  0F B7 53 17			movzx		edx,word ptr 0x17[ebx]
0AC7  83 FA 2A				cmp		edx,0x0000002a
0ACA  75 0A				jne		L$135
0ACC  66 C7 43 19 00 00			mov		word ptr 0x19[ebx],0x0000
0AD2  80 63 14 F9			and		byte ptr 0x14[ebx],0xf9
0AD6				L$135:
0AD6  83 7B 08 FF			cmp		dword ptr 0x8[ebx],0xffffffff
0ADA  74 05				je		L$136
0ADC  3B 43 08				cmp		eax,dword ptr 0x8[ebx]
0ADF  7D 0C				jge		L$137
0AE1				L$136:
0AE1  0F B7 53 15			movzx		edx,word ptr 0x15[ebx]
0AE5  83 FA 63				cmp		edx,0x00000063
0AE8  74 03				je		L$137
0AEA  89 43 08				mov		dword ptr 0x8[ebx],eax
0AED				L$137:
0AED  8C D8				mov		eax,ds
0AEF  6A FF				push		0xffffffff
0AF1  0F B7 C0				movzx		eax,ax
0AF4  50				push		eax
0AF5  8D 53 19				lea		edx,0x19[ebx]
0AF8  52				push		edx
0AF9  E8 00 00 00 00			call		far_strlen
0AFE  03 43 08				add		eax,dword ptr 0x8[ebx]
0B01  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0B04  03 43 0C				add		eax,dword ptr 0xc[ebx]
0B07  83 C4 0C				add		esp,0x0000000c
0B0A  29 43 04				sub		dword ptr 0x4[ebx],eax
0B0D  89 F8				mov		eax,edi
0B0F  E9 72 F7 FF FF			jmp		L$28
0B14				zupstr:
0B14  53				push		ebx
0B15  55				push		ebp
0B16  89 E5				mov		ebp,esp
0B18  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0B1B				L$138:
0B1B  66 83 3B 00			cmp		word ptr [ebx],0x0000
0B1F  0F 84 F9 F8 FF FF			je		L$50
0B25  0F B7 03				movzx		eax,word ptr [ebx]
0B28  50				push		eax
0B29  E8 00 00 00 00			call		_utoupper
0B2E  83 C4 04				add		esp,0x00000004
0B31  66 89 03				mov		word ptr [ebx],ax
0B34  43				inc		ebx
0B35  43				inc		ebx
0B36  EB E3				jmp		L$138

Routine Size: 2872 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

