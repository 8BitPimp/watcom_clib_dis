Module: uspltpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FD bytes
0000				copypart:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  83 7D 0C 00			cmp		dword ptr 0xc[ebp],0x00000000
0008  74 2B				je		L$2
000A  8B 45 14				mov		eax,dword ptr 0x14[ebp]
000D  3B 45 18				cmp		eax,dword ptr 0x18[ebp]
0010  7E 06				jle		L$1
0012  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0015  89 45 14				mov		dword ptr 0x14[ebp],eax
0018				L$1:
0018  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
001B  01 DB				add		ebx,ebx
001D  53				push		ebx
001E  FF 75 10				push		dword ptr 0x10[ebp]
0021  FF 75 0C				push		dword ptr 0xc[ebp]
0024  E8 00 00 00 00			call		memcpy
0029  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
002C  83 C4 0C				add		esp,0x0000000c
002F  66 C7 04 03 00 00			mov		word ptr [ebx+eax],0x0000
0035				L$2:
0035  5D				pop		ebp
0036  5B				pop		ebx
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

0038				_u_splitpath:
0038  53				push		ebx
0039  56				push		esi
003A  57				push		edi
003B  C8 04 00 00			enter		0x0004,0x00
003F  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0042  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0045  66 83 3B 00			cmp		word ptr [ebx],0x0000
0049  74 24				je		L$4
004B  0F B7 53 02			movzx		edx,word ptr 0x2[ebx]
004F  83 FA 3A				cmp		edx,0x0000003a
0052  75 1B				jne		L$4
0054  85 C0				test		eax,eax
0056  74 12				je		L$3
0058  66 8B 13				mov		dx,word ptr [ebx]
005B  66 C7 40 02 3A 00			mov		word ptr 0x2[eax],0x003a
0061  66 C7 40 04 00 00			mov		word ptr 0x4[eax],0x0000
0067  66 89 10				mov		word ptr [eax],dx
006A				L$3:
006A  83 C3 04				add		ebx,0x00000004
006D  EB 09				jmp		L$5
006F				L$4:
006F  85 C0				test		eax,eax
0071  74 05				je		L$5
0073  66 C7 00 00 00			mov		word ptr [eax],0x0000
0078				L$5:
0078  89 DF				mov		edi,ebx
007A  89 5D FC				mov		dword ptr -0x4[ebp],ebx
007D				L$6:
007D  31 F6				xor		esi,esi
007F				L$7:
007F  66 83 3B 00			cmp		word ptr [ebx],0x0000
0083  74 24				je		L$10
0085  66 8B 03				mov		ax,word ptr [ebx]
0088  0F B7 C0				movzx		eax,ax
008B  8D 53 02				lea		edx,0x2[ebx]
008E  83 F8 2E				cmp		eax,0x0000002e
0091  75 06				jne		L$8
0093  89 DE				mov		esi,ebx
0095  89 D3				mov		ebx,edx
0097  EB E6				jmp		L$7
0099				L$8:
0099  89 D3				mov		ebx,edx
009B  83 F8 5C				cmp		eax,0x0000005c
009E  74 05				je		L$9
00A0  83 F8 2F				cmp		eax,0x0000002f
00A3  75 DA				jne		L$7
00A5				L$9:
00A5  89 DF				mov		edi,ebx
00A7  EB D4				jmp		L$6
00A9				L$10:
00A9  89 F8				mov		eax,edi
00AB  2B 45 FC				sub		eax,dword ptr -0x4[ebp]
00AE  68 FF 00 00 00			push		0x000000ff
00B3  D1 F8				sar		eax,0x01
00B5  50				push		eax
00B6  FF 75 FC				push		dword ptr -0x4[ebp]
00B9  FF 75 1C				push		dword ptr 0x1c[ebp]
00BC  E8 00 00 00 00			call		copypart
00C1  83 C4 10				add		esp,0x00000010
00C4  85 F6				test		esi,esi
00C6  75 02				jne		L$11
00C8  89 DE				mov		esi,ebx
00CA				L$11:
00CA  89 F0				mov		eax,esi
00CC  29 F8				sub		eax,edi
00CE  68 FF 00 00 00			push		0x000000ff
00D3  D1 F8				sar		eax,0x01
00D5  50				push		eax
00D6  57				push		edi
00D7  FF 75 20				push		dword ptr 0x20[ebp]
00DA  E8 00 00 00 00			call		copypart
00DF  83 C4 10				add		esp,0x00000010
00E2  29 F3				sub		ebx,esi
00E4  68 FF 00 00 00			push		0x000000ff
00E9  D1 FB				sar		ebx,0x01
00EB  53				push		ebx
00EC  56				push		esi
00ED  FF 75 24				push		dword ptr 0x24[ebp]
00F0  E8 00 00 00 00			call		copypart
00F5  83 C4 10				add		esp,0x00000010
00F8  C9				leave		
00F9  5F				pop		edi
00FA  5E				pop		esi
00FB  5B				pop		ebx
00FC  C3				ret		

Routine Size: 197 bytes,    Routine Base: _TEXT + 0038

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

