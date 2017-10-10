Module: ufdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000118 bytes
0000				_ufdopen:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  C8 04 00 00			enter		0x0004,0x00
0007  83 7D 14 FF			cmp		dword ptr 0x14[ebp],0xffffffff
000B  75 11				jne		L$2
000D  6A 04				push		0x00000004
000F  E8 00 00 00 00			call		__set_errno
0014  83 C4 04				add		esp,0x00000004
0017				L$1:
0017  31 C0				xor		eax,eax
0019  C9				leave		
001A  5F				pop		edi
001B  5E				pop		esi
001C  5B				pop		ebx
001D  C3				ret		
001E				L$2:
001E  FF 75 18				push		dword ptr 0x18[ebp]
0021  E8 00 00 00 00			call		__uopen_flags
0026  89 C6				mov		esi,eax
0028  83 C4 04				add		esp,0x00000004
002B  89 45 FC				mov		dword ptr -0x4[ebp],eax
002E  85 C0				test		eax,eax
0030  0F 84 80 00 00 00			je		L$5
0036  50				push		eax
0037  FF 75 14				push		dword ptr 0x14[ebp]
003A  E8 00 00 00 00			call		__iomode
003F  83 C4 08				add		esp,0x00000008
0042  83 F8 FF				cmp		eax,0xffffffff
0045  74 D0				je		L$1
0047  FF 75 14				push		dword ptr 0x14[ebp]
004A  E8 00 00 00 00			call		__allocfp
004F  89 C3				mov		ebx,eax
0051  83 C4 04				add		esp,0x00000004
0054  89 C7				mov		edi,eax
0056  85 C0				test		eax,eax
0058  74 5A				je		L$4
005A  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0061  C7 40 08 00 00 00 00		mov		dword ptr 0x8[eax],0x00000000
0068  C7 40 14 00 00 00 00		mov		dword ptr 0x14[eax],0x00000000
006F  80 60 0C FC			and		byte ptr 0xc[eax],0xfc
0073  09 70 0C				or		dword ptr 0xc[eax],esi
0076  8B 45 14				mov		eax,dword ptr 0x14[ebp]
0079  89 43 10				mov		dword ptr 0x10[ebx],eax
007C  8B 45 18				mov		eax,dword ptr 0x18[ebp]
007F  0F B7 00				movzx		eax,word ptr [eax]
0082  50				push		eax
0083  E8 00 00 00 00			call		_utolower
0088  83 C4 04				add		esp,0x00000004
008B  83 F8 61				cmp		eax,0x00000061
008E  75 0D				jne		L$3
0090  6A 02				push		0x00000002
0092  6A 00				push		0x00000000
0094  53				push		ebx
0095  E8 00 00 00 00			call		fseek
009A  83 C4 0C				add		esp,0x0000000c
009D				L$3:
009D  57				push		edi
009E  E8 00 00 00 00			call		__chktty
00A3  83 C4 04				add		esp,0x00000004
00A6  FF 75 FC				push		dword ptr -0x4[ebp]
00A9  FF 75 14				push		dword ptr 0x14[ebp]
00AC  E8 00 00 00 00			call		__SetIOMode
00B1  83 C4 08				add		esp,0x00000008
00B4				L$4:
00B4  89 F8				mov		eax,edi
00B6				L$5:
00B6  C9				leave		
00B7  5F				pop		edi
00B8  5E				pop		esi
00B9  5B				pop		ebx
00BA  C3				ret		
00BB				__iomode:
00BB  53				push		ebx
00BC  55				push		ebp
00BD  89 E5				mov		ebp,esp
00BF  FF 75 0C				push		dword ptr 0xc[ebp]
00C2  E8 00 00 00 00			call		__IOMode
00C7  89 C2				mov		edx,eax
00C9  83 C4 04				add		esp,0x00000004
00CC  89 C3				mov		ebx,eax
00CE  33 55 10				xor		edx,dword ptr 0x10[ebp]
00D1  31 C0				xor		eax,eax
00D3  F6 C2 C0				test		dl,0xc0
00D6  74 05				je		L$6
00D8  B8 06 00 00 00			mov		eax,0x00000006
00DD				L$6:
00DD  F6 45 10 01			test		byte ptr 0x10[ebp],0x01
00E1  74 0A				je		L$7
00E3  F6 C3 01				test		bl,0x01
00E6  75 05				jne		L$7
00E8  B8 06 00 00 00			mov		eax,0x00000006
00ED				L$7:
00ED  F6 45 10 02			test		byte ptr 0x10[ebp],0x02
00F1  74 0A				je		L$8
00F3  F6 C3 02				test		bl,0x02
00F6  75 05				jne		L$8
00F8  B8 06 00 00 00			mov		eax,0x00000006
00FD				L$8:
00FD  83 F8 06				cmp		eax,0x00000006
0100  75 11				jne		L$9
0102  50				push		eax
0103  E8 00 00 00 00			call		__set_errno
0108  B8 FF FF FF FF			mov		eax,0xffffffff
010D  83 C4 04				add		esp,0x00000004
0110  5D				pop		ebp
0111  5B				pop		ebx
0112  C3				ret		
0113				L$9:
0113  31 C0				xor		eax,eax
0115  5D				pop		ebp
0116  5B				pop		ebx
0117  C3				ret		

Routine Size: 280 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

