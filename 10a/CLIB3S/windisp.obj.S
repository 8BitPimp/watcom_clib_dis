Module: windisp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003E1 bytes
0000				_DisplayAllLines:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000B  8B 7E 4E				mov		edi,dword ptr 0x4e[esi]
000E  57				push		edi
000F  56				push		esi
0010  E8 00 00 00 00			call		_GetLineDataPointer
0015  83 C4 08				add		esp,0x00000008
0018  8B 5E 24				mov		ebx,dword ptr 0x24[esi]
001B  89 C5				mov		ebp,eax
001D  89 1C 24				mov		dword ptr [esp],ebx
0020  BB 01 00 00 00			mov		ebx,0x00000001
0025  EB 31				jmp		L$4
0027				L$1:
0027  85 ED				test		ebp,ebp
0029  75 11				jne		L$2
002B  68 00 00 00 00			push		offset DGROUP:L$12
0030  53				push		ebx
0031  56				push		esi
0032  E8 00 00 00 00			call		_DisplayLineInWindow
0037  83 C4 0C				add		esp,0x0000000c
003A  EB 1B				jmp		L$3
003C				L$2:
003C  83 C5 09				add		ebp,0x00000009
003F  55				push		ebp
0040  53				push		ebx
0041  56				push		esi
0042  E8 00 00 00 00			call		_DisplayLineInWindow
0047  83 C4 0C				add		esp,0x0000000c
004A  47				inc		edi
004B  57				push		edi
004C  56				push		esi
004D  E8 00 00 00 00			call		_GetLineDataPointer
0052  89 C5				mov		ebp,eax
0054  83 C4 08				add		esp,0x00000008
0057				L$3:
0057  43				inc		ebx
0058				L$4:
0058  3B 1C 24				cmp		ebx,dword ptr [esp]
005B  7C CA				jl		L$1
005D  83 C4 04				add		esp,0x00000004
0060  5D				pop		ebp
0061  5F				pop		edi
0062  5E				pop		esi
0063  5B				pop		ebx
0064  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 0000

0065				_DisplayLineInWindowWithColor:
0065  53				push		ebx
0066  56				push		esi
0067  57				push		edi
0068  55				push		ebp
0069  81 EC 08 01 00 00			sub		esp,0x00000108
006F  8B 9C 24 1C 01 00 00		mov		ebx,dword ptr 0x11c[esp]
0076  8B B4 24 24 01 00 00		mov		esi,dword ptr 0x124[esp]
007D  03 B4 24 34 01 00 00		add		esi,dword ptr 0x134[esp]
0084  8B 43 3A				mov		eax,dword ptr 0x3a[ebx]
0087  89 F7				mov		edi,esi
0089  89 84 24 00 01 00 00		mov		dword ptr 0x100[esp],eax
0090  06				push		es
0091  8C D8				mov		eax,ds
0093  8E C0				mov		es,eax
0095  29 C9				sub		ecx,ecx
0097  49				dec		ecx
0098  31 C0				xor		eax,eax
009A  F2 AE				repne scasb	
009C  F7 D1				not		ecx
009E  49				dec		ecx
009F  07				pop		es
00A0  8B BC 24 20 01 00 00		mov		edi,dword ptr 0x120[esp]
00A7  83 FF 01				cmp		edi,0x00000001
00AA  0F 8C 2C 01 00 00			jl		L$6
00B0  3B 7B 24				cmp		edi,dword ptr 0x24[ebx]
00B3  0F 8D 23 01 00 00			jge		L$6
00B9  8B 94 24 30 01 00 00		mov		edx,dword ptr 0x130[esp]
00C0  8B 43 20				mov		eax,dword ptr 0x20[ebx]
00C3  29 D0				sub		eax,edx
00C5  31 ED				xor		ebp,ebp
00C7  89 C7				mov		edi,eax
00C9  39 C1				cmp		ecx,eax
00CB  7D 02				jge		L$5
00CD  89 C8				mov		eax,ecx
00CF				L$5:
00CF  29 C7				sub		edi,eax
00D1  89 C1				mov		ecx,eax
00D3  89 BC 24 04 01 00 00		mov		dword ptr 0x104[esp],edi
00DA  29 E9				sub		ecx,ebp
00DC  89 E7				mov		edi,esp
00DE  89 CD				mov		ebp,ecx
00E0  06				push		es
00E1  8C D8				mov		eax,ds
00E3  8E C0				mov		es,eax
00E5  57				push		edi
00E6  89 C8				mov		eax,ecx
00E8  C1 E9 02				shr		ecx,0x02
00EB  F2 A5				repne movsd	
00ED  8A C8				mov		cl,al
00EF  80 E1 03				and		cl,0x03
00F2  F2 A4				repne movsb	
00F4  5F				pop		edi
00F5  07				pop		es
00F6  8B 8C 24 04 01 00 00		mov		ecx,dword ptr 0x104[esp]
00FD  51				push		ecx
00FE  8D 44 24 04			lea		eax,0x4[esp]
0102  6A 20				push		0x00000020
0104  01 E8				add		eax,ebp
0106  50				push		eax
0107  E8 00 00 00 00			call		memset
010C  83 C4 0C				add		esp,0x0000000c
010F  03 AC 24 04 01 00 00		add		ebp,dword ptr 0x104[esp]
0116  30 E4				xor		ah,ah
0118  8B BC 24 00 01 00 00		mov		edi,dword ptr 0x100[esp]
011F  88 24 2C				mov		byte ptr [esp+ebp],ah
0122  8B AC 24 20 01 00 00		mov		ebp,dword ptr 0x120[esp]
0129  57				push		edi
012A  4D				dec		ebp
012B  E8 00 00 00 00			call		_GetDC
0130  89 AC 24 20 01 00 00		mov		dword ptr 0x120[esp],ebp
0137  89 C5				mov		ebp,eax
0139  8B 84 24 28 01 00 00		mov		eax,dword ptr 0x128[esp]
0140  8B 14 85 00 00 00 00		mov		edx,dword ptr _ColorMap[eax*4]
0147  8B 84 24 2C 01 00 00		mov		eax,dword ptr 0x12c[esp]
014E  52				push		edx
014F  8B 0C 85 00 00 00 00		mov		ecx,dword ptr _ColorMap[eax*4]
0156  51				push		ecx
0157  55				push		ebp
0158  E8 00 00 00 00			call		_SetMyDC
015D  83 C4 0C				add		esp,0x0000000c
0160  8B 73 20				mov		esi,dword ptr 0x20[ebx]
0163  56				push		esi
0164  8D 44 24 04			lea		eax,0x4[esp]
0168  8B 7B 2C				mov		edi,dword ptr 0x2c[ebx]
016B  50				push		eax
016C  8B 84 24 28 01 00 00		mov		eax,dword ptr 0x128[esp]
0173  0F AF C7				imul		eax,edi
0176  8B 53 28				mov		edx,dword ptr 0x28[ebx]
0179  50				push		eax
017A  8B 84 24 40 01 00 00		mov		eax,dword ptr 0x140[esp]
0181  0F AF C2				imul		eax,edx
0184  50				push		eax
0185  55				push		ebp
0186  E8 00 00 00 00			call		_TextOutA
018B  55				push		ebp
018C  8B 8C 24 04 01 00 00		mov		ecx,dword ptr 0x104[esp]
0193  51				push		ecx
0194  E8 00 00 00 00			call		_ReleaseDC
0199  8B 84 24 20 01 00 00		mov		eax,dword ptr 0x120[esp]
01A0  66 0F AF 43 20			imul		ax,word ptr 0x20[ebx]
01A5  8B 8C 24 34 01 00 00		mov		ecx,dword ptr 0x134[esp]
01AC  8B B4 24 34 01 00 00		mov		esi,dword ptr 0x134[esp]
01B3  01 C8				add		eax,ecx
01B5  8B 4B 20				mov		ecx,dword ptr 0x20[ebx]
01B8  29 F1				sub		ecx,esi
01BA  25 FF FF 00 00			and		eax,0x0000ffff
01BF  8B 7B 32				mov		edi,dword ptr 0x32[ebx]
01C2  89 E6				mov		esi,esp
01C4  01 C7				add		edi,eax
01C6  06				push		es
01C7  8C D8				mov		eax,ds
01C9  8E C0				mov		es,eax
01CB  57				push		edi
01CC  89 C8				mov		eax,ecx
01CE  C1 E9 02				shr		ecx,0x02
01D1  F2 A5				repne movsd	
01D3  8A C8				mov		cl,al
01D5  80 E1 03				and		cl,0x03
01D8  F2 A4				repne movsb	
01DA  5F				pop		edi
01DB  07				pop		es
01DC				L$6:
01DC  81 C4 08 01 00 00			add		esp,0x00000108
01E2  5D				pop		ebp
01E3  5F				pop		edi
01E4  5E				pop		esi
01E5  5B				pop		ebx
01E6  C3				ret		

Routine Size: 386 bytes,    Routine Base: _TEXT + 0065

01E7				_DisplayLineInWindow:
01E7  53				push		ebx
01E8  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
01EC  6A 00				push		0x00000000
01EE  6A 00				push		0x00000000
01F0  8B 58 0C				mov		ebx,dword ptr 0xc[eax]
01F3  53				push		ebx
01F4  8B 50 08				mov		edx,dword ptr 0x8[eax]
01F7  52				push		edx
01F8  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
01FC  52				push		edx
01FD  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0201  53				push		ebx
0202  50				push		eax
0203  E8 00 00 00 00			call		_DisplayLineInWindowWithColor
0208  83 C4 1C				add		esp,0x0000001c
020B  5B				pop		ebx
020C  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 01E7

020D				_ClearWindow:
020D  53				push		ebx
020E  56				push		esi
020F  57				push		edi
0210  55				push		ebp
0211  83 EC 10				sub		esp,0x00000010
0214  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
0218  8B 73 20				mov		esi,dword ptr 0x20[ebx]
021B  0F AF 73 24			imul		esi,dword ptr 0x24[ebx]
021F  56				push		esi
0220  6A 20				push		0x00000020
0222  8B 4B 32				mov		ecx,dword ptr 0x32[ebx]
0225  51				push		ecx
0226  8B 7B 3A				mov		edi,dword ptr 0x3a[ebx]
0229  E8 00 00 00 00			call		memset
022E  83 C4 0C				add		esp,0x0000000c
0231  57				push		edi
0232  E8 00 00 00 00			call		_GetDC
0237  8B 6B 36				mov		ebp,dword ptr 0x36[ebx]
023A  55				push		ebp
023B  50				push		eax
023C  89 C6				mov		esi,eax
023E  E8 00 00 00 00			call		_SelectObject
0243  6A 00				push		0x00000000
0245  6A 00				push		0x00000000
0247  6A 00				push		0x00000000
0249  56				push		esi
024A  E8 00 00 00 00			call		_SetBrushOrgEx
024F  89 E0				mov		eax,esp
0251  50				push		eax
0252  57				push		edi
0253  E8 00 00 00 00			call		_GetClientRect
0258  8B 43 36				mov		eax,dword ptr 0x36[ebx]
025B  50				push		eax
025C  8D 44 24 04			lea		eax,0x4[esp]
0260  50				push		eax
0261  56				push		esi
0262  E8 00 00 00 00			call		_FillRect
0267  56				push		esi
0268  57				push		edi
0269  E8 00 00 00 00			call		_ReleaseDC
026E  83 C4 10				add		esp,0x00000010
0271  5D				pop		ebp
0272  5F				pop		edi
0273  5E				pop		esi
0274  5B				pop		ebx
0275  C3				ret		

Routine Size: 105 bytes,    Routine Base: _TEXT + 020D

0276				_ShiftWindow:
0276  53				push		ebx
0277  56				push		esi
0278  57				push		edi
0279  55				push		ebp
027A  83 EC 14				sub		esp,0x00000014
027D  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
0281  8B 7C 24 2C			mov		edi,dword ptr 0x2c[esp]
0285  8B 53 2C				mov		edx,dword ptr 0x2c[ebx]
0288  F7 DF				neg		edi
028A  0F AF FA				imul		edi,edx
028D  89 E0				mov		eax,esp
028F  50				push		eax
0290  8B 73 3A				mov		esi,dword ptr 0x3a[ebx]
0293  56				push		esi
0294  E8 00 00 00 00			call		_GetClientRect
0299  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
029D  89 C2				mov		edx,eax
029F  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
02A2  C1 FA 1F				sar		edx,0x1f
02A5  F7 F9				idiv		ecx
02A7  89 CA				mov		edx,ecx
02A9  0F AF D0				imul		edx,eax
02AC  89 E0				mov		eax,esp
02AE  50				push		eax
02AF  6A 00				push		0x00000000
02B1  57				push		edi
02B2  6A 00				push		0x00000000
02B4  56				push		esi
02B5  89 54 24 20			mov		dword ptr 0x20[esp],edx
02B9  8B 74 24 40			mov		esi,dword ptr 0x40[esp]
02BD  E8 00 00 00 00			call		_ScrollWindow
02C2  85 F6				test		esi,esi
02C4  7D 17				jge		L$7
02C6  B8 FF FF FF FF			mov		eax,0xffffffff
02CB  8B 53 24				mov		edx,dword ptr 0x24[ebx]
02CE  89 F5				mov		ebp,esi
02D0  83 EA 03				sub		edx,0x00000003
02D3  89 44 24 10			mov		dword ptr 0x10[esp],eax
02D7  31 F5				xor		ebp,esi
02D9  01 F2				add		edx,esi
02DB  EB 0F				jmp		L$8
02DD				L$7:
02DD  BF 01 00 00 00			mov		edi,0x00000001
02E2  8B 6B 24				mov		ebp,dword ptr 0x24[ebx]
02E5  89 F2				mov		edx,esi
02E7  4D				dec		ebp
02E8  89 7C 24 10			mov		dword ptr 0x10[esp],edi
02EC				L$8:
02EC  8B 73 20				mov		esi,dword ptr 0x20[ebx]
02EF  0F AF F2				imul		esi,edx
02F2  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
02F6  89 D1				mov		ecx,edx
02F8  29 C1				sub		ecx,eax
02FA  8B 43 20				mov		eax,dword ptr 0x20[ebx]
02FD  0F AF C8				imul		ecx,eax
0300  8B 7B 32				mov		edi,dword ptr 0x32[ebx]
0303  01 FE				add		esi,edi
0305  01 CF				add		edi,ecx
0307  89 C1				mov		ecx,eax
0309  06				push		es
030A  8C D8				mov		eax,ds
030C  8E C0				mov		es,eax
030E  57				push		edi
030F  89 C8				mov		eax,ecx
0311  C1 E9 02				shr		ecx,0x02
0314  F2 A5				repne movsd	
0316  8A C8				mov		cl,al
0318  80 E1 03				and		cl,0x03
031B  F2 A4				repne movsb	
031D  5F				pop		edi
031E  07				pop		es
031F  39 EA				cmp		edx,ebp
0321  74 06				je		L$9
0323  03 54 24 10			add		edx,dword ptr 0x10[esp]
0327  EB C3				jmp		L$8
0329				L$9:
0329  83 C4 14				add		esp,0x00000014
032C  5D				pop		ebp
032D  5F				pop		edi
032E  5E				pop		esi
032F  5B				pop		ebx
0330  C3				ret		

Routine Size: 187 bytes,    Routine Base: _TEXT + 0276

0331				_ResizeWin:
0331  53				push		ebx
0332  56				push		esi
0333  57				push		edi
0334  55				push		ebp
0335  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0339  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
033D  2B 54 24 1C			sub		edx,dword ptr 0x1c[esp]
0341  42				inc		edx
0342  8B 73 2C				mov		esi,dword ptr 0x2c[ebx]
0345  89 D0				mov		eax,edx
0347  C1 FA 1F				sar		edx,0x1f
034A  F7 FE				idiv		esi
034C  8B 7B 4E				mov		edi,dword ptr 0x4e[ebx]
034F  8B 53 4A				mov		edx,dword ptr 0x4a[ebx]
0352  8D 48 01				lea		ecx,0x1[eax]
0355  29 FA				sub		edx,edi
0357  39 CA				cmp		edx,ecx
0359  72 07				jb		L$10
035B  8D 44 0F FF			lea		eax,-0x1[edi+ecx]
035F  89 43 4A				mov		dword ptr 0x4a[ebx],eax
0362				L$10:
0362  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0366  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
036A  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
036E  89 43 10				mov		dword ptr 0x10[ebx],eax
0371  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0375  8B 73 28				mov		esi,dword ptr 0x28[ebx]
0378  89 43 18				mov		dword ptr 0x18[ebx],eax
037B  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
037F  29 EA				sub		edx,ebp
0381  89 43 14				mov		dword ptr 0x14[ebx],eax
0384  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0388  42				inc		edx
0389  89 43 1C				mov		dword ptr 0x1c[ebx],eax
038C  89 D0				mov		eax,edx
038E  C1 FA 1F				sar		edx,0x1f
0391  F7 FE				idiv		esi
0393  8B 7B 32				mov		edi,dword ptr 0x32[ebx]
0396  89 4B 24				mov		dword ptr 0x24[ebx],ecx
0399  40				inc		eax
039A  57				push		edi
039B  89 43 20				mov		dword ptr 0x20[ebx],eax
039E  E8 00 00 00 00			call		_MemFree
03A3  8B 53 20				mov		edx,dword ptr 0x20[ebx]
03A6  0F AF 53 24			imul		edx,dword ptr 0x24[ebx]
03AA  83 C4 04				add		esp,0x00000004
03AD  52				push		edx
03AE  E8 00 00 00 00			call		_MemAlloc
03B3  89 43 32				mov		dword ptr 0x32[ebx],eax
03B6  8B 53 20				mov		edx,dword ptr 0x20[ebx]
03B9  0F AF 53 24			imul		edx,dword ptr 0x24[ebx]
03BD  83 C4 04				add		esp,0x00000004
03C0  52				push		edx
03C1  6A 20				push		0x00000020
03C3  8B 53 32				mov		edx,dword ptr 0x32[ebx]
03C6  52				push		edx
03C7  E8 00 00 00 00			call		memset
03CC  8B 43 20				mov		eax,dword ptr 0x20[ebx]
03CF  8B 4B 63				mov		ecx,dword ptr 0x63[ebx]
03D2  83 C4 0C				add		esp,0x0000000c
03D5  39 C8				cmp		eax,ecx
03D7  7E 03				jle		L$11
03D9  89 43 63				mov		dword ptr 0x63[ebx],eax
03DC				L$11:
03DC  5D				pop		ebp
03DD  5F				pop		edi
03DE  5E				pop		esi
03DF  5B				pop		ebx
03E0  C3				ret		

Routine Size: 176 bytes,    Routine Base: _TEXT + 0331

No disassembly errors

Segment: CONST DWORD USE32 00000002 bytes
0000				L$12:
0000  20 00                                            .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

