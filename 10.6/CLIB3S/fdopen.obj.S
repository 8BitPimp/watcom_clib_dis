Module: fdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000013B bytes
0000				fdopen:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
000B  83 FD FF				cmp		ebp,0xffffffff
000E  75 11				jne		L$2
0010  6A 04				push		0x00000004
0012  E8 00 00 00 00			call		__set_errno
0017  83 C4 04				add		esp,0x00000004
001A				L$1:
001A  31 C0				xor		eax,eax
001C  E9 9E 00 00 00			jmp		L$5
0021				L$2:
0021  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0025  52				push		edx
0026  E8 00 00 00 00			call		__open_flags
002B  83 C4 04				add		esp,0x00000004
002E  89 C6				mov		esi,eax
0030  89 04 24				mov		dword ptr [esp],eax
0033  85 C0				test		eax,eax
0035  0F 84 84 00 00 00			je		L$5
003B  50				push		eax
003C  55				push		ebp
003D  E8 00 00 00 00			call		__iomode
0042  83 C4 08				add		esp,0x00000008
0045  83 F8 FF				cmp		eax,0xffffffff
0048  74 D0				je		L$1
004A  55				push		ebp
004B  E8 00 00 00 00			call		__allocfp
0050  89 C3				mov		ebx,eax
0052  83 C4 04				add		esp,0x00000004
0055  89 C7				mov		edi,eax
0057  85 C0				test		eax,eax
0059  74 62				je		L$4
005B  8A 60 0C				mov		ah,byte ptr 0xc[eax]
005E  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
0065  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
006C  80 E4 FC				and		ah,0xfc
006F  C7 43 14 00 00 00 00		mov		dword ptr 0x14[ebx],0x00000000
0076  88 63 0C				mov		byte ptr 0xc[ebx],ah
0079  8B 4B 0C				mov		ecx,dword ptr 0xc[ebx]
007C  89 6B 10				mov		dword ptr 0x10[ebx],ebp
007F  09 F1				or		ecx,esi
0081  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0085  31 C0				xor		eax,eax
0087  89 4B 0C				mov		dword ptr 0xc[ebx],ecx
008A  8A 06				mov		al,byte ptr [esi]
008C  50				push		eax
008D  E8 00 00 00 00			call		tolower
0092  83 C4 04				add		esp,0x00000004
0095  83 F8 61				cmp		eax,0x00000061
0098  75 0D				jne		L$3
009A  6A 02				push		0x00000002
009C  6A 00				push		0x00000000
009E  53				push		ebx
009F  E8 00 00 00 00			call		fseek
00A4  83 C4 0C				add		esp,0x0000000c
00A7				L$3:
00A7  57				push		edi
00A8  E8 00 00 00 00			call		__chktty
00AD  83 C4 04				add		esp,0x00000004
00B0  8B 34 24				mov		esi,dword ptr [esp]
00B3  56				push		esi
00B4  55				push		ebp
00B5  E8 00 00 00 00			call		__SetIOMode
00BA  83 C4 08				add		esp,0x00000008
00BD				L$4:
00BD  89 F8				mov		eax,edi
00BF				L$5:
00BF  83 C4 04				add		esp,0x00000004
00C2  5D				pop		ebp
00C3  5F				pop		edi
00C4  5E				pop		esi
00C5  5B				pop		ebx
00C6  C3				ret		

Routine Size: 199 bytes,    Routine Base: _TEXT + 0000

00C7				_fdopen:
00C7  53				push		ebx
00C8  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
00CC  52				push		edx
00CD  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
00D1  53				push		ebx
00D2  E8 00 00 00 00			call		fdopen
00D7  83 C4 08				add		esp,0x00000008
00DA  5B				pop		ebx
00DB  C3				ret		
00DC				__iomode:
00DC  53				push		ebx
00DD  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00E1  52				push		edx
00E2  E8 00 00 00 00			call		__IOMode
00E7  83 C4 04				add		esp,0x00000004
00EA  89 C2				mov		edx,eax
00EC  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
00F0  89 C3				mov		ebx,eax
00F2  31 CA				xor		edx,ecx
00F4  31 C0				xor		eax,eax
00F6  F6 C2 C0				test		dl,0xc0
00F9  74 05				je		L$6
00FB  B8 06 00 00 00			mov		eax,0x00000006
0100				L$6:
0100  F6 44 24 0C 01			test		byte ptr 0xc[esp],0x01
0105  74 0A				je		L$7
0107  F6 C3 01				test		bl,0x01
010A  75 05				jne		L$7
010C  B8 06 00 00 00			mov		eax,0x00000006
0111				L$7:
0111  F6 44 24 0C 02			test		byte ptr 0xc[esp],0x02
0116  74 0A				je		L$8
0118  F6 C3 02				test		bl,0x02
011B  75 05				jne		L$8
011D  B8 06 00 00 00			mov		eax,0x00000006
0122				L$8:
0122  83 F8 06				cmp		eax,0x00000006
0125  75 10				jne		L$9
0127  50				push		eax
0128  E8 00 00 00 00			call		__set_errno
012D  B8 FF FF FF FF			mov		eax,0xffffffff
0132  83 C4 04				add		esp,0x00000004
0135  5B				pop		ebx
0136  C3				ret		
0137				L$9:
0137  31 C0				xor		eax,eax
0139  5B				pop		ebx
013A  C3				ret		

Routine Size: 116 bytes,    Routine Base: _TEXT + 00C7

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

