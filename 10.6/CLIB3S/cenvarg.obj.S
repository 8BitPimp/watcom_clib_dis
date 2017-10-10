Module: cenvarg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000019C bytes
0000				stpcpy:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0007  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
000A				L$1:
000A  8A 13				mov		dl,byte ptr [ebx]
000C  88 10				mov		byte ptr [eax],dl
000E  84 D2				test		dl,dl
0010  74 04				je		L$2
0012  40				inc		eax
0013  43				inc		ebx
0014  EB F4				jmp		L$1
0016				L$2:
0016  5D				pop		ebp
0017  5B				pop		ebx
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

0019				__cenvarg:
0019  53				push		ebx
001A  56				push		esi
001B  57				push		edi
001C  C8 04 00 00			enter		0x0004,0x00
0020  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0023  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
0027  75 08				jne		L$3
0029  A1 00 00 00 00			mov		eax,dword ptr environ
002E  89 45 18				mov		dword ptr 0x18[ebp],eax
0031				L$3:
0031  31 F6				xor		esi,esi
0033  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
0037  74 1A				je		L$6
0039  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
003C  EB 10				jmp		L$5
003E				L$4:
003E  FF 37				push		dword ptr [edi]
0040  E8 00 00 00 00			call		strlen
0045  83 C4 04				add		esp,0x00000004
0048  40				inc		eax
0049  83 C7 04				add		edi,0x00000004
004C  01 C6				add		esi,eax
004E				L$5:
004E  83 3F 00				cmp		dword ptr [edi],0x00000000
0051  75 EB				jne		L$4
0053				L$6:
0053  46				inc		esi
0054  83 7D 2C 00			cmp		dword ptr 0x2c[ebp],0x00000000
0058  74 0F				je		L$7
005A  FF 33				push		dword ptr [ebx]
005C  E8 00 00 00 00			call		strlen
0061  83 C0 03				add		eax,0x00000003
0064  83 C4 04				add		esp,0x00000004
0067  01 C6				add		esi,eax
0069				L$7:
0069  83 C6 0F				add		esi,0x0000000f
006C  A1 00 00 00 00			mov		eax,dword ptr _amblksiz
0071  56				push		esi
0072  C7 05 00 00 00 00 10 00 00 00
					mov		dword ptr _amblksiz,0x00000010
007C  89 45 FC				mov		dword ptr -0x4[ebp],eax
007F  E8 00 00 00 00			call		_nmalloc
0084  83 C4 04				add		esp,0x00000004
0087  85 C0				test		eax,eax
0089  75 33				jne		L$8
008B  56				push		esi
008C  E8 00 00 00 00			call		malloc
0091  83 C4 04				add		esp,0x00000004
0094  85 C0				test		eax,eax
0096  75 26				jne		L$8
0098  6A 05				push		0x00000005
009A  E8 00 00 00 00			call		__set_errno
009F  83 C4 04				add		esp,0x00000004
00A2  6A 08				push		0x00000008
00A4  E8 00 00 00 00			call		__set_doserrno
00A9  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
00AC  83 C4 04				add		esp,0x00000004
00AF  A3 00 00 00 00			mov		dword ptr _amblksiz,eax
00B4  B8 FF FF FF FF			mov		eax,0xffffffff
00B9  C9				leave		
00BA  5F				pop		edi
00BB  5E				pop		esi
00BC  5B				pop		ebx
00BD  C3				ret		
00BE				L$8:
00BE  8B 7D FC				mov		edi,dword ptr -0x4[ebp]
00C1  89 3D 00 00 00 00			mov		dword ptr _amblksiz,edi
00C7  8B 7D 1C				mov		edi,dword ptr 0x1c[ebp]
00CA  89 07				mov		dword ptr [edi],eax
00CC  8B 7D 24				mov		edi,dword ptr 0x24[ebp]
00CF  C7 07 00 00 00 00			mov		dword ptr [edi],0x00000000
00D5  8B 7D 20				mov		edi,dword ptr 0x20[ebp]
00D8  89 07				mov		dword ptr [edi],eax
00DA  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
00DE  74 19				je		L$11
00E0  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
00E3  EB 0F				jmp		L$10
00E5				L$9:
00E5  FF 37				push		dword ptr [edi]
00E7  50				push		eax
00E8  E8 00 00 00 00			call		stpcpy
00ED  83 C7 04				add		edi,0x00000004
00F0  83 C4 08				add		esp,0x00000008
00F3  40				inc		eax
00F4				L$10:
00F4  83 3F 00				cmp		dword ptr [edi],0x00000000
00F7  75 EC				jne		L$9
00F9				L$11:
00F9  C6 00 00				mov		byte ptr [eax],0x00
00FC  40				inc		eax
00FD  83 7D 2C 00			cmp		dword ptr 0x2c[ebp],0x00000000
0101  74 0D				je		L$12
0103  FF 33				push		dword ptr [ebx]
0105  40				inc		eax
0106  40				inc		eax
0107  50				push		eax
0108  E8 00 00 00 00			call		strcpy
010D  83 C4 08				add		esp,0x00000008
0110				L$12:
0110  31 FF				xor		edi,edi
0112  83 3B 00				cmp		dword ptr [ebx],0x00000000
0115  74 1E				je		L$16
0117  83 C3 04				add		ebx,0x00000004
011A  EB 13				jmp		L$15
011C				L$13:
011C  85 FF				test		edi,edi
011E  74 01				je		L$14
0120  47				inc		edi
0121				L$14:
0121  50				push		eax
0122  E8 00 00 00 00			call		strlen
0127  83 C3 04				add		ebx,0x00000004
012A  83 C4 04				add		esp,0x00000004
012D  01 C7				add		edi,eax
012F				L$15:
012F  8B 03				mov		eax,dword ptr [ebx]
0131  85 C0				test		eax,eax
0133  75 E7				jne		L$13
0135				L$16:
0135  8B 45 28				mov		eax,dword ptr 0x28[ebp]
0138  81 C7 08 01 00 00			add		edi,0x00000108
013E  89 38				mov		dword ptr [eax],edi
0140  89 F0				mov		eax,esi
0142  C1 E8 04				shr		eax,0x04
0145  C9				leave		
0146  5F				pop		edi
0147  5E				pop		esi
0148  5B				pop		ebx
0149  C3				ret		

Routine Size: 305 bytes,    Routine Base: _TEXT + 0019

014A				__ccmdline:
014A  53				push		ebx
014B  55				push		ebp
014C  89 E5				mov		ebp,esp
014E  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
0151  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
0155  74 05				je		L$17
0157  8B 45 14				mov		eax,dword ptr 0x14[ebp]
015A  EB 12				jmp		L$18
015C				L$17:
015C  FF 75 0C				push		dword ptr 0xc[ebp]
015F  FF 75 14				push		dword ptr 0x14[ebp]
0162  E8 00 00 00 00			call		stpcpy
0167  83 C4 08				add		esp,0x00000008
016A  C6 00 20				mov		byte ptr [eax],0x20
016D  40				inc		eax
016E				L$18:
016E  83 3B 00				cmp		dword ptr [ebx],0x00000000
0171  74 23				je		L$20
0173  83 C3 04				add		ebx,0x00000004
0176  83 3B 00				cmp		dword ptr [ebx],0x00000000
0179  74 1B				je		L$20
017B				L$19:
017B  FF 33				push		dword ptr [ebx]
017D  50				push		eax
017E  E8 00 00 00 00			call		stpcpy
0183  83 C3 04				add		ebx,0x00000004
0186  89 C2				mov		edx,eax
0188  83 C4 08				add		esp,0x00000008
018B  83 3B 00				cmp		dword ptr [ebx],0x00000000
018E  74 06				je		L$20
0190  C6 00 20				mov		byte ptr [eax],0x20
0193  40				inc		eax
0194  EB E5				jmp		L$19
0196				L$20:
0196  C6 00 00				mov		byte ptr [eax],0x00
0199  5D				pop		ebp
019A  5B				pop		ebx
019B  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 014A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

