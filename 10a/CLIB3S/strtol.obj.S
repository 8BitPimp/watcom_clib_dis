Module: strtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001BF bytes
0000				_stol:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
000B  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
000F  85 ED				test		ebp,ebp
0011  74 07				je		L$1
0013  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0017  89 45 00				mov		dword ptr [ebp],eax
001A				L$1:
001A  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
001E				L$2:
001E  8A 03				mov		al,byte ptr [ebx]
0020  FE C0				inc		al
0022  25 FF 00 00 00			and		eax,0x000000ff
0027  F6 80 00 00 00 00 02		test		byte ptr _IsTable[eax],0x02
002E  74 03				je		L$3
0030  43				inc		ebx
0031  EB EB				jmp		L$2
0033				L$3:
0033  8A 03				mov		al,byte ptr [ebx]
0035  88 44 24 08			mov		byte ptr 0x8[esp],al
0039  3C 2B				cmp		al,0x2b
003B  74 04				je		L$4
003D  3C 2D				cmp		al,0x2d
003F  75 01				jne		L$5
0041				L$4:
0041  43				inc		ebx
0042				L$5:
0042  85 FF				test		edi,edi
0044  75 28				jne		L$9
0046  80 3B 30				cmp		byte ptr [ebx],0x30
0049  75 12				jne		L$7
004B  8A 43 01				mov		al,byte ptr 0x1[ebx]
004E  3C 78				cmp		al,0x78
0050  74 04				je		L$6
0052  3C 58				cmp		al,0x58
0054  75 07				jne		L$7
0056				L$6:
0056  BF 10 00 00 00			mov		edi,0x00000010
005B  EB 11				jmp		L$9
005D				L$7:
005D  80 3B 30				cmp		byte ptr [ebx],0x30
0060  75 07				jne		L$8
0062  BF 08 00 00 00			mov		edi,0x00000008
0067  EB 05				jmp		L$9
0069				L$8:
0069  BF 0A 00 00 00			mov		edi,0x0000000a
006E				L$9:
006E  83 FF 02				cmp		edi,0x00000002
0071  7C 05				jl		L$10
0073  83 FF 24				cmp		edi,0x00000024
0076  7E 11				jle		L$11
0078				L$10:
0078  6A 0D				push		0x0000000d
007A  E8 00 00 00 00			call		__set_errno
007F  83 C4 04				add		esp,0x00000004
0082  31 C0				xor		eax,eax
0084  E9 B5 00 00 00			jmp		L$25
0089				L$11:
0089  83 FF 10				cmp		edi,0x00000010
008C  75 15				jne		L$13
008E  80 3B 30				cmp		byte ptr [ebx],0x30
0091  75 10				jne		L$13
0093  8A 4B 01				mov		cl,byte ptr 0x1[ebx]
0096  80 F9 78				cmp		cl,0x78
0099  74 05				je		L$12
009B  80 F9 58				cmp		cl,0x58
009E  75 03				jne		L$13
00A0				L$12:
00A0  83 C3 02				add		ebx,0x00000002
00A3				L$13:
00A3  89 1C 24				mov		dword ptr [esp],ebx
00A6  30 C0				xor		al,al
00A8  31 F6				xor		esi,esi
00AA  88 44 24 04			mov		byte ptr 0x4[esp],al
00AE				L$14:
00AE  31 C0				xor		eax,eax
00B0  8A 03				mov		al,byte ptr [ebx]
00B2  50				push		eax
00B3  E8 00 00 00 00			call		radix_value
00B8  83 C4 04				add		esp,0x00000004
00BB  39 F8				cmp		eax,edi
00BD  7D 13				jge		L$16
00BF  89 F2				mov		edx,esi
00C1  0F AF F7				imul		esi,edi
00C4  01 C6				add		esi,eax
00C6  39 D6				cmp		esi,edx
00C8  73 05				jae		L$15
00CA  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
00CF				L$15:
00CF  43				inc		ebx
00D0  EB DC				jmp		L$14
00D2				L$16:
00D2  3B 1C 24				cmp		ebx,dword ptr [esp]
00D5  75 04				jne		L$17
00D7  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
00DB				L$17:
00DB  85 ED				test		ebp,ebp
00DD  74 03				je		L$18
00DF  89 5D 00				mov		dword ptr [ebp],ebx
00E2				L$18:
00E2  83 7C 24 2C 01			cmp		dword ptr 0x2c[esp],0x00000001
00E7  75 16				jne		L$20
00E9  81 FE 00 00 00 80			cmp		esi,0x80000000
00EF  72 0E				jb		L$20
00F1  75 07				jne		L$19
00F3  80 7C 24 08 2D			cmp		byte ptr 0x8[esp],0x2d
00F8  74 05				je		L$20
00FA				L$19:
00FA  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
00FF				L$20:
00FF  80 7C 24 04 00			cmp		byte ptr 0x4[esp],0x00
0104  74 2D				je		L$23
0106  6A 0E				push		0x0000000e
0108  E8 00 00 00 00			call		__set_errno
010D  83 C4 04				add		esp,0x00000004
0110  83 7C 24 2C 00			cmp		dword ptr 0x2c[esp],0x00000000
0115  75 07				jne		L$21
0117  B8 FF FF FF FF			mov		eax,0xffffffff
011C  EB 20				jmp		L$25
011E				L$21:
011E  80 7C 24 08 2D			cmp		byte ptr 0x8[esp],0x2d
0123  75 07				jne		L$22
0125  B8 00 00 00 80			mov		eax,0x80000000
012A  EB 12				jmp		L$25
012C				L$22:
012C  B8 FF FF FF 7F			mov		eax,0x7fffffff
0131  EB 0B				jmp		L$25
0133				L$23:
0133  80 7C 24 08 2D			cmp		byte ptr 0x8[esp],0x2d
0138  75 02				jne		L$24
013A  F7 DE				neg		esi
013C				L$24:
013C  89 F0				mov		eax,esi
013E				L$25:
013E  83 C4 0C				add		esp,0x0000000c
0141  5D				pop		ebp
0142  5F				pop		edi
0143  5E				pop		esi
0144  5B				pop		ebx
0145  C3				ret		

Routine Size: 326 bytes,    Routine Base: _TEXT + 0000

0146				strtoul:
0146  53				push		ebx
0147  6A 00				push		0x00000000
0149				L$26:
0149  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
014D  52				push		edx
014E  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0152  53				push		ebx
0153  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0157  51				push		ecx
0158  E8 00 00 00 00			call		_stol
015D  83 C4 10				add		esp,0x00000010
0160  5B				pop		ebx
0161  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0146

0162				strtol:
0162  53				push		ebx
0163  6A 01				push		0x00000001
0165  EB E2				jmp		L$26
0167				radix_value:
0167  8A 54 24 04			mov		dl,byte ptr 0x4[esp]
016B  80 FA 30				cmp		dl,0x30
016E  72 0D				jb		L$27
0170  80 FA 39				cmp		dl,0x39
0173  77 08				ja		L$27
0175  31 C0				xor		eax,eax
0177  88 D0				mov		al,dl
0179  83 E8 30				sub		eax,0x00000030
017C  C3				ret		
017D				L$27:
017D  31 C0				xor		eax,eax
017F  88 D0				mov		al,dl
0181  50				push		eax
0182  E8 00 00 00 00			call		tolower
0187  83 C4 04				add		esp,0x00000004
018A  88 C2				mov		dl,al
018C  3C 61				cmp		al,0x61
018E  72 0D				jb		L$28
0190  3C 69				cmp		al,0x69
0192  77 09				ja		L$28
0194  25 FF 00 00 00			and		eax,0x000000ff
0199  83 E8 57				sub		eax,0x00000057
019C  C3				ret		
019D				L$28:
019D  80 FA 6A				cmp		dl,0x6a
01A0  72 0D				jb		L$30
01A2  80 FA 72				cmp		dl,0x72
01A5  77 08				ja		L$30
01A7				L$29:
01A7  31 C0				xor		eax,eax
01A9  88 D0				mov		al,dl
01AB  83 E8 57				sub		eax,0x00000057
01AE  C3				ret		
01AF				L$30:
01AF  80 FA 73				cmp		dl,0x73
01B2  72 05				jb		L$31
01B4  80 FA 7A				cmp		dl,0x7a
01B7  76 EE				jbe		L$29
01B9				L$31:
01B9  B8 25 00 00 00			mov		eax,0x00000025
01BE  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 0162

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

