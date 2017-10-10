Module: usplit2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FB bytes
0000				pcopy:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0007  85 C0				test		eax,eax
0009  75 06				jne		L$1
000B  8B 45 10				mov		eax,dword ptr 0x10[ebp]
000E  5D				pop		ebp
000F  5B				pop		ebx
0010  C3				ret		
0011				L$1:
0011  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
0014  89 18				mov		dword ptr [eax],ebx
0016  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0019  2B 45 14				sub		eax,dword ptr 0x14[ebp]
001C  D1 F8				sar		eax,0x01
001E  3D 07 01 00 00			cmp		eax,0x00000107
0023  72 05				jb		L$2
0025  B8 06 01 00 00			mov		eax,0x00000106
002A				L$2:
002A  8D 1C 00				lea		ebx,[eax+eax]
002D  53				push		ebx
002E  FF 75 14				push		dword ptr 0x14[ebp]
0031  FF 75 10				push		dword ptr 0x10[ebp]
0034  E8 00 00 00 00			call		memcpy
0039  8B 45 10				mov		eax,dword ptr 0x10[ebp]
003C  01 D8				add		eax,ebx
003E  83 C4 0C				add		esp,0x0000000c
0041  66 C7 00 00 00			mov		word ptr [eax],0x0000
0046  40				inc		eax
0047  40				inc		eax
0048  5D				pop		ebp
0049  5B				pop		ebx
004A  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0000

004B				_u_splitpath2:
004B  53				push		ebx
004C  56				push		esi
004D  57				push		edi
004E  C8 04 00 00			enter		0x0004,0x00
0052  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0055  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0058  8B 75 1C				mov		esi,dword ptr 0x1c[ebp]
005B  66 83 3B 00			cmp		word ptr [ebx],0x0000
005F  74 29				je		L$4
0061  0F B7 53 02			movzx		edx,word ptr 0x2[ebx]
0065  83 FA 3A				cmp		edx,0x0000003a
0068  75 20				jne		L$4
006A  85 F6				test		esi,esi
006C  74 17				je		L$3
006E  89 06				mov		dword ptr [esi],eax
0070  66 8B 13				mov		dx,word ptr [ebx]
0073  66 C7 40 02 3A 00			mov		word ptr 0x2[eax],0x003a
0079  66 C7 40 04 00 00			mov		word ptr 0x4[eax],0x0000
007F  66 89 10				mov		word ptr [eax],dx
0082  83 C0 06				add		eax,0x00000006
0085				L$3:
0085  83 C3 04				add		ebx,0x00000004
0088  EB 0D				jmp		L$5
008A				L$4:
008A  85 F6				test		esi,esi
008C  74 09				je		L$5
008E  89 06				mov		dword ptr [esi],eax
0090  66 C7 00 00 00			mov		word ptr [eax],0x0000
0095  40				inc		eax
0096  40				inc		eax
0097				L$5:
0097  89 DF				mov		edi,ebx
0099  89 5D FC				mov		dword ptr -0x4[ebp],ebx
009C				L$6:
009C  31 F6				xor		esi,esi
009E				L$7:
009E  66 8B 13				mov		dx,word ptr [ebx]
00A1  66 85 D2				test		dx,dx
00A4  74 1E				je		L$10
00A6  0F B7 D2				movzx		edx,dx
00A9  83 FA 2E				cmp		edx,0x0000002e
00AC  75 06				jne		L$8
00AE  89 DE				mov		esi,ebx
00B0  43				inc		ebx
00B1  43				inc		ebx
00B2  EB EA				jmp		L$7
00B4				L$8:
00B4  43				inc		ebx
00B5  43				inc		ebx
00B6  83 FA 5C				cmp		edx,0x0000005c
00B9  74 05				je		L$9
00BB  83 FA 2F				cmp		edx,0x0000002f
00BE  75 DE				jne		L$7
00C0				L$9:
00C0  89 DF				mov		edi,ebx
00C2  EB D8				jmp		L$6
00C4				L$10:
00C4  57				push		edi
00C5  FF 75 FC				push		dword ptr -0x4[ebp]
00C8  50				push		eax
00C9  FF 75 20				push		dword ptr 0x20[ebp]
00CC  E8 00 00 00 00			call		pcopy
00D1  83 C4 10				add		esp,0x00000010
00D4  85 F6				test		esi,esi
00D6  75 02				jne		L$11
00D8  89 DE				mov		esi,ebx
00DA				L$11:
00DA  56				push		esi
00DB  57				push		edi
00DC  50				push		eax
00DD  FF 75 24				push		dword ptr 0x24[ebp]
00E0  E8 00 00 00 00			call		pcopy
00E5  83 C4 10				add		esp,0x00000010
00E8  53				push		ebx
00E9  56				push		esi
00EA  50				push		eax
00EB  FF 75 28				push		dword ptr 0x28[ebp]
00EE  E8 00 00 00 00			call		pcopy
00F3  83 C4 10				add		esp,0x00000010
00F6  C9				leave		
00F7  5F				pop		edi
00F8  5E				pop		esi
00F9  5B				pop		ebx
00FA  C3				ret		

Routine Size: 176 bytes,    Routine Base: _TEXT + 004B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

