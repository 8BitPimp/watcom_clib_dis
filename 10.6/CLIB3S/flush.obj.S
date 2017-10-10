Module: flush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FA bytes
0000				__flush:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  8B 53 10				mov		edx,dword ptr 0x10[ebx]
000E  52				push		edx
000F  31 FF				xor		edi,edi
0011  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0017  8A 63 0D				mov		ah,byte ptr 0xd[ebx]
001A  83 C4 04				add		esp,0x00000004
001D  F6 C4 10				test		ah,0x10
0020  0F 84 79 00 00 00			je		L$4
0026  88 E5				mov		ch,ah
0028  80 E5 EF				and		ch,0xef
002B  8A 43 0C				mov		al,byte ptr 0xc[ebx]
002E  88 6B 0D				mov		byte ptr 0xd[ebx],ch
0031  A8 02				test		al,0x02
0033  0F 84 9E 00 00 00			je		L$6
0039  8B 6B 08				mov		ebp,dword ptr 0x8[ebx]
003C  85 ED				test		ebp,ebp
003E  0F 84 93 00 00 00			je		L$6
0044  8B 73 04				mov		esi,dword ptr 0x4[ebx]
0047				L$1:
0047  85 F6				test		esi,esi
0049  0F 84 88 00 00 00			je		L$6
004F  85 FF				test		edi,edi
0051  0F 85 80 00 00 00			jne		L$6
0057  56				push		esi
0058  55				push		ebp
0059  8B 43 10				mov		eax,dword ptr 0x10[ebx]
005C  50				push		eax
005D  E8 00 00 00 00			call		__qwrite
0062  83 C4 0C				add		esp,0x0000000c
0065  89 04 24				mov		dword ptr [esp],eax
0068  83 F8 FF				cmp		eax,0xffffffff
006B  75 0D				jne		L$2
006D  8A 53 0C				mov		dl,byte ptr 0xc[ebx]
0070  80 CA 20				or		dl,0x20
0073  89 C7				mov		edi,eax
0075  88 53 0C				mov		byte ptr 0xc[ebx],dl
0078  EB 1C				jmp		L$3
007A				L$2:
007A  85 C0				test		eax,eax
007C  75 18				jne		L$3
007E  6A 0C				push		0x0000000c
0080  E8 00 00 00 00			call		__set_errno
0085  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0088  BF FF FF FF FF			mov		edi,0xffffffff
008D  80 CC 20				or		ah,0x20
0090  83 C4 04				add		esp,0x00000004
0093  88 63 0C				mov		byte ptr 0xc[ebx],ah
0096				L$3:
0096  8B 14 24				mov		edx,dword ptr [esp]
0099  01 D5				add		ebp,edx
009B  29 D6				sub		esi,edx
009D  EB A8				jmp		L$1
009F				L$4:
009F  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
00A3  74 32				je		L$6
00A5  80 63 0C EF			and		byte ptr 0xc[ebx],0xef
00A9  F6 43 0D 20			test		byte ptr 0xd[ebx],0x20
00AD  75 28				jne		L$6
00AF  8B 43 04				mov		eax,dword ptr 0x4[ebx]
00B2  85 C0				test		eax,eax
00B4  74 11				je		L$5
00B6  6A 01				push		0x00000001
00B8  F7 D8				neg		eax
00BA  50				push		eax
00BB  8B 73 10				mov		esi,dword ptr 0x10[ebx]
00BE  56				push		esi
00BF  E8 00 00 00 00			call		lseek
00C4  83 C4 0C				add		esp,0x0000000c
00C7				L$5:
00C7  83 F8 FF				cmp		eax,0xffffffff
00CA  75 0B				jne		L$6
00CC  8A 4B 0C				mov		cl,byte ptr 0xc[ebx]
00CF  80 C9 20				or		cl,0x20
00D2  89 C7				mov		edi,eax
00D4  88 4B 0C				mov		byte ptr 0xc[ebx],cl
00D7				L$6:
00D7  8B 43 08				mov		eax,dword ptr 0x8[ebx]
00DA  8B 73 10				mov		esi,dword ptr 0x10[ebx]
00DD  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
00E4  56				push		esi
00E5  89 03				mov		dword ptr [ebx],eax
00E7  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00ED  83 C4 04				add		esp,0x00000004
00F0  89 F8				mov		eax,edi
00F2  83 C4 04				add		esp,0x00000004
00F5  5D				pop		ebp
00F6  5F				pop		edi
00F7  5E				pop		esi
00F8  5B				pop		ebx
00F9  C3				ret		

Routine Size: 250 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

