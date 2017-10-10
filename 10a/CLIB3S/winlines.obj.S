Module: winlines
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000007DE bytes
0000				createNewEntry:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0007  8B 43 53				mov		eax,dword ptr 0x53[ebx]
000A  03 43 57				add		eax,dword ptr 0x57[ebx]
000D  C6 40 09 00			mov		byte ptr 0x9[eax],0x00
0011  B8 0A 00 00 00			mov		eax,0x0000000a
0016  03 43 57				add		eax,dword ptr 0x57[ebx]
0019  50				push		eax
001A  E8 00 00 00 00			call		_MemAlloc
001F  89 C2				mov		edx,eax
0021  83 C4 04				add		esp,0x00000004
0024  89 C1				mov		ecx,eax
0026  8B 73 53				mov		esi,dword ptr 0x53[ebx]
0029  8D 78 09				lea		edi,0x9[eax]
002C  83 C6 09				add		esi,0x00000009
002F  C7 43 57 00 00 00 00		mov		dword ptr 0x57[ebx],0x00000000
0036  57				push		edi
0037				L$1:
0037  8A 06				mov		al,byte ptr [esi]
0039  88 07				mov		byte ptr [edi],al
003B  3C 00				cmp		al,0x00
003D  0F 84 10 00 00 00			je		L$2
0043  8A 46 01				mov		al,byte ptr 0x1[esi]
0046  83 C6 02				add		esi,0x00000002
0049  88 47 01				mov		byte ptr 0x1[edi],al
004C  83 C7 02				add		edi,0x00000002
004F  3C 00				cmp		al,0x00
0051  75 E4				jne		L$1
0053				L$2:
0053  5F				pop		edi
0054  8B 73 42				mov		esi,dword ptr 0x42[ebx]
0057  85 F6				test		esi,esi
0059  75 08				jne		L$3
005B  89 53 42				mov		dword ptr 0x42[ebx],edx
005E  89 53 3E				mov		dword ptr 0x3e[ebx],edx
0061  EB 0B				jmp		L$4
0063				L$3:
0063  89 16				mov		dword ptr [esi],edx
0065  8B 43 42				mov		eax,dword ptr 0x42[ebx]
0068  89 42 04				mov		dword ptr 0x4[edx],eax
006B  89 53 42				mov		dword ptr 0x42[ebx],edx
006E				L$4:
006E  89 C8				mov		eax,ecx
0070  5F				pop		edi
0071  5E				pop		esi
0072  5B				pop		ebx
0073  C3				ret		
0074				incrementLastLineNumber:
0074  53				push		ebx
0075  56				push		esi
0076  57				push		edi
0077  55				push		ebp
0078  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
007C  8B 53 46				mov		edx,dword ptr 0x46[ebx]
007F  42				inc		edx
0080  8B 0D 00 00 00 00			mov		ecx,dword ptr _AutoClearLines
0086  89 53 46				mov		dword ptr 0x46[ebx],edx
0089  39 CA				cmp		edx,ecx
008B  76 08				jbe		L$5
008D  53				push		ebx
008E  E8 00 00 00 00			call		_FreeAllLines
0093  EB 35				jmp		L$7
0095				L$5:
0095  89 D0				mov		eax,edx
0097  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
009A  8B 7B 24				mov		edi,dword ptr 0x24[ebx]
009D  29 F0				sub		eax,esi
009F  39 F8				cmp		eax,edi
00A1  7D 21				jge		L$6
00A3  8B 6B 4A				mov		ebp,dword ptr 0x4a[ebx]
00A6  8B 53 24				mov		edx,dword ptr 0x24[ebx]
00A9  45				inc		ebp
00AA  4A				dec		edx
00AB  89 6B 4A				mov		dword ptr 0x4a[ebx],ebp
00AE  39 D0				cmp		eax,edx
00B0  75 12				jne		L$6
00B2  8B 43 4E				mov		eax,dword ptr 0x4e[ebx]
00B5  6A 01				push		0x00000001
00B7  40				inc		eax
00B8  53				push		ebx
00B9  89 43 4E				mov		dword ptr 0x4e[ebx],eax
00BC  E8 00 00 00 00			call		_ShiftWindow
00C1  83 C4 08				add		esp,0x00000008
00C4				L$6:
00C4  53				push		ebx
00C5  E8 00 00 00 00			call		_PositionScrollThumb
00CA				L$7:
00CA  83 C4 04				add		esp,0x00000004
00CD  5D				pop		ebp
00CE  5F				pop		edi
00CF  5E				pop		esi
00D0  5B				pop		ebx
00D1  C3				ret		
00D2				replaceTail:
00D2  53				push		ebx
00D3  56				push		esi
00D4  57				push		edi
00D5  55				push		ebp
00D6  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
00DA  8B 43 53				mov		eax,dword ptr 0x53[ebx]
00DD  03 43 57				add		eax,dword ptr 0x57[ebx]
00E0  C6 40 09 00			mov		byte ptr 0x9[eax],0x00
00E4  8B 43 42				mov		eax,dword ptr 0x42[ebx]
00E7  50				push		eax
00E8  8B 68 04				mov		ebp,dword ptr 0x4[eax]
00EB  E8 00 00 00 00			call		_MemFree
00F0  B8 0A 00 00 00			mov		eax,0x0000000a
00F5  8B 4B 57				mov		ecx,dword ptr 0x57[ebx]
00F8  83 C4 04				add		esp,0x00000004
00FB  01 C8				add		eax,ecx
00FD  50				push		eax
00FE  E8 00 00 00 00			call		_MemAlloc
0103  83 C4 04				add		esp,0x00000004
0106  8B 73 53				mov		esi,dword ptr 0x53[ebx]
0109  8D 78 09				lea		edi,0x9[eax]
010C  83 C6 09				add		esi,0x00000009
010F  89 43 42				mov		dword ptr 0x42[ebx],eax
0112  57				push		edi
0113				L$8:
0113  8A 06				mov		al,byte ptr [esi]
0115  88 07				mov		byte ptr [edi],al
0117  3C 00				cmp		al,0x00
0119  0F 84 10 00 00 00			je		L$9
011F  8A 46 01				mov		al,byte ptr 0x1[esi]
0122  83 C6 02				add		esi,0x00000002
0125  88 47 01				mov		byte ptr 0x1[edi],al
0128  83 C7 02				add		edi,0x00000002
012B  3C 00				cmp		al,0x00
012D  75 E4				jne		L$8
012F				L$9:
012F  5F				pop		edi
0130  8B 43 42				mov		eax,dword ptr 0x42[ebx]
0133  89 68 04				mov		dword ptr 0x4[eax],ebp
0136  85 ED				test		ebp,ebp
0138  74 08				je		L$10
013A  8B 43 42				mov		eax,dword ptr 0x42[ebx]
013D  89 45 00				mov		dword ptr [ebp],eax
0140  EB 06				jmp		L$11
0142				L$10:
0142  8B 43 42				mov		eax,dword ptr 0x42[ebx]
0145  89 43 3E				mov		dword ptr 0x3e[ebx],eax
0148				L$11:
0148  8B 43 42				mov		eax,dword ptr 0x42[ebx]
014B  8B 6B 46				mov		ebp,dword ptr 0x46[ebx]
014E  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
0151  83 C0 09				add		eax,0x00000009
0154  29 F5				sub		ebp,esi
0156  50				push		eax
0157  45				inc		ebp
0158  55				push		ebp
0159  53				push		ebx
015A  E8 00 00 00 00			call		_DisplayLineInWindow
015F  83 C4 0C				add		esp,0x0000000c
0162  5D				pop		ebp
0163  5F				pop		edi
0164  5E				pop		esi
0165  5B				pop		ebx
0166  C3				ret		
0167				addBuff:
0167  53				push		ebx
0168  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
016C  53				push		ebx
016D  E8 00 00 00 00			call		createNewEntry
0172  83 C0 09				add		eax,0x00000009
0175  83 C4 04				add		esp,0x00000004
0178  C6 40 FF 01			mov		byte ptr -0x1[eax],0x01
017C  50				push		eax
017D  8B 53 4E				mov		edx,dword ptr 0x4e[ebx]
0180  8B 43 46				mov		eax,dword ptr 0x46[ebx]
0183  29 D0				sub		eax,edx
0185  40				inc		eax
0186  50				push		eax
0187  53				push		ebx
0188  E8 00 00 00 00			call		_DisplayLineInWindow
018D  83 C4 0C				add		esp,0x0000000c
0190  5B				pop		ebx
0191  C3				ret		
0192				updateBuff:
0192  53				push		ebx
0193  56				push		esi
0194  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0198  83 7B 3E 00			cmp		dword ptr 0x3e[ebx],0x00000000
019C  74 09				je		L$12
019E  8B 43 42				mov		eax,dword ptr 0x42[ebx]
01A1  80 78 08 00			cmp		byte ptr 0x8[eax],0x00
01A5  74 11				je		L$13
01A7				L$12:
01A7  53				push		ebx
01A8  8B 73 57				mov		esi,dword ptr 0x57[ebx]
01AB  E8 00 00 00 00			call		addBuff
01B0  83 C4 04				add		esp,0x00000004
01B3  89 73 57				mov		dword ptr 0x57[ebx],esi
01B6  EB 09				jmp		L$14
01B8				L$13:
01B8  53				push		ebx
01B9  E8 00 00 00 00			call		replaceTail
01BE  83 C4 04				add		esp,0x00000004
01C1				L$14:
01C1  8B 5B 42				mov		ebx,dword ptr 0x42[ebx]
01C4  C6 43 08 00			mov		byte ptr 0x8[ebx],0x00
01C8  5E				pop		esi
01C9  5B				pop		ebx
01CA  C3				ret		
01CB				newLine:
01CB  53				push		ebx
01CC  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
01D0  8B 53 42				mov		edx,dword ptr 0x42[ebx]
01D3  85 D2				test		edx,edx
01D5  74 1F				je		L$15
01D7  80 7A 08 00			cmp		byte ptr 0x8[edx],0x00
01DB  75 19				jne		L$15
01DD  53				push		ebx
01DE  E8 00 00 00 00			call		replaceTail
01E3  8B 43 42				mov		eax,dword ptr 0x42[ebx]
01E6  C7 43 57 00 00 00 00		mov		dword ptr 0x57[ebx],0x00000000
01ED  83 C4 04				add		esp,0x00000004
01F0  C6 40 08 01			mov		byte ptr 0x8[eax],0x01
01F4  EB 09				jmp		L$16
01F6				L$15:
01F6  53				push		ebx
01F7  E8 00 00 00 00			call		addBuff
01FC  83 C4 04				add		esp,0x00000004
01FF				L$16:
01FF  53				push		ebx
0200  C7 43 67 00 00 00 00		mov		dword ptr 0x67[ebx],0x00000000
0207  E8 00 00 00 00			call		incrementLastLineNumber
020C  83 C4 04				add		esp,0x00000004
020F  5B				pop		ebx
0210  C3				ret		

Routine Size: 529 bytes,    Routine Base: _TEXT + 0000

0211				_AddLine:
0211  53				push		ebx
0212  56				push		esi
0213  57				push		edi
0214  55				push		ebp
0215  83 EC 14				sub		esp,0x00000014
0218  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
021C  E8 00 00 00 00			call		_AccessWinLines
0221  8B 4B 42				mov		ecx,dword ptr 0x42[ebx]
0224  31 ED				xor		ebp,ebp
0226  31 FF				xor		edi,edi
0228  89 6C 24 04			mov		dword ptr 0x4[esp],ebp
022C  85 C9				test		ecx,ecx
022E  74 54				je		L$19
0230  8A 51 08				mov		dl,byte ptr 0x8[ecx]
0233  89 C8				mov		eax,ecx
0235  84 D2				test		dl,dl
0237  75 4B				jne		L$19
0239  8B 7B 53				mov		edi,dword ptr 0x53[ebx]
023C  8D 71 09				lea		esi,0x9[ecx]
023F  83 C7 09				add		edi,0x00000009
0242  57				push		edi
0243				L$17:
0243  8A 06				mov		al,byte ptr [esi]
0245  88 07				mov		byte ptr [edi],al
0247  3C 00				cmp		al,0x00
0249  0F 84 10 00 00 00			je		L$18
024F  8A 46 01				mov		al,byte ptr 0x1[esi]
0252  83 C6 02				add		esi,0x00000002
0255  88 47 01				mov		byte ptr 0x1[edi],al
0258  83 C7 02				add		edi,0x00000002
025B  3C 00				cmp		al,0x00
025D  75 E4				jne		L$17
025F				L$18:
025F  5F				pop		edi
0260  8B 7B 53				mov		edi,dword ptr 0x53[ebx]
0263  83 C7 09				add		edi,0x00000009
0266  06				push		es
0267  8C D8				mov		eax,ds
0269  8E C0				mov		es,eax
026B  29 C9				sub		ecx,ecx
026D  49				dec		ecx
026E  31 C0				xor		eax,eax
0270  F2 AE				repne scasb	
0272  F7 D1				not		ecx
0274  49				dec		ecx
0275  07				pop		es
0276  89 C8				mov		eax,ecx
0278  8B 73 57				mov		esi,dword ptr 0x57[ebx]
027B  89 CF				mov		edi,ecx
027D  39 F1				cmp		ecx,esi
027F  7E 03				jle		L$19
0281  89 4B 57				mov		dword ptr 0x57[ebx],ecx
0284				L$19:
0284  F6 43 52 10			test		byte ptr 0x52[ebx],0x10
0288  74 02				je		L$20
028A  31 FF				xor		edi,edi
028C				L$20:
028C  31 C0				xor		eax,eax
028E  89 04 24				mov		dword ptr [esp],eax
0291  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
0295  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0299  E9 FC 00 00 00			jmp		L$34
029E				L$21:
029E  8A 4B 52				mov		cl,byte ptr 0x52[ebx]
02A1  80 E1 EF				and		cl,0xef
02A4  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
02A8  88 4B 52				mov		byte ptr 0x52[ebx],cl
02AB				L$22:
02AB  31 C0				xor		eax,eax
02AD  89 44 24 08			mov		dword ptr 0x8[esp],eax
02B1  85 ED				test		ebp,ebp
02B3  74 05				je		L$23
02B5  B0 20				mov		al,0x20
02B7  4D				dec		ebp
02B8  EB 18				jmp		L$25
02BA				L$23:
02BA  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
02BE  85 D2				test		edx,edx
02C0  74 0E				je		L$24
02C2  C6 44 24 10 0A			mov		byte ptr 0x10[esp],0x0a
02C7  8D 4A FF				lea		ecx,-0x1[edx]
02CA  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
02CE  EB 06				jmp		L$26
02D0				L$24:
02D0  8A 06				mov		al,byte ptr [esi]
02D2				L$25:
02D2  88 44 24 10			mov		byte ptr 0x10[esp],al
02D6				L$26:
02D6  8A 64 24 10			mov		ah,byte ptr 0x10[esp]
02DA  80 FC 09				cmp		ah,0x09
02DD  75 1F				jne		L$27
02DF  8B 4B 57				mov		ecx,dword ptr 0x57[ebx]
02E2  89 CA				mov		edx,ecx
02E4  89 C8				mov		eax,ecx
02E6  C1 FA 1F				sar		edx,0x1f
02E9  C1 E2 03				shl		edx,0x03
02EC  1B C2				sbb		eax,edx
02EE  C1 F8 03				sar		eax,0x03
02F1  C1 E0 03				shl		eax,0x03
02F4  8D 68 08				lea		ebp,0x8[eax]
02F7  29 CD				sub		ebp,ecx
02F9  E9 79 00 00 00			jmp		L$33
02FE				L$27:
02FE  80 FC 0C				cmp		ah,0x0c
0301  75 0C				jne		L$28
0303  8B 43 24				mov		eax,dword ptr 0x24[ebx]
0306  89 44 24 04			mov		dword ptr 0x4[esp],eax
030A  E9 68 00 00 00			jmp		L$33
030F				L$28:
030F  80 FC 0D				cmp		ah,0x0d
0312  75 14				jne		L$29
0314  8A 6B 52				mov		ch,byte ptr 0x52[ebx]
0317  80 CD 10				or		ch,0x10
031A  8B 43 53				mov		eax,dword ptr 0x53[ebx]
031D  88 6B 52				mov		byte ptr 0x52[ebx],ch
0320  31 FF				xor		edi,edi
0322  C6 40 08 01			mov		byte ptr 0x8[eax],0x01
0326  EB 4F				jmp		L$33
0328				L$29:
0328  80 FC 0A				cmp		ah,0x0a
032B  75 11				jne		L$30
032D  53				push		ebx
032E  BF 01 00 00 00			mov		edi,0x00000001
0333  E8 00 00 00 00			call		newLine
0338  89 7C 24 0C			mov		dword ptr 0xc[esp],edi
033C  EB 33				jmp		L$32
033E				L$30:
033E  89 F8				mov		eax,edi
0340  8B 4B 53				mov		ecx,dword ptr 0x53[ebx]
0343  01 C8				add		eax,ecx
0345  8A 4C 24 10			mov		cl,byte ptr 0x10[esp]
0349  88 48 09				mov		byte ptr 0x9[eax],cl
034C  47				inc		edi
034D  3B 7B 57				cmp		edi,dword ptr 0x57[ebx]
0350  7E 03				jle		L$31
0352  89 7B 57				mov		dword ptr 0x57[ebx],edi
0355				L$31:
0355  8B 43 63				mov		eax,dword ptr 0x63[ebx]
0358  8B 53 57				mov		edx,dword ptr 0x57[ebx]
035B  83 E8 02				sub		eax,0x00000002
035E  39 D0				cmp		eax,edx
0360  7F 15				jg		L$33
0362  B9 01 00 00 00			mov		ecx,0x00000001
0367  53				push		ebx
0368  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
036C  E8 00 00 00 00			call		newLine
0371				L$32:
0371  83 C4 04				add		esp,0x00000004
0374  8B 7B 57				mov		edi,dword ptr 0x57[ebx]
0377				L$33:
0377  85 ED				test		ebp,ebp
0379  0F 85 2C FF FF FF			jne		L$22
037F  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0384  0F 85 21 FF FF FF			jne		L$22
038A  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
038E  8B 0C 24				mov		ecx,dword ptr [esp]
0391  42				inc		edx
0392  41				inc		ecx
0393  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0397  89 0C 24				mov		dword ptr [esp],ecx
039A				L$34:
039A  8B 04 24				mov		eax,dword ptr [esp]
039D  3B 44 24 30			cmp		eax,dword ptr 0x30[esp]
03A1  0F 82 F7 FE FF FF			jb		L$21
03A7  83 7C 24 08 00			cmp		dword ptr 0x8[esp],0x00000000
03AC  75 09				jne		L$35
03AE  53				push		ebx
03AF  E8 00 00 00 00			call		updateBuff
03B4  83 C4 04				add		esp,0x00000004
03B7				L$35:
03B7  E8 00 00 00 00			call		_ReleaseWinLines
03BC  83 C4 14				add		esp,0x00000014
03BF  5D				pop		ebp
03C0  5F				pop		edi
03C1  5E				pop		esi
03C2  5B				pop		ebx
03C3  C3				ret		

Routine Size: 435 bytes,    Routine Base: _TEXT + 0211

03C4				_UpdateInputLine:
03C4  53				push		ebx
03C5  56				push		esi
03C6  57				push		edi
03C7  55				push		ebp
03C8  83 EC 08				sub		esp,0x00000008
03CB  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
03CF  31 D2				xor		edx,edx
03D1  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
03D5  89 54 24 04			mov		dword ptr 0x4[esp],edx
03D9  89 14 24				mov		dword ptr [esp],edx
03DC  E8 00 00 00 00			call		_AccessWinLines
03E1  C7 43 67 01 00 00 00		mov		dword ptr 0x67[ebx],0x00000001
03E8  31 ED				xor		ebp,ebp
03EA  8B 73 57				mov		esi,dword ptr 0x57[ebx]
03ED  EB 3E				jmp		L$38
03EF				L$36:
03EF  31 C0				xor		eax,eax
03F1  89 44 24 04			mov		dword ptr 0x4[esp],eax
03F5  8B 43 63				mov		eax,dword ptr 0x63[ebx]
03F8  83 E8 02				sub		eax,0x00000002
03FB  39 C6				cmp		esi,eax
03FD  7C 22				jl		L$37
03FF  8B 43 53				mov		eax,dword ptr 0x53[ebx]
0402  C6 44 06 09 00			mov		byte ptr 0x9[esi+eax],0x00
0407  53				push		ebx
0408  89 73 57				mov		dword ptr 0x57[ebx],esi
040B  E8 00 00 00 00			call		newLine
0410  BA 01 00 00 00			mov		edx,0x00000001
0415  83 C4 04				add		esp,0x00000004
0418  31 F6				xor		esi,esi
041A  89 54 24 04			mov		dword ptr 0x4[esp],edx
041E  89 14 24				mov		dword ptr [esp],edx
0421				L$37:
0421  46				inc		esi
0422  45				inc		ebp
0423  8B 43 53				mov		eax,dword ptr 0x53[ebx]
0426  8A 17				mov		dl,byte ptr [edi]
0428  47				inc		edi
0429  88 54 06 08			mov		byte ptr 0x8[esi+eax],dl
042D				L$38:
042D  3B 6C 24 24			cmp		ebp,dword ptr 0x24[esp]
0431  72 BC				jb		L$36
0433  8B 43 53				mov		eax,dword ptr 0x53[ebx]
0436  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
043A  C6 44 06 09 00			mov		byte ptr 0x9[esi+eax],0x00
043F  85 D2				test		edx,edx
0441  74 15				je		L$39
0443  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0448  75 0E				jne		L$39
044A  53				push		ebx
044B  89 73 57				mov		dword ptr 0x57[ebx],esi
044E  E8 00 00 00 00			call		newLine
0453  83 C4 04				add		esp,0x00000004
0456  EB 25				jmp		L$40
0458				L$39:
0458  8B 43 53				mov		eax,dword ptr 0x53[ebx]
045B  83 C0 09				add		eax,0x00000009
045E  8B 7B 4E				mov		edi,dword ptr 0x4e[ebx]
0461  50				push		eax
0462  8B 43 46				mov		eax,dword ptr 0x46[ebx]
0465  29 F8				sub		eax,edi
0467  40				inc		eax
0468  50				push		eax
0469  53				push		ebx
046A  E8 00 00 00 00			call		_DisplayLineInWindow
046F  83 C4 0C				add		esp,0x0000000c
0472  83 3C 24 00			cmp		dword ptr [esp],0x00000000
0476  75 05				jne		L$40
0478  BE FF FF FF FF			mov		esi,0xffffffff
047D				L$40:
047D  E8 00 00 00 00			call		_ReleaseWinLines
0482  89 F0				mov		eax,esi
0484				L$41:
0484  83 C4 08				add		esp,0x00000008
0487  5D				pop		ebp
0488  5F				pop		edi
0489  5E				pop		esi
048A  5B				pop		ebx
048B  C3				ret		

Routine Size: 200 bytes,    Routine Base: _TEXT + 03C4

048C				_PositionScrollThumb:
048C  53				push		ebx
048D  56				push		esi
048E  57				push		edi
048F  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0493  56				push		esi
0494  8B 7E 4E				mov		edi,dword ptr 0x4e[esi]
0497  E8 00 00 00 00			call		_GetLastLineNumber
049C  89 C3				mov		ebx,eax
049E  83 C4 04				add		esp,0x00000004
04A1  3D 00 80 00 00			cmp		eax,0x00008000
04A6  76 12				jbe		L$42
04A8  89 F8				mov		eax,edi
04AA  31 D2				xor		edx,edx
04AC  C1 E0 0F				shl		eax,0x0f
04AF  F7 F3				div		ebx
04B1  B9 00 80 00 00			mov		ecx,0x00008000
04B6  89 C7				mov		edi,eax
04B8  EB 02				jmp		L$43
04BA				L$42:
04BA  89 C1				mov		ecx,eax
04BC				L$43:
04BC  31 C0				xor		eax,eax
04BE  6A 00				push		0x00000000
04C0  66 89 C8				mov		ax,cx
04C3  50				push		eax
04C4  6A 01				push		0x00000001
04C6  6A 01				push		0x00000001
04C8  8B 56 3A				mov		edx,dword ptr 0x3a[esi]
04CB  52				push		edx
04CC  E8 00 00 00 00			call		_SetScrollRange
04D1  31 C0				xor		eax,eax
04D3  6A 01				push		0x00000001
04D5  66 89 F8				mov		ax,di
04D8  50				push		eax
04D9  6A 01				push		0x00000001
04DB  8B 5E 3A				mov		ebx,dword ptr 0x3a[esi]
04DE  53				push		ebx
04DF  E8 00 00 00 00			call		_SetScrollPos
04E4  5F				pop		edi
04E5  5E				pop		esi
04E6  5B				pop		ebx
04E7  C3				ret		

Routine Size: 92 bytes,    Routine Base: _TEXT + 048C

04E8				_GetLineFromThumbPosition:
04E8  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
04EC  52				push		edx
04ED  E8 00 00 00 00			call		_GetLastLineNumber
04F2  83 C4 04				add		esp,0x00000004
04F5  3D 00 80 00 00			cmp		eax,0x00008000
04FA  76 0E				jbe		L$44
04FC  31 D2				xor		edx,edx
04FE  66 8B 54 24 08			mov		dx,word ptr 0x8[esp]
0503  0F AF C2				imul		eax,edx
0506  C1 E8 0F				shr		eax,0x0f
0509  C3				ret		
050A				L$44:
050A  31 C0				xor		eax,eax
050C  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
0511  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 04E8

0512				_GetLineDataPointer:
0512  53				push		ebx
0513  56				push		esi
0514  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0518  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
051C  E8 00 00 00 00			call		_AccessWinLines
0521  3B 73 46				cmp		esi,dword ptr 0x46[ebx]
0524  75 11				jne		L$45
0526  83 7B 67 00			cmp		dword ptr 0x67[ebx],0x00000000
052A  74 0B				je		L$45
052C  E8 00 00 00 00			call		_ReleaseWinLines
0531  8B 43 53				mov		eax,dword ptr 0x53[ebx]
0534  5E				pop		esi
0535  5B				pop		ebx
0536  C3				ret		
0537				L$45:
0537  B8 01 00 00 00			mov		eax,0x00000001
053C  8B 5B 3E				mov		ebx,dword ptr 0x3e[ebx]
053F				L$46:
053F  39 F0				cmp		eax,esi
0541  74 09				je		L$47
0543  85 DB				test		ebx,ebx
0545  74 05				je		L$47
0547  40				inc		eax
0548  8B 1B				mov		ebx,dword ptr [ebx]
054A  EB F3				jmp		L$46
054C				L$47:
054C  E8 00 00 00 00			call		_ReleaseWinLines
0551  89 D8				mov		eax,ebx
0553  5E				pop		esi
0554  5B				pop		ebx
0555  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0512

0556				_FreeAllLines:
0556  53				push		ebx
0557  56				push		esi
0558  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
055C  E8 00 00 00 00			call		_AccessWinLines
0561  8B 46 3E				mov		eax,dword ptr 0x3e[esi]
0564				L$48:
0564  85 C0				test		eax,eax
0566  74 0F				je		L$49
0568  50				push		eax
0569  8B 18				mov		ebx,dword ptr [eax]
056B  E8 00 00 00 00			call		_MemFree
0570  83 C4 04				add		esp,0x00000004
0573  89 D8				mov		eax,ebx
0575  EB ED				jmp		L$48
0577				L$49:
0577  C7 46 4E 01 00 00 00		mov		dword ptr 0x4e[esi],0x00000001
057E  89 46 42				mov		dword ptr 0x42[esi],eax
0581  89 46 3E				mov		dword ptr 0x3e[esi],eax
0584  89 46 57				mov		dword ptr 0x57[esi],eax
0587  8B 46 4E				mov		eax,dword ptr 0x4e[esi]
058A  89 46 46				mov		dword ptr 0x46[esi],eax
058D  56				push		esi
058E  89 46 4A				mov		dword ptr 0x4a[esi],eax
0591  E8 00 00 00 00			call		_PositionScrollThumb
0596  83 C4 04				add		esp,0x00000004
0599  E8 00 00 00 00			call		_ReleaseWinLines
059E  5E				pop		esi
059F  5B				pop		ebx
05A0  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0556

05A1				_SaveAllLines:
05A1  53				push		ebx
05A2  56				push		esi
05A3  57				push		edi
05A4  55				push		ebp
05A5  81 EC 50 01 00 00			sub		esp,0x00000150
05AB  6A 4C				push		0x0000004c
05AD  BB 00 00 00 00			mov		ebx,offset filterFiles
05B2  30 E4				xor		ah,ah
05B4  6A 00				push		0x00000000
05B6  88 64 24 08			mov		byte ptr 0x8[esp],ah
05BA  8D 84 24 0C 01 00 00		lea		eax,0x10c[esp]
05C1  BE 04 01 00 00			mov		esi,0x00000104
05C6  50				push		eax
05C7  BF 00 00 00 00			mov		edi,offset DGROUP:L$63
05CC  BD 04 00 00 00			mov		ebp,0x00000004
05D1  E8 00 00 00 00			call		memset
05D6  BA 4C 00 00 00			mov		edx,0x0000004c
05DB  B9 01 00 00 00			mov		ecx,0x00000001
05E0  83 C4 0C				add		esp,0x0000000c
05E3  A1 00 00 00 00			mov		eax,dword ptr _MainWindow
05E8  89 94 24 04 01 00 00		mov		dword ptr 0x104[esp],edx
05EF  89 84 24 08 01 00 00		mov		dword ptr 0x108[esp],eax
05F6  89 9C 24 10 01 00 00		mov		dword ptr 0x110[esp],ebx
05FD  89 E0				mov		eax,esp
05FF  89 8C 24 1C 01 00 00		mov		dword ptr 0x11c[esp],ecx
0606  89 84 24 20 01 00 00		mov		dword ptr 0x120[esp],eax
060D  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0614  89 B4 24 24 01 00 00		mov		dword ptr 0x124[esp],esi
061B  50				push		eax
061C  89 BC 24 38 01 00 00		mov		dword ptr 0x138[esp],edi
0623  89 AC 24 3C 01 00 00		mov		dword ptr 0x13c[esp],ebp
062A  E8 00 00 00 00			call		_GetSaveFileNameA
062F  85 C0				test		eax,eax
0631  74 6E				je		L$54
0633  E8 00 00 00 00			call		_AccessWinLines
0638  68 19 00 00 00			push		offset DGROUP:L$64
063D  8D 44 24 04			lea		eax,0x4[esp]
0641  50				push		eax
0642  E8 00 00 00 00			call		fopen
0647  83 C4 08				add		esp,0x00000008
064A  89 C6				mov		esi,eax
064C  85 C0				test		eax,eax
064E  75 0E				jne		L$50
0650  50				push		eax
0651  68 1B 00 00 00			push		offset DGROUP:L$65
0656  8D 44 24 08			lea		eax,0x8[esp]
065A  50				push		eax
065B  56				push		esi
065C  EB 3E				jmp		L$53
065E				L$50:
065E  8B 9C 24 64 01 00 00		mov		ebx,dword ptr 0x164[esp]
0665  8B 5B 3E				mov		ebx,dword ptr 0x3e[ebx]
0668				L$51:
0668  85 DB				test		ebx,ebx
066A  74 16				je		L$52
066C  8D 43 09				lea		eax,0x9[ebx]
066F  50				push		eax
0670  68 2E 00 00 00			push		offset DGROUP:L$66
0675  56				push		esi
0676  E8 00 00 00 00			call		fprintf
067B  83 C4 0C				add		esp,0x0000000c
067E  8B 1B				mov		ebx,dword ptr [ebx]
0680  EB E6				jmp		L$51
0682				L$52:
0682  56				push		esi
0683  E8 00 00 00 00			call		fclose
0688  83 C4 04				add		esp,0x00000004
068B  E8 00 00 00 00			call		_ReleaseWinLines
0690  53				push		ebx
0691  68 32 00 00 00			push		offset DGROUP:L$67
0696  8D 44 24 08			lea		eax,0x8[esp]
069A  50				push		eax
069B  53				push		ebx
069C				L$53:
069C  E8 00 00 00 00			call		_MessageBoxA
06A1				L$54:
06A1  81 C4 50 01 00 00			add		esp,0x00000150
06A7  5D				pop		ebp
06A8  5F				pop		edi
06A9  5E				pop		esi
06AA  5B				pop		ebx
06AB  C3				ret		

Routine Size: 267 bytes,    Routine Base: _TEXT + 05A1

06AC				_CopyAllLines:
06AC  53				push		ebx
06AD  56				push		esi
06AE  57				push		edi
06AF  55				push		ebp
06B0  83 EC 08				sub		esp,0x00000008
06B3  E8 00 00 00 00			call		_AccessWinLines
06B8  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
06BC  31 DB				xor		ebx,ebx
06BE  8B 52 3E				mov		edx,dword ptr 0x3e[edx]
06C1				L$55:
06C1  85 D2				test		edx,edx
06C3  74 1C				je		L$56
06C5  8D 7A 09				lea		edi,0x9[edx]
06C8  06				push		es
06C9  8C D8				mov		eax,ds
06CB  8E C0				mov		es,eax
06CD  29 C9				sub		ecx,ecx
06CF  49				dec		ecx
06D0  31 C0				xor		eax,eax
06D2  F2 AE				repne scasb	
06D4  F7 D1				not		ecx
06D6  49				dec		ecx
06D7  07				pop		es
06D8  83 C1 02				add		ecx,0x00000002
06DB  8B 12				mov		edx,dword ptr [edx]
06DD  01 CB				add		ebx,ecx
06DF  EB E0				jmp		L$55
06E1				L$56:
06E1  81 FB FE FF 00 00			cmp		ebx,0x0000fffe
06E7  76 05				jbe		L$57
06E9  BB FE FF 00 00			mov		ebx,0x0000fffe
06EE				L$57:
06EE  43				inc		ebx
06EF  53				push		ebx
06F0  6A 02				push		0x00000002
06F2  E8 00 00 00 00			call		_GlobalAlloc
06F7  89 C2				mov		edx,eax
06F9  89 04 24				mov		dword ptr [esp],eax
06FC  85 C0				test		eax,eax
06FE  75 16				jne		L$58
0700  50				push		eax
0701  68 45 00 00 00			push		offset DGROUP:L$68
0706  68 57 00 00 00			push		offset DGROUP:L$69
070B  50				push		eax
070C  E8 00 00 00 00			call		_MessageBoxA
0711  E9 AC 00 00 00			jmp		L$61
0716				L$58:
0716  50				push		eax
0717  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
071B  E8 00 00 00 00			call		_GlobalLock
0720  89 44 24 04			mov		dword ptr 0x4[esp],eax
0724  8B 5B 3E				mov		ebx,dword ptr 0x3e[ebx]
0727  31 D2				xor		edx,edx
0729				L$59:
0729  85 DB				test		ebx,ebx
072B  74 5D				je		L$60
072D  8D 73 09				lea		esi,0x9[ebx]
0730  89 F7				mov		edi,esi
0732  06				push		es
0733  8C D8				mov		eax,ds
0735  8E C0				mov		es,eax
0737  29 C9				sub		ecx,ecx
0739  49				dec		ecx
073A  31 C0				xor		eax,eax
073C  F2 AE				repne scasb	
073E  F7 D1				not		ecx
0740  49				dec		ecx
0741  07				pop		es
0742  8D 41 02				lea		eax,0x2[ecx]
0745  8D 2C 02				lea		ebp,[edx+eax]
0748  81 FD FE FF 00 00			cmp		ebp,0x0000fffe
074E  77 3A				ja		L$60
0750  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
0754  83 E8 02				sub		eax,0x00000002
0757  8C D9				mov		ecx,ds
0759  01 D7				add		edi,edx
075B  8C DA				mov		edx,ds
075D  1E				push		ds
075E  06				push		es
075F  57				push		edi
0760  91				xchg		eax,ecx
0761  8E D8				mov		ds,eax
0763  8E C2				mov		es,edx
0765  89 C8				mov		eax,ecx
0767  C1 E9 02				shr		ecx,0x02
076A  F2 A5				repne movsd	
076C  8A C8				mov		cl,al
076E  80 E1 03				and		cl,0x03
0771  F2 A4				repne movsb	
0773  58				pop		eax
0774  07				pop		es
0775  1F				pop		ds
0776  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
077A  C6 44 2A FE 0D			mov		byte ptr -0x2[edx+ebp],0x0d
077F  C6 44 2A FF 0A			mov		byte ptr -0x1[edx+ebp],0x0a
0784  89 EA				mov		edx,ebp
0786  8B 1B				mov		ebx,dword ptr [ebx]
0788  EB 9F				jmp		L$59
078A				L$60:
078A  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
078E  8B 0C 24				mov		ecx,dword ptr [esp]
0791  01 DA				add		edx,ebx
0793  51				push		ecx
0794  C6 02 00				mov		byte ptr [edx],0x00
0797  E8 00 00 00 00			call		_GlobalUnlock
079C  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
07A0  8B 70 3A				mov		esi,dword ptr 0x3a[eax]
07A3  56				push		esi
07A4  E8 00 00 00 00			call		_OpenClipboard
07A9  85 C0				test		eax,eax
07AB  74 15				je		L$61
07AD  8B 3C 24				mov		edi,dword ptr [esp]
07B0  E8 00 00 00 00			call		_EmptyClipboard
07B5  57				push		edi
07B6  6A 01				push		0x00000001
07B8  E8 00 00 00 00			call		_SetClipboardData
07BD  E8 00 00 00 00			call		_CloseClipboard
07C2				L$61:
07C2  E8 00 00 00 00			call		_ReleaseWinLines
07C7  E9 B8 FC FF FF			jmp		L$41

Routine Size: 288 bytes,    Routine Base: _TEXT + 06AC

07CC				_GetLastLineNumber:
07CC  53				push		ebx
07CD  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
07D1  8B 5A 67				mov		ebx,dword ptr 0x67[edx]
07D4  8B 42 46				mov		eax,dword ptr 0x46[edx]
07D7  85 DB				test		ebx,ebx
07D9  74 01				je		L$62
07DB  40				inc		eax
07DC				L$62:
07DC  5B				pop		ebx
07DD  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 07CC

No disassembly errors

Segment: CONST DWORD USE32 00000065 bytes
0000				L$63:
0000  53 61 76 65 20 46 69 6C 65 20 4E 61 6D 65 20 53 Save File Name S
0010  65 6C 65 63 74 69 6F 6E 00                      election.
0019				L$64:
0019  77 00                                           w.
001B				L$65:
001B  45 72 72 6F 72 20 6F 70 65 6E 69 6E 67 20 66 69 Error opening fi
002B  6C 65 00                                        le.
002E				L$66:
002E  25 73 0A 00                                     %s..
0032				L$67:
0032  44 61 74 61 20 73 61 76 65 64 20 74 6F 20 66 69 Data saved to fi
0042  6C 65 00                                        le.
0045				L$68:
0045  43 6F 70 79 20 74 6F 20 43 6C 69 70 62 6F 61 72 Copy to Clipboar
0055  64 00                                           d.
0057				L$69:
0057  4F 75 74 20 6F 66 20 4D 65 6D 6F 72 79 00       Out of Memory.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000001D bytes
0000				filterFiles:
0000  52 65 73 75 6C 74 20 46 69 6C 65 73 20 28 2A 2E Result Files (*.
0010  54 58 54 29 00 2A 2E 54 58 54 00 00 00          TXT).*.TXT...

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

