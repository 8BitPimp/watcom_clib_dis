Module: timeutil
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000042B bytes
0000				__leapyear_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C3				mov		ebx,eax
0005  F6 C3 03				test		bl,0x03
0008  75 2B				jne		L$3
000A  89 C2				mov		edx,eax
000C  B9 64 00 00 00			mov		ecx,0x00000064
0011  C1 FA 1F				sar		edx,0x1f
0014  F7 F9				idiv		ecx
0016  85 D2				test		edx,edx
0018  74 09				je		L$2
001A				L$1:
001A  B8 01 00 00 00			mov		eax,0x00000001
001F  5A				pop		edx
0020  59				pop		ecx
0021  5B				pop		ebx
0022  C3				ret		
0023				L$2:
0023  B9 90 01 00 00			mov		ecx,0x00000190
0028  89 DA				mov		edx,ebx
002A  89 D8				mov		eax,ebx
002C  C1 FA 1F				sar		edx,0x1f
002F  F7 F9				idiv		ecx
0031  85 D2				test		edx,edx
0033  74 E5				je		L$1
0035				L$3:
0035  31 C0				xor		eax,eax
0037  5A				pop		edx
0038  59				pop		ecx
0039  5B				pop		ebx
003A  C3				ret		
003B				calc_yday_:
003B  53				push		ebx
003C  51				push		ecx
003D  56				push		esi
003E  57				push		edi
003F  55				push		ebp
0040  83 EC 24				sub		esp,0x00000024
0043  89 C3				mov		ebx,eax
0045  8B 48 20				mov		ecx,dword ptr 0x20[eax]
0048  85 C9				test		ecx,ecx
004A  0F 85 B8 00 00 00			jne		L$9
0050  8D 82 6C 07 00 00			lea		eax,0x76c[edx]
0056  E8 00 00 00 00			call		__leapyear_
005B  85 C0				test		eax,eax
005D  74 13				je		L$4
005F  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0062  8B 34 45 00 00 00 00		mov		esi,dword ptr ___dilyr[eax*2]
0069  8B 04 45 FE FF FF FF		mov		eax,dword ptr ___dilyr-0x2[eax*2]
0070  EB 11				jmp		L$5
0072				L$4:
0072  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0075  8B 34 45 00 00 00 00		mov		esi,dword ptr ___diyr[eax*2]
007C  8B 04 45 FE FF FF FF		mov		eax,dword ptr ___diyr-0x2[eax*2]
0083				L$5:
0083  C1 FE 10				sar		esi,0x10
0086  C1 F8 10				sar		eax,0x10
0089  29 C6				sub		esi,eax
008B  31 FF				xor		edi,edi
008D  B9 01 00 00 00			mov		ecx,0x00000001
0092  89 3C 24				mov		dword ptr [esp],edi
0095  89 7C 24 04			mov		dword ptr 0x4[esp],edi
0099  89 7C 24 08			mov		dword ptr 0x8[esp],edi
009D  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
00A1  8B 43 10				mov		eax,dword ptr 0x10[ebx]
00A4  89 44 24 10			mov		dword ptr 0x10[esp],eax
00A8  89 54 24 14			mov		dword ptr 0x14[esp],edx
00AC  89 E0				mov		eax,esp
00AE  89 7C 24 20			mov		dword ptr 0x20[esp],edi
00B2  E8 00 00 00 00			call		mktime_
00B7  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
00BB  8B 53 18				mov		edx,dword ptr 0x18[ebx]
00BE  29 EA				sub		edx,ebp
00C0  83 C2 07				add		edx,0x00000007
00C3  B9 07 00 00 00			mov		ecx,0x00000007
00C8  89 D0				mov		eax,edx
00CA  C1 FA 1F				sar		edx,0x1f
00CD  F7 F9				idiv		ecx
00CF  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
00D2  83 F8 05				cmp		eax,0x00000005
00D5  75 1F				jne		L$7
00D7  8D 48 FF				lea		ecx,-0x1[eax]
00DA  89 CF				mov		edi,ecx
00DC  C1 E7 03				shl		edi,0x03
00DF  8D 42 01				lea		eax,0x1[edx]
00E2  29 CF				sub		edi,ecx
00E4  01 F8				add		eax,edi
00E6  39 F0				cmp		eax,esi
00E8  7E 08				jle		L$6
00EA  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
00ED  83 E8 02				sub		eax,0x00000002
00F0  EB 05				jmp		L$8
00F2				L$6:
00F2  89 C8				mov		eax,ecx
00F4  EB 01				jmp		L$8
00F6				L$7:
00F6  48				dec		eax
00F7				L$8:
00F7  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
00FB  01 D3				add		ebx,edx
00FD  89 C2				mov		edx,eax
00FF  C1 E0 03				shl		eax,0x03
0102  29 D0				sub		eax,edx
0104  01 D8				add		eax,ebx
0106  EB 0F				jmp		L$11
0108				L$9:
0108  83 F9 01				cmp		ecx,0x00000001
010B  75 07				jne		L$10
010D  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0110  29 C8				sub		eax,ecx
0112  EB 03				jmp		L$11
0114				L$10:
0114  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0117				L$11:
0117  83 C4 24				add		esp,0x00000024
011A  5D				pop		ebp
011B  5F				pop		edi
011C  5E				pop		esi
011D  59				pop		ecx
011E  5B				pop		ebx
011F  C3				ret		
0120				check_order_:
0120  51				push		ecx
0121  56				push		esi
0122  57				push		edi
0123  89 D6				mov		esi,edx
0125  89 DA				mov		edx,ebx
0127  E8 00 00 00 00			call		calc_yday_
012C  89 C7				mov		edi,eax
012E  89 DA				mov		edx,ebx
0130  89 F0				mov		eax,esi
0132  31 C9				xor		ecx,ecx
0134  E8 00 00 00 00			call		calc_yday_
0139  39 C7				cmp		edi,eax
013B  7E 05				jle		L$12
013D  B9 01 00 00 00			mov		ecx,0x00000001
0142				L$12:
0142  89 C8				mov		eax,ecx
0144  5F				pop		edi
0145  5E				pop		esi
0146  59				pop		ecx
0147  C3				ret		

Routine Size: 328 bytes,    Routine Base: _TEXT + 0000

0148				__isindst_:
0148  53				push		ebx
0149  51				push		ecx
014A  52				push		edx
014B  56				push		esi
014C  57				push		edi
014D  55				push		ebp
014E  83 EC 1C				sub		esp,0x0000001c
0151  89 C1				mov		ecx,eax
0153  A1 04 00 00 00			mov		eax,dword ptr _tzname+0x4
0158  8A 10				mov		dl,byte ptr [eax]
015A  31 FF				xor		edi,edi
015C  84 D2				test		dl,dl
015E  0F 84 88 02 00 00			je		L$36
0164  B8 00 00 00 00			mov		eax,offset ___start_dst
0169  BA 00 00 00 00			mov		edx,offset ___end_dst
016E  8B 59 14				mov		ebx,dword ptr 0x14[ecx]
0171  E8 00 00 00 00			call		check_order_
0176  89 44 24 10			mov		dword ptr 0x10[esp],eax
017A  85 C0				test		eax,eax
017C  74 0C				je		L$13
017E  BB 00 00 00 00			mov		ebx,offset ___end_dst
0183  BE 00 00 00 00			mov		esi,offset ___start_dst
0188  EB 0A				jmp		L$14
018A				L$13:
018A  BB 00 00 00 00			mov		ebx,offset ___start_dst
018F  BE 00 00 00 00			mov		esi,offset ___end_dst
0194				L$14:
0194  8B 41 14				mov		eax,dword ptr 0x14[ecx]
0197  05 6C 07 00 00			add		eax,0x0000076c
019C  8B 69 10				mov		ebp,dword ptr 0x10[ecx]
019F  E8 00 00 00 00			call		__leapyear_
01A4  89 C2				mov		edx,eax
01A6  8D 44 2D 00			lea		eax,[ebp+ebp]
01AA  85 D2				test		edx,edx
01AC  74 0E				je		L$15
01AE  8B 90 00 00 00 00			mov		edx,dword ptr ___dilyr[eax]
01B4  8B 80 FE FF FF FF			mov		eax,dword ptr ___dilyr-0x2[eax]
01BA  EB 0C				jmp		L$16
01BC				L$15:
01BC  8B 90 00 00 00 00			mov		edx,dword ptr ___diyr[eax]
01C2  8B 80 FE FF FF FF			mov		eax,dword ptr ___diyr-0x2[eax]
01C8				L$16:
01C8  C1 FA 10				sar		edx,0x10
01CB  C1 F8 10				sar		eax,0x10
01CE  29 C2				sub		edx,eax
01D0  89 54 24 0C			mov		dword ptr 0xc[esp],edx
01D4  31 D2				xor		edx,edx
01D6  8B 43 20				mov		eax,dword ptr 0x20[ebx]
01D9  89 54 24 14			mov		dword ptr 0x14[esp],edx
01DD  85 C0				test		eax,eax
01DF  0F 85 B3 00 00 00			jne		L$19
01E5  8B 43 10				mov		eax,dword ptr 0x10[ebx]
01E8  39 C5				cmp		ebp,eax
01EA  7E 0A				jle		L$17
01EC  BF 01 00 00 00			mov		edi,0x00000001
01F1  E9 DB 00 00 00			jmp		L$23
01F6				L$17:
01F6  0F 85 D5 00 00 00			jne		L$23
01FC  8B 51 18				mov		edx,dword ptr 0x18[ecx]
01FF  8B 43 18				mov		eax,dword ptr 0x18[ebx]
0202  83 C2 07				add		edx,0x00000007
0205  29 C2				sub		edx,eax
0207  C7 44 24 18 07 00 00 00		mov		dword ptr 0x18[esp],0x00000007
020F  89 D0				mov		eax,edx
0211  C1 FA 1F				sar		edx,0x1f
0214  F7 7C 24 18			idiv		dword ptr 0x18[esp]
0218  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
021B  29 D0				sub		eax,edx
021D  8B 51 18				mov		edx,dword ptr 0x18[ecx]
0220  89 04 24				mov		dword ptr [esp],eax
0223  83 C2 06				add		edx,0x00000006
0226  2B 53 18				sub		edx,dword ptr 0x18[ebx]
0229  C7 44 24 18 07 00 00 00		mov		dword ptr 0x18[esp],0x00000007
0231  89 D0				mov		eax,edx
0233  C1 FA 1F				sar		edx,0x1f
0236  F7 7C 24 18			idiv		dword ptr 0x18[esp]
023A  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
023D  48				dec		eax
023E  29 D0				sub		eax,edx
0240  8B 53 0C				mov		edx,dword ptr 0xc[ebx]
0243  89 44 24 08			mov		dword ptr 0x8[esp],eax
0247  83 FA 05				cmp		edx,0x00000005
024A  75 25				jne		L$18
024C  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0250  8B 14 24				mov		edx,dword ptr [esp]
0253  83 E8 07				sub		eax,0x00000007
0256  39 D0				cmp		eax,edx
0258  0F 8D 73 00 00 00			jge		L$23
025E  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0262  BF 01 00 00 00			mov		edi,0x00000001
0267  39 D0				cmp		eax,edx
0269  0F 8C 62 00 00 00			jl		L$23
026F  EB 5C				jmp		L$22
0271				L$18:
0271  8D 42 FF				lea		eax,-0x1[edx]
0274  89 44 24 18			mov		dword ptr 0x18[esp],eax
0278  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
027C  C1 E0 03				shl		eax,0x03
027F  29 D0				sub		eax,edx
0281  8B 14 24				mov		edx,dword ptr [esp]
0284  40				inc		eax
0285  39 D0				cmp		eax,edx
0287  7F 48				jg		L$23
0289  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
028D  BF 01 00 00 00			mov		edi,0x00000001
0292  39 D0				cmp		eax,edx
0294  7E 3B				jle		L$23
0296  EB 35				jmp		L$22
0298				L$19:
0298  8B 53 1C				mov		edx,dword ptr 0x1c[ebx]
029B  83 F8 01				cmp		eax,0x00000001
029E  75 1F				jne		L$21
02A0  8B 41 14				mov		eax,dword ptr 0x14[ecx]
02A3  05 6C 07 00 00			add		eax,0x0000076c
02A8  E8 00 00 00 00			call		__leapyear_
02AD  85 C0				test		eax,eax
02AF  74 0D				je		L$20
02B1  A1 02 00 00 00			mov		eax,dword ptr ___diyr+0x2
02B6  C1 F8 10				sar		eax,0x10
02B9  39 C2				cmp		edx,eax
02BB  7E 01				jle		L$20
02BD  42				inc		edx
02BE				L$20:
02BE  4A				dec		edx
02BF				L$21:
02BF  8B 41 1C				mov		eax,dword ptr 0x1c[ecx]
02C2  39 C2				cmp		edx,eax
02C4  7F 0B				jg		L$23
02C6  BF 01 00 00 00			mov		edi,0x00000001
02CB  75 04				jne		L$23
02CD				L$22:
02CD  89 7C 24 14			mov		dword ptr 0x14[esp],edi
02D1				L$23:
02D1  83 7C 24 14 00			cmp		dword ptr 0x14[esp],0x00000000
02D6  74 11				je		L$24
02D8  89 C8				mov		eax,ecx
02DA  89 DA				mov		edx,ebx
02DC  E8 00 00 00 00			call		time_less_
02E1  85 C0				test		eax,eax
02E3  0F 94 C0				sete		al
02E6  0F B6 F8				movzx		edi,al
02E9				L$24:
02E9  85 FF				test		edi,edi
02EB  75 13				jne		L$25
02ED  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
02F1  85 F6				test		esi,esi
02F3  0F 84 F3 00 00 00			je		L$36
02F9  89 F7				mov		edi,esi
02FB  E9 EC 00 00 00			jmp		L$36
0300				L$25:
0300  8B 46 20				mov		eax,dword ptr 0x20[esi]
0303  31 DB				xor		ebx,ebx
0305  85 C0				test		eax,eax
0307  0F 85 89 00 00 00			jne		L$30
030D  8B 46 10				mov		eax,dword ptr 0x10[esi]
0310  39 C5				cmp		ebp,eax
0312  7E 07				jle		L$26
0314  31 FF				xor		edi,edi
0316  E9 B4 00 00 00			jmp		L$34
031B				L$26:
031B  0F 85 AE 00 00 00			jne		L$34
0321  8B 51 18				mov		edx,dword ptr 0x18[ecx]
0324  8B 6E 18				mov		ebp,dword ptr 0x18[esi]
0327  83 C2 07				add		edx,0x00000007
032A  29 EA				sub		edx,ebp
032C  BD 07 00 00 00			mov		ebp,0x00000007
0331  89 D0				mov		eax,edx
0333  C1 FA 1F				sar		edx,0x1f
0336  F7 FD				idiv		ebp
0338  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
033B  29 D0				sub		eax,edx
033D  8B 51 18				mov		edx,dword ptr 0x18[ecx]
0340  89 44 24 04			mov		dword ptr 0x4[esp],eax
0344  83 C2 06				add		edx,0x00000006
0347  8B 46 18				mov		eax,dword ptr 0x18[esi]
034A  29 C2				sub		edx,eax
034C  89 D0				mov		eax,edx
034E  C1 FA 1F				sar		edx,0x1f
0351  F7 FD				idiv		ebp
0353  8B 69 0C				mov		ebp,dword ptr 0xc[ecx]
0356  4D				dec		ebp
0357  29 D5				sub		ebp,edx
0359  8B 56 0C				mov		edx,dword ptr 0xc[esi]
035C  31 FF				xor		edi,edi
035E  83 FA 05				cmp		edx,0x00000005
0361  75 1C				jne		L$29
0363  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0367  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
036B  83 E8 07				sub		eax,0x00000007
036E  39 D0				cmp		eax,edx
0370  7C 07				jl		L$28
0372				L$27:
0372  BF 01 00 00 00			mov		edi,0x00000001
0377  EB 56				jmp		L$34
0379				L$28:
0379  39 C5				cmp		ebp,eax
037B  7F 52				jg		L$34
037D  EB 4B				jmp		L$33
037F				L$29:
037F  4A				dec		edx
0380  89 D0				mov		eax,edx
0382  C1 E0 03				shl		eax,0x03
0385  29 D0				sub		eax,edx
0387  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
038B  40				inc		eax
038C  39 D0				cmp		eax,edx
038E  7F E2				jg		L$27
0390  39 C5				cmp		ebp,eax
0392  7D 3B				jge		L$34
0394  EB 34				jmp		L$33
0396				L$30:
0396  8B 56 1C				mov		edx,dword ptr 0x1c[esi]
0399  83 F8 01				cmp		eax,0x00000001
039C  75 1F				jne		L$32
039E  8B 41 14				mov		eax,dword ptr 0x14[ecx]
03A1  05 6C 07 00 00			add		eax,0x0000076c
03A6  E8 00 00 00 00			call		__leapyear_
03AB  85 C0				test		eax,eax
03AD  74 0D				je		L$31
03AF  A1 02 00 00 00			mov		eax,dword ptr ___diyr+0x2
03B4  C1 F8 10				sar		eax,0x10
03B7  39 C2				cmp		edx,eax
03B9  7E 01				jle		L$31
03BB  42				inc		edx
03BC				L$31:
03BC  4A				dec		edx
03BD				L$32:
03BD  8B 41 1C				mov		eax,dword ptr 0x1c[ecx]
03C0  39 C2				cmp		edx,eax
03C2  7F 0B				jg		L$34
03C4  31 FF				xor		edi,edi
03C6  39 C2				cmp		edx,eax
03C8  75 05				jne		L$34
03CA				L$33:
03CA  BB 01 00 00 00			mov		ebx,0x00000001
03CF				L$34:
03CF  85 DB				test		ebx,ebx
03D1  74 0B				je		L$35
03D3  89 C8				mov		eax,ecx
03D5  89 F2				mov		edx,esi
03D7  E8 00 00 00 00			call		time_less_
03DC  89 C7				mov		edi,eax
03DE				L$35:
03DE  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
03E2  85 DB				test		ebx,ebx
03E4  74 06				je		L$36
03E6  89 D8				mov		eax,ebx
03E8  29 F8				sub		eax,edi
03EA  89 C7				mov		edi,eax
03EC				L$36:
03EC  89 F8				mov		eax,edi
03EE  89 79 20				mov		dword ptr 0x20[ecx],edi
03F1  83 C4 1C				add		esp,0x0000001c
03F4  5D				pop		ebp
03F5  5F				pop		edi
03F6  5E				pop		esi
03F7  5A				pop		edx
03F8  59				pop		ecx
03F9  5B				pop		ebx
03FA  C3				ret		
03FB				time_less_:
03FB  53				push		ebx
03FC  51				push		ecx
03FD  56				push		esi
03FE  55				push		ebp
03FF  8B 48 08				mov		ecx,dword ptr 0x8[eax]
0402  8B 72 08				mov		esi,dword ptr 0x8[edx]
0405  31 DB				xor		ebx,ebx
0407  39 F1				cmp		ecx,esi
0409  7C 14				jl		L$37
040B  75 17				jne		L$38
040D  8B 48 04				mov		ecx,dword ptr 0x4[eax]
0410  8B 6A 04				mov		ebp,dword ptr 0x4[edx]
0413  39 E9				cmp		ecx,ebp
0415  7C 08				jl		L$37
0417  75 0B				jne		L$38
0419  8B 00				mov		eax,dword ptr [eax]
041B  3B 02				cmp		eax,dword ptr [edx]
041D  7D 05				jge		L$38
041F				L$37:
041F  BB 01 00 00 00			mov		ebx,0x00000001
0424				L$38:
0424  89 D8				mov		eax,ebx
0426  5D				pop		ebp
0427  5E				pop		esi
0428  59				pop		ecx
0429  5B				pop		ebx
042A  C3				ret		

Routine Size: 739 bytes,    Routine Base: _TEXT + 0148

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000034 bytes
0000				___diyr:
0000  00 00 1F 00 3B 00 5A 00 78 00 97 00 B5 00 D4 00 ....;.Z.x.......
0010  F3 00 11 01 30 01 4E 01 6D 01                   ....0.N.m.
001A				___dilyr:
001A  00 00 1F 00 3C 00 5B 00 79 00 98 00 B6 00 D5 00 ....<.[.y.......
002A  F4 00 12 01 31 01 4F 01 6E 01                   ....1.O.n.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

