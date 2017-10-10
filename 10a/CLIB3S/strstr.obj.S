Module: strstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C5 bytes
0000				strstr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000B  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
000F  8A 23				mov		ah,byte ptr [ebx]
0011  84 E4				test		ah,ah
0013  75 07				jne		L$2
0015				L$1:
0015  89 F0				mov		eax,esi
0017  E9 A1 00 00 00			jmp		L$13
001C				L$2:
001C  80 7B 01 00			cmp		byte ptr 0x1[ebx],0x00
0020  75 20				jne		L$6
0022  88 E2				mov		dl,ah
0024				L$3:
0024  8A 06				mov		al,byte ptr [esi]
0026  3A C2				cmp		al,dl
0028  74 16				je		L$5
002A  3C 00				cmp		al,0x00
002C  0F 84 0C 00 00 00			je		L$4
0032  46				inc		esi
0033  8A 06				mov		al,byte ptr [esi]
0035  3A C2				cmp		al,dl
0037  74 07				je		L$5
0039  46				inc		esi
003A  3C 00				cmp		al,0x00
003C  75 E6				jne		L$3
003E				L$4:
003E  2B F6				sub		esi,esi
0040				L$5:
0040  EB D3				jmp		L$1
0042				L$6:
0042  B9 FF FF FF FF			mov		ecx,0xffffffff
0047  89 F7				mov		edi,esi
0049  30 C0				xor		al,al
004B  06				push		es
004C  E3 0B				jecxz		L$7
004E  8C DA				mov		edx,ds
0050  8E C2				mov		es,edx
0052  F2 AE				repne scasb	
0054  75 03				jne		L$7
0056  4F				dec		edi
0057  66 A9                                           f.
0059				L$7:
0059  89 CF				mov		edi,ecx
005B  07				pop		es
005C  89 3C 24				mov		dword ptr [esp],edi
005F  89 DF				mov		edi,ebx
0061  06				push		es
0062  8C D8				mov		eax,ds
0064  8E C0				mov		es,eax
0066  29 C9				sub		ecx,ecx
0068  49				dec		ecx
0069  31 C0				xor		eax,eax
006B  F2 AE				repne scasb	
006D  F7 D1				not		ecx
006F  49				dec		ecx
0070  07				pop		es
0071  89 CD				mov		ebp,ecx
0073				L$8:
0073  8B 0C 24				mov		ecx,dword ptr [esp]
0076  29 F1				sub		ecx,esi
0078  39 E9				cmp		ecx,ebp
007A  7C 3F				jl		L$12
007C  89 F7				mov		edi,esi
007E  8A 03				mov		al,byte ptr [ebx]
0080  06				push		es
0081  E3 0B				jecxz		L$9
0083  8C DA				mov		edx,ds
0085  8E C2				mov		es,edx
0087  F2 AE				repne scasb	
0089  75 03				jne		L$9
008B  4F				dec		edi
008C  66 A9                                           f.
008E				L$9:
008E  89 CF				mov		edi,ecx
0090  07				pop		es
0091  89 FA				mov		edx,edi
0093  85 FF				test		edi,edi
0095  74 24				je		L$12
0097  89 FE				mov		esi,edi
0099  89 E9				mov		ecx,ebp
009B  89 DF				mov		edi,ebx
009D  06				push		es
009E  8C D8				mov		eax,ds
00A0  8E C0				mov		es,eax
00A2  31 C0				xor		eax,eax
00A4  F3 A6				repe cmpsb	
00A6  74 05				je		L$10
00A8  19 C0				sbb		eax,eax
00AA  83 D8 FF				sbb		eax,0xffffffff
00AD				L$10:
00AD  07				pop		es
00AE  85 C0				test		eax,eax
00B0  75 04				jne		L$11
00B2  89 D0				mov		eax,edx
00B4  EB 07				jmp		L$13
00B6				L$11:
00B6  8D 72 01				lea		esi,0x1[edx]
00B9  EB B8				jmp		L$8
00BB				L$12:
00BB  31 C0				xor		eax,eax
00BD				L$13:
00BD  83 C4 04				add		esp,0x00000004
00C0  5D				pop		ebp
00C1  5F				pop		edi
00C2  5E				pop		esi
00C3  5B				pop		ebx
00C4  C3				ret		

Routine Size: 197 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

