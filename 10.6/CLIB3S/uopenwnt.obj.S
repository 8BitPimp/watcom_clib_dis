Module: uopenwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001F7 bytes
0000				_uopen:
0000  53				push		ebx
0001  8D 44 24 10			lea		eax,0x10[esp]
0005  83 C0 04				add		eax,0x00000004
0008  8B 40 FC				mov		eax,dword ptr -0x4[eax]
000B  50				push		eax
000C  6A 00				push		0x00000000
000E  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0012  52				push		edx
0013  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0017  53				push		ebx
0018  E8 00 00 00 00			call		_usopen
001D  83 C4 10				add		esp,0x00000010
0020  5B				pop		ebx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				_usopen:
0022  53				push		ebx
0023  56				push		esi
0024  57				push		edi
0025  55				push		ebp
0026  83 EC 0C				sub		esp,0x0000000c
0029  E8 00 00 00 00			call		__NTAtMaxFiles
002E  85 C0				test		eax,eax
0030  74 14				je		L$1
0032  6A 0B				push		0x0000000b
0034  E8 00 00 00 00			call		__set_errno
0039  B8 FF FF FF FF			mov		eax,0xffffffff
003E  83 C4 04				add		esp,0x00000004
0041  E9 A9 01 00 00			jmp		L$20
0046				L$1:
0046  8D 44 24 08			lea		eax,0x8[esp]
004A  50				push		eax
004B  8D 44 24 08			lea		eax,0x8[esp]
004F  8B 74 24 28			mov		esi,dword ptr 0x28[esp]
0053  50				push		eax
0054  83 E6 07				and		esi,0x00000007
0057  56				push		esi
0058  E8 00 00 00 00			call		__GetNTAccessAttr
005D  83 C4 0C				add		esp,0x0000000c
0060  89 E0				mov		eax,esp
0062  50				push		eax
0063  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
0067  52				push		edx
0068  BF 80 00 00 00			mov		edi,0x00000080
006D  E8 00 00 00 00			call		__GetNTShareAttr
0072  8B 0D 00 00 00 00			mov		ecx,dword ptr _WindowsNewWindow
0078  83 C4 08				add		esp,0x00000008
007B  85 C9				test		ecx,ecx
007D  74 3F				je		L$2
007F  68 00 00 00 00			push		offset DGROUP:L$21
0084  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
0088  55				push		ebp
0089  E8 00 00 00 00			call		_ustricmp
008E  83 C4 08				add		esp,0x00000008
0091  85 C0				test		eax,eax
0093  75 29				jne		L$2
0095  E8 00 00 00 00			call		__NTGetFakeHandle
009A  50				push		eax
009B  FF 15 00 00 00 00			call		dword ptr _InitAccessH
00A1  83 C4 04				add		esp,0x00000004
00A4  6A FF				push		0xffffffff
00A6  50				push		eax
00A7  6A 00				push		0x00000000
00A9  BB 00 20 00 00			mov		ebx,0x00002000
00AE  89 C7				mov		edi,eax
00B0  FF 15 00 00 00 00			call		dword ptr _WindowsNewWindow
00B6  83 C4 0C				add		esp,0x0000000c
00B9  E9 DE 00 00 00			jmp		L$12
00BE				L$2:
00BE  8A 64 24 24			mov		ah,byte ptr 0x24[esp]
00C2  F6 C4 20				test		ah,0x20
00C5  74 5C				je		L$7
00C7  8D 44 24 2C			lea		eax,0x2c[esp]
00CB  83 C0 04				add		eax,0x00000004
00CE  8B 40 FC				mov		eax,dword ptr -0x4[eax]
00D1  89 44 24 08			mov		dword ptr 0x8[esp],eax
00D5  A1 00 00 00 00			mov		eax,dword ptr __umaskval
00DA  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00DE  F7 D0				not		eax
00E0  21 C2				and		edx,eax
00E2  89 54 24 08			mov		dword ptr 0x8[esp],edx
00E6  F6 44 24 09 01			test		byte ptr 0x9[esp],0x01
00EB  74 0C				je		L$3
00ED  F6 44 24 08 80			test		byte ptr 0x8[esp],0x80
00F2  75 05				jne		L$3
00F4  BF 01 00 00 00			mov		edi,0x00000001
00F9				L$3:
00F9  F6 44 24 25 04			test		byte ptr 0x25[esp],0x04
00FE  74 09				je		L$4
0100  BB 01 00 00 00			mov		ebx,0x00000001
0105  89 D8				mov		eax,ebx
0107  EB 24				jmp		L$9
0109				L$4:
0109  F6 44 24 24 40			test		byte ptr 0x24[esp],0x40
010E  74 0C				je		L$6
0110  BB 02 00 00 00			mov		ebx,0x00000002
0115				L$5:
0115  B8 05 00 00 00			mov		eax,0x00000005
011A  EB 11				jmp		L$9
011C				L$6:
011C  BB 04 00 00 00			mov		ebx,0x00000004
0121  EB 05				jmp		L$8
0123				L$7:
0123  F6 C4 40				test		ah,0x40
0126  75 ED				jne		L$5
0128				L$8:
0128  B8 03 00 00 00			mov		eax,0x00000003
012D				L$9:
012D  6A 00				push		0x00000000
012F  57				push		edi
0130  50				push		eax
0131  6A 00				push		0x00000000
0133  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0137  51				push		ecx
0138  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
013C  55				push		ebp
013D  8B 44 24 38			mov		eax,dword ptr 0x38[esp]
0141  50				push		eax
0142  E8 00 00 00 00			call		_CreateFileW
0147  83 F8 FF				cmp		eax,0xffffffff
014A  75 30				jne		L$11
014C  F6 44 24 24 20			test		byte ptr 0x24[esp],0x20
0151  74 1A				je		L$10
0153  6A 00				push		0x00000000
0155  57				push		edi
0156  53				push		ebx
0157  6A 00				push		0x00000000
0159  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
015D  52				push		edx
015E  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0162  53				push		ebx
0163  8B 4C 24 38			mov		ecx,dword ptr 0x38[esp]
0167  51				push		ecx
0168  E8 00 00 00 00			call		_CreateFileW
016D				L$10:
016D  83 F8 FF				cmp		eax,0xffffffff
0170  75 0A				jne		L$11
0172  E8 00 00 00 00			call		__set_errno_nt
0177  E9 73 00 00 00			jmp		L$20
017C				L$11:
017C  50				push		eax
017D  FF 15 00 00 00 00			call		dword ptr _InitAccessH
0183  83 C4 04				add		esp,0x00000004
0186  50				push		eax
0187  31 DB				xor		ebx,ebx
0189  89 C7				mov		edi,eax
018B  E8 00 00 00 00			call		isatty
0190  83 C4 04				add		esp,0x00000004
0193  85 C0				test		eax,eax
0195  74 05				je		L$12
0197  BB 00 20 00 00			mov		ebx,0x00002000
019C				L$12:
019C  83 FE 02				cmp		esi,0x00000002
019F  75 05				jne		L$13
01A1  80 CB 03				or		bl,0x03
01A4  EB 11				jmp		L$15
01A6				L$13:
01A6  85 F6				test		esi,esi
01A8  75 05				jne		L$14
01AA  80 CB 01				or		bl,0x01
01AD  EB 08				jmp		L$15
01AF				L$14:
01AF  83 FE 01				cmp		esi,0x00000001
01B2  75 03				jne		L$15
01B4  80 CB 02				or		bl,0x02
01B7				L$15:
01B7  F6 44 24 24 10			test		byte ptr 0x24[esp],0x10
01BC  74 03				je		L$16
01BE  80 CB 80				or		bl,0x80
01C1				L$16:
01C1  89 D8				mov		eax,ebx
01C3  8A 54 24 25			mov		dl,byte ptr 0x25[esp]
01C7  0C 40				or		al,0x40
01C9  F6 C2 03				test		dl,0x03
01CC  74 07				je		L$17
01CE  F6 C2 02				test		dl,0x02
01D1  74 10				je		L$19
01D3  EB 0C				jmp		L$18
01D5				L$17:
01D5  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr _fmode,0x00000200
01DF  75 02				jne		L$19
01E1				L$18:
01E1  89 C3				mov		ebx,eax
01E3				L$19:
01E3  53				push		ebx
01E4  57				push		edi
01E5  E8 00 00 00 00			call		__SetIOMode
01EA  83 C4 08				add		esp,0x00000008
01ED  89 F8				mov		eax,edi
01EF				L$20:
01EF  83 C4 0C				add		esp,0x0000000c
01F2  5D				pop		ebp
01F3  5F				pop		edi
01F4  5E				pop		esi
01F5  5B				pop		ebx
01F6  C3				ret		

Routine Size: 469 bytes,    Routine Base: _TEXT + 0022

No disassembly errors

Segment: CONST DWORD USE32 00000008 bytes
0000				L$21:
0000  63 00 6F 00 6E 00 00 00                         c.o.n...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

