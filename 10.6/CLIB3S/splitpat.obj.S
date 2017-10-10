Module: splitpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000011F bytes
0000				copypart:
0000  53				push		ebx
0001  56				push		esi
0002  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0006  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
000A  85 F6				test		esi,esi
000C  74 37				je		L$2
000E  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0012  39 D0				cmp		eax,edx
0014  7E 02				jle		L$1
0016  89 D0				mov		eax,edx
0018				L$1:
0018  50				push		eax
0019  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
001D  53				push		ebx
001E  E8 00 00 00 00			call		_mbsnccnt
0023  83 C4 08				add		esp,0x00000008
0026  50				push		eax
0027  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
002B  51				push		ecx
002C  56				push		esi
002D  89 C3				mov		ebx,eax
002F  E8 00 00 00 00			call		_mbsncpy
0034  83 C4 0C				add		esp,0x0000000c
0037  53				push		ebx
0038  56				push		esi
0039  E8 00 00 00 00			call		_mbsnbcnt
003E  83 C4 08				add		esp,0x00000008
0041  C6 04 06 00			mov		byte ptr [esi+eax],0x00
0045				L$2:
0045  5E				pop		esi
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

0048				_splitpath:
0048  53				push		ebx
0049  56				push		esi
004A  57				push		edi
004B  55				push		ebp
004C  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0050  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0054  80 3B 00				cmp		byte ptr [ebx],0x00
0057  74 1F				je		L$4
0059  31 D2				xor		edx,edx
005B  8A 53 01				mov		dl,byte ptr 0x1[ebx]
005E  83 FA 3A				cmp		edx,0x0000003a
0061  75 15				jne		L$4
0063  85 C0				test		eax,eax
0065  74 0C				je		L$3
0067  8A 13				mov		dl,byte ptr [ebx]
0069  C6 40 01 3A			mov		byte ptr 0x1[eax],0x3a
006D  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
0071  88 10				mov		byte ptr [eax],dl
0073				L$3:
0073  83 C3 02				add		ebx,0x00000002
0076  EB 07				jmp		L$5
0078				L$4:
0078  85 C0				test		eax,eax
007A  74 03				je		L$5
007C  C6 00 00				mov		byte ptr [eax],0x00
007F				L$5:
007F  89 DF				mov		edi,ebx
0081  89 DD				mov		ebp,ebx
0083				L$6:
0083  31 F6				xor		esi,esi
0085				L$7:
0085  80 3B 00				cmp		byte ptr [ebx],0x00
0088  74 44				je		L$12
008A  53				push		ebx
008B  E8 00 00 00 00			call		_mbptov
0090  83 C4 04				add		esp,0x00000004
0093  89 C2				mov		edx,eax
0095  83 F8 2E				cmp		eax,0x0000002e
0098  75 05				jne		L$8
009A  89 DE				mov		esi,ebx
009C  43				inc		ebx
009D  EB E6				jmp		L$7
009F				L$8:
009F  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00A6  74 13				je		L$9
00A8  31 C0				xor		eax,eax
00AA  8A 03				mov		al,byte ptr [ebx]
00AC  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
00B2  24 01				and		al,0x01
00B4  25 FF 00 00 00			and		eax,0x000000ff
00B9  EB 02				jmp		L$10
00BB				L$9:
00BB  31 C0				xor		eax,eax
00BD				L$10:
00BD  43				inc		ebx
00BE  01 C3				add		ebx,eax
00C0  83 FA 5C				cmp		edx,0x0000005c
00C3  74 05				je		L$11
00C5  83 FA 2F				cmp		edx,0x0000002f
00C8  75 BB				jne		L$7
00CA				L$11:
00CA  89 DF				mov		edi,ebx
00CC  EB B5				jmp		L$6
00CE				L$12:
00CE  89 F8				mov		eax,edi
00D0  68 FF 00 00 00			push		0x000000ff
00D5  29 E8				sub		eax,ebp
00D7  50				push		eax
00D8  55				push		ebp
00D9  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
00DD  55				push		ebp
00DE  E8 00 00 00 00			call		copypart
00E3  83 C4 10				add		esp,0x00000010
00E6  85 F6				test		esi,esi
00E8  75 02				jne		L$13
00EA  89 DE				mov		esi,ebx
00EC				L$13:
00EC  89 F0				mov		eax,esi
00EE  68 FF 00 00 00			push		0x000000ff
00F3  29 F8				sub		eax,edi
00F5  50				push		eax
00F6  57				push		edi
00F7  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
00FB  50				push		eax
00FC  E8 00 00 00 00			call		copypart
0101  83 C4 10				add		esp,0x00000010
0104  68 FF 00 00 00			push		0x000000ff
0109  29 F3				sub		ebx,esi
010B  53				push		ebx
010C  56				push		esi
010D  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
0111  52				push		edx
0112  E8 00 00 00 00			call		copypart
0117  83 C4 10				add		esp,0x00000010
011A  5D				pop		ebp
011B  5F				pop		edi
011C  5E				pop		esi
011D  5B				pop		ebx
011E  C3				ret		

Routine Size: 215 bytes,    Routine Base: _TEXT + 0048

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

