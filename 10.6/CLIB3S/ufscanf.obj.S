Module: ufscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009C bytes
0000				cget_file:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0007  FF 73 08				push		dword ptr 0x8[ebx]
000A  E8 00 00 00 00			call		_ugetc
000F  83 C4 04				add		esp,0x00000004
0012  89 C2				mov		edx,eax
0014  83 F8 FF				cmp		eax,0xffffffff
0017  75 04				jne		L$1
0019  80 4B 10 02			or		byte ptr 0x10[ebx],0x02
001D				L$1:
001D  89 D0				mov		eax,edx
001F  5D				pop		ebp
0020  5B				pop		ebx
0021  C3				ret		
0022				uncget_file:
0022  55				push		ebp
0023  89 E5				mov		ebp,esp
0025  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0028  FF 70 08				push		dword ptr 0x8[eax]
002B  FF 75 08				push		dword ptr 0x8[ebp]
002E  E8 00 00 00 00			call		_uungetc
0033  83 C4 08				add		esp,0x00000008
0036  5D				pop		ebp
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

0038				_uvfscanf:
0038  53				push		ebx
0039  C8 14 00 00			enter		0x0014,0x00
003D  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0040  FF 73 10				push		dword ptr 0x10[ebx]
0043  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0049  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],offset cget_file
0050  83 C4 04				add		esp,0x00000004
0053  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],offset uncget_file
005A  89 5D F4				mov		dword ptr -0xc[ebp],ebx
005D  FF 73 10				push		dword ptr 0x10[ebx]
0060  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0066  83 C4 04				add		esp,0x00000004
0069  FF 75 14				push		dword ptr 0x14[ebp]
006C  FF 75 10				push		dword ptr 0x10[ebp]
006F  8D 45 EC				lea		eax,-0x14[ebp]
0072  50				push		eax
0073  E8 00 00 00 00			call		__uscnf
0078  83 C4 0C				add		esp,0x0000000c
007B  C9				leave		
007C  5B				pop		ebx
007D  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 0038

007E				_ufscanf:
007E  C8 04 00 00			enter		0x0004,0x00
0082  8D 45 10				lea		eax,0x10[ebp]
0085  89 45 FC				mov		dword ptr -0x4[ebp],eax
0088  8D 45 FC				lea		eax,-0x4[ebp]
008B  50				push		eax
008C  FF 75 0C				push		dword ptr 0xc[ebp]
008F  FF 75 08				push		dword ptr 0x8[ebp]
0092  E8 00 00 00 00			call		_uvfscanf
0097  83 C4 0C				add		esp,0x0000000c
009A  C9				leave		
009B  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 007E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

