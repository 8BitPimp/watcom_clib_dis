Module: winio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000142 bytes
0000				_DoStdin_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 C1				mov		ecx,eax
0006  89 D6				mov		esi,edx
0008  89 DF				mov		edi,ebx
000A  85 C0				test		eax,eax
000C  74 49				je		L$3
000E  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0012  75 07				jne		L$1
0014  89 C8				mov		eax,ecx
0016  E8 00 00 00 00			call		_MakeWindowActive_
001B				L$1:
001B  89 C8				mov		eax,ecx
001D  89 F2				mov		edx,esi
001F  89 FB				mov		ebx,edi
0021  E8 00 00 00 00			call		_GetString_
0026  8B 2D 00 00 00 00			mov		ebp,dword ptr __GotEOF
002C  89 C1				mov		ecx,eax
002E  8D 58 01				lea		ebx,0x1[eax]
0031  8D 14 06				lea		edx,[esi+eax]
0034  85 ED				test		ebp,ebp
0036  74 0E				je		L$2
0038  39 F8				cmp		eax,edi
003A  73 1B				jae		L$3
003C  89 D8				mov		eax,ebx
003E  C6 02 1A				mov		byte ptr [edx],0x1a
0041  5D				pop		ebp
0042  5F				pop		edi
0043  5E				pop		esi
0044  59				pop		ecx
0045  C3				ret		
0046				L$2:
0046  8D 48 02				lea		ecx,0x2[eax]
0049  39 F9				cmp		ecx,edi
004B  73 0A				jae		L$3
004D  C6 02 0D				mov		byte ptr [edx],0x0d
0050  8D 43 01				lea		eax,0x1[ebx]
0053  C6 04 1E 0A			mov		byte ptr [esi+ebx],0x0a
0057				L$3:
0057  5D				pop		ebp
0058  5F				pop		edi
0059  5E				pop		esi
005A  59				pop		ecx
005B  C3				ret		

Routine Size: 92 bytes,    Routine Base: _TEXT + 0000

005C				_DoStdout_:
005C  51				push		ecx
005D  56				push		esi
005E  89 C1				mov		ecx,eax
0060  89 DE				mov		esi,ebx
0062  85 C0				test		eax,eax
0064  75 07				jne		L$4
0066  31 DE				xor		esi,ebx
0068  89 F0				mov		eax,esi
006A  5E				pop		esi
006B  59				pop		ecx
006C  C3				ret		
006D				L$4:
006D  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0071  75 07				jne		L$5
0073  89 C8				mov		eax,ecx
0075  E8 00 00 00 00			call		_MakeWindowActive_
007A				L$5:
007A  89 C8				mov		eax,ecx
007C  89 F3				mov		ebx,esi
007E  E8 00 00 00 00			call		_AddLine_
0083  B8 01 00 00 00			mov		eax,0x00000001
0088  E8 00 00 00 00			call		_MessageLoop_
008D  89 F0				mov		eax,esi
008F  5E				pop		esi
0090  59				pop		ecx
0091				L$6:
0091  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 005C

0092				_DoKbhit_:
0092  85 C0				test		eax,eax
0094  74 FB				je		L$6
0096  F6 40 52 02			test		byte ptr 0x52[eax],0x02
009A  0F 85 00 00 00 00			jne		_KeyboardHit_
00A0  E8 00 00 00 00			call		_MakeWindowActive_
00A5  E9 00 00 00 00			jmp		_KeyboardHit_

Routine Size: 24 bytes,    Routine Base: _TEXT + 0092

00AA				_DoGetch_:
00AA  52				push		edx
00AB  85 C0				test		eax,eax
00AD  74 29				je		L$8
00AF  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00B3  75 05				jne		L$7
00B5  E8 00 00 00 00			call		_MakeWindowActive_
00BA				L$7:
00BA  E8 00 00 00 00			call		_KeyboardHit_
00BF  85 C0				test		eax,eax
00C1  74 F7				je		L$7
00C3  31 C0				xor		eax,eax
00C5  E8 00 00 00 00			call		_GetKeyboard_
00CA  89 C2				mov		edx,eax
00CC  3D 80 00 00 00			cmp		eax,0x00000080
00D1  76 05				jbe		L$8
00D3  2D 80 00 00 00			sub		eax,0x00000080
00D8				L$8:
00D8  5A				pop		edx
00D9  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 00AA

00DA				_DoGetche_:
00DA  53				push		ebx
00DB  51				push		ecx
00DC  52				push		edx
00DD  89 C2				mov		edx,eax
00DF  E8 00 00 00 00			call		_DoGetch_
00E4  89 C3				mov		ebx,eax
00E6  89 C1				mov		ecx,eax
00E8  83 F8 0D				cmp		eax,0x0000000d
00EB  75 09				jne		L$9
00ED  89 D0				mov		eax,edx
00EF  BA 0A 00 00 00			mov		edx,0x0000000a
00F4  EB 04				jmp		L$10
00F6				L$9:
00F6  89 D0				mov		eax,edx
00F8  89 DA				mov		edx,ebx
00FA				L$10:
00FA  E8 00 00 00 00			call		_DoPutch_
00FF  89 C8				mov		eax,ecx
0101  5A				pop		edx
0102  59				pop		ecx
0103  5B				pop		ebx
0104  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 00DA

0105				_DoPutch_:
0105  53				push		ebx
0106  83 EC 04				sub		esp,0x00000004
0109  89 C3				mov		ebx,eax
010B  85 C0				test		eax,eax
010D  74 2E				je		L$12
010F  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0113  75 07				jne		L$11
0115  89 D8				mov		eax,ebx
0117  E8 00 00 00 00			call		_MakeWindowActive_
011C				L$11:
011C  88 14 24				mov		byte ptr [esp],dl
011F  89 D8				mov		eax,ebx
0121  30 D2				xor		dl,dl
0123  BB 01 00 00 00			mov		ebx,0x00000001
0128  88 54 24 01			mov		byte ptr 0x1[esp],dl
012C  89 E2				mov		edx,esp
012E  E8 00 00 00 00			call		_AddLine_
0133  B8 01 00 00 00			mov		eax,0x00000001
0138  E8 00 00 00 00			call		_MessageLoop_
013D				L$12:
013D  83 C4 04				add		esp,0x00000004
0140  5B				pop		ebx
0141  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0105

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

