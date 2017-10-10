Module: fdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FA bytes
0000				fdopen_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C1				mov		ecx,eax
0007  89 D3				mov		ebx,edx
0009  83 F8 FF				cmp		eax,0xffffffff
000C  75 11				jne		L$2
000E  B8 04 00 00 00			mov		eax,0x00000004
0013  E8 00 00 00 00			call		__set_errno_
0018				L$1:
0018  31 C0				xor		eax,eax
001A  E9 87 00 00 00			jmp		L$5
001F				L$2:
001F  89 D0				mov		eax,edx
0021  E8 00 00 00 00			call		__open_flags_
0026  89 C6				mov		esi,eax
0028  89 C5				mov		ebp,eax
002A  85 C0				test		eax,eax
002C  0F 84 74 00 00 00			je		L$5
0032  89 C8				mov		eax,ecx
0034  89 F2				mov		edx,esi
0036  E8 00 00 00 00			call		__iomode_
003B  83 F8 FF				cmp		eax,0xffffffff
003E  74 D8				je		L$1
0040  89 C8				mov		eax,ecx
0042  E8 00 00 00 00			call		__allocfp_
0047  89 C2				mov		edx,eax
0049  89 C7				mov		edi,eax
004B  85 C0				test		eax,eax
004D  74 55				je		L$4
004F  8A 60 0C				mov		ah,byte ptr 0xc[eax]
0052  C7 42 04 00 00 00 00		mov		dword ptr 0x4[edx],0x00000000
0059  C7 42 08 00 00 00 00		mov		dword ptr 0x8[edx],0x00000000
0060  80 E4 FC				and		ah,0xfc
0063  C7 42 14 00 00 00 00		mov		dword ptr 0x14[edx],0x00000000
006A  88 62 0C				mov		byte ptr 0xc[edx],ah
006D  8B 42 0C				mov		eax,dword ptr 0xc[edx]
0070  89 4A 10				mov		dword ptr 0x10[edx],ecx
0073  09 F0				or		eax,esi
0075  89 42 0C				mov		dword ptr 0xc[edx],eax
0078  31 C0				xor		eax,eax
007A  8A 03				mov		al,byte ptr [ebx]
007C  E8 00 00 00 00			call		tolower_
0081  83 F8 61				cmp		eax,0x00000061
0084  75 0E				jne		L$3
0086  BB 02 00 00 00			mov		ebx,0x00000002
008B  89 D0				mov		eax,edx
008D  31 D2				xor		edx,edx
008F  E8 00 00 00 00			call		fseek_
0094				L$3:
0094  89 F8				mov		eax,edi
0096  E8 00 00 00 00			call		__chktty_
009B  89 EA				mov		edx,ebp
009D  89 C8				mov		eax,ecx
009F  E8 00 00 00 00			call		__SetIOMode_
00A4				L$4:
00A4  89 F8				mov		eax,edi
00A6				L$5:
00A6  5D				pop		ebp
00A7  5F				pop		edi
00A8  5E				pop		esi
00A9  59				pop		ecx
00AA  5B				pop		ebx
00AB  C3				ret		
00AC				__iomode_:
00AC  53				push		ebx
00AD  51				push		ecx
00AE  E8 00 00 00 00			call		__IOMode_
00B3  89 C1				mov		ecx,eax
00B5  89 C3				mov		ebx,eax
00B7  31 D1				xor		ecx,edx
00B9  31 C0				xor		eax,eax
00BB  F6 C1 C0				test		cl,0xc0
00BE  74 05				je		L$6
00C0  B8 06 00 00 00			mov		eax,0x00000006
00C5				L$6:
00C5  F6 C2 01				test		dl,0x01
00C8  74 0A				je		L$7
00CA  F6 C3 01				test		bl,0x01
00CD  75 05				jne		L$7
00CF  B8 06 00 00 00			mov		eax,0x00000006
00D4				L$7:
00D4  F6 C2 02				test		dl,0x02
00D7  74 0A				je		L$8
00D9  F6 C3 02				test		bl,0x02
00DC  75 05				jne		L$8
00DE  B8 06 00 00 00			mov		eax,0x00000006
00E3				L$8:
00E3  83 F8 06				cmp		eax,0x00000006
00E6  75 0D				jne		L$9
00E8  E8 00 00 00 00			call		__set_errno_
00ED  B8 FF FF FF FF			mov		eax,0xffffffff
00F2  59				pop		ecx
00F3  5B				pop		ebx
00F4  C3				ret		
00F5				L$9:
00F5  31 C0				xor		eax,eax
00F7  59				pop		ecx
00F8  5B				pop		ebx
00F9  C3				ret		

Routine Size: 250 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

