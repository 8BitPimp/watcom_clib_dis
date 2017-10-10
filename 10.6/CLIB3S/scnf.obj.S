Module: scnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000D24 bytes
0000				cget:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  50				push		eax
0005  FF 10				call		dword ptr [eax]
0007  83 C4 04				add		esp,0x00000004
000A  C3				ret		
000B				uncget:
000B  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
000F  50				push		eax
0010  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0014  52				push		edx
0015  FF 50 04				call		dword ptr 0x4[eax]
0018  83 C4 08				add		esp,0x00000008
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

001C				__scnf:
001C  53				push		ebx
001D  56				push		esi
001E  57				push		edi
001F  55				push		ebp
0020  83 EC 04				sub		esp,0x00000004
0023  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0027  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
002B  8A 66 10				mov		ah,byte ptr 0x10[esi]
002E  31 D2				xor		edx,edx
0030  31 ED				xor		ebp,ebp
0032  80 E4 FD				and		ah,0xfd
0035  89 14 24				mov		dword ptr [esp],edx
0038  88 66 10				mov		byte ptr 0x10[esi],ah
003B				L$1:
003B  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
003F  8D 4B 01				lea		ecx,0x1[ebx]
0042  89 4C 24 1C			mov		dword ptr 0x1c[esp],ecx
0046  8A 1B				mov		bl,byte ptr [ebx]
0048  81 E3 FF 00 00 00			and		ebx,0x000000ff
004E  0F 84 E3 01 00 00			je		L$30
0054  88 D8				mov		al,bl
0056  FE C0				inc		al
0058  25 FF 00 00 00			and		eax,0x000000ff
005D  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0063  24 02				and		al,0x02
0065  25 FF 00 00 00			and		eax,0x000000ff
006A  74 10				je		L$2
006C  56				push		esi
006D  E8 00 00 00 00			call		scan_white
0072  83 C4 04				add		esp,0x00000004
0075  01 C5				add		ebp,eax
0077  E9 73 01 00 00			jmp		L$29
007C				L$2:
007C  83 FB 25				cmp		ebx,0x00000025
007F  74 2A				je		L$4
0081  56				push		esi
0082  E8 00 00 00 00			call		cget
0087  83 C4 04				add		esp,0x00000004
008A  39 D8				cmp		eax,ebx
008C  0F 84 5C 01 00 00			je		L$28
0092				L$3:
0092  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0096  0F 85 9B 01 00 00			jne		L$30
009C  56				push		esi
009D  50				push		eax
009E  E8 00 00 00 00			call		uncget
00A3  83 C4 08				add		esp,0x00000008
00A6  E9 8C 01 00 00			jmp		L$30
00AB				L$4:
00AB  56				push		esi
00AC  51				push		ecx
00AD  E8 00 00 00 00			call		get_opt
00B2  83 C4 08				add		esp,0x00000008
00B5  31 DB				xor		ebx,ebx
00B7  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
00BB  8A 18				mov		bl,byte ptr [eax]
00BD  85 DB				test		ebx,ebx
00BF  74 05				je		L$5
00C1  40				inc		eax
00C2  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
00C6				L$5:
00C6  83 FB 65				cmp		ebx,0x00000065
00C9  72 55				jb		L$9
00CB  83 FB 67				cmp		ebx,0x00000067
00CE  0F 86 B3 00 00 00			jbe		L$20
00D4  83 FB 70				cmp		ebx,0x00000070
00D7  72 2D				jb		L$7
00D9  0F 86 A2 00 00 00			jbe		L$19
00DF  83 FB 75				cmp		ebx,0x00000075
00E2  72 14				jb		L$6
00E4  0F 86 93 00 00 00			jbe		L$18
00EA  83 FB 78				cmp		ebx,0x00000078
00ED  0F 84 8E 00 00 00			je		L$19
00F3  E9 F7 00 00 00			jmp		L$29
00F8				L$6:
00F8  83 FB 73				cmp		ebx,0x00000073
00FB  0F 84 92 00 00 00			je		L$22
0101  E9 E9 00 00 00			jmp		L$29
0106				L$7:
0106  83 FB 6E				cmp		ebx,0x0000006e
0109  72 0B				jb		L$8
010B  0F 86 BF 00 00 00			jbe		L$26
0111  E9 61 00 00 00			jmp		L$17
0116				L$8:
0116  83 FB 69				cmp		ebx,0x00000069
0119  74 56				je		L$16
011B  E9 CF 00 00 00			jmp		L$29
0120				L$9:
0120  83 FB 58				cmp		ebx,0x00000058
0123  72 1D				jb		L$11
0125  76 5A				jbe		L$19
0127  83 FB 63				cmp		ebx,0x00000063
012A  72 08				jb		L$10
012C  0F 86 7B 00 00 00			jbe		L$24
0132  EB 2D				jmp		L$13
0134				L$10:
0134  83 FB 5B				cmp		ebx,0x0000005b
0137  0F 84 5F 00 00 00			je		L$23
013D  E9 AD 00 00 00			jmp		L$29
0142				L$11:
0142  83 FB 45				cmp		ebx,0x00000045
0145  72 0C				jb		L$12
0147  76 3E				jbe		L$20
0149  83 FB 47				cmp		ebx,0x00000047
014C  74 39				je		L$20
014E  E9 9C 00 00 00			jmp		L$29
0153				L$12:
0153  83 FB 25				cmp		ebx,0x00000025
0156  0F 84 81 00 00 00			je		L$27
015C  E9 8E 00 00 00			jmp		L$29
0161				L$13:
0161  6A 01				push		0x00000001
0163				L$14:
0163  6A 0A				push		0x0000000a
0165				L$15:
0165  57				push		edi
0166  56				push		esi
0167  E8 00 00 00 00			call		scan_int
016C  83 C4 10				add		esp,0x00000010
016F  EB 46				jmp		L$25
0171				L$16:
0171  6A 01				push		0x00000001
0173  6A 00				push		0x00000000
0175  EB EE				jmp		L$15
0177				L$17:
0177  6A 01				push		0x00000001
0179  6A 08				push		0x00000008
017B  EB E8				jmp		L$15
017D				L$18:
017D  6A 00				push		0x00000000
017F  EB E2				jmp		L$14
0181				L$19:
0181  6A 01				push		0x00000001
0183  6A 10				push		0x00000010
0185  EB DE				jmp		L$15
0187				L$20:
0187  57				push		edi
0188  56				push		esi
0189  E8 00 00 00 00			call		scan_float
018E				L$21:
018E  83 C4 08				add		esp,0x00000008
0191  EB 24				jmp		L$25
0193				L$22:
0193  57				push		edi
0194  56				push		esi
0195  E8 00 00 00 00			call		scan_string
019A  EB F2				jmp		L$21
019C				L$23:
019C  8D 44 24 1C			lea		eax,0x1c[esp]
01A0  50				push		eax
01A1  57				push		edi
01A2  56				push		esi
01A3  E8 00 00 00 00			call		scan_arb
01A8  83 C4 0C				add		esp,0x0000000c
01AB  EB 0A				jmp		L$25
01AD				L$24:
01AD  57				push		edi
01AE  56				push		esi
01AF  E8 00 00 00 00			call		scan_char
01B4  83 C4 08				add		esp,0x00000008
01B7				L$25:
01B7  89 C3				mov		ebx,eax
01B9  85 DB				test		ebx,ebx
01BB  0F 8E 76 00 00 00			jle		L$30
01C1  8A 56 10				mov		dl,byte ptr 0x10[esi]
01C4  01 DD				add		ebp,ebx
01C6  F6 C2 01				test		dl,0x01
01C9  74 24				je		L$29
01CB  FF 04 24				inc		dword ptr [esp]
01CE  EB 1F				jmp		L$29
01D0				L$26:
01D0  55				push		ebp
01D1  57				push		edi
01D2  56				push		esi
01D3  E8 00 00 00 00			call		report_scan
01D8  83 C4 0C				add		esp,0x0000000c
01DB  EB 12				jmp		L$29
01DD				L$27:
01DD  56				push		esi
01DE  E8 00 00 00 00			call		cget
01E3  83 C4 04				add		esp,0x00000004
01E6  39 D8				cmp		eax,ebx
01E8  0F 85 A4 FE FF FF			jne		L$3
01EE				L$28:
01EE  45				inc		ebp
01EF				L$29:
01EF  F6 46 10 02			test		byte ptr 0x10[esi],0x02
01F3  0F 84 42 FE FF FF			je		L$1
01F9  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
01FD  8A 00				mov		al,byte ptr [eax]
01FF  25 FF 00 00 00			and		eax,0x000000ff
0204  83 F8 25				cmp		eax,0x00000025
0207  75 2E				jne		L$30
0209  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
020D  56				push		esi
020E  43				inc		ebx
020F  53				push		ebx
0210  89 5C 24 24			mov		dword ptr 0x24[esp],ebx
0214  E8 00 00 00 00			call		get_opt
0219  83 C4 08				add		esp,0x00000008
021C  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
0220  8A 00				mov		al,byte ptr [eax]
0222  25 FF 00 00 00			and		eax,0x000000ff
0227  83 F8 6E				cmp		eax,0x0000006e
022A  75 0B				jne		L$30
022C  55				push		ebp
022D  57				push		edi
022E  56				push		esi
022F  E8 00 00 00 00			call		report_scan
0234  83 C4 0C				add		esp,0x0000000c
0237				L$30:
0237  83 3C 24 00			cmp		dword ptr [esp],0x00000000
023B  75 0D				jne		L$31
023D  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0241  74 07				je		L$31
0243  B8 FF FF FF FF			mov		eax,0xffffffff
0248  EB 03				jmp		L$32
024A				L$31:
024A  8B 04 24				mov		eax,dword ptr [esp]
024D				L$32:
024D  83 C4 04				add		esp,0x00000004
0250  5D				pop		ebp
0251  5F				pop		edi
0252  5E				pop		esi
0253  5B				pop		ebx
0254  C3				ret		
0255				get_opt:
0255  53				push		ebx
0256  56				push		esi
0257  83 EC 04				sub		esp,0x00000004
025A  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
025E  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0262  8A 53 10				mov		dl,byte ptr 0x10[ebx]
0265  80 CA 01				or		dl,0x01
0268  88 53 10				mov		byte ptr 0x10[ebx],dl
026B  88 D6				mov		dh,dl
026D  C7 43 0C FF FF FF FF		mov		dword ptr 0xc[ebx],0xffffffff
0274  80 E6 03				and		dh,0x03
0277  88 73 10				mov		byte ptr 0x10[ebx],dh
027A  31 D2				xor		edx,edx
027C  8A 10				mov		dl,byte ptr [eax]
027E  83 FA 2A				cmp		edx,0x0000002a
0281  75 0A				jne		L$33
0283  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
0286  80 E1 FE				and		cl,0xfe
0289  40				inc		eax
028A  88 4B 10				mov		byte ptr 0x10[ebx],cl
028D				L$33:
028D  31 D2				xor		edx,edx
028F  8A 10				mov		dl,byte ptr [eax]
0291  89 14 24				mov		dword ptr [esp],edx
0294  8A 14 24				mov		dl,byte ptr [esp]
0297  FE C2				inc		dl
0299  81 E2 FF 00 00 00			and		edx,0x000000ff
029F  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
02A5  80 E2 20				and		dl,0x20
02A8  81 E2 FF 00 00 00			and		edx,0x000000ff
02AE  74 2F				je		L$35
02B0  31 D2				xor		edx,edx
02B2				L$34:
02B2  6B D2 0A				imul		edx,0x0000000a
02B5  8B 34 24				mov		esi,dword ptr [esp]
02B8  83 EE 30				sub		esi,0x00000030
02BB  40				inc		eax
02BC  01 F2				add		edx,esi
02BE  0F B6 30				movzx		esi,byte ptr [eax]
02C1  89 34 24				mov		dword ptr [esp],esi
02C4  8A 0C 24				mov		cl,byte ptr [esp]
02C7  FE C1				inc		cl
02C9  0F B6 F1				movzx		esi,cl
02CC  8A 8E 00 00 00 00			mov		cl,byte ptr _IsTable[esi]
02D2  80 E1 20				and		cl,0x20
02D5  0F B6 F1				movzx		esi,cl
02D8  85 F6				test		esi,esi
02DA  75 D6				jne		L$34
02DC  89 53 0C				mov		dword ptr 0xc[ebx],edx
02DF				L$35:
02DF  31 D2				xor		edx,edx
02E1  8A 10				mov		dl,byte ptr [eax]
02E3  8D 70 01				lea		esi,0x1[eax]
02E6  83 FA 4E				cmp		edx,0x0000004e
02E9  75 08				jne		L$36
02EB  80 4B 10 08			or		byte ptr 0x10[ebx],0x08
02EF  89 F0				mov		eax,esi
02F1  EB 10				jmp		L$37
02F3				L$36:
02F3  83 FA 46				cmp		edx,0x00000046
02F6  75 0B				jne		L$37
02F8  8A 6B 10				mov		ch,byte ptr 0x10[ebx]
02FB  80 CD 04				or		ch,0x04
02FE  89 F0				mov		eax,esi
0300  88 6B 10				mov		byte ptr 0x10[ebx],ch
0303				L$37:
0303  8A 10				mov		dl,byte ptr [eax]
0305  8D 70 01				lea		esi,0x1[eax]
0308  80 FA 68				cmp		dl,0x68
030B  72 10				jb		L$38
030D  76 15				jbe		L$39
030F  80 FA 6C				cmp		dl,0x6c
0312  72 34				jb		L$42
0314  76 1B				jbe		L$40
0316  80 FA 77				cmp		dl,0x77
0319  74 16				je		L$40
031B  EB 2B				jmp		L$42
031D				L$38:
031D  80 FA 4C				cmp		dl,0x4c
0320  74 1B				je		L$41
0322  EB 24				jmp		L$42
0324				L$39:
0324  8A 73 10				mov		dh,byte ptr 0x10[ebx]
0327  80 CE 10				or		dh,0x10
032A  89 F0				mov		eax,esi
032C  88 73 10				mov		byte ptr 0x10[ebx],dh
032F  EB 17				jmp		L$42
0331				L$40:
0331  8A 53 10				mov		dl,byte ptr 0x10[ebx]
0334  80 CA 20				or		dl,0x20
0337  40				inc		eax
0338  88 53 10				mov		byte ptr 0x10[ebx],dl
033B  EB 0B				jmp		L$42
033D				L$41:
033D  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
0340  80 C9 40				or		cl,0x40
0343  89 F0				mov		eax,esi
0345  88 4B 10				mov		byte ptr 0x10[ebx],cl
0348				L$42:
0348  83 C4 04				add		esp,0x00000004
034B  5E				pop		esi
034C  5B				pop		ebx
034D  C3				ret		
034E				scan_white:
034E  53				push		ebx
034F  56				push		esi
0350  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0354  31 DB				xor		ebx,ebx
0356				L$43:
0356  56				push		esi
0357  E8 00 00 00 00			call		cget
035C  89 C2				mov		edx,eax
035E  83 C4 04				add		esp,0x00000004
0361  FE C2				inc		dl
0363  81 E2 FF 00 00 00			and		edx,0x000000ff
0369  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
036F  80 E2 02				and		dl,0x02
0372  81 E2 FF 00 00 00			and		edx,0x000000ff
0378  74 03				je		L$44
037A  43				inc		ebx
037B  EB D9				jmp		L$43
037D				L$44:
037D  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0381  75 0A				jne		L$45
0383  56				push		esi
0384  50				push		eax
0385  E8 00 00 00 00			call		uncget
038A  83 C4 08				add		esp,0x00000008
038D				L$45:
038D  89 D8				mov		eax,ebx
038F  5E				pop		esi
0390  5B				pop		ebx
0391  C3				ret		
0392				scan_char:
0392  53				push		ebx
0393  56				push		esi
0394  57				push		edi
0395  06				push		es
0396  55				push		ebp
0397  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
039B  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
039F  8A 56 10				mov		dl,byte ptr 0x10[esi]
03A2  F6 C2 01				test		dl,0x01
03A5  74 34				je		L$48
03A7  F6 C2 04				test		dl,0x04
03AA  74 0C				je		L$46
03AC  8B 08				mov		ecx,dword ptr [eax]
03AE  83 C1 08				add		ecx,0x00000008
03B1  89 08				mov		dword ptr [eax],ecx
03B3  C4 59 F8				les		ebx,fword ptr -0x8[ecx]
03B6  EB 23				jmp		L$48
03B8				L$46:
03B8  F6 C2 08				test		dl,0x08
03BB  74 10				je		L$47
03BD  8B 18				mov		ebx,dword ptr [eax]
03BF  83 C3 04				add		ebx,0x00000004
03C2  89 18				mov		dword ptr [eax],ebx
03C4  8C D8				mov		eax,ds
03C6  8E C0				mov		es,eax
03C8  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
03CB  EB 0E				jmp		L$48
03CD				L$47:
03CD  8B 10				mov		edx,dword ptr [eax]
03CF  83 C2 04				add		edx,0x00000004
03D2  89 10				mov		dword ptr [eax],edx
03D4  8C D8				mov		eax,ds
03D6  8E C0				mov		es,eax
03D8  8B 5A FC				mov		ebx,dword ptr -0x4[edx]
03DB				L$48:
03DB  8B 7E 0C				mov		edi,dword ptr 0xc[esi]
03DE  31 ED				xor		ebp,ebp
03E0  83 FF FF				cmp		edi,0xffffffff
03E3  75 05				jne		L$49
03E5  BF 01 00 00 00			mov		edi,0x00000001
03EA				L$49:
03EA  85 FF				test		edi,edi
03EC  7E 2C				jle		L$51
03EE  56				push		esi
03EF  E8 00 00 00 00			call		cget
03F4  8A 4E 10				mov		cl,byte ptr 0x10[esi]
03F7  83 C4 04				add		esp,0x00000004
03FA  F6 C1 02				test		cl,0x02
03FD  75 1B				jne		L$51
03FF  45				inc		ebp
0400  4F				dec		edi
0401  F6 C1 01				test		cl,0x01
0404  74 E4				je		L$49
0406  F6 C1 20				test		cl,0x20
0409  74 09				je		L$50
040B  66 26 89 03			mov		word ptr es:[ebx],ax
040F  83 C3 02				add		ebx,0x00000002
0412  EB D6				jmp		L$49
0414				L$50:
0414  26 88 03				mov		byte ptr es:[ebx],al
0417  43				inc		ebx
0418  EB D0				jmp		L$49
041A				L$51:
041A  89 E8				mov		eax,ebp
041C				L$52:
041C  5D				pop		ebp
041D  07				pop		es
041E  5F				pop		edi
041F  5E				pop		esi
0420  5B				pop		ebx
0421  C3				ret		
0422				scan_string:
0422  53				push		ebx
0423  56				push		esi
0424  57				push		edi
0425  06				push		es
0426  55				push		ebp
0427  83 EC 08				sub		esp,0x00000008
042A  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
042E  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0432  8A 56 10				mov		dl,byte ptr 0x10[esi]
0435  F6 C2 20				test		dl,0x20
0438  74 07				je		L$53
043A  C6 44 24 04 02			mov		byte ptr 0x4[esp],0x02
043F  EB 08				jmp		L$54
0441				L$53:
0441  F6 C2 10				test		dl,0x10
0444  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
0449				L$54:
0449  8A 76 10				mov		dh,byte ptr 0x10[esi]
044C  F6 C6 01				test		dh,0x01
044F  74 34				je		L$57
0451  F6 C6 04				test		dh,0x04
0454  74 0C				je		L$55
0456  8B 08				mov		ecx,dword ptr [eax]
0458  83 C1 08				add		ecx,0x00000008
045B  89 08				mov		dword ptr [eax],ecx
045D  C4 59 F8				les		ebx,fword ptr -0x8[ecx]
0460  EB 23				jmp		L$57
0462				L$55:
0462  F6 C6 08				test		dh,0x08
0465  74 10				je		L$56
0467  8B 18				mov		ebx,dword ptr [eax]
0469  83 C3 04				add		ebx,0x00000004
046C  89 18				mov		dword ptr [eax],ebx
046E  8C D8				mov		eax,ds
0470  8E C0				mov		es,eax
0472  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
0475  EB 0E				jmp		L$57
0477				L$56:
0477  8B 10				mov		edx,dword ptr [eax]
0479  83 C2 04				add		edx,0x00000004
047C  89 10				mov		dword ptr [eax],edx
047E  8C D8				mov		eax,ds
0480  8E C0				mov		es,eax
0482  8B 5A FC				mov		ebx,dword ptr -0x4[edx]
0485				L$57:
0485  31 FF				xor		edi,edi
0487				L$58:
0487  56				push		esi
0488  E8 00 00 00 00			call		cget
048D  83 C4 04				add		esp,0x00000004
0490  89 04 24				mov		dword ptr [esp],eax
0493  8A 04 24				mov		al,byte ptr [esp]
0496  FE C0				inc		al
0498  25 FF 00 00 00			and		eax,0x000000ff
049D  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
04A3  24 02				and		al,0x02
04A5  25 FF 00 00 00			and		eax,0x000000ff
04AA  74 03				je		L$59
04AC  47				inc		edi
04AD  EB D8				jmp		L$58
04AF				L$59:
04AF  F6 46 10 02			test		byte ptr 0x10[esi],0x02
04B3  74 07				je		L$60
04B5  31 FF				xor		edi,edi
04B7  E9 70 00 00 00			jmp		L$66
04BC				L$60:
04BC  8B 46 0C				mov		eax,dword ptr 0xc[esi]
04BF  8D 50 FF				lea		edx,-0x1[eax]
04C2  89 56 0C				mov		dword ptr 0xc[esi],edx
04C5  85 C0				test		eax,eax
04C7  74 55				je		L$65
04C9				L$61:
04C9  8A 6E 10				mov		ch,byte ptr 0x10[esi]
04CC  47				inc		edi
04CD  F6 C5 01				test		ch,0x01
04D0  74 22				je		L$64
04D2  31 C0				xor		eax,eax
04D4  8A 44 24 04			mov		al,byte ptr 0x4[esp]
04D8  83 F8 01				cmp		eax,0x00000001
04DB  75 08				jne		L$62
04DD  8A 04 24				mov		al,byte ptr [esp]
04E0  26 88 03				mov		byte ptr es:[ebx],al
04E3  EB 07				jmp		L$63
04E5				L$62:
04E5  8B 04 24				mov		eax,dword ptr [esp]
04E8  66 26 89 03			mov		word ptr es:[ebx],ax
04EC				L$63:
04EC  31 C0				xor		eax,eax
04EE  8A 44 24 04			mov		al,byte ptr 0x4[esp]
04F2  01 C3				add		ebx,eax
04F4				L$64:
04F4  56				push		esi
04F5  E8 00 00 00 00			call		cgetw
04FA  83 C4 04				add		esp,0x00000004
04FD  89 04 24				mov		dword ptr [esp],eax
0500  83 F8 FF				cmp		eax,0xffffffff
0503  74 27				je		L$66
0505  8A 04 24				mov		al,byte ptr [esp]
0508  FE C0				inc		al
050A  25 FF 00 00 00			and		eax,0x000000ff
050F  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0515  24 02				and		al,0x02
0517  25 FF 00 00 00			and		eax,0x000000ff
051C  74 AB				je		L$61
051E				L$65:
051E  56				push		esi
051F  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
0523  55				push		ebp
0524  E8 00 00 00 00			call		uncget
0529  83 C4 08				add		esp,0x00000008
052C				L$66:
052C  F6 46 10 01			test		byte ptr 0x10[esi],0x01
0530  74 1B				je		L$68
0532  85 FF				test		edi,edi
0534  7E 17				jle		L$68
0536  31 C0				xor		eax,eax
0538  8A 44 24 04			mov		al,byte ptr 0x4[esp]
053C  83 F8 01				cmp		eax,0x00000001
053F  75 06				jne		L$67
0541  26 C6 03 00			mov		byte ptr es:[ebx],0x00
0545  EB 06				jmp		L$68
0547				L$67:
0547  66 26 C7 03 00 00			mov		word ptr es:[ebx],0x0000
054D				L$68:
054D  89 F8				mov		eax,edi
054F  83 C4 08				add		esp,0x00000008
0552  E9 C5 FE FF FF			jmp		L$52
0557				report_scan:
0557  53				push		ebx
0558  56				push		esi
0559  06				push		es
055A  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
055E  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0562  8A 5A 10				mov		bl,byte ptr 0x10[edx]
0565  F6 C3 01				test		bl,0x01
0568  74 54				je		L$73
056A  F6 C3 04				test		bl,0x04
056D  74 0C				je		L$69
056F  8B 30				mov		esi,dword ptr [eax]
0571  83 C6 08				add		esi,0x00000008
0574  89 30				mov		dword ptr [eax],esi
0576  C4 46 F8				les		eax,fword ptr -0x8[esi]
0579  EB 25				jmp		L$71
057B				L$69:
057B  F6 C3 08				test		bl,0x08
057E  74 10				je		L$70
0580  8B 08				mov		ecx,dword ptr [eax]
0582  83 C1 04				add		ecx,0x00000004
0585  8C DB				mov		ebx,ds
0587  89 08				mov		dword ptr [eax],ecx
0589  8E C3				mov		es,ebx
058B  8B 41 FC				mov		eax,dword ptr -0x4[ecx]
058E  EB 10				jmp		L$71
0590				L$70:
0590  8B 18				mov		ebx,dword ptr [eax]
0592  83 C3 04				add		ebx,0x00000004
0595  89 18				mov		dword ptr [eax],ebx
0597  89 D8				mov		eax,ebx
0599  8C DB				mov		ebx,ds
059B  8E C3				mov		es,ebx
059D  8B 40 FC				mov		eax,dword ptr -0x4[eax]
05A0				L$71:
05A0  8A 6A 10				mov		ch,byte ptr 0x10[edx]
05A3  F6 C5 10				test		ch,0x10
05A6  74 0C				je		L$72
05A8  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
05AC  66 26 89 10			mov		word ptr es:[eax],dx
05B0  07				pop		es
05B1  5E				pop		esi
05B2  5B				pop		ebx
05B3  C3				ret		
05B4				L$72:
05B4  F6 C5 20				test		ch,0x20
05B7  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
05BB  26 89 10				mov		dword ptr es:[eax],edx
05BE				L$73:
05BE  07				pop		es
05BF  5E				pop		esi
05C0  5B				pop		ebx
05C1  C3				ret		
05C2				makelist:
05C2  53				push		ebx
05C3  56				push		esi
05C4  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
05C8  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
05CC  6A 20				push		0x00000020
05CE  6A 00				push		0x00000000
05D0  56				push		esi
05D1  E8 00 00 00 00			call		memset
05D6  31 C0				xor		eax,eax
05D8  83 C4 0C				add		esp,0x0000000c
05DB  8A 03				mov		al,byte ptr [ebx]
05DD  43				inc		ebx
05DE  85 C0				test		eax,eax
05E0  74 1F				je		L$75
05E2				L$74:
05E2  89 C2				mov		edx,eax
05E4  83 E0 07				and		eax,0x00000007
05E7  C1 FA 03				sar		edx,0x03
05EA  8A 80 00 00 00 00			mov		al,byte ptr lst_mask[eax]
05F0  08 04 32				or		byte ptr [edx+esi],al
05F3  31 C0				xor		eax,eax
05F5  8A 03				mov		al,byte ptr [ebx]
05F7  85 C0				test		eax,eax
05F9  74 06				je		L$75
05FB  43				inc		ebx
05FC  83 F8 5D				cmp		eax,0x0000005d
05FF  75 E1				jne		L$74
0601				L$75:
0601  89 D8				mov		eax,ebx
0603  5E				pop		esi
0604  5B				pop		ebx
0605  C3				ret		
0606				scan_arb:
0606  53				push		ebx
0607  56				push		esi
0608  57				push		edi
0609  06				push		es
060A  55				push		ebp
060B  83 EC 2C				sub		esp,0x0000002c
060E  8B 5C 24 44			mov		ebx,dword ptr 0x44[esp]
0612  8B 7C 24 48			mov		edi,dword ptr 0x48[esp]
0616  8B 6C 24 4C			mov		ebp,dword ptr 0x4c[esp]
061A  8B 45 00				mov		eax,dword ptr [ebp]
061D  31 D2				xor		edx,edx
061F  8A 10				mov		dl,byte ptr [eax]
0621  83 FA 5E				cmp		edx,0x0000005e
0624  0F 94 C2				sete		dl
0627  81 E2 FF 00 00 00			and		edx,0x000000ff
062D  89 54 24 24			mov		dword ptr 0x24[esp],edx
0631  74 04				je		L$76
0633  40				inc		eax
0634  89 45 00				mov		dword ptr [ebp],eax
0637				L$76:
0637  89 E0				mov		eax,esp
0639  50				push		eax
063A  8B 55 00				mov		edx,dword ptr [ebp]
063D  52				push		edx
063E  E8 00 00 00 00			call		makelist
0643  89 45 00				mov		dword ptr [ebp],eax
0646  8A 63 10				mov		ah,byte ptr 0x10[ebx]
0649  83 C4 08				add		esp,0x00000008
064C  F6 C4 01				test		ah,0x01
064F  74 34				je		L$79
0651  F6 C4 04				test		ah,0x04
0654  74 0C				je		L$77
0656  8B 2F				mov		ebp,dword ptr [edi]
0658  83 C5 08				add		ebp,0x00000008
065B  89 2F				mov		dword ptr [edi],ebp
065D  C4 75 F8				les		esi,fword ptr -0x8[ebp]
0660  EB 23				jmp		L$79
0662				L$77:
0662  F6 C4 08				test		ah,0x08
0665  74 10				je		L$78
0667  8B 37				mov		esi,dword ptr [edi]
0669  83 C6 04				add		esi,0x00000004
066C  8C D8				mov		eax,ds
066E  89 37				mov		dword ptr [edi],esi
0670  8E C0				mov		es,eax
0672  8B 76 FC				mov		esi,dword ptr -0x4[esi]
0675  EB 0E				jmp		L$79
0677				L$78:
0677  8B 0F				mov		ecx,dword ptr [edi]
0679  83 C1 04				add		ecx,0x00000004
067C  8C D8				mov		eax,ds
067E  89 0F				mov		dword ptr [edi],ecx
0680  8E C0				mov		es,eax
0682  8B 71 FC				mov		esi,dword ptr -0x4[ecx]
0685				L$79:
0685  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
0688  31 ED				xor		ebp,ebp
068A				L$80:
068A  85 FF				test		edi,edi
068C  0F 86 6F 00 00 00			jbe		L$82
0692  53				push		ebx
0693  E8 00 00 00 00			call		cget
0698  83 C4 04				add		esp,0x00000004
069B  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
069E  89 44 24 28			mov		dword ptr 0x28[esp],eax
06A2  F6 C1 02				test		cl,0x02
06A5  75 5A				jne		L$82
06A7  89 C2				mov		edx,eax
06A9  C1 FA 03				sar		edx,0x03
06AC  8A 14 14				mov		dl,byte ptr [esp+edx]
06AF  81 E2 FF 00 00 00			and		edx,0x000000ff
06B5  89 54 24 20			mov		dword ptr 0x20[esp],edx
06B9  89 C2				mov		edx,eax
06BB  83 E2 07				and		edx,0x00000007
06BE  8A 92 00 00 00 00			mov		dl,byte ptr lst_mask[edx]
06C4  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
06C8  81 E2 FF 00 00 00			and		edx,0x000000ff
06CE  85 CA				test		edx,ecx
06D0  0F 94 C2				sete		dl
06D3  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
06D7  81 E2 FF 00 00 00			and		edx,0x000000ff
06DD  39 CA				cmp		edx,ecx
06DF  74 0C				je		L$81
06E1  53				push		ebx
06E2  50				push		eax
06E3  E8 00 00 00 00			call		uncget
06E8  83 C4 08				add		esp,0x00000008
06EB  EB 14				jmp		L$82
06ED				L$81:
06ED  45				inc		ebp
06EE  8A 6B 10				mov		ch,byte ptr 0x10[ebx]
06F1  4F				dec		edi
06F2  F6 C5 01				test		ch,0x01
06F5  74 93				je		L$80
06F7  8A 44 24 28			mov		al,byte ptr 0x28[esp]
06FB  26 88 06				mov		byte ptr es:[esi],al
06FE  46				inc		esi
06FF  EB 89				jmp		L$80
0701				L$82:
0701  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
0705  74 08				je		L$83
0707  85 ED				test		ebp,ebp
0709  7E 04				jle		L$83
070B  26 C6 06 00			mov		byte ptr es:[esi],0x00
070F				L$83:
070F  89 E8				mov		eax,ebp
0711  83 C4 2C				add		esp,0x0000002c
0714  E9 03 FD FF FF			jmp		L$52
0719				scan_float:
0719  53				push		ebx
071A  56				push		esi
071B  57				push		edi
071C  06				push		es
071D  55				push		ebp
071E  83 EC 6C				sub		esp,0x0000006c
0721  8B B4 24 84 00 00 00		mov		esi,dword ptr 0x84[esp]
0728  89 E3				mov		ebx,esp
072A  31 FF				xor		edi,edi
072C  31 ED				xor		ebp,ebp
072E				L$84:
072E  56				push		esi
072F  E8 00 00 00 00			call		cget
0734  83 C4 04				add		esp,0x00000004
0737  89 44 24 64			mov		dword ptr 0x64[esp],eax
073B  8A 4C 24 64			mov		cl,byte ptr 0x64[esp]
073F  FE C1				inc		cl
0741  81 E1 FF 00 00 00			and		ecx,0x000000ff
0747  8A 89 00 00 00 00			mov		cl,byte ptr _IsTable[ecx]
074D  80 E1 02				and		cl,0x02
0750  81 E1 FF 00 00 00			and		ecx,0x000000ff
0756  74 03				je		L$85
0758  45				inc		ebp
0759  EB D3				jmp		L$84
075B				L$85:
075B  F6 46 10 02			test		byte ptr 0x10[esi],0x02
075F  0F 85 65 02 00 00			jne		L$104
0765  8B 4E 0C				mov		ecx,dword ptr 0xc[esi]
0768  8D 51 FF				lea		edx,-0x1[ecx]
076B  89 56 0C				mov		dword ptr 0xc[esi],edx
076E  85 C9				test		ecx,ecx
0770  0F 84 46 02 00 00			je		L$103
0776  83 F8 2B				cmp		eax,0x0000002b
0779  74 05				je		L$86
077B  83 F8 2D				cmp		eax,0x0000002d
077E  75 1E				jne		L$87
0780				L$86:
0780  8A 44 24 64			mov		al,byte ptr 0x64[esp]
0784  56				push		esi
0785  45				inc		ebp
0786  88 03				mov		byte ptr [ebx],al
0788  E8 00 00 00 00			call		cgetw
078D  83 C4 04				add		esp,0x00000004
0790  43				inc		ebx
0791  89 44 24 64			mov		dword ptr 0x64[esp],eax
0795  83 F8 FF				cmp		eax,0xffffffff
0798  0F 84 2C 02 00 00			je		L$104
079E				L$87:
079E  8A 44 24 64			mov		al,byte ptr 0x64[esp]
07A2  FE C0				inc		al
07A4  25 FF 00 00 00			and		eax,0x000000ff
07A9  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
07AF  24 20				and		al,0x20
07B1  25 FF 00 00 00			and		eax,0x000000ff
07B6  75 0B				jne		L$88
07B8  83 7C 24 64 2E			cmp		dword ptr 0x64[esp],0x0000002e
07BD  0F 85 F9 01 00 00			jne		L$103
07C3				L$88:
07C3  31 C9				xor		ecx,ecx
07C5  8A 44 24 64			mov		al,byte ptr 0x64[esp]
07C9  89 4C 24 5C			mov		dword ptr 0x5c[esp],ecx
07CD  89 4C 24 58			mov		dword ptr 0x58[esp],ecx
07D1  FE C0				inc		al
07D3  25 FF 00 00 00			and		eax,0x000000ff
07D8  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
07DE  24 20				and		al,0x20
07E0  25 FF 00 00 00			and		eax,0x000000ff
07E5  74 59				je		L$91
07E7  C7 44 24 58 01 00 00 00		mov		dword ptr 0x58[esp],0x00000001
07EF				L$89:
07EF  8A 44 24 64			mov		al,byte ptr 0x64[esp]
07F3  88 03				mov		byte ptr [ebx],al
07F5  8A 76 10				mov		dh,byte ptr 0x10[esi]
07F8  43				inc		ebx
07F9  F6 C6 10				test		dh,0x10
07FC  74 11				je		L$90
07FE  6B 44 24 5E 0A			imul		eax,dword ptr 0x5e[esp],0x0000000a
0803  03 44 24 64			add		eax,dword ptr 0x64[esp]
0807  83 E8 30				sub		eax,0x00000030
080A  66 89 44 24 5E			mov		word ptr 0x5e[esp],ax
080F				L$90:
080F  56				push		esi
0810  E8 00 00 00 00			call		cgetw
0815  83 C4 04				add		esp,0x00000004
0818  47				inc		edi
0819  89 44 24 64			mov		dword ptr 0x64[esp],eax
081D  83 F8 FF				cmp		eax,0xffffffff
0820  0F 84 A4 01 00 00			je		L$104
0826  8A 44 24 64			mov		al,byte ptr 0x64[esp]
082A  FE C0				inc		al
082C  25 FF 00 00 00			and		eax,0x000000ff
0831  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0837  24 20				and		al,0x20
0839  25 FF 00 00 00			and		eax,0x000000ff
083E  75 AF				jne		L$89
0840				L$91:
0840  83 7C 24 64 2E			cmp		dword ptr 0x64[esp],0x0000002e
0845  0F 85 C1 00 00 00			jne		L$98
084B  8A 44 24 64			mov		al,byte ptr 0x64[esp]
084F  56				push		esi
0850  88 03				mov		byte ptr [ebx],al
0852  E8 00 00 00 00			call		cgetw
0857  83 C4 04				add		esp,0x00000004
085A  43				inc		ebx
085B  89 44 24 64			mov		dword ptr 0x64[esp],eax
085F  83 F8 FF				cmp		eax,0xffffffff
0862  0F 84 62 01 00 00			je		L$104
0868  83 7C 24 58 00			cmp		dword ptr 0x58[esp],0x00000000
086D  75 1E				jne		L$92
086F  8A 44 24 64			mov		al,byte ptr 0x64[esp]
0873  FE C0				inc		al
0875  25 FF 00 00 00			and		eax,0x000000ff
087A  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0880  24 20				and		al,0x20
0882  25 FF 00 00 00			and		eax,0x000000ff
0887  0F 84 2F 01 00 00			je		L$103
088D				L$92:
088D  47				inc		edi
088E				L$93:
088E  8A 44 24 64			mov		al,byte ptr 0x64[esp]
0892  FE C0				inc		al
0894  25 FF 00 00 00			and		eax,0x000000ff
0899  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
089F  24 20				and		al,0x20
08A1  25 FF 00 00 00			and		eax,0x000000ff
08A6  74 1A				je		L$94
08A8  8A 44 24 64			mov		al,byte ptr 0x64[esp]
08AC  56				push		esi
08AD  47				inc		edi
08AE  88 03				mov		byte ptr [ebx],al
08B0  E8 00 00 00 00			call		cgetw
08B5  83 C4 04				add		esp,0x00000004
08B8  43				inc		ebx
08B9  89 44 24 64			mov		dword ptr 0x64[esp],eax
08BD  83 F8 FF				cmp		eax,0xffffffff
08C0  75 CC				jne		L$93
08C2				L$94:
08C2  F6 46 10 10			test		byte ptr 0x10[esi],0x10
08C6  74 39				je		L$97
08C8  31 D2				xor		edx,edx
08CA  89 D9				mov		ecx,ebx
08CC  89 54 24 60			mov		dword ptr 0x60[esp],edx
08D0				L$95:
08D0  49				dec		ecx
08D1  31 C0				xor		eax,eax
08D3  8A 01				mov		al,byte ptr [ecx]
08D5  83 F8 2E				cmp		eax,0x0000002e
08D8  74 1E				je		L$96
08DA  2C 30				sub		al,0x30
08DC  C7 44 24 68 0A 00 00 00		mov		dword ptr 0x68[esp],0x0000000a
08E4  88 44 24 62			mov		byte ptr 0x62[esp],al
08E8  31 D2				xor		edx,edx
08EA  8B 44 24 60			mov		eax,dword ptr 0x60[esp]
08EE  F7 74 24 68			div		dword ptr 0x68[esp]
08F2  89 44 24 60			mov		dword ptr 0x60[esp],eax
08F6  EB D8				jmp		L$95
08F8				L$96:
08F8  8B 44 24 60			mov		eax,dword ptr 0x60[esp]
08FC  66 89 44 24 5C			mov		word ptr 0x5c[esp],ax
0901				L$97:
0901  83 7C 24 64 FF			cmp		dword ptr 0x64[esp],0xffffffff
0906  0F 84 BE 00 00 00			je		L$104
090C				L$98:
090C  F6 46 10 10			test		byte ptr 0x10[esi],0x10
0910  0F 85 A6 00 00 00			jne		L$103
0916  8B 44 24 64			mov		eax,dword ptr 0x64[esp]
091A  83 F8 65				cmp		eax,0x00000065
091D  74 09				je		L$99
091F  83 F8 45				cmp		eax,0x00000045
0922  0F 85 94 00 00 00			jne		L$103
0928				L$99:
0928  8A 44 24 64			mov		al,byte ptr 0x64[esp]
092C  56				push		esi
092D  47				inc		edi
092E  88 03				mov		byte ptr [ebx],al
0930  E8 00 00 00 00			call		cgetw
0935  83 C4 04				add		esp,0x00000004
0938  43				inc		ebx
0939  89 44 24 64			mov		dword ptr 0x64[esp],eax
093D  83 F8 FF				cmp		eax,0xffffffff
0940  0F 84 84 00 00 00			je		L$104
0946  83 F8 2B				cmp		eax,0x0000002b
0949  74 05				je		L$100
094B  83 F8 2D				cmp		eax,0x0000002d
094E  75 1A				jne		L$101
0950				L$100:
0950  8A 44 24 64			mov		al,byte ptr 0x64[esp]
0954  56				push		esi
0955  47				inc		edi
0956  88 03				mov		byte ptr [ebx],al
0958  E8 00 00 00 00			call		cgetw
095D  83 C4 04				add		esp,0x00000004
0960  43				inc		ebx
0961  89 44 24 64			mov		dword ptr 0x64[esp],eax
0965  83 F8 FF				cmp		eax,0xffffffff
0968  74 60				je		L$104
096A				L$101:
096A  8A 44 24 64			mov		al,byte ptr 0x64[esp]
096E  FE C0				inc		al
0970  25 FF 00 00 00			and		eax,0x000000ff
0975  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
097B  24 20				and		al,0x20
097D  25 FF 00 00 00			and		eax,0x000000ff
0982  75 04				jne		L$102
0984  31 FF				xor		edi,edi
0986  EB 34				jmp		L$103
0988				L$102:
0988  8A 44 24 64			mov		al,byte ptr 0x64[esp]
098C  56				push		esi
098D  47				inc		edi
098E  88 03				mov		byte ptr [ebx],al
0990  E8 00 00 00 00			call		cgetw
0995  83 C4 04				add		esp,0x00000004
0998  43				inc		ebx
0999  89 44 24 64			mov		dword ptr 0x64[esp],eax
099D  83 F8 FF				cmp		eax,0xffffffff
09A0  74 28				je		L$104
09A2  8A 44 24 64			mov		al,byte ptr 0x64[esp]
09A6  FE C0				inc		al
09A8  25 FF 00 00 00			and		eax,0x000000ff
09AD  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
09B3  24 20				and		al,0x20
09B5  25 FF 00 00 00			and		eax,0x000000ff
09BA  75 CC				jne		L$102
09BC				L$103:
09BC  56				push		esi
09BD  8B 4C 24 68			mov		ecx,dword ptr 0x68[esp]
09C1  51				push		ecx
09C2  E8 00 00 00 00			call		uncget
09C7  83 C4 08				add		esp,0x00000008
09CA				L$104:
09CA  85 FF				test		edi,edi
09CC  0F 8E BE 00 00 00			jle		L$114
09D2  8A 46 10				mov		al,byte ptr 0x10[esi]
09D5  01 EF				add		edi,ebp
09D7  A8 01				test		al,0x01
09D9  0F 84 B1 00 00 00			je		L$114
09DF  C6 03 00				mov		byte ptr [ebx],0x00
09E2  F6 46 10 10			test		byte ptr 0x10[esi],0x10
09E6  74 10				je		L$105
09E8  31 C0				xor		eax,eax
09EA  8A 04 24				mov		al,byte ptr [esp]
09ED  83 F8 2D				cmp		eax,0x0000002d
09F0  75 19				jne		L$106
09F2  F7 5C 24 5C			neg		dword ptr 0x5c[esp]
09F6  EB 13				jmp		L$106
09F8				L$105:
09F8  8D 44 24 50			lea		eax,0x50[esp]
09FC  50				push		eax
09FD  8D 44 24 04			lea		eax,0x4[esp]
0A01  50				push		eax
0A02  FF 15 00 00 00 00			call		dword ptr __EFG_scanf
0A08  83 C4 08				add		esp,0x00000008
0A0B				L$106:
0A0B  8A 56 10				mov		dl,byte ptr 0x10[esi]
0A0E  F6 C2 04				test		dl,0x04
0A11  74 13				je		L$107
0A13  8B 84 24 88 00 00 00		mov		eax,dword ptr 0x88[esp]
0A1A  8B 08				mov		ecx,dword ptr [eax]
0A1C  83 C1 08				add		ecx,0x00000008
0A1F  89 08				mov		dword ptr [eax],ecx
0A21  C4 59 F8				les		ebx,fword ptr -0x8[ecx]
0A24  EB 31				jmp		L$109
0A26				L$107:
0A26  F6 C2 08				test		dl,0x08
0A29  74 17				je		L$108
0A2B  8B 84 24 88 00 00 00		mov		eax,dword ptr 0x88[esp]
0A32  8B 18				mov		ebx,dword ptr [eax]
0A34  83 C3 04				add		ebx,0x00000004
0A37  89 18				mov		dword ptr [eax],ebx
0A39  8C D8				mov		eax,ds
0A3B  8E C0				mov		es,eax
0A3D  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
0A40  EB 15				jmp		L$109
0A42				L$108:
0A42  8B 84 24 88 00 00 00		mov		eax,dword ptr 0x88[esp]
0A49  8B 10				mov		edx,dword ptr [eax]
0A4B  83 C2 04				add		edx,0x00000004
0A4E  89 10				mov		dword ptr [eax],edx
0A50  8C D8				mov		eax,ds
0A52  8E C0				mov		es,eax
0A54  8B 5A FC				mov		ebx,dword ptr -0x4[edx]
0A57				L$109:
0A57  8A 4E 10				mov		cl,byte ptr 0x10[esi]
0A5A  F6 C1 10				test		cl,0x10
0A5D  74 06				je		L$110
0A5F  8B 44 24 5C			mov		eax,dword ptr 0x5c[esp]
0A63  EB 28				jmp		L$113
0A65				L$110:
0A65  F6 C1 20				test		cl,0x20
0A68  75 05				jne		L$111
0A6A  F6 C1 40				test		cl,0x40
0A6D  74 11				je		L$112
0A6F				L$111:
0A6F  8B 44 24 50			mov		eax,dword ptr 0x50[esp]
0A73  26 89 03				mov		dword ptr es:[ebx],eax
0A76  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
0A7A  26 89 43 04			mov		dword ptr es:0x4[ebx],eax
0A7E  EB 10				jmp		L$114
0A80				L$112:
0A80  8B 44 24 50			mov		eax,dword ptr 0x50[esp]
0A84  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
0A88  E8 00 00 00 00			call		__FDFS
0A8D				L$113:
0A8D  26 89 03				mov		dword ptr es:[ebx],eax
0A90				L$114:
0A90  89 F8				mov		eax,edi
0A92  83 C4 6C				add		esp,0x0000006c
0A95  E9 82 F9 FF FF			jmp		L$52
0A9A				scan_int:
0A9A  53				push		ebx
0A9B  56				push		esi
0A9C  57				push		edi
0A9D  06				push		es
0A9E  55				push		ebp
0A9F  83 EC 0C				sub		esp,0x0000000c
0AA2  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0AA6  8B 6C 24 2C			mov		ebp,dword ptr 0x2c[esp]
0AAA  31 D2				xor		edx,edx
0AAC  31 FF				xor		edi,edi
0AAE  89 54 24 08			mov		dword ptr 0x8[esp],edx
0AB2  89 54 24 04			mov		dword ptr 0x4[esp],edx
0AB6				L$115:
0AB6  56				push		esi
0AB7  E8 00 00 00 00			call		cget
0ABC  89 C3				mov		ebx,eax
0ABE  88 DA				mov		dl,bl
0AC0  83 C4 04				add		esp,0x00000004
0AC3  FE C2				inc		dl
0AC5  81 E2 FF 00 00 00			and		edx,0x000000ff
0ACB  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
0AD1  80 E2 02				and		dl,0x02
0AD4  81 E2 FF 00 00 00			and		edx,0x000000ff
0ADA  74 06				je		L$116
0ADC  FF 44 24 04			inc		dword ptr 0x4[esp]
0AE0  EB D4				jmp		L$115
0AE2				L$116:
0AE2  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0AE6  0F 85 57 01 00 00			jne		L$129
0AEC  8B 56 0C				mov		edx,dword ptr 0xc[esi]
0AEF  8D 4A FF				lea		ecx,-0x1[edx]
0AF2  89 4E 0C				mov		dword ptr 0xc[esi],ecx
0AF5  85 D2				test		edx,edx
0AF7  0F 84 3C 01 00 00			je		L$128
0AFD  BA 2B 00 00 00			mov		edx,0x0000002b
0B02  8B 4C 24 30			mov		ecx,dword ptr 0x30[esp]
0B06  89 14 24				mov		dword ptr [esp],edx
0B09  85 C9				test		ecx,ecx
0B0B  74 2A				je		L$118
0B0D  39 D0				cmp		eax,edx
0B0F  74 05				je		L$117
0B11  83 F8 2D				cmp		eax,0x0000002d
0B14  75 21				jne		L$118
0B16				L$117:
0B16  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0B1A  56				push		esi
0B1B  40				inc		eax
0B1C  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
0B20  89 44 24 08			mov		dword ptr 0x8[esp],eax
0B24  E8 00 00 00 00			call		cgetw
0B29  83 C4 04				add		esp,0x00000004
0B2C  89 C3				mov		ebx,eax
0B2E  83 F8 FF				cmp		eax,0xffffffff
0B31  0F 84 0C 01 00 00			je		L$129
0B37				L$118:
0B37  85 ED				test		ebp,ebp
0B39  75 5E				jne		L$122
0B3B  83 FB 30				cmp		ebx,0x00000030
0B3E  75 52				jne		L$121
0B40  56				push		esi
0B41  BF 01 00 00 00			mov		edi,0x00000001
0B46  E8 00 00 00 00			call		cgetw
0B4B  83 C4 04				add		esp,0x00000004
0B4E  89 C3				mov		ebx,eax
0B50  83 F8 FF				cmp		eax,0xffffffff
0B53  0F 84 EA 00 00 00			je		L$129
0B59  83 F8 78				cmp		eax,0x00000078
0B5C  74 05				je		L$119
0B5E  83 F8 58				cmp		eax,0x00000058
0B61  75 28				jne		L$120
0B63				L$119:
0B63  56				push		esi
0B64  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0B68  E8 00 00 00 00			call		cgetw
0B6D  83 C3 02				add		ebx,0x00000002
0B70  31 FF				xor		edi,edi
0B72  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
0B76  83 C4 04				add		esp,0x00000004
0B79  89 C3				mov		ebx,eax
0B7B  83 F8 FF				cmp		eax,0xffffffff
0B7E  0F 84 BF 00 00 00			je		L$129
0B84  BD 10 00 00 00			mov		ebp,0x00000010
0B89  EB 58				jmp		L$125
0B8B				L$120:
0B8B  BD 08 00 00 00			mov		ebp,0x00000008
0B90  EB 51				jmp		L$125
0B92				L$121:
0B92  BD 0A 00 00 00			mov		ebp,0x0000000a
0B97  EB 4A				jmp		L$125
0B99				L$122:
0B99  83 FD 10				cmp		ebp,0x00000010
0B9C  75 45				jne		L$125
0B9E  83 FB 30				cmp		ebx,0x00000030
0BA1  75 40				jne		L$125
0BA3  56				push		esi
0BA4  BF 01 00 00 00			mov		edi,0x00000001
0BA9  E8 00 00 00 00			call		cgetw
0BAE  83 C4 04				add		esp,0x00000004
0BB1  89 C3				mov		ebx,eax
0BB3  83 F8 FF				cmp		eax,0xffffffff
0BB6  0F 84 87 00 00 00			je		L$129
0BBC  83 F8 78				cmp		eax,0x00000078
0BBF  74 05				je		L$123
0BC1  83 F8 58				cmp		eax,0x00000058
0BC4  75 1D				jne		L$125
0BC6				L$123:
0BC6  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0BCA  56				push		esi
0BCB  83 C2 02				add		edx,0x00000002
0BCE  31 FF				xor		edi,edi
0BD0  89 54 24 08			mov		dword ptr 0x8[esp],edx
0BD4				L$124:
0BD4  E8 00 00 00 00			call		cgetw
0BD9  83 C4 04				add		esp,0x00000004
0BDC  89 C3				mov		ebx,eax
0BDE  83 F8 FF				cmp		eax,0xffffffff
0BE1  74 60				je		L$129
0BE3				L$125:
0BE3  53				push		ebx
0BE4  E8 00 00 00 00			call		radix_value
0BE9  83 C4 04				add		esp,0x00000004
0BEC  39 E8				cmp		eax,ebp
0BEE  7D 11				jge		L$126
0BF0  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0BF4  0F AF D5				imul		edx,ebp
0BF7  56				push		esi
0BF8  01 C2				add		edx,eax
0BFA  47				inc		edi
0BFB  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0BFF  EB D3				jmp		L$124
0C01				L$126:
0C01  83 FB 3A				cmp		ebx,0x0000003a
0C04  75 33				jne		L$128
0C06  F6 46 10 80			test		byte ptr 0x10[esi],0x80
0C0A  74 2D				je		L$128
0C0C				L$127:
0C0C  56				push		esi
0C0D  47				inc		edi
0C0E  E8 00 00 00 00			call		cgetw
0C13  83 C4 04				add		esp,0x00000004
0C16  89 C3				mov		ebx,eax
0C18  83 F8 FF				cmp		eax,0xffffffff
0C1B  74 26				je		L$129
0C1D  50				push		eax
0C1E  E8 00 00 00 00			call		radix_value
0C23  83 C4 04				add		esp,0x00000004
0C26  39 E8				cmp		eax,ebp
0C28  7D 0F				jge		L$128
0C2A  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0C2E  0F AF D5				imul		edx,ebp
0C31  01 C2				add		edx,eax
0C33  89 54 24 08			mov		dword ptr 0x8[esp],edx
0C37  EB D3				jmp		L$127
0C39				L$128:
0C39  56				push		esi
0C3A  53				push		ebx
0C3B  E8 00 00 00 00			call		uncget
0C40  83 C4 08				add		esp,0x00000008
0C43				L$129:
0C43  83 3C 24 2D			cmp		dword ptr [esp],0x0000002d
0C47  75 04				jne		L$130
0C49  F7 5C 24 08			neg		dword ptr 0x8[esp]
0C4D				L$130:
0C4D  85 FF				test		edi,edi
0C4F  0F 8E 6C 00 00 00			jle		L$135
0C55  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0C59  8A 5E 10				mov		bl,byte ptr 0x10[esi]
0C5C  01 C7				add		edi,eax
0C5E  F6 C3 01				test		bl,0x01
0C61  74 5E				je		L$135
0C63  F6 C3 04				test		bl,0x04
0C66  74 10				je		L$131
0C68  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0C6C  8B 08				mov		ecx,dword ptr [eax]
0C6E  83 C1 08				add		ecx,0x00000008
0C71  89 08				mov		dword ptr [eax],ecx
0C73  C4 41 F8				les		eax,fword ptr -0x8[ecx]
0C76  EB 2D				jmp		L$133
0C78				L$131:
0C78  F6 C3 08				test		bl,0x08
0C7B  74 14				je		L$132
0C7D  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0C81  8B 18				mov		ebx,dword ptr [eax]
0C83  83 C3 04				add		ebx,0x00000004
0C86  8C DA				mov		edx,ds
0C88  89 18				mov		dword ptr [eax],ebx
0C8A  8E C2				mov		es,edx
0C8C  8B 43 FC				mov		eax,dword ptr -0x4[ebx]
0C8F  EB 14				jmp		L$133
0C91				L$132:
0C91  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0C95  8B 10				mov		edx,dword ptr [eax]
0C97  83 C2 04				add		edx,0x00000004
0C9A  89 10				mov		dword ptr [eax],edx
0C9C  89 D0				mov		eax,edx
0C9E  8C DA				mov		edx,ds
0CA0  8E C2				mov		es,edx
0CA2  8B 40 FC				mov		eax,dword ptr -0x4[eax]
0CA5				L$133:
0CA5  8A 6E 10				mov		ch,byte ptr 0x10[esi]
0CA8  F6 C5 10				test		ch,0x10
0CAB  74 0A				je		L$134
0CAD  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0CB1  66 26 89 10			mov		word ptr es:[eax],dx
0CB5  EB 0A				jmp		L$135
0CB7				L$134:
0CB7  F6 C5 20				test		ch,0x20
0CBA  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0CBE  26 89 10				mov		dword ptr es:[eax],edx
0CC1				L$135:
0CC1  89 F8				mov		eax,edi
0CC3  83 C4 0C				add		esp,0x0000000c
0CC6  E9 51 F7 FF FF			jmp		L$52
0CCB				radix_value:
0CCB  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0CCF  83 F8 30				cmp		eax,0x00000030
0CD2  7C 09				jl		L$136
0CD4  83 F8 39				cmp		eax,0x00000039
0CD7  7F 04				jg		L$136
0CD9  83 E8 30				sub		eax,0x00000030
0CDC  C3				ret		
0CDD				L$136:
0CDD  50				push		eax
0CDE  E8 00 00 00 00			call		tolower
0CE3  83 C4 04				add		esp,0x00000004
0CE6  83 F8 61				cmp		eax,0x00000061
0CE9  7C 09				jl		L$137
0CEB  83 F8 66				cmp		eax,0x00000066
0CEE  7F 04				jg		L$137
0CF0  83 E8 57				sub		eax,0x00000057
0CF3  C3				ret		
0CF4				L$137:
0CF4  B8 10 00 00 00			mov		eax,0x00000010
0CF9  C3				ret		
0CFA				cgetw:
0CFA  53				push		ebx
0CFB  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0CFF  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
0D02  8D 50 FF				lea		edx,-0x1[eax]
0D05  89 53 0C				mov		dword ptr 0xc[ebx],edx
0D08  85 C0				test		eax,eax
0D0A  74 11				je		L$138
0D0C  53				push		ebx
0D0D  E8 00 00 00 00			call		cget
0D12  8A 53 10				mov		dl,byte ptr 0x10[ebx]
0D15  83 C4 04				add		esp,0x00000004
0D18  F6 C2 02				test		dl,0x02
0D1B  74 05				je		L$139
0D1D				L$138:
0D1D  B8 FF FF FF FF			mov		eax,0xffffffff
0D22				L$139:
0D22  5B				pop		ebx
0D23  C3				ret		

Routine Size: 3336 bytes,    Routine Base: _TEXT + 001C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000				lst_mask:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

